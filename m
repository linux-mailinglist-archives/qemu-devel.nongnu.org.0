Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851D5FAF82
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:38:33 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiBia-0008B7-J4
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiBaJ-0002XG-9V
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:30:00 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiBaH-0008Pi-PO
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:29:59 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r18so12319147pgr.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F09QxfinLDFUlZvidLnEnu9/L7HXeilBnnaxnqsdJx8=;
 b=GmW21DGUMMZTSklqsFZGmvxdqGcaK4Fp6q+zvA1e3jV7MTGV22w0OpvRqVNyv3HGlA
 iBEhAxxeWt2Uvj00JE9oqz7r/nPyrtmHKpn3tyuA9SDgILIgvtlDjUJR4hDE5rUCfWGk
 zdG1nIhbH0w2fMgiTveIF1wp74+cDJj58ZLKpE1NEh/Ayx4qCL9kXG+W5kzugMtp9C5Z
 V9lTVe8zmznd6V7inXVBqw26/vSyHrDDaaqWg9NwigV/J4DxoR9upV/ReeSOoxUj3KnK
 UfYWjr6c/DU8UZQLCcTPv/bSkK0K9tNfN1+lBhOmoPOVzBm+wFUmnU5g8tiqTSxMoMfR
 hl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F09QxfinLDFUlZvidLnEnu9/L7HXeilBnnaxnqsdJx8=;
 b=YPca7Elkwv4kYjjyrR4ebnK+n8nz8ydEuxGj4Gwp43aPSmoCRC3mHw8ZNHs/KPI8tz
 fLitwIiZzQckeBXamTZ/YGot5cK2tIu3Sti9c+pwmBm+2eliFTtYjETSwcJGHXzGWdOi
 GVIjmjAfgQAlyTrEjktOZHde5FrJ3cnuiiy87oELiugi4nxQbGlc98/UpN0QDgOS9iqj
 CyGNcDDmtQhRNHbD1CtrHZWdDab+Q5bUyYKddSnhe97KdKNOvAQEu+F0sSfJ2HgbJH2E
 Z92dj0iFP/aAPhf9Fla5tFyng78OMwvsKjPfIsrusbFVUDeBhKk1Ear+Nh72L8JXL/PW
 xFXw==
X-Gm-Message-State: ACrzQf2v3YMKf6B3rBkUi4rC5nguJiq0Vck2EUKWsWIR2LxmMlG2KcLX
 BT8J7j8qHJNTIACnl4UVj/GREI8NJTHNbN7sOniK1ioYrGk=
X-Google-Smtp-Source: AMsMyM7mbbL7NO7PRIcmajFqgCs0kuHv4QmAbjEyAbR6X4n25mmiLzS9xelw4XREwCqhf9dyj/wGh2DR1p27VnJ9Eto=
X-Received: by 2002:a05:6a00:1828:b0:563:24ea:5728 with SMTP id
 y40-20020a056a00182800b0056324ea5728mr13741936pfa.3.1665480596403; Tue, 11
 Oct 2022 02:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221002103707.909560-1-Jason@zx2c4.com>
 <20221003110221.971024-1-Jason@zx2c4.com>
 <ebeb90c7-8f46-4af0-073d-6f1710d3eeb2@vivier.eu>
In-Reply-To: <ebeb90c7-8f46-4af0-073d-6f1710d3eeb2@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2022 10:29:45 +0100
Message-ID: <CAFEAcA-0Uz_nT6V5_7Mkqrg17sX-syrxfyBjZQFUjU5UnPdPcg@mail.gmail.com>
Subject: Re: [PATCH v3] m68k: write bootinfo as rom section and re-randomize
 on reboot
To: Laurent Vivier <laurent@vivier.eu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Oct 2022 at 09:41, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 03/10/2022 =C3=A0 13:02, Jason A. Donenfeld a =C3=A9crit :
> > Rather than poking directly into RAM, add the bootinfo block as a prope=
r
> > ROM, so that it's restored when rebooting the system. This way, if the
> > guest corrupts any of the bootinfo items, but then tries to reboot,
> > it'll still be restored back to normal as expected.
> >
> > Then, since the RNG seed needs to be fresh on each boot, regenerate the
> > RNG seed in the ROM when reseting the CPU.
>
> As it's needed to be refreshed, I think it would better not to use a ROM =
and to regenerate all the
> bootinfo data on the reset.

I quite liked the use of a rom blob in this patch -- it gets rid
of a lot of direct stl_phys() calls (which is a semi-deprecated
API because it ignores the possibility of failure).

-- PMM

