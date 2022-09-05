Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE05ACEC1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 11:24:14 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV8Ky-0003D9-K0
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oV8Eg-0000sr-To
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:17:43 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oV8Ed-0003o9-O7
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:17:41 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BC2438495;
 Mon,  5 Sep 2022 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662369457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LM0nWEtPrD42R9CojYmOWE4ep9AIp+m5ohJdO0uSzU4=;
 b=VbYEHJvot11ctQZRs2C4SEpSLNwyqc7VaiIW5nmrkqUgLetGTyENlHkMTnIskrkuqbcWWz
 K4xOgETXTTgol2W+ZEgTL7l/mgcQ3nWUXReoJKhPLWohcqADEX5eOm7HIz62UqTmibuO5y
 gacfRl5mcIPj7IywR673dgLPZe4u2/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662369457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LM0nWEtPrD42R9CojYmOWE4ep9AIp+m5ohJdO0uSzU4=;
 b=iGZ2XxheApikXwAaONQ1795DwnbUvbc3fJJ6ozMe7bTds7pcXUaqbT6NnRz8qs/GDI6mXE
 dY93f7+yFENGyLBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA483139C7;
 Mon,  5 Sep 2022 09:17:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t8G8K7C+FWNWIwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 05 Sep 2022 09:17:36 +0000
Message-ID: <371bfffe-214f-1ce8-94b0-7209eed75124@suse.de>
Date: Mon, 5 Sep 2022 11:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 01/10] module: qom module support
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-2-kraxel@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20200624131045.14512-2-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.978,
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

Hello Gerd, Paolo,

this commit from 2020, together with others in the same series, contains a flaw that now comes back to bite.

From commit 28457744c345ca4ccb58c984c9552e9c5955a9de ("module: qom module support") :

On 6/24/20 15:10, Gerd Hoffmann wrote:
> Add support for qom types provided by modules.  For starters use a
> manually maintained list which maps qom type to module and prefix.
> 
> Two load functions are added:  One to load the module for a specific
> type, and one to load all modules (needed for object/device lists as
> printed by -- for example -- qemu -device help).
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/qemu/module.h |  2 ++
>  util/module.c         | 55 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 011ae1ae7605..9121a475c1b6 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -70,5 +70,7 @@ void register_dso_module_init(void (*fn)(void), module_init_type type);
>  
>  void module_call_init(module_init_type type);
>  bool module_load_one(const char *prefix, const char *lib_name);
> +void module_load_qom_one(const char *type);
> +void module_load_qom_all(void);


See the "+void" just below the "bool". We have now hidden all the return values of module_load_one,
so now we cannot figure out if a load was successful or not, and the fact that module_load_one returns bool is now pointless, at least for qom.

As a pattern, I think this is rarely a good idea.


>  
>  #endif
> diff --git a/util/module.c b/util/module.c
> index e48d9aacc05a..ee560a4b4269 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -245,3 +245,58 @@ bool module_load_one(const char *prefix, const char *lib_name)
>  #endif
>      return success;
>  }
> +
> +/*
> + * Building devices and other qom objects modular is mostly useful in
> + * case they have dependencies to external shared libraries, so we can
> + * cut down the core qemu library dependencies.  Which is the case for
> + * only a very few devices & objects.
> + *
> + * So with the expectation that this will be rather the exception than
> + * to rule and the list will not gain that many entries go with a
> + * simple manually maintained list for now.
> + */
> +static struct {
> +    const char *type;
> +    const char *prefix;
> +    const char *module;
> +} const qom_modules[] = {
> +};
> +
> +static bool module_loaded_qom_all;
> +
> +void module_load_qom_one(const char *type)
> +{
> +    int i;
> +
> +    if (module_loaded_qom_all) {
> +        return;
> +    }
> +    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
> +        if (strcmp(qom_modules[i].type, type) == 0) {
> +            module_load_one(qom_modules[i].prefix,
> +                            qom_modules[i].module);
> +            return;

return value lost.

Should we not at least trace something, warn something?

Maybe we want to do it in module_load_one?


> +        }
> +    }
> +}
> +
> +void module_load_qom_all(void)
> +{
> +    int i;
> +
> +    if (module_loaded_qom_all) {
> +        return;
> +    }
> +    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
> +        if (i > 0 && (strcmp(qom_modules[i - 1].module,
> +                             qom_modules[i].module) == 0 &&
> +                      strcmp(qom_modules[i - 1].prefix,
> +                             qom_modules[i].prefix) == 0)) {
> +            /* one module implementing multiple types -> load only once */
> +            continue;
> +        }
> +        module_load_one(qom_modules[i].prefix, qom_modules[i].module);

return value lost.

> +    }
> +    module_loaded_qom_all = true;
> +}

Pair this with the next commit,

commit 0f8198f1b2f3c33df2381c412ad8d8fd219b90b2 ("object: qom module support") :

which goes:

> commit 0f8198f1b2f3c33df2381c412ad8d8fd219b90b2
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Wed Jun 24 15:10:37 2020 +0200
> 
>     object: qom module support
>     
>     Little helper function to load modules on demand.  In most cases adding
>     module loading support for devices and other objects is just
>     s/object_class_by_name/module_object_class_by_name/ in the right spot.
>     
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Message-id: 20200624131045.14512-3-kraxel@redhat.com
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 94a61ccc3f..51f188137f 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -994,6 +994,18 @@ bool object_class_is_abstract(ObjectClass *klass);
>   */
>  ObjectClass *object_class_by_name(const char *typename);
>  
> +/**
> + * module_object_class_by_name:
> + * @typename: The QOM typename to obtain the class for.
> + *
> + * For objects which might be provided by a module.  Behaves like
> + * object_class_by_name, but additionally tries to load the module

Note the use of the word "tries" in the comment.

> + * needed in case the class is not available.
> + *
> + * Returns: The class for @typename or %NULL if not found.
> + */
> +ObjectClass *module_object_class_by_name(const char *typename);
> +
>  void object_class_foreach(void (*fn)(ObjectClass *klass, void *opaque),
>                            const char *implements_type, bool include_abstract,
>                            void *opaque);
> diff --git a/qom/object.c b/qom/object.c
> index 6ece96bc2b..34daaf1280 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -985,6 +985,20 @@ ObjectClass *object_class_by_name(const char *typename)
>      return type->class;
>  }
>  
> +ObjectClass *module_object_class_by_name(const char *typename)
> +{
> +    ObjectClass *oc;
> +
> +    oc = object_class_by_name(typename);
> +#ifdef CONFIG_MODULES
> +    if (!oc) {
> +        module_load_qom_one(typename);
> +        oc = object_class_by_name(typename);

now here we fail during object_class_by_name() with oc that is NULL. So I guess we can evince that module_load_qom_one failed from here.


> +    }
> +#endif
> +    return oc;
> +}
> +
>  ObjectClass *object_class_get_parent(ObjectClass *class)
>  {
>      TypeImpl *type = type_get_parent(class->type);


We should be able to tell if a load is successful or not I think, but before that,

I think we are currently inconsistent, and do not report enough in terms of tracing and errors to the user
as to the reason that a module load fails.

Either we add tracing to module_load_one, and make it so that module_load_one also returns void,
or we change module_load_qom_one to also return bool.

Note, qdev also makes use of this facility.

Thoughts?

Claudio

