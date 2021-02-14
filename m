Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF931B20E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:42:20 +0100 (CET)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMLb-0008G5-Lf
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLus-0007m4-NR
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:14:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLuq-0005x2-Tc
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:14:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id r21so6123754wrr.9
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XIxvwItIBELzFYWM7Y5KpKLFfHFEGbonG7wcMyzKJPA=;
 b=fdfhvHMh3pdH4EB+FsQaQW+9YSu1hLVBrJmvXuArW9lp+zlo+gG8HSbn2dywBW9Vhh
 OPY5Vn6RK9SRn68fGu5I6fQVEpdTx3MnB/X9KIWG5ApPi7KF2513svb/7lEC6MTFjkLk
 ZXNvgNlbebhG1EuqCyXvq1QZA3tv24zZL6i2BOc4R/DnlczcBnovnJFeXGRBIkAQ9ucn
 r1cODtEdHPmWK1y1FPtCmhkJW72Xnu+Ei3QT14EHho5uvp2RZ0AICBlPu8Pq3Rd64OYH
 //Zr/lFx2LQkN/F9AkcxYVD/rNx0EQnCeVoIfJEF/mS7Ho6FoeBmJyQ7WdHg6Phd/mqU
 Xp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XIxvwItIBELzFYWM7Y5KpKLFfHFEGbonG7wcMyzKJPA=;
 b=OZ+gv/zoy8cnxD6xfYhGpPp7hvxH+8C3xAwMDIowfyI/dTF9Ns7ei7XekJWHbBVJ0+
 GhcKhKU1dpMMwd0w3vH8xk7s58uBFNKLuUsPC/9vPOcttzDRrP/OmQevn7bvPPT21Qsl
 BFkLZEvPgD53pq1qVv3G27ELiXWp5xN32j1l1SfTdtHH5BOOrVix45y870j6RkwI3Fu3
 bta7SNdLIGig2rXsSeMGXC3dyT8Hmr0usmKbJl2fMiYcPF+odKh/6BUIsIY+4fWL+MUv
 wZRuzNThu7bs8Q6G979tmeKqDx1HHJv35RGjUg4AXiXKGP5EDYCRyJSRfNfqtaV/o/AX
 7xeg==
X-Gm-Message-State: AOAM530FhINYZHSvsBIvWVYrW/FGybOHTOqarqWs9jTyYc23gvCHGq8i
 +Rr7Urpt5JJwOOmd3uDEUvU=
X-Google-Smtp-Source: ABdhPJys5EX2McA0mrxh/Yw2V4w29fNfPsHNJPNnJGQjcNR2rVY8hHX/IV90uP52DWDDjoN+wyxnJA==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr12399234wrn.374.1613326479080; 
 Sun, 14 Feb 2021 10:14:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o17sm19828325wrm.52.2021.02.14.10.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:14:38 -0800 (PST)
Subject: Re: [PATCH v8 31/35] Hexagon (tests/tcg/hexagon) TCG tests - multiarch
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-32-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d217fd6-e37f-3b03-069a-547152ab1cfc@amsat.org>
Date: Sun, 14 Feb 2021 19:14:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-32-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 6:46 AM, Taylor Simpson wrote:
> Enable multiarch tests for Hexagon
> Modify tests/tcg/configure.sh
> Add reference files to tests/tcg/hexagon
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  tests/tcg/configure.sh            |   4 +-
>  tests/tcg/hexagon/Makefile.target |  30 ++
>  tests/tcg/hexagon/float_convs.ref | 748 +++++++++++++++++++++++++++++++++++++
>  tests/tcg/hexagon/float_madds.ref | 768 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1549 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/hexagon/Makefile.target
>  create mode 100644 tests/tcg/hexagon/float_convs.ref
>  create mode 100644 tests/tcg/hexagon/float_madds.ref

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

