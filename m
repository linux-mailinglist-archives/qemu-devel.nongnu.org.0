Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682EE309D80
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 16:27:34 +0100 (CET)
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6EdR-0003fR-DW
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 10:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EZy-0001ef-Mz; Sun, 31 Jan 2021 10:23:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EZw-0002ml-E5; Sun, 31 Jan 2021 10:23:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so11159764wru.9;
 Sun, 31 Jan 2021 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N9YuyM8sxr9NPcEXWnKAb5THAcC1TmnrrWWYKnUD3jo=;
 b=QBi5WIRtPEQ20BhqZCqNGroe7Kj3kTG7qijOUvw5YJ/tN4HHiqcSHyH5XGgJP+zAKt
 gp8WG3M0WgVR0e4G/WMajghyQFC2LZ86rzXianKzBJdLw3RDkGNQ/qbLDYbtnFSFCxvd
 hehhFMabetZWd5+OjZ4mkYb62tRGzEpgs1Z3D1OUwV4UwJACASy7jFm33cEaVynAQ1W9
 Av3kuVXkszEVdiBhfW8OBSKhoha3psg+Meg82ohA3OEXNoiNcNdLLL2T3hg3e5lGdVDl
 lxP67x33kOWmzCdiefkqMRvzwPnOlC2Hkp4fIoLNCjsVTFgtdn4xcwk5vwn+170OGb4r
 rWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N9YuyM8sxr9NPcEXWnKAb5THAcC1TmnrrWWYKnUD3jo=;
 b=BWBDFvF+bae4SZUS++stJmfvBLEkXEHqWw85vWvwkutzwKjHcs7SJq8gNzrX6llw0s
 oejMosaXX/0sjc/FTlISf32HUrhsAyqqvQ8FpIkpf7fd58sl0D+68XQzfrCQF1wKaqOI
 2Wk/P0j+SPu4Vr5Y8XZbCIK4Q4rckFRL4jn80JVj2QnJpzWnzI+pNSUCy4MkTt9vNvUU
 i/MDW46cdQqNISh7W8fe/FKel2GtJWv0r+5f7O7PZvgo1g626thZBqDQAjhUSUC2+yrx
 sAkZdyH/9bdqPxnanUdzF49MjaBD4n8MwEPZ0rULjM0IINM6GMKhzLXM6nWNF/TK/uOp
 OqlA==
X-Gm-Message-State: AOAM532v25d4VRR/pE717bq5oZTKDzb6hYjMaY1fgIK+GfZqFcHwa7aI
 sE67sr8NNv4W8z7xcldpwdA=
X-Google-Smtp-Source: ABdhPJwncVqETyvOb+KhyNe7T0QWTADFBqIuV3MWSERnkmt6/qSkcUJk6CTvmLkvvF5XQK+vWk9HBA==
X-Received: by 2002:a5d:6a45:: with SMTP id t5mr13717252wrw.252.1612106633502; 
 Sun, 31 Jan 2021 07:23:53 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d3sm26390267wrp.79.2021.01.31.07.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:23:52 -0800 (PST)
Subject: Re: [PATCH v6 01/11] sysemu/tcg: Introduce tcg_builtin() helper
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-2-f4bug@amsat.org>
 <87d562ba-20e5-ee50-8793-59d77564f4da@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <009b3856-cc7d-af85-0094-69490aa6e824@amsat.org>
