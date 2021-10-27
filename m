Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2343C0FF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 05:49:51 +0200 (CEST)
Received: from localhost ([::1]:41514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfZwj-0005jl-SL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 23:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfZvV-00053G-Df
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 23:48:33 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfZvT-0004qR-NM
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 23:48:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id d10so1741481wrb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 20:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mC0pHf8fBVA2lPsPhjUjU/Hi4r9anLf+a+p5ln/Tw2w=;
 b=h5xDEaSLNBssoJExVCUiWkGHTzIiMNHuhLRoiunsTk4LTmrOCKusldgGdJ8X/YEUoj
 2/IUeoqq0+kmhqUkYufiPhZ49Tmxqcld3DIUHb/BeSKMYUQrRhey1ytoUYLayc2MIVY7
 g0zCudsso/2rwlpY+1q7Gx4wZqh+0scmCQdsXmMP8qhgDaBw5rWYeJAo4+lvwW9EgbL7
 WlAuR4h7SjWZg77V9XeXtpRHYGjv2T4qi66pIkg24q40EoFoS++dg/g0DHPcDCzgDLBf
 R+fP93YMUnjr8tYzDiXifafy31DdSG1rQinL4IuDkBko97cKTot8bWQi4T5JqktHGZW0
 vNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mC0pHf8fBVA2lPsPhjUjU/Hi4r9anLf+a+p5ln/Tw2w=;
 b=teXx29NhqwUBgSWA0NvRNov1RzASvLDrrVyiT43SRHPdhCRYV4Jb/HmEiU39NEUX1k
 qy4tAO07T3xQJfZioRbR16flgNCjtBAxGEruhr+zW9xz+DJUlV8GK83tquWP9RKqrasS
 l4MebtX0BcAaZwr/ZouieizN0bfoaij1juXWfxHtajvfSmS0WrwIFK/gFNd4Wn+GBBbX
 scrZ5hY8j9Cz+4xnuG50a40vcWBlvW2Ov2ARFMo9giEmfPUTAY0sjQCREPQJEWoCSJy8
 9vJRIu/eKW01ohVNik/ljgtpNCBHqmcdTknAR+BKnezPWoSYMe2hNXkE+CgPi4esbpoE
 gnVg==
X-Gm-Message-State: AOAM533VvgeJiSKwLsFaXV2N88KTauHieQST2AuZzY5sM6l4qIs0PKKt
 P4x+OSWEnd34V46k9A2nZ5Q=
X-Google-Smtp-Source: ABdhPJxZxdkilKG5Y4oSubGvX43bJfvmE/7ERmdB6/1TNj4dvCmpo2EhqFFAv50gE6OdT+I+7oqs1g==
X-Received: by 2002:adf:f252:: with SMTP id b18mr37385894wrp.292.1635306509586; 
 Tue, 26 Oct 2021 20:48:29 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j9sm2275501wms.39.2021.10.26.20.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 20:48:21 -0700 (PDT)
Message-ID: <2e0f0533-5f1a-7822-91b6-795c34ee90c9@amsat.org>
Date: Wed, 27 Oct 2021 05:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] MAINTAINERS: Agree to maintain nanoMIPS TCG frontend
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-5-f4bug@amsat.org>
 <82956a55-18f3-c220-ced9-0eb0e76a30ae@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <82956a55-18f3-c220-ced9-0eb0e76a30ae@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 22:08, Jiaxun Yang wrote:
> 在 2021/10/4 10:25, Philippe Mathieu-Daudé 写道:
>> As of this commit, the nanoMIPS toolchains haven't been merged
>> in mainstream projects. However MediaTek provides a toolchain:
>> https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01
>>
>>
>> Since I now have spent more time with the ISA, I agree to maintain
>> it along with the other MIPS ISA.
>>
>> For historical notes, see commit a60442eb8 ("Deprecate nanoMIPS ISA").
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Probably it's worthy to ask MTK folks if they are willing to maintain QEMU?

Well it is not like I am hiding this patch, it is posted on a public
mailing list...

>> ---
>>   MAINTAINERS | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f1d7279a0f2..8ce47417eff 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -237,14 +237,10 @@ R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>>   S: Odd Fixes
>>   F: target/mips/
>>   F: disas/mips.c
>> +X: disas/nanomips.*
>>   F: docs/system/cpu-models-mips.rst.inc
>>   F: tests/tcg/mips/
>>   -MIPS TCG CPUs (nanoMIPS ISA)
>> -S: Orphan
>> -F: disas/nanomips.*
>> -F: target/mips/tcg/*nanomips*
>> -
>>   NiosII TCG CPUs
>>   M: Chris Wulff <crwulff@gmail.com>
>>   M: Marek Vasut <marex@denx.de>
> 
> 

