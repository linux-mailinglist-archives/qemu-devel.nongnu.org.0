Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B3D14DF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 19:07:13 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIFQe-0000um-6F
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 13:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iI7E7-0006JA-Q1
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iI7E6-0003sw-6O
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:21:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:44360)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iI7E5-0003s9-Ux
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:21:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 01:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="205678883"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.191])
 ([10.239.196.191])
 by orsmga002.jf.intel.com with ESMTP; 09 Oct 2019 01:21:36 -0700
Subject: Re: [PATCH v5 1/2] x86/cpu: Add support for UMONITOR/UMWAIT/TPAUSE
To: Paolo Bonzini <pbonzini@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>, 
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>
References: <20190929015718.19562-1-tao3.xu@intel.com>
 <20190929015718.19562-2-tao3.xu@intel.com>
 <6762960d-80a6-be31-399d-f62e33b31f28@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <7e43e268-d94e-a66f-9254-3de03313a064@intel.com>
Date: Wed, 9 Oct 2019 16:21:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6762960d-80a6-be31-399d-f62e33b31f28@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: "Liu, Jingqi" <jingqi.liu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/2019 4:06 PM, Paolo Bonzini wrote:
> On 29/09/19 03:57, Tao Xu wrote:
>> +    } else if (function == 7 && index == 0 && reg == R_ECX) {
>> +        if (enable_cpu_pm) {
>> +            ret |= CPUID_7_0_ECX_WAITPKG;
> 
> This is incorrect.  You should disable WAITPKG if !enable_cpu_pm, but
> you should not enable it forcefully if enable_cpu_pm is true.
> 
> Paolo
> 
>> +        } else {
>> +            ret &= ~CPUID_7_0_ECX_WAITPKG;
>> +        }
> 

Got it, thank you.

