Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D963ADD0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 06:10:40 +0200 (CEST)
Received: from localhost ([::1]:40314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haBdn-0003R0-NG
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 00:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53473)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1haBcX-0002za-Ko
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 00:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1haBcV-0003oC-0n
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 00:09:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1haBcR-0003kR-Tj
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 00:09:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2AA8C0546D3;
 Mon, 10 Jun 2019 04:09:10 +0000 (UTC)
Received: from [10.72.12.206] (ovpn-12-206.pek2.redhat.com [10.72.12.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1241972B;
 Mon, 10 Jun 2019 04:09:06 +0000 (UTC)
To: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu-dev <qemu-devel@nongnu.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul.durrant@citrix.com>
References: <20190609164433.5866-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e02f265c-a0f4-0b34-e3e9-48f0d9eefaf8@redhat.com>
Date: Mon, 10 Jun 2019 12:09:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190609164433.5866-1-chen.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 10 Jun 2019 04:09:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V2 0/5] Add Xen COLO support
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/6/10 =E4=B8=8A=E5=8D=8812:44, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
>
> Xen COLO based on KVM COLO architecture, it shared COLO proxy and block
> replication with KVM COLO. The only differece is Xen COLO have own
> COLO-frame to handle live migration related function, so we need this
> series make Xen COLO frame can communicate with other COLO modules in
> qemu. Xen side related patches have been merged.


Any pointer to this?

Thanks


>
> V2:
>   - Rebase on upstream code.
>   - Optimize code by Zhijian's comments in patch 4/5.
>   - Remove origin 5/6 patch.
>
> V1:
>   - Initial patch.
>
> Zhang Chen (5):
>    COLO-compare: Add new parameter to communicate with remote colo-fram=
e
>    COLO-compare: Add remote notification chardev handler frame
>    COLO-compare: Make the compare_chr_send() can send notification
>      message.
>    COLO-compare: Add colo-compare remote notify support
>    migration/colo.c: Add missed filter notify for Xen COLO.
>
>   migration/colo.c   |   2 +
>   net/colo-compare.c | 155 +++++++++++++++++++++++++++++++++++++++-----=
-
>   qemu-options.hx    |  33 +++++++++-
>   3 files changed, 171 insertions(+), 19 deletions(-)
>

