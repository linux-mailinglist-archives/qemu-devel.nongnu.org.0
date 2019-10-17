Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABE0DA2C9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 02:43:59 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKttW-0007rp-VO
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 20:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKtsZ-0007Ob-Un
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 20:43:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKtsX-0003ic-VS
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 20:42:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:4310)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iKtsW-0003fd-S5
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 20:42:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 17:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,305,1566889200"; d="scan'208";a="397353413"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2019 17:42:48 -0700
Date: Thu, 17 Oct 2019 08:42:33 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] checkpatch: sugguest to use qemu_real_host_page_size
 instead of getpagesize() or sysconf(_SC_PAGESIZE)
Message-ID: <20191017004233.GA12405@richard>
References: <20191016012432.22731-1-richardw.yang@linux.intel.com>
 <d45f4f13-cff1-9a17-6ce3-255dcca5503b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d45f4f13-cff1-9a17-6ce3-255dcca5503b@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: thuth@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 Wei Yang <richardw.yang@linux.intel.com>, pbonzini@redhat.com,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 16, 2019 at 08:43:32AM -0700, Richard Henderson wrote:
>On 10/15/19 6:24 PM, Wei Yang wrote:
>>  		if ($line =~ /\bbzero\(/) {
>>  			ERROR("use memset() instead of bzero()\n" . $herecurr);
>>  		}
>> +		if ($line =~ /getpagesize\(\)/) {
>> +			ERROR("use qemu_real_host_page_size instead of getpagesize()\n" . $herecurr);
>> +		}
>> +		if ($line =~ /sysconf\(_SC_PAGESIZE\)/) {
>
>Use \b to match beginning of symbol like bzero did?
>

You are right, thanks for the suggestion.

>
>r~

-- 
Wei Yang
Help you, Help me

