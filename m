Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E989F5B143D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 07:59:52 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWAZr-0005Z3-PT
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 01:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oWAWN-0002Qw-B9
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:56:15 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:54164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oWAWL-0003pR-Fq
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:56:15 -0400
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout08.t-online.de (Postfix) with SMTP id BF551EB62;
 Thu,  8 Sep 2022 07:55:46 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.180]) by fwd86.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oWAVm-35QmwL0; Thu, 8 Sep 2022 07:55:38 +0200
Message-ID: <930ed191-5354-b0d0-2998-0e771a97973f@t-online.de>
Date: Thu, 8 Sep 2022 07:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] audio: add help option for -audio and -audiodev
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220907173044.12669-1-cfontana@suse.de>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20220907173044.12669-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1662616538-DA24F9D3-0AA43A03/0/0 CLEAN NORMAL
X-TOI-MSGID: 0267a047-56a6-4ed0-aff9-407ecbfcfef8
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-4.199, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Am 07.09.22 um 19:30 schrieb Claudio Fontana:

> add a simple help option for -audio and -audiodev
> to show the list of available drivers, and document them.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   audio/audio.c   | 20 ++++++++++++++++++++
>   audio/audio.h   |  1 +
>   qemu-options.hx | 10 ++++++----
>   softmmu/vl.c    |  9 +++++++--
>   4 files changed, 34 insertions(+), 6 deletions(-)
>
> v1 -> v2: also extend the help to -audio.
>
>   -audio help
>   -audio driver=help
>   -audiodev help
>
> will all show the same results.
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 4f4bb10cce..ffb09ec825 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -32,6 +32,7 @@
>   #include "qapi/qapi-visit-audio.h"
>   #include "qemu/cutils.h"
>   #include "qemu/module.h"
> +#include "qemu/help_option.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/replay.h"
>   #include "sysemu/runstate.h"
> @@ -2105,10 +2106,29 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
>       }
>   }
>   
> +void audio_help(void)
> +{
> +    int i;
> +
> +    printf("Available audio drivers:\n");
> +    printf("none\n");
> +
> +    for (i = 0; audio_prio_list[i]; i++) {
> +        audio_driver *driver = audio_driver_lookup(audio_prio_list[i]);

Hi Claudio,

there is no guarantee that the audio_prio_list contains all audio 
backend drivers. I would use this

+    for (i = 0; i < AUDIODEV_DRIVER__MAX; i++) {
+        const char *name = AudiodevDriver_str(i);
+        audio_driver *driver = audio_driver_lookup(name);

to enumerate all audio backend drivers.

With best regards,
Volker

> +        if (driver) {
> +            printf("%s\n", driver->name);
> +        }
> +    }
> +}
> +
>


