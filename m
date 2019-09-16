Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6AB3495
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 08:08:04 +0200 (CEST)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9kB9-0007cB-Fg
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 02:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i9kAG-0007Bz-Uu
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 02:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i9kAF-0004WA-Pn
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 02:07:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:2723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1i9kAE-0004UB-GS
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 02:07:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Sep 2019 23:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="180332647"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 15 Sep 2019 23:07:02 -0700
Date: Mon, 16 Sep 2019 14:06:42 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190916060642.GA13437@richard>
References: <20190819061843.28642-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819061843.28642-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH 0/3] migration/postcopy: unsentmap is not
 necessary
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Dave and Juan

Would you mind taking a look at this one?

On Mon, Aug 19, 2019 at 02:18:40PM +0800, Wei Yang wrote:
>Three patches to cleanup postcopy:
>
>[1]: split canonicalize bitmap and discard page
>[2]: remove unsentmap since it is not necessary
>[3]: cleanup the get_queued_page_not_dirty
>
>Wei Yang (3):
>  migration/postcopy: not necessary to do discard when canonicalizing
>    bitmap
>  migration/postcopy: unsentmap is not necessary for postcopy
>  migration: remove sent parameter in get_queued_page_not_dirty
>
> include/exec/ram_addr.h |  6 ---
> migration/ram.c         | 94 +++++++----------------------------------
> migration/trace-events  |  2 +-
> 3 files changed, 16 insertions(+), 86 deletions(-)
>
>-- 
>2.17.1

-- 
Wei Yang
Help you, Help me

