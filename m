Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775EF79D81
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 02:44:20 +0200 (CEST)
Received: from localhost ([::1]:57258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsGFX-0008BC-O7
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 20:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60770)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsGEj-0007PJ-Hx
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsGEi-0003f6-M8
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:43:29 -0400
Received: from mga02.intel.com ([134.134.136.20]:57972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hsGEi-0003e3-Ec
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:43:28 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 17:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="182953691"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 29 Jul 2019 17:43:24 -0700
Date: Tue, 30 Jul 2019 08:43:02 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Ivan Ren <renyime@gmail.com>
Message-ID: <20190730004302.GC17604@richard>
References: <1564387281-12321-1-git-send-email-ivanren@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564387281-12321-1-git-send-email-ivanren@tencent.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-devel] [PATCH v2 0/3] migration: add speed limit for
 multifd migration
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 29, 2019 at 04:01:18PM +0800, Ivan Ren wrote:
>Currently multifd migration has not been limited and it will consume
>the whole bandwidth of Nic. These two patches add speed limitation to
>it.
>
>This is the v2 patches, differences with v1:
>1. change qemu_file_update_rate_transfer interface name
>   to qemu_file_update_transfer
>2. add a new patch to update ram_counters for multifd sync packet

Usually we cc those who gave us comment.

>
>Ivan Ren (3):
>  migration: add qemu_file_update_transfer interface
>  migration: add speed limit for multifd migration
>  migration: update ram_counters for multifd sync packet
>
> migration/qemu-file.c |  5 +++++
> migration/qemu-file.h |  1 +
> migration/ram.c       | 24 ++++++++++++++----------
> 3 files changed, 20 insertions(+), 10 deletions(-)
>
>-- 
>2.17.2 (Apple Git-113)
>

-- 
Wei Yang
Help you, Help me

