Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D58A6CC3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 17:20:10 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5AbJ-0002qH-1H
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 11:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i5AaP-0002Ne-U4
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:19:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i5AaM-0001Wt-7T
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:19:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58224)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i5AaI-0001TK-2y
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:19:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99CD5308427D;
 Tue,  3 Sep 2019 15:19:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-245.rdu2.redhat.com
 [10.10.123.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6A4A60C5D;
 Tue,  3 Sep 2019 15:19:00 +0000 (UTC)
Date: Tue, 3 Sep 2019 11:18:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190903151859.GB14836@localhost.localdomain>
References: <20190829013125.GG16342@umbus.fritz.box>
 <20190829015117.GH16342@umbus.fritz.box>
 <20190829032746.GA488@localhost.localdomain>
 <24d0d5be-d206-33a0-cd8c-29825e2f8516@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <24d0d5be-d206-33a0-cd8c-29825e2f8516@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 03 Sep 2019 15:19:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Cryptic errors from PIP install if missing
 openssl-devel
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
Cc: ldoktor@redhat.com, qemu-devel@nongnu.org, ehabkost@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 29, 2019 at 11:24:30AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Is there a way to check for this before submitting/merging patches?
>=20
> Some checkpatch.py lines that report:
>=20
>   The 'paramiko' module is not pure Python and can
>   not be added in requirements.txt.
>

I dont think there is... at least, I can't think of one.  None of the
PyPI classifiers[1] seems to cover the "pure Python .vs. compiled
code" installation requirements.  AFAIK, this is usually buried in the
setup.py code of each package, so it's not easy to inspect it.

But, we can define "only Pure Python modules" as a policy, document it
and hopefully flag it on code review.

[1] https://pypi.org/classifiers/

- Cleber.

