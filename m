Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70797565
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:53:49 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0MNI-00024Q-6V
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i0MLd-0008OC-MS
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i0MLc-00028h-Ns
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:52:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:16940)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1i0MLc-00026J-Fp
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:52:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 01:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="202954686"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2019 01:51:57 -0700
Date: Wed, 21 Aug 2019 16:51:33 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190821085133.GA30352@richard>
References: <20190621142739.23703-1-richardw.yang@linux.intel.com>
 <20190819032947.GB18468@richard> <20190819112655.GB2765@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819112655.GB2765@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH] migrtion: define
 MigrationState/MigrationIncomingState.state as MigrationStatus
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 19, 2019 at 12:26:55PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> On Fri, Jun 21, 2019 at 10:27:39PM +0800, Wei Yang wrote:
>> >No functional change. Add default case to fix warning.
>> >
>> 
>> Hi, David & Juan
>> 
>> Do you like this?
>
>See other reply; but you are making patches a bit faster than I can
>review them!

Can I post v2 with new_state changed to use MigrationStatus?

Or when you prefer me to send a v2?

>
>Dave
-- 
Wei Yang
Help you, Help me

