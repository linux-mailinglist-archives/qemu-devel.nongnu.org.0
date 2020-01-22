Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1521457D9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 15:29:01 +0100 (CET)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuH08-000759-Db
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 09:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iuGxv-0004Il-DY
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 09:26:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iuGxs-0002Zw-S9
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 09:26:41 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21339
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iuGxs-0002XJ-OK
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 09:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579703199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPF/7vNfdWEVnpVNyPyiAge7xzKfru5MBOrf7zxqgKk=;
 b=UCRidoJ07oEDoyXXDAOXCgjtYg3AZWX6WsDpfcEDrSQodomjO+x2qHe+QFDiMkXTopJyxH
 51p8OGPzYF6NwSDm57oIk1yuGIq1YJYytee9j6CTBk334Up71LUxdDV4/Ix85eLkxsA+va
 m/1tb1bSO+2FtAq8wN3/b7Yi7adcfgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-sboeN6hLNQO3Fotwncbvzg-1; Wed, 22 Jan 2020 09:26:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC8E8010C9;
 Wed, 22 Jan 2020 14:26:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC75287EC2;
 Wed, 22 Jan 2020 14:26:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA91E9D6A; Wed, 22 Jan 2020 15:26:34 +0100 (CET)
Date: Wed, 22 Jan 2020 15:26:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Maintainers, please add Message-Id: when merging patches
Message-ID: <20200122142634.libvymo4g5pp35rs@sirius.home.kraxel.org>
References: <CAJSP0QX22cYJvnpb+zDDXLaYg0yY4CV3Jn5QY+ExxJyFcmQ3Gw@mail.gmail.com>
 <87v9p3znas.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87v9p3znas.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: sboeN6hLNQO3Fotwncbvzg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 22, 2020 at 12:30:03PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>=20
> > Around 66% of qemu.git commits since v4.1.0 include a Message-Id: tag. =
 Hooray!
> >
> > Message-Id: references the patch email that a commit was merged from.
> > This information is helpful to anyone wishing to refer back to email
> > discussions and patch series.
>=20
> So I guess the ones that don't are maintainer originated patches unless
> you actively rebuild your trees from a posted series?

This is what I usually do, using Stefan's "patches" utility.  That'll
pick up both message-id and any tested/reviewed/acked-by tags in
replies.

cheers,
  Gerd


