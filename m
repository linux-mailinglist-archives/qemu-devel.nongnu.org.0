Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66763E40B7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 09:13:09 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCzTA-0006Vb-FZ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 03:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCzQA-0002rf-Jt
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCzQ9-0005m9-0t
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628492999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGhmPDuDEZosdMMoxkB+oMgcAH20oqeV8yuEesb5f9g=;
 b=IxsNk8qqYzOiBGX3yjZNV2p0h0ZMHBZvh1dih61HWXZmFgL8U+U8TvFWCHIM6XszHEbwo/
 s9Mncakn3kGjF9eihQV1eyelrOqdXq1jBuR0qIe/GgxJd5/odj/ungTZ9virF+OIlCavha
 yvGfqQJKe41M5Dnt5yjDF/pc1z/5ymA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-Iu_-isjIMyia01Ug8vJrmQ-1; Mon, 09 Aug 2021 03:09:59 -0400
X-MC-Unique: Iu_-isjIMyia01Ug8vJrmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f6-20020a05600c1546b029025af999e04dso3733363wmg.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 00:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WGhmPDuDEZosdMMoxkB+oMgcAH20oqeV8yuEesb5f9g=;
 b=XdrG4vL93DS7Q9+j/Kb2A7BAXZqaEj4/Cp7FsNUdNO7dpPbpUnNK9aFQffm3cGV7S9
 NOdg9NIADQPo91OlGku2veDSQ3+Ia80RjURSNRwrMnDmQDunmo7n6EMp8GQgcEuDZbCx
 PQAt/iperxuwrQnM+c9v80r4iLHpFN0L6VxyYVKxwNPYvxSwR9GS/FHsFIUGTPbJNQT9
 pO4vwW6UqiqxdKCqyj1lwf2T4a7+AWuiy6GPxoohQfebKrYxYvxAKGXi7E+leOrjRmWw
 AqcrBWCMa50JYIJgUrAd8ZAbmbc0bdv2mHIOnKegAcjzk4b9dXkg49EuD2o2nI1JBYmp
 JyHw==
X-Gm-Message-State: AOAM533csKsSxm1gp8LYtEnobBNznZEn/2xVetAmErgJc11Jkpg6i/at
 k8SIahwddz9WQbumW2upT+iZvBXFsZeFlVdv28CtZRF9tCzXSIdkwTJpEUhARkr9XrHOBxCddml
 LcX3GrYowhMFSLuujus5//YzTMUKnTRq+fDFo4f6v+YwF11HD36UOcXY/PicYmDQp
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr30349615wmq.82.1628492997468; 
 Mon, 09 Aug 2021 00:09:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx37jA11fIx15roaXpqF4+Bwhg6D4kkaKOoQotcS4fYtNOi2zTSAgO4IcxNgRjMWzPEvRz8fg==
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr30349593wmq.82.1628492997200; 
 Mon, 09 Aug 2021 00:09:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v17sm18570940wrt.87.2021.08.09.00.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 00:09:56 -0700 (PDT)
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org> <YRCi66uJFdfHD7EM@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b14c287a-ce6c-efde-d197-47633eb8fd9a@redhat.com>
Date: Mon, 9 Aug 2021 09:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRCi66uJFdfHD7EM@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 5:37 AM, David Gibson wrote:
> On Fri, Aug 06, 2021 at 08:00:40PM +0200, Cédric Le Goater wrote:
>> It includes support for the POWER10 processor and the QEMU platform.
>>
>> Built from submodule.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Applied to ppc-for-6.2, thanks.

FYI asked description update.

> 
>> ---
>>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
>>  roms/skiboot        |   2 +-
>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
>> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed5b1ddbed017ae8c0a9d0 100644
>> GIT binary patch
>> literal 2528128
>> zcmeEv4SZD9nf|#mfearBV;kF`SO$qY6Qd1^^@hpE1kqj+w86rP2r^+niGqe*T_@&F
>> zW&&eNTH1fGwhIL{s7ayK7I$?^Td~0p7Om}K)h@1z!OscUHCC+&f!zP|oO>skM6~U0
>> zx4T=<<rnU~=i@!^dCq&@^Pcydb0^*<JR;-5i(v>+)FHw#O<Y^oQQa8paIJ`q5_it*

If you don't plan to add inlined comment in the uuencoded binary,
consider stripping it ;)


