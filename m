Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CFB6E983C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:24:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppW7j-0003jZ-T4; Thu, 20 Apr 2023 11:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppW7h-0003iy-HW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:23:01 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppW7g-0005xM-0P
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:23:01 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8aea2a654so5871041fa.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682004177; x=1684596177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IvSDnip6oAlr5K0Ik63CQ/cIumCCLHVvLu2UzTZiqSU=;
 b=HUM9EUP9EEIC4W6bt+ftz/4coCDwfqi5bbXpA239rIB1ums6UQmCuW1K77gyHWZ4W6
 wYxhi1fjw2vdpv6Fo350qhNBDsz/euc5/RPfQfUJUzgQoVn6uaf6F5gdq9UHN5KLrqCi
 jTnzUyqRSc3z4crlNz+i+g8ZNUzu6TnFfKLFqtQ+BlWtf3YHOc6HPFqb8wBaPJI+1hiy
 19w1b722XcvpLiz1CnPbg1MhoJcvxJ8R3OatWhqtxLuc1HCVkYbct59SWBhYFlWUuA/6
 c+y8GJ/YphgvOr8vCA3K8kRG3k3t8Mnthxbb2UESnIIhQkFG3JhbcupjjCyqWPgtYTSw
 tM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682004177; x=1684596177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvSDnip6oAlr5K0Ik63CQ/cIumCCLHVvLu2UzTZiqSU=;
 b=grXPqMmJ3ITxO8XhdObcaKyGLc3547eN4NUYkX5pqWaM6wl84t/aH0Qy7n8AVi+Wlp
 U2iyKmMa2AzGP8RUiYRzTXiShdJJ41i99hZOe2HGh/jZMDBPGZO9/x8Zc+HS1op1eZGQ
 mLdIkwKz//pb14hiyCCPxiuv2nRvDKaIXzeYWDA1cJbzK0bLXjVYrsV5qZWNWajqE1Pd
 CSbPqnNCKwX0weXZTglxtzASzWXzz8go8CUGOEtr7xZiRowWLZvFg2c1GjjjPW8o6S0G
 i8nmNR2BU3C64HOcl5SkRKr511yp/inQFrjLmsLqZgaNxEeqRpupguQtdYtxW29c/1Tz
 DI3Q==
X-Gm-Message-State: AAQBX9fO+BG5GZuW3VNGVfpgoXazWYWnrA3oevkRUe2yWrDaQOrjUR1v
 UC26UjmeRBQvuKTQ94yVtqyW5PRRrpsjS1MjL6g=
X-Google-Smtp-Source: AKy350aBzw9altVQ/QfBSt04+fXIZo/iXn3Tr+WwGX3tdIKGmyad/IHq8glyg3STvFlh5TNcSP+lVXV4+1QuG6FkQiI=
X-Received: by 2002:ac2:5495:0:b0:4ed:300d:79ab with SMTP id
 t21-20020ac25495000000b004ed300d79abmr516774lfk.7.1682004177213; Thu, 20 Apr
 2023 08:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681732982.git.yin31149@gmail.com>
 <3bd9b7f8a7dc2c9b68679139623308e184a6de85.1681732982.git.yin31149@gmail.com>
 <CAJaqyWeTrx7cPALh_jweh9r0Yi5TU9oqpuvZk-BmtHUyYq1xJg@mail.gmail.com>
 <CAKrof1OoPecP-8A_UXtEeyOsinciuceTuBFm_GLoV-wo1OQLOA@mail.gmail.com>
In-Reply-To: <CAKrof1OoPecP-8A_UXtEeyOsinciuceTuBFm_GLoV-wo1OQLOA@mail.gmail.com>
From: Hawkins Jiawei <yin31149@gmail.com>
Date: Thu, 20 Apr 2023 23:22:42 +0800
Message-ID: <CAKrof1OSxO1Y41T5-OWpncPnBzkQ6PBpSN8SNR_pkZF4ueBnpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdpa: send CVQ state load commands in parallel
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: jasowang@redhat.com, 18801353760@163.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=yin31149@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, 20 Apr 2023 at 19:38, Hawkins Jiawei <yin31149@gmail.com> wrote:
>
> On Thu, 20 Apr 2023 at 01:43, Eugenio Perez Martin <eperezma@redhat.com> =
wrote:
> >
> > On Wed, Apr 19, 2023 at 1:50=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.=
com> wrote:
> > >
> > > +         ++status) {
> > > +        if (*status !=3D VIRTIO_NET_OK) {
> > > +            ++r;
> > > +        }
> > > +    }
> > > +
> > > +    return r;
> >
> > Although the caller is fine with >=3D0, I think we should keep the 0 =
=3D=3D
> > success. The number of commands delivered does not make a lot of sense
> > for the callers, just if the call succeeded or not.
>
> Thanks for the explanation, I will refactor the patch as you suggested.

I still have some questions about the check on device used buffers.

My initial thought was to return the number of commands whose
`in buffer` value is not VIRTIO_NET_OK.

If we are not supposed to return value > 0, what should we return
if some commands' `in buffer` value  is not VIRTIO_NET_OK.

Should we return an error code, such as EINVAL(Invalid argument),
indicating that QEMU can not successfully send all SVQ commands
in the current state. Or should we just do not check the device used buffer=
s,
and return 0 when QEMU finishes polling?

Thanks!

>
> >
> > Thanks!
> >
> > >  }
> > >
> > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > --
> > > 2.25.1
> > >
> >

