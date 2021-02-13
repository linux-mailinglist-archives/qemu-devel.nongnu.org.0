Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0831AE5A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 23:43:11 +0100 (CET)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB3d8-0002Np-Sv
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 17:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3c0-0001ci-NN; Sat, 13 Feb 2021 17:42:00 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:35689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3by-0006uB-LB; Sat, 13 Feb 2021 17:42:00 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0Zfg-1m7OtA4AFg-00wR5h; Sat, 13 Feb 2021 23:41:53 +0100
Subject: Re: [PATCH 2/4] hw/block/fdc: Remove the check_media_rate property
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
 <20210203171832.483176-3-thuth@redhat.com>
 <125f27d8-8987-99f7-321e-86e7365d5a07@redhat.com>
 <fb4a2611-49f0-1292-a3c2-478666dfa65c@redhat.com>
 <96906059-731d-1e48-5b60-98ed4df9c037@redhat.com>
 <3b57740e-ad39-3e56-6262-7994376f74a9@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <88f8ca2f-5121-8d40-81b1-d284737d588a@vivier.eu>
Date: Sat, 13 Feb 2021 23:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3b57740e-ad39-3e56-6262-7994376f74a9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yu//29sNP4iwqQJPqGtyxdwfiYPOx7zIxc9EdWnwXOYIsqFX7br
 Q1Vj6qHxtmowsf8TgBt7Jt6zcFu3cDrQn7H+DW92KNkwF8oPXjSMW0xg9bC9AvblgYjo6Bu
 8cVPp951TSDnyd/OsT/7qmk5rweRCAQpoc+O2l0Oj6byewUPkArJMoiaXfljAXBAhF/VV5z
 yMWex8U4MGioIiSDm7kyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpZlBTTgC3U=:eT1HZe97Ak8atEAa/B+Rvq
 Xjbsnv1JfdrP0N32ok4ZFi4zeRWYKme+kTJtMNDc13JPNGHJ+73miG8K08qkM+GhBKdg/K4L7
 gemI4VXbAvYMzWyxo1gntLiJsaUZBB+i7EeENGnC9IU8DSX9ZLlzJ/KGY3ZjZiHo5ytDpjV02
 /ncVLw9I8MEJ6UpC/tu7u4+T2l9C/OHILGTn6woeMB4NJ5iEX+uJRUI8KFCA1gRltwsPkG0e6
 GtSSRBdMgV/4eY6fXJ59Pl9qMclcLZq9IeVGg0THGaly+ZWsGniTP0rOO3wxCNHR8qrtdS9ay
 11RNeF4KCfc8cCam3O0kEceEMSIuZAeXMJAb1dipds0sgEivgh4IMTISpgxpNycPrF5Rslr33
 0wEWSLJsuWd4Bu9vMJzd0acSaCKfzOyp+DXCU05yXH7B/ln2HqKkBgCnO2kuxO0cyrk9Taxol
 1Iq04BwyRg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/02/2021 à 08:05, Thomas Huth a écrit :
