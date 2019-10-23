Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAFAE0FC9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 03:51:39 +0200 (CEST)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN5oI-0007VM-NK
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 21:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iN5nV-00074J-QM
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 21:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iN5nU-0003mX-PP
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 21:50:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:5647)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iN5nU-0003mI-I6
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 21:50:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 18:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,218,1569308400"; d="scan'208";a="188098250"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.197.6])
 ([10.239.197.6])
 by orsmga007.jf.intel.com with ESMTP; 22 Oct 2019 18:50:45 -0700
Subject: Re: [PATCH v13 01/12] util/cutils: Add qemu_strtotime_ps()
To: Eric Blake <eblake@redhat.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
 <20191020111125.27659-2-tao3.xu@intel.com>
 <7a0662f5-28e3-4bb8-0b20-669d34cf56a6@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <e72312ca-86cc-08f7-95fb-102ba45b99e5@intel.com>
Date: Wed, 23 Oct 2019 09:50:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7a0662f5-28e3-4bb8-0b20-669d34cf56a6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/2019 9:13 AM, Eric Blake wrote:
> On 10/20/19 6:11 AM, Tao Xu wrote:
>> To convert strings with time suffixes to numbers, support time unit are
>> "ps" for picosecond, "ns" for nanosecond, "us" for microsecond, "ms"
>> for millisecond or "s" for second.
> 
> I haven't yet reviewed the patch itself, but my off-hand observation:
> 
> picosecond is probably too narrow to ever be useful.  POSIX interfaces
> only go down to nanoseconds, and when you start adding in vmexit delay
> times and such, we're lucky when we get anything better than microsecond
> accuracies.  Supporting just three sub-second suffixes instead of four
> would slightly simplify the code, and not cost you any real precision.
> 
Thank you for your suggestion.

