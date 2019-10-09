Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE69D1737
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 19:58:28 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIGEE-000094-Py
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 13:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iI9TN-0003vt-Vd
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 06:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iI9TL-0006Pe-Pm
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 06:45:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iI9TL-0006PK-Ju; Wed, 09 Oct 2019 06:45:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B77510DCC95;
 Wed,  9 Oct 2019 10:45:34 +0000 (UTC)
Received: from gondolin (ovpn-117-191.ams2.redhat.com [10.36.117.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A58F60A9F;
 Wed,  9 Oct 2019 10:45:29 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:45:27 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 6/7] s390x/mmu: DAT table definition overhaul
Message-ID: <20191009124527.490a18f7.cohuck@redhat.com>
In-Reply-To: <20191004105102.15821-7-david@redhat.com>
References: <20191004105102.15821-1-david@redhat.com>
 <20191004105102.15821-7-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Wed, 09 Oct 2019 10:45:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  4 Oct 2019 12:51:01 +0200
David Hildenbrand <david@redhat.com> wrote:

> Let's use consitent names for the region/section/page table entries and

Can you still fixup s/consitent/consistent/ before picking up? :)

> for the macros to extract relevant parts from virtual address. Make them
> match the definitions in the PoP - e.g., how the relevant bits are actually
> called.
> 
> Introduce defines for all bits declared in the PoP. This will come in
> handy in follow-up patches.
> 
> Add a note where additional information about s390x and the used
> definitions can be found.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.h        | 78 +++++++++++++++++++++++++++++----------
>  target/s390x/mem_helper.c | 12 +++---
>  target/s390x/mmu_helper.c | 37 ++++++++++---------
>  3 files changed, 84 insertions(+), 43 deletions(-)

