Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CACC69C6A7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:30:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1YN-0006Ul-F0; Mon, 20 Feb 2023 03:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pU1YE-0006Tt-Nh
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:29:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pU1YC-00045E-IM
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676881770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a4fL/iQU105ogPIoh+kMayK1d5QPAaWRGsXMH5bBMDc=;
 b=itEQL7Ud7tU5cN6U8JAYa0OTO/odnXSmOAszuBzArjHhqjNAZ23VJp6nccVvJQ2UvscYqr
 PCcGNRLXkDshvcxmuVxS4qYhz5jsSIk+6OeH7idI0msYSJII4eqJCe41pL3nsbjGYgbWeP
 FbFzfEwAdHkQqkzi0JGEzrQtQ70OBqM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-Rb6yYgunMGiCFeWAtcYhDw-1; Mon, 20 Feb 2023 03:29:28 -0500
X-MC-Unique: Rb6yYgunMGiCFeWAtcYhDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52FEE1C0518C;
 Mon, 20 Feb 2023 08:29:28 +0000 (UTC)
Received: from [10.39.192.147] (unknown [10.39.192.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 281E72026D4B;
 Mon, 20 Feb 2023 08:29:27 +0000 (UTC)
Message-ID: <3468a643-6bea-9243-3569-23a07cca582d@redhat.com>
Date: Mon, 20 Feb 2023 09:29:25 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: make version available in coredump
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20220607203221.966261-1-vsementsov@yandex-team.ru>
 <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 23:05, Stefan Hajnoczi wrote:
> On Tue, 7 Jun 2022 at 16:33, Vladimir Sementsov-Ogievskiy
> <vsementsov@yandex-team.ru> wrote:
>>
>> Add a variable with QEMU_FULL_VERSION definition. Then the content of
>> the variable is easily searchable:
>>
>>    strings /path/to/core | grep QEMU_FULL_VERSION
>>
>> 'volatile' keyword is used to avoid removing the variable by compiler as
>> unused.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>
>> Hi all!
>>
>> Probably, I just don't know the correct way to get version from core
>> file. If so, please teach me :)
> 
> I've never hit this issue because bug reports usually include the QEMU
> distro package version. Keeping the version string in the core file
> seems reasonable (unless there is already another way to do this).
> 
> Something I'm curious about: is the coredump guaranteed to contain
> static const variables? I wondered if they might be located in the
> .rodata ELF section and excluded from the coredump because they are
> referenced in the NT_FILE mmap note instead. Maybe volatile prevents
> this?
> 
> I CCed Laszlo because I think he worked on crash dumping in the past
> and might know the answer to my question about coredumps.

Apologies -- I don't know. (But, I see the original problem has been
resolved down-thread!)

[FWIW, I've now grepped the tree for QEMU_FULL_VERSION cursorily, and
I'd say doing something like Vladimir's patch, and then replacing all
the references too, could be a good cleanup. At least personally I'm not
a huge fan of macros that expand to string literals (format strings such
as PRIu32, HWADDR_FMT_plx, DMA_ADDR_FMT etc are exceptions of course).
But this is really just a thought in passing.]

Laszlo

> 
> Stefan
> 
>>
>>  softmmu/vl.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 4c1e94b00e..1f51a713a0 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -164,6 +164,19 @@ typedef struct DeviceOption {
>>      QTAILQ_ENTRY(DeviceOption) next;
>>  } DeviceOption;
>>
>> +/*
>> + * qemu_full_version_decl is for debugging. Assume you have coredump file, but
>> + * don't know the version neither have original qemu binary file. You need to
>> + * download a package with corresponding binary (and debug package with
>> + * symbols), but which one? You need the version.
>> + *
>> + * This variable makes it simple to get the version by command
>> + *
>> + *     strings path/to/core | grep QEMU_FULL_VERSION
>> + */
>> +static volatile const char qemu_full_version_decl[] =
>> +    "QEMU_FULL_VERSION: " QEMU_FULL_VERSION;
>> +
>>  static const char *cpu_option;
>>  static const char *mem_path;
>>  static const char *incoming;
>> --
>> 2.25.1
>>
>>
> 


