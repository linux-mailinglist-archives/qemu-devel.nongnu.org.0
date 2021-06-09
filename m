Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668873A150D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:02:20 +0200 (CEST)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxqc-0006BK-Ph
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fedora.dm0@gmail.com>)
 id 1lqxp1-0005Ql-LT
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:00:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fedora.dm0@gmail.com>)
 id 1lqxp0-0003L1-4Q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:00:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z8so25351391wrp.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/YwGPTbGOb02e+tHbleS36Y97i87ZetHNyC/CCe7eQ=;
 b=AFgLQRA+INW0yU0KaVGjiHVfV7BgL0oVd3KVfBL2BEzJChjW9bO70apQWVbDTTHev6
 GjSfDSkAu63sR6qb+WsyH/y0gvfP8Qx0jztqX/1Gra++3L/z7wDqr0zPDJkZ8Hy6uczJ
 KO55Sl2Kc3VlP6IHztW9wJjFaj7Ej9jEWHDjZkd++f8Xv69Nyqdho1fY0ymc/tvjTQYz
 S5kK8XECd2UEHbY8KpVLL2WeughuvW2047kTj6Qo3lBXaYXeU558g3l88mkVkSZ/LL+F
 qTFRjqQVLeuILLciwEAP/Y4GqfX6glhjDzIetm91d3CXW1UEQFwusumFn8aQj4tC8gW3
 WBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/YwGPTbGOb02e+tHbleS36Y97i87ZetHNyC/CCe7eQ=;
 b=iBTLkFy/f8GQ78O9Tnu9q7k+IPHjpph4HkXJAobcKHjlTkccZ86COwMlwwBsg87N7C
 TC28cLW8B6/kvOmv5g/WrFxknh4ZR7QU0Mrbwab/U4CfvL1fVeq456K86yMR3YWoyM2/
 bb+71jprp9IuJqQoa3NMvIC8SO4+7rFGiJRxNqgasx6omeMhoR2IOLyvetH6zID9+AM9
 +bXjfK0d14/D12/tL//+LAw0rBpu0Jj0FcIB/q8GzSaFPAJ8qvgkusfqnTmHn1DnZtGQ
 8rhXGnay0qWqTIoSbljtFjP6aig+USYXm0+C/YHd3F6iQedm5fNIhsyjEgJHxaar60Tj
 By1g==
X-Gm-Message-State: AOAM530D0Q/OBtM3H/jGN3wfhPgB8UhLUVy4XWUcjPFBuMYyq4MQGEG3
 lJD2LsVZF3A6MMDjm7ud9ZThpoNrH72QSEjjjC8=
X-Google-Smtp-Source: ABdhPJyZU+UNyi2bKfLvcXsyuenA0VvT/qwT43KCBj2t2YuWK8oE/VgXdQU8Q4Ngrb+5v6EbHnR/307uLrr8O5+eVDc=
X-Received: by 2002:adf:a441:: with SMTP id e1mr28092596wra.227.1623243636245; 
 Wed, 09 Jun 2021 06:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <878s3jrzm0.fsf@gmail.com> <YMC38baIdFTL/q+f@redhat.com>
In-Reply-To: <YMC38baIdFTL/q+f@redhat.com>
From: David Michael <fedora.dm0@gmail.com>
Date: Wed, 9 Jun 2021 09:00:25 -0400
Message-ID: <CAEvUa7mknFqrGMbH317ygfujuZv=0EqAWq5v6npHWvtc48F+gQ@mail.gmail.com>
Subject: Re: [PATCH] configure: map x32 to cpu_family x86_64 for meson
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=fedora.dm0@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 8:45 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> On Wed, Jun 09, 2021 at 08:28:39AM -0400, David Michael wrote:
> > The meson.build file defines supported_cpus which does not contain
> > x32, and x32 is not one of meson's stable built-in values:
> > https://mesonbuild.com/Reference-tables.html#cpu-families
> >
> > Signed-off-by: David Michael <fedora.dm0@gmail.com>
> > ---
> >
> > Hi,
> >
> > QEMU fails to build for x32 due to that cpu_family not being defined in
> > supported_cpus.  Can something like this be applied?
> >
> > Alternatively, maybe it could be added to supported_cpus and accepted
> > everywhere that matches x86 in meson.build, but upstream meson does not
> > define a CPU type for x32.
>
> "supported_cpus" serves two distinct purposes in meson.build
>
>  - Identifies whether TCG supports the target
>  - Identifies whether QEMU maintainers consider the target supported
>
> The change proposed below makes x32 be treated the same as x86_64.
>
> Maybe that's right for the question of TCG support, but I'm less
> sure it is right from POV of QEMU maintainers expectations around
> the x32 target status. AFAIK, we don't have any CI for x32 and
> IIUC no maintainers are actively testing it manually, so it ought
> to be in the unsupported category.

Okay, then can something be done to change this line?

https://gitlab.com/qemu-project/qemu/-/blob/master/meson.build#L247

It's what causes the build to fail if it doesn't force the interpreter
due to x32 not being in supported_cpus, but then the following
(unreachable) code expects that x32 is not using the interpreter.

https://gitlab.com/qemu-project/qemu/-/blob/master/meson.build#L263

Thanks.

David

