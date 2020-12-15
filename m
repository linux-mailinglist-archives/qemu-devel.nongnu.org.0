Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86552DB4C3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 21:04:16 +0100 (CET)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpGYR-0006tS-Bb
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 15:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kpGXL-0006Ts-1G
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:03:07 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:54184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kpGXJ-0001Uh-4G
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:03:06 -0500
Received: from fwd32.aul.t-online.de (fwd32.aul.t-online.de [172.20.26.144])
 by mailout10.t-online.de (Postfix) with SMTP id C7B344128B33;
 Tue, 15 Dec 2020 21:03:01 +0100 (CET)
Received: from [192.168.211.200]
 (SyJ7ouZ-rhkc4-cuYNAFH5n0sY+tpyFIRrQHigWWDrat+2PWrU34YAC5OISjWc+gIb@[93.236.155.21])
 by fwd32.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kpGXF-4Z3eJk0; Tue, 15 Dec 2020 21:03:01 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 1/2] audio: remove qemu_spice_audio_init()
To: Gerd Hoffmann <kraxel@redhat.com>,
 dann frazier <dann.frazier@canonical.com>
References: <20200916084117.21828-1-kraxel@redhat.com>
 <20200916084117.21828-2-kraxel@redhat.com>
 <CALdTtnsBpZ1fyB=dJMdO7Oq=swHw5AsmZxVru_tf6iZZouC=5g@mail.gmail.com>
 <20201215080719.qnr2lgoi3l5iaogq@sirius.home.kraxel.org>
Message-ID: <db92cbae-fcbf-f64e-709c-24ceaf6e1b4b@t-online.de>
Date: Tue, 15 Dec 2020 21:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215080719.qnr2lgoi3l5iaogq@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: SyJ7ouZ-rhkc4-cuYNAFH5n0sY+tpyFIRrQHigWWDrat+2PWrU34YAC5OISjWc+gIb
X-TOI-EXPURGATEID: 150726::1608062581-0000C7C3-F21A3AFC/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d5d82a9-c29d-4be4-8fb9-179682d1e3cf
Received-SPF: none client-ip=194.25.134.21; envelope-from=vr_qemu@t-online.de;
 helo=mailout10.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> +    if (using_spice) {
>>> +        /*
>>> +         * When using spice allow the spice audio driver being picked
>>> +         * as default.
>>> +         *
>>> +         * Temporary hack.  Using audio devices without explicit
>>> +         * audiodev= property is already deprecated.  Same goes for
>>> +         * the -soundhw switch.  Once this support gets finally
>>> +         * removed we can also drop the concept of a default audio
>>> +         * backend and this can go away.
>>> +         */
>>> +        driver = audio_driver_lookup("spice");
>>> +        driver->can_be_default = 1;
>> fyi, one of my libvirt/QEMU guests now segfaults here.
>> See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977301
> Hmm, surely doesn't hurt to add a "if (driver)" check here.
>
> I'm wondering though how you end up with spice being enabled
> but spiceaudio driver not being available.  There is no separate
> config switch so you should have both spice + spiceaudio or
> none of them ...

Hi Gerd,

I can reproduce this problem on my openSUSE 15.2 system. I just have to uninstall the qemu-audio-spice rpm package.

One could argue this is a packaging problem.

With best regards
Volker

