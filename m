Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCD3CF4AC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 08:42:10 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5jSD-0008LD-7o
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 02:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m5jR4-0007Rd-Rl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 02:40:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m5jR3-0001wO-7J
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 02:40:58 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC7C322338;
 Tue, 20 Jul 2021 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626763254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cN9H3UlUowIAHd6AZtXBugoNHb6LjBlZRiiScBgA/A=;
 b=acPtt5Gw/WMtz2sktOP7MZM5TDo8yK3MpUOhP2fJNuTgAMTH2wjuJTyIx3bDHKA1UogQWN
 +bRXj25oR3ZLBw1P+RoAzWClOlqD7sDGxPFin525RGe0LfD6UH0uN26FSjwAuNWZE8JkRU
 K1BFri4hpFVCoQ0EStyuLkiaTV531VU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626763254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cN9H3UlUowIAHd6AZtXBugoNHb6LjBlZRiiScBgA/A=;
 b=7wy1ekKQhyGW/jje4X/OaCj2gGo2YiOBlHzVIFo3PZtITZOVemh0GeMRTz9fhvRQVV7wer
 a0HVIJnaocTqh6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95D9413D53;
 Tue, 20 Jul 2021 06:40:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dTXzIfZv9mAucgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 20 Jul 2021 06:40:54 +0000
Subject: Re: [RFC 3/3] qom: Improve error message in
 module_object_class_by_name()
To: "Jose R. Ziviani" <jziviani@suse.de>
References: <20210630232749.21873-1-jziviani@suse.de>
 <20210630232749.21873-4-jziviani@suse.de>
 <c82bb889-a3a8-6870-ca79-108ec9a104d1@suse.de> <YPYmLEuJ165xy5aR@pizza>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <afe32121-8bfa-9438-2a23-1411c73b520d@suse.de>
Date: Tue, 20 Jul 2021 08:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YPYmLEuJ165xy5aR@pizza>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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
Cc: pbonzini@redhat.com, kraxel@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:26 AM, Jose R. Ziviani wrote:
> On Mon, Jul 19, 2021 at 05:29:49PM +0200, Claudio Fontana wrote:
>> On 7/1/21 1:27 AM, Jose R. Ziviani wrote:
>>> module_object_class_by_name() calls module_load_qom_one if the object
>>> is provided by a dynamically linked library. Such library might not be
>>> available at this moment - for instance, it can be a package not yet
>>> installed. Thus, instead of assert error messages, this patch outputs
>>> more friendly messages.
>>>
>>> Current error messages:
>>> $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
>>> ...
>>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
>>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
>>> [1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
>>>
>>> New error message:
>>> $ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
>>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>>>
>>> $ make check
>>> ...
>>> Running test qtest-x86_64/test-filter-mirror
>>> Running test qtest-x86_64/endianness-test
>>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>>> accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
>>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>>> ...
>>>
>>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>>> ---
>>>  qom/object.c | 30 ++++++++++++++++++++++++++++++
>>>  1 file changed, 30 insertions(+)
>>>
>>> diff --git a/qom/object.c b/qom/object.c
>>> index 6a01d56546..2d40245af9 100644
>>> --- a/qom/object.c
>>> +++ b/qom/object.c
>>> @@ -1024,6 +1024,24 @@ ObjectClass *object_class_by_name(const char *typename)
>>>      return type->class;
>>>  }
>>>  
>>> +char *get_accel_module_name(const char *ac_name);
>>> +
>>> +char *get_accel_module_name(const char *ac_name)
>>> +{
>>> +    size_t len = strlen(ac_name);
>>> +    char *module_name = NULL;
>>> +
>>> +    if (strncmp(ac_name, "tcg-accel-ops", len) == 0) {
>>> +#ifdef CONFIG_TCG_MODULAR
>>> +        module_name = g_strdup_printf("%s%s", "accel-tcg-", "x86_64");
>>> +#endif
>>> +    } else if (strncmp(ac_name, "qtest-accel-ops", len) == 0) {
>>> +        module_name = g_strdup_printf("%s%s", "accel-qtest-", "x86_64");
>>> +    }
>>> +
>>> +    return module_name;
>>> +}
>>> +
>>>  ObjectClass *module_object_class_by_name(const char *typename)
>>>  {
>>>      ObjectClass *oc;
>>> @@ -1031,8 +1049,20 @@ ObjectClass *module_object_class_by_name(const char *typename)
>>>      oc = object_class_by_name(typename);
>>>  #ifdef CONFIG_MODULES
>>>      if (!oc) {
>>> +        char *module_name;
>>>          module_load_qom_one(typename);
>>>          oc = object_class_by_name(typename);
>>> +        module_name = get_accel_module_name(typename);
>>> +        if (module_name) {
>>> +            if (!module_is_loaded(module_name)) {
>>> +                fprintf(stderr, "%s module is missing, install the "
>>> +                                "package or config the library path "
>>> +                                "correctly.\n", module_name);
>>> +                g_free(module_name);
>>> +                exit(1);
>>> +            }
>>> +            g_free(module_name);
>>> +        }
>>>      }
>>>  #endif
>>>      return oc;
>>>
>>
>> Hi Jose,
>>
>> this inserts accel logic into module_object_class_by_name,
>> maybe some other place would be better to insert this check,
>> like when trying to select an accelerator?
> 
> 
> Hello Claudio,
> 
> Yes, I think that 'get_accel_module_name()' may be a more generic
> 'get_module_name()' to handle any module failure (not only
> accelerators).
> 
> I'll improve it and send a v2. Thank you for reviewing it.
> 

I also wonder, and @Gerd , should "tcg_enabled()", tcg_allowed etc as a mechanism be rethought,
in light of modular TCG?

Probably would be easier to do if we had a general mechanism for CONFIG_TCG=m CONFIG_KVM=m ... which can separately be set as modules.

Thanks,

Claudio

