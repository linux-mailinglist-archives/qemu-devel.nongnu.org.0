Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2535F0778
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:22:28 +0200 (CEST)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCDz-0008EQ-OO
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3g-00067T-V6
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:11:48 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3e-0003uj-GH
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:11:47 -0400
Received: by mail-qt1-x835.google.com with SMTP id y2so2288435qtv.5
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=raOQZ3KnZEEZ4rjwGZKf41SY+F1g2t7H5ygN0T62SQ8=;
 b=K9fLL9H57rWJcxd/hzDdSjvRuTUqZIWWXaTYKA4yc/xvrYkY0y8Lwk2pUpbZDDncYp
 QAuhZcLidCDO4dT3T2S5dEDahJxMTQRtmpj2XNRFnAzR9O1eViUOH9PJzV15G/Oon8pC
 NdNkHYAaGHBA301tAesRUSMaiGm9d+hbSrFWSdDwCeAQaiuAAoIhPfW9MF+46NK8A+YB
 GJqS3QeA6cN4qCqgUEGawZu5taHiqczfXKm53H7dNOK6HjJXO4heb08mEuogeqdLOURR
 1nPGopjtiVoW3oEoWhEGwBseg5p9lTQSfYyvD/i8a0h80ZrNI4rrflqGIRdrZuVT1Mw0
 a5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=raOQZ3KnZEEZ4rjwGZKf41SY+F1g2t7H5ygN0T62SQ8=;
 b=fQ6BPdP1X+Brz75Dg9DO22dHZtShHDnTdYFaTm+jfaEvnQx9yNbnR48tJrLdez6BWE
 gv3Ly+seE/neDrJkrBGNrR4LMm9+Kl8A7jGg7A8nXIi01TqHWczHUHbUoMUcLN/NxkC4
 LGkhccdSWOE8zyf/zBfQ8N1q/R+bE3L0RTf28zmnqTiRhml5axMkexqI5IxPldVOB1xd
 fdP9T6v5RzUr1wKtGTcyRyddR2QTqFNHHNjotSYvbcWnnvhXHJ4JZAEqyxmr3oxA+HFU
 OqrL0MvmymYeNytx/2PaccvFUbsjhn4vX42CUPJ8x8k/LTl4Hd/Bx00G1qEU/NxtuI4E
 Vglw==
X-Gm-Message-State: ACrzQf1zOWBaDsNJpkHe3Qcl+NG8LId4cBO4eN7RCkqWTOCT+WZ1bRtE
 /16+qJnSv8HG9E+v3DgbaaVaCZAyrN3TwvJYWrc=
X-Google-Smtp-Source: AMsMyM5wG3o3gE4Sd+/w7ZetTuTLfhtgncgTaBY9EJi+y4RKJp/pvjD7qVK8oY48eofuJ6KrzFt1mICKH8YK0DftrhQ=
X-Received: by 2002:a05:622a:92:b0:35d:58bc:4a4a with SMTP id
 o18-20020a05622a009200b0035d58bc4a4amr5936866qtw.391.1664529105672; Fri, 30
 Sep 2022 02:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <20220929232339.372813-6-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-6-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Sep 2022 17:11:33 +0800
Message-ID: <CAEUhbmUY9troieynifO04G_aG0L7E8GhWM739i5NuM0=CD7Vmg@mail.gmail.com>
Subject: Re: [PATCH 6/6] mips: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 7:28 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/mips/boston.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

