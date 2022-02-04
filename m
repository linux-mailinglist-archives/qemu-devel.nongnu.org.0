Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00254A9D10
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:38:35 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1bW-0007Um-PB
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:38:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG1P7-0007SY-SD
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG1P1-0006QM-Eq
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643991937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lKxXFVuMo9XePfmWPO8oAyY/wzSMik+3Sice77Y49A=;
 b=Kn0KpT91AZ1FbGX9WY8TQKLCZ2Bxu2gHvlBFKFpYDt/bZZb7nYqE5OfR4tFZ4q/pTRZYWt
 AZrBKK5cY0dqSJJvk65DioWxOhhm3XpRaFTBlwuo6yoTMwdHFX9VFZQxR126zuxGpqznpg
 xkYBVYHpucSwWQVew+qd21EpALmDZ8c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-kKzvQrIxMImFIXsC1djv8g-1; Fri, 04 Feb 2022 11:25:36 -0500
X-MC-Unique: kKzvQrIxMImFIXsC1djv8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so2583899wme.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+lKxXFVuMo9XePfmWPO8oAyY/wzSMik+3Sice77Y49A=;
 b=IBpDS00I0O0P4tfjEFfkmXS+B+AhUQ+uSsZHSEgJykLssfUatjhMr2Nk7y/Mx2YsTV
 q5tXPJ2iAvYaAlPAbPDs6H/LWzG5vp6J+5Kl7iGSWQF/qLxhDVN9wwgDWAddVlmz1CPX
 ufSV509eBs/EQIjKU6T/ZUCy4PDy1VK8+Dsh3NmhAj0zuBDxvqSmZJapceUxTvC2R5/Y
 wmDXiSE0OYz5HvGoCh/S/QMPzPBPdZd1ZSotittwFimIxM1S7aT5I8BE2E3pXmDaqVMo
 nGkFrr3aM8LRyLxLzhxaZFLJg9Aq17E7uEZV9rmRk7kR9vjIylenhtUJDuZt5xBwXB3z
 VV3g==
X-Gm-Message-State: AOAM530k8tQcZvKO7Imo0CcI1bT328ksgl4nbht1EqsHgWoOhAmXfy2H
 wYuwOV/koASaWj5z1Nek94lBAtw6DrYm/5PnyLLIKJ+Z0JfJBQOqxWg+FZQbdeNNDLzD96qS8un
 Pb0XOLG1vKwViw5g=
X-Received: by 2002:adf:ce0d:: with SMTP id p13mr3184678wrn.545.1643991935465; 
 Fri, 04 Feb 2022 08:25:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDidIxfcndzZnHM9EnCNz9ISNW4qyvONBErLTXQtIdx+Fszue7yFmp5JKztLyC39J3MBxbMQ==
X-Received: by 2002:adf:ce0d:: with SMTP id p13mr3184658wrn.545.1643991935251; 
 Fri, 04 Feb 2022 08:25:35 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id o27sm10754464wms.4.2022.02.04.08.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 08:25:34 -0800 (PST)
Message-ID: <a58b0cd7-819a-b693-2727-3ef5807eb3ca@redhat.com>
Date: Fri, 4 Feb 2022 17:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] qapi/meson: Restrict machine-specific objects to
 sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220204152924.6253-5-f4bug@amsat.org>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2022 16.29, Philippe Mathieu-Daudé wrote:
> machine/ and net/ are only useful to machines;
> block/ and migration/ to machine or tools.
> 
> Note we need to keep building machine.json generated sources
> on all targets because some want to access X86CPUFeatureWordInfo
> from any architecture ¯\_(ツ)_/¯ Otherwise we get on all but
> x86 targets:
> 
>    /usr/bin/ld: libqemu-i386-linux-user.fa.p/target_i386_cpu.c.o: in function `x86_cpu_get_feature_words':
>    ../target/i386/cpu.c:4587: undefined reference to `visit_type_X86CPUFeatureWordInfoList'
>    collect2: error: ld returned 1 exit status

Would it be possible to move the X86CPUFeatureWordInfo stuff into 
machine-target.json first, adding a proper 'if': 'TARGET_I386' there?

  Thomas


> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   qapi/meson.build | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 656ef0e039..38b01f3083 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -23,10 +23,6 @@ endif
>   
>   qapi_all_modules = [
>     'authz',
> -  'block',
> -  'block-core',
> -  'block-export',
> -  'char',
>     'common',
>     'compat',
>     'control',
> @@ -35,26 +31,23 @@ qapi_all_modules = [
>     'error',
>     'introspect',
>     'job',
> -  'machine',
> -  'machine-target',
> +  'machine', # x86 is considered multiarch by some
>     'migration',
>     'misc',
>     'misc-target',
> -  'net',
>     'pragma',
> -  'qom',
>     'replay',
>     'run-state',
>     'sockets',
>     'trace',
> -  'transaction',
> -  'yank',
>   ]
>   if have_system
>     qapi_all_modules += [
>       'acpi',
>       'audio',
>       'qdev',
> +    'machine-target',
> +    'net',
>       'pci',
>       'rdma',
>       'rocker',
> @@ -63,7 +56,14 @@ if have_system
>   endif
>   if have_system or have_tools
>     qapi_all_modules += [
> +    'block',
> +    'block-core',
> +    'block-export',
> +    'char',
> +    'qom',
>       'ui',
> +    'transaction',
> +    'yank',
>     ]
>   endif
>   


