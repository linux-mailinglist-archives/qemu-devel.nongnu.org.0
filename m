Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6091047C5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 01:57:33 +0100 (CET)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXamp-0000uL-Ia
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 19:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iXaln-0000Va-S4
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:56:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iXall-0000IC-SF
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:56:26 -0500
Received: from mga03.intel.com ([134.134.136.65]:25088)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iXall-0000H0-Iw
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:56:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 16:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,223,1571727600"; d="scan'208";a="357628655"
Received: from unknown (HELO [10.239.197.13]) ([10.239.197.13])
 by orsmga004.jf.intel.com with ESMTP; 20 Nov 2019 16:56:17 -0800
Subject: Re: [PATCH v16 13/14] tests/numa: Add case for QMP build HMAT
To: Igor Mammedov <imammedo@redhat.com>
References: <20191115075352.17734-1-tao3.xu@intel.com>
 <20191115075352.17734-14-tao3.xu@intel.com>
 <20191120133214.6fb83c92@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <8fc1a861-bfcd-12e2-ec20-ccebebfa8b9e@intel.com>
Date: Thu, 21 Nov 2019 08:56:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120133214.6fb83c92@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
 "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/2019 8:32 PM, Igor Mammedov wrote:
> On Fri, 15 Nov 2019 15:53:51 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
> 
>> Check configuring HMAT usecase
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>> ---
>>
>> New patch in v16.
>> ---
>>   tests/numa-test.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
> 
> I'd also add X-FAIL variants here, to test fail conditions.
> Taking in account that QMP interface returns error without
> affecting QEMU state, you can do it within one test case without
> restarting it on every fail scenario.
> (just add appropriate comments so reader would know that you are
> testing this and that failure path)
> 
> So I'd first test x-fail variants and then finish test with
> valid configuration.
> 

Thank you for your suggestion. I will add it in next version.

