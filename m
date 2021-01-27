Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399330633C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:26:54 +0100 (CET)
Received: from localhost ([::1]:57332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4pWn-0006bY-BO
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l4pVH-00062w-6O
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:25:19 -0500
Received: from mout.web.de ([212.227.17.12]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l4pVF-0005Zm-1I
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611771894;
 bh=DZde47DPsRh8Pmv3nhkk78eN36Tct77KBJSsOcc74nQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cCQXGZoHPHkrUNTbt2B2m980wwlA/uK4oZGFsfehkSJTdXy6Jid/y/Zn+9jvC9ycL
 alw0n8fuzNKix1RXf5vRJTj4XXs1z6+kPPtfJqY6gsDXsGcl7spxqd/qPHfABy1WXD
 xlhdALv10Y4TevePc0M0CjQSCmlDDKvv7VYCH3zA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.240]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MQNeK-1lYY5S0pNE-00TmQO; Wed, 27
 Jan 2021 19:24:54 +0100
Date: Wed, 27 Jan 2021 19:24:16 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Message-ID: <20210127192416.525baaaa@gecko.fritz.box>
In-Reply-To: <SN6PR11MB3103DA5673109F5A785EACF2FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-3-git-send-email-lei.rao@intel.com>
 <20210120201244.3e4b30d9@gecko.fritz.box>
 <SN6PR11MB3103DA5673109F5A785EACF2FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k3Q1_Cxd5xwOu.yMFufJcXb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:CtddqdjlGMOHTQ96mGUB/YZ/8RritCKvbXN/uPaXujGhY4yroOa
 jEVpcejW3iQt1MJrxPtCGp3lgPcl2R1PtnMyvz9rOHCnvFV/x/KbCByWrcbkyUAA44bIu0q
 Dx03KsJZpiuith2ayoquUL5J5beAvlmJXqlimqdOhYbYBr4L2hTJQoD+aInW8GzhU3c/6ex
 WiYkCrNuQXJGArebGQQVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SrVE0oZ+YTE=:PD8IwitraSErCe+LN0mPtE
 KrJcMC7elA4NvW36S57dnsOtO7ooNktk5mPqeXottIJYX43WSYJPpFbwKWn3UcXGHCc4WEslf
 pXNLufQLu25qwyBBuFjccnDKQhP7dMFL1nV9WmgbdFjdDTP3+yOU7kUKH3cZdpLfjliGas/sm
 sPzQuyXcBEXZ630SW1Pj1L6h4cyOEd4oPcBEHDPMA5cM1quRp4SqFeir8ZCSS9UbSNECXUh4H
 N+1TcefARel+bQVQln+HMilea3R/wiXUNVeC/FIgE2vPyRMcdhFSI4mlZXHfyMaafXJlSlaHj
 IKNCES8ILGW3PWWoVO0r0ZgyrwJ7hhqaoyLlat5M3Gh4NMMfMlKeylm+4qNKmbx957B2J1gdL
 xBTDDlc5h5doxS63rq1sL+8ki1uvAAJZY2jze9ksCNnIZ9yJcqTAFtfno1FznRe2b9u6DOnMZ
 tjnHrCkfn7JZwxgW05WqH7dBidQcsguB255WNe6g+7pHops73L9+C/9YPqT0EB5/ZuI2/vzd+
 xvaIitIYqI+nnKsbLosHFbR4Hgi8gDYp6QvBhxWcqc2QnGxFL/M9vFSMU8Y/7KNxL0jzBKdHC
 XD6zs7ewM3JK29+Ezv4geLHB/rHtaoEzLLX+4R9m5bbdoeJK7HGyvMLqKSLLLGH79eOh+of5n
 WPzztjl8OhnHOBhJ7ESTzhZqlL0zy7wIECaqteu4uJSPgun32RfMK5AF8GwuMWJJeBx7em5Mi
 QBoYCl/77T0QZsrCroGuAmkuHc0so8MZt4RGx7WD9LP22WdsBaOmVDFiwQeUT91RBS2HOyGPd
 sKMwaVxNIweA7/eY+we/kNsLfnxAu5Ge3OuNi/yWGyXa567ZG52LvH+yDTBHpk6oPg+fA8aMc
 vPsa9i5AJWHB6D5H/SpA==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/k3Q1_Cxd5xwOu.yMFufJcXb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Jan 2021 01:48:31 +0000
"Rao, Lei" <lei.rao@intel.com> wrote:

> The Primary VM can be shut down when it is in COLO state, which may trigg=
er this bug.

Do you have a backtrace for this bug?

> About 'shutdown' -> 'colo' -> 'running', I think you are right, I did hav=
e the problems you said. For 'shutdown'->'colo', The fixed patch(5647051f43=
2b7c9b57525470b0a79a31339062d2) have been merged.
> Recently, I found another bug as follows in the test.
> 	qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'running'
>     	Aborted (core dumped)
> The gdb bt as following:
>     #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/ra=
ise.c:50
>     #1  0x00007faa3d613859 in __GI_abort () at abort.c:79
>     #2  0x000055c5a21268fd in runstate_set (new_state=3DRUN_STATE_RUNNING=
) at vl.c:723
>     #3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/colo=
-qemu/cpus.c:2206
>     #4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/cp=
us.c:2213
>     #5  0x000055c5a2332bba in migration_iteration_finish (s=3D0x55c5a4658=
810) at migration/migration.c:3376
>     #6  0x000055c5a2332f3b in migration_thread (opaque=3D0x55c5a4658810) =
at migration/migration.c:3527
>     #7  0x000055c5a251d68a in qemu_thread_start (args=3D0x55c5a5491a70) a=
t util/qemu-thread-posix.c:519
>     #8  0x00007faa3d7e9609 in start_thread (arg=3D<optimized out>) at pth=
read_create.c:477
>     #9  0x00007faa3d710293 in clone () at ../sysdeps/unix/sysv/linux/x86_=
64/clone.S:95
>=20
> For the bug, I made the following changes:
> 	@@ -3379,7 +3379,9 @@ static void migration_iteration_finish(MigrationSt=
ate *s)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_CANCELLING:
>          if (s->vm_was_running) {
> -            vm_start();
> +            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> +                vm_start();
> +            }
>          } else {
>              if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
>                  runstate_set(RUN_STATE_POSTMIGRATE);
> 				=20
> I will send the patch to community after more test.
>=20
> Thanks,
> Lei.
>=20
> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>=20
> Sent: Thursday, January 21, 2021 3:13 AM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowan=
g@redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert=
@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during =
checkpoint
>=20
> On Wed, 13 Jan 2021 10:46:27 +0800
> leirao <lei.rao@intel.com> wrote:
>=20
> > From: "Rao, Lei" <lei.rao@intel.com>
> >=20
> > This patch fixes the following:
> >     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown'
> >     Aborted (core dumped)
> >=20
> > Signed-off-by: Lei Rao <lei.rao@intel.com> =20
>=20
> I wonder how that is possible, since the VM is stopped during 'colo' stat=
e.
>=20
> Unrelated to this patch, I think this area needs some work since the foll=
owing unintended runstate transition is possible:
> 'shutdown' -> 'colo' -> 'running'.
>=20
> > ---
> >  softmmu/runstate.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index=20
> > 636aab0..455ad0d 100644
> > --- a/softmmu/runstate.c
> > +++ b/softmmu/runstate.c
> > @@ -125,6 +125,7 @@ static const RunStateTransition runstate_transition=
s_def[] =3D {
> >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > =20
> >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > =20
> >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> >      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR }, =20
>=20
>=20
>=20



--=20


--Sig_/k3Q1_Cxd5xwOu.yMFufJcXb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmARr9AACgkQNasLKJxd
sljNUQ/9EDHUMW8/c0UuFJX2+VVaAmq+xUyfOb2RsBq36EBopuSmhsx0f7QtmsBa
yhJvahge2AQoCBljJRulsGQGImgR/Pix0yPeTtUyBDy+jthVY4ttnxVvYkTu5WEa
3zUsjP8PFCZT7gHkLhm7xpAp5vMAXlLfawJQC8AmQuAiWwB+2gMUgKlEvL7ANMdD
dBBkgDp497o73Qm4ssqIJYOSh3BTCr3WRBmV1Vw3JwO4YaDh7Y5KPKjSxBIb5zXw
HBbmU7AatH0fjRGYktyRZ7rwQxbUwuhIi79i5cs3N8njIYWjTdV7phFu9uGy12vr
t00P/mk2lfCX67uGZs59IZoFnKzQE9ll/fIQRPRMaLiKcyTZtFPNh/t0Oh4M4u96
FRYCTU1ja8ONADPRv3pHKWU4qcV3J1htLKfEBg8GI1XvbSA4pLGf0MdhD4ARBuq8
K52Uy3sf2TbF0NOHF+L0bWCVUIsw2nqZMnwjzjEr9MazDAFbD9r6pVELodBCD2bd
ZdzPZ49Be7J1Mu+f3XxPbdwfFAMZnjTX9rU142rYsMxfWSX7j9x//2ZpHi1HeHu2
JtjWgl5lUxes0APTjg2UK/39/nFHOzk7dxJgUu3XPdG+e12+q5N+DWaMsnEyPwbl
CR0T5KWphGjIT62VVC6NdgYXp0iahjB32wXcoTFX9O7IzZ6r5XE=
=8zvF
-----END PGP SIGNATURE-----

--Sig_/k3Q1_Cxd5xwOu.yMFufJcXb--

