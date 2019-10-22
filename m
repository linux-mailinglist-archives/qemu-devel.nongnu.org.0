Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8740DFC37
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 05:31:08 +0200 (CEST)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMkt1-0007Ec-94
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 23:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iMkrv-0006Vu-B1
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 23:30:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iMkrt-00023T-3R
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 23:29:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23295
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iMkrt-00021z-0A
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 23:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571714995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/LXBLMstHClKrdeSfibksZXqt2PFQb/SkjhEZBYBxU=;
 b=MX8UAMji1asZaHFP9AJzIgGNBAAJPG71qd+cZn0IMrZRdI6CVjSkEL6rEHkhKzpjbuabEc
 caPiooyJBgrFcs0StZLpdSIgmz+xf4i66KxgacdVek+wvh8CZB0eYCA9zjADgwSO5rqjez
 uf2oCVOZnCJGw+ERXYEG0+G3lKJRAY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-oEJoR7jcPlO_qQPU_Xvouw-1; Mon, 21 Oct 2019 23:29:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E1B80183E;
 Tue, 22 Oct 2019 03:29:52 +0000 (UTC)
Received: from [10.72.12.226] (ovpn-12-226.pek2.redhat.com [10.72.12.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1722C60A9F;
 Tue, 22 Oct 2019 03:29:31 +0000 (UTC)
Subject: Re: [PATCH] net: add tulip (dec21143) driver
To: Sven Schnelle <svens@stackframe.org>
References: <20191019173801.939-1-svens@stackframe.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f6cf2c88-ae77-2998-2b38-4716fe86f081@redhat.com>
Date: Tue, 22 Oct 2019 11:29:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191019173801.939-1-svens@stackframe.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: oEJoR7jcPlO_qQPU_Xvouw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/10/20 =E4=B8=8A=E5=8D=881:38, Sven Schnelle wrote:
> This adds the basic functionality to emulate a Tulip NIC.
>
> Implemented are:
>
> - RX and TX functionality
> - Perfect Frame Filtering
> - Big/Little Endian descriptor support
> - 93C46 EEPROM support
> - LXT970 PHY
>
> Not implemented, mostly because i had no OS using these functions:
>
> - Imperfect frame filtering
> - General Purpose Timer
> - Transmit automatic polling
> - Boot ROM support
> - SIA interface
> - Big/Little Endian data buffer conversion
>
> Successfully tested with the following Operating Systems:
>
> - MSDOS with Microsoft Network Client 3.0 and DEC ODI drivers
> - HPPA Linux
> - Windows XP
> - HP-UX
>
> Signed-off-by: Sven Schnelle<svens@stackframe.org>
> ---


Applied.

If possible, please add a qtest for this.

Thanks


