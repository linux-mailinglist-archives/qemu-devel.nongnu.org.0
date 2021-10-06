Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B465424586
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:02:18 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBFB-0000qk-6J
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYB9Q-0001Og-SZ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYB9N-0006qP-Go
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633542975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1a97zqpCRLEL1on+OkV5whv6NZ1TtJkecqO8K7C2RQ=;
 b=ZJELcXulJ/YqcZp3MGBwWLpPEno6l8Jq7fPXVQ6H37tUMTq020TBGLZmM7MtD+dLlovY0o
 SDlCXqV1czRQgh1Qk8QJmDmqGGmY82Il/k98pE54wkwq5eu87RbVDGBnYqiT3iZ66ANb0P
 FwCBe9j8H+w7yo7VcQ3MlU4wMn7ofus=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-PxXCRg8vO3-VzfP24YlE5A-1; Wed, 06 Oct 2021 13:56:14 -0400
X-MC-Unique: PxXCRg8vO3-VzfP24YlE5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso2686508wrg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W1a97zqpCRLEL1on+OkV5whv6NZ1TtJkecqO8K7C2RQ=;
 b=oG1fAYV8NvEqTSOG1+dgA2SMBnSludkhymr1LiQ0xmA1S7zKYLqB0L/v06CEE70ZYj
 5gclUwFFkizPGilWrTEC73dkZ4vUl+EihWQRqKQMYc5e44HA3DrhR6G5vM2UqrNfq8ff
 RXEfL7DrRwdkh2HhBV0Xmxkliczu/BmjK8MI2FUF7pLeijY/hYjhRoTzhRTMVQ0OS1DU
 t1DNZNP96QsmMlp757KXBQy59XzFmdII6HAxMy0j6SyiBmVsIl7NZeDmKkemcVLWNfvA
 Imc+L0WoSLcitQZqJNOi6eA2PYHGmHJXXK5DHSfXSWi24CdS3ApIQqcE8uM1NdSci7ON
 to4w==
X-Gm-Message-State: AOAM530wy8UTa4/N1UsbKNZTScix4FsrwRiWOFMdWdghFzwLHMkgyK+e
 x86Y1ZlOfq3EytLnD1wfubuYwrN2fQLmwdXn5/iQujLs4F1Chu26+eOxIFAfKf0hV8YfunSf7ot
 PlN1YSEpvPWU5h1g=
X-Received: by 2002:adf:aa92:: with SMTP id h18mr17888416wrc.372.1633542972294; 
 Wed, 06 Oct 2021 10:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSUrDTXChJz9B2If+5Zh3ukqyULHZBAO0a4U3TX5LESEsgYWvCaGBHEYnJN6uZnBaUcrgWoA==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr17888391wrc.372.1633542972087; 
 Wed, 06 Oct 2021 10:56:12 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a127sm4438283wme.40.2021.10.06.10.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 10:56:11 -0700 (PDT)
Message-ID: <f5a98954-4a10-ced5-c9bd-d71b6bb7006e@redhat.com>
Date: Wed, 6 Oct 2021 19:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 12/12] meson: show library versions in the summary
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
 <20211005164408.288128-13-pbonzini@redhat.com>
 <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
 <658443a3-35ea-67ad-64f5-eb25059a454b@linaro.org>
 <8a067352-a8d5-6afb-6584-79604a0377a5@redhat.com>
 <face0d36-da9d-1ad1-4045-7de3e341f7d0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <face0d36-da9d-1ad1-4045-7de3e341f7d0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 19:16, Paolo Bonzini wrote:
> On 06/10/21 18:55, Philippe Mathieu-Daudé wrote:
>> So something doesn't work, because my system has 0.59.1 and it is used
>> instead of the submodule...
> 
> How do you run "./configure"?  If you passed explicitly
> "--meson=/usr/bin/meson" or something like that, then you're asking for
> the broken version (which works fine except for the summary).

Yes you are right, this build dir had --meson=. Sorry for the noise.

> For example, on CI the various containers have
> 
> alpine   0.59.0 https://gitlab.com/bonzini/qemu/-/jobs/1571377952
> centos   0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377957
> Debian   0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377954
> Fedora   0.59.0 https://gitlab.com/bonzini/qemu/-/jobs/1571377956
> OpenSUSE 0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377958
> Ubuntu   0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377953
> 
> and they are all upgraded to the in-tree 0.59.2 now
> (https://gitlab.com/bonzini/qemu/-/pipelines/382687127).
> 
> Paolo
> 


