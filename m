Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558C402A45
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:55:17 +0200 (CEST)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbZE-0000Cy-Jx
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1mNbGB-0005i7-Qq
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:35:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:56936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1mNbG7-0006fU-Oj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:35:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9BF5610FE;
 Tue,  7 Sep 2021 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631021729;
 bh=HD4rkP9Blj9Y5WOIdFQn1TbapreeCYGgIwMi4XiVRXY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pDDrgnZoOjjv70goW0chta6WYvkizgXXKIgFchG8Cd+rIUHj2iXAFU3tOA5KGI5RY
 5axJlOYjNwghS+NKkwoae0YZFFJHQts8aTI94U2NmmTAmhUY9QdEBPzSIBx8Ob3w6L
 tX0o7ulxwUQZwgNVMkN2vDdkorxQ3PMp/p/9LlnAfc+BviJZwaD8cfeWDkabTmtTyN
 AjRNkFZ72ZrlAXh+WCvpl6+P6Ejjy3eOPKp0JZmPkuUJMq5m/suz7TG8p6YTcHRyWq
 /irb4aNF8aSz5jurpf5zdIzQDhhVCAm0OC0Jb5Axa9xpr+PN5G71JSs1ahnefxeKVU
 O4380934Fhnaw==
Message-ID: <5f8f7be48650a6af3d7161dbfb3589cf5f0ef391.camel@kernel.org>
Subject: Re: [PATCH v4 00/33] Qemu SGX virtualization
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 07 Sep 2021 16:35:26 +0300
In-Reply-To: <20210907095120.GC18368@yangzhon-Virtual>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <CABgObfYSXDvif5Rd8Bz-9VOjhj4sBai5msnwVySbXj6e1=Wa4A@mail.gmail.com>
 <20210907095120.GC18368@yangzhon-Virtual>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=198.145.29.99; envelope-from=jarkko@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-09-07 at 17:51 +0800, Yang Zhong wrote:
> On Mon, Sep 06, 2021 at 03:13:08PM +0200, Paolo Bonzini wrote:
> > Hi,
> >=20
> > the monitor patches did not pass the test-hmp qtest, and also they
> > should be in target/i386/monitor.c (see other commands that were
> > implemented there for SEV).  However, I've sent a pull request with
> > the rest.
> >=20
>  =20
>   Paolo, I have moved hmp and qmp codes to target/i386/monitor.c and also
>   fixed the issue with test tool(tests/qtest/test-hmp). This issue is cau=
sed
>   by 'machine none' test in the hmp, the previous patches only covered qm=
p
>   test in 'machine none' with Libvirt.
>=20
>   So, the next issue:
>   1) re-send all sgx basic patches(including monitors patches) to you?
>   2) only send monitor patches in the next phase when the basic sgx patch=
es
>      are merged?=20
>=20
>   Regards,
>=20
>   Yang
>=20
> =20
> > Thanks,
> >=20
> > Paolo
> >=20
> > On Mon, Jul 19, 2021 at 1:27 PM Yang Zhong <yang.zhong@intel.com> wrote=
:
> > > Since Sean Christopherson has left Intel and i am responsible for Qem=
u SGX
> > > upstream work. His @intel.com address will be bouncing and his new em=
ail(
> > > seanjc@google.com) is also in CC lists.
> > >=20
> > > This series is Qemu SGX virtualization implementation rebased on late=
st
> > > Qemu release. The numa support for SGX will be sent in another patchs=
et
> > > once this basic SGX patchset are merged.
> > >=20
> > > You can find Qemu repo here:
> > >=20
> > >     https://github.com/intel/qemu-sgx.git upstream
> > >=20
> > > If you want to try SGX, you can directly install the linux release(at=
 least 5.13.0-rc1+)
> > > since kvm SGX has been merged into linux release.
> > >=20
> > >     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
> > >=20
> > > To simplify, you'd better install linux on host and guest, which can =
support
> > > SGX on host and guest kernel. And to me, use below reference command =
to boot
> > > SGX guest:
> > >=20
> > >     #qemu-system-x86_64 \
> > >         ...... \
> > >         -cpu host,+sgx-provisionkey \
> > >         -object memory-backend-epc,id=3Dmem1,size=3D64M,prealloc=3Don=
 \
> > >         -object memory-backend-epc,id=3Dmem2,size=3D28M \

I would call these just "memory-backend-sgx".

> > >         -M sgx-epc.0.memdev=3Dmem1,sgx-epc.1.memdev=3Dmem2
> > >=20
> > > Overview
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >=20
> > > Intel Software Guard eXtensions (SGX) is a set of instructions and me=
chanisms
> > > for memory accesses in order to provide security accesses for sensiti=
ve
> > > applications and data. SGX allows an application to use it's pariticu=
lar
> > > address space as an *enclave*, which is a protected area provides con=
fidentiality
> > > and integrity even in the presence of privileged malware. Accesses to=
 the
> > > enclave memory area from any software not resident in the enclave are=
 prevented,
> > > including those from privileged software.
> > >=20
> > > SGX virtaulization
          ~~~~~~~~~~~~~~
	  virtualization

I'm using these patches now instead of "real" hardwave. It seems that
9th gen cores are now Linux compatible SGX. Maybe some ucode update
has changed this because I don't recall this working before.


/Jarkko


