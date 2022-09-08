Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5835B1690
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:12:46 +0200 (CEST)
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCeT-0008ML-CC
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWCVW-00023t-Qc
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:03:30 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWCVR-0005Pb-Tm
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:03:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F22E1FB42;
 Thu,  8 Sep 2022 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662624203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veZivsd6tfPyofReVAzam8/3hDUO0aZXvLic2/14vxA=;
 b=Gh3e0EMpI7kVmt0WZMwKgZ6PmE7WyrYt8nBg3QPOQqAsMFtY80Mrn6tBb7lBIxB2YV5FbZ
 OG5Woj17xk+M1F99I04Dw+8UKWzr01hXdvmqos74aPEveVNTb1fKnmMoJ2JoE7MUzWUbSR
 nAO6Upjwe0VcN2tMDnZLALb+2rbnq5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662624203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veZivsd6tfPyofReVAzam8/3hDUO0aZXvLic2/14vxA=;
 b=i8jX9tYR3wg7P9EBsgl1ckcjB7EcZcyjzvsLc7jAxscCYL7IuEXP/uO6rXQK0ZmPI8zWUW
 jei9cnRAk51f3RAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFAEA13A6D;
 Thu,  8 Sep 2022 08:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bCPNKMqhGWPxIAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 08:03:22 +0000
Message-ID: <7e8e893b-7445-8fe5-fd6f-ba48e0688adf@suse.de>
Date: Thu, 8 Sep 2022 10:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] audio: add help option for -audio and -audiodev
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220907173044.12669-1-cfontana@suse.de>
 <930ed191-5354-b0d0-2998-0e771a97973f@t-online.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <930ed191-5354-b0d0-2998-0e771a97973f@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/8/22 07:55, Volker Rümelin wrote:
> Am 07.09.22 um 19:30 schrieb Claudio Fontana:
> 
>> add a simple help option for -audio and -audiodev
>> to show the list of available drivers, and document them.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   audio/audio.c   | 20 ++++++++++++++++++++
>>   audio/audio.h   |  1 +
>>   qemu-options.hx | 10 ++++++----
>>   softmmu/vl.c    |  9 +++++++--
>>   4 files changed, 34 insertions(+), 6 deletions(-)
>>
>> v1 -> v2: also extend the help to -audio.
>>
>>   -audio help
>>   -audio driver=help
>>   -audiodev help
>>
>> will all show the same results.
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 4f4bb10cce..ffb09ec825 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -32,6 +32,7 @@
>>   #include "qapi/qapi-visit-audio.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/module.h"
>> +#include "qemu/help_option.h"
>>   #include "sysemu/sysemu.h"
>>   #include "sysemu/replay.h"
>>   #include "sysemu/runstate.h"
>> @@ -2105,10 +2106,29 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
>>       }
>>   }
>>   
>> +void audio_help(void)
>> +{
>> +    int i;
>> +
>> +    printf("Available audio drivers:\n");
>> +    printf("none\n");
>> +
>> +    for (i = 0; audio_prio_list[i]; i++) {
>> +        audio_driver *driver = audio_driver_lookup(audio_prio_list[i]);
> 
> Hi Claudio,
> 
> there is no guarantee that the audio_prio_list contains all audio 
> backend drivers. I would use this
> 
> +    for (i = 0; i < AUDIODEV_DRIVER__MAX; i++) {
> +        const char *name = AudiodevDriver_str(i);
> +        audio_driver *driver = audio_driver_lookup(name);
> 
> to enumerate all audio backend drivers.

Thanks Volker, will update accordingly.

Claudio

> 
> With best regards,
> Volker
> 
>> +        if (driver) {
>> +            printf("%s\n", driver->name);
>> +        }
>> +    }
>> +}
>> +
>>
> 


