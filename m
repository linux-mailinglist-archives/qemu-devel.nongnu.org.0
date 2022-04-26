Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CA5104E6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:08:09 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOfY-0003im-Lo
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1njOD3-0003xR-A4
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1njOD0-00056M-NA
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650991117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE5WZ9OANCCDflp6wo4FgJUYxnqtpz1R2/EH18a310Y=;
 b=jJxlig1CvlfLskhdSMhO+IPruXxdFsgt4BBWvfLp/34tw0f9g0sRdNmjz5vfEXlvpVmamz
 184hHpkpXQo4IZ6xXS/S4BhJw2gMnQKDB6+izwGFhd/q1dH3PXa/GQs+MkuKCmtbiCbGFp
 jsQbewkT9UZECNWXBpFlJbIAlGgJ38Q=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-xa5jjn5ZMiq42vEbJNvdmw-1; Tue, 26 Apr 2022 12:38:36 -0400
X-MC-Unique: xa5jjn5ZMiq42vEbJNvdmw-1
Received: by mail-ua1-f70.google.com with SMTP id
 m16-20020ab05a50000000b003628807eda4so3347492uad.20
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tE5WZ9OANCCDflp6wo4FgJUYxnqtpz1R2/EH18a310Y=;
 b=K7qu/NqgN3N3Wkle3hnwk9GakDb2QBcA2Jr65PiPB90dxdOZdNMP2EbTvu+Isv4Kmb
 jb2hpkjsN0IJyTW6xL5Nz0YOnc4JFkRQlWDw75bYW259kxSnMQHjrx0oz4Nsea9LsMY6
 FTNK5p43DEEKQt/x9eQn8zsZCC04CSc0lbO/VGbhAbgKjx2rIEAzsLOGGAoapo/yINOF
 TZ47CyKCRzO8QidBK8clSvBA3iTByeWtZLq88L6VS7BgTu0EM40Lu3fNQ6sLZHr4Vorm
 iLWU+uOg/J/VZ57NEBzvOqE6nSXcIgEGjmwdJzQND20Qya2HQVoSHH/FEjAp+ao5672K
 nyrA==
X-Gm-Message-State: AOAM533KXXIXFrgyCYqhU65KsOICH+GPuZdRcAHAmTi61JrK4Tl8Q/kY
 7hwqeCW0k8t0gijuHfGNBYbP4MJewxC/FSTPzZ9ta4MXegUzkF4YOtioobisVgtfMViUlpd5xHa
 WwpQr8PMnQAL3U4hyHa1dL1G3MIk3Rls=
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr7177339uam.119.1650991115285; 
 Tue, 26 Apr 2022 09:38:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQZzMbSa8a9c5Rqu9HuwQ2fkmcCzWXLDyOhHrJllnj8pC7AoeXzqe1867GdBZSfCU3gltuSosBSIOk6aAF0kw=
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr7177333uam.119.1650991115001; 
 Tue, 26 Apr 2022 09:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-5-jsnow@redhat.com>
 <YmZ+X0XK3kcCHtMm@redhat.com>
 <CAFn=p-YAGKUscrVNWpVT6=n3Q_Xi4Bvt5YWV4mrAh3Eb4QRkNQ@mail.gmail.com>
 <YmelelTWDL9oLKC1@redhat.com> <YmeqR3gbsZO9FH4u@paraplu>
In-Reply-To: <YmeqR3gbsZO9FH4u@paraplu>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Apr 2022 12:38:24 -0400
Message-ID: <CAFn=p-aFu0eHZCWT2acuiQLWeLVHt5gMyqc11TfiM0i3tqwMrA@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 04/12] update project URLs
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 4:16 AM Kashyap Chamarthy <kchamart@redhat.com> wro=
te:
>
> On Tue, Apr 26, 2022 at 08:55:38AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Apr 25, 2022 at 02:19:27PM -0400, John Snow wrote:
> > > On Mon, Apr 25, 2022, 6:56 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > > wrote:
> > >
> > > > On Fri, Apr 22, 2022 at 02:49:32PM -0400, John Snow wrote:
> > > > > Point to this library's URLs instead of the entire project's.
> > > > >
> > > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > > ---
> > > > >  setup.cfg | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/setup.cfg b/setup.cfg
> > > > > index c21f2ce..0a1c215 100644
> > > > > --- a/setup.cfg
> > > > > +++ b/setup.cfg
> > > > > @@ -5,8 +5,8 @@ author =3D QEMU Project
> > > > >  author_email =3D qemu-devel@nongnu.org
> > > > >  maintainer =3D John Snow
> > > > >  maintainer_email =3D jsnow@redhat.com
> > > > > -url =3D https://www.qemu.org/
> > > > > -download_url =3D https://www.qemu.org/download/
> > > > > +url =3D https://gitlab.com/qemu-project/python-qemu-qmp
> > > > > +download_url =3D
> > > > https://gitlab.com/qemu-project/python-qemu-qmp/-/packages
> > > >
> > > > Auto-generated tarballs are not guaranteed to have fixed content fo=
rever
> > > > so I tend to avoid pointing to those. Assuming you're intending to =
upload
> > > > to pypi, I'd link to that instead as the "official" tarball source.
> > > >
> > >
> > > This metadata will also be used for PyPI, so that seemed cyclic.
> > >
> > > I linked it to the gitlab package repository, where I *intend* to pus=
h
> > > built wheels (and dev interstitial builds) but maybe that's too "insi=
de
> > > baseball" for a pypi link.
> >
> > Oh wait, I mis-understood the URL. If it is the location for manually
> > built & published dists, that's ok - it isn't the gitlab auto tarballs.
> >
> > > Seems weird for a Pypi package to point to itself on pypi, but maybe =
that's
> > > correct?
> >
> > I wonder what common practice is for some popular python libs....
>
> E.g. if you look at SQLAlchemy (definitely one of the popular
> libraries), it is pointing to itself (see the Ufiles under the "Download
> files" link):
>
>     https://pypi.org/project/SQLAlchemy
>

The "Files" link is, I believe, just a standard PyPI link. "Download"
is the one being defined here.

Check out my "Alpha 0" page, generated earlier this year:
https://pypi.org/project/qemu.qmp/
Download Files goes to the PyPI section, but "Download" goes to the
GitLab package registry.

I think I'll leave this as-is, then.

--js


