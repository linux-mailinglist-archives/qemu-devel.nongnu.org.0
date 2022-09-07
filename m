Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A085B095A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:59:15 +0200 (CEST)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxSM-00049r-8x
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVxQ7-0001Cu-6C
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:56:55 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:60222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVxQ5-0004wC-LA
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:56:54 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 396C6336ED;
 Wed,  7 Sep 2022 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662566202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wY7G7v/siutYU6fD+pXoBtahzUcfrTr5pJ6mbKiXwls=;
 b=sjoFcTxjRn8h4EGRVKAhS1R+zKDr6QuAxIzyV7ONt6gG0RJPX3KyN8uq3DJuxZSRXGQgbZ
 ecBgornhnfNq2Jih/Fz/ySOTaMppSQYmynQcJ8T+0/OevVvrWPdtZa/GGG761umB6Lvq1l
 uaB2v3ssbQtuENc2GdBzWR9wzH6ZkIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662566202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wY7G7v/siutYU6fD+pXoBtahzUcfrTr5pJ6mbKiXwls=;
 b=WbT+81US1tsRm4HO6AloRV0GyyMRqMe9HHTZkp/dwGSZ335oKNIqXhvLfjNECHT5IIJmQd
 3c4d1KcAf4hqP4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E389C13486;
 Wed,  7 Sep 2022 15:56:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IpZsNTm/GGPwZgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 07 Sep 2022 15:56:41 +0000
Message-ID: <fd64ef5e-1372-fe01-c47e-407467c49cb7@suse.de>
Date: Wed, 7 Sep 2022 17:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] audio: add help option (?) for -audiodev
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220907142359.31827-1-cfontana@suse.de>
 <87fsh3usub.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87fsh3usub.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/7/22 17:06, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> add a simple help option for -audiodev, so users can do
>>
>> qemu -audiodev ?
> 
> The preferred form is actually '-audiodev help'.  The other one is
> deprecated.  Recommend to stay away from it even in commit messages.

I have no problem mentioning "help" instead of "?" in the commit message (or both).

The function used (is_help_option) checks for both, which seems the best way to me.

Ciao

C

> 
>>
>> to get the list of drivers available.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  audio/audio.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 4f4bb10cce..bd8c18c3cd 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -32,6 +32,7 @@
>>  #include "qapi/qapi-visit-audio.h"
>>  #include "qemu/cutils.h"
>>  #include "qemu/module.h"
>> +#include "qemu/help_option.h"
>>  #include "sysemu/sysemu.h"
>>  #include "sysemu/replay.h"
>>  #include "sysemu/runstate.h"
>> @@ -2105,10 +2106,29 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
>>      }
>>  }
>>  
>> +static void audio_help(void)
>> +{
>> +    int i;
>> +
>> +    printf("Available audiodev types:\n");
>> +    printf("none\n");
>> +
>> +    for (i = 0; audio_prio_list[i]; i++) {
>> +        audio_driver *driver = audio_driver_lookup(audio_prio_list[i]);
>> +        if (driver) {
>> +            printf("%s\n", driver->name);
>> +        }
>> +    }
>> +}
>> +
>>  void audio_parse_option(const char *opt)
>>  {
>>      Audiodev *dev = NULL;
>>  
>> +    if (is_help_option(opt)) {
>> +        audio_help();
>> +        exit(0);
>> +    }
>>      Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
>>      visit_type_Audiodev(v, NULL, &dev, &error_fatal);
>>      visit_free(v);
> 


