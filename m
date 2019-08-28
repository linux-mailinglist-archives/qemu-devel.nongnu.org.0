Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1BBA03B2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 15:49:31 +0200 (CEST)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2yKI-0005z9-Dh
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 09:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i2yIM-0005Py-SK
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 09:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i2yIL-0003Kx-MS
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 09:47:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51734)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1i2yIL-0003KN-Dk; Wed, 28 Aug 2019 09:47:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B13E830832C0;
 Wed, 28 Aug 2019 13:47:28 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7AC25D6B0;
 Wed, 28 Aug 2019 13:47:27 +0000 (UTC)
Date: Wed, 28 Aug 2019 15:47:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190828154725.5dca8d1f.cohuck@redhat.com>
In-Reply-To: <f213c73c-61d8-6333-edb8-c8f988a5bd9a@redhat.com>
References: <20190828123343.8343-1-thuth@redhat.com>
 <15276e6d-cd9d-825a-befa-65e5f4c91e5d@de.ibm.com>
 <f213c73c-61d8-6333-edb8-c8f988a5bd9a@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 28 Aug 2019 13:47:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] pc-bios/s390-ccw: Do not pre-initialize
 empty array
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Aug 2019 15:42:37 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 28/08/2019 15.27, Christian Borntraeger wrote:
> > On 28.08.19 14:33, Thomas Huth wrote:  
> >> We're clearing the BSS in start.S now, so there is no need to
> >> pre-initialize the loadparm_str array with zeroes anymore.  
> > 
> > Can you add a link to the commit that does the bss clearing?  
> 
> Sure, I'll change the description to:
> 
> "
> Since commit 339686a358b11a231aa5b6d1424e7a1460d7f277 ("pc-bios/s390-ccw:
> zero out bss section"), we are clearing now the BSS in start.S, so there
> is no need to pre-initialize the loadparm_str array with zeroes anymore.
> "
> 
>  Thomas

With that:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