> On 05/02/2021 21.15, John Snow wrote:
>> On 2/5/21 1:37 AM, Thomas Huth wrote:
>>> On 05/02/2021 01.40, John Snow wrote:
>>>> On 2/3/21 12:18 PM, Thomas Huth wrote:
>>>>> This was only required for the pc-1.0 and earlier machine types.
>>>>> Now that these have been removed, we can also drop the corresponding
>>>>> code from the FDC device.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   hw/block/fdc.c             | 17 ++---------------
>>>>>   tests/qemu-iotests/172.out | 35 -----------------------------------
>>>>>   2 files changed, 2 insertions(+), 50 deletions(-)
>>>>>
>>>>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>>>>> index 292ea87805..198940e737 100644
>>>>> --- a/hw/block/fdc.c
>>>>> +++ b/hw/block/fdc.c
>>>>> @@ -874,7 +874,6 @@ struct FDCtrl {
>>>>>           FloppyDriveType type;
>>>>>       } qdev_for_drives[MAX_FD];
>>>>>       int reset_sensei;
>>>>> -    uint32_t check_media_rate;
>>>>
>>>> I am a bit of a dunce when it comes to the compatibility properties... does this mess with the
>>>> migration format?
>>>>
>>>> I guess it doesn't, since it's not in the VMSTATE declaration.
>>>>
>>>> Hmmmm, alright.
>>>
>>> I think that should be fine, yes.
>>>
>>>>>       FloppyDriveType fallback; /* type=auto failure fallback */
>>>>>       /* Timers state */
>>>>>       uint8_t timer0;
>>>>> @@ -1021,18 +1020,10 @@ static const VMStateDescription vmstate_fdrive_media_changed = {
>>>>>       }
>>>>>   };
>>>>> -static bool fdrive_media_rate_needed(void *opaque)
>>>>> -{
>>>>> -    FDrive *drive = opaque;
>>>>> -
>>>>> -    return drive->fdctrl->check_media_rate;
>>>>> -}
>>>>> -
>>>>>   static const VMStateDescription vmstate_fdrive_media_rate = {
>>>>>       .name = "fdrive/media_rate",
>>>>>       .version_id = 1,
>>>>>       .minimum_version_id = 1,
>>>>> -    .needed = fdrive_media_rate_needed,
>>>>>       .fields = (VMStateField[]) {
>>>>>           VMSTATE_UINT8(media_rate, FDrive),
>>>>>           VMSTATE_END_OF_LIST()
>>>>> @@ -1689,8 +1680,7 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
>>>>>       /* Check the data rate. If the programmed data rate does not match
>>>>>        * the currently inserted medium, the operation has to fail. */
>>>>> -    if (fdctrl->check_media_rate &&
>>>>> -        (fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>> +    if ((fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>>           FLOPPY_DPRINTF("data rate mismatch (fdc=%d, media=%d)\n",
>>>>>                          fdctrl->dsr & FD_DSR_DRATEMASK, cur_drv->media_rate);
>>>>>           fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
>>>>> @@ -2489,8 +2479,7 @@ static void fdctrl_result_timer(void *opaque)
>>>>>           cur_drv->sect = (cur_drv->sect % cur_drv->last_sect) + 1;
>>>>>       }
>>>>>       /* READ_ID can't automatically succeed! */
>>>>> -    if (fdctrl->check_media_rate &&
>>>>> -        (fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>> +    if ((fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
>>>>>           FLOPPY_DPRINTF("read id rate mismatch (fdc=%d, media=%d)\n",
>>>>>                          fdctrl->dsr & FD_DSR_DRATEMASK, cur_drv->media_rate);
>>>>>           fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
>>>>> @@ -2895,8 +2884,6 @@ static Property isa_fdc_properties[] = {
>>>>>       DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
>>>>>       DEFINE_PROP_DRIVE("driveA", FDCtrlISABus, state.qdev_for_drives[0].blk),
>>>>>       DEFINE_PROP_DRIVE("driveB", FDCtrlISABus, state.qdev_for_drives[1].blk),
>>>>> -    DEFINE_PROP_BIT("check_media_rate", FDCtrlISABus, state.check_media_rate,
>>>>> -                    0, true),
>>>>
>>>> Could you theoretically set this via QOM commands in QMP, and claim that this is a break in
>>>> behavior?
>>>>
>>>> Though, it's ENTIRELY undocumented, so ... it's probably fine, I think. Probably. (Please soothe
>>>> my troubled mind.)
>>>
>>> A user actually could mess with this property even on the command line, e.g. by using:
>>>
>>>   qemu-system-x86_64 -global isa-fdc.check_media_rate=false
>>>
>>> ... but, as you said, it's completely undocumented, the property is really just there for the
>>> internal use of machine type compatibility. We've done such clean-ups in the past already, see
>>> e.g. c6026998eef382d7ad76 or 2a4dbaf1c0db2453ab78f, so I think this should be fine. But if you
>>> disagree, I could replace this by a patch that adds this property to the list of deprecated
>>> features instead, so we could at least remove it after it has been deprecated for two releases?
>>>
>>
>> I don't think it's necessary, personally -- just wanted to make sure I knew the exact stakes here.
>>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>> Acked-by: John Snow <jsnow@redhat.com>
> 
> Thanks! ... since the first patch has already been merged through Michael's tree, could you then
> please take this patch here through your floppy / block branch, John? Or maybe it could also go via
> qemu-trivial?

Applied to my trivial-patches branch.

Thanks,
Laurent


