Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E73C5E8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 10:27:46 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hac89-00009X-1s
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 04:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hac6I-0006yH-Mm
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 04:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hac6H-0004cD-Lx
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 04:25:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:57752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hac6H-0004Zj-Cj
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 04:25:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 01:25:46 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jun 2019 01:25:45 -0700
Date: Tue, 11 Jun 2019 16:25:20 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190611082520.GA11125@richard>
References: <20190402003106.17614-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190402003106.17614-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-devel] [PATCH] migration: remove unused field bytes_xfer
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

On Tue, Apr 02, 2019 at 08:31:06AM +0800, Wei Yang wrote:
>MigrationState->bytes_xfer is only set to 0 in migrate_init().
>
>Remove this unnecessary field.
>
>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Hi, David

Are you willing to pick up this one?

>---
> migration/migration.c | 1 -
> migration/migration.h | 1 -
> 2 files changed, 2 deletions(-)
>
>diff --git a/migration/migration.c b/migration/migration.c
>index dea7078bf4..c929cf8d0f 100644
>--- a/migration/migration.c
>+++ b/migration/migration.c
>@@ -1681,7 +1681,6 @@ void migrate_init(MigrationState *s)
>      * parameters/capabilities that the user set, and
>      * locks.
>      */
>-    s->bytes_xfer = 0;
>     s->cleanup_bh = 0;
>     s->to_dst_file = NULL;
>     s->rp_state.from_dst_file = NULL;
>diff --git a/migration/migration.h b/migration/migration.h
>index 852eb3c4e9..b9efbe9168 100644
>--- a/migration/migration.h
>+++ b/migration/migration.h
>@@ -116,7 +116,6 @@ struct MigrationState
>     DeviceState parent_obj;
> 
>     /*< public >*/
>-    size_t bytes_xfer;
>     QemuThread thread;
>     QEMUBH *cleanup_bh;
>     QEMUFile *to_dst_file;
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

