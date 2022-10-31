Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2661375F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUT1-0007ZN-UH; Mon, 31 Oct 2022 09:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opURz-0007G9-CQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:03:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opURw-0006lC-J5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:03:35 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so15864677pji.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTj3OCdOh9GHTQq3zH5hk6i5H6mbJ+iR7eoNOh181ww=;
 b=XfQ3MauK5C4Q7W7LVK+1IxkCwtIjLz7WQB1IO+eU250PjUF0NlFT8cZ/pja43DGPqj
 UEaLDy/ejaca7WT5yyyqghud+3fpvozGOoOkkq+SRebxvHewjLUZoL8uE4A53kE/ODpn
 0KwkzQpIrznhTtFlQ+hajWpqhyu1E086bNnRc8677QrYhgmXHUWUA1nZZYefgcIDBE8y
 DlXR5bvNoBJuLbTyIXjRzsfvyELnL/972R8cUnonAKgglP1rBxj3zlpi6NVe3LJo//Y2
 agiRn/Vx3knTt+tP4yZcamvIpWOTAka7XXwGCuGCraVyXjtqxgymbtscj0F6NV/YETwI
 B+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rTj3OCdOh9GHTQq3zH5hk6i5H6mbJ+iR7eoNOh181ww=;
 b=jCYdelyHJdICKJqmgdGw6fzi6O6WdMjkD39WUF714rRIhhq1ENJ8UjOwaVHmifvNdk
 PN6Uk3ofrd/y1bm3Rk89X6JEeG5Hysy661rkMIZRFCC2yKz8WWFRdHnB9l2w6A1fcsdB
 aIguIwMqm3dE4ZeqwzfdqeEgqgmCbvF4oMk8zuSKCyhPza1XgftlIbgNhKROGRbuZvcZ
 wYCuLwFx6tHt0b92pkhp0MvuKYI8t6CbSJGAPVX8i5M+Jr9VrMguz3gjRCRQpXfcEG+n
 T6PHGoDvX4h/o64mGKR1UH2rSZdvRM0TuogzjcqLtaLAtxETK1DTluQZFVBqlkO4lmY4
 d2uA==
X-Gm-Message-State: ACrzQf3Nh2Km2iQZ7T6W8kgbnge2TbkASXQmH/7T6a8ZLjq//DEz5pD5
 9v1s2anLc+rXPsCW1rN82s5ZZZ323kuAy1Mn4QBeNA==
X-Google-Smtp-Source: AMsMyM7QB6V3d0KPpypcwyxjQGMri5u0GXcwgs7VVMu6On1hK1l2EZZXn/XVnodRVPqC2MF/0p8wr4xyQl+1RWyAS1Q=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr14366795plb.60.1667221408392; Mon, 31
 Oct 2022 06:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
In-Reply-To: <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 13:03:16 +0000
Message-ID: <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 4/10/22 16:54, Peter Maydell wrote:
> > On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>> The MSC is in the address map like most other stuff, and thus there i=
s
> >>> no restriction on whether it can be accessed by other things than CPU=
s
> >>> (DMAing to it would be silly but is perfectly possible).
> >>>
> >>> The intent of the code is "pass this transaction through, but force
> >>> it to be Secure/NonSecure regardless of what it was before". That
> >>> should not involve a change of the requester type.
> >>
> >> Should we assert (or warn) when the requester_type is unspecified?
> >
> > Not in the design of MemTxAttrs that's currently in git, no:
> > in that design it's perfectly fine for something generating
> > memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
> > to meaning a bunch of things including "not secure").
>
> In tz_mpc_handle_block():
>
> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs
> attrs)
> {
>      /* Handle a blocked transaction: raise IRQ, capture info, etc */
>      if (!s->int_stat) {
>
>          s->int_info1 =3D addr;
>          s->int_info2 =3D 0;
>          s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>                                    attrs.requester_id & 0xffff);
>          s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
>                                    ~attrs.secure);
>          s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
>                                    tz_mpc_cfg_ns(s, addr));
>
>
> Should we check whether the requester is MTRT_CPU?

That code is basically assuming that the requester_id is the AMBA AHB
'HMASTER' field (i.e. something hopefully unique to all things that
send out transactions, not necessarily limited only to CPUs), which is a
somewhat bogus assumption given that it isn't currently any such thing...

I'm not sure if/how this patchset plans to model generic "ID of transaction
generator".

-- PMM

