Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875D45BE7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 13:55:48 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbko7-0001xe-DJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 07:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46445)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hbkiH-0005wS-6Y
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hbkiC-0001QB-Lx
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 07:49:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56546)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hbkiC-0001Mb-ER; Fri, 14 Jun 2019 07:49:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2227830832C5;
 Fri, 14 Jun 2019 11:49:38 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85517839B;
 Fri, 14 Jun 2019 11:49:34 +0000 (UTC)
Date: Fri, 14 Jun 2019 13:49:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190614134932.3df92945.cohuck@redhat.com>
In-Reply-To: <20190612132526.8905-1-david@redhat.com>
References: <20190612132526.8905-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 14 Jun 2019 11:49:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v1 0/2] s390x/cpumodel: Rework CPU feature
 definition
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jun 2019 15:25:24 +0200
David Hildenbrand <david@redhat.com> wrote:

> Rework the feature initialization, making it harder to make mistakes.
> While at it, rename the enum names of the KDSA features.
> 
> David Hildenbrand (2):
>   s390x/cpumodel: Rework CPU feature definition
>   s390x/cpumodel: Prepend KDSA features with "KDSA"
> 
>  target/s390x/cpu_features.c         | 352 +-------------------------
>  target/s390x/cpu_features_def.h     | 352 +-------------------------
>  target/s390x/cpu_features_def.inc.h | 369 ++++++++++++++++++++++++++++
>  target/s390x/gen-features.c         |  30 +--
>  4 files changed, 401 insertions(+), 702 deletions(-)
>  create mode 100644 target/s390x/cpu_features_def.inc.h
> 

Looks good to me. Do you want to take it via your tree?

