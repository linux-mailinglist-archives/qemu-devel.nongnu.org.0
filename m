Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1433786
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 20:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXrNu-0001VB-Oh
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 14:08:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1hXrMt-0001EX-P9
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1hXrMs-0005L4-Qa
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:07:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laine@redhat.com>) id 1hXrMs-0004TJ-Ku
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:07:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C7CB8FABB;
	Mon,  3 Jun 2019 18:07:03 +0000 (UTC)
Received: from vhost2.laine.org (ovpn-117-135.phx2.redhat.com [10.3.117.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A615E5DC1A;
	Mon,  3 Jun 2019 18:06:48 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, si-wei liu <si-wei.liu@oracle.com>
References: <20190517125820.2885-1-jfreimann@redhat.com>
	<20190520165657.2293c5d7@x1.home>
	<20190521072157.wpb77wlc5mhfcdes@jenstp.localdomain>
	<20190521073511-mutt-send-email-mst@kernel.org>
	<20190521184918.n4nnk6ack3ssp6jv@jenstp.localdomain>
	<d116bc65-0715-2c6a-2616-49f67cd685c8@oracle.com>
	<20190528225039-mutt-send-email-mst@kernel.org>
From: Laine Stump <laine@redhat.com>
Message-ID: <1c5f460e-a3b9-56c1-90f7-b3a5c3d0a0d3@redhat.com>
Date: Mon, 3 Jun 2019 14:06:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528225039-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 03 Jun 2019 18:07:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/4] add failover feature for assigned
 network devices
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
	aadam@redhat.com, qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jens Freimann <jfreimann@redhat.com>, ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/19 10:54 PM, Michael S. Tsirkin wrote:
> On Tue, May 28, 2019 at 05:14:22PM -0700, si-wei liu wrote:
>>
>>
>> On 5/21/2019 11:49 AM, Jens Freimann wrote:
>>> On Tue, May 21, 2019 at 07:37:19AM -0400, Michael S. Tsirkin wrote:
>>>> On Tue, May 21, 2019 at 09:21:57AM +0200, Jens Freimann wrote:
>>>>> On Mon, May 20, 2019 at 04:56:57PM -0600, Alex Williamson wrote:

>>>> Actually is there a list of devices for which this has been tested
>>>> besides mlx5? I think someone said some old intel cards
>>>> don't support this well, we might need to blacklist these ...
>>>
>>> So far I've tested mlx5 and XL710 which both worked, but I'm
>>> working on testing with more devices. But of course help with testing
>>> is greatly appreciated.
 >>
>> It won't work on Intel ixgbe and Broadcom bnxt_en, which requires toggling
>> the state of tap backing the virtio-net in order to release/reprogram MAC
>> filter. Actually, it's very few NICs that could work with this - even some
>> works by chance the behavior is undefined. Instead of blacklisting it makes
>> more sense to whitelist the NIC that supports it - with some new sysfs
>> attribute claiming the support presumably.
>>
>> -Siwei
> 
> I agree for many cards we won't know how they behave until we try.  One
> can consider this a bug in Linux that cards don't behave in a consistent
> way.  The best thing to do IMHO would be to write a tool that people can
> run to test the behaviour.

Is the "bad behavior" something due to the hardware of the cards, or 
their drivers? If it's the latter, then at least initially having a 
whitelist would be counterproductive, since it would make it difficult 
for relative outsiders to test and report success/failure of various cards.

(It's probably just a pipe dream, but it would be nice if it eventually 
could work with old igb cards - I have several of them that I use for 
SRIOV testing, and would rather avoid having to buy new hardware.)

