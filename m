Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2E337987D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 22:43:02 +0200 (CEST)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgCk1-0003q2-Fo
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 16:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lgCj5-0003BS-GO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:42:03 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:46114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lgCj1-0001r8-LP
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:42:03 -0400
Received: from fwd13.aul.t-online.de (fwd13.aul.t-online.de [172.20.27.62])
 by mailout05.t-online.de (Postfix) with SMTP id 3C9F16809D;
 Mon, 10 May 2021 22:41:20 +0200 (CEST)
Received: from [192.168.211.200]
 (TErciTZvZh4vCsf9zGmNLb9yI4R60+ThuyiE6-tEOUejACXQrWJ12mHKQu2ZoBnw4S@[46.86.48.198])
 by fwd13.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lgCiN-0Z25Jo0; Mon, 10 May 2021 22:41:19 +0200
Subject: Re: [PATCH v2 00/11] PS/2 controller related fixes
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
 <bca8cfb0-06b5-2665-c36e-d2da5cb818d1@t-online.de>
Message-ID: <f0562d4f-af20-0ec6-eb69-7bcaae33726f@t-online.de>
Date: Mon, 10 May 2021 22:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <bca8cfb0-06b5-2665-c36e-d2da5cb818d1@t-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: TErciTZvZh4vCsf9zGmNLb9yI4R60+ThuyiE6-tEOUejACXQrWJ12mHKQu2ZoBnw4S
X-TOI-EXPURGATEID: 150726::1620679279-00014A6A-66964577/0/0 CLEAN NORMAL
X-TOI-MSGID: e97be6f7-b221-430f-85e5-06388b63423d
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> This patch series fixes two different PS/2 mouse stream corruptions
>> and adds a feature that allows some old misbehaving DOS programs to
>> have a working keyboard. With the last few patches, the PS/2 con-
>> troller behaves more like a real controller.
>>
>> v2:
>> Introduce the function kbd_pending() in a preliminary patch to ease
>> the review of patch "pckbd: correctly disable PS/2 communication",
>> as Philippe suggested.
>>
>> Volker Rümelin (11):
>>   ps2: fix mouse stream corruption
>>   ps2: don't raise an interrupt if queue is full
>>   ps2: don't deassert irq twice if queue is empty
>>   pckbd: split out interrupt line changing code
>>   pckbd: don't update OBF flags if KBD_STAT_OBF is set
>>   pckbd: PS/2 keyboard throttle
>>   pckbd: add state variable for interrupt source
>>   pckbd: add controller response queue
>>   pckbd: add function kbd_pending()
>>   pckbd: correctly disable PS/2 communication
>>   pckbd: remove duplicated keyboard and mouse defines
>
> I'm sorry, there is a bug somewhere in this series. Seabios sometimes
> doesn't detect the PS/2 keyboard. Please ignore this series for now.
>

This is a Seabios bug. Seabios expects the PS/2 controller doesn't
generate interrupts after it sends the command KBD_CCMD_KBD_DISABLE
to the controller. Even the original author of the pckbd code wrote
in a comment that this is incorrect. I will send a version 3 series
where I don't fix the incorrectness.

> With best regards,
> Volker
>
>>
>>  hw/input/pckbd.c | 293 ++++++++++++++++++++++++++++++++++-------------
>>  hw/input/ps2.c   |  11 +-
>>  2 files changed, 223 insertions(+), 81 deletions(-)
>>
>


