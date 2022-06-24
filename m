Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FF559D0C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:12:25 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kyu-0007M0-Tt
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kvF-0008Tx-Uh
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:08:39 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kvC-0003Gj-GN
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:08:37 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id d5so4987618yba.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=doyF3CznE3WHhuIOpysjGLckYrhWTN0/t+GIx2Z/0OU=;
 b=Kg8EyGGB7Q4Cz5dbp28UFgcZgp5mMBp34cEAbDeGw09bIzOEcdRi2VdMgQf7wkIBye
 RyNgUHFbrNUpJi/DOy9UHlid0a/rjCaT1cmIZhvYvYeEIClE5Km7xoDgDVcVLXq/yH2+
 3hbe1N8vFm2ZS97CM+lTMhFsHPYtAh0EE7yaV4e5W1HZuEMfPq81LYm9Oy2f/mkhmxtF
 tTHUOJJeNLRboVuq+75vuTyvZ+YgtDJYjUNai0ZEae0YcJy4pc2BQjL92xdCMKy/bbGj
 eVbwL0E0YR26+7dpKZYKbW3RBEKH99i6ZRyXZlKaQ0gXhJKVZ4RiperM3nNUmAQ3pKMq
 /avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=doyF3CznE3WHhuIOpysjGLckYrhWTN0/t+GIx2Z/0OU=;
 b=DTBniJmcEPdBHkuR3TzKfzdRHtKffRDmMtVJF6BgrScu2h5Pi/zch24woAAAiNIqrN
 JOEHs7CypoNIuMeansvejxMxpkipXyTYZJ9iJsG75yGJ8AjKJIDtZZxCsPHl+a+Kst5a
 0skvk7e8mEgTL3PHloshbNTIiHVWKhYJ3KgVlGn+TK3pMG0UenKTFxwial9JM0rwT6ki
 soBnxvlEtcVyre0mhJ9gbiHkFSpkrEcWZ8XkOiMHoeO3ZnTgj821oA3g3GE9Pkt4yDzi
 KrpVAXIfIe6VmtpxzHHIUtUC7S+bkgx9zxYVxF8TkQr75irkWGKOOki3UqQ21NNpHMRa
 W3zA==
X-Gm-Message-State: AJIora/ao5kepG1jeul6fuPzR/y3T6FtcdwbWVKxlBuVngWd4lGjk20l
 aCD4kEOShMghosQQ/fEuX7iWOKIY1Rnd2sUT+CanlA==
X-Google-Smtp-Source: AGRyM1u4wyr1aFSVYrMmBo0FE7zok6QL3+2hRZCraVnICYI3ysoync48LSZM3a22qStPCimBCrtAWcVQOICWv84/mEI=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr55345ybg.193.1656083312847; Fri, 24 Jun
 2022 08:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-30-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-30-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:07:55 +0100
Message-ID: <CAFEAcA_GGxjPw3AH+TiLswhPbmCrcaeELS0io6k_5VoKV3Q_GA@mail.gmail.com>
Subject: Re: [PATCH v2 29/54] pckbd: more vmstate_register() from
 i8042_mm_init() to i8042_mmio_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 24 Jun 2022 at 14:43, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Note in this case it is not possible to register a (new) VMStateDescription in
> the DeviceClass without breaking migration compatibility for the MIPS magnum
> machine.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

