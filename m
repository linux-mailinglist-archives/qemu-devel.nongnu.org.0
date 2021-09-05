Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E3400F0C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:19:28 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpFH-0008HJ-PW
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpAJ-0005DZ-P9
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:14:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpAI-0004i3-D5
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:14:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so5177162wrr.9
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OythKpFSjruzX5w8CkAgZyDuzG2BJY2Oj96aUPZRP+Q=;
 b=lj1sD30Wha8i5H136iAqGL7Eh0gQVyzjAYkZs1CEtAY1OOItchZlCiYeZFykgxOxXu
 LybSss7bo6uK3jPi4v7GJ1ODFCQ6SSgPKOTanEiuh+TCXAQ3jfasPTstPcg8v0GXQ1RV
 Yb7PG66lovBBH5a/sAFJrlrMuRdk6M0rZulHazY0gow3YsOJiBR6cQK297ug16bF3JtO
 +3XOaimaQR9JHH2EqVpQ/u/I29Zq7w4wVfx84/D8nGwOOP9/3FuIPF23Bu8vmtHd8kru
 +62ksQ34D56L4IzsK+oxDHOKqltpdmWmV8bnkC/jTOoZFU53dnsYhNyqxa4EpMwYAnJm
 zZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OythKpFSjruzX5w8CkAgZyDuzG2BJY2Oj96aUPZRP+Q=;
 b=DjRCH3oVScIAJs1zUnBv+dFUR5NBrecU/aJwOKZVxwOiPosncTib69q19AiwVGK/p9
 fFw5bmg3AKR82klrCZJyEy6elC+cjtfgYLIvRJOqAQZ+DhnZPlvlujAzhNcqnHhbC0wP
 0A+yfw1RlLVQW2Ag4YkZTeKIuAprpHUg4KxjMZc/ZSVjtCGNdoWvZNt6LhKvwbQNM4mO
 zPwGNdHYaBzTEKTuTNC/32L2V+pVQDROSnrBxUgp4evvzFC/aIiBEN64IjXiD8y8S7/F
 0/d2/uiS+pFoG75tgPPGnysVL/efBMB2wi+0ZBrEgeJiZzZQXqGuhV5qFhJI7EK5JlfS
 8RzA==
X-Gm-Message-State: AOAM531sAN317R4I5eFbm8kOlo8f43pGbALpqewnmiSe3seZUty9ANWB
 OpEVssHXRlQZ/jMkw7TKzTCAIQ==
X-Google-Smtp-Source: ABdhPJwQacwK718mJo+YO+bxnqorVXPzvbZ3+/tZDneH3sRaXqaOgmlrCApSyL9oU16lKbOpMi40yg==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr7888755wru.304.1630836856928; 
 Sun, 05 Sep 2021 03:14:16 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id y23sm4268751wmq.30.2021.09.05.03.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:14:16 -0700 (PDT)
Subject: Re: [PATCH v3 22/43] bsd-user: Include more things in qemu.h
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f79c952f-9909-3047-a791-f24e6d97d8a9@linaro.org>
Date: Sun, 5 Sep 2021 12:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902234729.76141-23-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Include more header files to match bsd-user fork.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

