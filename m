Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2515A8D7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 13:10:10 +0100 (CET)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1qqH-0003AO-Rt
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 07:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j1qpZ-0002k3-Lq
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j1qpY-00083U-M1
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:09:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42333
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j1qpY-00083B-IS
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581509364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpKZpxw6wEx5YUDP3l4RsGaV48RTKScpff6gL0xfagI=;
 b=G3lW3/v6+H1dSn4PUUijUiBB21+Zo4Cxj1tR0uwqTigpKCs4U4H1aFr7VafX3j4W7yEcBK
 XyUyTPuK2rUTsPLgwe5xNtU4Qkaix9aw1qaTWj5f4CfeDrZDUcdbMwfhns4/g3LBqS+bjU
 upO0NzojM6E4vubRA7fZl2ceeCaHVlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-tMr6bnB0OPuiGxBkuFi7JQ-1; Wed, 12 Feb 2020 07:09:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAED41937FC3;
 Wed, 12 Feb 2020 12:09:15 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F2D5DA83;
 Wed, 12 Feb 2020 12:09:12 +0000 (UTC)
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
To: Wouter Verhelst <w@uter.be>, "Richard W.M. Jones" <rjones@redhat.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com> <20200212072729.GA22254@grep.be>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <278d29cd-bc0d-19f0-c2a4-0191d16a677f@redhat.com>
Date: Wed, 12 Feb 2020 06:09:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212072729.GA22254@grep.be>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tMr6bnB0OPuiGxBkuFi7JQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/20 1:27 AM, Wouter Verhelst wrote:
> Hi,
> 
> On Mon, Feb 10, 2020 at 10:52:55PM +0000, Richard W.M. Jones wrote:
>> But anyway ... could a flag indicating that the whole image is sparse
>> be useful, either as well as NBD_INIT_SPARSE or instead of it?  You
>> could use it to avoid an initial disk trim, which is something that
>> mke2fs does:
> 
> Yeah, I think that could definitely be useful. I honestly can't see a
> use for NBD_INIT_SPARSE as defined in this proposal; and I don't think
> it's generally useful to have a feature if we can't think of a use case
> for it (that creates added complexity for no benefit).
> 
> If we can find a reasonable use case for NBD_INIT_SPARSE as defined in
> this proposal, then just add a third bit (NBD_INIT_ALL_SPARSE or
> something) that says "the whole image is sparse". Otherwise, I think we
> should redefine NBD_INIT_SPARSE to say that.

Okay, in v2, I will start with just two bits, NBD_INIT_SPARSE (entire 
image is sparse, nothing is allocated) and NBD_INIT_ZERO (entire image 
reads as zero), and save any future bits for later additions.  Do we 
think that 16 bits is sufficient for the amount of initial information 
likely to be exposed?  Are we in agreement that my addition of an 
NBD_INFO_ response to NBD_OPT_GO is the best way to expose initial state 
bits?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


