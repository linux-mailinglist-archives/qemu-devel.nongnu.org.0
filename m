Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E831B2E6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 22:53:25 +0100 (CET)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBPKW-0004CL-4f
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 16:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBPJh-0003lU-Rt
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 16:52:33 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:32821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBPJe-0007KR-Ek
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 16:52:33 -0500
Received: by mail-pl1-x634.google.com with SMTP id d13so2660912plg.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 13:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r2gNAr6FKwUYYAgdhaqxeClhLlm2XQnjAlOWbkTIRyA=;
 b=LbC1/uV2Le7gpOmrOnVzbyT8UxnSh2hA3q//jXaoVK/QA4K47DfPcKb7u2MBITl6OF
 Oo0IsCQy6yqSR7Iq6Srqo7ylK6m4010MRbxWqwDJeI5W/cpTkTjLKaRfiOFb0SbX/IKi
 cYMm07A8XLMr/i0IkFeIl6zdIXH5Zn2U5MtdT8/NUxcJDUdS4NYNTi5yFvJbNe7Rz3SJ
 HY69VskRDSdgkUvUNY+MDMAehlf4Ou35R5sy739WfddruX3rRpiV1OWTp/N8lkcdDUd0
 GESmG6ocUEVVrciEaUGzH6uEPgcXErMrSD6XIsCe2P6S0MguZeSLyVfYfYEcOg0lZfsR
 Qp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r2gNAr6FKwUYYAgdhaqxeClhLlm2XQnjAlOWbkTIRyA=;
 b=oVFm0unLEcob66P1yxTPfHA4dFF+uXa0AKPTcr7YBs43ltZsar94EoXPm7XDFxlFpz
 lPEHtAS0PPYqOBjZxwJkZH6aQZz7hqdj/KCjGp4WLfOm2OhAEf6fcCQuHPPoKT1BMNHW
 JP5QSuKyiAo9niPjrsPWLlXEk9auasnTvrlrU9LHsRwt4AIupPSPUGLEUz774mlqNCYu
 NK6DdnHzE7cjjboyvwnkyiE3w0fYXTeIX9YDS/XEIbQu67FlWXWZXPZP16CYCaIbP4QE
 5kS1CxsfwaH6DAS9w/JFgHOpwOGiWOcUZL2Yzz1Usg1flxfXZTEiLnzwvgcB9gxwkPUX
 EICA==
X-Gm-Message-State: AOAM533vjvRJohnvJJbZ6td62SW9jcWuXdaqHCz3YrjPWfEsIZ1SD6JJ
 uBD0KUufc3fWiWFtiRPmmkWhVg==
X-Google-Smtp-Source: ABdhPJwo87nbmp5VfQ5M0Th6CRBEaPSM/+h1vaCwzhAOijMDNiXb1TmCRxezMFNPLpuCPm1OaDmCJw==
X-Received: by 2002:a17:90a:658a:: with SMTP id
 k10mr12700396pjj.144.1613339548742; 
 Sun, 14 Feb 2021 13:52:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 me5sm13706823pjb.19.2021.02.14.13.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 13:52:28 -0800 (PST)
Subject: Re: [RFC PATCH 00/10] target/hexagon: introduce idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <517570b3-2e0f-3f3e-697b-5fa61754ba7e@linaro.org>
Date: Sun, 14 Feb 2021 13:52:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211215051.2102435-1-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 1:50 PM, Alessandro Di Federico via wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> This patchset introduces the idef-parser for target/hexagon.
> It is based on "[PATCH v8 00/35] Hexagon patch series".
> 
> `idef-parser` is a build-time tool built using flex and bison. Its aim
> is to generate a large part of the tiny code generator frontend for
> Hexagon. The prototype of idef-parser has been presented at KVM Forum
> 2019 ("QEMU-Hexagon: Automatic Translation of the ISA Manual Pseudcode
> to Tiny Code Instructions"):
> 
>     https://www.youtube.com/watch?v=3EpnTYBOXCI
> 
> `target/hexagon/idef-parser/README.rst` provides an overview of the
> parser and its inner working.
> 
> Please consider this an RFC, this is our first large patchset. Feedback
> is more than welcome.

Well, first off, this fails to build with our gitlab CI.

There are several problems, apart from the new bison parse.error option
previously reported:

(1) bison and flex not added to dockerfiles, so the packages are not available
to CI.

(2) idef-parser program not marked with "native: true", so we get an early
meson error about that.

(3) flex = generator() does not specify both output files, so the proper
dependency on idef-parser.yy.h is not present.

(4) idef-parser.yy.h is placed in the wrong directory, because you used
'%option header-file="xyz"' instead of the command-line
'--headerfile=@OUTPUT1@'.  This results in an immediate compilation failure,
because the file isn't found.

(5) There's an odd mismatch in file naming, in which you have
idef-lexer.lex.yy.c but idef-parser.yy.h.  Not a bug, really, but it looks odd
when fixing 3 & 4.

I can provide a patch for these if you like, but they're fairly obvious when
you try it.


r~

