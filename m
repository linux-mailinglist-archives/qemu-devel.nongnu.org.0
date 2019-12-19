Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07980125914
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 02:09:43 +0100 (CET)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihkJy-0002wN-4X
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 20:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ihkJ9-0002Xk-UX
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 20:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ihkJ8-0005ck-Sq
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 20:08:51 -0500
Received: from mga05.intel.com ([192.55.52.43]:21923)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ihkJ8-0005bJ-Iw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 20:08:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 17:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="267043614"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.238])
 ([10.239.196.238])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2019 17:08:46 -0800
Subject: Re: [PATCH RESEND v20 0/8] Build ACPI Heterogeneous Memory Attribute
 Table (HMAT)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191213011929.2520-1-tao3.xu@intel.com>
 <20191213050619-mutt-send-email-mst@kernel.org>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <b667ded5-1461-1a16-0685-cd85966e0eab@intel.com>
Date: Thu, 19 Dec 2019 09:08:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213050619-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Du, Fan" <fan.du@intel.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "sw@weilnetz.de" <sw@weilnetz.de>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/2019 6:06 PM, Michael S. Tsirkin wrote:
> On Fri, Dec 13, 2019 at 09:19:21AM +0800, Tao Xu wrote:
>> This series of patches will build Heterogeneous Memory Attribute Table (HMAT)
>> according to the command line. The ACPI HMAT describes the memory attributes,
>> such as memory side cache attributes and bandwidth and latency details,
>> related to the Memory Proximity Domain.
>> The software is expected to use HMAT information as hint for optimization.
>>
>> In the linux kernel, the codes in drivers/acpi/hmat/hmat.c parse and report
>> the platform's HMAT tables.
>>
>> The V19 patches link:
>> https://patchwork.kernel.org/cover/11265525/
> 
> Looks good to me, I'll queue it for merge after the release. If possible
> please ping me after the release to help make sure it didn't get
> dropped.
> 

Hi Michael,

I am wondering if these patches can be merged this week, because QEMU 
5.0 developing tree is open and next week may be the holidays.

Thank you very much!

Tao Xu

