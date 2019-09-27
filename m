Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF1CBFCC3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 03:41:01 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDfFk-00089Z-3Y
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 21:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40141)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDcMo-0000o3-57
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 18:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDcMk-0003WL-1I
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 18:36:03 -0400
Received: from linux.microsoft.com ([13.77.154.182]:34104)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>)
 id 1iDcMg-0003Ph-7E; Thu, 26 Sep 2019 18:35:58 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id D226B2008710;
 Thu, 26 Sep 2019 15:35:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D226B2008710
Subject: Re: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: qemu-arm <qemu-arm@nongnu.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 qemu-devel@nongnu.org
References: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
Message-ID: <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
Date: Thu, 26 Sep 2019 15:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 13.77.154.182
X-Mailman-Approved-At: Thu, 26 Sep 2019 21:39:40 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/19 8:17 AM, Lakshmi Ramasubramanian wrote:

The following commit for ARM Trusted Firmware for QEMU virt ARMv8-A
is almost 3 years old

https://salsa.debian.org/debian/atf-allwinner/commit/b6b671c4ac4bd5595306=
863225bb3bece1e6135c

Current limitations:
* Only cold boot is supported
* No build instructions for QEMU_EFI.fd and rootfs-arm64.cpio.gz
* No instructions for how to load a BL32 (Secure Payload)

So looks like only cold boot is supported (no kexec support)
Is this correct?

> When I execute kexec ("kexec -l <kernel>", followed by "kexec -e") I hi=
t=20
> the following assert (in arm-trusted-firmware/plat/qemu/qemu_pm.c)
>=20
> /**********************************************************************=
*********=20
>=20
>  =C2=A0* Platform handler called when a power domain is about to be tur=
ned
>  =C2=A0* off. The target_state encodes the power state that each level =
should
>  =C2=A0* transition to.
> ***********************************************************************=
*******/=20
>=20
> void qemu_pwr_domain_off(const psci_power_state_t *target_state)
> {
>  =C2=A0=C2=A0=C2=A0=C2=A0assert(0);
> }
>=20
> Is kexec supported in ARM64 QEMU (qemu-system-aarch64) -
> using arm-trusted-firmware, optee, and u-boot?
>=20
> Thanks,
>  =C2=A0-lakshmi


