Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DE11E765
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 17:02:07 +0100 (CET)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifnOI-0000ot-Lt
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 11:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1ifmMd-0001pr-8f
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 09:56:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hch@lst.de>) id 1ifmMc-0003kn-BF
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 09:56:19 -0500
Received: from verein.lst.de ([213.95.11.211]:34214)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hch@lst.de>)
 id 1ifmMZ-0003aG-6N; Fri, 13 Dec 2019 09:56:15 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0A90A68B20; Fri, 13 Dec 2019 15:56:10 +0100 (CET)
Date: Fri, 13 Dec 2019 15:56:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: deprecate SCSI passthrough
Message-ID: <20191213145609.GA5339@lst.de>
References: <20191213144626.1208237-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213144626.1208237-1-stefanha@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 213.95.11.211
X-Mailman-Approved-At: Fri, 13 Dec 2019 10:59:34 -0500
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 13, 2019 at 02:46:26PM +0000, Stefan Hajnoczi wrote:
> The Linux virtio_blk.ko guest driver is removing legacy SCSI passthrough
> support.  Deprecate this feature in QEMU too.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Fine with me as the original author:

Reviewed-by: Christoph Hellwig <hch@lst.de>

