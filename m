Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41912659B0A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 18:45:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBJQr-0001zL-53; Fri, 30 Dec 2022 12:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1pBJQp-0001z1-6m
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 12:44:35 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1pBJQm-0004ZG-Uz
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 12:44:34 -0500
Received: from smtpclient.apple
 (dynamic-095-117-127-254.95.117.pool.telefonica.de [95.117.127.254])
 by csgraf.de (Postfix) with ESMTPSA id 0CE8760803E4;
 Fri, 30 Dec 2022 18:44:25 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: qemu-system-i386: Could not install MSR_CORE_THREAD_COUNT
 handler: Success
Date: Fri, 30 Dec 2022 18:44:14 +0100
Message-Id: <13D59483-BE6C-4AB5-AAB8-78B3A03D96E7@csgraf.de>
References: <20221230142222.r3ahbntnlvj7jpc2@altlinux.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Alexey Shabalin <shaba@basealt.ru>, "Dmitry V. Levin" <ldv@altlinux.org>
In-Reply-To: <20221230142222.r3ahbntnlvj7jpc2@altlinux.org>
To: Vitaly Chikunov <vt@altlinux.org>
X-Mailer: iPhone Mail (20C65)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Vitaly,

This is a kvm kernel bug and should be fixed with the latest stable releases=
. Which kernel version are you running?

Thanks,

Alex


> Am 30.12.2022 um 15:30 schrieb Vitaly Chikunov <vt@altlinux.org>:
>=20
> =EF=BB=BFHi,
>=20
> QEMU 7.2.0 when run on 32-bit x86 architecture fails with:
>=20
>  i586$ qemu-system-i386 -enable-kvm
>  qemu-system-i386: Could not install MSR_CORE_THREAD_COUNT handler: Succes=
s
>  i586$ qemu-system-x86_64 -enable-kvm
>  qemu-system-x86_64: Could not install MSR_CORE_THREAD_COUNT handler: Succ=
ess
>=20
> Minimal reproducer is `qemu-system-i386 -enable-kvm'. And this only
> happens on x86 (linux32 personality and binaries on x86_64 host):
>=20
>  i586$ file /usr/bin/qemu-system-i386
>  /usr/bin/qemu-system-i386: ELF 32-bit LSB pie executable, Intel 80386, ve=
rsion 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[=
sha1]=3D0ba1d953bcb7a691014255954f060ff404c8df90, for GNU/Linux 3.2.0, strip=
ped
>  i586$ /usr/bin/qemu-system-i386 --version
>  QEMU emulator version 7.2.0 (qemu-7.2.0-alt1)
>  Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
>=20
> Thanks,
>=20

