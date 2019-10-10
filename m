Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE0D27F1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 13:27:57 +0200 (CEST)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIWbs-0007nO-Sa
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 07:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iIWb5-0007Ng-PA
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iIWb0-0003Su-V4
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:27:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36670)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>)
 id 1iIWay-0003SC-PF; Thu, 10 Oct 2019 07:27:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6A63C054C58;
 Thu, 10 Oct 2019 11:26:59 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3A05D6B7;
 Thu, 10 Oct 2019 11:26:52 +0000 (UTC)
Date: Thu, 10 Oct 2019 13:26:50 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/1] IDE: deprecate ide-drive
Message-ID: <20191010112650.GR6129@angien.pipo.sk>
References: <20191009224303.10232-1-jsnow@redhat.com>
 <20191009224303.10232-2-jsnow@redhat.com>
 <518ae20b-049d-19ee-1e86-c48466ba0655@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <518ae20b-049d-19ee-1e86-c48466ba0655@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 10 Oct 2019 11:26:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 10, 2019 at 13:22:37 +0200, Philippe Mathieu-Daud=E9 wrote:
> On 10/10/19 12:43 AM, John Snow wrote:
> > It's an old compatibility shim that just delegates to ide-cd or ide-h=
d.
> > I'd like to refactor these some day, and getting rid of the super-obj=
ect
> > will make that easier.
> >=20
> > Either way, we don't need this.
> >=20
> > Libvirt-checked-by: Peter Krempa <pkrempa@redhat.com>
>=20
> Peter made a comment regarding Laszlo's Regression-tested-by tag:
>=20
>   [...] nobody else is using
>   this convention (there are exactly 0 instances of
>   "Regression-tested-by" in the project git log as far as
>   I can see), and so in practice people reading the commits
>   won't really know what you meant by it. Everybody else
>   on the project uses "Tested-by" to mean either of the
>   two cases you describe above, without distinction...
>=20
> It probably applies to 'Libvirt-checked-by' too.

I certainly didn't test it. So feel free to drop that line altogether.

