Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF174B63E8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:03:54 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJrsQ-00036k-1R
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:03:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJrqP-0001mJ-FQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:01:49 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJrqN-0002K9-2W
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:01:48 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-sJNflErWNCu70AUGFy82EQ-1; Tue, 15 Feb 2022 02:01:42 -0500
X-MC-Unique: sJNflErWNCu70AUGFy82EQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE07814243;
 Tue, 15 Feb 2022 07:01:41 +0000 (UTC)
Received: from bahia (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92524F85A;
 Tue, 15 Feb 2022 07:01:38 +0000 (UTC)
Date: Tue, 15 Feb 2022 08:01:37 +0100
From: Greg Kurz <groug@kaod.org>
To: Vitaly Chikunov <vt@altlinux.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Message-ID: <20220215080137.021f6938@bahia>
In-Reply-To: <20220214144351.dp57o6jyfvliwkos@altlinux.org>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <2037112.271zI61438@silver> <20220214113653.087a06e2@bahia>
 <2442070.WHyy189egQ@silver>
 <20220214144351.dp57o6jyfvliwkos@altlinux.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "Dmitry V . Levin" <ldv@altlinux.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 17:43:51 +0300
Vitaly Chikunov <vt@altlinux.org> wrote:

> Christian,
>=20
> On Mon, Feb 14, 2022 at 12:44:48PM +0100, Christian Schoenebeck wrote:
> > On Montag, 14. Februar 2022 11:36:53 CET Greg Kurz wrote:
> > > The synth backend should be fixed to honor d_reclen, or
> > > at least to allocate with g_new0().
> >=20
> > Yes, I overlooked that this is not initialized with zero already.
> >=20
> > With g_new0() d_reclen would be zero and qemu_dirent_dup() would then f=
allback=20
> > to the portable branch (as I assumed it already would):
>=20
> Perhaps, this additional change should be added (I only found two instanc=
es of
> V9fsSynthOpenState allocation):
>=20
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -182,7 +182,7 @@ static int synth_opendir(FsContext *ctx,
>      V9fsSynthOpenState *synth_open;
>      V9fsSynthNode *node =3D *(V9fsSynthNode **)fs_path->data;
> =20
> -    synth_open =3D g_malloc(sizeof(*synth_open));
> +    synth_open =3D g_malloc0(sizeof(*synth_open));
>      synth_open->node =3D node;
>      node->open_count++;
>      fs->private =3D synth_open;
> @@ -266,7 +266,7 @@ static int synth_open(FsContext *ctx, V9fsPath *fs_pa=
th,
>      V9fsSynthOpenState *synth_open;
>      V9fsSynthNode *node =3D *(V9fsSynthNode **)fs_path->data;
> =20
> -    synth_open =3D g_malloc(sizeof(*synth_open));
> +    synth_open =3D g_malloc0(sizeof(*synth_open));
>      synth_open->node =3D node;
>      node->open_count++;
>      fs->private =3D synth_open;
>=20
> > Additionally I would add NAME_MAX to the V9fsSynthOpenState allocation =
size,=20
> > because it is known that some systems define dirent as flex-array (zero=
 d_name=20
> > size).
>=20
> (To be precise) not just zero, but 1 byte. Also, to remind, for some
> filesystems, such as CIFS, actual d_name size could be longer than NAME_M=
AX.
> Because of that struct dirent cannot be allocated statically or with simp=
le
> sizeof.
>=20
> >=20
> > I know Greg would not favour this solution (using g_new0), but it's the=
 most=20
> > minimalistic and most portable solution. So I would favour it for now.
>=20
> Why g_new0 and not just g_malloc0? This is smallest code change, which se=
ems
> appropriate for a bug fix.
>=20


I prefer g_new0() for the exact reasons that are provided in QEMU's
official coding style docs/devel/style.rst:

---

Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the follo=
wing
reasons:

* It catches multiplication overflowing size_t;
* It returns T ``*`` instead of void ``*``, letting compiler catch more typ=
e errors.

Declarations like

.. code-block:: c

    T *v =3D g_malloc(sizeof(*v))

are acceptable, though.

---

I'm fine with the acceptable version as well. The only important thing is
to fix the synth backend.

Cheers,

--
Greg

> Thanks,
>=20
> >=20
> > A cleaner solution on the long-term would be turning V9fsSynthOpenState=
's=20
> > 'dent' member into a pointer and adding a new function to osdep like:
> >=20
> > struct dirent *
> > qemu_dirent_new(const char* name) {
> >     ...
> > }
> >=20
> > But I would like to postpone that qemu_dirent_new() solution, e.g. beca=
use I=20
> > guess some people would probably not like qemu_dirent_new() to have in =
osdep,=20
> > as it is probably not a general purpose function, and I am not keen put=
ting=20
> > qemu_dirent_new() into a different location than qemu_dirent_dup(), bec=
ause it=20
> > would raise the danger that system dependent code might deviate in futu=
re.
> >=20
> > Best regards,
> > Christian Schoenebeck
> >=20


