Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C5828BC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 02:36:31 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hunSo-0005l5-Os
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 20:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38239)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hunSH-0005Ie-Rb
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hunSH-0003pC-0X
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:35:57 -0400
Received: from mga11.intel.com ([192.55.52.93]:49096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hunSG-0003jj-P3
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:35:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="168136541"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2019 17:35:48 -0700
Date: Tue, 6 Aug 2019 08:35:19 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190806003519.GA8331@richard>
References: <20190805002847.3284-1-richardw.yang@linux.intel.com>
 <20190805111225.GJ13734@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805111225.GJ13734@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [PATCH v2] hmp: Remove migration capabilities from
 "info migrate"
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
Cc: armbru@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 05, 2019 at 12:12:25PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> With the growth of migration capabilities, it is not proper to display
>> them in "info migrate". Users are recommended to use "info
>> migrate_capabiltiies" to list them.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> 
>> ---
>> v2:
>>   * remove capabilities from "info migrate"
>> ---
>>  monitor/hmp-cmds.c | 13 +------------
>>  1 file changed, 1 insertion(+), 12 deletions(-)
>> 
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 99ceb0846b..05a09987da 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -220,24 +220,13 @@ static char *SocketAddress_to_str(SocketAddress *addr)
>>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>>  {
>>      MigrationInfo *info;
>> -    MigrationCapabilityStatusList *caps, *cap;
>> +    MigrationCapabilityStatusList *caps;
>>  
>>      info = qmp_query_migrate(NULL);
>>      caps = qmp_query_migrate_capabilities(NULL);
>
>Why keep 'caps' and query them? Can't this go as well?

You are right. Let me remove it.


-- 
Wei Yang
Help you, Help me

