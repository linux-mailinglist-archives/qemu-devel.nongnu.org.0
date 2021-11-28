Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0D460789
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 17:31:49 +0100 (CET)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrN5e-0003pf-DP
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 11:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrN45-0002dx-A1
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 11:30:09 -0500
Received: from [2a00:1450:4864:20::435] (port=44859
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrN43-0006r4-Du
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 11:30:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id l16so31214416wrp.11
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tIJ6hqvcjOOAgOZR7b10feFNyLctFJ6i34H9MmOTaVA=;
 b=JWFbte9+qMYx9Q4m44IMn2J1yrgxkLB5i/XxTWp91SzLZ6w1VeRyN18mmPi3wgtiP4
 YxDe7kuHmA8fKwez1G+bocsMsGXaVkoiTvjbXhQ7ub4F9XPIQ5Z5cGh7kWEEwGmZsNvk
 KV/K+oxrcOf+64lhxESGpfNXUgITCQyc52JzwukBprQByny1qs4rDGer5iQCCSmBtVE1
 dY19x7PtrnDOcSaMs+E3t5Z1lKiPfvJnHRZyRLaaFyajbFToxl3FhDb9DMZc27q6XHmF
 JBK1IdKQKZO0RhrwmGkps39knnZ9AfIhfLi8VOiEvULR/Gh/z4VwMANJ4RhvIa7EmMW9
 WnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tIJ6hqvcjOOAgOZR7b10feFNyLctFJ6i34H9MmOTaVA=;
 b=Rz9kXtK8GLsl2OoGL40ELjtz8imH4WhJ7d7hseDcPD3SQUgIRjvsCChpCVkCCqM8pl
 4jL0pCVyBrncEvJjQoQZdDsxXqZbUjRpdhiTeUawtUAd3oRERmDcMwi3ULXkC99xczBY
 0Ge4gXiRI3Jo0NRr73XrWpt/gRkr0ouyxpzrvQUYkRsrigCt/SVlEFEu2IEYcI07bhRc
 rQXieDF1J17zaR4NfDqVPuANPjcbLtUxzvIOgJNuKmaZem0RqWgVN6oAHspeFzfXI0NC
 7smxc4fzsUJruVO9BsFW5D44tr8dZbe78pmdE7HWuOM7kNf1TG64FZgSLTubxyHm9XM5
 cLXQ==
X-Gm-Message-State: AOAM533R2yaYidTY89ROwxdpZ45PBWgkA3royXsbwfKOtBfoWoIjsCHr
 QX1SoZLZGcSUB5qvv1EMkmMCFg==
X-Google-Smtp-Source: ABdhPJz41O6B7+RtBrRlLQMyXglVubdMMO7iM8N2RJWe0JzahC6k9bYUsAkUdptVUKTyLBfCeFefvA==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr27505851wru.239.1638117005020; 
 Sun, 28 Nov 2021 08:30:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 21sm11701738wmj.18.2021.11.28.08.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 08:30:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2492E1FF96;
 Sun, 28 Nov 2021 16:30:03 +0000 (GMT)
References: <20211126163915.1048353-1-peter.maydell@linaro.org>
 <20211126163915.1048353-2-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2? 1/2] hw/intc/arm_gicv3: Add new
 gicv3_intid_is_special() function
Date: Sun, 28 Nov 2021 16:29:58 +0000
In-reply-to: <20211126163915.1048353-2-peter.maydell@linaro.org>
Message-ID: <875yscnsz8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, Shashi Mallela <shashi.mallela@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The GICv3/v4 pseudocode has a function IsSpecial() which returns true
> if passed a "special" interrupt ID number (anything between 1020 and
> 1023 inclusive).  We open-code this condition in a couple of places,
> so abstract it out into a new function gicv3_intid_is_special().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

