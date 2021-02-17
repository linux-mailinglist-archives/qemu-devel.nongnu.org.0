Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E790331DB59
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 15:24:13 +0100 (CET)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCNkS-0002E2-Hb
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 09:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCNjQ-0001SC-Ld
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:23:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCNjP-00024t-0J
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:23:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id m1so3797609wml.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=plvUUYKHLgrnG31aiKRW0ZEtk/sCkpcVs0X/V0BUt9Q=;
 b=pGv3ri26hqolUbq4sjMgz61zUsRZf63pwyW2ENqHnL/karD19cTfxeQNUaIgNRtGyn
 IgOj1nuCqb4r4YQ8aOG4gJMI/S7Lrd8eXtR3zSJjXCe8ZyqwvTaycc3YrNIyV4ESh+b8
 rOTHUxjeKiLisSfVyPdN21N2wp1W0oy6AQSWC285hpCzRpkL9/md+D0C1whdfdXuT3pP
 tyZ2ALRBmR7ItGIs3aA4ZSd2wMrvW9FbwaRKgus/FgWsq3y52DEgVLNzxcVEQPwkw0QO
 SjCEDqCCAhUKE6bLrx+ZvvUZu6k47TAR+XeBQ21Grm4f9mkuxlZHY5ew9xFRAw27Y2a9
 4iIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=plvUUYKHLgrnG31aiKRW0ZEtk/sCkpcVs0X/V0BUt9Q=;
 b=QFOggSMb8bs7JQMoZpxBvaXiP8jEdqToYWYM5CR9tKsM+jPRnSdfMIKQ6WxpoTbbdd
 KP4QyQKo9/8RaJkCDbKxOC+9CD+R6I5MgpPY6/MGHuVJprefSVi6QFhfmBgpc0MpbTJj
 4BuH1YkVMctMttaC/75bK85UDnxO2buc3caDrbEFBf0pUAXGVNJdPjFhFogrLGMDUpXc
 Eq3SE08lSGXlXw3qqCA5VtwiXZGtk56HtzoYFCzM7gggoEOWKg45MITxc3uIFp3ZDGTK
 3eLwVGqusmF2ReHybnnMzgOvwAKTJ36W9faoc0KWNmve6njILefU4Cf28AxRT/j67aUy
 xx3g==
X-Gm-Message-State: AOAM53208QrQEsNRmPrKgKSDvXCHKmjVYMVRtbmyMZpaygVOhaIsN2+n
 mmn1zuyQEfs2mJLt/OMRBho=
X-Google-Smtp-Source: ABdhPJzy1sMQwfxLpRhF96x6MHfahWAyG/rszgZEakXj2Ylo48xPRMVRK6K3zmNqqT4/7eeyUIf9iQ==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr2036024wmd.130.1613571785107; 
 Wed, 17 Feb 2021 06:23:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm4142483wrr.29.2021.02.17.06.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 06:23:04 -0800 (PST)
Subject: Re: [PATCH v8 00/35] Hexagon patch series
To: Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
 <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
 <CAFEAcA-5XGrmJ2DrJZtH0Tq8ic=V6Te7o-KJZ_K26Yzk4X79vQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ba13b1e6-6689-fc3a-dd0d-2f2ff835c813@amsat.org>
Date: Wed, 17 Feb 2021 15:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5XGrmJ2DrJZtH0Tq8ic=V6Te7o-KJZ_K26Yzk4X79vQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 10:17 PM, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 20:59, Taylor Simpson <tsimpson@quicinc.com> wrote:
>>> -----Original Message-----
>>> From: Richard Henderson <richard.henderson@linaro.org>
>>> I've completed review of this round, and there are some nits.  But they're
>>> minor enough that I wouldn't even mind them being addressed via the
>>> normal
>>> development process.  I.e. I'd be keen to not look through that diffstat again.
>>>  ;-)
> 
>>> Any objections from anyone else on that?

I'm very pleased with how this series evolved over the time,
and Taylor interaction with the community during the long
review process.

Patches 1-34 are OK but I don't think patch 35 (Dockerfile hexagon)
should enter mainstream that way. It probably makes sense to add
it along with the CI testing job (missing so far).

Patch 30 (Linux user emulation) could have an Acked-by from Laurent.

Also, while having TCG unit tests is great, it doesn't replace
integration tests using real world binaries. So personally I'd
like to be able to test an Hexagon BusyBox, ideally one coming
from the official Hexagon distribution (extracted from the SDK).
We talked about this and Brian will probably share it.

Whole series tested it on x86, so:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
(I still plan to test it on big-endian host)

>>> I don't suppose you and Peter Maydell signed gpg keys when we all met in
>>> Lyon?
>>
>> Nope.  Peter, please advise
> 
> We effectively are operating a TOFU policy for gpg keys,
> ie put them on a public keyserver, to the extent that you can arrange
> to get them signed by other people who also have gpg keys please do,
> and at some point we may be able to meet up and get a shorter
> trust path.
> 
> For this patchset, I would prefer it if Richard collected the patches
> and sent me a pullrequest. First pullrequests from new submaintainers
> are higher-effort for me, because I need to look them through carefully
> to be sure that they're the right format and so on; so I'd rather
> not do that with an enormous patchset. It's easier for me if that
> work is postponed and done with something smaller later.

Ahah I just suggested to Taylor to look at your previous explanation
before reading the same explanation here :)
https://www.mail-archive.com/qemu-devel@nongnu.org/msg765788.html

Regards,

Phil.

