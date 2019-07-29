Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A98790A0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:19:12 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8Mh-0005Ry-KU
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57559)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hs8M2-0004zG-M0
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:18:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hs8M1-0005cR-OX
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:18:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63721)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hs8M1-0005ba-JG
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:18:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37535308FBA0
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 16:18:28 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19545600CC;
 Mon, 29 Jul 2019 16:18:24 +0000 (UTC)
Date: Mon, 29 Jul 2019 18:18:22 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190729181822.55995f92.cohuck@redhat.com>
In-Reply-To: <20190729155909.22804-1-dgilbert@redhat.com>
References: <20190729155909.22804-1-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 29 Jul 2019 16:18:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [for 4.1 PATCH] Revert "hw: report invalid
 disable-legacy|modern usage for virtio-1-only devs"
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jul 2019 16:59:09 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This reverts commit f2784eed306449c3d04a71a05ed6463b8289aedf
> since that accidentally removes the PCIe capabilities from virtio
> devices because virtio_pci_dc_realize is called before the new 'mode'
> flag is set.

Yes, this is probably too hairy to fix for 4.1; but the change might be
worthwhile to revisit for 4.2.

> I keep the expanded hw_compat entry because we've lost the ability to
> do 'optional'.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/display/virtio-gpu-pci.c   |  4 +---
>  hw/display/virtio-vga.c       |  4 +---
>  hw/virtio/virtio-crypto-pci.c |  4 +---
>  hw/virtio/virtio-input-pci.c  |  4 +---
>  hw/virtio/virtio-pci.c        | 26 ++++++++++----------------
>  hw/virtio/virtio-pci.h        | 31 ++++++-------------------------
>  6 files changed, 20 insertions(+), 53 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

