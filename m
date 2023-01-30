Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB1A681AB2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMa0y-0006ux-QP; Mon, 30 Jan 2023 14:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMZMi-0005ci-7k; Mon, 30 Jan 2023 13:58:52 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMZMg-00013P-9K; Mon, 30 Jan 2023 13:58:51 -0500
Received: by mail-ed1-x535.google.com with SMTP id q19so2024209edd.2;
 Mon, 30 Jan 2023 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn1cVFRAggaRZ/aeO1ttvhn5h1BJKrV5IqARzl3JIGM=;
 b=fk3iIo5VrhwFitKsL+IpLMwat5C9AjW5SHCaP8o+EI9wbGqgf8Kp+++yX7nSGwbCK3
 +eYBLOKH/xDTfJpUYcQqJXI4rq/awtAW+w+NEluXxzEcuCmIEpKkkzOpfAva87sDNkFL
 cDic6bJbD/q5b75X9LUB8PBrFk3Oci5WlW5e/dt4jA+LBS5wjO7syiQT6A6+8SXVnJlu
 wi45nuhnBtnh6olIPRl5pZfIUnxTcqNG0ZR5RqsJV5HsjqJrYg4m0mWlTajgVRA3HxYo
 rLZJXI049mex/FNE+SaYioCn5744+DMPlo/Sg8zCzkxzUjJKLHVKx5ov+fbWs9dulXXN
 BLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn1cVFRAggaRZ/aeO1ttvhn5h1BJKrV5IqARzl3JIGM=;
 b=tyfykXpEWCSiuJUXA/nllN34y3AEEkMfbk3xMvANa3WA7g1t6I0xVi9K2SjPqVYnd0
 mnS3ehL2w6+eDioxvI7QQ+AImoF/WiFcLKfvAXRcKtSoLXJ49sqLCX5eFizehgxBYP6+
 g+3ScMd74p+KMSRAg6/8L8MUcQprFzJdGwF7dbv0as+aE38t7ZzODRF/2qmtCT2sPDgn
 RmxEOgv9phEmZpr7HkOJ9r7W6qquuxaS1XVT8vA4O4Hz2FK24tU+RJ4NPVzIxHSlJdL2
 Mh+989/kPLy4DGtTVFpCKMr4OqpxDLpsptaz4Z58TPxZVe+23s5oZ5oG0WU9pxEiOfzb
 770A==
X-Gm-Message-State: AFqh2kq2a6Szd8CNi9bHcw5+Qx7pzALfrbupfN9KGMrr6scj2kqz90bm
 2wMFXm8Dqz2o/wHkyBEVzbz9u52Gu57ZOiSrCts=
X-Google-Smtp-Source: AMrXdXuKQNQhPsIK0NCRU7JIy5nd6emulp2DZEdeGneZFnzsMNc8Bp7QXjdXPYEo/lN3kpILTNN7bbXnz/WydppFLsY=
X-Received: by 2002:aa7:cc99:0:b0:499:cfee:8d96 with SMTP id
 p25-20020aa7cc99000000b00499cfee8d96mr9200544edt.21.1675105127903; Mon, 30
 Jan 2023 10:58:47 -0800 (PST)
MIME-Version: 1.0
References: <167510125533.6740.18222174398575558338-1@git.sr.ht>
 <664ef653-0026-999c-8c68-587c0442df04@vivier.eu>
In-Reply-To: <664ef653-0026-999c-8c68-587c0442df04@vivier.eu>
From: =?UTF-8?B?0JLQu9Cw0LQg0JzQsNC+?= <vlaomao@gmail.com>
Date: Mon, 30 Jan 2023 21:58:34 +0300
Message-ID: <CALUgVpeq8aDQ=ESy8g+=O+RRjAPaho7_usL+mFh6n6RWc_vS0g@mail.gmail.com>
Subject: Re: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=vlaomao@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:40:26 -0500
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

Signed-off-by: Vlao Mao <vlaomao@gmail.com>

=D0=BF=D0=BD, 30 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 21:12, Laurent Viv=
ier <laurent@vivier.eu>:
>
> Le 30/01/2023 =C3=A0 18:28, ~vlaomao a =C3=A9crit :
> > From: VlaoMao <vlaomao@gmail.com>
> >
> > Changing the address with a subsequent reboot makes this address perman=
ent until the vm is turned off
>
> Missing Signed-off-by.
>
> See https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>
> > ---
> >   hw/net/vmxnet3.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> > index 04159c822..695ca2f92 100644
> > --- a/hw/net/vmxnet3.c
> > +++ b/hw/net/vmxnet3.c
> > @@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
> >       s->drv_shmem =3D 0;
> >       s->tx_sop =3D true;
> >       s->skip_current_tx_pkt =3D false;
> > +
> > +    vmxnet3_reset_mac(s);
> >   }
> >
> >   static void vmxnet3_update_rx_mode(VMXNET3State *s)
>
>

