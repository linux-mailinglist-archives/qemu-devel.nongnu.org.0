Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC54E18B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 10:01:42 +0200 (CEST)
Received: from localhost ([::1]:55376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heEKF-0005Sh-RA
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 03:51:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1heEIE-0004Iz-M3
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:49:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1heECo-0003Jy-Ka
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:43:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:45006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1heECl-0002xF-Kj
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:43:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 00:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,399,1557212400"; d="scan'208";a="243896410"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 21 Jun 2019 00:43:24 -0700
Date: Fri, 21 Jun 2019 15:43:00 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190621074300.GA17378@richard>
References: <20190402003106.17614-1-richardw.yang@linux.intel.com>
 <20190611082520.GA11125@richard> <87zhmottba.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhmottba.fsf@trasno.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 11, 2019 at 10:33:29AM +0200, Juan Quintela wrote:
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>> On Tue, Apr 02, 2019 at 08:31:06AM +0800, Wei Yang wrote:
>>>MigrationState->bytes_xfer is only set to 0 in migrate_init().
>>>
>>>Remove this unnecessary field.
>>>
>>>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>
>> Hi, David
>
>Hi
>
>I am on duty this week, will get it.
>

Hi, Juan,

May I ask when you are willing to pick it up?

>>
>> Are you willing to pick up this one?
>>
>>>---
>>> migration/migration.c | 1 -
>>> migration/migration.h | 1 -
>>> 2 files changed, 2 deletions(-)
>>>
>>>diff --git a/migration/migration.c b/migration/migration.c
>>>index dea7078bf4..c929cf8d0f 100644
>>>--- a/migration/migration.c
>>>+++ b/migration/migration.c
>>>@@ -1681,7 +1681,6 @@ void migrate_init(MigrationState *s)
>>>      * parameters/capabilities that the user set, and
>>>      * locks.
>>>      */
>>>-    s->bytes_xfer = 0;
>>>     s->cleanup_bh = 0;
>>>     s->to_dst_file = NULL;
>>>     s->rp_state.from_dst_file = NULL;
>>>diff --git a/migration/migration.h b/migration/migration.h
>>>index 852eb3c4e9..b9efbe9168 100644
>>>--- a/migration/migration.h
>>>+++ b/migration/migration.h
>>>@@ -116,7 +116,6 @@ struct MigrationState
>>>     DeviceState parent_obj;
>>> 
>>>     /*< public >*/
>>>-    size_t bytes_xfer;
>>>     QemuThread thread;
>>>     QEMUBH *cleanup_bh;
>>>     QEMUFile *to_dst_file;
>>>-- 
>>>2.19.1

-- 
Wei Yang
Help you, Help me

