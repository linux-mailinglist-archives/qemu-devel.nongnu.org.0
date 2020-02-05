Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4B152534
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 04:18:21 +0100 (CET)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izBCm-0006VT-C4
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 22:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1izBBu-00064S-3Q
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 22:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1izBBt-0008JY-40
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 22:17:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43944
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1izBBs-0008GJ-VF
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 22:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580872644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbC/LMn3Wj0dR1qUDFO9RwHNtoXTF47kIvsebIzMQq4=;
 b=C3Z/hI11WiKEimUu7mtj2qhnej5Xe4rIJFl9JRkKcFR35LrNEdEn4nn4a/pS955HsK17jw
 Mau6klIjgyYYWB8NFBs2s0GzKwLFCTGGjc1bFUsY3TK7g11/Qgli1zLJcKCZEm/Woh4RVx
 wcNW4wJoPH6qlCpf7NW764yjlUBqKmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-7t3YOPjyPyuHWFT-AGbipw-1; Tue, 04 Feb 2020 22:17:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78627800D55;
 Wed,  5 Feb 2020 03:17:19 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DCD785732;
 Wed,  5 Feb 2020 03:17:17 +0000 (UTC)
Subject: Re: [PATCH 0/1] Introduce Xlnx ZynqMP CAN controller for QEMU
To: Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-devel@nongnu.org
References: <1580764010-310744-1-git-send-email-fnu.vikram@xilinx.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9782ee22-c004-b569-66e8-071e8447e44e@redhat.com>
Date: Wed, 5 Feb 2020 11:17:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1580764010-310744-1-git-send-email-fnu.vikram@xilinx.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 7t3YOPjyPyuHWFT-AGbipw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/2/4 =E4=B8=8A=E5=8D=885:06, Vikram Garhwal wrote:
> Example for single CAN:
>      -object can-bus,id=3Dcanbus0 \
>      -global driver=3Dxlnx.zynqmp-can,property=3Dcanbus0,value=3Dcanbus0 =
\
>      -object can-host-socketcan,id=3Dsocketcan0,if=3Dvcan0,canbus=3Dcanbu=
s0
>
> Example for connecting both CAN:
>      -object can-bus,id=3Dcanbus0 -object can-bus,id=3Dcanbus1 \
>      -global driver=3Dxlnx.zynqmp-can,property=3Dcanbus0,value=3Dcanbus0 =
\
>      -global driver=3Dxlnx.zynqmp-can,property=3Dcanbus1,value=3Dcanbus1 =
\
>      -object can-host-socketcan,id=3Dsocketcan0,if=3Dvcan0,canbus=3Dcanbu=
s0 \
>      -object can-host-socketcan,id=3Dsocketcan1,if=3Dvcan0,canbus=3Dcanbu=
s1
>
> Vikram Garhwal (1):
>    hw/net/can: Introduce Xlnx ZynqMP CAN controller for QEMU
>
>   hw/net/can/Makefile.objs         |    1 +
>   hw/net/can/xlnx-zynqmp-can.c     | 1106 +++++++++++++++++++++++++++++++=
+++++++
>   include/hw/net/xlnx-zynqmp-can.h |   77 +++
>   3 files changed, 1184 insertions(+)
>   create mode 100644 hw/net/can/xlnx-zynqmp-can.c
>   create mode 100644 include/hw/net/xlnx-zynqmp-can.h
>

Hi Vikram:

I would like to confirm that whether or not you would maintain this NIC.=20
(I think the answer is yes). I tend not to merge a NIC model without a=20
maintainer.

Thanks


