Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A481B33
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 15:12:59 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hucnK-0004il-Q6
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 09:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jfreimann@redhat.com>) id 1hucmn-0003qs-DD
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 09:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1hucmm-0005In-Bi
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 09:12:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1hucmm-0005Ha-6Q
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 09:12:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 575CE300BBA8
 for <qemu-devel@nongnu.org>; Mon,  5 Aug 2019 13:12:22 +0000 (UTC)
Received: from localhost (ovpn-117-125.ams2.redhat.com [10.36.117.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA05B60603;
 Mon,  5 Aug 2019 13:12:17 +0000 (UTC)
Date: Mon, 5 Aug 2019 15:12:15 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190805131215.c6cl3lgvcpnzfx3x@jenstp.localdomain>
References: <20190802150605.5880-1-jfreimann@redhat.com>
 <20190802112047-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190802112047-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 05 Aug 2019 13:12:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/9] add failover feature for assigned
 network devices
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 02, 2019 at 11:22:10AM -0400, Michael S. Tsirkin wrote:
>On Fri, Aug 02, 2019 at 05:05:56PM +0200, Jens Freimann wrote:
>> This is implementing the host side of the net_failover concept
>> (https://www.kernel.org/doc/html/latest/networking/net_failover.html)
>>
>> Changes since v1:

[...] 

>Didn't read this yet, one question: how do migration commands look
>like?

You mean the hmp commands I think:

migrate -d tcp:host:port

and to cancel

migrate_cancel


regards,
Jens 

