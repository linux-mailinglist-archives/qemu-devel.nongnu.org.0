Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB082B88
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 08:20:22 +0200 (CEST)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huspY-0004Hn-Rh
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 02:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hang.yuan@linux.intel.com>) id 1husp3-0003qf-80
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 02:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hang.yuan@linux.intel.com>) id 1husp2-0001tr-E6
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 02:19:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:61234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hang.yuan@linux.intel.com>)
 id 1husp2-0001ko-4m
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 02:19:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 23:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="373313002"
Received: from unknown (HELO [10.238.157.73]) ([10.238.157.73])
 by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2019 23:19:39 -0700
To: qemu-devel@nongnu.org
References: <0c127d4a-ea95-8566-5392-a0f17c871cec@linux.intel.com>
 <ea45ebfa-4c0e-81dc-914d-bfc0bae2d565@linux.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <7c2dedc6-562e-70fe-9b9f-d750051b7e91@linux.intel.com>
Date: Tue, 6 Aug 2019 14:09:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ea45ebfa-4c0e-81dc-914d-bfc0bae2d565@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] x86 VMCS guest interruptibility state save/load
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
Cc: yi.y.sun@intel.com, colin.xu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In summary, sounds all non-register guest states in VMCS structure are
not saved in snapshot. I don't understand why they don't need to save in
snapshot and load from snapshot to construct VMCS. Does anyone have any
idea?

Thanks,
Henry

On 7/30/19 5:05 PM, Hang Yuan wrote:
> Hello all,
>
> When I read QEMU and KVM codes on saving/loading snapshot, I don't 
> find the interruptibility state in x86 VMCS structure is saved and 
> loaded in QEMU though KVM supports getting/setting this field 
> from/into VMCS. (No "env.interrupt.shadow" in QEMU 
> vmstate_x86_cpu.fields.) I understand it may cause guest-state error 
> if this field is not restored but other registers or VMCS fields are 
> restored. Do you think it's a valid issue?
>
> Thanks,
> Henry



