Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B7439308
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 11:52:30 +0200 (CEST)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meweb-0003XK-AR
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 05:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mewcb-0002cm-CN; Mon, 25 Oct 2021 05:50:27 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mewcU-0001rV-5L; Mon, 25 Oct 2021 05:50:24 -0400
Received: by mail-lj1-x234.google.com with SMTP id s19so8031846ljj.11;
 Mon, 25 Oct 2021 02:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UybGFiXfoS0a2DTZpMVZd4K66u3bxMOSjOrb9nJ296c=;
 b=Pk9FftcBuwenosS4ESmuJdVSaSkYfowe0Ch1nmhfj3PDq//DoWxao9ntCFV1Zz+CL8
 24foDDXnwDDNmNrDwOOBKeaBs2OZoZolO5Q30NmVaqEISu441APx7HsTI9o4cGEA/+2n
 jEFJ0pSXl5OHspzeZTqzSzYCuHVVynbyc0zY2xmRucu0nyvvNzfjqlMl3UhLcRVcro1n
 iELBRaOI1I6KuSKMUWjDTRVUFq1Et9Fx4ajxuUM6IxaMQupNA0E2d7+vgRmFtoNMp5uq
 m8bhBkbeJwDomGsS5KStPxKmcybX6vahiB4RMibmiNDBek0dk2Z6YjQm+lDwLgeqvM0b
 x4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UybGFiXfoS0a2DTZpMVZd4K66u3bxMOSjOrb9nJ296c=;
 b=3amg3VUaVEhACaMKbbiUSI0mi0VF1IiD38g2VC4utWWpN6Qae6y1t2qSX9+D0PtCp2
 yTd/V02yPJJ0VFOOwm7JE+or4R6YCEeh7r8X86RL4aM6EtBSSsJZsC4Ywa9wIsdCJ0Jo
 xcUMiqBc8dwa1+ZvyPcYu9iHYgal+HI9sCliKzydIp8KgbY3W1m1lxQFD9HnPYVdQIaB
 inqzi7hXvPWIXUR+/BeP/Cs3Z73Ec3uktAERrE/bW5JUGfbbnJ/2hX+Xq6fD2CpblBQx
 BY1+zxSU6LExNsETSJF5EeNKtAyZjGU927V+Dg2p++S/HXhKAbbZS/baIgLpS/iGfpeQ
 9AQA==
X-Gm-Message-State: AOAM531oc4Xk+6tTVEHY69FVe4uo3QwdeEsWt0HDBWWaRT6X14XBJCd+
 nh1Q4u7bYb5zVDXZmAmHJIhNdP719mqKLgKhPDM=
X-Google-Smtp-Source: ABdhPJxBEeaTtmYjfCOmc335O5KNqmHAkFXwHCCIu1QgwKaU5izaltHeTCSFjVSqUo6vhz2Pazfkja2m2jLBKKTQykQ=
X-Received: by 2002:a05:651c:1582:: with SMTP id
 h2mr8072136ljq.89.1635155414929; 
 Mon, 25 Oct 2021 02:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
 <YXZ5xOMH1kMfegZ3@redhat.com>
In-Reply-To: <YXZ5xOMH1kMfegZ3@redhat.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Oct 2021 11:50:02 +0200
Message-ID: <CAPi7W82b_4n4gENnOG78wm6nvOvusNOxhiHZDHg72cyCL5zAnQ@mail.gmail.com>
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le lun. 25 oct. 2021 =C3=A0 11:33, Kevin Wolf <kwolf@redhat.com> a =C3=A9cr=
it :
>
> Am 22.10.2021 um 11:52 hat Fabrice Fontaine geschrieben:
> > Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
> > https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea=
73c985c4e9d9bbb
> > and avoid the following build failure on musl:
> >
> > ../block/export/fuse.c: In function 'fuse_fallocate':
> > ../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared=
 (first use in this function)
> >   643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
> >       |                     ^~~~~~~~~~~~~~~~~~~~
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/be24433a429fda681fb6669816013=
2c1c99bc53b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> This patches makes sense to me, but does this mean that commit 50482fda
> was completely untested and the build still failed after the patch?
First iteration of this patch was tested (and applied on buildroot
side): https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01394.html.
Unfortunately, second iteration (which was merged) was not tested:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01440.html.
>
> If so, is at least this one tested and builds successfully now?
Yes, this patch builds fine.
>
> Kevin
>
Fabrice

