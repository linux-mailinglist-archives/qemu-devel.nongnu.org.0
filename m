Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3785F7D2B6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 03:17:15 +0200 (CEST)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsziT-0000GZ-Vc
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 21:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hszhi-0008CU-6i
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 21:16:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hszhh-0001Cs-C7
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 21:16:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:32388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>)
 id 1hszhd-00018Z-2C; Wed, 31 Jul 2019 21:16:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 18:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,332,1559545200"; d="scan'208";a="180500643"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.216])
 ([10.239.196.216])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2019 18:16:09 -0700
To: Daniel Black <daniel@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190731084034.9498-1-daniel@linux.ibm.com>
 <20190731191740.58e474cc@volution.fritz.box>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <6d42f8c2-17c1-b172-a670-0a506cfc1ec2@intel.com>
Date: Thu, 1 Aug 2019 09:16:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731191740.58e474cc@volution.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [PATCH] numa: numa nodeid need not be sequential
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:sPAPR" <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/2019 5:17 PM, Daniel Black wrote:
> 
> 
> On Wed, 31 Jul 2019 18:40:33 +1000
> Daniel Black <daniel@linux.ibm.com> wrote:
> 
>> Replace all nodeid assumptions with lookups in the numa_info array
> 
> Tao Xu,
> 
> Sorry, only just noticed your patches of the move of numa_info and other
> elements into MachineState. I approve of it. Lets see if I can follow
> all of Igor's comments there too.
> 
> I'll be up for a V2 once merged.
> 
> Cheers,
> 
> Daniel
> 
OK, Thanks

