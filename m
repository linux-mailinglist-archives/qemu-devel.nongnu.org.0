Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658A6C405
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:08:32 +0200 (CEST)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnuuN-0000d0-6V
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52457)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnuuB-0000Db-7L
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnuuA-0005ST-BB
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:08:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:36601)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnuu9-0005Rg-Vb
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:08:18 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 18:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="319490038"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga004.jf.intel.com with ESMTP; 17 Jul 2019 18:08:15 -0700
Date: Thu, 18 Jul 2019 09:07:51 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190718010751.GA15881@richard>
References: <20190430034412.12935-1-richardw.yang@linux.intel.com>
 <20190430034412.12935-3-richardw.yang@linux.intel.com>
 <20190514142108.GG2753@work-vm> <20190717011337.GA14233@richard>
 <4b3016cd-de7b-3ab7-76b8-8608cb1239b6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b3016cd-de7b-3ab7-76b8-8608cb1239b6@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: Re: [Qemu-devel] [PATCH 2/3] migration/ram.c: start of
 cpu_physical_memory_sync_dirty_bitmap is always 0
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 17, 2019 at 11:16:19AM +0200, Paolo Bonzini wrote:
>On 17/07/19 03:13, Wei Yang wrote:
>> On Tue, May 14, 2019 at 03:21:08PM +0100, Dr. David Alan Gilbert wrote:
>>> * Wei Yang (richardw.yang@linux.intel.com) wrote:
>>>> Since start of cpu_physical_memory_sync_dirty_bitmap is always 0, we can
>>>> remove this parameter and simplify the calculation a bit.
>>>>
>>>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>>
>>> So I think you're right it's currently unused; however, lets ask
>>> Paolo: Do we need to keep this parameter for flexiblity?
>>>
>> 
>> Hey, Paolo
>> 
>> Do you have some spare time to give some insight?
>
>I think it's cleaner to leave the start argument in place.  However,
>I'll note that in migration_bitmap_sync_range the length argument is
>always block->used_length so that's also unnecessary (you already have
>block).
>

That's reasonable. 

>Paolo
>

-- 
Wei Yang
Help you, Help me

