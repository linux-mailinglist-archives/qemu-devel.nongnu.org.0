Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C813D14A45B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 14:00:32 +0100 (CET)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw40F-00038I-HY
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 08:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iw3z3-0002Z1-De
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iw3z1-00048q-KW
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:59:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48502
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iw3z1-000489-3M
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580129954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1D2jPHpOQo89HGQzcT2OYvzuwaBoeci6jYs5mkhx/70=;
 b=g5V8XluscXFvcxlx+v3OrPzZjYVD0TpxHcnMhG0dtcSJtIfqnAXYv/AXVgmGTEWCivPJEa
 fQrrEvP+mhyweuyewUzihxWOR1QnQGuZQ2JflWBoCxdPpjOsLyN1T5sq/oSSYq6arNgWdv
 DsoRNHiLhB9as4FRTSeXgDQbAZgUpLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-DjdrEMj3NFCM-AOwmUx_UQ-1; Mon, 27 Jan 2020 07:59:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BED2E1005510;
 Mon, 27 Jan 2020 12:59:11 +0000 (UTC)
Received: from gondolin (ovpn-116-220.ams2.redhat.com [10.36.116.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B77C60BF1;
 Mon, 27 Jan 2020 12:59:02 +0000 (UTC)
Date: Mon, 27 Jan 2020 13:59:00 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/4] virtio-scsi: introduce a constant for fixed
 virtqueues
Message-ID: <20200127135900.76046ba5.cohuck@redhat.com>
In-Reply-To: <20200124100159.736209-2-stefanha@redhat.com>
References: <20200124100159.736209-1-stefanha@redhat.com>
 <20200124100159.736209-2-stefanha@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: DjdrEMj3NFCM-AOwmUx_UQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jan 2020 10:01:56 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> The event and control virtqueues are always present, regardless of the
> multi-queue configuration.  Define a constant so that virtqueue number
> calculations are easier to read.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/scsi/vhost-user-scsi.c       | 2 +-
>  hw/scsi/virtio-scsi.c           | 7 ++++---
>  include/hw/virtio/virtio-scsi.h | 3 +++
>  3 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


