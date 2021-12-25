Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93B47F446
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 20:02:40 +0100 (CET)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1CJS-0004TJ-Uk
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 14:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mario@locati.it>) id 1n1C4B-0004WG-46
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 13:46:51 -0500
Received: from smtpcmd13154.aruba.it ([62.149.156.154]:39333)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mario@locati.it>) id 1n1C45-00057o-G2
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 13:46:50 -0500
Received: from locati.it ([10.10.10.167]) by Aruba Outgoing Smtp  with ESMTPA
 id 1C41nxKBYydyP1C41nnE32; Sat, 25 Dec 2021 19:46:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640458001; bh=g7x1T/5lT6JykXCRcZfB4AEiY2B6LJ7K7RoWrP4MO7U=;
 h=Date:Subject:MIME-Version:Content-Type:From:To;
 b=UX0TpmOphHyjC/qoZygt67N515Gp4wd5W7apuavuQlCuGGtF7S3PV2l1W37av1jUA
 lEkE7PSOAjOcRbB7WZR2aE+IDloQJmcNSwyiChOiDvJGTG0/EYE0x7l/uRZYQpbRkH
 /6rEDfhVsIhf4xvj/HaOpywymtaDaOLH7TR2LdF9dO7be5DldEIwBQxdST6yKZjvqN
 ocicckbPdhobI2cCMbswj+EWAIbfhhNvxV1VJVO+XH/jBeO+JoSnhL1jkciPVPkCrl
 O/1xo0kbab75ENuzlaGfKRxDVtKpNhU2l1BRQU6vht0QYp8LUN8r2ElVOmLIr6xHXE
 PySG+DjexkUag==
Date: Sat, 25 Dec 2021 19:46:41 +0100
Message-Id: <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
In-Reply-To: <724f7563-f36c-2c37-3b94-951c3d922861@eik.bme.hu>
References: =?iso-8859-1?q?=3C20211213133542=2E2608540=2D1=2Dfarosas=40linux=2Eib?=
 =?iso-8859-1?q?m=2Ecom=3E_=3C724f7563=2Df36c=2D2c37=2D3b94=2D951c3d92?=
 =?iso-8859-1?q?2861=40eik=2Ebme=2Ehu=3E?=
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: multipart/alternative;
 boundary="_=__=_XaM3_.1640458001.2A.215154.42.31989.52.42.007.2012335712"
From: "mario@locati.it" <mario@locati.it>
To: balaton@eik.bme.hu
X-XaM3-API-Version: V4(R2)
X-type: 0
X-SenderIP: 2.36.99.11
X-CMAE-Envelope: MS4wfFuokbnAI5dKuY1Z7EJgJqGsyZwcG7CKSIchrQi1nCXlO43gEqILNHWjh6pRLKWR0ua8ZQ7KZIEoj7oExcNFVxYKcS5XweSw11QyQGnV8S9jTjxb8J+F
 q9ozYj2QdBYHbjIhZ15LYjIohr3JWqv2D3mESd4iIQ+yhuoBlhZAI3aDYQBoYOjf4uoX6Y8e22fa9gZeNAadJpzIzmk2CmkYoFQRrdax33e6uidufjpfSVxD
 dBrWJzcNAmxNBvqXEfj08JWA2KTJI6700Jw0a989hUZnFu7E1tpuw498VhWYa6dOXbQu7IylGLpxBY4KCDft7Q==
