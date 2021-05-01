Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDD370749
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 15:05:05 +0200 (CEST)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcpIu-0000uH-Ab
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 09:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lcpHJ-0000JA-MR
 for qemu-devel@nongnu.org; Sat, 01 May 2021 09:03:25 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:33754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lcpHH-000787-KY
 for qemu-devel@nongnu.org; Sat, 01 May 2021 09:03:25 -0400
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout09.t-online.de (Postfix) with SMTP id D6EC16511C;
 Sat,  1 May 2021 15:01:33 +0200 (CEST)
Received: from [192.168.211.200]
 (GuvUbwZFZhTSr4SPRor7y1FpFy0vY-FQ3gp0U-sme2qxJ8hw4CmXEM5tR79Y6hKwFW@[46.86.49.120])
 by fwd39.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lcpFT-0Hu6RE0; Sat, 1 May 2021 15:01:31 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [Bug 1861677] Re: wavcapture crash with pulseaudio
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bug 1861677 <1861677@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <158073341807.19403.15811772889635903332.malonedeb@gac.canonical.com>
 <161986065342.4935.14510629788143038327.launchpad@chaenomeles.canonical.com>
Message-ID: <98db3a34-3820-79e4-9423-b5c0fdd3674d@t-online.de>
Date: Sat, 1 May 2021 15:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <161986065342.4935.14510629788143038327.launchpad@chaenomeles.canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: GuvUbwZFZhTSr4SPRor7y1FpFy0vY-FQ3gp0U-sme2qxJ8hw4CmXEM5tR79Y6hKwFW
X-TOI-EXPURGATEID: 150726::1619874091-00003E8E-C91ABF2B/0/0 CLEAN NORMAL
X-TOI-MSGID: 29b3b88a-dc02-4e9f-8e11-33a109f5a50e
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>You received this bug notification because you are a member of qemu-
>devel-ml, which is subscribed to QEMU.
 >https://bugs.launchpad.net/bugs/1861677
>
>Title:
>  wavcapture crash with pulseaudio
>
>Status in QEMU:
>  New

Hi Philippe,

this bug was fixed with commit cbaf25d1f5 "audio: fix wavcapture segfault".

With best regards,
Volker


