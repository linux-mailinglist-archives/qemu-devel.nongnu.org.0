Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF304545E4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:47:41 +0100 (CET)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnJPg-00004s-0d
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mnJMz-0007GS-Au
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:44:53 -0500
Received: from [2607:f8b0:4864:20::42f] (port=42574
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mnJMk-0004NO-8d
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:44:49 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m14so2402711pfc.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 03:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RonrXdQQsrIJPsJr9x9XCSUZN76Hr0fdI4/slkgOLt0=;
 b=cZ/bEg2+6OpyHd8jRcVr1uGkvarpOjqLS+FdT7kj8A6lhYQ9gkv1fB9mGEwkP/D12R
 jxGw+RyTdgbg9M5a5MN1KNMLiID6bO+OCK7fnLcANPPEJM+7HMwmPGx/sXHP+Zi8Bvmf
 Rd83Mf+QUeDpQKFp7tFVlBT0cxh75PddjfhBU+DAxDyhGDAbcwZVjNcW02SuIGgje0EQ
 JxE/5LwccGQWEiogqU5PYtocktk9vxAefEmrUUu2rrwwI7Tsapr/QsAsn7MM2zwUcHOq
 xbr05X5SDtfuIrUNO06NDrQgq1mKKCO4SKksMY0FOoOtdWCRLvOEERt1NGq8MgaFNtQy
 wAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RonrXdQQsrIJPsJr9x9XCSUZN76Hr0fdI4/slkgOLt0=;
 b=n6ncP2tDVn9e9xlK6h39nFIc6AO4huXO9imUTqkdlhFB1qBLor3tbPxDsPo+r25HDv
 bzAWLtMHC2YkSO0Ve5zxK5Nn/g5A/1d4Ste/GUAxaqc60+3l4KRNeuZ+7O2JJ8nmJVeh
 +iE9zGh+59AZSx/+QqZcndO3uzeeTyiCxJ6qmxwb/Tt3AnqAcCDd8PsQTzw5jXf0g9ku
 ISkvoKKFEr73A49yk7B+bk+s4jfZ1ArjVZ6QvjzIynUlize95yxwrsE361Gm5E1KnTKw
 qWgM4nkvRenDNz5VXvWnO4NGAtU/Gk3nCXBlxXruYQ3ZhJbzLT7CPU4lc9l23r/hgEfi
 aGYw==
X-Gm-Message-State: AOAM533d7rkfIsvKgsO1PixgbbF9/jd+o/Xljck7bbcVsORG4+91T5iB
 6zdgZvyFDcSIorKaHdLmLP+Mcw==
X-Google-Smtp-Source: ABdhPJw6/67BBHvFxNiurijBXvIH+fgCu/VdQOu+W8VK+x/allqYOPXZGlRJbsu+pbO6XWaBWTI7HA==
X-Received: by 2002:a63:3ca:: with SMTP id 193mr4807879pgd.290.1637149475395; 
 Wed, 17 Nov 2021 03:44:35 -0800 (PST)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id b9sm12738601pfm.127.2021.11.17.03.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 03:44:34 -0800 (PST)
Message-ID: <a4655a1f-0e7e-970c-dcd3-5b220b43d167@ozlabs.ru>
Date: Wed, 17 Nov 2021 22:43:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
 <cf010ee6-0a8c-c18b-4c3b-3b4761d2ed69@ozlabs.ru>
 <fe6d8599-49d6-779d-cfe9-7f5a7a48cd60@linaro.org>
 <5d500a70-7240-d70b-eb3e-d06c8266e014@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <5d500a70-7240-d70b-eb3e-d06c8266e014@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.009, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/11/2021 19:49, Cédric Le Goater wrote:
> On 11/17/21 09:39, Richard Henderson wrote:
>> On 11/16/21 11:48 PM, Alexey Kardashevskiy wrote:
>>> Yup. I am doing SLOF updates this way for ages after diifs became 
>>> quite huge to make mailman barfing on the size, and the "subsystem" 
>>> in the subj was the way to reduce the noise Peter had to respond to :)
>>>
>>> btw should I be signing those? I am not now.
>>
>> You could if you and Cedric want to do so (is it really Alexey sending 
>> the sub pr and not an impostor with access to the same github 
>> account?), but it will not leave a permanent record in the mainline 
>> history, because the merge object with the signature will be removed 
>> by any rebase.
> 
> 
> Yes. I just noticed that the merge commit is lost :
> 
> 2021-11-09 15:50 +0100 Christophe Lombard                     o 
> [ppc-7.0] {origin/ppc-7.0} pci-host: Allow extended config space access 
> for PowerNV PHB4 model
> 2021-11-16 17:39 +0100 Cédric Le Goater                       M─┐ Merge 
> tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-7.0
> 2021-11-13 14:47 +1100 Alexey Kardashevskiy                   │ o 
> pseries: Update SLOF firmware image
> 2021-11-12 12:28 +0100 Richard Henderson                      M─│─┐ 
> Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into 
> staging
> 2021-11-10 17:25 -0300 Daniel Henrique Barboza                │ o─┘ 
> {origin/ppc-for-upstream} {origin/ppc-next} <pull-ppc-20211112> 
> ppc/mmu_helper.c: do not truncate 'ea
> ...
> 
> After rebase :
> 
> 2021-11-09 15:50 +0100 Christophe Lombard                     o 
> [ppc-7.0] pci-host: Allow extended config space access for PowerNV PHB4 
> model
> 2021-11-13 14:47 +1100 Alexey Kardashevskiy                   o pseries: 
> Update SLOF firmware image
> 2021-11-16 21:07 +0100 Richard Henderson                      o Update 
> version for v6.2.0-rc1 release
> 2021-11-16 18:55 +0100 Richard Henderson                      M─┐ Merge 
> tag 'pull-nbd-2021-11-16' of https://repo.or.cz/qemu/ericb into staging
> ...
> 
> Alexey's commit appears in the list with only his SoB and we loose :
> 
>      Merge tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-7.0
> 
>      * tag 'qemu-slof-20211112' of github.com:aik/qemu:
>        pseries: Update SLOF firmware image
> 
>      Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> which I find interesting to identify where the SLOF blob is coming from.


Well, this is a feature of "git rebase" :) The only reliably treceable 
way I see is storing slof.bin in the SLOF tree.


-- 
Alexey

