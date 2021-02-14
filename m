Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4531B043
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:49:06 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFth-0007Hk-Cp
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lBFr4-0006hP-0q
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:46:22 -0500
Received: from mout.web.de ([212.227.15.4]:52207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lBFr1-0003fC-0a
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1613303156;
 bh=wcwW1AMsWiq39fKAgKxhAyhDW7pCbntlkJV2LQpbyEM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jsw78JqJIVHszGaiKMnAfKvcCEDerR+UOEKAj4hJQCcM+Pm8iueuBvijjHTG1s920
 PD3voUroIJDMbQmnAK7mu6s/9M9iVgJvOGj2QmTTR823a2SSjjjbjeKMtcblYE4Gz5
 adloYe0TgkO4ai0fdPrTx0/xMwsYOE3EetvPC7GE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.128]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKMA7-1lS5LX351L-00LmcT; Sun, 14
 Feb 2021 12:45:56 +0100
Date: Sun, 14 Feb 2021 12:45:47 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Message-ID: <20210214124547.6d72e5e9@gecko.fritz.box>
In-Reply-To: <SN6PR11MB3103D9E313084D9BDB98E2F0FDB99@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-3-git-send-email-lei.rao@intel.com>
 <20210120201244.3e4b30d9@gecko.fritz.box>
 <SN6PR11MB3103DA5673109F5A785EACF2FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
 <20210127192416.525baaaa@gecko.fritz.box>
 <SN6PR11MB3103D9E313084D9BDB98E2F0FDB99@SN6PR11MB3103.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2pGZJGLRehdNFAPmZLExlu0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:h247xMq4r51xTxtUkYW37z7N/WtmzwKkXWepkYxIJg5/Byvo4Sn
 H1OtxxMS7xvMurw1tefRiHO75XYeDyzzrxlcnp6rOUaFUPW47M+sr1gsf16mZv2H7hzVygw
 Wv/wIpXf+ZeCeGZoqNObseLKejm2+UmEwMV/S1wW2zU4SSs/rjsKBcbhzfE8VmcCyblRFQB
 Mb1Wu0TyJ4aHpyFf/n2DQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L8Ji3qzP0Ok=:JI1oOxh7Bz5JJVqZUyP87F
 Qxai+NOiusitDtES9ChNTD0tM82OLIU1VGaw2IAfXjQDvJPIwBIhuDv63GdMv+/PlS9m2pkxO
 riCv6uHWR8y7cNXf4HpsGWv/X9ClW0dl8hUuCfyV129qoyHIG1FLbmROxFCMqTHv6DC3D+nUq
 BDfxiycyjEIyJRfargyWLgV46PsWj0YVWcq//q0nMcyg1ORHoAc+Rgcdt455KVicv0974rxpB
 ngGW71LR18gUmXncwA9bIUwFGL601iYXYJEossYMWzpnfxypL1CztdKiXoY3dHm7RGMwpqC8q
 XhS791fNcNIprnomQYdLKSCGWcyxNVjenlR1fKzW7M95EDWRVFaPEwDV5QUgYQdP8+CjrW4kI
 YpJBfinT/R0a7x+FR8MLcBBsQvZRX2HuXgIsjGbc174LvRu78Xil65xMU7DaQkH1I7m2tSfCc
 Mxk4GKc7xQzsCCma8kxke6L+CRpYntQjm9RkJL1bdKUHxDLafQceDfffQcj5OOGl/i7+5dxMO
 NcOCSCHG11KccCWrRenexMgfqLeQz9lYZ8HKr8bDr5v/QX7uII1x8k+xhXp1AZ+2PzP/hZOcj
 uLDkHq+gIqXsQ+daTKG1eEy0mSrX6kNjbLQdr5S/C3x80sKRnLL7J1H0SmGkPIKm2+NzQaQjd
 y66RxHdJRUTbdoSe3iGGEB/n3AlTPwZwXiYG3kJ6kJuBnEtNSR1wAUigeT5eUzAjG8MqhhXU7
 +KC8wbI67uiVyKiezdNDkjYN8BO6gc2J0t7xbG839fY0JQIm58K8hjFUaz7AlaDFz6A5Fkstj
 fWW2xI6jiaEeby3XMxnn89qrgpDo5RYkRlieKr2YbkumJm+cchaO3xkzcblDTfYD6SGpSN+hm
 0pG6rHeXaBDMQh8f4cAw==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
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

--Sig_/2pGZJGLRehdNFAPmZLExlu0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Jan 2021 02:57:57 +0000
"Rao, Lei" <lei.rao@intel.com> wrote:

> The state will be set RUN_STATE_COLO in colo_do_checkpoint_transaction().=
 If the guest executes power off or shutdown at this time and the QEMU main=
 thread will call vm_shutdown(), it will set the state to RUN_STATE_SHUTDOW=
N.
> The state switch from RUN_STATE_COLO to RUN_STATE_SHUTDOWN is not defined=
 in runstate_transitions_def. this will cause QEMU crash. Although this is =
small probability, it may still happen.

This patch fixes the 'colo' -> 'shutdown' transition. AFAIK then
colo_do_checkpoint_transaction will call vm_start() again, which
does 'shutdown' -> 'running' and (rightfully) crashes. So I think
it is better to crash here too.

