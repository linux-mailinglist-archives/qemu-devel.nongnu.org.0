Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739145B1FA0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:51:46 +0200 (CEST)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHwW-0000za-TW
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oWHks-00024N-IB
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:39:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oWHkp-0004c1-UI
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:39:42 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288Dc9H7002713
 for <qemu-devel@nongnu.org>; Thu, 8 Sep 2022 13:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MYiJNHm+J5nz9Nr470n7KbK57fNKdXBng5Ln0M9tijU=;
 b=hn/i1BoPO86gda95xYnGnKa4tFv7Rm+ZQcOdefJ4IGwzDVftL3nw8nO8vz+eRXdfaNZF
 XGpuYzeE1wMPkaeRG6XejsB5vNbXs37CdUU9DBCLQVM2nYzyV1nv48jccihDlXnu0KN4
 foJCprkjEzFHyf/s/uZXklQOguu0mFLAWonaMSdnJs99iC1bVEEzOjV28eyPvHxzrH1K
 IdaRuv4ew0U76JY/GMExZKQvsiWbceD52PMTxg6ghO2oeeSNdVVlO5bbQIU/Rz/tS271
 raO3a6BlVhSuj/nLViZ37hnRclHiQmlqPp7n5+B/ZPJ7/glSaNdTN5aJ0Vmyp/6Hp6qC Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfh50ru6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 13:39:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 288DIQIK001937
 for <qemu-devel@nongnu.org>; Thu, 8 Sep 2022 13:39:37 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfh50ru58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 13:39:37 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 288DLf2v010316;
 Thu, 8 Sep 2022 13:39:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3jbxja8m6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 13:39:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 288DdYQA11141804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Sep 2022 13:39:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE4E4AC05E;
 Thu,  8 Sep 2022 13:39:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 997EFAC059;
 Thu,  8 Sep 2022 13:39:34 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  8 Sep 2022 13:39:34 +0000 (GMT)
Message-ID: <6cbd2419-af87-fb54-3e57-197a133ca236@linux.ibm.com>
Date: Thu, 8 Sep 2022 09:39:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] tpm_emulator: Have swtpm relock storage upon
 migration fall-back
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220907222821.1285082-1-stefanb@linux.ibm.com>
 <20220907222821.1285082-3-stefanb@linux.ibm.com>
 <CAMxuvawHTT-r9Qz_PFgSEo+3yTFkgKBn7_PdqmBNv+W_DsT-hQ@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAMxuvawHTT-r9Qz_PFgSEo+3yTFkgKBn7_PdqmBNv+W_DsT-hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -r-uqBbyIRG5-AelYjG2WefA1tj19Pqx
X-Proofpoint-ORIG-GUID: THnhcLw8GKFXLpIgFxN665jHdkzsAWtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_08,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209080049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/8/22 02:04, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Sep 8, 2022 at 2:28 AM Stefan Berger <stefanb@linux.ibm.com> wrote:
>>
>> Swtpm may release the lock once the last one of its state blobs has been
>> migrated out. In case of VM migration failure QEMU now needs to notify
>> swtpm that it should again take the lock, which it can otherwise only do
>> once it has received the first TPM command from the VM.
>>
>> Only try to send the lock command if swtpm supports it. It will not have
>> released the lock (and support shared storage setups) if it doesn't
>> support the locking command since the functionality of releasing the lock
>> upon state blob reception and the lock command were added to swtpm
>> 'together'.
>>
>> If QEMU sends the lock command and the storage has already been locked
>> no error is reported.
>>
>> If swtpm does not receive the lock command (from older version of QEMU),
>> it will lock the storage once the first TPM command has been received. So
>> sending the lock command is an optimization.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   backends/tpm/tpm_emulator.c | 60 ++++++++++++++++++++++++++++++++++++-
>>   backends/tpm/trace-events   |  2 ++
>>   2 files changed, 61 insertions(+), 1 deletion(-)
>>
>> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
>> index 87d061e9bb..905ebfc8a9 100644
>> --- a/backends/tpm/tpm_emulator.c
>> +++ b/backends/tpm/tpm_emulator.c
>> @@ -34,6 +34,7 @@
>>   #include "io/channel-socket.h"
>>   #include "sysemu/tpm_backend.h"
>>   #include "sysemu/tpm_util.h"
>> +#include "sysemu/runstate.h"
>>   #include "tpm_int.h"
>>   #include "tpm_ioctl.h"
>>   #include "migration/blocker.h"
>> @@ -81,6 +82,9 @@ struct TPMEmulator {
>>       unsigned int established_flag_cached:1;
>>
>>       TPMBlobBuffers state_blobs;
>> +
>> +    bool relock_storage;
>> +    VMChangeStateEntry *vmstate;
>>   };
>>
>>   struct tpm_error {
>> @@ -302,6 +306,35 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
>>       return 0;
>>   }
>>
>> +static int tpm_emulator_lock_storage(TPMEmulator *tpm_emu)
>> +{
>> +    ptm_lockstorage pls;
>> +
>> +    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, PTM_CAP_LOCK_STORAGE)) {
>> +        trace_tpm_emulator_lock_storage_cmd_not_supt();
>> +        return 0;
>> +    }
>> +
>> +    /* give failing side 100 * 10ms time to release lock */
>> +    pls.u.req.retries = cpu_to_be32(100);
> 
> That's quite a short time imho. Is it going to try to lock it again

