Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1686663F0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 20:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFh1x-0003eY-ML; Wed, 11 Jan 2023 14:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFh1v-0003Yl-FY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:44:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFh1t-0005mA-40
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673466296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfbASerzqnKTPTK+LSIQ9/xayXG66qyTMU3jd2Kx4b4=;
 b=UdPQsUJQM3u1j04xVVnHdlEonOR0WY2BQlWdU2i/AL1KpHEkAuCJ7Y4xAfTSRCpUCyVa5C
 7u3517W/Wz3jInXQ7Se3+sKu1djrFrPxdGl6C9BfoCa5kFL8kM0eD9CfigZtcebr/c6yCg
 kj7RCkJX2jwa0PciRfTTgjWmYOTil4M=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-wCIqPTcYONu2jMKDLAq7wQ-1; Wed, 11 Jan 2023 14:44:54 -0500
X-MC-Unique: wCIqPTcYONu2jMKDLAq7wQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 e28-20020a05651c039c00b0028112f8e550so4304121ljp.23
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 11:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfbASerzqnKTPTK+LSIQ9/xayXG66qyTMU3jd2Kx4b4=;
 b=cNfo+qZItnFaN+jDeG0ubse7ckUyF7sxPDO7ppq3k4D6ZiumSKb4K4uA3j7C9E8liF
 i+42TIJj6Umx9buuiSGSwv/VX4Rf+kQkjaDpNVmwUTvPxCDq1xAWzPd+qmX7sLwizogQ
 R+dNa24EinSr0jpXLKf/o7ica3pGFInC8VKAqS39csMAqgjSzaCK20Uu54y0WDgvrvYk
 cOfE5pC4LHw+RNTkNUoP2QKM/84mUpCwV0iro+6wF7l6qFzHvmvErf78ZAz6Epia6FOo
 blO7OJ7/yUqscQtTXLEOy858IzfkbOnHgwXD0vYL4oZf2jPFh1pFDaZHYd9XLJrmtjme
 1HRQ==
X-Gm-Message-State: AFqh2korl+YII4ucC+yo/hg8yIO+pGNEQk44AQIKcRfe/KCJgkrLnCtR
 kIdZ+2C2+NRlgwU48pF/nkDofMp5utozDHZLf5MHptEA/aONv50T4yPcYq9TQmdpxQRo0tJLePR
 BqJ/4QtKmlkweTDMIli3XDEj+UflXHBw=
X-Received: by 2002:a19:f018:0:b0:4cc:8e53:e698 with SMTP id
 p24-20020a19f018000000b004cc8e53e698mr433667lfc.280.1673466293390; 
 Wed, 11 Jan 2023 11:44:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXttdGtQ8W3Fqtv8SeoT3XVGQyg/4Kl2Kt+kLD3eqaXD6NGDSo5bfVvekxHEqk5YCVK3s98OOeZLVXILnMJ8IfU=
X-Received: by 2002:a19:f018:0:b0:4cc:8e53:e698 with SMTP id
 p24-20020a19f018000000b004cc8e53e698mr433660lfc.280.1673466293128; Wed, 11
 Jan 2023 11:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
 <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
 <CAFn=p-b-hXVGZJruWa7zY+-pXiqMCEN17FTSpHGNHWPPKMik2A@mail.gmail.com>
 <CAJ+F1CLrTb_UWwubr38v=2dEbVkJCF4RYKKDLRax=rhGyoiU0A@mail.gmail.com>
 <CAFn=p-apVFU3XMK8ZWKbE8eYrXtWhV-VmQX1Y_rXETX7emOzDw@mail.gmail.com>
In-Reply-To: <CAFn=p-apVFU3XMK8ZWKbE8eYrXtWhV-VmQX1Y_rXETX7emOzDw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 11 Jan 2023 14:44:41 -0500
Message-ID: <CAFn=p-bwYO2JBu4pGs0jiXWv1NN20tbogi7EFtiRekv4P=EMhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 12:45 PM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Jan 10, 2023 at 2:05 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi John
> >
> > On Tue, Jan 10, 2023 at 1:06 AM John Snow <jsnow@redhat.com> wrote:
> > >
> > > On Mon, Jul 25, 2022 at 7:23 AM Marc-Andr=C3=A9 Lureau
> > > <marcandre.lureau@gmail.com> wrote:
> > > >
> > > > Hi
> > > >
> > > > On Fri, Jul 1, 2022 at 2:51 AM John Snow <jsnow@redhat.com> wrote:
> > > >>
> > > >> On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrot=
e:
> > > >> >
> > > >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >> >
> > > >> > Hi,
> > > >> >
> > > >> > As reported earlier by Richard Henderson ("virgl avocado hang" t=
hread), avocado
> > > >> > tests may hang when QEMU exits before the QMP connection is esta=
blished.
> > > >> >
> > > >> > v2:
> > > >> >  - use a socketpair() for QMP (instead of async concurrent code =
from v1) as
> > > >> >    suggested by Daniel Berrange.
> > > >> >  - should not regress (hopefully)
> > > >> >
> > > >> > Marc-Andr=C3=A9 Lureau (3):
> > > >> >   python/qmp/protocol: add open_with_socket()
> > > >> >   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
> > > >> >   python/qemu/machine: use socketpair() for QMP by default
> > > >> >
> > > >> >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> > > >> >  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
> > > >> >  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
> > > >> >  3 files changed, 51 insertions(+), 16 deletions(-)
> > > >> >
> > > >> > --
> > > >> > 2.37.0.rc0
> > > >> >
> > > >>
> > > >> For anything that touches python/qemu/qmp/*, may I please ask that=
 you
> > > >> submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?
> > > >>
> > > >
> > > > Ok
> > > >
> > > >>
> > > >> (I'll review them in the meantime on-list just in the interest of
> > > >> moving things along.)
> > > >
> > > >
> > > > I was waiting for a review before updating the patches / moving to =
python-qemu-qmp.
> > > >
> > >
> > > Fair enough - can I kindly ask you to resend, though? My apologies an=
d
> > > Happy New Year!
> >
> > I am confused, what's the relation between QEMU python/qemu/qmp and
> > https://gitlab.com/qemu-project/python-qemu-qmp ?
> >
> > When / how is the code sync ?
> >
>
> python-qemu-qmp supersedes the code that is in qemu.git.
> qemu.git/python/qemu/qmp is scheduled to be deleted, but there are
> changes that need to go in to configure etc to support the deletion
> first, and I've been backlogged/waylaid on making those changes.

... by which I mean, I generally do review and merge on the standalone
repo first, then backport to qemu.git. Or, that's what I'd prefer to
do, since the tooling and testing is more advanced on the standalone
repo.


