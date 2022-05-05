Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C239151BE8C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:54:26 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nma3t-0001tf-U7
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nma1U-0000GH-Ri
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:51:58 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:22753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nma1T-0001dV-5D
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651751514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YK8yFoTo8gukSLswtgaARMWosDSDmuBZmA2uGkJyjO0=;
 b=ODVUkDSHp/8ugCV8LgJUQ0wCnvTzpeZf0fsfFyqY5bY7giHamTatE/cq3DogBDVMufNdRM
 luGkHJvQpxJI3NvXTeH28uALCZnWlQJ685rsHX+2PejL3PRWCKXDVdej+pOyHW6AFg9E78
 gRhbuhcjb+EuURXgG0s85HmvHp2y/tE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-dRk9bs9wP3-VE1PAPx8AlQ-1; Thu, 05 May 2022 07:51:53 -0400
X-MC-Unique: dRk9bs9wP3-VE1PAPx8AlQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 b6-20020a5b0b46000000b006457d921729so3389694ybr.23
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 04:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YK8yFoTo8gukSLswtgaARMWosDSDmuBZmA2uGkJyjO0=;
 b=Yjurwxlm/4rtFU1xMs3UAFozfKoGYjGESa3sM/N7jbwl27F9IUo9iA6Dd/pQZIyb6q
 gLdV1QHD0G3YLOU4N4i/kzIIibylg2z1erS2QRUfp9HjZ6qI2PBSOpqUFNMqLVS9bvDt
 zGk3yDeAcxpVpTkdsm7iy40LiEvGuzYaZLKDYhnAEHXdPpBejSo4g6BnYlqpAflmYVSm
 X+xv5wezta6wmqdMyJx3xtrGDwsTIQ0rE5lEYMJjKaeewtb3aNYQI8RQpa1UIu3lm08N
 thKQd/VjfQbL+Z0YBk2PbWeP2HBelKXWz92+P1r+bbsYqkvLxEkl5trETQFwgjacrR8i
 lKpA==
X-Gm-Message-State: AOAM531im00LllMc+m2e62muCfjtEf7SQL8U4YLCEFoIE/EwCBISmJVF
 X21/EyofuTfr3mMirTlUEgnxfu+51fkNR1x4VfmrjhXhv90C0yVG+AZGTuBDP95c03AHvORl7c9
 RXivB7NQyTx+Iq1sMJLB9wOC5auL9FKY=
X-Received: by 2002:a25:4902:0:b0:648:d1db:af83 with SMTP id
 w2-20020a254902000000b00648d1dbaf83mr22142244yba.559.1651751512820; 
 Thu, 05 May 2022 04:51:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhbkfnEytTd349rS6MdGn5a2qdVRhUdcIkLfZOuEA6Nlm26qp1b3oXHXH8yiGHUFDXmB99fLVW3tzBvvpHY10=
X-Received: by 2002:a25:4902:0:b0:648:d1db:af83 with SMTP id
 w2-20020a254902000000b00648d1dbaf83mr22142214yba.559.1651751512619; Thu, 05
 May 2022 04:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-16-marcandre.lureau@redhat.com>
 <871qx8w69l.fsf@pond.sub.org>
In-Reply-To: <871qx8w69l.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 5 May 2022 15:51:41 +0400
Message-ID: <CAMxuvaw1_v8SiYq5zkV38-joGhi==7fhEeRjbSKd8tE2pv8OOA@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] test/qga: use g_auto wherever sensible
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.74; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, May 5, 2022 at 3:47 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/unit/test-qga.c | 125 +++++++++++++++---------------------------
> >  1 file changed, 45 insertions(+), 80 deletions(-)
> >
> > diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> > index ab0b12a2dd16..53cefc2c2649 100644
> > --- a/tests/unit/test-qga.c
> > +++ b/tests/unit/test-qga.c
> > @@ -51,8 +51,11 @@ static void
> >  fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
> >  {
> >      const gchar *extra_arg =3D data;
> > -    GError *error =3D NULL;
> > -    gchar *cwd, *path, *cmd, **argv =3D NULL;
> > +    g_autoptr(GError) error =3D NULL;
> > +    g_autofree char *cwd =3D NULL;
> > +    g_autofree char *path =3D NULL;
> > +    g_autofree char *cmd =3D NULL;
> > +    g_auto(GStrv) argv =3D NULL;
>
> Arranges five variables to be auto-freed, where ...
>
> >
> >      fixture->loop =3D g_main_loop_new(NULL, FALSE);
> >
> > @@ -78,17 +81,12 @@ fixture_setup(TestFixture *fixture, gconstpointer d=
ata, gchar **envp)
> >
> >      fixture->fd =3D connect_qga(path);
> >      g_assert_cmpint(fixture->fd, !=3D, -1);
> > -
> > -    g_strfreev(argv);
> > -    g_free(cmd);
> > -    g_free(cwd);
> > -    g_free(path);
>
> ... only four were freed before.  The extra one is @error.  Which can
> only be null here, thanks to g_assert_no_error(), can't it?

Right, but for consistency we can have it. I can drop it too.


