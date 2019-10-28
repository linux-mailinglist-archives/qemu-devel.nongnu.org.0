Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C0E7543
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 16:35:14 +0100 (CET)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP733-0005CY-0R
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 11:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iP6qr-0008Ic-Gs
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iP6em-0007mm-PH
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:10:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59983
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iP6em-0007m8-Ke
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572275408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKrOf5+nn2VT/VSeFYo/e6T5Dq3KPaaw/XUkDO/RAOM=;
 b=WOZa1SPY5zIqY43a+xqFw/uZNrPfkTIm4S61Yse20xDnHZTgOCiBWJDdL3UlTEX4TOx6lr
 5CctgLgKRglKUUzbUsYSnKpjj4RovZAVebwQq9locFM/GQvDRFgkU40tXkyN39kBid36uQ
 lfECT3UVoDm8S6kz758Avj2DtTsKa/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-HVrT-9xHMLywe2LKre7N8A-1; Mon, 28 Oct 2019 11:10:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764BD107AD28;
 Mon, 28 Oct 2019 15:10:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25E5A5D9C5;
 Mon, 28 Oct 2019 15:10:01 +0000 (UTC)
Date: Mon, 28 Oct 2019 11:09:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Subject: Re: [PATCH 02/26] Acceptance tests: refactor wait_for_console_pattern
Message-ID: <20191028150959.GB965@localhost.localdomain>
References: <20191028073441.6448-1-philmd@redhat.com>
 <20191028073441.6448-3-philmd@redhat.com>
 <CAL1e-=h41H6h-pFDqQY3uwrghaptpkoiwQ-=Hfc9sv=DfRYkDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL1e-=h41H6h-pFDqQY3uwrghaptpkoiwQ-=Hfc9sv=DfRYkDw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: HVrT-9xHMLywe2LKre7N8A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Kamil Rytarowski <kamil@netbsd.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 28, 2019 at 08:58:01AM +0100, Aleksandar Markovic wrote:
> On Monday, October 28, 2019, Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> wrote:
>=20
> > From: Cleber Rosa <crosa@redhat.com>
> >
> > The same utility method is already present in two different test
> > files, so let's consolidate it into a single utility function.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Message-Id: <20190916164011.7653-1-crosa@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > [PMD: failure_message is optional]
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 25 +++++++++++++++++++++
> >  tests/acceptance/boot_linux_console.py    | 27 +++++------------------
> >  tests/acceptance/linux_ssh_mips_malta.py  | 18 +++------------
> >  3 files changed, 33 insertions(+), 37 deletions(-)
> >
> >
>=20
> You missed my r-b, that I gave here:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg06378.html
>=20
> A.
>

Hi Aleksandar,

I've collected your review, it'll be on my PR.

Thanks!
- Cleber.


