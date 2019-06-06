Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2B36A52
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 05:05:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYiiO-0001GG-Rp
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 23:05:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYidt-0006pQ-NV
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 23:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYids-000417-OK
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 23:00:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hYids-000408-J1; Wed, 05 Jun 2019 23:00:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF5DC3082B5A;
	Thu,  6 Jun 2019 03:00:39 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC4468386;
	Thu,  6 Jun 2019 03:00:39 +0000 (UTC)
Date: Thu, 6 Jun 2019 00:00:37 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Message-ID: <20190606030037.GS22416@habkost.net>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-11-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518205428.90532-11-like.xu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 06 Jun 2019 03:00:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 10/10] vl.c: Replace smp global
 variables with smp machine properties
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 19, 2019 at 04:54:28AM +0800, Like Xu wrote:
> The global smp variables in vl.c are completely replaced with machine properties.
> 
> Form this commit, the smp_cpus/smp_cores/smp_threads/max_cpus are deprecated
> and only machine properties within MachineState are fully applied and enabled.
> 
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

