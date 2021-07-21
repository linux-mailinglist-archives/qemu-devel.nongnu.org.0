Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B19F3D0BAE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:04:55 +0200 (CEST)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m695y-0001kU-CS
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m68zK-0005LO-0w
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:58:02 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m68zI-0005Fh-5Q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:58:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C1361FE8B;
 Wed, 21 Jul 2021 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626861478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC7tZauk+F34MxAm1wUtHAVbUIPkhPIbS9h6iye+yKc=;
 b=BDlqF5yXgusNfEUkhe5f1cb16s4/LxsvZBc9FgkD6B2pza3NeQU3FxbYhptBgYOX4fAovH
 RkpilHREIcYM2dhZ4VzMZFIJNlx+Gs8BvqqVb3JyCDdkoZqzbbztKE25N7NDWQLx8XPkr8
 bYQGWeEvA6RKwwGMCHpe96gr4izQqCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626861478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC7tZauk+F34MxAm1wUtHAVbUIPkhPIbS9h6iye+yKc=;
 b=U1zHOL2xXGuT4/W/NxS7RsX9TOXmNM61dxTUbUmQjSjXHOv80WhaSZvYUnKRsRVc20y4ZL
 JfhiOe2aCkhe1xBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B82713B39;
 Wed, 21 Jul 2021 09:57:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id km6jDKbv92CjKwAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 21 Jul 2021 09:57:58 +0000
Subject: Re: [PATCH 2/2] qom: Improve error message in
 module_object_class_by_name()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Jose R. Ziviani" <jziviani@suse.de>
References: <20210720223120.21711-1-jziviani@suse.de>
 <20210720223120.21711-3-jziviani@suse.de> <YPfqOOl5DvsAMr+z@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d8a5574e-3697-30db-e103-229384de098c@suse.de>
Date: Wed, 21 Jul 2021 11:57:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YPfqOOl5DvsAMr+z@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 ehabkost@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 11:34 AM, Daniel P. Berrangé wrote:
> On Tue, Jul 20, 2021 at 07:31:20PM -0300, Jose R. Ziviani wrote:
>> module_object_class_by_name() calls module_load_qom_one if the object
>> is provided by a dynamically linked library. Such library might not be
>> available at this moment - for instance, it can be a package not yet
>> installed. Thus, instead of assert error messages, this patch outputs
>> more friendly messages.
>>
>> Current error messages:
>> $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
>> ...
>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
>> [1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
>>
>> New error message:
>> $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>>
>> Or with other modules, when possible:
>> $ ./qemu-system-x86_64 -machine q35 -accel kvm -kernel /boot/vmlinuz -vga qxl                                                                     ✹
>> hw-display-qxl module is missing, install the package or config the library path correctly.
>> qemu-system-x86_64: QXL VGA not available
>>
>> $ make check
>> ...
>> Running test qtest-x86_64/test-filter-mirror
>> Running test qtest-x86_64/endianness-test
>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>> ...
>>
>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>> ---
>>  accel/accel-softmmu.c | 5 ++++-
>>  qom/object.c          | 9 +++++++++
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>> index 67276e4f52..52449ac2d0 100644
>> --- a/accel/accel-softmmu.c
>> +++ b/accel/accel-softmmu.c
>> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>       * all accelerators need to define ops, providing at least a mandatory
>>       * non-NULL create_vcpu_thread operation.
>>       */
>> -    g_assert(ops != NULL);
>> +    if (ops == NULL) {
>> +        exit(1);
>> +    }
>> +
>>      if (ops->ops_init) {
>>          ops->ops_init(ops);
>>      }
>> diff --git a/qom/object.c b/qom/object.c
>> index 6a01d56546..3a170ea9df 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -10,6 +10,7 @@
>>   * See the COPYING file in the top-level directory.
>>   */
>>  
>> +#include "qemu/module.h"
>>  #include "qemu/osdep.h"
>>  #include "hw/qdev-core.h"
>>  #include "qapi/error.h"
>> @@ -1031,8 +1032,16 @@ ObjectClass *module_object_class_by_name(const char *typename)
>>      oc = object_class_by_name(typename);
>>  #ifdef CONFIG_MODULES
>>      if (!oc) {
>> +        const char *module_name = module_get_name_from_obj(typename);
>>          module_load_qom_one(typename);
>>          oc = object_class_by_name(typename);
>> +        if (!oc && module_name) {
>> +            if (!module_is_loaded(module_name)) {
>> +                fprintf(stderr, "%s module is missing, install the "
>> +                                "package or config the library path "
>> +                                "correctly.\n", module_name);
>> +            }
>> +        }
>>      }
> 
> Introducing a call to module_is_loaded is feels like it isn't really
> addressing the root cause.
> 
> The error scenario here exists because module_load_qom_one() can
> fail to load the requested module. We don't detect that failure
> because module_load_qom_one() is "void" for some reason. There
> are several possible causes of failure and missing file on disk
> is only one of them.
> 
> This general error message about "module_name" being missing is
> misleading when there are dependancies involved. "module_name"
> may well exist, but something it depends on might be missing.
> Or the modules might have been built from wrong QEMU and be
> unable to be dlopened despite existing.
> 
> I think we need to fix module_load_qom_one() so that it can
> actually report failure via an "Error **errp" parameter.

Sounds right to me.

> This will also entail fixing a number of methods it in turn
> calls.
> 
> 
> Regards,
> Daniel
> 

Thanks,

Claudio

