Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2843BE0E4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:36:28 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0xQI-0003nP-SE
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0xOn-000385-Qy
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:34:53 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0xOk-00036K-OO
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:34:53 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GKNfF4b40z1CG5D;
 Wed,  7 Jul 2021 10:29:09 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 10:34:37 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 7 Jul 2021 10:34:37 +0800
Subject: Re: [PATCH 1/2] qapi/run-state: Add a new shutdown cause
 'migration-completed'
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210705123653.1315-1-jiangkunkun@huawei.com>
 <20210705123653.1315-2-jiangkunkun@huawei.com> <YOL/kw0lxn2ggGx4@redhat.com>
 <7b8324e9-85d8-1b14-4e63-308ea2563d56@huawei.com> <YOQwA27sg5SOQspC@work-vm>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <b089db57-486b-fb6f-0b90-8275b0165361@huawei.com>
Date: Wed, 7 Jul 2021 10:34:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YOQwA27sg5SOQspC@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/6 18:27, Dr. David Alan Gilbert wrote:
> * Kunkun Jiang (jiangkunkun@huawei.com) wrote:
>> Hi Daniel,
>>
>> On 2021/7/5 20:48, Daniel P. Berrangé wrote:
>>> On Mon, Jul 05, 2021 at 08:36:52PM +0800, Kunkun Jiang wrote:
>>>> In the current version, the source QEMU process does not automatic
>>>> exit after a successful migration. Additional action is required,
>>>> such as sending { "execute": "quit" } or ctrl+c. For simplify, add
>>>> a new shutdown cause 'migration-completed' to exit the source QEMU
>>>> process after a successful migration.
>>> IIUC, 'STATUS_COMPLETED' state is entered on the source host
>>> once it has finished sending all VM state, and thus does not
>>> guarantee that the target host has successfully received and
>>> loaded all VM state.
>> Thanks for your reply.
>>
>> If the target host doesn't successfully receive and load all VM state,
>> we can send { "execute": "cont" } to resume the soruce in time to
>> ensure that VM will not lost?
> Yes, that's pretty common at the moment;  the failed migration can
> happen at lots of different points:
>    a) The last part of the actual migration stream/loading the devices
>      - that's pretty easy, since the destination hasn't actually got
>      the full migration stream.
>
>    b) If the migration itself completes, but then the management system
>      then tries to reconfigure the networking/storage on the destination,
>      and something goes wrong in that, then it can roll that back and
>      cont on the source.
>
> So, it's a pretty common type of failure/recovery  - the management
> application has to be a bit careful not to do anything destructive
> until as late as possible, so it knows it can switch back.
Okay， I see.
>>> Typically a mgmt app will need to directly confirm that the
>>> target host QEMU has succesfully started running, before it
>>> will tell the source QEMU to quit.
>> 'a mgmt app', such as libvirt?
> Yes, it's currently libvirt that does that; but any of the control
> things could (it's just libvirt has been going long enough so it knows
> about lots and lots of nasty cases of migration failure, and recovering
> properly).
>
> Can you explain why did you want to get the source to automatically
> quit?  In a real setup where does it help?
Sorry, my thoughts on live migration scenarios are not comprehensive enough.

Thanks,
Kunkun Jiang
> Dave
>
>
>> Thanks,
>> Kunkun Jiang
>>> So, AFAICT, this automatic exit after STATUS_COMPLETED is
>>> not safe and could lead to total loss of the running VM in
>>> error scenarios.
>>>
>>>
>>>
>>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>>> ---
>>>>    migration/migration.c | 1 +
>>>>    qapi/run-state.json   | 4 +++-
>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 4228635d18..16782c93c2 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -3539,6 +3539,7 @@ static void migration_iteration_finish(MigrationState *s)
>>>>        case MIGRATION_STATUS_COMPLETED:
>>>>            migration_calculate_complete(s);
>>>>            runstate_set(RUN_STATE_POSTMIGRATE);
>>>> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
>>>>            break;
>>>>        case MIGRATION_STATUS_ACTIVE:
>>>> diff --git a/qapi/run-state.json b/qapi/run-state.json
>>>> index 43d66d700f..66aaef4e2b 100644
>>>> --- a/qapi/run-state.json
>>>> +++ b/qapi/run-state.json
>>>> @@ -86,12 +86,14 @@
>>>>    #                   ignores --no-reboot. This is useful for sanitizing
>>>>    #                   hypercalls on s390 that are used during kexec/kdump/boot
>>>>    #
>>>> +# @migration-completed: Reaction to the successful migration
>>>> +#
>>>>    ##
>>>>    { 'enum': 'ShutdownCause',
>>>>      # Beware, shutdown_caused_by_guest() depends on enumeration order
>>>>      'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
>>>>                'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
>>>> -            'guest-panic', 'subsystem-reset'] }
>>>> +            'guest-panic', 'subsystem-reset', 'migration-completed'] }
>>>>    ##
>>>>    # @StatusInfo:
>>>> -- 
>>>> 2.23.0
>>>>
>>>>
>>> Regards,
>>> Daniel
>>


