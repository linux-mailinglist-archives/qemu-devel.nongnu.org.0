Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353853E2B0A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 14:59:39 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBzRp-0004KA-Ps
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBzQY-00035z-V7
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 08:58:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBzQX-0006dO-Iz
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 08:58:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id c16so10953935wrp.13
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=j+D/YUXIsZ2CuJEz57KNj/8t3b8ts76qsetxGas+bC0=;
 b=Lholzp/S+2CU7X2j27DzU3MX9R/wynWFLivEEosQeKuSE4nUp2V7mIdCjjB6u6xNFF
 Ngqbr71OIOOTQJ2QKxf5oPS5wCirOOJRu+EzpUOSKu281Kj6VtCUUPRrCrtM8TZccYAE
 4WncbvV6muFze413w5rQjpSpTHt9Q31Sip+1XJN7aB3vhIUP8Py72CfLcJakgQqgwrRY
 Ntjl1cR5YeJpO6CVlr+4FUdKkG45HyzrQQ9DfRNNv0i5pmMQyPpARY6JJHc/kIAW5hC4
 A/V5Lh3UxGU/c66YU9q146flcyMk7Vy63AdsC9Uo8LrQE4fo+AX8sASo++ha0GidIm91
 tVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=j+D/YUXIsZ2CuJEz57KNj/8t3b8ts76qsetxGas+bC0=;
 b=dfCGsERjJthK41WXmeFv6ApqouwDotfuy/O8d1fgr4swj4g7jndoPAEpilA2ChoAi9
 wrHcQuY4ZOm9mfPHXU0eBHmhqhFoTRVh7bx4mBsoW/IjFY1nbXJPUgLu5jFnRl/1qskn
 XFdLQ5OgwZU+sn2OJkiEUFSded35S2jbcghskT79KAZjCDq4fe5soR3A8KBiNnH7xDcK
 VvgZiCBpEk01XouuxjTycXbDhWZaNb0HCCT2JNJlYmEH0XlQN1csvEuCVToTYpZlOikl
 vA6pyREGqd1m1NrFQzDvL6Rl3EKsR1Y6IdfHBr5CH5b1ldywr+Xtr7VpUdwBfU258U3S
 0MTg==
X-Gm-Message-State: AOAM533JKm0fQgu776G5esnkVInWtnE6igRrAhLY+vSx92JiNNlGmGq4
 ylC6uNn/v+GRU4u5PkDwCM2xgg==
X-Google-Smtp-Source: ABdhPJwmLxS8HOv1kvm0QNTdXkVlTa2etGQjKmFKK8yi+RWbQWhg0XDlNQNNjjnhmgRgLsx58ay3tA==
X-Received: by 2002:a5d:4b12:: with SMTP id v18mr10398834wrq.127.1628254695566; 
 Fri, 06 Aug 2021 05:58:15 -0700 (PDT)
Received: from smtpclient.apple (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id h8sm11899439wmb.35.2021.08.06.05.58.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Aug 2021 05:58:15 -0700 (PDT)
From: Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [RFC PATCH v4 1/4] Add options to config/meson files for custom
 CSR
Message-Id: <775EB0C4-04FF-4D76-8248-D5B16D238B3B@jrtc27.com>
Date: Fri, 6 Aug 2021 13:58:14 +0100
To: bmeng.cn@gmail.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FAKE_REPLY_B=3.695,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ruinland@andestech.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Fri, Aug 6, 2021 at 10:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
> > <ruinland@andestech.com> wrote:
> > >
> > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > >
> > > Adding option `riscv_custom` to configure script, meson.build and
> > > meson_options.txt so as to toggle custom CSR and =
will-be-upstreamed custom
> > > instructions handling logic.
> > >
> > > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > > ---
> > >  configure         | 6 ++++++
> > >  meson.build       | 2 ++
> > >  meson_options.txt | 2 ++
> > >  3 files changed, 10 insertions(+)
> > >
> >
> > This sounds like unnecessary to bring such a config option to the =
meson level.
> >
> > I believe a Kconfig option should just be fine.
>=20
> +Alistair

I don=E2=80=99t see why this is even a config option. If you request a =
vendor=E2=80=99s
CPU you should get any custom CSRs defined for that vendor=E2=80=99s =
CPU. If
you don=E2=80=99t you don=E2=80=99t. This should be purely a run-time =
thing, no?

Jess


