Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60621E7EA1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 03:45:48 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPHVz-00043q-6b
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 22:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iPHPy-0005RC-E8
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 22:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iPHE4-0002nH-67
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 22:27:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iPHE4-0002mr-1j
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 22:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572316035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+pNno2PCh6rUihtsvipclfEDrjWGAhizo+zRW/b3Ig=;
 b=ihUwVMWwzEFD8TAlYHnHJjyTPgrJellTK7s/8deVHvQw6r9J3KJgTOGSj2ey9pPdFf+Qel
 84vvaFH3GV50yPdGxWWeM5MwYuTjSI6FVSMpFXJwrdoOifkXx24WPaOaIXULt5KmACrSpY
 4JlQOoh7GJyao7C/kJI5jAxwwJbxLIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-ow0BY0V2OPGrqiNrzjmU9w-1; Mon, 28 Oct 2019 22:27:13 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8932B1005509;
 Tue, 29 Oct 2019 02:27:12 +0000 (UTC)
Received: from work-vm (ovpn-116-127.ams2.redhat.com [10.36.116.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 545D01001B28;
 Tue, 29 Oct 2019 02:27:02 +0000 (UTC)
Date: Tue, 29 Oct 2019 02:26:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] fw_cfg: Allow reboot-timeout=-1 again
Message-ID: <20191029022659.GD2508@work-vm>
References: <20191025165706.177653-1-dgilbert@redhat.com>
 <37ac197c-f20e-dd05-ff6a-13a2171c7148@redhat.com>
MIME-Version: 1.0
In-Reply-To: <37ac197c-f20e-dd05-ff6a-13a2171c7148@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ow0BY0V2OPGrqiNrzjmU9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: liq3ea@gmail.com, philmd@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laszlo Ersek (lersek@redhat.com) wrote:
> On 10/25/19 18:57, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Commit ee5d0f89de3e53cdb0dc added range checking on reboot-timeout
> > to only allow the range 0..65535; however both qemu and libvirt documen=
t
> > the special value -1  to mean don't reboot.
> > Allow it again.
> >
> > Fixes: ee5d0f89de3e53cdb0dc ("fw_cfg: Fix -boot reboot-timeout error ch=
ecking")
> > RH bz: https://bugzilla.redhat.com/show_bug.cgi?id=3D1765443
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/nvram/fw_cfg.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index 7dc3ac378e..1a9ec44232 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -247,10 +247,11 @@ static void fw_cfg_reboot(FWCfgState *s)
> >
> >      if (reboot_timeout) {
> >          rt_val =3D qemu_opt_get_number(opts, "reboot-timeout", -1);
> > +
> >          /* validate the input */
> > -        if (rt_val < 0 || rt_val > 0xffff) {
> > +        if (rt_val < -1 || rt_val > 0xffff) {
> >              error_report("reboot timeout is invalid,"
> > -                         "it should be a value between 0 and 65535");
> > +                         "it should be a value between -1 and 65535");
> >              exit(1);
> >          }
> >      }
> >
>=20
> Ouch.
>=20
> Here's the prototype of qemu_opt_get_number():
>=20
> > uint64_t qemu_opt_get_number(QemuOpts *opts, const char *name, uint64_t=
 defval);
>=20
> So, when we call it, here's what we actually do:
>=20
>         rt_val =3D (int64_t)qemu_opt_get_number(opts, "reboot-timeout", (=
uint64_t)-1);
>                  ^^^^^^^^^                                            ^^^=
^^^^^^^
>=20
> The conversion to uint64_t is fine.
>=20
> The conversion to int64_t is not great:
>=20
> > Otherwise, the new type is signed and the value cannot be represented
> > in it; either the result is implementation-defined or an
> > implementation-defined signal is raised.
>=20
> I guess we're exploiting two's complement, as the implementation-defined
> result. Not great. :)
>=20
> Here's what I'd prefer:
>=20
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index 7dc3ac378ee0..16413550a1da 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -237,7 +237,7 @@ static void fw_cfg_bootsplash(FWCfgState *s)
> >  static void fw_cfg_reboot(FWCfgState *s)
> >  {
> >      const char *reboot_timeout =3D NULL;
> > -    int64_t rt_val =3D -1;
> > +    uint64_t rt_val =3D -1;
> >      uint32_t rt_le32;
> >
> >      /* get user configuration */
> > @@ -248,9 +248,9 @@ static void fw_cfg_reboot(FWCfgState *s)
> >      if (reboot_timeout) {
> >          rt_val =3D qemu_opt_get_number(opts, "reboot-timeout", -1);
> >          /* validate the input */
> > -        if (rt_val < 0 || rt_val > 0xffff) {
> > +        if (rt_val > 0xffff && rt_val !=3D (uint64_t)-1) {
> >              error_report("reboot timeout is invalid,"
> > -                         "it should be a value between 0 and 65535");
> > +                         "it should be a value between -1 and 65535");
> >              exit(1);
> >          }
> >      }

I think I'm fine with that as well; want to add a signed off and post?

> (
>=20
> The trick is that strtoull(), in
>=20
>   qemu_opt_get_number()
>     qemu_opt_get_number_helper()
>       parse_option_number()
>         qemu_strtou64()
>           strtoull()
>=20
> turns "-1" into (uint64_t)-1, which counts as a valid conversion, per
> spec:

It's rather scary how much we rely on the grubby depths of the
implementations of our conversion routines.

> > If the subject sequence has the expected form and the value of /base/
> > is zero, the sequence of characters starting with the first digit is
> > interpreted as an integer constant according to the rules of 6.4.4.1.
> > If the subject sequence has the expected form and the value of /base/
> > is between 2 and 36, it is used as the base for conversion, ascribing
> > to each letter its value as given above. If the subject sequence
> > begins with a minus sign, the value resulting from the conversion is
> > negated (in the return type). A pointer to the final string is stored
> > in the object pointed to by /endptr/, provided that /endptr/ is not a
> > null pointer.
>=20
> )
>=20
> I don't insist though; if Phil is OK with the posted patch, I won't try
> to block it.

I'm happy either way.

Dave

> Thanks
> Laszlo
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


