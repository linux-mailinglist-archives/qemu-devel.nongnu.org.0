Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1870642A9E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:46:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CjA-0006Bi-Qr; Mon, 05 Dec 2022 09:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Cj4-000686-Qp
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:45:47 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Cj1-00013B-W6
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:45:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id bs21so18943963wrb.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kIhgDFUqs2LWSst0o5O7Vt3k+rosXJCV9ym0CKk6Cag=;
 b=FzQ1CdcEEWp3GNfPLqFRQQpWwyJqvOpG8psO3algP6ilqrdSeGOwfTs9d89Ce3KNsS
 pfljpSHsUfaPUDJIlHVYbNoGvm070RL7P6q6Gnzumtls2GUmkCC2rdOupHwOiB5zclYU
 WLDpJYaPCw68zh9lqhFkKJgWQPuM7jNz4+w52NTgQZ9lxBD9TMfXVCCg98Zw0AL4H0fx
 WeGNGyS/ohECuLHCLNPbJ0WQOKGSzjCk76UeXtvmzJ2S4adycUiXF1izHDLbDgglN5rt
 +z6SzmWiSG95AhEgaF3MJhTmcXJdar7Al0+civ3a14R8GEcINuGWkGgA67rlRWeAinIX
 ey7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIhgDFUqs2LWSst0o5O7Vt3k+rosXJCV9ym0CKk6Cag=;
 b=cpwKzPWQ+TF6eoDU47o32IKyZs9x0DmRxNgk6OzuMoOYC4vrFXuW5y7SHUgh3Bxs2N
 cKX5lziKqD+7etX3ckjYavSkq1HgiI4tFOtEG5SgfgTo2k1QyJutbakqKtGUabefoA3U
 jtlqPXAGd7NwUTPmjKEnhqyV+2jBrisNh95QERZZg4KBYitoBM3ZRTDJiwaPs28Gqgxk
 D7uNqp5N1RrZ8lIH52HE9OSK/foaFHgLVtqukZBV7aaVQFXABB1yY2kaKD6ox7Fv5Gro
 eujqcuVy81fR9Qz9dahcrWX3GH0lxxEYNfDnwQBSx3qyD4KR2nI7U0WvsZP8LXOHYSPo
 fVpA==
X-Gm-Message-State: ANoB5pkzkQE1w8s93Aln2fpCkJMdU+3rnbJ0vslBn/ozINFhO/+X9mYG
 qotVQ3h9vufVLnBxFi3xGu3MeNhh6GHib7m0ElbOcp4I9qE2Gw==
X-Google-Smtp-Source: AA0mqf6+ALMCuxRau5hyN0yYZ7U2l1JILsU381xwEgIPtum0RwJwOppjD8OSbCTizyrJp7juhmGyubIvTrqpQPRSElQ=
X-Received: by 2002:a5d:6206:0:b0:241:e3b8:e1a5 with SMTP id
 y6-20020a5d6206000000b00241e3b8e1a5mr38968496wru.651.1670251538473; Mon, 05
 Dec 2022 06:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-5-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-5-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 14:45:24 +0000
Message-ID: <CAFEAcA84zUhxa+ZTvTV8pcZJ8_Z0_jQf00x-mO7zF3Z8PfGwNQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
> tough they don't have the TTBCR register.
> See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
> AArch32 architecture profile Version:A.c section C1.2.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

