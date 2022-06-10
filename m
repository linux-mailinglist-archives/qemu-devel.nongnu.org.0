Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46101546F22
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 23:16:11 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzlzG-0000RA-Ae
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 17:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzlv2-0005Id-R5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 17:11:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzluv-0003c8-Gh
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 17:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654895499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3TGgtOEL+usDdhp6tepqPlVuRVO29e/ePyhtH4HqoE=;
 b=Kxyscyb8QG3UysmQ4rM0hufFqSOrTd8swUbrSlf7oAGgVB59BTWjHgTYjjSf+vQQJZhMgy
 Ysy6V5K+euLmC9dCETd6mfU4cgMGdwewK+/T9t9UH78SPjTZrVk/J8V/No1Cs48F2z0BhQ
 wiMuZYU6izSsV+O55mau/tLVC7bIS84=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-AUrm5udzOf-Y5FgMgea0hA-1; Fri, 10 Jun 2022 17:11:38 -0400
X-MC-Unique: AUrm5udzOf-Y5FgMgea0hA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso93405wma.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 14:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k3TGgtOEL+usDdhp6tepqPlVuRVO29e/ePyhtH4HqoE=;
 b=7XC/94vTk2ySLTcFY7YWHZLphCDSA7zhQO1GvwjQY7vl7s6xYw791bXUaakrKz+1wX
 sNIgPaAuIG3GAm5jd1+pt7tPeZWuwvzNsK9hOPC7VXye+R1p5eNazmFtFGY930It2eIG
 KfQ1Fd5Xm1BUnzTwRfIIbAQw0mo+LNBCJox7WySBQiMRH5Mq6r3tR8zhF2lcNpeUnhzW
 4b43khNZTIr1ih9HnG5/ZsKZGQx6i8tu+e3i5+WG1x90PUQkk1rIE8OzB0Zokuu3FgpF
 EDL1mS0WwwXIfd/SEDpckB+TJrWBYZT/ubBV5h9UzFcZowLvkJ+5z05i+lDRZpkaddyN
 LZog==
X-Gm-Message-State: AOAM533/8qSCMVyP8tXKoli0AogJOHafiwWl6JFht1ZtCoXGgRtm+m9m
 AKxmTVQf5eJlCUpg/LDqS+5Ub2XaJ+shrJvyEhhcfcF4+lsdBgokeicto3sq5m2NU3sMV9OPZcF
 t2hPvI6PvZz4yjhk=
X-Received: by 2002:a5d:5917:0:b0:210:353b:db0e with SMTP id
 v23-20020a5d5917000000b00210353bdb0emr44736320wrd.469.1654895497441; 
 Fri, 10 Jun 2022 14:11:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxybvFsRPmIakoqomEXaPMOB9wKqA6mOJl7xPZtcVTSSkMujc1VuCcHPC289BBCjyKvhEZrzw==
X-Received: by 2002:a5d:5917:0:b0:210:353b:db0e with SMTP id
 v23-20020a5d5917000000b00210353bdb0emr44736304wrd.469.1654895497113; 
 Fri, 10 Jun 2022 14:11:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 i18-20020a05600c2d9200b0039c235fb6a5sm195877wmg.8.2022.06.10.14.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 14:11:36 -0700 (PDT)
Message-ID: <a0058a1a-4840-5ca8-5403-e4b008367fd3@redhat.com>
Date: Fri, 10 Jun 2022 23:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Ubuntu 18.04 VM tests
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <CAFn=p-biX5Tp6OHLU95ba3W0z33tHWmRE==q-bn=FAf353LZpg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-biX5Tp6OHLU95ba3W0z33tHWmRE==q-bn=FAf353LZpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 10/06/2022 22.41, John Snow wrote:
> Hi Alex:
> 
> The Ubuntu 18.04 image is by now quite old and we could move our
> support forward to Ubuntu 20.04. I have an interest in doing so in
> order to avoid a version of pip that is old enough as to cause
> problems for some Python work I am attempting to do in order to split
> the QMP library fully out of the qemu.git tree.
> 
> However, it looks like Ubuntu 20.04 does not have equivalent i386
> builds, so I can't just do a drop-and-replace. Do we need a
> replacement i386 guest of some sort?
> 
> Looks like Fedora dropped i686 some time ago, debian might be our best bet?

I think so, yes. See also this thread here:

https://lore.kernel.org/qemu-devel/CAAdtpL48v5Un8osCRr8LrsCAx4P3hcx2qb+WKLE6ADZT1QYwuw@mail.gmail.com/

  Thomas



