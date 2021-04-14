Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35735EF85
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:30:03 +0200 (CEST)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWauQ-0003OA-RY
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWat8-0002Zo-5r
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:28:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:49574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWat6-00022K-Hn
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:28:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B13D9AD8D;
 Wed, 14 Apr 2021 08:28:38 +0000 (UTC)
Subject: Re: [RFC v12 03/65] arm: tcg: only build under CONFIG_TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-4-cfontana@suse.de>
 <b358544a-d550-97c3-917a-0aaeb85ce34b@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <23006513-c0c9-bca1-d1c7-5d5fd6f679f6@suse.de>
Date: Wed, 14 Apr 2021 10:28:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b358544a-d550-97c3-917a-0aaeb85ce34b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 10:49 PM, Philippe Mathieu-Daudé wrote:
> On 3/26/21 8:35 PM, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target/arm/tcg/meson.build | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
>> index 0bd4e9d954..3b4146d079 100644
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -12,9 +12,9 @@ gen = [
>>    decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
>>  ]
>>  
>> -arm_ss.add(gen)
>> +arm_ss.add(when: 'CONFIG_TCG', if_true: gen)
>>  
>> -arm_ss.add(files(
>> +arm_ss.add(when: 'CONFIG_TCG', if_true: files(
>>    'translate.c',
>>    'helper.c',
>>    'iwmmxt_helper.c',
>> @@ -28,7 +28,7 @@ arm_ss.add(files(
>>    'debug_helper.c',
>>  ))
>>  
>> -arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>> +arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
>>    'translate-a64.c',
>>    'translate-sve.c',
>>    'helper-a64.c',
>>
> 
> Isn't it clearer to use in target/arm/meson.build:
> 
> if 'CONFIG_TCG' in config_all
>   subdir('tcg')
> endif
> 
> ?

This was my initial idea also, but now it is not possible anymore, since we now put some tcg stubs in tcg/.

We could instead put them in a dedicated stubs/ directory though.

The reason is basically that Paolo suggested to recurse unconditionally, I just considered this meson-related statement as an oracle.

Ciao,

Claudio

> 
> Similarly in the next patch for target/arm/tcg/meson.build:
> 
> if have_user
>   subdir('user')
> endif
> if have_system
>   subdir('sysemu')
> endif
> 


