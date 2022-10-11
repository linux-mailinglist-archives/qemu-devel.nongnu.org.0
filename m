Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DF55FBAA7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 20:44:05 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiKEW-000897-3t
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 14:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oiK9C-0004Uo-Lp
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 14:38:34 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oiK9A-0006cE-OA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 14:38:34 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-136b5dd6655so5125882fac.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cmgic9LPeXmhOxXgnDPIi4MkkNfS9Wjx6pPuS2Du/NM=;
 b=a2B4csWDpekAUC5ItRzCjm0mnHeAmC7Mp1ZtduR3g6In+JvWNu+D9wIKQz2JddSDda
 9oQL+xuyTmb+jhQjK1krR5H7xiRnwNLKfEWzOJL0X5o4SBD5GAzH5lWR7SSRNEY6XIPW
 9wadBJxDtqdzMP5pAvmcb33T9eXHCuQ4q7zdjypo/74gvlF75vi7/aH7yTQd4W8qCIZX
 cZzH2DkxSM6of9amxsoUgVJZzPt9pAStEnr0KdgbV7MRzZpZv6ncZmgWPX5D8lbLeaTr
 1DO5H1YotFDPcm0AsQ0RxD1RJV76X7jSbXj6cnceSNFfP/wWSy29oDmXmmcYpJS4bh3X
 Bv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cmgic9LPeXmhOxXgnDPIi4MkkNfS9Wjx6pPuS2Du/NM=;
 b=PWhuw2qbiw8c48n4RkwAJXwlecIny5KQsYl1Ev+5bVEIxCzXDiwbQLaOQYAH7vDUDq
 SL6TDH6rbLszjOTnyegURxXSaAADzyTbFsg7H9MbOTtkXq/7779/eu/3NwgWCjusCtOC
 ItC4RdI1HR5jkjMJHowzzJI7wa3lWOSVFp6deDlmTziEV01DOTKmbMasw4KlUk4d0NYg
 +KRis+BXcKx+SJGpapZSd3GbsIvgYuPeqv1ugiRYdgGkWw6DhUgbVvkddNuE4fmzMc3Q
 jhVAIsNImJYwujOcjLyIo96qOcqDPz0iE1UBxz+6gcoPRoW5XZHPePbAi6A2qYH2xF+t
 wh1g==
X-Gm-Message-State: ACrzQf2DIHew7nw60abk+abBmKa6nx0O42hlXxc2fYrcHiih7n3Fzmq/
 V3tg9M9udHI6aZZmmeyPV+M=
X-Google-Smtp-Source: AMsMyM5mEJaTkDJKxudYpY+iT8MZhS6eMIGUUCHOMvnDldXeKTyOdJct6RFmEJmp4Ma6SGXqftWzsQ==
X-Received: by 2002:a05:6870:45a0:b0:131:9207:7d95 with SMTP id
 y32-20020a05687045a000b0013192077d95mr326724oao.148.1665513511002; 
 Tue, 11 Oct 2022 11:38:31 -0700 (PDT)
Received: from [192.168.10.102] ([179.247.162.105])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a9d30c2000000b006619f9a0c73sm2439044otg.1.2022.10.11.11.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 11:38:30 -0700 (PDT)
Message-ID: <38bf39f9-4c67-eb20-516d-ecd613c1caf8@gmail.com>
Date: Tue, 11 Oct 2022 15:38:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1 3/4] Revert "configure: build ROMs with container-based
 cross compilers"
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221011113417.794841-1-alex.bennee@linaro.org>
 <20221011113417.794841-4-alex.bennee@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221011113417.794841-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.934,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/11/22 08:34, Alex Bennée wrote:
> This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
> 
> Unconditionally building all the bios for all arches was a little too
> far too fast.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---

Thanks for this patch. I was having problems building the ppc64 targets in
an x86 Intel Xeon host today. 'make -j' was being spammed with errors like
this:

