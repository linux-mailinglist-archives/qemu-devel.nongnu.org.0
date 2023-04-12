Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BF6DF451
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:54:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZ23-0001qx-Ey; Wed, 12 Apr 2023 07:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmZ1F-0000qr-E2
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:52:13 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmZ19-0004G2-U4
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:52:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94a9bbfe3ecso182061266b.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681300322; x=1683892322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p9w+Fh6RHRhKmmUbadYmyOcQQgxtYPYkf0akgCNbrLQ=;
 b=zxB6QLlCL+Npv/EFDd2bb1P62Bxyri1Bwy0iEpdBKGQpFp0kQxxvst611wFEqGGMUX
 bzNaI2koG/wKLowwFRhuiJh8OnXu0H8DnNF4V1HiwX8q+3P+jy/241DroCVdakJvtqsJ
 AQ2e9aDmwMItS2LL/suXpuHoxBACU/X44rCeMnXVyC6TOR/QCfWaLrNRBa79UzzSMzGy
 0HVjsI7/lt2sxrhX/NmDQa4YsJrldtNCyEIV2CvZPStvChXM9SsXrS2TUlUOdhoSgBlG
 btTMh/VV601avv4XUILzu1ppJIMgbHGkwgo4q6gX43RyORJKphTV2BmLKX+ULyLHbFpM
 ZXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300322; x=1683892322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9w+Fh6RHRhKmmUbadYmyOcQQgxtYPYkf0akgCNbrLQ=;
 b=qPN7BePaEzT9jjlKEgtwuVS6pSyor6h7FbfxTqdqdMgNwGxmHq4yO/40a7r6QgflTa
 KdoeV9FBlMEZ9z/z4p2Hun8/KneQU1tsnBVuVeXMdYsw9IaWEWTTdW/G+9XnUzOC7DY5
 GJhyjWQxTu+mnmrqJqErgvKB26zg1L0QIv9uXAgVuXbWrpm+ZMdtYCUCZx0Xc+FCxtUM
 7h6gOORG+Ns8RgPSEYxJTUVcXoGmopatc9p75t8IkRkuyONXyinbM3UwAFFrnCIQqWeU
 iER8L1UR335UvNIDzXyx4r4g+TitAMDxG3TVyExOPFVfElOcQ5srSwvNKvBO6kOBg98O
 LyUA==
X-Gm-Message-State: AAQBX9fSOl3aiJkIfdcx2xwvr7RLIDaXOKGp4z1H9xD7IlLYQWdlt1Zk
 IaU94SbSZsYe4a0paAaORGGBYr7nwIQayt2F5MdTyVM6QdSDFBAVmxI=
X-Google-Smtp-Source: AKy350YV7X5NICset6nq0dnqwT3+WxVVYLjyckpmcFagmNwutM6wlGSFd4GCXwdb/e/t0xJg4EYXLwAD422zrtoE20o=
X-Received: by 2002:a50:9fe1:0:b0:504:87d8:ac39 with SMTP id
 c88-20020a509fe1000000b0050487d8ac39mr2888655edf.6.1681300322278; Wed, 12 Apr
 2023 04:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230408000118.50854-1-pbartell@amazon.com>
 <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
 <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
 <CAFEAcA8pSvbFwcbstF1q5y3yE8S3R-X4LKgihq-PFY0F02fw7Q@mail.gmail.com>
 <F1E57852-8712-4BB0-95B2-E3853B59F0D2@amazon.com>
In-Reply-To: <F1E57852-8712-4BB0-95B2-E3853B59F0D2@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 12:51:51 +0100
Message-ID: <CAFEAcA_uUj02NSq3i0ANSWMNtp6Hwk5exmU-xfg0dpxLCg0fJw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
To: "Bartell, Paul" <pbartell@amazon.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 11 Apr 2023 at 19:12, Bartell, Paul <pbartell@amazon.com> wrote:
> Bug filed at https://gitlab.com/qemu-project/qemu/-/issues/1590 with binary attached and some additional logs.
>
> Adding the qemu-stable list since semihosting and gdb debugging for all ARMv8M targets is broken in the current stable release (v7.2.1) and previous stable (v7.2.0). v7.1.0 is not affected.

For qemu-stable: if we do another v7.2.x then the commit we should
cherry-pick to fix this is 9094f955 (which unfortunately didn't get
the Cc: stable tag when it was applied).

(Thanks to Paul for tracking down this commit.)

thanks
-- PMM

