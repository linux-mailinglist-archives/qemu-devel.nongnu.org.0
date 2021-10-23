Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8E43849B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:08:43 +0200 (CEST)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLRh-000485-CB
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meLQP-0003Lh-T5; Sat, 23 Oct 2021 14:07:21 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meLQN-0006TE-OQ; Sat, 23 Oct 2021 14:07:21 -0400
Received: by mail-oo1-f50.google.com with SMTP id
 n15-20020a4ad12f000000b002b6e3e5fd5dso2140662oor.1; 
 Sat, 23 Oct 2021 11:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y79MBYMlfXEliR5dCHWyyCDiH09UgVoa0fZXT7S9kQc=;
 b=ZUDOhXJdhYhz3L0zgEGUMvykgbSdmhcmaKK3+RBV58nJ6xBwUmM1dXaSHWkcGwgl7Q
 Sk9SxD7zqfSggU7IImGTy9snoDf5bqSXk5L1L0zkJ3KLWveB7IbF4vFTInogIDvJR673
 cf6XZvF+uPyzW/KiPD1qsfwJcuddGB1l23rGxeX6bNkC3HQ/89OJpfdDZFnXU86zNGCT
 uaTFdMo8sw1+A3jGKYuyw/rjjB8GiyJsKhxI565BURm2A1kKtMyYhDTKjiYDw0sWN/XO
 7FXikTBDNgfxBd5anfY92/fu2/xuSSt0lHoBfxrKMp5kF+BRGbs0UG0Hc9Cvw/2Rsxg0
 MStg==
X-Gm-Message-State: AOAM530cVUKnRLSGt409fLYKvYiSgu7GM9XICrgRLoIf91tjJTfhy4Sb
 VPdyPHcg3LjXmmIUotrjEiVw+a8YuB/n2csWygk=
X-Google-Smtp-Source: ABdhPJzTS2ihY9WE3Y/2cMppoIn2panIoNEAdqyarBuUL2Sh1EGzBFOHFT+vZORj1++DzOZOy6Z5WmhiZqAcRxRbTC8=
X-Received: by 2002:a4a:b109:: with SMTP id a9mr5329170ooo.73.1635012438340;
 Sat, 23 Oct 2021 11:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211023164329.328137-1-f4bug@amsat.org>
 <875ytnd461.fsf@linaro.org>
In-Reply-To: <875ytnd461.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 23 Oct 2021 20:07:06 +0200
Message-ID: <CAAdtpL7s-fop1Qu+xBc8atjQyjaK=iqVG=58EJ8oBvrGkqRsZA@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: Fix some targets default cross compiler path
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.50;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 23, 2021 at 7:47 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > We do not want a shell command substitution, but a parameter
> > substitution (with assignment). Replace $() -> ${}, otherwise
> > the expanded command return an empty string and the $cross_cc
> > variable is not set.
>
> Queued to testing/next, thanks.

Thanks. FYI now the build-user* jobs run more tests: before ~38min,
after ~41m30s. The difference is small and worth the coverage.

