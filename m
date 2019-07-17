Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6156B312
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 03:15:44 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnYXm-0005bY-8X
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 21:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnYXY-00056L-7S
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnYXX-0000Xz-8n
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:15:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:64324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnYXX-0000W4-02
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:15:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 18:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="170101023"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 16 Jul 2019 18:15:23 -0700
Date: Wed, 17 Jul 2019 09:14:59 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190717011459.GB14233@richard>
References: <20190402003106.17614-1-richardw.yang@linux.intel.com>
 <20190611082520.GA11125@richard> <87zhmottba.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhmottba.fsf@trasno.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Hi, Juan

Sounds we lost this one and the one above this :-)


-- 
Wei Yang
Help you, Help me

