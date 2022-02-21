Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5F4BDAD9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:34:39 +0100 (CET)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBe2-0000qJ-2D
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:34:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMBTt-0003JV-1d
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMBTq-0006aa-83
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645460629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycBgpBix4LXVQJ5UIv7VGLsZ9KHm31//L/iE555hQSI=;
 b=TvVcoX+WYTKkEnZStQmd5Bmo01KZaN8zVmZp3C7ZewYiw3miITomosAjjosruxgHhTGKkM
 zrIcCQQ6CkSIGXj/r8xWeFoIeIUIDElT2yxtuRUwZvKTKpD5XNcvgsTprYTSc3/B4BP7Nz
 hipyMrNzGVB49rHmB7GKqH3mr00ZL1U=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-yzrjEu8pO2y9RJVGP902XQ-1; Mon, 21 Feb 2022 11:23:48 -0500
X-MC-Unique: yzrjEu8pO2y9RJVGP902XQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 bn10-20020a05651c178a00b00244baa268b6so4273068ljb.15
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ycBgpBix4LXVQJ5UIv7VGLsZ9KHm31//L/iE555hQSI=;
 b=Y1buoTu1freYd+Kx2VIHfz87q5ZbAR59b7aAw/ZAG82Noe3D/xoxXhHr2kk4Pd1RUM
 m3AUWQiKIKMdmdmNj3pgnNA0SO9GPgblYzrX5AqoMuIuoW/lXz5KFelOdmXkKmHoLNJh
 BwAB6fGypuYWAK2z1gYQCAtlvgOWLLo6RgcJ5gyTf+zA35S5BqidRQJta6C+GyhDIvY7
 x8saIjd6VePTnkK6rDPgeeaePePJUX1zxFnm9LkW4Jl1e5ynrsWpo1Ailb7Q3e1gHT/S
 tof0QVGeTAE6TJtFSBdIqCE0N9GQXS/X9EAShQtYM6nLFcIMoRUQDQd++ZdNsBzHL8pl
 fK0g==
X-Gm-Message-State: AOAM532SV9v0C6yT11sMBVxZgZugvY+8Shg9QH+mNFhTXlqKlab64HQf
 ad2LP9nt6aiveXBvzW1vu92sJCdon7iTBWSiJZr4zxBhy3r6Ia4/ywmnrHsERgCTlARBNZ2GxwM
 DRLQvyk4R1fmGSXI6+WOXL3Meey49Rls=
X-Received: by 2002:a2e:b7c5:0:b0:23e:4c1b:d9d0 with SMTP id
 p5-20020a2eb7c5000000b0023e4c1bd9d0mr15479218ljo.10.1645460627022; 
 Mon, 21 Feb 2022 08:23:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZZz6t6VLMwJ41y3gVxIiVWtyeY2MWkfPR96YeHrcfYd99J/zV9hB107C0zfd7IBph+45t5AVyYDn2wm6M4WQ=
X-Received: by 2002:a2e:b7c5:0:b0:23e:4c1b:d9d0 with SMTP id
 p5-20020a2eb7c5000000b0023e4c1bd9d0mr15479198ljo.10.1645460626763; Mon, 21
 Feb 2022 08:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
 <YeAkpTE0gqf1dj4C@redhat.com>
 <CAJ6HWG4GQV1N_=18TPqQygKCz36+VBx=b4EtUoZpMvcOQ6v0Vg@mail.gmail.com>
 <YehVMEL1hPaTbCIE@redhat.com>
 <CAJ6HWG6pWzkxmi+o3j9u+O0K=o3rBEKMmfMYQNY0pfKzg-NeqQ@mail.gmail.com>
 <87zgmocf0t.fsf@secure.mitica>
In-Reply-To: <87zgmocf0t.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 21 Feb 2022 13:23:35 -0300
Message-ID: <CAJ6HWG6d0jNdnncXjLqPWC_sSfGa69jFJVnecpMoPO51-r8Mzg@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP for
 Linux
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Juan,
Thanks for thew feedback!


On Fri, Feb 18, 2022 at 1:31 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> > On Wed, Jan 19, 2022 at 3:16 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> >>
> >> On Wed, Jan 19, 2022 at 03:03:29PM -0300, Leonardo Bras Soares Passos =
wrote:
> >> > Hello Daniel,
> >> >
> >> > On Thu, Jan 13, 2022 at 10:10 AM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> >> > >
> >> > > On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> >> > > > Add property that allows zero-copy migration of memory pages,
> >> > > > and also includes a helper function migrate_use_zero_copy() to c=
heck
> >> > > > if it's enabled.
> >> > > >
> >> > > > No code is introduced to actually do the migration, but it allow
> >> > > > future implementations to enable/disable this feature.
> >> > > >
> >> > > > On non-Linux builds this parameter is compiled-out.
> >> > > >
> >> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >> > > > ---
> >> > > >  qapi/migration.json   | 24 ++++++++++++++++++++++++
> >> > > >  migration/migration.h |  5 +++++
> >> > > >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
> >> > > >  migration/socket.c    |  5 +++++
> >> > > >  monitor/hmp-cmds.c    |  6 ++++++
> >> > > >  5 files changed, 72 insertions(+)
> >> > >
> >> > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >> >
> >> > Thanks!
> >>
> >
> > Ok, I see the point.
> > I will try to refactor the code changing zero-copy to zero-copy-send
> > or something like that.
>
> Hi
>
> I am late to the party, but I agree with Dan that we need two flags.
>
> Thre reason is that you can be the target of one migration, and later be
> the source of a next one.  If we only have one flag that means different
> things on the source and destination side, things become really
> complicated.
>
> Later, Juan.
>

Yeah, that makes sense. :)

Best regards,
Leo


