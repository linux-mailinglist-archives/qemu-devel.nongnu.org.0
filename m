Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0816E77
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 02:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOApU-00080w-TZ
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 20:53:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tao3.xu@intel.com>) id 1hOAo4-00077d-B3
	for qemu-devel@nongnu.org; Tue, 07 May 2019 20:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tao3.xu@intel.com>) id 1hOAo3-0003D8-DW
	for qemu-devel@nongnu.org; Tue, 07 May 2019 20:51:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:31670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hOAo3-0002zX-5k
	for qemu-devel@nongnu.org; Tue, 07 May 2019 20:51:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2019 17:51:29 -0700
X-ExtLoop1: 1
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.113])
	([10.239.196.113])
	by FMSMGA003.fm.intel.com with ESMTP; 07 May 2019 17:51:28 -0700
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20190507124853.9015-1-tao3.xu@intel.com>
	<20190507130722.GQ27205@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <0b823584-b5bf-68c2-ae35-ef33745f2010@intel.com>
Date: Wed, 8 May 2019 08:51:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507130722.GQ27205@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH v2] i386: Add some MSR based features on
 Cascadelake-Server CPU model
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
Cc: ehabkost@redhat.com, xiaoyao.li@intel.com, qemu-devel@nongnu.org,
	robert.hu@intel.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/2019 9:07 PM, Daniel P. Berrangé wrote:
> On Tue, May 07, 2019 at 08:48:53PM +0800, Tao Xu wrote:
>> As noted in
>> http://lists.gnu.org/archive/html/qemu-devel/2018-09/msg02212.html
> 
> Rather than pointing to the mailing list post, please just refer
> to the git commit hash that patch was merged under, which IIUC
> is c7a88b52f62b30c04158eeb07f73e3f72221b6a8.
> 

Thank you Daniel, I will improve my commit message in the next version 
of patch.

>> Because MSR based feature has been supported by QEMU,
>> we add CPUID_7_0_EDX_ARCH_CAPABILITIES on Cascadelake-Server CPU
>> model, and add IA32_ARCH_CAPABILITIES MSR based features (RDCL_NO,
>> IBRS_ALL and SKIP_L1DFL_VMENTRY).
>>
...

