Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D66C407
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:12:02 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnuxl-0002S2-Db
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnuxZ-000233-9S
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:11:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnuxY-0008IQ-D9
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:11:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:23296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnuxY-0008HJ-55
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:11:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 18:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="319490837"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga004.jf.intel.com with ESMTP; 17 Jul 2019 18:11:44 -0700
Date: Thu, 18 Jul 2019 09:11:20 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190718011120.GB15881@richard>
References: <20190430034412.12935-1-richardw.yang@linux.intel.com>
 <20190430034412.12935-4-richardw.yang@linux.intel.com>
 <dd14052c-b3ed-88b0-b7f4-69dae2a7a660@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd14052c-b3ed-88b0-b7f4-69dae2a7a660@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [PATCH 3/3] ram: RAMBlock->offset is always
 aligned to a word
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
Cc: quintela@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 17, 2019 at 11:17:50AM +0200, Paolo Bonzini wrote:
>On 30/04/19 05:44, Wei Yang wrote:
>> RAMBlock->offset is calculated by find_ram_offset, which makes sure the
>> offset is aligned to a word.
>> 
>> This patch removes the alignment check on offset and unnecessary
>> variable *word*.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>I would add an assertion instead, but overall leaving the condition
>there is harmless.  You still need the "else" part for the case where
>the length is unaligned.
>

Thanks, then I would leave current code untouched.

>Paolo
>

-- 
Wei Yang
Help you, Help me

