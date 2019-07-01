Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9E2179C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 13:24:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRayJ-0002YN-Gx
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 07:24:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hRalz-0002eq-96
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hRaly-0008TV-A9
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:11:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hRaly-0008PT-4j
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:11:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F63830C0DD5;
	Fri, 17 May 2019 11:11:27 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7185D6A9;
	Fri, 17 May 2019 11:11:23 +0000 (UTC)
Date: Fri, 17 May 2019 13:11:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190517131116.02b25408@Igors-MacBook-Pro>
In-Reply-To: <20190517005114.19456-1-richardw.yang@linux.intel.com>
References: <20190517005114.19456-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 17 May 2019 11:11:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/acpi: ACPI_PCI should depends on both
 ACPI and PCI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 May 2019 08:51:14 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> Pointed out by Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  hw/acpi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 7265843cc3..7c59cf900b 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -25,7 +25,7 @@ config ACPI_NVDIMM
> =20
>  config ACPI_PCI
>      bool
> -    depends on ACPI
> +    depends on ACPI && PCI
> =20
>  config ACPI_VMGENID
>      bool

are you sure you didn't miss anything?

On Fri, 17 May 2019 10:37:42 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

[...]
>=20
> config ARM_VIRT
>     ...
>     select ACPI_PCI
>=20
> config ACPI_PCI
>     bool
>     depends on ACPI && PCI
>=20



