Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D767146EA8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:48:14 +0100 (CET)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iufeO-0003mz-5D
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1iue4z-0000p4-CA
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:07:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1iue4x-0005Vc-Ma
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:07:32 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:10188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1iue4x-0005Dr-GA
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:07:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 52682748DC8;
 Thu, 23 Jan 2020 16:07:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 375D57482CB; Thu, 23 Jan 2020 16:07:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 361227482D2;
 Thu, 23 Jan 2020 16:07:19 +0100 (CET)
Date: Thu, 23 Jan 2020 16:07:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 06/80] alpha:dp264: use memdev for RAM
In-Reply-To: <1579779525-20065-7-git-send-email-imammedo@redhat.com>
Message-ID: <alpine.BSF.2.21.99999.352.2001231605230.72857@zero.eik.bme.hu>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-7-git-send-email-imammedo@redhat.com>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-504206108-1579792039=:72857"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-504206108-1579792039=:72857
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jan 2020, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>  MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> hw/alpha/alpha_sys.h | 2 +-
> hw/alpha/dp264.c     | 3 ++-
> hw/alpha/typhoon.c   | 8 ++------
> 3 files changed, 5 insertions(+), 8 deletions(-)

This still has a : instead of / in the patch title. Maybe should be=20
alpha/dp264: ... Probably does not worth a respin but you could correct i=
t=20
if there will be another version for some other reason or when applying=20
it.

Regrards,
BALATON Zoltan
--3866299591-504206108-1579792039=:72857--

