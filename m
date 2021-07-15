Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66C3CA1AA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:48:28 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43b8-0008Jw-P4
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m43Zv-0007ay-61
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m43Zr-0007mi-BS
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626364024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXFaY5icbK0IdEg57BNe9tFsKp2swkUgckk928hydNA=;
 b=ZxYrpmvuOdspJnSImndnS03A+iquoEoQ6ew2yDkp3fh6RXgt1IxLQVid9mvBW/DdJpTeoD
 bZL3Fa0J3ZVRO0UbqCgjvM1ZarAsG0mISFiXUjOtsN3kLJtfNb4Cp1c2ZPQVzueCJ/DoCL
 FU+SeaSyw9il0Uh+hlPQf/Jl1bCjYSw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-OQiiwAELN7-imbmkiGwBgQ-1; Thu, 15 Jul 2021 11:47:00 -0400
X-MC-Unique: OQiiwAELN7-imbmkiGwBgQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1948438wmh.9
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXFaY5icbK0IdEg57BNe9tFsKp2swkUgckk928hydNA=;
 b=Wp2/gRw+41t8Pi4MXsre0edYjG9bz4juImjkjqcCc0pu6BZtY7RKc/jdB+tt+YtTmT
 BSlrXhPh52kyS3luw6A9oBV7LQ7fyb+s+TXKErFbUCEeqeyvn89QkA7ZE8J1x3q9+rDa
 0bghVN/FB7ocOvhjJCdgPV8GOMUW7kP1kQCgmdoLZQ6yObMtKI5m8JPbi2ECJAd0Jqlf
 NF+hbtf/oQ2Ojw8YfGx80UUcZlhH9OYxUekAPXYjVFGNANcXPpT9gEu1xQH3ej3XNcUG
 FSAElwU8N0ahiRXp1wpkk+GOVgmrLO5qE2lj0ep0OgUYxL92ha9CkN9QUr2S3zq//Oz7
 Xx5Q==
X-Gm-Message-State: AOAM531Kv2n7RNoOFFsO8dgJELrQ5JryyE0/9LXq8r/ReaJ0QQgL64pc
 KEdeJSwSUvBJlAsLaszgY/dsOvpDezjJsjpjOhzSqGXVP7XWhMTMgquHJg9LKU/Vw5UNZOzBMEk
 UFWWADGnDh4n1TQc=
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr5393790wml.46.1626364019698;
 Thu, 15 Jul 2021 08:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Jdn4eglSNV9eVNLZp8xsUszju0DLRVQ0drEbvMexPCR313pM5QgEOvor3HgAvG+1gY7v0A==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr5393777wml.46.1626364019505;
 Thu, 15 Jul 2021 08:46:59 -0700 (PDT)
Received: from thuth.remote.csb (p5791d421.dip0.t-ipconnect.de.
 [87.145.212.33])
 by smtp.gmail.com with ESMTPSA id r15sm6979743wrx.94.2021.07.15.08.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:46:58 -0700 (PDT)
Subject: Re: [PATCH v4 1/5] configure,meson: add option to enable LTO
From: Thomas Huth <thuth@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-2-dbuono@linux.vnet.ibm.com>
 <4c4542ca-a5cd-5229-6902-f3ea35c6e59f@redhat.com>
Message-ID: <1b20b214-81f4-16a5-1e99-d12f6868f3ba@redhat.com>
Date: Thu, 15 Jul 2021 17:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4c4542ca-a5cd-5229-6902-f3ea35c6e59f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/07/2021 12.22, Thomas Huth wrote:
> On 05/12/2020 00.06, Daniele Buono wrote:
>> This patch allows to compile QEMU with link-time optimization (LTO).
>> Compilation with LTO is handled directly by meson. This patch only
>> adds the option in configure and forwards the request to meson
>>
>> Tested with all major versions of clang from 6 to 12
>>
>> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> ---
>>   configure   | 7 +++++++
>>   meson.build | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 18c26e0389..fee118518b 100755
>> --- a/configure
>> +++ b/configure
>> @@ -242,6 +242,7 @@ host_cc="cc"
>>   audio_win_int=""
>>   libs_qga=""
>>   debug_info="yes"
>> +lto="false"
>>   stack_protector=""
>>   safe_stack=""
>>   use_containers="yes"
>> @@ -1167,6 +1168,10 @@ for opt do
>>     ;;
>>     --disable-werror) werror="no"
>>     ;;
>> +  --enable-lto) lto="true"
>> +  ;;
>> +  --disable-lto) lto="false"
>> +  ;;
>>     --enable-stack-protector) stack_protector="yes"
>>     ;;
>>     --disable-stack-protector) stack_protector="no"
>> @@ -1751,6 +1756,7 @@ disabled with --disable-FEATURE, default is enabled 
>> if available:
>>     module-upgrades try to load modules from alternate paths for upgrades
>>     debug-tcg       TCG debugging (default is disabled)
>>     debug-info      debugging information
>> +  lto             Enable Link-Time Optimization.
>>     sparse          sparse checker
>>     safe-stack      SafeStack Stack Smash Protection. Depends on
>>                     clang/llvm >= 3.7 and requires coroutine backend 
>> ucontext.
>> @@ -7014,6 +7020,7 @@ NINJA=$ninja $meson setup \
>>           -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>>           -Dvhost_user_blk_server=$vhost_user_blk_server \
>> +        -Db_lto=$lto \
>>           $cross_arg \
>>           "$PWD" "$source_path"
>> diff --git a/meson.build b/meson.build
>> index e3386196ba..ebd1c690e0 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2044,6 +2044,7 @@ summary_info += {'gprof enabled':     
>> config_host.has_key('CONFIG_GPROF')}
>>   summary_info += {'sparse enabled':    sparse.found()}
>>   summary_info += {'strip binaries':    get_option('strip')}
>>   summary_info += {'profiler':          
>> config_host.has_key('CONFIG_PROFILER')}
>> +summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
>>   summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>>   if targetos == 'darwin'
>>     summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
>>
> 
> I just came across this --enable-lto option ... but looking at the 
> implementation here, it seems only to emit a line in the summary_info, 
> without adding any compiler flags? Was this patch incomplete? Or do I miss 
> something?

Never mind, I now learnt that b_lto is apparently an option that is directly 
understood by meson already :-)

  Thomas


