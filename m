Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5637A8A0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:11:46 +0200 (CEST)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT6t-0004j6-9p
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT1n-0004we-NQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT1m-0007aC-3K
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620741984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z38QjSADIV06QCjeuv+SQZt1/EIgOi8nb45MAl0qbqM=;
 b=iVvjJC8CWRziaPXYXSJS08oKLIzvxq8Gl5sIyTqLKc1SychHmKWWlz6491V8ejOj51bB9Z
 87AYGj4Lq1PwHbzvSlXQml4mUKjs208VUHFDHcCoUwidsJ42i3T/G/TUBIO3le8vsoVUfR
 Lkwh5dVIxFyvVK7xNK/NpOJsJnCaL+M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-6nuXaXYJMhiC9vxMJO7rYQ-1; Tue, 11 May 2021 10:06:22 -0400
X-MC-Unique: 6nuXaXYJMhiC9vxMJO7rYQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v10-20020adfc40a0000b029010eb3c9a689so1064671wrf.16
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z38QjSADIV06QCjeuv+SQZt1/EIgOi8nb45MAl0qbqM=;
 b=gduBw7ZzkpW73NUhjjmQcm1dZsR68884s4gDe5i+VgyGZTbajNmV0nXMxR1B+1d2h/
 gQNyjLgHtAe45KiRe6Jeh8y/gHSjG5gjVND1U62gM+psJuDJaIRg8jrP50p5RO/NOv5x
 eXXYAqMs3f0zKXg/uJl7VQ03I5ybH8z626aZrb03cKdRy9+MXCOAEJNGpGlX28oe4NsK
 VoXZVOpbBEYAgxQkbdCA1wySwr5bu/jZveFkKrf/6ypmajOs/YIrH6FNUInHTocBpn15
 kv2ReAHWUGBRg7z2y5BxEBTnepPdpkBRod7TUy64klfDBPxPiDb9mr8vT66uXdGhv+3o
 imiQ==
X-Gm-Message-State: AOAM532l9F5sAiyfgMhgBYiWXBPRPddcQOGYChnQYIGqFJ29SX2RNPcO
 9taEUKPFZ7xro1hz3aDH3UylhRjdQRt0MqryXzzR3+IAjhmho0JdaiIhEjwWNlwN/h6eUB+NlEw
 vHIX8/WbGfVyi32k=
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr32841334wmq.50.1620741981677; 
 Tue, 11 May 2021 07:06:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+vQQ7JLN3BpANkr8r8EqHYvMfZdXnhJUzOSlfO+I40osjALGs96p2ROUu7Iti5d3ZjmrAJA==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr32841012wmq.50.1620741978885; 
 Tue, 11 May 2021 07:06:18 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id z6sm23451227wmf.9.2021.05.11.07.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:06:18 -0700 (PDT)
Subject: Re: [PATCH 05/12] crypto: bump min gcrypt to 1.7.6, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f7254808-466c-4d85-dc0f-13e509d1c2aa@redhat.com>
Date: Tue, 11 May 2021 16:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-6-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gcrypt version and
> assume that HMAC is always supported
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 1.8.5
>       Debian Stretch: 1.7.6
>        Debian Buster: 1.8.4
>   openSUSE Leap 15.2: 1.8.2
>     Ubuntu LTS 18.04: 1.8.1
>     Ubuntu LTS 20.04: 1.8.5
>              FreeBSD: 1.9.2
>            Fedora 33: 1.8.6
>            Fedora 34: 1.9.3
>              OpenBSD: 1.9.3
>       macOS HomeBrew: 1.9.3
> 
> Debian Stretch has the oldest version and so 1.7.6 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>



