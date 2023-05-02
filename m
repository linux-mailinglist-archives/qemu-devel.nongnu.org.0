Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C03B6F418C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:26:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnCz-0001hf-AR; Tue, 02 May 2023 06:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnCk-0001Zr-01
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:25:54 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnCe-0004ot-JR
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:25:53 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so4309447a12.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023144; x=1685615144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/klol4QyrvvNYDBJIEPwaAk4DlWI6hoWLAWM4Qd4maU=;
 b=MfCJIJFvGBiX9Iid2k6i8PM5gGYZklApd6LzfVNdNdZByZ3Gyf/ZpHt28+IZ/Df8Vr
 ydSgwspik7lM9EtZ1le2pFK63vFLnbZouCjF9XBQ/Wu64yOiD78+F0itgH7N24AwfwEX
 lMc2ueV4kKm2RvC+aYCCQ9H+orzpL/O3zVxHL4HkDVNfg/PYo672o34OugjtQQEPp/Q0
 aIgdwlyi4yBF7IQ8ealDTrtyWdpyZ0Db7PniMdqkUM9W2X13UHVdcwOIA3/hiLunncdo
 MjH0GcPyiZhCrfwx5i3bFBJc2Xq02oyw7gI9KPSiDz19QPDgwWENJfz8XwhnEWzrEdMd
 CdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023144; x=1685615144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/klol4QyrvvNYDBJIEPwaAk4DlWI6hoWLAWM4Qd4maU=;
 b=CD5xGnEREP3g/dtFy9GPC1fF+Y53zuCPJ6wmzlQlZX7XGY+bH0bsn+nb+cwtdzEVpo
 ivGQyJZnAb2MMveB9fzj/QIZ0DDVR4/kro5M5NZIbVbtL3HkXjOzJ+r274nWNL3ne70S
 n9ZkVN47cnoilH/ucD7Zj0dddT9lGnE+j4EyHUhAuIq99saocvaf7XmKk5fNfwj6eqT2
 HN7c94LDaXPpR6Nj38PargPl2Rtuvh7gqq9+KlZpO+vxLVkl/X1PTR1XohUQbNSUdsyt
 M0qQA4+5OrdNdgeHJcsk4EZM1aV1Ex6uHRSKLhqPlVhI2728WAoRd5/ojo3i1in4u+Ry
 ukvw==
X-Gm-Message-State: AC+VfDwAWNXzjGZGZMiWtTU5stpZsXS8CLkalRpnfMbUbWoWeR0bpyM3
 3B1gcBA8y6SF4KbglQGRM3Naikwvgk/vseick9Jhag==
X-Google-Smtp-Source: ACHHUZ66BtGUWhSZfJLNS4XEjTiBA9LgLriy4nsqdlHU7U99WQ28XrQHp/SQxfQR2wTQgDnsIygRWrg2cA8xfDrV0w0=
X-Received: by 2002:aa7:cc88:0:b0:508:3f08:ea0f with SMTP id
 p8-20020aa7cc88000000b005083f08ea0fmr8768210edt.28.1683023144444; Tue, 02 May
 2023 03:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230424151919.1333299-1-peter.maydell@linaro.org>
 <a38b1bbd-1c46-3ea6-d7c1-f77e414bb6bf@redhat.com>
In-Reply-To: <a38b1bbd-1c46-3ea6-d7c1-f77e414bb6bf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:25:33 +0100
Message-ID: <CAFEAcA_Py1CA0Fijs5BEc5pbYGbm98ijonDYO8015zRyFYk0pA@mail.gmail.com>
Subject: Re: [PATCH] hw/net/msf2-emac: Don't modify descriptor in-place in
 emac_store_desc()
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Apr 2023 at 17:27, Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/04/2023 17.19, Peter Maydell wrote:
> > The msf2-emac ethernet controller has functions emac_load_desc() and
> > emac_store_desc() which read and write the in-memory descriptor
> > blocks and handle conversion between guest and host endianness.
> >
> > As currently written, emac_store_desc() does the endianness
> > conversion in-place; this means that it effectively consumes the
> > input EmacDesc struct, because on a big-endian host the fields will
> > be overwritten with the little-endian versions of their values.
> > Unfortunately, in all the callsites the code continues to access
> > fields in the EmacDesc struct after it has called emac_store_desc()
> > -- specifically, it looks at the d.next field.
> >
> > The effect of this is that on a big-endian host networking doesn't
> > work because the address of the next descriptor is corrupted.
> >
> > We could fix this by making the callsite avoid using the struct; but
> > it's more robust to have emac_store_desc() leave its input alone.
> >
> > (emac_load_desc() also does an in-place conversion, but here this is
> > fine, because the function is supposed to be initializing the
> > struct.)
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This is one of a number of issues that prevent 'make check-avocado'
> > working for arm targets on a big-endian host...
> >
> >   hw/net/msf2-emac.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> > index 7ccd3e51427..34c1f768db0 100644
> > --- a/hw/net/msf2-emac.c
> > +++ b/hw/net/msf2-emac.c
> > @@ -120,12 +120,16 @@ static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
> >
> >   static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
>
> You could likely also add a "const" to "EmacDesc *d" now.

Yep; applied to target-arm.next with that change added.

-- PMM

