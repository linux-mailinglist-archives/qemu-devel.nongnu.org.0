Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F3CE3E0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 15:41:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL6XF-0005nw-TS
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 09:41:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hL6Vz-0005Rs-HW
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hL6Vy-00019E-MO
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:40:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hL6Vy-00018f-Fp; Mon, 29 Apr 2019 09:40:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E13563082E58;
	Mon, 29 Apr 2019 13:40:08 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0A5A6CE5E;
	Mon, 29 Apr 2019 13:40:05 +0000 (UTC)
Date: Mon, 29 Apr 2019 15:40:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Jason J. Herne" <jjherne@linux.ibm.com>
Message-ID: <20190429154003.7f8fc423.cohuck@redhat.com>
In-Reply-To: <1556543381-12671-1-git-send-email-jjherne@linux.ibm.com>
References: <1556543381-12671-1-git-send-email-jjherne@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 29 Apr 2019 13:40:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] s390-bios: Skip bootmap signature entries
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
	alifm@linux.ibm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Apr 2019 09:09:41 -0400
"Jason J. Herne" <jjherne@linux.ibm.com> wrote:

> Newer versions of zipl have the ability to write signature entries to the boot
> script for secure boot. We don't yet support secure boot, but we need to skip
> over signature entries while reading the boot script in order to maintain our
> ability to boot guest operating systems that have a secure bootloader.
> 
> Signed-off-by: Jason J. Herne <jjherne@linux.ibm.com>
> Reviewed-by: Farhan Ali <alifm@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/bootmap.c | 19 +++++++++++++++++--
>  pc-bios/s390-ccw/bootmap.h | 10 ++++++----
>  2 files changed, 23 insertions(+), 6 deletions(-)

Skipping something that we don't have support for yet, but that doesn't
hinder normal operation sounds reasonable; but can you point me to the
relevant commit implementing this in zipl or some documentation? I
haven't been able to find something like that in the s390-tools git
tree.