Date: Sun, 31 Jan 2021 16:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87d562ba-20e5-ee50-8793-59d77564f4da@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 3:18 PM, Claudio Fontana wrote:
> On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
>> Modules are registered early with type_register_static().
>>
>> We would like to call tcg_enabled() when registering QOM types,
> 
> 
> Hi Philippe,
> 
> could this not be controlled by meson at this stage?
> On X86, I register the tcg-specific types in tcg/* in modules that are only built for TCG.
> 
> Maybe tcg_builtin() is useful anyway, thinking long term at loadable modules,
> but there we are interested in whether tcg code is available or not, regardless of whether it's builtin,
> or needs to be loaded via a .so plugin..
> 
> maybe tcg_available()?

The alternatives I found:

- reorder things in vl.c?

- use ugly #ifdef'ry, see this patch:
  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg08037.html

- this earlier approach I previously discarded:

-- >8 --
diff --git a/include/qom/object.h b/include/qom/object.h
index d378f13a116..30590c6fac3 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -403,9 +403,12 @@ struct Object
  *   parent class initialization has occurred, but before the class itself
  *   is initialized.  This is the function to use to undo the effects of
  *   memcpy from the parent class to the descendants.
- * @class_data: Data to pass to the @class_init,
+ * @class_data: Data to pass to the @class_registerable, @class_init,
  *   @class_base_init. This can be useful when building dynamic
  *   classes.
+ * @registerable: This function is called when modules are registered,
+ *   prior to any class initialization. When present and returning %false,
+ *   the type is not registered, the class is not present (not usable).
  * @interfaces: The list of interfaces associated with this type.  This
  *   should point to a static array that's terminated with a zero filled
  *   element.
@@ -428,6 +431,7 @@ struct TypeInfo
     void (*class_base_init)(ObjectClass *klass, void *data);
     void *class_data;

+    bool (*registerable)(void *data);
     InterfaceInfo *interfaces;
 };

diff --git a/qom/object.c b/qom/object.c
index 2fa0119647c..0febaffa12e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -138,6 +138,10 @@ static TypeImpl *type_new(const TypeInfo *info)
 static TypeImpl *type_register_internal(const TypeInfo *info)
 {
     TypeImpl *ti;
+
+    if (info->registerable && !info->registerable(info->class_data)) {
+        return NULL;
+    }
     ti = type_new(info);

     type_table_add(ti);

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 990509d3852..1a2b1889da4 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -24,6 +24,7 @@
 #include "hw/loader.h"
 #include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
 #include "qom/object.h"

 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for
ATAGS */
@@ -368,18 +369,26 @@ static void raspi3b_machine_class_init(ObjectClass
*oc, void *data)
 };
 #endif /* TARGET_AARCH64 */

+static bool raspi_machine_requiring_tcg_accel(void *data)
+{
+    return tcg_builtin();
+}
+
 static const TypeInfo raspi_machine_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("raspi0"),
         .parent         = TYPE_RASPI_MACHINE,
+        .registerable   = raspi_machine_requiring_tcg_accel,
         .class_init     = raspi0_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi1ap"),
         .parent         = TYPE_RASPI_MACHINE,
+        .registerable   = raspi_machine_requiring_tcg_accel,
         .class_init     = raspi1ap_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
+        .registerable   = raspi_machine_requiring_tcg_accel,
         .class_init     = raspi2b_machine_class_init,
 #ifdef TARGET_AARCH64
     }, {
---

> 
> Ciao,
> 
> Claudio
> 
>> but tcg_enabled() returns tcg_allowed which is a runtime property
>> initialized later (See commit 2f181fbd5a9 which introduced the
>> MachineInitPhase in "hw/qdev-core.h" representing the different
>> phases of machine initialization and commit 0427b6257e2 which
>> document the initialization order).
>>
>> As we are only interested if the TCG accelerator is builtin,
>> regardless of being enabled, introduce the tcg_builtin() helper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Cc: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/sysemu/tcg.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>> index 00349fb18a7..6ac5c2ca89d 100644
>> --- a/include/sysemu/tcg.h
>> +++ b/include/sysemu/tcg.h
>> @@ -13,8 +13,10 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
>>  #ifdef CONFIG_TCG
>>  extern bool tcg_allowed;
>>  #define tcg_enabled() (tcg_allowed)
>> +#define tcg_builtin() 1
>>  #else
>>  #define tcg_enabled() 0
>> +#define tcg_builtin() 0
>>  #endif
>>  
>>  #endif
>>
> 

