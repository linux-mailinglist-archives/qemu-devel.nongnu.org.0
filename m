Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9C99652
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 16:22:21 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nym-0000JN-HH
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 10:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i0nxg-00089T-Eh
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:21:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i0nxf-00087K-Dj
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:21:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52032)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i0nxf-000876-3m
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:21:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D6E1180158A
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 14:21:10 +0000 (UTC)
Received: from localhost (ovpn-116-73.gru2.redhat.com [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB4B760606;
 Thu, 22 Aug 2019 14:21:09 +0000 (UTC)
Date: Thu, 22 Aug 2019 11:21:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190822142108.GM7077@habkost.net>
References: <20190822100412.23746-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190822100412.23746-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 22 Aug 2019 14:21:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] qapi: report the default CPU type for
 each machine
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 11:04:12AM +0100, Daniel P. Berrang=E9 wrote:
> When user doesn't request any explicit CPU model with libvirt or QEMU,
> a machine type specific CPU model is picked. Currently there is no way
> to determine what this QEMU built-in default is, so libvirt cannot
> report this back to the user in the XML config.
>=20
> This extends the "query-machines" QMP command so that it reports the
> default CPU model typename for each machine.
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Sorry for making this miss 4.1.  Queueing now.

--=20
Eduardo

