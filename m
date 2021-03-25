Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E8348D10
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 10:36:51 +0100 (CET)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMQ6-0003uz-Ue
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 05:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPMOq-0003QA-Qu
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:35:32 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPMOk-0006il-3D
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:35:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so764787wmi.3
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wemSCqKf/mdYfjbZ8Nxj0w/p46vav6Lvq3V/q55uuX4=;
 b=VzKPzUZ22OIS3Fq/iEflLAmxIYvgBEl85VhOKMu04WVqk3dM5+21gYrDOwQnbbHwco
 stoJNJHISSLspNEMDzBQNQd/4p0qpRcT6bh8KNv+Bafj1iGdeynxvvAgyVV3fvcrxlB2
 6hQ4TRN35Igma379EXM0BLt6+ZEptMYIBVJhPGmF5OsgN0Yz+sa/XTQVirlIhycYOTYw
 KEw5FdrhF8F0o2IKcOhYp/xBlgktpllL5woUwUq+KMNd1HH3ZiaDYdZtTuLl30kp6KET
 Z5PUbK16ra8khBpgnPSyby2O5ORh1np3nTQ+3eEqaBu2E2e7mK1oAiWlbKLiH6yXmi+3
 JVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wemSCqKf/mdYfjbZ8Nxj0w/p46vav6Lvq3V/q55uuX4=;
 b=lNSTrNJC9JNww0AwMBYY3TvupDnHgtMSVOP69+ff+4ce73bvItKthzMSqQYiwnpXSM
 Jsst/qD5dehXvH6SsYdNPHJ1x3jBGGjfFDDecPJ5+la/8/AymvS36X4O3oQfYqBTVUDt
 I9XFRjJuRU/uE8XCfwhLBDVUwxj5Mgpxp5kWj9YB5PbPoIWTU2r03xFXedOAkgXnHX9e
 WD1cA+cW76au4qrrcmqw1nIqf+6RzAauGiIXAirn1kUMbRQ++B2j66Sp/hGhuAH7SIki
 rO4gkVgc6MF7FyakjXdq6edkqQ+z8/+nluSLBZ5fpFpp/x5Hym7/mJ0n9Y9nITJ5KYrH
 ah8w==
X-Gm-Message-State: AOAM531r8Nj08xcPq1LH6Gxcc4STtBEPpQaEy17GLuyCrStK4xCYMiHK
 nRwhLkPdlNfVvCzRRhJoC78=
X-Google-Smtp-Source: ABdhPJyAs7RhTEQ7fbhv6hoopcw5s+1YwH6c8FchNLT3RtOPNcjQ/MRT7w1z+9LTypoIGojxhXgP8Q==
X-Received: by 2002:a05:600c:2102:: with SMTP id
 u2mr7036589wml.22.1616664922790; 
 Thu, 25 Mar 2021 02:35:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u63sm5849193wmg.24.2021.03.25.02.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 02:35:22 -0700 (PDT)
Subject: Re: [PATCH 05/15] Hexagon (target/hexagon) change variables from int
 to bool when appropriate
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-6-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ffce5e30-3c7d-940d-e66b-75d07861410c@amsat.org>
Date: Thu, 25 Mar 2021 10:35:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-6-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 3/25/21 3:50 AM, Taylor Simpson wrote:
> Address feedback from Richard Henderson <richard.henderson@linaro.org>

If you look at the git history, we use the following tags:
- Reported-by: Richard Henderson <richard.henderson@linaro.org>
- Suggested-by: Richard Henderson <richard.henderson@linaro.org>
and tools know how to use them:
https://repo.or.cz/git-dm.git/blob/5ccc4dac6837:/gitdm#l292
(same comment applies to other patches in your series).

That said,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/cpu_bits.h  |  2 +-
>  target/hexagon/decode.c    | 80 +++++++++++++++++++++++-----------------------
>  target/hexagon/insn.h      | 21 ++++++------
>  target/hexagon/op_helper.c |  8 ++---
>  target/hexagon/translate.c |  6 ++--
>  target/hexagon/translate.h |  2 +-
>  6 files changed, 60 insertions(+), 59 deletions(-)

