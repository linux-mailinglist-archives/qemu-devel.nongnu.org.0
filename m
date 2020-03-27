Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902CD195C5B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 18:18:02 +0100 (CET)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHscL-0006fA-0r
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 13:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHsbP-0005wM-Dd
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHsbN-0004Em-0w
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:17:02 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:2391)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHsbL-000474-Qk
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:17:00 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea5e7e34f55c0-df516;
 Sat, 28 Mar 2020 01:16:39 +0800 (CST)
X-RM-TRANSID: 2eea5e7e34f55c0-df516
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.43.82] (unknown[117.136.46.213])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee45e7e34f68cc-d222f;
 Sat, 28 Mar 2020 01:16:39 +0800 (CST)
X-RM-TRANSID: 2ee45e7e34f68cc-d222f
Subject: Re: [PATCH] migration: fix bad indentation in error_report()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200327081221.201520-1-maozhongyi@cmss.chinamobile.com>
 <20200327114148.GE2786@work-vm>
From: maozy <maozhongyi@cmss.chinamobile.com>
Message-ID: <c63e5df1-dc30-c269-9ab7-398d87541398@cmss.chinamobile.com>
Date: Sat, 28 Mar 2020 01:16:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20200327114148.GE2786@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/27/20 7:41 PM, Dr. David Alan Gilbert wrote:
> * Mao Zhongyi (maozhongyi@cmss.chinamobile.com) wrote:
>> bad indentation conflicts with CODING_STYLE doc.
>>
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>> ---
>>   migration/migration.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index c4c9aee15e..aa43137bd2 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1203,15 +1203,15 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>>   
>>       if (params->has_max_bandwidth && (params->max_bandwidth > SIZE_MAX)) {
>>           error_setg(errp, "Parameter 'max_bandwidth' expects an integer in the"
>> -                         " range of 0 to %zu bytes/second", SIZE_MAX);
>> +                   " range of 0 to %zu bytes/second", SIZE_MAX);
> 
> No, where a parameter crosses multiple lines, it is clearer to line up
> the continuation of the parameter with the parameter above.

Well, indeed. I got it, Thanks.

Mao

> 
>>           return false;
>>       }
>>   
>>       if (params->has_downtime_limit &&
>>           (params->downtime_limit > MAX_MIGRATE_DOWNTIME)) {
>>           error_setg(errp, "Parameter 'downtime_limit' expects an integer in "
>> -                         "the range of 0 to %d milliseconds",
>> -                         MAX_MIGRATE_DOWNTIME);
>> +                   "the range of 0 to %d milliseconds",
>> +                   MAX_MIGRATE_DOWNTIME);
> 
> same as above.
> 
>>           return false;
>>       }
>>   
>> @@ -2109,8 +2109,8 @@ void qmp_migrate_set_downtime(double value, Error **errp)
>>   {
>>       if (value < 0 || value > MAX_MIGRATE_DOWNTIME_SECONDS) {
>>           error_setg(errp, "Parameter 'downtime_limit' expects an integer in "
>> -                         "the range of 0 to %d seconds",
>> -                         MAX_MIGRATE_DOWNTIME_SECONDS);
>> +                   "the range of 0 to %d seconds",
>> +                   MAX_MIGRATE_DOWNTIME_SECONDS);
> 
> same as above.
> 
>>           return;
>>       }
>>   
>> @@ -2495,7 +2495,7 @@ retry:
>>           if (header_type >= MIG_RP_MSG_MAX ||
>>               header_type == MIG_RP_MSG_INVALID) {
>>               error_report("RP: Received invalid message 0x%04x length 0x%04x",
>> -                    header_type, header_len);
>> +                         header_type, header_len);
> 
> OK, yes that's better.
> 
>>               mark_source_rp_bad(ms);
>>               goto out;
>>           }
>> @@ -2504,9 +2504,9 @@ retry:
>>               header_len != rp_cmd_args[header_type].len) ||
>>               header_len > sizeof(buf)) {
>>               error_report("RP: Received '%s' message (0x%04x) with"
>> -                    "incorrect length %d expecting %zu",
>> -                    rp_cmd_args[header_type].name, header_type, header_len,
>> -                    (size_t)rp_cmd_args[header_type].len);
>> +                         "incorrect length %d expecting %zu",
>> +                         rp_cmd_args[header_type].name, header_type, header_len,
>> +                         (size_t)rp_cmd_args[header_type].len);
> 
> OK.
> 
>>               mark_source_rp_bad(ms);
>>               goto out;
>>           }
>> @@ -2561,7 +2561,7 @@ retry:
>>               }
>>               if (header_len != expected_len) {
>>                   error_report("RP: Req_Page_id with length %d expecting %zd",
>> -                        header_len, expected_len);
>> +                             header_len, expected_len);
> 
> OK.
> 
> Dave
> 
>>                   mark_source_rp_bad(ms);
>>                   goto out;
>>               }
>> -- 
>> 2.17.1
>>
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 