>  By the way. Do you have any comments about other patches?
> Thanks,
> Lei.
>=20
> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>=20
> Sent: Thursday, January 28, 2021 2:24 AM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowan=
g@redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert=
@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during =
checkpoint
>=20
> On Thu, 21 Jan 2021 01:48:31 +0000
> "Rao, Lei" <lei.rao@intel.com> wrote:
>=20
> > The Primary VM can be shut down when it is in COLO state, which may tri=
gger this bug. =20
>=20
> Do you have a backtrace for this bug?
>=20
> > About 'shutdown' -> 'colo' -> 'running', I think you are right, I did h=
ave the problems you said. For 'shutdown'->'colo', The fixed patch(5647051f=
432b7c9b57525470b0a79a31339062d2) have been merged.
> > Recently, I found another bug as follows in the test.
> > 	qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'runnin=
g'
> >     	Aborted (core dumped)
> > The gdb bt as following:
> >     #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/=
raise.c:50
> >     #1  0x00007faa3d613859 in __GI_abort () at abort.c:79
> >     #2  0x000055c5a21268fd in runstate_set (new_state=3DRUN_STATE_RUNNI=
NG) at vl.c:723
> >     #3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/co=
lo-qemu/cpus.c:2206
> >     #4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/=
cpus.c:2213
> >     #5  0x000055c5a2332bba in migration_iteration_finish (s=3D0x55c5a46=
58810) at migration/migration.c:3376
> >     #6  0x000055c5a2332f3b in migration_thread (opaque=3D0x55c5a4658810=
) at migration/migration.c:3527
> >     #7  0x000055c5a251d68a in qemu_thread_start (args=3D0x55c5a5491a70)=
 at util/qemu-thread-posix.c:519
> >     #8  0x00007faa3d7e9609 in start_thread (arg=3D<optimized out>) at p=
thread_create.c:477
> >     #9  0x00007faa3d710293 in clone () at=20
> > ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> >=20
> > For the bug, I made the following changes:
> > 	@@ -3379,7 +3379,9 @@ static void migration_iteration_finish(Migration=
State *s)
> >      case MIGRATION_STATUS_CANCELLED:
> >      case MIGRATION_STATUS_CANCELLING:
> >          if (s->vm_was_running) {
> > -            vm_start();
> > +            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> > +                vm_start();
> > +            }
> >          } else {
> >              if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
> >                  runstate_set(RUN_STATE_POSTMIGRATE);
> > 				=20
> > I will send the patch to community after more test.
> >=20
> > Thanks,
> > Lei.
> >=20
> > -----Original Message-----
> > From: Lukas Straub <lukasstraub2@web.de>
> > Sent: Thursday, January 21, 2021 3:13 AM
> > To: Rao, Lei <lei.rao@intel.com>
> > Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;=20
> > jasowang@redhat.com; zhang.zhanghailiang@huawei.com;=20
> > quintela@redhat.com; dgilbert@redhat.com; qemu-devel@nongnu.org
> > Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown=20
> > during checkpoint
> >=20
> > On Wed, 13 Jan 2021 10:46:27 +0800
> > leirao <lei.rao@intel.com> wrote:
> >  =20
> > > From: "Rao, Lei" <lei.rao@intel.com>
> > >=20
> > > This patch fixes the following:
> > >     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdo=
wn'
> > >     Aborted (core dumped)
> > >=20
> > > Signed-off-by: Lei Rao <lei.rao@intel.com> =20
> >=20
> > I wonder how that is possible, since the VM is stopped during 'colo' st=
ate.
> >=20
> > Unrelated to this patch, I think this area needs some work since the fo=
llowing unintended runstate transition is possible:
> > 'shutdown' -> 'colo' -> 'running'.
> >  =20
> > > ---
> > >  softmmu/runstate.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index=20
> > > 636aab0..455ad0d 100644
> > > --- a/softmmu/runstate.c
> > > +++ b/softmmu/runstate.c
> > > @@ -125,6 +125,7 @@ static const RunStateTransition runstate_transiti=
ons_def[] =3D {
> > >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > > =20
> > >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > > +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > > =20
> > >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> > >      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR }, =20
> >=20
> >=20
> >  =20
>=20
>=20
>=20



--=20


--Sig_/2pGZJGLRehdNFAPmZLExlu0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmApDWsACgkQNasLKJxd
sljdpxAAh6W8uHXoce7LDWHmouxpazbrkQLh72xcuj0rAI1/AvGbC6Tw+rg/RVWn
6wcsNsfLWzqMjDxvKnf6Qo3ldhxEiW+kxFhalL2qdwjZVJUfZ/DzLO2TQzqMVKpu
FldiJEPw0zYNK+SZsLJ3S+BlhZoz2BCzolyU9AbJh6WrlJmFoLY6ixo6QtBFnWHR
Js2vFUQDBQ65SJzagpdYb8LFGPnu/cl9oymGgClzUxdjXMIkAEO74SPkcPapwXFo
E9J+/lmleljnYw5BBmL1lGOljynPmvsPJXWyNdTxGgdp+XLMQojWPc6KBeykNQGZ
tB7rItY162kscH3LufJW7W5EtwGBX3YZibPixyaNKU1O2fH4qaJoZSbosvgZt3HA
xQBumQMWA92LCufFI9dBDA3GsW264JzpNscDyaNCI4mL5KXQ2yDftteENvTtNWP0
KB8D9ZplFWzgr1X/3y4nEE2KEcZNEuBjDrswXO6/3FWhUzkQu6ZF9FTx++fxVGll
0hGB+u/AyYVv/wXZjqoySpcn4EgOm9uchPnb1uG/dLiOtZS0HF74fjBAPi/A1HjU
Y7Zk7K09l6yyMjuqeSFb7ermVBdtM7gnfFHVI/yWdY/wF6QaSVNhZX7Dipz6xZOD
/DlIjONqmvXJajThmJ87eOjv1aZprdU4urxOjsrfFsG61ptLZPo=
=x/NC
-----END PGP SIGNATURE-----

--Sig_/2pGZJGLRehdNFAPmZLExlu0--

