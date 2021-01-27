Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED3306195
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:08:27 +0100 (CET)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4oIr-0002W4-HA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4oEG-0000k1-0c
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4oEC-0004aE-ME
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611767015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdreIqywg5fodV32K0FHdGysRDPkSJAfYb3DP50uQVE=;
 b=YDEbqeCYVPswWCBREQp6/gxEXY97byi1PTbXEcP2022EeZQlXZtsynTLztLU4dwvejnSHO
 a/xre3mO8QfQdRMQjP5p+XXYgIwt0S3L3PyfWQulvZ0VE0wz87DPHIqDcrDnuhqhlHC3cr
 Vumvq4Nq+kQGXRba7AJwbuIojaIUHD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-fuInxpFyNjuoyItR4mKn6w-1; Wed, 27 Jan 2021 12:03:30 -0500
X-MC-Unique: fuInxpFyNjuoyItR4mKn6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEFB88042C9;
 Wed, 27 Jan 2021 17:03:29 +0000 (UTC)
Received: from [10.40.194.186] (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6722E70958;
 Wed, 27 Jan 2021 17:03:28 +0000 (UTC)
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com> <20210127105436.GG3653144@redhat.com>
 <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
 <20210127163522.5a8db09a@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <2a90bb34-3950-ef4a-9c1c-81d6cb6b1155@redhat.com>
Date: Wed, 27 Jan 2021 18:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127163522.5a8db09a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 4:35 PM, Igor Mammedov wrote:
> On Wed, 27 Jan 2021 15:24:26 +0100
> Michal Privoznik <mprivozn@redhat.com> wrote:
> 
>> On 1/27/21 11:54 AM, Daniel P. Berrangé wrote:
>>> On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrangé wrote:
>>>> On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote:
>>
>>
>>>>
>>>> How does a mgmt app know which machine types need to use this
>>>> option ? The machine type names are opaque strings, and apps
>>>> must not attempt to parse or interpret the version number
>>>> inside the machine type name, as they can be changed by
>>>> distros.  IOW, saying to use it for machine types 4.0 and
>>>> older isn't a valid usage strategy IMHO.
> it's possible (but no necessary) to use knob with new machine types
> (defaults for these match suggested property value).
> Limiting knob usage to 4.0 and older would allow us to drop
> without extra efforts once 4.0 is deprecated/removed.

Problem here is that libvirt treats machine type as an opaque string. 
Therefore, as could be seen in my patch for libvirt, the property is 
disabled for all started VMs, regardless of machine type:

https://www.redhat.com/archives/libvir-list/2021-January/msg00686.html

So it can't really go away ever, can it?

> 
>>> Looking at the libvirt patch, we do indeed use his property
>>> unconditionally for all machine types, precisely because parsing
>>> version numbers from the machine type is not allowed.
>>>
>>> https://www.redhat.com/archives/libvir-list/2021-January/msg00633.html
>>>
>>> So this doc is telling apps to do something that isn't viable
>>
>> The other approach that I was suggesting was, that QEMU stops reporting
>> 'default-ram-id' for affected machine types. The way the switch from '-m
>> XMB' to memory-backend-* was implemented in libvirt is that if libvirt
>> sees 'default-ram-id' attribute for given machine type it uses
>> memory-backend-* otherwise it falls back to -m.
>>
>> Since we know which machine types are "broken", we can stop reporting
>> the attribute and thus stop tickling this bug. I agree that it puts more
>> burden on distro maintainers to backport the change, but I think it's
>> acceptable risk.
> 
> default-ram-id is already exposed in wild including old machine types
> starting from 5.2

It is, but according to qapi/machine.json it is optional. Mgmt apps have 
to be able to deal with it missing.

> 
> if libvirt will take care this one quirk, then I guess we can
> do as suggested. I can post an additional patch to this effect if there
> is agreement to go this route.

The beauty of this solution is that libvirt wouldn't need to do anything 
:-)  As I said earlier, if no default-ram-id is found then libvirt falls 
back to '-m X'.

I've cooked a dirty patch that works in my testing:

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index affffe0c4a..2214782d72 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -238,8 +238,33 @@ MachineInfoList *qmp_query_machines(Error **errp)
              info->has_default_cpu_type = true;
          }
          if (mc->default_ram_id) {
-            info->default_ram_id = g_strdup(mc->default_ram_id);
-            info->has_default_ram_id = true;
+            int i;
+            bool broken = false;
+
+            /* Default RAM ID is broken if 
x-use-canonical-path-for-ramblock-id
+             * property of memory-backend is on. That's why it's 
disabled in
+             * create_default_memdev(). However, some machine types 
turn it on
+             * for backwards compatibility. */
+            for (i = 0; i < mc->compat_props->len; i++) {
+                GlobalProperty *p = g_ptr_array_index(mc->compat_props, i);
+
+                if (strcmp(p->driver, TYPE_MEMORY_BACKEND_FILE) != 0)
+                    continue;
+
+                if (strcmp(p->property, 
"x-use-canonical-path-for-ramblock-id") != 0)
+                    continue;
+
+                if (strcmp(p->value, "true") != 0)
+                    continue;
+
+                broken = true;
+                break;
+            }
+
+            if (!broken) {
+                info->default_ram_id = g_strdup(mc->default_ram_id);
+                info->has_default_ram_id = true;
+            }
          }

          QAPI_LIST_PREPEND(mach_list, info);


Michal


