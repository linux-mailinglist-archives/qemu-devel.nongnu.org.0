Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8E1B2D2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 11:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ7Cv-0004OG-76
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 05:25:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hQ78g-0001Bx-QK
	for qemu-devel@nongnu.org; Mon, 13 May 2019 05:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hQ6tL-0008OB-HY
	for qemu-devel@nongnu.org; Mon, 13 May 2019 05:05:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hQ6tK-0008Ml-V7
	for qemu-devel@nongnu.org; Mon, 13 May 2019 05:05:03 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0EE54E90E;
	Mon, 13 May 2019 09:05:00 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C95668D74;
	Mon, 13 May 2019 09:04:45 +0000 (UTC)
Date: Mon, 13 May 2019 11:04:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190513110440.7b03eb0d@Igors-MacBook-Pro>
In-Reply-To: <20190512141838-mutt-send-email-mst@kernel.org>
References: <1556808723-226478-2-git-send-email-imammedo@redhat.com>
	<20190512141838-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 13 May 2019 09:05:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 01/15] tests: acpi: rename
 acpi_parse_rsdp_table() into acpi_fetch_rsdp_table()
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
Cc: Andrew Jones <drjones@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	linuxarm@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Wei Yang <richardw.yang@linux.intel.com>, xuwei5@huawei.com,
	xuwei5@hisilicon.com,
	Philippe =?UTF-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 12 May 2019 14:19:08 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, May 02, 2019 at 04:51:49PM +0200, Igor Mammedov wrote:
> > so name would reflect what the function does
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
> > ---
> > v4:
> >  * make it as the first patch in series
> > ---
>=20
>=20
> FYI this trips up git am.
> Don't do two --- please: just one is enough,
> second is not needed.

strange, git am works for me just fine.
I've always formated par patch comments this way and I think it's rather
common approach on the list.

What version of git do you use?

Anyways,
shall I rebase and resend series? (it doesn't apply to master anymore)

>=20
[...]


