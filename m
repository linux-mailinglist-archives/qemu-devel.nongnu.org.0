Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1531DDFC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:13:31 +0100 (CET)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQOI-0002ff-1G
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCQGq-0005KC-AJ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:05:53 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCQGi-0008Tg-9l
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:05:47 -0500
Received: by mail-pl1-x632.google.com with SMTP id k22so7729323pll.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T1eDBnMrCnlaicb9zgc1VY7eiOvwsMgDYtsa5L4orwY=;
 b=fNDTIxaJy2gxU3z7Ch7Q88mS41GoCSvGm37sRRaLUXg8JeVRY91niOb6hMp2wfOY+C
 Asuf7rSJBfqVUSEOkOGY/uiBSHq0wiKwzQ/T+XP2O4sJifJuH+J17FYPwKD+cK4CKCn6
 hCJH2JeXzMrFvprRMg7CnBcZwnjLrHpWxTCOZietKIWaC8gT1LxSbqMZAOQwyLnD02GH
 /oM5PWPfdjNGgwHTpwNO5Uh5jpsOgRn2Y7rhrueKRi0LimbqSfKqmFEoVbNp0B6gH8T0
 M6NDVo4/w4RPtehfOG0bvc5P/1p08VRI+w6nrNJqh5OV/s7AI70OcLaXWekjpFqH0TGf
 hoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T1eDBnMrCnlaicb9zgc1VY7eiOvwsMgDYtsa5L4orwY=;
 b=UGFs02yL8Fav2BTDfaOXBk5leWpv89C3qp+k6Cf9lBPod3dC/f6dvDzo+RfD/16RoX
 MO2B49ZlncZj94iZPofFZ46CDQLPLHfl4oML7nLVjv839a12jLSlAWqAER0BERBtaGde
 GBuY7bPul7JnNQU5rAHWIDx4KdYVN2nI+3KNXk/iKGwA8baNfFTo37Q9xwTPCBCcpFMP
 MvpyFNFEuh1Qwa2Yj0yC791Bhhbkg+hO+xRZY5oXih065HVfzpABuVDMgbqINm/e33im
 p3N4ZpVfWvk4u74z8F/wuFtz0SyhjhEBU3HZ7Jb7f2FpRPlVarTFNPcvxGdf2zNRX3Ik
 5ROA==
X-Gm-Message-State: AOAM531rE4bvUooCdJ0cL36HEOZqV9R7QEVRzLeDi8ANzlkRkhH8xWOm
 1ZAZ/Q9MBWA1u4qAEPwF7oSLnA==
X-Google-Smtp-Source: ABdhPJyzoRV6GBxJWNN5mmbeDJdOCgl37MRnoFzyQvPHAjZjsX4oj5qUKacWnQz8EHrCmLp0HKdhUA==
X-Received: by 2002:a17:90a:5d8a:: with SMTP id
 t10mr9822861pji.144.1613581538429; 
 Wed, 17 Feb 2021 09:05:38 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id q24sm2869714pfs.213.2021.02.17.09.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 09:05:37 -0800 (PST)
Subject: Re: [PATCH v8 00/35] Hexagon patch series
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
 <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
 <CAFEAcA-5XGrmJ2DrJZtH0Tq8ic=V6Te7o-KJZ_K26Yzk4X79vQ@mail.gmail.com>
 <ba13b1e6-6689-fc3a-dd0d-2f2ff835c813@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <547cfc57-9412-b9e9-293d-06232085210b@linaro.org>
Date: Wed, 17 Feb 2021 09:05:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ba13b1e6-6689-fc3a-dd0d-2f2ff835c813@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 6:23 AM, Philippe Mathieu-Daudé wrote:
> I'm very pleased with how this series evolved over the time,
> and Taylor interaction with the community during the long
> review process.
> 
> Patches 1-34 are OK but I don't think patch 35 (Dockerfile hexagon)
> should enter mainstream that way. It probably makes sense to add
> it along with the CI testing job (missing so far).

Ok, I'll drop 35 from the initial pull,

> Patch 30 (Linux user emulation) could have an Acked-by from Laurent.

and wait a couple of days more for this.  But without, I'll send the PR on the
weekend.

> Whole series tested it on x86, so:
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> (I still plan to test it on big-endian host)

Thanks.


r~