Received-SPF: none client-ip=62.149.156.154; envelope-from=mario@locati.it;
 helo=smtpcmd13154.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Dec 2021 14:01:32 -0500
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--_=__=_XaM3_.1640458001.2A.215154.42.31989.52.42.007.2012335712
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=0A=0A=0AFrom: "BALATON Zoltan" balaton@eik.bme.hu=0ATo: "Fabiano Rosas" =
farosas@linux.ibm.com=0ACc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, c=
lg@kaod.org, danielhb413@gmail.com, mario@locati.it=0ADate: Mon, 13 Dec 2=
021 20:51:15 +0100 (CET)=0ASubject: Re: [PATCH] target/ppc: Fix e6500 boo=
t=0A=0A=0AOn Mon, 13 Dec 2021, Fabiano Rosas wrote:=0A> When Altivec supp=
ort was added to the e6500 kernel in 2012[1], the=0A> QEMU code was not c=
hanged, so we don't register the VPU/VPUA=0A> exceptions for the e6500:=0A=
>=C2=A0=0A>  qemu: fatal: Raised an exception without defined vector 73=0A=
>=C2=A0=0A> Note that the error message says 73, instead of 32, which is =
the IVOR=0A> for VPU. This is because QEMU knows only knows about the VPU=
 interrupt=0A=C2=A0=0AThe word "knows" is repeated in the above line.=0A=C2=
=A0=0A> for the 7400s. In theory, we should not be raising _that_ VPU=0A>=
 interrupt, but instead another one specific for the e6500.=0A>=C2=A0=0A>=
 We unfortunately cannot register e6500-specific VPU/VPUA interrupts=0A> =
because the SPEU/EFPDI interrupts also use IVOR32/33. These are=0A> prese=
nt only in the e500v1/2 versions. From the user manual:=0A>=C2=A0=0A> e50=
0v1, e500v2: only SPEU/EFPDI/EFPRI=0A> e500mc, e5500:  no SPEU/EFPDI/EFPR=
I/VPU/VPUA=0A> e6500:          only VPU/VPUA=0A>=C2=A0=0A> So I'm leaving=
 IVOR32/33 as SPEU/EFPDI, but altering the dispatch code=0A> to convert t=
he VPU #73 to a #32 when we're in the e6500. Since the=0A> handling for S=
PEU and VPU is the same this is the only change that's=0A> needed. The EF=
PDI is not implemented and will cause an abort. I don't=0A> think it wort=
h it changing the error message to take VPUA into=0A> consideration, so I=
'm not changing anything there.=0A>=C2=A0=0A> This bug was discussed in t=
he thread:=0A> https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg002=
22.html=0A>=C2=A0=0A> 1- https://git.kernel.org/torvalds/c/cd66cc2ee52=0A=
>=C2=A0=0A> Reported-by: <mario@locati.it>=0A> Signed-off-by: Fabiano Ros=
as <farosas@linux.ibm.com>=0A> ---=0A> target/ppc/cpu_init.c    |  6 ++++=
++=0A> target/ppc/excp_helper.c | 12 +++++++++++-=0A> 2 files changed, 17=
 insertions(+), 1 deletion(-)=0A>=C2=A0=0A> diff --git a/target/ppc/cpu_i=
nit.c b/target/ppc/cpu_init.c=0A> index 6695985e9b..d8efcb24ed 100644=0A>=
 --- a/target/ppc/cpu_init.c=0A> +++ b/target/ppc/cpu_init.c=0A> @@ -2273=
