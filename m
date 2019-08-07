Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66D848A2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 11:30:25 +0200 (CEST)
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvIH2-0000ml-DU
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 05:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hvIGX-0000Md-JJ
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hvIGW-0007eC-MQ
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:29:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49368)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hvIGW-0007cr-Gf
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:29:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2D49135E2
 for <qemu-devel@nongnu.org>; Wed,  7 Aug 2019 09:29:51 +0000 (UTC)
Received: from localhost (ovpn-117-144.ams2.redhat.com [10.36.117.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E3F55DA60;
 Wed,  7 Aug 2019 09:29:49 +0000 (UTC)
Date: Wed, 7 Aug 2019 10:29:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190807092948.GD13267@stefanha-x1.localdomain>
References: <20190806151435.10740-1-armbru@redhat.com>
 <20190806151435.10740-7-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190806151435.10740-7-armbru@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 07 Aug 2019 09:29:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 06/29] trace: Eliminate use of
 TARGET_FMT_plx
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 06, 2019 at 05:14:12PM +0200, Markus Armbruster wrote:
> hw/tpm/trace-events uses TARGET_FMT_plx formats with uint64_t
> arguments.  That's wrong, TARGET_FMT_plx takes hwaddr.  Since hwaddr
> happens to be uint64_t, it works anyway.  Messed up in commit
> ec427498da5, v2.12.0.  Clean up by replacing TARGET_FMT_plx with its
> macro expansion.
>=20
> scripts/tracetool/format/log_stap.py (commit 62dd1048c0b, v4.0.0) has
> a special case for TARGET_FMT_plx.  Delete it.
>=20
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/tpm/trace-events                  | 4 ++--
>  scripts/tracetool/format/log_stap.py | 3 ---
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

