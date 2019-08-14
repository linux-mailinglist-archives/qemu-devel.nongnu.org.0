Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9678DF92
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 22:59:36 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy0Mp-00073f-SE
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 16:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1hy0LB-0005k8-Ny
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 16:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hy0LA-0001QD-1i
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 16:57:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hy0L9-0001OE-Sy
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 16:57:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 863947BDB4;
 Wed, 14 Aug 2019 20:57:49 +0000 (UTC)
Received: from localhost (ovpn-116-32.gru2.redhat.com [10.97.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A49091E63;
 Wed, 14 Aug 2019 20:57:48 +0000 (UTC)
Date: Wed, 14 Aug 2019 17:57:47 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190814205747.GR3908@habkost.net>
References: <20190809065731.9097-1-tao3.xu@intel.com>
 <c98f0433-969e-0e15-9f82-569661e3b034@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98f0433-969e-0e15-9f82-569661e3b034@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 14 Aug 2019 20:57:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v9 00/11] Build ACPI Heterogeneous Memory
 Attribute Table (HMAT)
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
Cc: jingqi.liu@intel.com, fan.du@intel.com, qemu-devel@nongnu.org,
 daniel@linux.ibm.com, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 13, 2019 at 04:53:33PM +0800, Tao Xu wrote:
> Hi Igor and Eduardo,
> 
> I am wondering if there are more comments about patch 1/11~4/11? Because
> these 4 patch are independent and the patch series are big and pushing for a
> long time. Could the patch 1/11~4/11 be ready for queuing firstly?

Now that I got a few Acked-bys for patch 1/4, I plan to queue
patches 1-4 in machine-next soon.

-- 
Eduardo