,8 +2273,14 @@ static void init_excp_e200(CPUPPCState *env, target_ulong =
ivpr_mask)=0A>     env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x0000000=
0;=0A>     env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00000000;=0A>  =
   env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00000000;=0A> +    /*=0A=
> +     * These two are the same IVOR as POWERPC_EXCP_VPU and=0A=C2=A0=0A=
Maybe clearar to say "The next two" or even "SPEU and EFPDI are the =0Asa=
me..." then no need for the extra empty line but not a big deal.=0A=C2=A0=
=0ARegards,=0ABALATON Zoltan=0A=C2=A0=0A> +     * POWERPC_EXCP_VPUA. We d=
eal with that when dispatching at=0A> +     * powerpc_excp().=0A> +     *=
/=0A>     env->excp_vectors[POWERPC_EXCP_SPEU]     =3D 0x00000000;=0A>   =
  env->excp_vectors[POWERPC_EXCP_EFPDI]    =3D 0x00000000;=0A> +=0A>     =
env->excp_vectors[POWERPC_EXCP_EFPRI]    =3D 0x00000000;=0A>     env->ivo=
r_mask =3D 0x0000FFF7UL;=0A>     env->ivpr_mask =3D ivpr_mask;=0A> diff -=
-git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c=0A> index 1760=
7adbe4..7bb170f440 100644=0A> --- a/target/ppc/excp_helper.c=0A> +++ b/ta=
rget/ppc/excp_helper.c=0A> @@ -344,6 +344,16 @@ static inline void powerp=
c_excp(PowerPCCPU *cpu, int excp_model, int excp)=0A>         excp =3D PO=
WERPC_EXCP_PROGRAM;=0A>     }=0A>=C2=A0=0A> +#ifdef TARGET_PPC64=0A> +   =
 /*=0A> +     * SPEU and VPU share the same IVOR but they exist in differ=
ent=0A> +     * processors. SPEU is e500v1/2 only and VPU is e6500 only.=0A=
> +     */=0A> +    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D=
 POWERPC_EXCP_VPU) {=0A> +        excp =3D POWERPC_EXCP_SPEU;=0A> +    }=0A=
> +#endif=0A> +=0A>     switch (excp) {=0A>     case POWERPC_EXCP_NONE:=0A=
>         /* Should never happen */=0A> @@ -569,7 +579,7 @@ static inline=
 void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)=0A>        =
     cpu_abort(cs, "Debug exception triggered on unsupported model\n");=0A=
>         }=0A>         break;=0A> -    case POWERPC_EXCP_SPEU:      /* S=
PE/embedded floating-point unavailable  */=0A> +    case POWERPC_EXCP_SPE=
U:   /* SPE/embedded floating-point unavailable/VPU  */=0A>         env->=
spr[SPR_BOOKE_ESR] =3D ESR_SPV;=0A>         break;=0A>     case POWERPC_E=
XCP_EFPDI:     /* Embedded floating-point data interrupt   */=0A>=C2=A0=0A=
=0A=0A=0AI have tried to launch a freshly compiled qemu from git master o=
n a NXP T2080RDB devkit that has a e6500 CPU in combination with a freshl=
y compiled kernel 5.16-rc6=0AI have Debian SID ppc64 up and running using=
 such a kernel, and when I launch qemu to run a VM with the same debian s=
id for ppc64 and the same kernel using --enable-kvm I end up with a kerne=
l panic=0A=0A=0A[....]=0ARun /sbin/init as init process=0Arandom: fast in=
it done=0Asystemd[1]: illegal instruction (4) at 3fff96562ac8 nip 3fff965=
62ac8 lr 3fff96562aa8 code 1 in libc-2.32.so[3fff96516000+1f7000]=0Asyste=
md[1]: code: 60000000 38600006 9122b7e8 4801bead 60000000 60000000 8122b7=
e8 2c090004=C2=A0=0Asystemd[1]: code: 40820014 39200005 60000000 9122b7e8=
 <00000000> 60000000 8122b7e8 2c090005=C2=A0=0AKernel panic - not syncing=
