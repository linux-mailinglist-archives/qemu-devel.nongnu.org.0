Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC6D4E64
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 11:03:45 +0200 (CEST)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJDJQ-0002gZ-Ao
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 05:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iJDII-000207-3R
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iJDIH-0003sO-3C
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:02:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:50569)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iJDIG-0003rL-S7
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:02:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2019 02:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,287,1566889200"; d="scan'208";a="197816963"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2019 02:02:25 -0700
Date: Sat, 12 Oct 2019 17:02:09 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 0/2] refine memory_device_get_free_addr
Message-ID: <20191012090209.GA6047@richard>
References: <20190730003740.20694-1-richardw.yang@linux.intel.com>
 <20190913234746.jb5a5vlwl6cebudz@master>
 <20190914154026-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190914154026-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: ehabkost@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 Wei Yang <richard.weiyang@gmail.com>, Wei Yang <richardw.yang@linux.intel.com>,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 14, 2019 at 03:40:41PM -0400, Michael S. Tsirkin wrote:
>On Fri, Sep 13, 2019 at 11:47:46PM +0000, Wei Yang wrote:
>> On Tue, Jul 30, 2019 at 08:37:38AM +0800, Wei Yang wrote:
>> >When we iterate the memory-device list to get the available range, it is not
>> >necessary to iterate the whole list.
>> >
>> >1) no more overlap for hinted range if tmp exceed it
>> >
>> >v2:
>> >   * remove #2 as suggested by Igor and David
>> >   * add some comment to inform address assignment stay the same as before
>> >     this change 
>> >
>> >Wei Yang (2):
>> >  memory-device: not necessary to use goto for the last check
>> >  memory-device: break the loop if tmp exceed the hinted range
>> >
>> > hw/mem/memory-device.c | 3 ++-
>> > 1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> 
>> Would someone take this patch set?
>
>yes looks good to me too.
>Eduardo?
>

Hmm... I don't see this any where. May I ask the status?

>> >-- 
>> >2.17.1
>> >
>> 
>> -- 
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me

