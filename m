Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C261C68377A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxBu-0000Dl-4P; Tue, 31 Jan 2023 15:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pMxBp-0000DM-Ly
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:25:13 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pMxBn-0003Xs-Dc
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:25:13 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout11.t-online.de (Postfix) with SMTP id 44F001E55D;
 Tue, 31 Jan 2023 21:25:06 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pMxBg-1Mb0rJ0; Tue, 31 Jan 2023 21:25:04 +0100
Message-ID: <9f7cef1f-e9c8-dabd-cdde-e2a6b41a28c5@t-online.de>
Date: Tue, 31 Jan 2023 21:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/17] audio: improve callback interface for audio
 frontends
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
 <CAJ+F1CLWBs6raV8vDAOXtZ8x8HxsYRC_=H8eNttsotG2pE=JYA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CAJ+F1CLWBs6raV8vDAOXtZ8x8HxsYRC_=H8eNttsotG2pE=JYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675196704-BFFFE9DF-659BEF6C/0/0 CLEAN NORMAL
X-TOI-MSGID: 99619e7b-3376-4a90-aa88-7d0d698705a4
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

Am 31.01.23 um 15:53 schrieb Marc-André Lureau:
> Hi
>
> On Sun, Jan 15, 2023 at 5:10 PM Volker Rümelin <vr_qemu@t-online.de> wrote:
>> Based-on: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
>> ([PATCH 00/11] audio: more improvements)
>>
> Something didn't work with patchew
> (https://patchew.org/QEMU/61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de/).
> If you could rebase/resend, or share git branch that would be great.

Hi Marc-André,

I will resend the patch series rebased onto [PATCH v2 00/11] audio: more 
improvements. This time I will take care that patchew doesn't try to 
apply the cover letter as the first patch.

With best regards,
Volker

