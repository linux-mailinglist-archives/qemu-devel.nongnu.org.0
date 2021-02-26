Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB3325A7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 01:03:23 +0100 (CET)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFQbJ-0005nt-JZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 19:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFQZg-0005LD-BA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 19:01:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFQZc-0006ha-JP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 19:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614297694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xw+MRHubROxMElJfE9e+4KrK+Mtqrjib5RsL/mA0a5o=;
 b=Sr5pco+m/RNvznwg7S65APCIoD1CbnnbnWluUDg32HI6o1+rwe74z9JgrZAcqWGae7VR6L
 /dwzKRU4x46nqpGi8Pd1i464S3tms8wnAGFLFZn5zx3RKbo/YzbDGvgPCO/12uQcQ5yXU9
 b+O/zWQiC7LW2yF/GKwXS0vwPri+dA0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-IY7amS6wPkm39c44qjgpwA-1; Thu, 25 Feb 2021 19:01:32 -0500
X-MC-Unique: IY7amS6wPkm39c44qjgpwA-1
Received: by mail-ej1-f72.google.com with SMTP id gb19so3339669ejc.11
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 16:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xw+MRHubROxMElJfE9e+4KrK+Mtqrjib5RsL/mA0a5o=;
 b=iwWtrauJ2OXRfFMd9OQj53noqEgq1VoK+fVWHfvfaqUDGRR1hP3wPYBQpuAl4Q/QZJ
 sV3VYBk7gQfYnW/Oj0fumg1MJYtHSV8ZkScv5JKGHSpp1kNg2EAdJ8TCz3mYqlmNn55U
 oOMqYwQGGnwvGp73W2uF0Gi2Zoy9FMPUNkMS5C1svFXhB9Z1N763vnKnGo6CT1pEbJT4
 UbQpuoUog7gfvLIt5vwPjsiPM9VhMPKdVOpl4nuU+u3EipqrJk9MFmt5pc53WgHbN0cY
 JgCc8eIbtZ+BWoGpOREj/ME6Pa0f6/Yj1z6eb9ke1LAkv2cMVWfoiNeDTqJPwdqQrv3E
 scsA==
X-Gm-Message-State: AOAM530r0Tnk3/bFy4mwlRokVMSM6VJ+s9DamQwC1zQlzuE5EOKx3jt6
 gFIjX8x2MCF2l9xfbge7RjgBNqtKpFe6qJZspEVYsPK6S5H3Ps45k8g+eiEQOvjX+5SD/5nBjR7
 Qop2uAz+cJslBU08=
X-Received: by 2002:a17:906:2a06:: with SMTP id
 j6mr197425eje.164.1614297691642; 
 Thu, 25 Feb 2021 16:01:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxP5jKGusLREBc83iTORtz+rSqRguOZp6i7yk2lZBNoxuJp8iGEe022l282Atj8y35px8y/UQ==
X-Received: by 2002:a17:906:2a06:: with SMTP id
 j6mr197390eje.164.1614297691446; 
 Thu, 25 Feb 2021 16:01:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t5sm2916722ejx.10.2021.02.25.16.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 16:01:30 -0800 (PST)
Subject: Re: [PATCH 1/2] Acceptance Tests: restore downloading of VM images
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210225232122.1254879-1-crosa@redhat.com>
 <20210225232122.1254879-2-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e7370f0-c094-e1b9-50d2-bdc63170404d@redhat.com>
Date: Fri, 26 Feb 2021 01:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225232122.1254879-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 12:21 AM, Cleber Rosa wrote:
> The "get-vm-images" target defined in tests/Makefile.include is a
> prerequisite for "check-acceptance", so that those files get
> downloaded before the Avocado job even starts.
> 
> It looks like on c401c058a1c a TARGETS variable was introduced with a
> different content than it was previously coming from the main
> Makefile.  From that point on, the "get-vm-images" succeed without
> doing anything because there was no matching architecture to download.

Any idea about how to detect such side effects (tests silently
disabled) automatically?


