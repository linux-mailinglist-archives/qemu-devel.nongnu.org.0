Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4947132294A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:10:42 +0100 (CET)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVaT-0008L7-AY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVZB-0007MZ-B4
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:09:22 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVZ7-0005AJ-NO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:09:21 -0500
Received: by mail-ej1-x62c.google.com with SMTP id g5so33971407ejt.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eADvxbXOglYh+IExeRA58qpVi7tKOFI75IARnzGF3BI=;
 b=XBx5BCvdTyS+6BwKy7+itSE8aRDAM3KxHcIC6Y32IjVyNjYoeZu7ndgTMmlDosC/2q
 Abt1qQFG1h28/LX/wxWpolJOqiWVEDY03I3s+ZaK2EnNwBeaHTazL/geIu5A8o9jv/2x
 sFDY9/2Y8G/QeJ9oRAtzF6vY3WzhBZLmfgpY+yJwtJk7cgkTfeTLhucysap3hj2l6GDy
 D8HG4u2E6ZVqEhbnmAWppSL4qzWKf+RTulpbEMWtSaOG3kCBSXWOyTOdCKY1sGLgqGei
 JQqCh9dJHryg1VbO8YEXhiQcZQvkZwzN+qV8xCcp+tMV71nhMRYJhrvMIxHFQPsrVKYP
 WJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eADvxbXOglYh+IExeRA58qpVi7tKOFI75IARnzGF3BI=;
 b=mj7tbBZ5lt9hYa6YHAzhl7isEkedCfzAB2gpHZ19yrgRzMJlZcXc8KGjObixhwSpqr
 f4XtjXLoDAtrISE2wwS25stRdyzwenfXwTtQcBwUBRcpQCWsTL9olI1TDRR62SInAicC
 oqwDP89PPo4IpYrc77301jM0u2pl8QNruqdGnWuaDTiUlu9Xk13Jvnph2pVVzRIARn4M
 /7nqRzcG5pKplKe9iAR04lzqKzRFD/PBluolv1qR1ETp+vp3pfBtntxMlObXAPqOlWLP
 fPKYsv3J1MXLwoMBIhXMTkSLE9xEdogewySIhkJo8WgtP1MayaXISbXQj2mf1n5NjPe9
 gIwg==
X-Gm-Message-State: AOAM531qaIH4XuzcK8mqrqo+WsMkvAf4h0rBwg0s76XSBwoUWkdAgsWf
 bINw1MefEsFc9X+6FjWyUsitVqEG6UCf33ja5HxJFg==
X-Google-Smtp-Source: ABdhPJwyB2A0Wy4Nto/2j8X3M7z/Qy393j+yFSTsyeljzRFa2KGEavzPPk/LKGI3P39Da8bnfKju30nxJD4siwONLzM=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr26162329ejd.250.1614078556227; 
 Tue, 23 Feb 2021 03:09:16 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
 <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
 <20210222154341.0992238d@bahia.lan>
In-Reply-To: <20210222154341.0992238d@bahia.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 11:09:05 +0000
Message-ID: <CAFEAcA8x6GnfaHtfTLtEMiM1Xm9K7dhsMEpFjf2MFYe7T1jF4w@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Greg Kurz <groug@kaod.org>
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 at 14:43, Greg Kurz <groug@kaod.org> wrote:
> My understanding is that users must be "maintainer" to edit other's
> patches. Only three 'maintainers' are currently listed at ozlabs for
> QEMU:
>
> https://patchwork.ozlabs.org/api/1.0/projects/14/
>
> We had a discussion about that a few months back with Christian Schoenebeck
> (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we didn't
> quite know how to go further because of lack of documentation, but I'd be
> glad to experiment the full patchwork experience if someone knows how to
> do it :-)

If people want to try that kind of thing out I'm happy to try
to tweak their permissions on the patchwork instance.

-- PMM

