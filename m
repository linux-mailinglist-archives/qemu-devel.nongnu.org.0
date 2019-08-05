Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2F8102E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 04:05:18 +0200 (CEST)
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huSNB-00025L-A5
	for lists+qemu-devel@lfdr.de; Sun, 04 Aug 2019 22:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1huSMf-0001ZD-65
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 22:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1huSMe-0006M3-8A
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 22:04:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:13970)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1huSMe-0006L2-0p
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 22:04:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Aug 2019 19:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,348,1559545200"; d="scan'208";a="185170794"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 04 Aug 2019 19:04:14 -0700
Date: Mon, 5 Aug 2019 10:03:46 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190805020346.GA18220@richard>
References: <20190711080816.6405-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711080816.6405-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH] migration/postcopy: PostcopyState is
 already set in loadvm_postcopy_handle_advise()
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

On Thu, Jul 11, 2019 at 04:08:16PM +0800, Wei Yang wrote:
>PostcopyState is already set to ADVISE at the beginning of
>loadvm_postcopy_handle_advise().
>
>Remove the redundant set.

Ping~

>
>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>---
> migration/savevm.c | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/migration/savevm.c b/migration/savevm.c
>index 8a2ada529e..2350e219fc 100644
>--- a/migration/savevm.c
>+++ b/migration/savevm.c
>@@ -1648,8 +1648,6 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
>         return -1;
>     }
> 
>-    postcopy_state_set(POSTCOPY_INCOMING_ADVISE);
>-
>     return 0;
> }
> 
>-- 
>2.17.1

-- 
Wei Yang
Help you, Help me

