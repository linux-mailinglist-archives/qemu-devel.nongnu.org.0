Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79B23381D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 20:04:31 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Cur-0007Q9-4v
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 14:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1CtR-0006q6-5S
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 14:03:01 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1CtO-0008Np-S3
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 14:03:00 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UI2uPf067826;
 Thu, 30 Jul 2020 18:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=cSWwi8WGYA88OehtWlb+LbL8InwmikPB0VvsAdnuCEQ=;
 b=meYgeMGRl78glN6iwts8QDouK1Prc3gwGwSs0zqfUo09YXw3/C4cbhcL0gVH03fx3gXj
 towQU6WmIbz6y6eGrNYfzQ4W1ScrP29VZIYyhhQTB5apuuoRhh0as2xwYMR1eJi86u9E
 xAfzG/AGKTQdhfgY/7xcuMLrjhytUoEeIZRVZWH/g8Zd7sZ55mmlf1rqnXgHm8Hpp9a+
 K4qh5n3SgbHbksE3r0o6erywQa+lC5Coxoe7POGoLg10NK4hN7kDKNWlmvx7PLKdnGqV
 4S9bpuVK4FIBg/VYNsqQZMZJC3KnXsn+vo7cb/iG6ibvI75D69FtLLmFL6VQnBhbl97e Pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 32hu1jn69f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 18:02:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UI2qhv190766;
 Thu, 30 Jul 2020 18:02:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 32hu5xr1kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 18:02:54 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06UI2opT027106;
 Thu, 30 Jul 2020 18:02:50 GMT
Received: from [10.39.200.60] (/10.39.200.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jul 2020 11:02:50 -0700
Subject: Re: [PATCH V1 07/32] savevm: QMP command for cprinfo
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-8-git-send-email-steven.sistare@oracle.com>
 <6f601210-55e8-d049-0ba7-eb20533aa841@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <61a2d3b4-55b5-dcb0-3ee6-cc8c7a1020ef@oracle.com>
Date: Thu, 30 Jul 2020 14:02:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6f601210-55e8-d049-0ba7-eb20533aa841@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300128
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 14:00:56
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/2020 12:17 PM, Eric Blake wrote:
> On 7/30/20 10:14 AM, Steve Sistare wrote:
>> Provide the cprinfo QMP command.  This returns a string with a space-
>> separated list of modes supported by cprsave, and can be used by clients
>> as a feature test to check if the running QEMU instance supports cprsave.
> 
> When you've already got array support in the QMP language, why are you making the user parse a string into an array after the fact?

Will fix as you suggest, thanks.  I had HMP on the brain - Steve

>> Syntax:
>>    {'command':'cprinfo', 'returns':'str'}
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
> 
>> +++ b/qapi/migration.json
>> @@ -1623,6 +1623,15 @@
>>     'data': { 'device-id': 'str' } }
>>     ##
>> +# @cprinfo:
>> +#
>> +# Return a space-delimited list of modes supported by the cprsave command
>> +#
>> +# Since 5.0
>> +##
>> +{ 'command': 'cprinfo', 'returns': 'str' }
> 
> Returning a 'str' is non-extensible.  The fact that you had to edit the whitelist is proof that you should have done something better.  I recommend:
> 
> { 'command': 'cprinfo', 'returns': { 'modes': [ 'CprMode' ] }
> 
> using the CprMode enum I proposed earlier.
> 
>> +
>> +##
>>   # @cprsave:
>>   #
>>   # Create a checkpoint of the virtual machine device state in @file.
>> diff --git a/qapi/pragma.json b/qapi/pragma.json
>> index cffae27..43bdb39 100644
>> --- a/qapi/pragma.json
>> +++ b/qapi/pragma.json
>> @@ -5,6 +5,7 @@
>>   { 'pragma': {
>>       # Commands allowed to return a non-dictionary:
>>       'returns-whitelist': [
>> +        'cprinfo',
> 
> This should not be needed.  Design the return value correctly in the first place.
> 
>>           'human-monitor-command',
>>           'qom-get',
>>           'query-migrate-cache-size',
>>
> 

