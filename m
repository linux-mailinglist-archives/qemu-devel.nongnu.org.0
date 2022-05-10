Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B89521203
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:18:49 +0200 (CEST)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMx6-0006jY-4I
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noMeL-0004er-2a
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:59:27 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:39273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noMeJ-0005y3-9n
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:59:24 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f83983782fso173685367b3.6
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bMMIEnx/U5V3xG0XbWD7wOedYIYWrttOZH3xe8FDcxo=;
 b=nbt2RIJBNWOOz3+Z2K6j5wW68mv0va8+zMbZEs7ASA0Y+kx3ODJwi45oyYnLB1zQW7
 MsPeUxjkBlGxjyjBET82cMP/jxV7u6SDywa6mhbQRMdv0cOdwsQTxpG8Ipc3FNvDQ+Dx
 6TZDUZj1nUfQB9e4cNTi3H5MnxYwbaAzdJqiBNSH9CMJFWySh9gIV9MeDzdEZ9OQ4Ng9
 xzc8dJzGzj9sxczkFgJwWFgo5d+AoOTpPFNEGLOxs0jkVPUMZmjekhZCRn28OQTaS7jp
 jTzohXsetCl0H1sNtMlkuffOkAaWm1N19XOj3+98SLty44HYtqZDVIIUdbt27lM5Aihz
 Qq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bMMIEnx/U5V3xG0XbWD7wOedYIYWrttOZH3xe8FDcxo=;
 b=TxJSZrmy9qRKK2Ch+n5wUCeW+AyN/prR3YLtsTMWxjRVV/wo5JkkW7qdF+o0JGc53G
 eB8hLoV+ZUKYOo4ZPD3AFSf24zOWzMfDySYaZ4DtAci8ib9hHaAAbZXo3nqBTLXk1E1z
 ULs8Ig4pTslNXqJT02WhKDVEnjoIMsptdjyn7BcbqjjMn45pnHGsVdNPBux4yTV4XUs0
 vWwE5C4d83LkNfMGNKVBpSKra2VMqk5e1/V0MD78rPI/nU4JuKng0CNtgkW7ghS1Quq5
 6wcIF2KUfCTXIPeRl32d3Hn7d4WKVB0jBIjR6dAsubsP0uM747DXK9PgWnF7iWZM/+Pl
 SIvQ==
X-Gm-Message-State: AOAM531YZrn0beB1Yd5T2K3Z//3N5AmLByyJ+sO/pjB4oK4O70nh/wL5
 Io+oDc/mEKtS87ao1yafK0id0gDC5viZCHLPKGVWcvu/Luc+Ew==
X-Google-Smtp-Source: ABdhPJzYPLVabBhkp4+qdDmx2juPjuIKQqWFP5Ig175d7zB2olSRx/gXMurtQrpbSBPjSUJavyKZNRJiMeNqlpDHlzQ=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr18476118ywd.10.1652176761796; Tue, 10
 May 2022 02:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
 <7988B475-EEC0-4574-B0E2-BB61738B8964@web.de>
 <CAFEAcA-Dy=nY9SCtxv0omYCQqDqGq6Qwvja4c6f_9rPR8L-KCA@mail.gmail.com>
 <C07CCAE4-1679-4D7C-A472-57B9939D5DE0@web.de>
In-Reply-To: <C07CCAE4-1679-4D7C-A472-57B9939D5DE0@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2022 10:59:10 +0100
Message-ID: <CAFEAcA-VUHMy9i_GH8d++3s29578OgNcu_3AVdc86f+DtH+bUg@mail.gmail.com>
Subject: Re: Possible bug in Aarch64 single-stepping [PATCH]
To: Chris Howard <cvz185@web.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 8 May 2022 at 20:27, Chris Howard <cvz185@web.de> wrote:
> Thanks for the explanation. What with this being =E2=80=9Cpretty easy=E2=
=80=9D I=E2=80=99m attempting my first ever patch!  :-)

Thanks for having a go at this. You've got the right basic
idea, but the process details of how to submit a patch aren't
quite right. We document all that stuff here:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html
It's a pretty long document, but we've tried to put the important
stuff at the top. The really important bit is that patches must
have a "Signed-off-by:" line, which is how you say "I wrote
this code and it's OK for it to go into QEMU"; I can fix up
most of the other minor stuff at my end but without that we
can't take the patch at all.

It's also best to send patches as new threads, not as replies
to existing ones: the tooling (and some humans) assumes that.

> This is a context diff with respect to the cloned git repository (Version=
 7.0.50)

Unified diffs are much easier to read than context ones.
(If you create a proper git commit then "git show" and
"git format-patch" and so on ought to default to unified.)

> *** qemu/target/arm/helper.c    2022-05-08 20:41:48.000000000 +0200
> --- qemu-patch/target/arm/helper.c      2022-05-08 20:55:25.000000000 +02=
00
> ***************
> *** 6551,6559 ****
>           define_one_arm_cp_reg(cpu, &dbgdidr);
>       }
>
> !     /* Note that all these register fields hold "number of Xs minus 1".=
 */
> !     brps =3D arm_num_brps(cpu);
> !     wrps =3D arm_num_wrps(cpu);
>       ctx_cmps =3D arm_num_ctx_cmps(cpu);
>
>       assert(ctx_cmps <=3D brps);
> --- 6551,6559 ----
>           define_one_arm_cp_reg(cpu, &dbgdidr);
>       }
>
> !     /* Note that all these reg fields (in ID_AA64DFR0_EL1) hold "number=
 of Xs minus 1". */
> !     brps =3D arm_num_brps(cpu);                 /* returns actual numbe=
r of breakpoints */
> !     wrps =3D arm_num_wrps(cpu);                 /* returns actual numbe=
r of watchpoints */
>       ctx_cmps =3D arm_num_ctx_cmps(cpu);
>
>       assert(ctx_cmps <=3D brps);

I agree that the comment here is wrong, but this is an unrelated
change. We prefer to put separate changes in separate patches,
even if they're in close areas of the code.
I would just delete the existing comment line (as a separate patch)
-- it's clear enough that arm_num_brps() returns the number of
breakpoints, so we don't need to add extra comments saying so.
(The old comment is an accidental leftover from before we defined
those functions, when the code used to in-line extract values from
the ID register fields. The definitions of arm_num_brps() etc in
internals.h, where the ID-register reading now happens, already
have comments remarking about the fields being "num bps - 1".)

> ***************
> *** 6565,6578 ****

The rest of the change looks OK, assuming I'm reading the
context-diff correctly.

thanks
-- PMM

