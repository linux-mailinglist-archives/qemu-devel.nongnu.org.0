Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D600C37BC15
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:54:31 +0200 (CEST)
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnRe-0006Iu-Rc
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgnQT-0005YY-Pj
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgnQO-00081I-O0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620820391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RD3CKpXeajvf6yFymGThZc1jBPALTmJVkf5gQvXvZ5c=;
 b=ZXaXbjcaUPIbD92mdCOxpwisCyXZQ6UTj3nNTyw+76ukUiJYLbQ7dMMfXnAZn7OJ1j+wb2
 Eef3wHwNc9VfQBkA2FvYFR2dwKoVpb0kBJHHTtmq59Odp8AOgdDg3YaBC3QbM4xl13GEUh
 IrnPdx8NcBv5H+cqGNkspDTCf6GWm2g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-je57n0eXOee7V2t3DgUrBA-1; Wed, 12 May 2021 07:53:09 -0400
X-MC-Unique: je57n0eXOee7V2t3DgUrBA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g206-20020a1c39d70000b029016ac627fbe9so767428wma.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RD3CKpXeajvf6yFymGThZc1jBPALTmJVkf5gQvXvZ5c=;
 b=on1GQUqGO7zbJ2ho0t6aNyGbe5bIs/6I9BjuHfT1BxuRHbReENA8K0B9WMmkDlRsv+
 Aqkt0w23rxap+tMbt6O/pvOE906/e2DH1leU34vm+xe2rPoqiBd4OVAaIjcZUKYVoE6t
 n0wzqaTU3lM6laOhE/mVg8v8RSTEFaLNCARh9PTznjoq4QknfCAjFNME8jinbL1swY64
 UjZHGyLl4oLqmUEWiTQo+ddGMuV/wzYHWilAJhz6s0NmV+wkHxEZBpWI/DAIKY8RiuhJ
 /T1xTmdAOjbjog/GQnyO7t8zV5+Yqd2sl/s3NF3ANtjyQeaA7mJWjmWthxsue0ipbCRA
 aueA==
X-Gm-Message-State: AOAM531GftXkQ3ul86gRbHM7HpclTyLZvdsrY/KuNJOA6Dd6ywagyfZE
 Zoi9Yl66dpfXhGb8XtqLRYj17soyTRGN2HM9gz9Kz84eDM4dJgzkI5br2NyL7GumchYW1tHY34a
 ZKI2sJuVsRydE8ys=
X-Received: by 2002:adf:df8d:: with SMTP id z13mr1728512wrl.267.1620820388471; 
 Wed, 12 May 2021 04:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVSomf7IXVy5IHaVGaIC36X8xI3cISQ+qlPmVJ+vlRVdOfVvqoYzLujtuZAZ4i+ArdiLdSRg==
X-Received: by 2002:adf:df8d:: with SMTP id z13mr1728481wrl.267.1620820388237; 
 Wed, 12 May 2021 04:53:08 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i3sm34942718wrb.46.2021.05.12.04.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 04:53:07 -0700 (PDT)
Subject: Re: [PULL 8/9] pc-bios/s390-ccw: Allow building with Clang, too
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210510073524.85951-1-thuth@redhat.com>
 <20210510073524.85951-9-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e35749b2-2452-4a6c-2eb3-81a969a2704a@redhat.com>
Date: Wed, 12 May 2021 13:53:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510073524.85951-9-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 9:35 AM, Thomas Huth wrote:
> Clang unfortunately does not support generating code for the z900
> architecture level and starts with the z10 instead. Thus to be able
> to support compiling with Clang, we have to check for the supported
> compiler flags. The disadvantage is of course that the bios image
> will only run with z10 guest CPUs upwards (which is what most people
> use anyway), so just in case let's also emit a warning in that case
> (we will continue to ship firmware images that have been pre-built
> with GCC in future releases, so this should not impact normal users,
> too).
> 
> Message-Id: <20210502174836.838816-5-thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 9 ++++++++-
>  pc-bios/s390-ccw/Makefile | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 4f374b4889..5ebc937746 100755
> --- a/configure
> +++ b/configure
> @@ -5417,9 +5417,16 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
>  fi
>  
>  # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
> +# or -march=z10 (which is the lowest architecture level that Clang supports)
>  if test "$cpu" = "s390x" ; then
>    write_c_skeleton
> -  if compile_prog "-march=z900" ""; then
> +  compile_prog "-march=z900" ""
> +  has_z900=$?
> +  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
> +    if [ $has_z900 != 0 ]; then
> +      echo "WARNING: Your compiler does not support the z900!"
> +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
> +    fi
>      roms="$roms s390-ccw"
>      # SLOF is required for building the s390-ccw firmware on s390x,
>      # since it is using the libnet code from SLOF for network booting.
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index 83fb1afb73..cee9d2c63b 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -34,7 +34,8 @@ QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
>  QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
>  QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
>  QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
> -QEMU_CFLAGS += -msoft-float -march=z900
> +QEMU_CFLAGS += -msoft-float
> +QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
>  QEMU_CFLAGS += -std=gnu99
>  LDFLAGS += -Wl,-pie -nostdlib

This broke the travis-ci  "[s390x] Clang (disable-tcg)" job:
https://travis-ci.org/github/qemu/qemu/jobs/770794417#L1776

Description:	Ubuntu 18.04.4 LTS
Release:	18.04
Codename:	bionic

$ clang --version
clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
Target: s390x-ibm-linux-gnu

  CC      pc-bios/s390-ccw/main.o
clang: warning: optimization flag '-fno-delete-null-pointer-checks' is
not supported [-Wignored-optimization-argument]
clang: warning: argument unused during compilation: '-msoft-float'
[-Wunused-command-line-argument]
/home/travis/build/qemu/qemu/pc-bios/s390-ccw/main.c:284:5: warning: no
previous prototype for function 'main' [-Wmissing-prototypes]
int main(void)
    ^
1 warning generated.
clang: warning: optimization flag '-fno-delete-null-pointer-checks' is
not supported [-Wignored-optimization-argument]

  CC      pc-bios/s390-ccw/jump2ipl.o
/home/travis/build/qemu/qemu/pc-bios/s390-ccw/jump2ipl.c:67:18: error:
invalid operand for instruction
    asm volatile("lghi 1,1\n\t"
                 ^
<inline asm>:1:7: note: instantiated into assembly here
        lghi 1,1
             ^
/home/travis/build/qemu/qemu/pc-bios/s390-ccw/jump2ipl.c:67:29: error:
invalid operand for instruction
    asm volatile("lghi 1,1\n\t"
                            ^
<inline asm>:2:7: note: instantiated into assembly here
        diag 1,1,0x308
             ^
2 errors generated.
Makefile:20: recipe for target 'jump2ipl.o' failed
make[1]: *** [jump2ipl.o] Error 1


