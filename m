Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3D4A6024
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:29:56 +0100 (CET)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEv6R-0007py-Ms
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEslc-0003un-PJ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 08:00:18 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEslY-0004o1-Ih
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 08:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=eo1KRX2jP/KSZ4XFHPFZkPllGFryIRPqE07MXnrFgXI=; b=ZmyUpP4keMglzKhjrCUJON8W5s
 n2DWuQvbRFHIMf1bh5CP0KfM39Uu4rELTj3GnMtFXziohWVKL4DEXMwDmZakDUSCQp/laVWxlGl48
 j+bQq0Gc8P8H2u8gE5RB5m92uCBGiBvJIFsBdP/9QiWNDbAQHZQ0MOpx1lR3ewdlFNsQLszMVHoQT
 Y/Xg+NZ5IoKMf+i8z2xyoIByvRmet+Q4eWNdcFFoJWc1U3wpR0sRBcvhfENQwbs+f0nvZhZbC05tO
 r5VTaDt7P0IHzbS/TjfxjOr3EUSa5sujrjA92hs9mkg8zcmo6FJCAOW6ehrYPnMy4V9DwhC28O+48
 ZYVX4m6PQwYKFSuSf9ReaetF+g30HFu0hYXlDa1L2eEDaezggBPMKianC7tOjEAWFC1Y7Z4MQN6vW
 sBP5wn/QD0FlVFcDBwzNvdfonCP8wG1k0atP/ny1/DKVDcvvVToFU3dfxFFjbDYiPqa0zVew6DggV
 77t4bEY00xvhRik1hS3F5H9FSlTKq9DZp/KcTBYBjKty2RS5l82A6u1GSK419GSM9yxrbm0cIqPIQ
 WoTMn/8CPoaIUQJqzjmZaomSRzjrt2/A0QZUBCDoHrgAQ8UbTVWZK6BUwbtq5cxap1SYNqPCHAnhg
 F5Zpymg1WWzskmpjUb4bVCL/fm21bRzuzB5lD9nWY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Tue, 01 Feb 2022 14:00:09 +0100
Message-ID: <8138982.0MYlZfBBja@silver>
In-Reply-To: <20220201111137.732325b4@bahia>
References: <20220131163930.61521-1-groug@kaod.org>
 <2201667.JLq2WqQvVQ@silver> <20220201111137.732325b4@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 1. Februar 2022 11:11:37 CET Greg Kurz wrote:
> On Mon, 31 Jan 2022 18:43:22 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 31. Januar 2022 17:39:30 CET Greg Kurz wrote:
> > > It is recommended to use g_autofree or g_autoptr as it reduces
> > > the odds of introducing memory leaks in future changes. Let's do
> > > that everywhere a glib allocation is performed.
> > >=20
> > > The virtio_9p_create_local_test_dir() function needs some extra
> > > care though : the template pointer is eventually cached into the
> > > local_test_path global variable for the duration of the tests and
> > > should not be freed. Add the g_autofree annotation but negate it
> > > with g_steal_pointer() to make it clear that the pointer ownership
> > > is dropped on purpose.
> > >=20
> > > Based-on:
> > > <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@cru=
deb
> > > yte
> > > .com> Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > > v2: - fix crash with local_test_path
> > > ---
> > >=20
> > >  tests/qtest/libqos/virtio-9p.c | 30 +++++++++++++++---------------
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..f0ffbc583492
> > > 100644
> > > --- a/tests/qtest/libqos/virtio-9p.c
> > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > @@ -37,18 +37,22 @@ static char *concat_path(const char* a, const cha=
r*
> > > b)
> > >=20
> > >      return g_build_filename(a, b, NULL);
> > > =20
> > >  }
> > >=20
> > > -void virtio_9p_create_local_test_dir(void)
> > > +static char *make_temp_dir(char *template)
> > >=20
> > >  {
> > >=20
> > > -    struct stat st;
> > > -    char *pwd =3D g_get_current_dir();
> > > -    char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
> > > -
> > > -    local_test_path =3D mkdtemp(template);
> > > -    if (!local_test_path) {
> > > +    char *path =3D mkdtemp(template);
> > > +    if (!path) {
> > >=20
> > >          g_test_message("mkdtemp('%s') failed: %s", template,
> > >=20
> > > strerror(errno)); }
> > > -    g_free(pwd);
> > > +    return path;
> > > +}
> > > +
> > > +void virtio_9p_create_local_test_dir(void)
> > > +{
> > > +    g_autofree char *pwd =3D g_get_current_dir();
> > > +    g_autofree char *template =3D concat_path(pwd,
> > > "qtest-9p-local-XXXXXX");
> > > +    struct stat st;
> > >=20
> > > +    local_test_path =3D make_temp_dir(g_steal_pointer(&template));
> >=20
> > Quite noisy diff and under the bottom line, it does not fix what it
> > originally supposed to: addressing the leak of the global variable
> > 'local_test_path'. g_steal_pointer() simply makes the previous g_autofr=
ee
> > prefix pointless.
> The g_autofree and g_steal_pointer() dance is just an idiom that
> says "I'm not freeing this pointer on purpose, it will be handled
> somewhere else". No big deal. I'll split this in two patches : one
> for the leak of 'local_test_path' with a clear comment instead of
> g_autofree and one for the remaining g_auto* conversions.

Yeah, I got that, but it still adds redundant code, as if adding a constant
literal expression like "... * 1/2 * 2".

The other changes have an actual purpose: they reduce code. This one though
just adds noise without a real purpose, plus it reverts of what I just have
done with the previous patch: getting rid of the previously already existing
separate function init_local_test_path():

https://github.com/cschoenebeck/qemu/commit/072636e2a9f3a153078e6046e52ae5a=
330728b68

I don't care enough though to continue defending my position on this.

> > Why not just moving g_autofree from 'template' to the global variable
> > 'local_test_path' and avoid all that noise?
>=20
> Because the 'cleanup' attribute cannot be set on a static variable as
> documented in GCC:
>=20
> cleanup (cleanup_function)
>=20
>     The cleanup attribute runs a function when the variable goes out of
>     scope. This attribute can only be applied to auto function scope
>     variables; it may not be applied to parameters or variables with
>     static storage duration. The function must take one parameter, a
>     pointer to a type compatible with the variable. The return value
>     of the function (if any) is ignored.
>=20
> and trying to do so produces:
>=20
> ../../tests/qtest/libqos/virtio-9p.c:32:1: error: =E2=80=98cleanup=E2=80=
=99 attribute
> ignored [-Werror=3Dattributes] 32 | static g_autofree char *local_test_pa=
th;
>=20
>       | ^~~~~~
>=20
> cc1: all warnings being treated as errors
>=20
> The leak of 'local_test_path' can only be addressed with a g_free()
> in its last user, i.e. virtio_9p_remove_local_test_dir().

Agreed, that would probably be the best solution for now.

Thanks!

Best regards,
Christian Schoenebeck



