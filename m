Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A02118B8E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 15:53:04 +0100 (CET)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iegso-0002Ru-Sv
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 09:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iegry-0001vD-8X
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 09:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iegrw-0007HX-EA
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 09:52:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48745
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iegrw-0007HK-9c
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 09:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575989527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kl3y2nRLpVjpeT4A8xtD0bXCCaHoMdQqsPUPwYRJT7Q=;
 b=Fhx1Yh8TnUZlNtB6kjjEyfpqcPX8OS7aZWpHpt/8N13oxsbthOE+VLPw9nnj/MeHE7alvU
 J+nikJX3X7tx46h5QuE1gJXWsnmattN3/ICTfBEmgbqQ+3RxPjfd+GpOLROX9iEs1M0D3O
 7uQQaLL8WrWomPTpkeVsMvU5gqwPUb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-BPDsgNo0NdmrzO3uq65m7w-1; Tue, 10 Dec 2019 09:52:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64E68DB81;
 Tue, 10 Dec 2019 14:52:03 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-11.ams2.redhat.com [10.36.117.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E3D10016DA;
 Tue, 10 Dec 2019 14:51:59 +0000 (UTC)
Date: Tue, 10 Dec 2019 15:51:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qapi: better document NVMe blockdev @device parameter
Message-ID: <20191210145152.GA7103@linux.fritz.box>
References: <20191206143811.3777524-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191206143811.3777524-1-berrange@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: BPDsgNo0NdmrzO3uq65m7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.12.2019 um 15:38 hat Daniel P. Berrang=E9 geschrieben:
> Mention that this is a PCI device address & give the format it is
> expected it. Also mention that it must be first unbound from any
> host kernel driver.
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Thanks, applied to the block branch.

Kevin


