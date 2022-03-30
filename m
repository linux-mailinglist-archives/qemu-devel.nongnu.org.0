Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E04EC315
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:27:13 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXPr-0001tQ-T2
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:27:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZXNG-00004q-J3
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZXNE-000836-W6
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648643068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHQRIygcWdcl06Qz//+t22lhhLGXoQRkL8h4H4OThzI=;
 b=ADjn+pWzCtZlYOYmlni0AXR8vrOgvLCgS7H5W9ioD062Py5o0gdtjTd4xmTwF7j5axt8DK
 KWBIBMJWbADyipSBGZCc1Gq88wEeK2fjXFSMeu/kitgXzYmUgvupj9+5Pu1BH7RQEIEx6W
 k/Kggd1JtrVlpDvPaDDTjx1BsO+3U5Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-oz3e--yvMBaeHG-DBkEbrQ-1; Wed, 30 Mar 2022 08:24:23 -0400
X-MC-Unique: oz3e--yvMBaeHG-DBkEbrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D5AF1C1C523;
 Wed, 30 Mar 2022 12:24:22 +0000 (UTC)
Received: from [10.33.198.128] (reserved-198-128.str.redhat.com
 [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC4EA400E420;
 Wed, 30 Mar 2022 12:24:21 +0000 (UTC)
Message-ID: <7eb70fcb-0010-f291-6361-b270615ed7ef@redhat.com>
Date: Wed, 30 Mar 2022 14:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH for-7.0] meson.build: Fix dependency of page-vary-common.c
 to config-poison.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220330114808.942933-1-thuth@redhat.com>
 <e4de3f54-e812-9393-0b13-504fb78063e2@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e4de3f54-e812-9393-0b13-504fb78063e2@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2022 14.05, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 30/3/22 13:48, Thomas Huth wrote:
>> Before compiling page-vary-common.c, we have to make sure that
>> config-poison.h has been generated (which is in the "genh" list).
> 
> I am a bit confused, "config-poison.h" is include by "exec/poison.h"
> which is included by "qemu/osdep.h" for all non-softmmu code (tools,
> common and -user).
> 
> Why is pagevary specific?

pagevary is certainly not specific here, we're doing this
all over the place in meson.build:

$ grep -r static_library.*genh meson.build
   libmodulecommon = static_library('module-common', files('module-common.c') + genh, pic: true, c_args: '-DBUILD_DSO')
   pagevary = static_library('page-vary-common', sources: pagevary + genh,
       sl = static_library(d + '-' + m, [genh, module_ss.sources()],
libqom = static_library('qom', qom_ss.sources() + genh,
libauthz = static_library('authz', authz_ss.sources() + genh,
libcrypto = static_library('crypto', crypto_ss.sources() + genh,
libio = static_library('io', io_ss.sources() + genh,
libmigration = static_library('migration', sources: migration_files + genh,
libblock = static_library('block', block_ss.sources() + genh,
libblockdev = static_library('blockdev', blockdev_ss.sources() + genh,
libqmp = static_library('qmp', qmp_ss.sources() + genh,
libchardev = static_library('chardev', chardev_ss.sources() + genh,
libhwcore = static_library('hwcore', sources: hwcore_ss.sources() + genh,

> Shouldn't add genh to all common_ss[]?
> 
> Maybe the problem is how common_all[] is created?

Maybe there is a better way to handle these dependencies ...
but that's rather a bigger change and thus something for
the 7.1 cycle, I think.

  Thomas


>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/948
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index aef724ad3c..04ce33fef1 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2881,7 +2881,7 @@ if get_option('b_lto')
>>     if get_option('cfi')
>>       pagevary_flags += '-fno-sanitize=cfi-icall'
>>     endif
>> -  pagevary = static_library('page-vary-common', sources: pagevary,
>> +  pagevary = static_library('page-vary-common', sources: pagevary + genh,
>>                               c_args: pagevary_flags)
>>     pagevary = declare_dependency(link_with: pagevary)
>>   endif
> 


