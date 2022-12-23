Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44B6552B0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 17:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8klv-00008o-2Y; Fri, 23 Dec 2022 11:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p8klj-000089-RN; Fri, 23 Dec 2022 11:19:39 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p8klh-0004vO-5Y; Fri, 23 Dec 2022 11:19:34 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so6406862fac.2; 
 Fri, 23 Dec 2022 08:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59hKZQruJ/encUBpsoB5107KL+4txddRt6dYKWC1pnU=;
 b=cHrqkjRf4v9mMn0/UxSCIMe0bQPWVntOn8QJj8KZTzk25RUkzRXzE9D2fhCnP+ySMk
 AFLwukWitnE7UjQFGvqjFvhrE2fUBb7GPYrY0OlWp7DOsJjMumGFHyGKZpd+yrOZrsLs
 I2HQC0cknf+FAD8oWbZ/WcDVTLe+7lfubHdN9NbmG4ucvJQux3YUd+C5yVRGClCtwB7L
 4LMIZTVaIY7/F372ng++axIzQFdU/QdayOTWEnyf2NO/JyoEzy9i1mMSxIu9YLfiImGp
 mqQPWKU5FmLmcAvWGA6v5ZVww5j70ZWPcfITmWgnGeguLy+lmBULMJMjzbhJ1kv5PS/d
 FfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59hKZQruJ/encUBpsoB5107KL+4txddRt6dYKWC1pnU=;
 b=QoES9jK1OhLJQwhXLPSiKYVaxFogUB8vODC/KITETdvBIW7lYDqZjyHSaNlRtgKHvd
 ej+PELuKCD2luQ0L9Z24DKQLbYLT7W0cBN/JfbXJJikol3rjbk47bDt4lUeT9gEpfx4y
 uBZu9KzcHbPh8MwPPjxfcl6IlmtkKV2PbIocpy4enXCXHYV8ClUrfP8ggT9bCDJIZywb
 c+2q1G+ODD0687KhTgHIEsiPFyxhOZR1JnLNPNabLqK1gKbLnsMM3vRH01qV/SkweMSo
 a0+mSMXRPKWQMgU9B08M9+D6a1Z0AKOjqMYZY7hHjJ62iLU14aRNhm81NlRhlFMZ2KM0
 Cneg==
X-Gm-Message-State: AFqh2krowo9S+waiOk9IWTjlnt65rhwcuyz7IY1pjELnTSPpTBwLzW5p
 iEU2wPnjXSQFGtm60RPhNGY=
X-Google-Smtp-Source: AMrXdXsi9NftWpG2BLs/TKNI55u4RX1ChIz6gRc3QgxNDjtJ+1YHGBH1a0iz+tX4r3tIWU84Q+VuPA==
X-Received: by 2002:a05:6871:4698:b0:14c:22f8:431c with SMTP id
 ni24-20020a056871469800b0014c22f8431cmr4004804oab.4.1671812368472; 
 Fri, 23 Dec 2022 08:19:28 -0800 (PST)
Received: from [192.168.68.107] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 bh28-20020a056808181c00b00359a9663053sm1671968oib.4.2022.12.23.08.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 08:19:28 -0800 (PST)
Message-ID: <9fa6299b-a4ae-9a02-3e46-14ddf5bafa0b@gmail.com>
Date: Fri, 23 Dec 2022 13:19:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] tests/migration: add sysprof-capture-4 as dependency
 for stress binary
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 farosas@suse.de
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
 <20220809002451.91541-2-muriloo@linux.ibm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220809002451.91541-2-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Until it's upstream or rejected, no patch will be left behind.


I wasn't able to compile tests/migration/stress at all without this patch,
regardless of having sysprof-4 libraries installed in the host.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Juan/Dr.David, if  you don't mind I'll take this via ppc-next since
there's a PPC only change that depends on it.



Daniel


On 8/8/22 21:24, Murilo Opsfelder Araujo wrote:
> `make tests/migration/stress` fails with:
> 
>      FAILED: tests/migration/stress
>      cc -m64 -mlittle-endian  -o tests/migration/stress tests/migration/stress.p/stress.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -fstack-protector-strong -static -pthread -Wl,--start-group -lgthread-2.0 -lglib-2.0 -Wl,--end-group
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gutils.c.o): in function `.annobin_gutils.c':
>      (.text+0x3b4): warning: Using 'getpwuid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
>      /usr/bin/ld: (.text+0x178): warning: Using 'getpwnam_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
>      /usr/bin/ld: (.text+0x1bc): warning: Using 'getpwuid_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gthread.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `.annobin_gtrace.c':
>      (.text+0x24): undefined reference to `sysprof_collector_mark_vprintf'
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_define_int64_counter':
>      (.text+0x8c): undefined reference to `sysprof_collector_request_counters'
>      /usr/bin/ld: (.text+0x108): undefined reference to `sysprof_collector_define_counters'
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_set_int64_counter':
>      (.text+0x23c): undefined reference to `sysprof_collector_set_counters'
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gspawn.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
>      /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gmain.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
>      collect2: error: ld returned 1 exit status
>      ninja: build stopped: subcommand failed.
>      make: *** [Makefile:162: run-ninja] Error 1
> 
> Add sysprof-capture-4 as dependency for stress binary.
> 
> Tested on:
>    - CentOS Stream 9 ppc64le
>    - Fedora 36 x86_64
> 
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> ---
>   tests/migration/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/migration/meson.build b/tests/migration/meson.build
> index f215ee7d3a..3fd87f7849 100644
> --- a/tests/migration/meson.build
> +++ b/tests/migration/meson.build
> @@ -1,7 +1,9 @@
> +sysprof = dependency('sysprof-capture-4')
> +
>   stress = executable(
>     'stress',
>     files('stress.c'),
> -  dependencies: [glib],
> +  dependencies: [glib, sysprof],
>     link_args: ['-static'],
>     build_by_default: false,
>   )