: Attempted to kill init! exitcode=3D0x00000004=0ARebooting in 180 second=
s..=0A=0A=0AOn the positive side, for the first time I am not flooded by =
milions kernel error messages from the serial console attached to the dev=
kit, not a single error spitted out from it, great!=0A=0A=0AThe kernel co=
nfig file I used=0Ahttps://repo.powerprogress.org/t2080rdb/qemu/kernel_5.=
16-rc6.config=0A=0A=0AThe resulting kernel=0Ahttps://repo.powerprogress.o=
rg/t2080rdb/qemu/uImage_5.16-rc6=0A=0A=0AThe complete console output I ge=
t when configuring qemu before compilation=0Ahttps://repo.powerprogress.o=
rg/t2080rdb/qemu/2021-12-25_qemu_git_configure_on_ppc64.txt=0A=0A=0AThe c=
omplete console output that end up with the kernel panic when launching q=
emuhttps://repo.powerprogress.org/t2080rdb/qemu/2021-12-25_qemu_ppc64_e65=
00_kvm_debian_sid_log.txt=0A=C2=A0=0A=0A
--_=__=_XaM3_.1640458001.2A.215154.42.31989.52.42.007.2012335712
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div style=3D"font: normal 13px Arial; color:rgb(0, 0, 0);"><br><div clas=
s=3D"xam-quoted-text"><br>=0A<div><span style=3D"font-family:Arial; font-=
size:11px; color:#5F5F5F;">From</span><span style=3D"font-family:Arial; f=
ont-size:12px; color:#5F5F5F; padding-left:5px;">: "BALATON Zoltan" balat=
on@eik.bme.hu</span></div>=0A<div><span style=3D"font-family:Arial; font-=
size:11px; color:#5F5F5F;">To</span><span style=3D"font-family:Arial; fon=
t-size:12px; color:#5F5F5F; padding-left:5px;">: "Fabiano Rosas" farosas@=
linux.ibm.com</span></div>=0A<div><span style=3D"font-family:Arial; font-=
size:11px; color:#5F5F5F;">Cc</span><span style=3D"font-family:Arial; fon=
t-size:12px; color:#5F5F5F; padding-left:5px;">: qemu-devel@nongnu.org, q=
emu-ppc@nongnu.org, clg@kaod.org, danielhb413@gmail.com, mario@locati.it<=
/span></div>=0A<div><span style=3D"font-family:Arial; font-size:11px; col=
or:#5F5F5F;">Date</span><span style=3D"font-family:Arial; font-size:12px;=
 color:#5F5F5F; padding-left:5px;">: Mon, 13 Dec 2021 20:51:15 +0100 (CET=
)</span></div>=0A<div><span style=3D"font-family:Arial; font-size:11px; c=
olor:#5F5F5F;">Subject</span><span style=3D"font-family:Arial; font-size:=
12px; color:#5F5F5F; padding-left:5px;">: Re: [PATCH] target/ppc: Fix e65=
00 boot</span></div>=0A<br>=0A<div>On Mon, 13 Dec 2021, Fabiano Rosas wro=
te:</div><div>&gt; When Altivec support was added to the e6500 kernel in =
2012[1], the</div><div>&gt; QEMU code was not changed, so we don't regist=
er the VPU/VPUA</div><div>&gt; exceptions for the e6500:</div><div>&gt;&n=
bsp;</div><div>&gt;  qemu: fatal: Raised an exception without defined vec=
tor 73</div><div>&gt;&nbsp;</div><div>&gt; Note that the error message sa=
ys 73, instead of 32, which is the IVOR</div><div>&gt; for VPU. This is b=
ecause QEMU knows only knows about the VPU interrupt</div><div>&nbsp;</di=
v><div>The word "knows" is repeated in the above line.</div><div>&nbsp;</=
div><div>&gt; for the 7400s. In theory, we should not be raising _that_ V=
PU</div><div>&gt; interrupt, but instead another one specific for the e65=
00.</div><div>&gt;&nbsp;</div><div>&gt; We unfortunately cannot register =
e6500-specific VPU/VPUA interrupts</div><div>&gt; because the SPEU/EFPDI =
interrupts also use IVOR32/33. These are</div><div>&gt; present only in t=
he e500v1/2 versions. From the user manual:</div><div>&gt;&nbsp;</div><di=
v>&gt; e500v1, e500v2: only SPEU/EFPDI/EFPRI</div><div>&gt; e500mc, e5500=
:  no SPEU/EFPDI/EFPRI/VPU/VPUA</div><div>&gt; e6500:          only VPU/V=
PUA</div><div>&gt;&nbsp;</div><div>&gt; So I'm leaving IVOR32/33 as SPEU/=
EFPDI, but altering the dispatch code</div><div>&gt; to convert the VPU #=
73 to a #32 when we're in the e6500. Since the</div><div>&gt; handling fo=
r SPEU and VPU is the same this is the only change that's</div><div>&gt; =
needed. The EFPDI is not implemented and will cause an abort. I don't</di=
v><div>&gt; think it worth it changing the error message to take VPUA int=
o</div><div>&gt; consideration, so I'm not changing anything there.</div>=
<div>&gt;&nbsp;</div><div>&gt; This bug was discussed in the thread:</div=
><div>&gt; https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.h=
tml</div><div>&gt;&nbsp;</div><div>&gt; 1- https://git.kernel.org/torvald=
s/c/cd66cc2ee52</div><div>&gt;&nbsp;</div><div>&gt; Reported-by: &lt;mari=
o@locati.it&gt;</div><div>&gt; Signed-off-by: Fabiano Rosas &lt;farosas@l=
inux.ibm.com&gt;</div><div>&gt; ---</div><div>&gt; target/ppc/cpu_init.c =
   |  6 ++++++</div><div>&gt; target/ppc/excp_helper.c | 12 +++++++++++-<=
