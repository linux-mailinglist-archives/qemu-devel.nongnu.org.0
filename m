Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA25F31C905
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:46:21 +0100 (CET)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxs5-0001mW-1f
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBxqb-0000tu-NG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:44:49 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:35012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBxqa-00054x-CN
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:44:49 -0500
Received: by mail-ot1-f52.google.com with SMTP id v3so3436797ota.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=arciYSQ4GZnT0uiKt4NGbb/5Us2j8mrmTr6wcqITSAo=;
 b=KrFWvrPHirIV626kdmiTk9iV9p7pXHZUIzQbMJZLYLmtuvl5iKkURN0pxvSt7Ggj8x
 wEvtPaynk2gW1sFTjvpEphe42K1cXV70zDGmZ1UH/Kosc6FlyimDefUwZ1uC1tLVxGgx
 4ovqWVZWMoKBe3WSMqfwAy/7jVyxTcqxVUiDRpNjTBTP73xi7htXwqEVu2B99BNUf1aJ
 bDb6018FejZYB2h7oLkAvmF5vdMjJYqsPEbwDtINTBl3i/W9bKMVgxg+mh3VCVJmtRZ5
 BHAo/E0+sVp2ubepqB7FI3q8msFaAU3VLTFR0ZysCFEQ0NvRlaoO+QbND3dfdvKFiGVh
 ZUOg==
X-Gm-Message-State: AOAM530i3HwMzD+nBl70St4dgGxzPFp2H1nNJE59ArOLGWeaxKQ7xXAi
 EifBKA4Fxq3wjscgsnDAvgieNnMzrIQ5zybxJFA=
X-Google-Smtp-Source: ABdhPJyGVM/QWFbWboILjvLVS/b5fDI4SAgKdPSBDxlUs7bXTkzkRUlSm1pr8N7U1Glu5r7kveH9hiQJtnNfaBWisEU=
X-Received: by 2002:a9d:69d9:: with SMTP id v25mr14185951oto.126.1613472286728; 
 Tue, 16 Feb 2021 02:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20210216102522.6279-1-alex.bennee@linaro.org>
 <714083ae-0ede-c4f1-5828-6ccc53211e66@amsat.org>
In-Reply-To: <714083ae-0ede-c4f1-5828-6ccc53211e66@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 16 Feb 2021 11:44:35 +0100
Message-ID: <CAAdtpL4pYXYRa0c1baYdgz2L0vWwmcnuvv0yoQ7kEnzwJxEvdQ@mail.gmail.com>
Subject: Re: [PATCH v2] meson.build: expose TCG cross compiler information in
 summary
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.52;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 11:43 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 2/16/21 11:25 AM, Alex Benn=C3=A9e wrote:
> > Blink and you miss the cross TCG compiler stuff so lets display it
> > with the rest of the compiler information.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > ---
> > v2
> >   - use target_dirs/fs.exists() instead of find
> > ---
> >  meson.build            | 18 ++++++++++++++++++
> >  tests/tcg/configure.sh |  8 --------
> >  2 files changed, 18 insertions(+), 8 deletions(-)

> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

and:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

