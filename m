Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F101B10D0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 17:57:21 +0200 (CEST)
Received: from localhost ([::1]:38270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQYnQ-0001gF-E6
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 11:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jQYlq-00017j-GW
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 11:55:42 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jQYlo-0007cE-RQ
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 11:55:42 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43487
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jQYlo-0007Z5-Ca
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 11:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587398139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lt4fyPDfDrlunE+e5Bymkdzz1676cGnNq5L1L5z4thA=;
 b=GSxdpLAU2JFDNvUmBSOAGwDLRMk+ftj/dhBKLmhYkV/JqBhZKL458RN09/6l7Hl/v4nioH
 NH3FHS4sOeQh4FN2jw8j5bMirrtxMKHN//06skvmM0Ztw0bQKZ6/29kT9pv3U2+fTVVrY2
 FKOr5MgngDh3kx0NJxyLscpGdq4NktE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Jth0MiJ1OFuWcpDIlihmqw-1; Mon, 20 Apr 2020 11:55:35 -0400
X-MC-Unique: Jth0MiJ1OFuWcpDIlihmqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2A51083E80;
 Mon, 20 Apr 2020 15:55:34 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-38.ams2.redhat.com [10.36.114.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8272A18A3;
 Mon, 20 Apr 2020 15:55:13 +0000 (UTC)
Date: Mon, 20 Apr 2020 17:55:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC v2 0/6] hmp,qmp: Add some commands to introspect virtio
 devices
Message-ID: <20200420155512.GB29316@linux.fritz.box>
References: <20200420104145.205297-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200420104145.205297-1-lvivier@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 01:47:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Amit Shah <amit@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.04.2020 um 12:41 hat Laurent Vivier geschrieben:
> This series introduces new QMP/HMP commands to dump the status
> of a a virtio device at different levels.

What is the intended use case for these commands?

If it's just for debugging, should we add a x-debug- prefix to the QMP
commands to avoid making it a stable interface for which we must keep
backwards compatibility?

Kevin


