Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F562EC4F0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:33:59 +0100 (CET)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFVG-0005ld-Or
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxFUG-00059w-CQ
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:32:56 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:52786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxFUD-0007Y4-B8
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:32:55 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106KPcQY095366;
 Wed, 6 Jan 2021 20:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=a8YPHwo3bVckvlgbMoz0OOrB13yld8cCoZwk+uTLIKI=;
 b=S8ugiBSOYYnWotmRd17EkOTV3717aZITfE+ilRBpxj7m6jhsic/YPITJcG7GXOSG6SPi
 Lfm9cHvPCdE7GA0ckHkr5dGFDo8DJNDrPCzy6IccAUkVEQK5PP/Xs2JYr1pNk2E5nM4D
 3MrgE3S2eGvKFv0aa7ajriGM/jsHJSGLF2nx9sG44U/5f41UkKiisngyZoOyb3t0ksu5
 MQ4DA5Imwq0VBJ1y7pxy16fZyWy78+TuxJ5xoOAXTE24MlWwK+qhVqKFYDUFJR1PSwKK
 EzHJ6QVxbmKkNKeP2BSH8fn2sZvttDq5BuCqaTxugg8QYZlgaXhQFh5ZFCrKGRUDu+vT FQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35wftx9b4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 20:32:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106KOowh104543;
 Wed, 6 Jan 2021 20:32:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 35v1faa1ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 20:32:49 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 106KWlui016288;
 Wed, 6 Jan 2021 20:32:48 GMT
Received: from [10.39.251.70] (/10.39.251.70)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 12:32:47 -0800
Subject: Re: [PATCH V2] vl: pause option
From: Steven Sistare <steven.sistare@oracle.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>
References: <1604332203-435466-1-git-send-email-steven.sistare@oracle.com>
 <d93b83ea-f31d-4e6b-2350-c6d4c9b71448@redhat.com> <87imakby2n.fsf@linaro.org>
 <db5462f0-f96f-2498-3aa3-ec322462ba22@oracle.com>
Organization: Oracle Corporation
Message-ID: <3980882a-c99b-9cf9-57b9-5a352a87df3d@oracle.com>
Date: Wed, 6 Jan 2021 15:32:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <db5462f0-f96f-2498-3aa3-ec322462ba22@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060116
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/2020 9:55 AM, Steven Sistare wrote:
> On 11/4/2020 4:40 PM, Alex Bennée wrote:
>> Eric Blake <eblake@redhat.com> writes:
>>> On 11/2/20 9:50 AM, Steve Sistare wrote:
>>>> Provide the -pause command-line parameter and the QEMU_PAUSE environment
>>>> variable to pause QEMU during process startup using SIGSTOP and allow a
>>>> developer to attach a debugger, or observe the process using tools such as
>>>> strace.  Useful when the QEMU has been launched with some other entity, such
>>>> as libvirt.  QEMU_PAUSE is checked in a constructor at the highest priority,
>>>> and can be used to debug other constructors.  The -pause option is checked
>>>> later, during argument processing in main, but is useful if passing an
>>>> environment variable from a launcher to qemu is awkard.
>>>>
>>>> Usage: qemu -pause, or QEMU_PAUSE=1
>>>> After attaching a debugger, send SIGCONT to the qemu process to continue.
>>>
>>> Changing behavior via a new environment variable is awkward.  What
>>> happens, for example, if libvirt inherits this variable set, but is not
>>> aware of its impact to alter how qemu starts up?  Can we get by with
>>> ONLY a command line option?
>>>
>>> Also, how does this option differ from what we already have with qemu
>>> --preconfig?
>>
>> In the original discussion:
>>
>>   Subject: [PATCH V1 12/32] vl: pause option
>>   Date: Thu, 30 Jul 2020 08:14:16 -0700
>>   Message-Id: <1596122076-341293-13-git-send-email-steven.sistare@oracle.com>
>>
>> it seems the idea was to stop qemu as early as possible for debugging
>> when launched by some other launcher which wasn't modifiable except by
>> pass through configuration to QEMU's command line.
>>
>> <snip>
>>
>>> Isn't it always possible to provide a wrapper qemu process to be invoked
>>> by whatever third-party management app (like libvirt), where your
>>> wrapper then starts the real qemu under gdb to begin with, rather than
>>> having to hack qemu itself to have a special start-up mode?
>>
>> I agree - this feels like a bit of an over complication as a debug
>> helper. How many times can a failure to launch by some binary blob not
>> be debugged by either a gdb follow-fork or a copying of the command line
>> and running gdb --args?
> 
> Follow fork is awkward and error prone when the launcher performs many forks before forking
> qemu. gdb --args does not work when the launcher sets up an environment for qemu to run
> in, pre-opening fd's being just one example.  For developers, often the "launcher" is a 
> script that performs setup and passes the myriad qemu options.  Even in that case, it is
> easier to add a flag or set an env var to enable debugging. The pause option is fast 
> (for the user) and reliable.  
> 
> I have a new version of the patch that handles the signal more smoothly, so the handshake
> with gdb is easier:
> 
>     $ QEMU_PAUSE=1 qemu-system-x86_64 ...
>     QEMU pid 18371 is stopped.
> 
>                                      $ gdb -p 18371
>                                      (gdb) break rcu_init
>                                      (gdb) signal SIGCONT
>                                      Breakpoint 1, rcu_init () at util/rcu.c:380
> 
> The implementation does not even send a signal to qemu, so the launcher is none the wiser:
> 
> static void pause_me(void)
> {
>     int sig;
>     sigset_t set, oldset;
>     sigemptyset(&set);
>     sigaddset(&set, SIGCONT);
>     printf("QEMU pid %d is stopped.  Send SIGCONT to continue.\n", getpid());
>     sigprocmask(SIG_BLOCK, &set, &oldset);
>     sigwait(&set, &sig);                          <-- PAUSES HERE
>     sigprocmask(SIG_SETMASK, &oldset, 0);
> }
> 
> 
> I will post it if you are still open to the idea.  Please let me know.

I am posting a V3 version of the patch with the above change.  I have found it easy to
use and robust. See your inboxes shortly.

- Steve

