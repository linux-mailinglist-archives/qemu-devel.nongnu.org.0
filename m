Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40A47AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 09:20:14 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hclw5-0001S0-0t
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 03:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hclvJ-0000ub-4r
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 03:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hclvI-0006rm-6l
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 03:19:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:54050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hclvH-0006nr-Uq
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 03:19:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 00:19:19 -0700
X-ExtLoop1: 1
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.224])
 ([10.239.196.224])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 00:19:18 -0700
To: Igor Mammedov <imammedo@redhat.com>
References: <20190508061726.27631-1-tao3.xu@intel.com>
 <20190508061726.27631-12-tao3.xu@intel.com>
 <20190616220709.65b066ec@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <200e1e1d-89b8-2a70-d9cb-533e2ca28883@intel.com>
Date: Mon, 17 Jun 2019 15:19:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616220709.65b066ec@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-devel] [PATCH v4 11/11] hmat acpi: Implement _HMA method
 to update HMAT at runtime
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
Cc: "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>, "Liu, Jingqi" <jingqi.liu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/2019 4:07 AM, Igor Mammedov wrote:
> On Wed,  8 May 2019 14:17:26 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
> 
>> From: Liu Jingqi <jingqi.liu@intel.com>
>>
>> OSPM evaluates HMAT only during system initialization.
>> Any changes to the HMAT state at runtime or information
>> regarding HMAT for hot plug are communicated using _HMA method.
>>
>> _HMA is an optional object that enables the platform to provide
>> the OS with updated Heterogeneous Memory Attributes information
>> at runtime. _HMA provides OSPM with the latest HMAT in entirety
>> overriding existing HMAT.
> 
> it seems that there aren't any user interface to actually introduce
> new HMAT data during runtime. If it's so lets drop 10-11/11 for now,
> you can add it later when/if you add QMP interface to update/replace
> HMAT at runtime.
> 

OK Thank you for your review, the v5 HMAT patches have been sent into 
QEMU mailing list without the _HMA part. This part I will add QMP 
interface for updating HMAT later.


