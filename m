Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F21C1D3A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 20:32:45 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUaSq-0000aF-IO
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 14:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jUaPT-0006ug-Em
 for qemu-devel@nongnu.org; Fri, 01 May 2020 14:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jUaPS-00081T-1g
 for qemu-devel@nongnu.org; Fri, 01 May 2020 14:29:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30526
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jUaPR-0007of-Ey
 for qemu-devel@nongnu.org; Fri, 01 May 2020 14:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588357751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d69QJWYJxT8D7Hp9SNmJkniTyh/l3d6v0/k2+qX2T24=;
 b=fY6N4qrhV7QjxuKxI/f/VEzsPy1nKgBeLLgO1n2gJ59wOQ9aFqQaybelywIumMZuNrS7Vk
 Lq3GrDsCbpx7L/KUZol/qPSPJ9qsLDQE7aA3+8zFEOiQKqOGbIA0gxqo8MpNyIYK5BAPoK
 QI7xPaSpgVmNRa3oEl2G/9rK2kRkBqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-IOlQkofBPDKFxI9BA97DrA-1; Fri, 01 May 2020 14:29:07 -0400
X-MC-Unique: IOlQkofBPDKFxI9BA97DrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD28E107ACCD
 for <qemu-devel@nongnu.org>; Fri,  1 May 2020 18:29:06 +0000 (UTC)
Received: from work-vm (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11A526084A;
 Fri,  1 May 2020 18:29:00 +0000 (UTC)
Date: Fri, 1 May 2020 19:28:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] virtiofsd: drop Linux capabilities(7)
Message-ID: <20200501182857.GD38251@work-vm>
References: <20200416164907.244868-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200416164907.244868-1-stefanha@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 14:29:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> virtiofsd doesn't need of all Linux capabilities(7) available to root.  K=
eep a
> whitelisted set of capabilities that we require.  This improves security =
in
> case virtiofsd is compromised by making it hard for an attacker to gain f=
urther
> access to the system.

Queued.

> Stefan Hajnoczi (2):
>   virtiofsd: only retain file system capabilities
>   virtiofsd: drop all capabilities in the wait parent process
>=20
>  tools/virtiofsd/passthrough_ll.c | 51 ++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>=20
> --=20
> 2.25.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


