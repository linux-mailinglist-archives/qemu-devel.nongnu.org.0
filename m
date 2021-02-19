Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5331FD8A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:04:00 +0100 (CET)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9CA-00080A-Dj
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lD97K-0005N4-DD
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:58:59 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lD97H-0001G2-NB
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:58:58 -0500
Received: by mail-pl1-x635.google.com with SMTP id d13so3701527plg.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eUxX3H1cqGMRf6EOshPCminwMBeN5Cs6er9/diQGGas=;
 b=NuZreG03Xndbg0YjprL/k/4jtdRyPrvU5or1TW2rW7lRJts+0BpREtG1PD75TjPzLS
 mLwia8Ll8NnId71RLZ7e+76WTthAV/VRXCpr/LQhFshk4/Ti/RXXcKAjjlKempBXOTis
 BI7PXVt4jaB1/wT9fmpQpDAM2ckT2Erno0KQSUXP1nfYFT6k0mkCEtg7xe/HM9o5JXEB
 sou8p9r4egWAqy8KSaJUuKDB6Wi8m5ol/+GGK/huOJJfgQr5j+OIz6KdEoEUN/738hVC
 yYHzV4m94HtFTnxQHSrPyw0AODy3v2pS3l+l3Q+NuSBDQraNkgdOuFLhcDgSgxpoAxSp
 mwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eUxX3H1cqGMRf6EOshPCminwMBeN5Cs6er9/diQGGas=;
 b=d4Jx5ZXNIJ1UqlQAOALp2WZWhEtbI/FhdkYls5WHoahWlz9+TKCCdJwRRH9MPgRoJs
 gQibPdpGhGmOMc73DFQlfkBGppix9xQLNf8imJEgKs6eq3w0pmyqkbjDe8mfNHMaIFnq
 3ZooPrKmIO9RAsoP7ya+gjosQzn8JeK+9HXV0xVzdoRgwt5+zUuAAT0y2FvctYTgEabb
 TuEUglmeQwJlACD58cMO8Kb9LysiXzKOAjsRkniz2O9jmR8lpOVDJItNa+6hfNeiPZ7w
 sbzuSpgcOHKa2CggZcLmAfVYOQ20W9363208TK7cWJ7xgOGTX1qcT9Ed5KbPTGXemL2D
 xb2A==
X-Gm-Message-State: AOAM530pvB+NgV0fY4HWmsh/VDScaxOZaAhCv3EvplBwbzk7w0/mHAHF
 24u2u2oYvL6MNsOGGv1FuSxTwU5q5q3Hlw==
X-Google-Smtp-Source: ABdhPJzZGdS2zQPVfJPYcghVedq5w++7N1InXz4ZRePuXdqRuy14Ty+dcNVNxCgpPSU1/BM8d4t5Fw==
X-Received: by 2002:a17:902:b206:b029:dc:1f41:962d with SMTP id
 t6-20020a170902b206b02900dc1f41962dmr2830507plr.28.1613753933071; 
 Fri, 19 Feb 2021 08:58:53 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id p9sm8921455pja.51.2021.02.19.08.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 08:58:52 -0800 (PST)
Subject: Re: [PULL v2 00/35] hexagon initial commit
To: Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210218162944.1756160-1-richard.henderson@linaro.org>
 <CAFEAcA_G_d8VF1U=WdBvFmUQCR3YFzQu1WqUqHFQRKsF2q6yeg@mail.gmail.com>
 <BYAPR02MB48863A37EDD68A448C186C50DE849@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <610ba144-7b35-38ea-b838-36ef7d162938@linaro.org>
Date: Fri, 19 Feb 2021 08:58:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48863A37EDD68A448C186C50DE849@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 8:30 AM, Taylor Simpson wrote:
> I requested access to scan.coverity.com.  Once it is granted, I'll take a look.

I took a quick look.  Quite a lot of the errors are related to

> #define fASHIFTL(SRC, SHAMT, REGSTYPE) \
>     (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))

and

> #define fLSHIFTR(SRC, SHAMT, REGSTYPE) \
>     (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))

Coverity does not look beyond the leading comparison to inform the bounds, and
these macros are used with a 32-bit type.  It then warns that the shift could
be out of bounds.

It appears that none of the uses of fASHIFTL can actually overflow the shift count:

  * S2_asl_i has a 5-bit immediate shift count.
  * S2_addasl_rrri has a 3-bit immediate shift count.
  * S2_valign has a 3-bit scaled immediate shift count
    (on a 64-bit type).

So it looks like you could simply drop the tests entirely.
If you really want to keep it, then you should make use of REGSTYPE and bound
based on that.


r~

