Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0117EA6A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 21:49:08 +0100 (CET)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBPKl-0004cJ-RJ
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 16:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jBPIy-00039Q-M7
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 16:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jBPIx-0003Au-Ll
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 16:47:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39324
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jBPIx-0003Ac-I2
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 16:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583786834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kS1zLFSPjGuSSGnVJ7CKIyWH9v4uCgmEuqTVMWVya8=;
 b=Td5WY/jxiSjOlQ2qRZ0m8eWvYLn3upTWiCrNEL6MYBunxs9KMABCrNLCLGxn0N9GTNaErN
 DkR4/b7yq74YoeFz8zr0RwMFCdHu7VwAoIqLgZrhQ/NnnfiUV3QvdQRUgE7b1qkaqk6cXS
 Oy6UIasmH1R8wgrCZ6ByPldaejt9Ygw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-HNDgzS3tOwW7teK9pM2yow-1; Mon, 09 Mar 2020 16:47:12 -0400
X-MC-Unique: HNDgzS3tOwW7teK9pM2yow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4319D800D4E;
 Mon,  9 Mar 2020 20:47:11 +0000 (UTC)
Received: from localhost (ovpn-121-235.rdu2.redhat.com [10.10.121.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A6CD26370;
 Mon,  9 Mar 2020 20:47:10 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:47:05 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] machine/memory encryption: Disable mem merge
Message-ID: <20200309204705.GE1187748@habkost.net>
References: <20200130175046.85850-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200130175046.85850-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: aarcange@redhat.com, brijesh.singh@amd.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 30, 2020 at 05:50:46PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> When a host is running with memory encryption, the memory isn't visible
> to the host kernel; attempts to merge that memory are futile because
> what it's really comparing is encrypted memory, usually encrypted
> with different keys.
>=20
> Automatically turn mem-merge off when memory encryption is specified.
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1796356
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued, thanks.

--=20
Eduardo


