Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E88348272
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 14:32:27 +0200 (CEST)
Received: from localhost ([::1]:46908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcqoE-0005GG-Gm
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 08:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hcqY0-00037n-KD
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 08:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hcqXy-0002Xa-P6
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 08:15:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hcqXw-0002Rg-Pv; Mon, 17 Jun 2019 08:15:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5866480F91;
 Mon, 17 Jun 2019 12:15:32 +0000 (UTC)
Received: from gondolin (dhcp-192-192.str.redhat.com [10.33.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E00EE1001DF3;
 Mon, 17 Jun 2019 12:15:28 +0000 (UTC)
Date: Mon, 17 Jun 2019 14:15:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>
Message-ID: <20190617141526.15f6666f.cohuck@redhat.com>
In-Reply-To: <20190617101036.4087-1-cohuck@redhat.com>
References: <20190617101036.4087-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 17 Jun 2019 12:15:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] vfio-ccw: use vfio_set_irq_signaling
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jun 2019 12:10:36 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> Use the new helper.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> v1->v2:
>  - Don't go overboard with deleting, and keep the get_irq_info part.
> ---
>  hw/vfio/ccw.c | 51 +++++++++++++--------------------------------------
>  1 file changed, 13 insertions(+), 38 deletions(-)

Queued to s390-next.

