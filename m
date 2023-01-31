Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B068312E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:18:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsOH-0003F8-HR; Tue, 31 Jan 2023 10:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsO6-00036q-FG
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:17:36 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsO4-0005R9-KS
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:17:34 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McXwD-1omSAg01AT-00d1oM for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023
 16:17:31 +0100
Message-ID: <25b62e08-44a9-cca6-ba56-3d96ea55da25@vivier.eu>
Date: Tue, 31 Jan 2023 16:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20221212173416.90590-1-deller@gmx.de>
 <20221212173416.90590-2-deller@gmx.de>
 <3517fbb1-e6eb-3495-d524-4a37ef46bd4e@vivier.eu>
 <9bd130a2-f1bc-6bf9-a409-f923cf98e2f3@gmx.de>
 <a673a642-6ab8-ef52-bbc8-f171e491166b@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <a673a642-6ab8-ef52-bbc8-f171e491166b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b8pEH89VfDzywoG4+stOz91YDpBMNE1cjfibe+6DZri6gJvvoxt
 1Dpts2or1l/zddyCJZkNXmyhql7lmtj1g199xAs2+i75sOQ4EdfO1s0cGvZHaYJjk4+ClNJ
 bz/LdGadl/qhYFgkt9zFGWXpuTA2pK267iR7vAaLSrXCpLobFVMc/C7Cby2vd0siEDFaiAU
 3Z4GgziyrfUeDxYPfvZmA==
UI-OutboundReport: notjunk:1;M01:P0:IBoTRapUfAU=;Ig+4GhwgP4wJl/5JySG795tT6ad
 4zfd4Obky8DrYCrnu0fv6xwMQANpzbzjS1p50cUunCughLDeaayEs6iQprV3Qt/h/sAMGWf8+
 VaYuMTeeVg0ewassidgN9gRZRA/zmFWrQTDEAp0ysjVAV0pe9gmZ+dnhK5rRMN5NTxYeCUxUP
 2MsekEQumAZaW6DsD3VOs47dNKJFl0JBMab/ycUy/f9JnlpJEKyk17T1XsghauCLcnBhPi3BZ
 s1W/59NCJ33EMhd37VBq2/UfmXgI8F5hhhlJI5a+DggedVXjvkezT1vYMSExQnfeDAgAg+qpm
 dcQ3QiMsg+e2Y+jbzhfy+39ahC4Ov7n3zGOzq4NPZqEz+hJHVTlUsk9ZDa3cWUHT2Z3KNYfYE
 9ZgmiWA9eAVkdv8Il7UK7qa1o88VG+zBt2wStIfzcHzN6v9x8FFCpmsaenBlIbeWaMRhOUASF
 tkYAEHs3tI6IjQ6F3U4LR99JTrRn6S80e6PrZmtzo6PjQ5r7mjDm9CoSObnX7Y4jZUNoFIdBj
 D50hjc4jxIp3WMEfAhY5N/D38bBRa7hFQAZjpVT7rurPgV11e7HvlGbsivFAyq2DUNISwxmq3
 XA7WpzoFfoglmL/pzGwBUDf/C7BMUZiSCxLnaJZb9TlCb5UGYN+PewPqtAwxK4GNntYTDQo6D
 hs3Nzd+tclj84ILgibl+z+1RBcJWyfwWw1Bx7OFh4Q==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 31/01/2023 à 14:50, Helge Deller a écrit :
> On 1/31/23 14:34, Helge Deller wrote:
>> On 1/31/23 13:28, Laurent Vivier wrote:
>>> Le 12/12/2022 à 18:34, Helge Deller a écrit :
>>>> Applications do call sendmsg() without any IOV, e.g.:
>>>>   sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=NULL, msg_iovlen=0,
>>>>              msg_control=[{cmsg_len=36, cmsg_level=SOL_ALG, cmsg_type=0x2}],
>>>>              msg_controllen=40, msg_flags=0}, MSG_MORE) = 0
>>>>   sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="The quick brown fox jumps over 
>>>> t"..., iov_len=183}],
>>>>              msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_ALG, cmsg_type=0x3}],
>>>>              msg_controllen=24, msg_flags=0}, 0) = 183
>>>>
>>>> The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg()
>>>> and calls lock_iovec() to lock the IOV into memory. For the first
>>>> sendmsg() above it returns NULL and thus wrongly skips the call the host
>>>> sendmsg() syscall, which will break the calling application.
>>>>
>>>> Fix this issue by:
>>>> - allowing sendmsg() even with empty IOV
>>>> - skip recvmsg() if IOV is NULL
>>>> - skip both if the return code of do_sendrecvmsg_locked() != 0, which
>>>>    indicates some failure like EFAULT on the IOV
>>>>
>>>> Tested with the debian "ell" package with hppa guest on x86_64 host.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> ---
>>>>   linux-user/syscall.c | 9 +++++++--
>>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>> index a365903a3a..9e2c0a18fc 100644
>>>> --- a/linux-user/syscall.c
>>>> +++ b/linux-user/syscall.c
>>>> @@ -3330,7 +3330,10 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
>>>>                        target_vec, count, send);
>>>>       if (vec == NULL) {
>>>>           ret = -host_to_target_errno(errno);
>>>> -        goto out2;
>>>> +        /* allow sending packet without any iov, e.g. with MSG_MORE flag */
>>>
>>> why don't you check only for count is 0?
>>> Somehing like:
>>>
>>> if (vec == NULL && (count || !send)) {
>>
>> You mean:
>> if (vec == NULL && (!count || !send)) {
>>      goto out2;
>>
>> lock_iovec() sets errno=0 if count==0, but for invalid addresses it sets errno!=0,
>> so my current check (for which ret is the same as errno):
>>          if (!send || ret) {
>>              goto out2;
>> exits on memfaults too, while a check for just count==0 would succeed.
> 
> forget the above...
> Maybe just checking for count==0 would be sufficient. I don't know yet if
> there are any other corner cases where replacing the check of
>            if (!send || ret) {
> with
>            if (!send || count==0) {
> would behave different.
> Checking against errno which is reported back from lock_iovec() seemed more
> logical for me. This patch has been as-is in the buildd trees now since weeks
> without any problems so far at least.
> 

It seems kernel also checks for the invalid address even with count=0, so I'm going to apply this 
patch as-is.

Thanks,
Laurent


