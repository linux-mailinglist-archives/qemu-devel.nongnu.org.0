Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD4E4A8291
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:44:00 +0100 (CET)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZap-00041v-Fc
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZWD-00017n-6P
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:39:16 -0500
Received: from [2a00:1450:4864:20::32b] (port=45874
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZWA-0008Pp-8N
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:39:11 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso1489335wms.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=veMf254kgYnEnE8IDbwRT2Hjx5QqL3Zjt/aLqCF1R1s=;
 b=G5pJGv9sQSoQwGdBme/xvtR4oXwkwAyv+5UQwX+ts8sSm6sSZMsuqob8rTP1J3Tm9r
 1IzflKHm4YBUZvH8C69p5GPGgFCbWgmHqZPBGkv22sr6Nq7yWD2w2Lxl+27IH1R8l/5c
 j0Meq+7g6/AI+1pETu7Wbj7JLsxnr2ASEFQEFxZqHPMBpu8HuGDQNihcfPabRKrKmD/1
 BAll95pcUce4PNyZslhiFri/QtcdUtx7iITS4LF2d2FLbbdq2Eq0NhCIWVbk4v3Z1U4w
 Al4pQrXAC8IUR6P1dr+P9fBK/72sZ+rFyjpNCQUPR4E5UpJf8Ur96RKyAd9fkssnPXyg
 TfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=veMf254kgYnEnE8IDbwRT2Hjx5QqL3Zjt/aLqCF1R1s=;
 b=sLaBZQP68PYT8FScvaxaXwWQJ2jIYUxARL7ZXB0eWUlo4sVx4FBm9P/Wy0UbdqexKu
 I/Ciz1kxnMAja+wUtSXMF6UPO0PvagaInRKhi1ty/zDu/YU5BgSZR3nU4DkuetFoJw0v
 ztrz5jqHo36IVOVxBsGtBCVoogOFCiWooO3P6uFmb+C4sm2J6oGqTyhPtqJct6+9UnBW
 mIjvpPv5uB5GZaSG8ykRYteRXRDwiSA3NkDfNe1eABZUktNDrxm+yO0ZfDqC7AoA6GIk
 d6Uob6ikAYWmNxNqL1TTiacEb+bl7cWQJGC8gcboXuiRxK2ZFwBBBzNP9uQVbHY0Vtai
 CeEg==
X-Gm-Message-State: AOAM531eo+y3v/Vek5B0H2KkKcqN0BJgroz0tKi/g6bskBwrXXmr+bPc
 l/sL46IeqrurOw/F/XsTrrQ5zw==
X-Google-Smtp-Source: ABdhPJxwlzdyNDdeTuaeQxU+qRD54MOv2Olu87bHE7Y4kVGndLhPxs3zEF591jSABWrb2dzxWVYDDA==
X-Received: by 2002:a7b:c7cf:: with SMTP id z15mr9860809wmk.105.1643884733489; 
 Thu, 03 Feb 2022 02:38:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w6sm6593585wmi.15.2022.02.03.02.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:38:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 019D81FFB7;
 Thu,  3 Feb 2022 10:38:52 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-17-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/20] tcg/i386: Expand scalar rotate with avx512 insns
Date: Thu, 03 Feb 2022 10:38:36 +0000
In-reply-to: <20211218194250.247633-17-richard.henderson@linaro.org>
Message-ID: <87y22stetg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Expand 32-bit and 64-bit scalar rotate with VPRO[LR]V;
> expand 16-bit scalar rotate with VPSHLDV.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Again couldn't test but looks sane:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

