Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D8DF546
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 20:47:34 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMciL-0007IY-ES
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 14:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iMcgs-0006qp-J3
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 14:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iMcgq-0000U4-8O
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 14:46:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33774
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iMcgp-0000Tg-Sb
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 14:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571683558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfJ2KyJItNQM25HZgrq8Xk8dYQqOf3CGjE+aCln0Ac4=;
 b=gnmXgavJj7PA933fLlkurmy0InBOnE2Zb3Oxew1iZPJ7I298uexFoaulicEC/bjgqwlMlw
 QXF58gQ3LS+9Lee+t1Us3aJ3V0/I9Tl0/qHfC1mcBf1//se8F4xNBtln41OsCXKHu/Nyrx
 /C8OE+RhQzylmhrnpGUOZiFiP+pPHU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-QAenx6GLNH6QQThWehkuUw-1; Mon, 21 Oct 2019 14:45:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4D501800D79;
 Mon, 21 Oct 2019 18:45:53 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E55F560BE2;
 Mon, 21 Oct 2019 18:45:48 +0000 (UTC)
Date: Mon, 21 Oct 2019 20:45:46 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 02/11] pci: add option for net failover
Message-ID: <20191021184546.n5iddctnnlxe3tay@jenstp.localdomain>
References: <20191018202040.30349-1-jfreimann@redhat.com>
 <20191018202040.30349-3-jfreimann@redhat.com>
 <20191021085823.72ac4b37@x1.home>
MIME-Version: 1.0
In-Reply-To: <20191021085823.72ac4b37@x1.home>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: QAenx6GLNH6QQThWehkuUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 laine@redhat.com, ailan@redhat.com, parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 21, 2019 at 08:58:23AM -0600, Alex Williamson wrote:
>On Fri, 18 Oct 2019 22:20:31 +0200
>Jens Freimann <jfreimann@redhat.com> wrote:
>
>> This patch adds a net_failover_pair_id property to PCIDev which is
>> used to link the primary device in a failover pair (the PCI dev) to
>> a standby (a virtio-net-pci) device.
>>
>> It only supports ethernet devices. Also currently it only supports
>> PCIe devices. QEMU will exit with an error message otherwise.
>
>Doesn't the PCIe device also need to be hotpluggable?  We can have PCIe
>devices attached to the root bus where we don't currently support
>hotplug.  Thanks,

How do I recognize such a device? hotpluggable in DeviceClass?

regards,
Jens=20