I am not quite sure what to put it to. 2s, 5s, 10s ? It should go rather 
quick for the failing side to terminate the swtpm process and release 
the lock but maybe on a busy system it could take longer than the 16 
loops (160ms) I had seen in the worst case on an idle system.

> when the first command comes in? What's the timeout then? Is it
> handled implicetly by the swtpm process?

If this here fails swtpm is going to try to lock the storage one time 
when it gets the first command. If QEMU was not to issue this command 
here then swtpm will also try it for 1s when it gets the first command.

> 
>> +    if (tpm_emulator_ctrlcmd(tpm_emu, CMD_LOCK_STORAGE, &pls,
>> +                             sizeof(pls.u.req), sizeof(pls.u.resp)) < 0) {
>> +        error_report("tpm-emulator: Could not lock storage: %s",
> 
> add "after 1 second" ?

"within 1 second". Fixed.

> 
>> +                     strerror(errno));
>> +        return -1;
>> +    }
>> +
>> +    pls.u.resp.tpm_result = be32_to_cpu(pls.u.resp.tpm_result);
>> +    if (pls.u.resp.tpm_result != 0) {
>> +        error_report("tpm-emulator: TPM result for CMD_LOCK_STORAGE: 0x%x %s",
>> +                     pls.u.resp.tpm_result,
>> +                     tpm_emulator_strerror(pls.u.resp.tpm_result));
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int tpm_emulator_set_buffer_size(TPMBackend *tb,
>>                                           size_t wanted_size,
>>                                           size_t *actual_size)
>> @@ -843,13 +876,34 @@ static int tpm_emulator_pre_save(void *opaque)
>>   {
>>       TPMBackend *tb = opaque;
>>       TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
>> +    int ret;
>>
>>       trace_tpm_emulator_pre_save();
>>
>>       tpm_backend_finish_sync(tb);
>>
>>       /* get the state blobs from the TPM */
>> -    return tpm_emulator_get_state_blobs(tpm_emu);
>> +    ret = tpm_emulator_get_state_blobs(tpm_emu);
>> +
>> +    tpm_emu->relock_storage = ret == 0;
>> +
>> +    return ret;
>> +}
>> +
>> +static void tpm_emulator_vm_state_change(void *opaque, bool running,
>> +                                         RunState state)
>> +{
>> +    TPMBackend *tb = opaque;
>> +    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
>> +
>> +    trace_tpm_emulator_vm_state_change(running, state);
>> +
>> +    if (!running || state != RUN_STATE_RUNNING || !tpm_emu->relock_storage) {
>> +        return;
>> +    }
>> +
>> +    /* lock storage after migration fall-back */
>> +    tpm_emulator_lock_storage(tpm_emu);
>>   }
>>
>>   /*
>> @@ -911,6 +965,9 @@ static void tpm_emulator_inst_init(Object *obj)
>>       tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
>>       tpm_emu->cur_locty_number = ~0;
>>       qemu_mutex_init(&tpm_emu->mutex);
>> +    tpm_emu->vmstate =
>> +        qemu_add_vm_change_state_handler(tpm_emulator_vm_state_change,
>> +                                         tpm_emu);
>>
>>       vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
>>                        &vmstate_tpm_emulator, obj);
>> @@ -960,6 +1017,7 @@ static void tpm_emulator_inst_finalize(Object *obj)
>>       tpm_sized_buffer_reset(&state_blobs->savestate);
>>
>>       qemu_mutex_destroy(&tpm_emu->mutex);
>> +    qemu_del_vm_change_state_handler(tpm_emu->vmstate);
>>
>>       vmstate_unregister(NULL, &vmstate_tpm_emulator, obj);
>>   }
>> diff --git a/backends/tpm/trace-events b/backends/tpm/trace-events
>> index 3298766dd7..1ecef42a07 100644
>> --- a/backends/tpm/trace-events
>> +++ b/backends/tpm/trace-events
>> @@ -20,6 +20,8 @@ tpm_emulator_set_buffer_size(uint32_t buffersize, uint32_t minsize, uint32_t max
>>   tpm_emulator_startup_tpm_resume(bool is_resume, size_t buffersize) "is_resume: %d, buffer size: %zu"
>>   tpm_emulator_get_tpm_established_flag(uint8_t flag) "got established flag: %d"
>>   tpm_emulator_cancel_cmd_not_supt(void) "Backend does not support CANCEL_TPM_CMD"
>> +tpm_emulator_lock_storage_cmd_not_supt(void) "Backend does not support LOCK_STORAGE"
>> +tpm_emulator_vm_state_change(int running, int state) "state change to running %d state %d"
>>   tpm_emulator_handle_device_opts_tpm12(void) "TPM Version 1.2"
>>   tpm_emulator_handle_device_opts_tpm2(void) "TPM Version 2"
>>   tpm_emulator_handle_device_opts_unspec(void) "TPM Version Unspecified"
>> --
>> 2.37.2
>>
> 
> lgtm otherwise:
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 

