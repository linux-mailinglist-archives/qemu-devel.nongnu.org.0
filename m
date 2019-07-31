Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679D7B72C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 02:27:27 +0200 (CEST)
Received: from localhost ([::1]:36944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hscSk-0002TF-Cx
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 20:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60155)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hscRu-0001kA-9e
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 20:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hscRt-00066I-8c
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 20:26:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:25472)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>)
 id 1hscRs-0005wd-Rm; Tue, 30 Jul 2019 20:26:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 17:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="200520440"
Received: from unknown (HELO [10.239.196.148]) ([10.239.196.148])
 by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2019 17:26:26 -0700
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20190729063127.2801-1-tao3.xu@intel.com>
 <20190729063127.2801-3-tao3.xu@intel.com>
 <20190729150957.157a7c03@redhat.com>
 <04ce7f87-815c-924b-e1df-6a4028750926@intel.com>
 <20190730111120.63de67ae@Igors-MacBook-Pro>
 <20190730211216.GV4313@habkost.net>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <6763636a-8150-3875-79f4-efd5ddcfbefb@intel.com>
Date: Wed, 31 Jul 2019 08:26:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730211216.GV4313@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [PATCH v8 02/11] numa: move numa global variable
 nb_numa_nodes into MachineState
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
Cc: aik@ozlabs.ru, jingqi.liu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, jonathan.cameron@huawei.com,
 David Gibson <dgibson@redhat.com>, dan.j.williams@intel.com, paulus@samba.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/2019 5:12 AM, Eduardo Habkost wrote:
> On Tue, Jul 30, 2019 at 11:11:20AM +0200, Igor Mammedov wrote:
> [...]
>> PS:
>> we already have an implicit node creation in generic numa code (when memory hotplug
>> is enabled), so we probably could reuse that and a node should be created from there
>> instead of fixing up from the code deep within the board.
> 
> I like that.  We can add a MachineClass::auto_enable_numa field
> to indicate when a NUMA node is expected to be created
> implicitly.
> 

OK thank you for your suggestion.

