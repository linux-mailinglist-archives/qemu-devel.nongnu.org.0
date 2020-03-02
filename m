Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C011759B7
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:48:29 +0100 (CET)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8jYi-0005GJ-EM
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1j8jXu-0004o2-O1
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:47:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1j8jXt-00068b-1m
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:47:37 -0500
Received: from mga04.intel.com ([192.55.52.120]:26635)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1j8jXs-00066R-PW
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:47:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 03:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="273688687"
Received: from yli41-mobl1.ccr.corp.intel.com (HELO [10.249.199.10])
 ([10.249.199.10])
 by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2020 03:47:29 -0800
Subject: Re: [PATCH v3 2/4] target/i386: Remove monitor from some CPU models
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20200212081328.7385-1-tao3.xu@intel.com>
 <20200212081328.7385-3-tao3.xu@intel.com>
 <20200228213909.GA481504@habkost.net>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <06a6cd99-7d11-7eee-c337-c71e756fc53f@intel.com>
Date: Mon, 2 Mar 2020 19:47:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228213909.GA481504@habkost.net>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/29/2020 5:39 AM, Eduardo Habkost wrote:
> On Wed, Feb 12, 2020 at 04:13:26PM +0800, Tao Xu wrote:
>> Add new version of Snowridge, Denverton, Opteron_G3, EPYC, and Dhyana
>> CPU model to uremove MONITOR/MWAIT featre.
>>
>> After QEMU/KVM use "-overcommit cpu-pm=on" to expose MONITOR/MWAIT
>> (commit id 6f131f13e68d648a8e4f083c667ab1acd88ce4cd), the MONITOR/MWAIT
>> feature in these CPU model is unused.
>>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> 
> What exactly is the problem you are trying to fix?
> 
> No CPU model will ever have monitor=on set by default with KVM,
> because kvm_default_props has a monitor=off element.
> 

Maybe it is not a fix. For example, when we boot a guest with Denverton
cpu model, guest cannot detect MONITOR/MWAIT and boot with no warning, 
because of "monitor=off" by default. The MONITOR/MWAIT feature in these 
CPU model is unused,but no harm. I am wondering if we should remove it 
from existing CPU models.

