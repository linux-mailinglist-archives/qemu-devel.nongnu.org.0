Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2B8E233
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 02:54:44 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy42N-0006kN-7h
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 20:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1hy41P-0005xe-Ss
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 20:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hy41O-00035f-DT
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 20:53:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:62296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hy41O-00033B-5c
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 20:53:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 17:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,387,1559545200"; d="scan'208";a="184480353"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.241])
 ([10.239.196.241])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2019 17:53:31 -0700
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190809065731.9097-1-tao3.xu@intel.com>
 <c98f0433-969e-0e15-9f82-569661e3b034@intel.com>
 <20190814205747.GR3908@habkost.net>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <5f28de73-d37b-28fa-b550-6bc433885fc1@intel.com>
Date: Thu, 15 Aug 2019 08:53:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814205747.GR3908@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH v9 00/11] Build ACPI Heterogeneous Memory
 Attribute Table (HMAT)
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
Cc: "Liu, Jingqi" <jingqi.liu@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "daniel@linux.ibm.com" <daniel@linux.ibm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/15/2019 4:57 AM, Eduardo Habkost wrote:
> On Tue, Aug 13, 2019 at 04:53:33PM +0800, Tao Xu wrote:
>> Hi Igor and Eduardo,
>>
>> I am wondering if there are more comments about patch 1/11~4/11? Because
>> these 4 patch are independent and the patch series are big and pushing for a
>> long time. Could the patch 1/11~4/11 be ready for queuing firstly?
> 
> Now that I got a few Acked-bys for patch 1/4, I plan to queue
> patches 1-4 in machine-next soon.
> 
Thank you very much!

