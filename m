Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD6C12B1
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 03:32:16 +0200 (CEST)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEO4N-00021e-Bf
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 21:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iEO2S-0001M9-Cs
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 21:30:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iEO2Q-0008On-GG
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 21:30:15 -0400
Received: from mga01.intel.com ([192.55.52.88]:43548)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iEO2Q-0008Ll-82
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 21:30:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Sep 2019 18:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,561,1559545200"; d="scan'208";a="390424450"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.82])
 ([10.239.196.82])
 by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2019 18:30:08 -0700
Subject: Re: [PATCH RESEND v4 1/2] x86/cpu: Add support for
 UMONITOR/UMWAIT/TPAUSE
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190918072329.1911-1-tao3.xu@intel.com>
 <20190918072329.1911-2-tao3.xu@intel.com>
 <a1156a86-3ec3-da72-306b-1fafa0c369d7@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <705e50fa-2d98-52ac-cdb7-1d68ca8f4b5d@intel.com>
Date: Sun, 29 Sep 2019 09:30:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a1156a86-3ec3-da72-306b-1fafa0c369d7@redhat.com>
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/2019 4:22 AM, Paolo Bonzini wrote:
> On 18/09/19 09:23, Tao Xu wrote:
>> +    } else if (function == 7 && index == 0 && reg == R_ECX) {
>> +        if (enable_cpu_pm) {
>> +            ret |= CPUID_7_0_ECX_WAITPKG;
>> +        }
> 
> This should be the opposite; remove the bit if enable_cpu_pm is not set.
> 
> Paolo
> 
Thanks, I will improve it.

