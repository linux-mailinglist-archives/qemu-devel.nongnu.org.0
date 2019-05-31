Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBD630D3B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 13:17:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWfXI-00057y-3q
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 07:17:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hWfW4-0004gs-0u
	for qemu-devel@nongnu.org; Fri, 31 May 2019 07:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hWfW3-0002JW-4F
	for qemu-devel@nongnu.org; Fri, 31 May 2019 07:16:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37952)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hWfW2-0002Hx-Uz; Fri, 31 May 2019 07:16:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 860DA9FFDA;
	Fri, 31 May 2019 11:16:04 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA82678381;
	Fri, 31 May 2019 11:16:03 +0000 (UTC)
Date: Fri, 31 May 2019 13:16:01 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Message-ID: <20190531131601.4a37217a.cohuck@redhat.com>
In-Reply-To: <20190529091243.25562-1-cohuck@redhat.com>
References: <20190529091243.25562-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 31 May 2019 11:16:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: cover tests/migration/s390x/
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 May 2019 11:12:43 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> The generic s390 section looks like the best resting place.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f5f8b7a2c37..0be23997e9fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -102,6 +102,7 @@ F: pc-bios/s390-ccw/
>  F: pc-bios/s390-ccw.img
>  F: target/s390x/
>  F: docs/vfio-ap.txt
> +F: tests/migration/s390x/
>  K: ^Subject:.*(?i)s390x?
>  T: git https://github.com/cohuck/qemu.git s390-next
>  L: qemu-s390x@nongnu.org

Queued to s390-next.

