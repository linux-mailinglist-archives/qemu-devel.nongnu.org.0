Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79F22C39
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 08:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSbyH-0007I8-JJ
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 02:40:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSbxJ-00071C-3m
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:39:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSbxH-00031P-5r
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:39:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:42523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSbxD-0002zV-GS
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:39:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 23:39:21 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 19 May 2019 23:39:19 -0700
Date: Mon, 20 May 2019 14:38:49 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190520063849.GB6718@richard>
References: <20190515121544.4597-1-quintela@redhat.com>
	<20190515121544.4597-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515121544.4597-2-quintela@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [PATCH v3 1/8] migration: fix multifd_recv event
 typo
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 15, 2019 at 02:15:37PM +0200, Juan Quintela wrote:
>It uses num in multifd_send().  Make it coherent.
>
>Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
> migration/trace-events | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/migration/trace-events b/migration/trace-events
>index de2e136e57..cd50a1e659 100644
>--- a/migration/trace-events
>+++ b/migration/trace-events
>@@ -80,7 +80,7 @@ get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned
> migration_bitmap_sync_start(void) ""
> migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
> migration_throttle(void) ""
>-multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet number %" PRIu64 " pages %d flags 0x%x next packet size %d"
>+multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
> multifd_recv_sync_main(long packet_num) "packet num %ld"
> multifd_recv_sync_main_signal(uint8_t id) "channel %d"
> multifd_recv_sync_main_wait(uint8_t id) "channel %d"
>-- 
>2.21.0
>

-- 
Wei Yang
Help you, Help me

