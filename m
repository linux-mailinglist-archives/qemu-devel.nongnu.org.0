Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99105418D2C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:59:34 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUe3R-0003js-3z
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe2Q-00034O-S2
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:58:30 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe2P-0002rx-6X
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:58:30 -0400
Received: by mail-qt1-x82d.google.com with SMTP id z7so1523346qto.7
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 16:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XZsAToVwLKEIsL07UMLfknCnI9y2yHCm/N785CLFbXc=;
 b=KtqzJHVlXHFfRlCPPmOf/gk1YAnC3Mocuy9uHpajdBB14gn8NWU115BcISRk5BI4Vr
 zarTKl2KygHAsC3CdCyukvEISRrHObfpAJDknw6pA8qdqWtxCqAc9LjX/A2N0P2H7YN7
 9tyUXH4BNGKlD9cGzUKVvYcb7yWtAive0GX8FY0J6Pu/KrgauOzMp6g81HDBa7r5KP0r
 6MuF0r/2DK947ytrK6Wvnr5u3S6mU/xv4nwC5QExpsKsOQ0MMZclLznuf1lw/oV7n6p7
 cZS9tEfD0LADQfKvyqWL9/JQ/DefjiyzXCVo71p06ZGvTbpXAK8GwxN7+3Es2mpcVj83
 2PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZsAToVwLKEIsL07UMLfknCnI9y2yHCm/N785CLFbXc=;
 b=37lcgqReEqtm1elbK0Yf7YyukRk4REy/oiE9OWNDZcsA0/QB7UQM8GGvu5tlAi2w83
 YSoi78b0xx8uSJlyWVRcneh0RYSm14U7r1zCx45NaYMktv8Is2H2p1AkqccMoRyHkur4
 tL7odklWq1Mx3aTI+DqIBDJUxLKu34qOYLnOiRTej+U6oKd3zS+OO1TS+FqVIz/ySHkV
 0UGr2nM7dV13/z8hSsfn7v56hrAM71uonHh3/K+FpHMnZyVvJmkF22taiMC7DEd2YcjC
 FuzzqerxCp3TqH50sbARDzrhwCY383zc6gLsVWxPgqjLZvb2GtRw9E0yC9PjES/BrsTn
 02BQ==
X-Gm-Message-State: AOAM531sp34zxKHseaVKffWjP2WV7dSh9M7pppvTM5oYXjxFoc+9BRcr
 lgdMoacFXrrux+iN5kmsc4d1VDJyndcBpg==
X-Google-Smtp-Source: ABdhPJz/N6AYyowGozEE50kFH3h+8niW1mnVcnkh09+0Pf/4ByhhAAsJPv74YW/IXyUaCRgGsUa4RA==
X-Received: by 2002:ac8:615a:: with SMTP id d26mr15958283qtm.318.1632700707830; 
 Sun, 26 Sep 2021 16:58:27 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id az6sm11154544qkb.70.2021.09.26.16.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 16:58:27 -0700 (PDT)
Subject: Re: [PATCH v8 04/40] hw/core: Move cpu_common_has_work() to
 cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb64e88f-1a87-6d80-6f82-e4b3098f10e1@linaro.org>
Date: Sun, 26 Sep 2021 19:58:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> cpu_class_init() always register cpu_common_has_work() as
> CPUClass::has_work() handler, so the assertion check in
> cpu_has_work() is pointless.
> Since cpu_common_has_work() simply returns 'false', we can
> inline it in cpu_has_work(), improving the function readability.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/core/cpu-common.c | 6 ------
>   softmmu/cpus.c       | 6 ++++--
>   2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

