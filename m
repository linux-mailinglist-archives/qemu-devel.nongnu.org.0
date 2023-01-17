Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEFD66D6A2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:06:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHg2X-0000Wq-TA; Tue, 17 Jan 2023 02:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pHg2V-0000WE-2I
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:05:47 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pHg2R-0008CX-J1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:05:45 -0500
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout06.t-online.de (Postfix) with SMTP id 9FCBE1E809;
 Tue, 17 Jan 2023 08:05:40 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pHg2O-1Qx2sz0; Tue, 17 Jan 2023 08:05:40 +0100
Message-ID: <0d94b8a0-82e3-c261-1e8a-d43b785c989d@t-online.de>
Date: Tue, 17 Jan 2023 08:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-7-vr_qemu@t-online.de>
 <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
 <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
 <Y8URq6bKB5tlDsHR@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <Y8URq6bKB5tlDsHR@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1673939140-15FFE778-CD158F54/0/0 CLEAN NORMAL
X-TOI-MSGID: b38c7d07-bdc0-40e6-8c91-7055d3357b09
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 16.01.23 um 09:58 schrieb Daniel P. Berrangé:
> On Sun, Dec 18, 2022 at 06:39:00PM +0100, Volker Rümelin wrote:
>> Am 18.12.22 um 18:26 schrieb Philippe Mathieu-Daudé:
>>> On 18/12/22 18:15, Volker Rümelin wrote:
>>>> Use g_malloc0() as a direct replacement for audio_calloc().
>>>>
>>>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>>>> ---
>>>>    audio/audio_template.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/audio/audio_template.h b/audio/audio_template.h
>>>> index d343a1dcb3..5f51ef26b2 100644
>>>> --- a/audio/audio_template.h
>>>> +++ b/audio/audio_template.h
>>>> @@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_,
>>>> TYPE)(AudioState *s,
>>>>            return NULL;
>>>>        }
>>>>    -    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
>>>> +    hw = g_malloc0(glue(drv->voice_size_, TYPE));
>>>>        if (!hw) {
>>> g_malloc0() can't fail. Either you want g_try_malloc0() or
>>> remove the error path.
>>>
>> g_malloc0() returns NULL if drv->voice_size_(out|in) is 0. I think the code
>> is correct.
> IMHO relying on that is rather misleading to people reviewing the code
> though. As seen by Philippe's reply, people generally don't expect that
> g_malloc0 can return NULL, and it is not at all obvious that we are
> intentionally expecting 0 to be passed as a size.
>
> Please make this explicit by removing and if (!hw) check after
> g_malloc, and adding a check before g_malloc
>
>     if (audio_bug(__func__, glue(drv->voice_size_, TYPE) == 0)) {
>         dolog (...)

I'll change it.

With best regards,
Volker

>
> With regards,
> Daniel