/div><div>&gt; 2 files changed, 17 insertions(+), 1 deletion(-)</div><div=
>&gt;&nbsp;</div><div>&gt; diff --git a/target/ppc/cpu_init.c b/target/pp=
c/cpu_init.c</div><div>&gt; index 6695985e9b..d8efcb24ed 100644</div><div=
>&gt; --- a/target/ppc/cpu_init.c</div><div>&gt; +++ b/target/ppc/cpu_ini=
t.c</div><div>&gt; @@ -2273,8 +2273,14 @@ static void init_excp_e200(CPUP=
PCState *env, target_ulong ivpr_mask)</div><div>&gt;     env-&gt;excp_vec=
tors[POWERPC_EXCP_DTLB]     =3D 0x00000000;</div><div>&gt;     env-&gt;ex=
cp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00000000;</div><div>&gt;     env-=
&gt;excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00000000;</div><div>&gt; + =
   /*</div><div>&gt; +     * These two are the same IVOR as POWERPC_EXCP_=
VPU and</div><div>&nbsp;</div><div>Maybe clearar to say "The next two" or=
 even "SPEU and EFPDI are the </div><div>same..." then no need for the ex=
tra empty line but not a big deal.</div><div>&nbsp;</div><div>Regards,</d=
iv><div>BALATON Zoltan</div><div>&nbsp;</div><div>&gt; +     * POWERPC_EX=
CP_VPUA. We deal with that when dispatching at</div><div>&gt; +     * pow=
erpc_excp().</div><div>&gt; +     */</div><div>&gt;     env-&gt;excp_vect=
ors[POWERPC_EXCP_SPEU]     =3D 0x00000000;</div><div>&gt;     env-&gt;exc=
p_vectors[POWERPC_EXCP_EFPDI]    =3D 0x00000000;</div><div>&gt; +</div><d=
iv>&gt;     env-&gt;excp_vectors[POWERPC_EXCP_EFPRI]    =3D 0x00000000;</=
div><div>&gt;     env-&gt;ivor_mask =3D 0x0000FFF7UL;</div><div>&gt;     =
env-&gt;ivpr_mask =3D ivpr_mask;</div><div>&gt; diff --git a/target/ppc/e=
xcp_helper.c b/target/ppc/excp_helper.c</div><div>&gt; index 17607adbe4..=
7bb170f440 100644</div><div>&gt; --- a/target/ppc/excp_helper.c</div><div=
>&gt; +++ b/target/ppc/excp_helper.c</div><div>&gt; @@ -344,6 +344,16 @@ =
static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp=
)</div><div>&gt;         excp =3D POWERPC_EXCP_PROGRAM;</div><div>&gt;   =
  }</div><div>&gt;&nbsp;</div><div>&gt; +#ifdef TARGET_PPC64</div><div>&g=
