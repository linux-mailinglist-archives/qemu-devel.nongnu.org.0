Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2497172D53
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 01:31:29 +0100 (CET)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7TYu-000666-IO
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 19:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi.qiang@intel.com>) id 1j7TXw-0005eG-Dc
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 19:30:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chenyi.qiang@intel.com>) id 1j7TXu-0005Tx-PE
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 19:30:27 -0500
Received: from mga05.intel.com ([192.55.52.43]:56255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chenyi.qiang@intel.com>)
 id 1j7TXu-0005TM-FT
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 19:30:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 16:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="232376433"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.4.174])
 ([10.238.4.174])
 by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2020 16:30:20 -0800
Subject: Re: [PATCH 3/3] target/i386: modify Icelake-Client and Icelake-Server
 CPU model number
To: Jack Wang <jack.wang.usish@gmail.com>
References: <20200227090808.17686-1-chenyi.qiang@intel.com>
 <20200227090808.17686-4-chenyi.qiang@intel.com>
 <CA+res+RaoGehJV87ffKSEoHAzvw=2q+enM6nhK-is3TAQoyvWA@mail.gmail.com>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <11f9943c-ba2c-219a-3878-c0e5d02cfdc7@intel.com>
Date: Fri, 28 Feb 2020 08:30:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+res+RaoGehJV87ffKSEoHAzvw=2q+enM6nhK-is3TAQoyvWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/27/2020 5:48 PM, Jack Wang wrote:
> Chenyi Qiang <chenyi.qiang@intel.com> 于2020年2月27日周四 上午10:07写道：
>>
>> According to the Intel Icelake family list, Icelake-Client uses model
>> number 126(0x7D)
> 0x7D is 125 in hex, so the commit message needs to be fixed.
> 

Sorry, my mistake.

> 
> Cheers
> Jack Wang
> 

