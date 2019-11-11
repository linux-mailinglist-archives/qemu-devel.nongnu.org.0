Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A159F77EF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 16:43:03 +0100 (CET)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUBqI-00049U-CZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 10:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iUBpE-0003ge-8Q
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:41:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iUBpC-0008Qs-I1
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:41:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52426
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iUBpC-0008QX-Cz
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573486913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qiFh49z/4FUvkeESVBzSPk/Butf+TAYoi/7TqhW0TDY=;
 b=GR+M7yonKJZT77t8iv5572n4COR8ZqCF8budqawjcjBFHXxSd1CdazMCybQlIniTIVDOYw
 ZW2tQdvaWXiv4Ws7GIy+EKqTI1yroNSK/JYHlrCHKXch/YqfeTYokanQP3iF+IBHgAq1st
 OCE7bfsKSB0Z2d/bOFprkwuYRnhJjXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-uL9jqmW8MWmnrdP6id9GqA-1; Mon, 11 Nov 2019 10:41:52 -0500
X-MC-Unique: uL9jqmW8MWmnrdP6id9GqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37AEE107ACC4;
 Mon, 11 Nov 2019 15:41:51 +0000 (UTC)
Received: from localhost (ovpn-117-169.ams2.redhat.com [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 414125D9C9;
 Mon, 11 Nov 2019 15:41:45 +0000 (UTC)
Date: Mon, 11 Nov 2019 15:41:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [RFC v4 PATCH 48/49] multi-process: add the concept description
 to docs/devel/qemu-multiprocess
Message-ID: <20191111154144.GE402228@stefanha-x1.localdomain>
References: <cover.1571905346.git.jag.raman@oracle.com>
 <1ee67238bd543959c3218612bff4acca06d15baa.1571905346.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1ee67238bd543959c3218612bff4acca06d15baa.1571905346.git.jag.raman@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, thuth@redhat.com,
 john.g.johnson@oracle.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 quintela@redhat.com, berrange@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, ross.lagerwall@citrix.com,
 kanth.ghatraju@oracle.com, kraxel@redhat.com, kwolf@redhat.com,
 pbonzini@redhat.com, liran.alon@oracle.com, marcandre.lureau@gmail.com,
 mreitz@redhat.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 05:09:29AM -0400, Jagannathan Raman wrote:
> +Accelerating device emulation
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The messages that are required to be sent between QEMU and the emulation
> +process can add considerable latency to IO operations. The optimizations
> +described below attempt to ameliorate this effect by allowing the
> +emulation process to communicate directly with the kernel KVM driver.
> +The KVM file descriptors created wold be passed to the emulation process

s/wold/would/

I skipped the acceleration section for now because they require kvm.ko
changes.  I'll focus the remainder of the review on the patches as they
are now.

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3JgTgACgkQnKSrs4Gr
c8j1Qwf+Nz3KNlWndGiyRaKrhevQJauYwLulUBdJQTr/9hDJyTqXu5pYaOErZNQh
jdCTOiGJ2Hi7m2NuWsOGefs9H+I+KwjUx4x5jbGGTWiaYw20TYFT7VwUSk06Rstg
vQ12x1b6xx0JV1/GVb8tzA3dvcmtfYrZSp7UVOrXoOHsntqWWaKIJmI4dCY7rGj4
zv40CxqBCJbge450OdXcKXn7YkCzyrswcm1+5OvNXzEj9hc/tp2JHLoFRQ3HVuZA
68SFi0tzfpfwIXRrCNso7p/SB3vHyUgmC0qzsxJczKbDUcUNdcD2Zionecv/tQ2d
pzda8lfk8y6MOon/I6lkSx9jmpBuRA==
=aQqo
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--


