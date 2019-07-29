Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF107916A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:50:06 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8qb-00035p-AI
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33866)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hs8ms-0007ja-7H
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:46:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hs8mr-0000rF-Cb
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:46:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49884)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hs8mp-0000or-9X
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:46:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAEAB8E22B
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 16:46:09 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5BE260856;
 Mon, 29 Jul 2019 16:46:06 +0000 (UTC)
Date: Mon, 29 Jul 2019 18:46:04 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190729184604.3981788b.cohuck@redhat.com>
In-Reply-To: <20190729162903.4489-2-dgilbert@redhat.com>
References: <20190729162903.4489-1-dgilbert@redhat.com>
 <20190729162903.4489-2-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 29 Jul 2019 16:46:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] Revert "Revert "globals: Allow
 global properties to be optional""
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

On Mon, 29 Jul 2019 17:29:02 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This reverts commit 8fa70dbd8bb478d9483c1da3e9976a2d86b3f9a0.
> 
> Because we're about to revert it's neighbour and thus uses an optional
> again.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  include/hw/qdev-core.h | 3 +++
>  qom/object.c           | 3 +++
>  2 files changed, 6 insertions(+)

As discussed on IRC, the 'bugs' mentioned in that commit were related
to the other patch that is being reverted; so I don't really mind it
for 4.1 (IOW, either of the two revert approaches should be fine.)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