t; +    /*</div><div>&gt; +     * SPEU and VPU share the same IVOR but th=
ey exist in different</div><div>&gt; +     * processors. SPEU is e500v1/2=
 only and VPU is e6500 only.</div><div>&gt; +     */</div><div>&gt; +    =
if (excp_model =3D=3D POWERPC_EXCP_BOOKE &amp;&amp; excp =3D=3D POWERPC_E=
XCP_VPU) {</div><div>&gt; +        excp =3D POWERPC_EXCP_SPEU;</div><div>=
&gt; +    }</div><div>&gt; +#endif</div><div>&gt; +</div><div>&gt;     sw=
itch (excp) {</div><div>&gt;     case POWERPC_EXCP_NONE:</div><div>&gt;  =
       /* Should never happen */</div><div>&gt; @@ -569,7 +579,7 @@ stati=
c inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)</di=
v><div>&gt;             cpu_abort(cs, "Debug exception triggered on unsup=
ported model\n");</div><div>&gt;         }</div><div>&gt;         break;<=
/div><div>&gt; -    case POWERPC_EXCP_SPEU:      /* SPE/embedded floating=
-point unavailable  */</div><div>&gt; +    case POWERPC_EXCP_SPEU:   /* S=
PE/embedded floating-point unavailable/VPU  */</div><div>&gt;         env=
-&gt;spr[SPR_BOOKE_ESR] =3D ESR_SPV;</div><div>&gt;         break;</div><=
div>&gt;     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data=
 interrupt   */</div><div>&gt;&nbsp;<br><br><br><br><div>I have tried to =
launch a freshly compiled qemu from git master on a NXP T2080RDB devkit t=
hat has a e6500 CPU in combination with a freshly compiled kernel 5.16-rc=
6</div><div>I have Debian SID ppc64 up and running using such a kernel, a=
nd when I launch qemu to run a VM with the same debian sid for ppc64 and =
the same kernel using --enable-kvm I end up with a kernel panic</div><div=
><br></div><div>[....]</div><div>Run /sbin/init as init process</div><div=
>random: fast init done</div><div>systemd[1]: illegal instruction (4) at =
3fff96562ac8 nip 3fff96562ac8 lr 3fff96562aa8 code 1 in libc-2.32.so[3fff=
96516000+1f7000]</div><div>systemd[1]: code: 60000000 38600006 9122b7e8 4=
801bead 60000000 60000000 8122b7e8 2c090004&nbsp;</div><div>systemd[1]: c=
ode: 40820014 39200005 60000000 9122b7e8 &lt;00000000&gt; 60000000 8122b7=
e8 2c090005&nbsp;</div><div>Kernel panic - not syncing: Attempted to kill=
 init! exitcode=3D0x00000004</div><div>Rebooting in 180 seconds..</div><d=
iv><br></div><div>On the positive side, for the first time I am not flood=
ed by milions kernel error messages from the serial console attached to t=
he devkit, not a single error spitted out from it, great!</div><div><br><=
/div><div>The kernel config file I used</div><div>https://repo.powerprogr=
ess.org/t2080rdb/qemu/kernel_5.16-rc6.config</div><div><br></div><div>The=
 resulting kernel</div><div>https://repo.powerprogress.org/t2080rdb/qemu/=
uImage_5.16-rc6</div><div><br></div><div>The complete console output I ge=
t when configuring qemu before compilation</div><div>https://repo.powerpr=
ogress.org/t2080rdb/qemu/2021-12-25_qemu_git_configure_on_ppc64.txt</div>=
<div><br></div><div>The complete console output that end up with the kern=
el panic when launching qemu</div><span style=3D"background-color: transp=
arent;">https://repo.powerprogress.org/t2080rdb/qemu/2021-12-25_qemu_ppc6=
4_e6500_kvm_debian_sid_log.txt<br>&nbsp;</span><br><br></div></div></div>=

--_=__=_XaM3_.1640458001.2A.215154.42.31989.52.42.007.2012335712--


