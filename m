Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB4B35695
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 08:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYP3J-0003VQ-UZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 02:05:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tao3.xu@intel.com>) id 1hYP2A-0003CC-90
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tao3.xu@intel.com>) id 1hYP29-0006Zq-7u
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:04:26 -0400
Received: from mga11.intel.com ([192.55.52.93]:20074)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hYP28-0005vS-TJ
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:04:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2019 23:04:13 -0700
X-ExtLoop1: 1
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.142])
	([10.239.196.142])
	by orsmga006.jf.intel.com with ESMTP; 04 Jun 2019 23:04:11 -0700
To: Igor Mammedov <imammedo@redhat.com>
References: <20190508061726.27631-1-tao3.xu@intel.com>
	<20190508061726.27631-8-tao3.xu@intel.com>
	<20190604170456.5b3c198e@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <729bde4a-bcb9-dac5-3a8a-04cc5f4d2bf9@intel.com>
Date: Wed, 5 Jun 2019 14:04:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604170456.5b3c198e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [PATCH v4 07/11] hmat acpi: Build Memory Side
 Cache Information Structure(s) in ACPI HMAT
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
	qemu-devel@nongnu.org, ehabkost@redhat.com, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/2019 11:04 PM, Igor Mammedov wrote:
> On Wed,  8 May 2019 14:17:22 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
> 
>> From: Liu Jingqi <jingqi.liu@intel.com>
>>
>> This structure describes memory side cache information for memory
>> proximity domains if the memory side cache is present and the
>> physical device(SMBIOS handle) forms the memory side cache.
>> The software could use this information to effectively place
>> the data in memory to maximize the performance of the system
>> memory that use the memory side cache.
>>
>> Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>> ---
>>
...
>> +
>> +                /* SMBIOS Handles */
>> +                /* TBD: set smbios handles */
>> +                build_append_int_noprefix(table_data, 0, 2 * n);
> Is memory side cache structure useful at all without pointing to SMBIOS entries?
> 
They are not useful yet, and the kernel 5.1 HMAT sysfs doesn't show 
SMBIOS entries. We can update it if it useful in the future.

