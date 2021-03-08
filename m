Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC43310E4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:34:35 +0100 (CET)
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGxu-0005MM-Ds
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJGO9-0007Rj-78
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:37 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJGO6-0003ws-Gh
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:36 -0500
Received: by mail-ed1-x535.google.com with SMTP id m9so14858526edd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gSt6SUYr2bac/TT0PvZCBdfdvwXGi6EeQHntGeiNh8w=;
 b=NZTZt09c/l4HK1cKWXKNkb2gKKC/faTZFpUs5wp/qbCsBu4bUwKv6PzkeSuu2HzNJn
 HZHhHQbASb4WYAsdJwKA6zKc2iTwmU2xrjMAhju2gzs9ulxUjhFOazRyWCBS0BtTSKpZ
 99uNNCJG/lY5+v0Xq3SZ18Vw0dlfsJruHmqsSx4cI/w95lXFD6BcKDjQi8LRPB2LtJSs
 dN5nH6Dr8MHbH3IDkL1apjSZtL3rumjoG7EvAJwiOq+sqT1+1/YaI79Xb8/5j4dlbwPq
 SOMHf2gPlHZ/mSLIp39c2KfZtKuG4k8a9MHI8XIWD4IenMLLyByJpAvyzyAAIA7p9Xfp
 GprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gSt6SUYr2bac/TT0PvZCBdfdvwXGi6EeQHntGeiNh8w=;
 b=QFhYtz+XPRdrx6gFcAXnHgAbT3WaItQy/bGJZktWBfw6h+vwba5uUq78ih0DU7LWff
 P+qm2nwkl80llSa3v5rZTGPuQtCV1q9/pCC22JHO/cEt32ZYt6KvzQqiFSDhJJXea3wa
 kAc4VthL0ubEgq0XL8kq4dCNQFNquUNPKvX+L96Sk4tXL79+QR+31oTF4GkEfQUWse7C
 lip2EiwZ/xr02DBTmAlR9NXDQGaniNivGuAbUCxvv8d7bpcOUM02lw5lkr5z3ZUL+LRh
 JaNlLhUhsqmD47UsVrb5jbFhs9qD477fOKas0OgLDWKQSiXto9cIj7m2umYRLGS+ODhi
 AROQ==
X-Gm-Message-State: AOAM530qrhpO68pjjNQVEo5S/HHo6s3ceOuBEVuW164vdFQwFyZE9Pj0
 PHZWpUREia108MNnFvN2vjlNj3cXCh5MTb+E+zp3kYKGv8I=
X-Google-Smtp-Source: ABdhPJwM4bQsQz/yRpvh5PPkDLpbjdpKvqpTZI7hG5F5Rk++Aq++P2YK52dNNbeV/Az4JBLKv4TrS2qxwLuTYaGqhuE=
X-Received: by 2002:a05:6402:2d0:: with SMTP id
 b16mr22515939edx.194.1615211853150; 
 Mon, 08 Mar 2021 05:57:33 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com> <2891210.4AG6acVJ2Y@silver>
 <CAMVc7JXb=eK2FgEx0SV7N-DL65EaMPKHM9rZnHCfu5KTPin48g@mail.gmail.com>
 <134602378.QJW5UkElOJ@silver>
 <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
In-Reply-To: <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 8 Mar 2021 22:57:22 +0900
Message-ID: <CAMVc7JWDCkCXKaj0Cba=OOb73i1Zuwx_WnLpJC6qL+1w1aZwvA@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 22:38 Peter Maydell <peter.may=
dell@linaro.org>:
>
> The online defect viewer is a bit better for showing why it thought
> something was an issue. In this case we have at the top of the function:
>
>     trace_gd_switch(vc->label,
>                     surface ? surface_width(surface)  : 0,
>                     surface ? surface_height(surface) : 0);
>
> which tests whether surface is NULL, implying that sometimes it is.
>
> Then later we have:
>     if (vc->gfx.ds && surface &&
>
> also checking surface for NULL-ness.
>
> Finally we have:
>     if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
>
> which dereferences surface without checking if it's NULL.
>
> So there is definitely a bug here:
> (1) either surface can never be NULL, and all the places where
> the function is testing for NULL-ness are wrong and need to be removed
> (2) or surface can be NULL, and we should check here too
>
> Coverity can't tell us which of the two possibilities is right, of course=
.
>
> thanks
> -- PMM

c821a58ee7 ("ui/console: Pass placeholder surface to display")
intended to eliminate the possibility that surface is NULL, so (1) is
the case. I am preparing a patch to remove NULL checks.

Thanks,
Akihiko Odaki

