Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574F3880BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:46:11 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5fN-00047q-TT
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lj5Y3-0001Vy-Jh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:38:35 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:38954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lj5Y1-0001mn-F1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:38:35 -0400
Received: from fwd28.aul.t-online.de (fwd28.aul.t-online.de [172.20.26.133])
 by mailout12.t-online.de (Postfix) with SMTP id 5415B15CB7;
 Tue, 18 May 2021 21:37:53 +0200 (CEST)
Received: from [192.168.211.200]
 (GvY-fYZAghLGwamkTOF5MNrkaLzD9KvTv30q4vB+bbAvZq7Pk8chH-tDmTyMemGZKN@[79.208.18.63])
 by fwd28.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lj5XM-1sMR8K0; Tue, 18 May 2021 21:37:52 +0200
Subject: Re: [PATCH v3 05/11] pckbd: don't update OBF flags if KBD_STAT_OBF is
 set
To: Gerd Hoffmann <kraxel@redhat.com>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
 <20210515113254.6245-5-vr_qemu@t-online.de>
 <20210518104934.nfsjuztjg7clymw7@sirius.home.kraxel.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <f92a8f27-362c-424f-253d-0a69ea721298@t-online.de>
Date: Tue, 18 May 2021 21:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518104934.nfsjuztjg7clymw7@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: GvY-fYZAghLGwamkTOF5MNrkaLzD9KvTv30q4vB+bbAvZq7Pk8chH-tDmTyMemGZKN
X-TOI-EXPURGATEID: 150726::1621366672-0000EDA1-39E350DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 42a24847-3392-485a-98aa-4f40113966e2
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>    Hi,
>
>>   static const VMStateDescription vmstate_kbd = {
>>       .name = "pckbd",
>> -    .version_id = 3,
>> +    .version_id = 4,
>>       .minimum_version_id = 3,
>>       .post_load = kbd_post_load,
>>       .fields = (VMStateField[]) {
>> @@ -435,6 +471,7 @@ static const VMStateDescription vmstate_kbd = {
>>           VMSTATE_UINT8(status, KBDState),
>>           VMSTATE_UINT8(mode, KBDState),
>>           VMSTATE_UINT8(pending, KBDState),
>> +        VMSTATE_UINT8_V(obdata, KBDState, 4),
>>           VMSTATE_END_OF_LIST()
>>       },
>>       .subsections = (const VMStateDescription*[]) {
>> @@ -512,12 +549,20 @@ void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
>>       qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
>>   }
> Unfortunately live migration isn't that easy.  Reason is we want able to
> live-migrate both ways (old qemu -> new qemu but also new qemu -> old qemu).
> With version ids we can do old qemu -> new qemu only.
>
> So the usual way to deal with this is that new features which require
> additional state information can be enabled/disabled at runtime using
> device properties.  The feature is turned off for the compatibility
> machine types.  The additional state is added using a conditional
> subsection, which is only sent in case the feature is enabled.  That way
> qemu with -- says -- "-machine pc-q35-5.0" will only enable features and
> sent vmstate which qemu 5.0 is able to deal with.
>
> I think there is no way around such a property for the ps2 fixes, even
> if we use it for sending/not sending the additional ps2 state
> information needed by the bugfixes.  Making the fixes itself conditional
> should not be needed I think.

Thank you for the detailed information. This is really helpful.
I will send a version 4 series. It may take a few days.

With best regards,
Volker

> take care,
>    Gerd
>