make[1]: *** [/home/danielhb/qemu/pc-bios/s390-ccw/netboot.mak:32: strstr.o] Error 1
make[1]: *** [/home/danielhb/qemu/pc-bios/s390-ccw/netboot.mak:44: sbrk.o] Error 1
make[1]: *** [Makefile:24: virtio.o] Error 1
Traceback (most recent call last):
   File "/home/danielhb/qemu/tests/docker/docker.py", line 683, in <module>
     sys.exit(main())
   File "/home/danielhb/qemu/tests/docker/docker.py", line 679, in main
     return args.cmdobj.run(args, argv)
   File "/home/danielhb/qemu/tests/docker/docker.py", line 657, in run
     return Docker().run(cmd, False, quiet=args.quiet,
   File "/home/danielhb/qemu/tests/docker/docker.py", line 370, in run
     ret = self._do_check(["run", "--rm", "--label",
   File "/home/danielhb/qemu/tests/docker/docker.py", line 247, in _do_check
     return subprocess.check_call(self._command + cmd, **kwargs)
   File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
     raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--label', 'com.qemu.instance.uuid=7782aa219ff64bc89847adf489cf49c3', '--userns=keep-id', '-u', '1005', '-w', '/home/danielhb/qemu/build/pc-bios/s390-ccw', '-v', '/home/danielhb/qemu/build/pc-bios/s390-ccw:/home/danielhb/qemu/build/pc-bios/s390-ccw:rw', '-v', '/home/danielhb/qemu:/home/danielhb/qemu:ro,z', 'qemu/debian-s390x-cross', 's390x-linux-gnu-gcc', '-Wall', '-ffreestanding', '-fno-delete-null-pointer-checks', '-fno-common', '-fPIE', '-fwrapv', '-fno-strict-aliasing', '-fno-asynchronous-unwind-tables', '-msoft-float', '-std=gnu99', '-march=z10', '-O2', '-g', '-nostdinc', '-I/home/danielhb/qemu/pc-bios/s390-ccw/../../roms/SLOF/lib/libc/include', '-I/home/danielhb/qemu/pc-bios/s390-ccw/../../roms/SLOF/lib/libnet', '-MMD', '-MP', '-MT', 'rand.o', '-MF', 'rand.d', '-c', '-o', 'rand.o', '/home/danielhb/qemu/pc-bios/s390-ccw/../../roms/SLOF/lib/libc/stdlib/rand.c']' returned non-zero exit status 127.
filter=--filter=label=com.qemu.instance.uuid=7782aa219ff64bc89847adf489cf49c3
make[1]: *** [/home/danielhb/qemu/pc-bios/s390-ccw/netboot.mak:41: fprintf.o] Error 1
make[1]: *** [/home/danielhb/qemu/pc-bios/s390-ccw/netboot.mak:32: strncasecmp.o] Error 1
make[1]: *** [/home/danielhb/qemu/pc-bios/s390-ccw/netboot.mak:26: isdigit.o] Error 1
make[1]: *** [/home/danielhb/qemu/pc-bios/s390-ccw/netboot.mak:36: rand.o] Error 1
make: *** [Makefile:195: pc-bios/s390-ccw/all] Error 2


I don't see this error in my development box though. I was going to check whether I
was missing packages from one system to the other.


But this patch makes 'make -j' functional again for me.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   configure | 30 ++++++++++++------------------
>   1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/configure b/configure
> index baa69189f0..45ee6f4eb3 100755
> --- a/configure
> +++ b/configure
> @@ -2121,7 +2121,7 @@ probe_target_compiler() {
>       target_ranlib=
>       target_strip=
>     fi
> -  test -n "$target_cc" || test -n "$container_image"
> +  test -n "$target_cc"
>   }
>   
>   write_target_makefile() {
> @@ -2268,7 +2268,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
>       config_mak=pc-bios/optionrom/config.mak
>       echo "# Automatically generated by configure - do not modify" > $config_mak
>       echo "TOPSRC_DIR=$source_path" >> $config_mak
> -    write_target_makefile pc-bios/optionrom/all >> $config_mak
> +    write_target_makefile >> $config_mak
>   fi
>   
>   if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
> @@ -2276,31 +2276,25 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
>       config_mak=pc-bios/vof/config.mak
>       echo "# Automatically generated by configure - do not modify" > $config_mak
>       echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
> -    write_target_makefile pc-bios/vof/all >> $config_mak
> +    write_target_makefile >> $config_mak
>   fi
>   
>   # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
>   # (which is the lowest architecture level that Clang supports)
>   if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
> -  got_cross_cc=no
> -  if test -n "$target_cc"; then
> -    write_c_skeleton
> -    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
> -    has_z900=$?
> -    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> -      if [ $has_z900 != 0 ]; then
> -        echo "WARNING: Your compiler does not support the z900!"
> -        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
> -      fi
> -      got_cross_cc=yes
> +  write_c_skeleton
> +  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
> +  has_z900=$?
> +  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> +    if [ $has_z900 != 0 ]; then
> +      echo "WARNING: Your compiler does not support the z900!"
> +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>       fi
> -  fi
> -  if test "$got_cross_cc" = yes || test -n "$container_image"; then
>       roms="$roms pc-bios/s390-ccw"
>       config_mak=pc-bios/s390-ccw/config-host.mak
>       echo "# Automatically generated by configure - do not modify" > $config_mak
>       echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
> -    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
> +    write_target_makefile >> $config_mak
>       # SLOF is required for building the s390-ccw firmware on s390x,
>       # since it is using the libnet code from SLOF for network booting.
>       git_submodules="${git_submodules} roms/SLOF"
> @@ -2488,7 +2482,7 @@ for target in $target_list; do
>         ;;
>     esac
>   
> -  if probe_target_compiler $target; then
> +  if probe_target_compiler $target || test -n "$container_image"; then
>         test -n "$container_image" && build_static=y
>         mkdir -p "tests/tcg/$target"
>         config_target_mak=tests/tcg/$target/config-target.mak

