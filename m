Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB6B5FC41A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:07:20 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiZa2-00035y-Oa
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oiZX7-0007AT-SO
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:04:18 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oiZX5-0002Vi-Nh
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:04:17 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso19073213fac.4
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XcNO83yOXqYCrjZ1UJribkqppYeaEYyDUyuJzbPXjXY=;
 b=jIcMFAppPYM49CSC02MOc0+ANsCK/50iXJgZOjhAUgmt6xZTVlgkEJtskwNDA0Es9x
 3Xi2PGBlmrmqkzCEGH7cPZ34umvnoDhutkFjmM8NAOzIskKWl0m/EYGBZqdLUbKWFfyc
 ENSikRStV6EoqaY50W7w+hVosDCiyVNw9aOweUqer/CH6kQbaxVVZufeHva5ZrAUx4Rw
 Er7a+AijXiIjyvK2VTtedgjV7OF+Uid08qlA0BWuXLGcGbmVwe7HSdoWJLUU4hJumaNe
 bXHMn8lNhd3bWAI/QQYXv34gLLXXShOWUlqCG3B/baCTyIe/s1TlYoIutYXxJBDKP9l0
 CGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XcNO83yOXqYCrjZ1UJribkqppYeaEYyDUyuJzbPXjXY=;
 b=zE4lCKBF3iMBizyVQaUEnOXyNZOos1S+w/YeTxaTX+Qq3PcnT7+Xdsrj2a9UMlmFV+
 tyCWTP4l1qusdQOEg86V4/jkX5+3dZ4SbBqUm5Jgc8tF9w4MBGWE/Nd0Z0M4fBXXrkER
 20EnKKOT7L5cky0uU9CDSW+TPnlI5t5RmK6z+CtV2qIKk93f43agQWz7XQ+sUh0ypxTJ
 SJifJDQOKJbgfYqSfZvhagwYC2hwi31s530oJhUKJ/+yAWJIRNK9IqB4P5DmJzRJZ0Ct
 G0/QORBhBSmTi52xy5OCwgijwnPO3Zh2/yXGIgMWcs1C/K2y+PF3T93Nq1mj2bFPMvdv
 zmTg==
X-Gm-Message-State: ACrzQf3A4PkAA7LaMJ7usHQrKY5zL2VPfCUnTxQiFJ2iabdL2W2UryPr
 c7N8WADrvanCwp7kJCJL2so=
X-Google-Smtp-Source: AMsMyM65nCOixOURzcZrlNm66Dftrb8zgco7pQ2QFzJqjxjtvgE1AxgLIpgZ4aPbwBRCBqMWLMmGtg==
X-Received: by 2002:a05:6870:2190:b0:132:c6da:7b37 with SMTP id
 l16-20020a056870219000b00132c6da7b37mr2106265oae.123.1665572654347; 
 Wed, 12 Oct 2022 04:04:14 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.121.133])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056870b48e00b00132784a3a1fsm1036630oap.46.2022.10.12.04.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 04:04:13 -0700 (PDT)
Message-ID: <43330b01-01bb-e6db-1fb8-e737e1f92759@gmail.com>
Date: Wed, 12 Oct 2022 08:04:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi, Stefan"
 <stefanha@redhat.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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



On 10/12/22 03:46, Paolo Bonzini wrote:
> 
> 
> Il mar 11 ott 2022, 21:29 Alex Bennée <alex.bennee@linaro.org <mailto:alex.bennee@linaro.org>> ha scritto:
> 
>     This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
> 
>     Unconditionally building all the bios for all arches was a little too
>     far too fast.
> 
> 
> I would like to understand the issue better, because chances are that it is preexisting and applies to the TCG tests as well.
> 
> Daniel, does building the TCG tests work for you? If not, I think we should just disable containers by default.


'make check-tcg' never worked in this particular Xeon host I use. I never
had the curiosity to find out why because I have access to a Power9 host
that runs 'make check-tcg'.

Using this revert patch on top of master in this Xeon box makes 'make -j'
successful and 'make check-tcg' fails with the following error:


$ make -j
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
[1/24] Generating qemu-version.h with a custom command (wrapped by meson to capture output)

$ make check-tcg
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
   BUILD   debian-powerpc-test-cross
   BUILD   ppc64-linux-user guest-tests
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
subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--label', 'com.qemu.instance.uuid=cf15761c98884d0a9b4e37f631ba593f', '--userns=keep-id', '-u', '1005', '-w', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user', '-v', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:rw', '-v', '/home/danielhb/qemu:/home/danielhb/qemu:ro,z', 'qemu/debian-powerpc-test-cross', 'powerpc64-linux-gnu-gcc-10', '-Wall', '-Werror', '-O0', '-g', '-fno-strict-aliasing', '-m64', '-mbig-endian', '/home/danielhb/qemu/tests/tcg/multiarch/float_convd.c', '/home/danielhb/qemu/tests/tcg/multiarch/libs/float_helpers.c', '-o', 'float_convd', '-static', '-lm']' returned non-zero exit status 127.
filter=--filter=label=com.qemu.instance.uuid=cf15761c98884d0a9b4e37f631ba593f
make[1]: *** [/home/danielhb/qemu/tests/tcg/multiarch/Makefile.target:26: float_convd] Error 1
make: *** [/home/danielhb/qemu/tests/Makefile.include:50: build-tcg-tests-ppc64-linux-user] Error 2


This is very similar to the error message I get when running 'make -j' on mainline
without this revert.

So yeah, I guess we can say this is a preexisting condition that I always saw with
'make check-tcg' in this particular host, and 730fe750fba just made it manifest when
running a plain 'make'.


Thanks,


Daniel


> 
> 
> 
>     Signed-off-by: Alex Bennée <alex.bennee@linaro.org <mailto:alex.bennee@linaro.org>>
>     Cc: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
>     Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto:danielhb413@gmail.com>>
>     Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto:danielhb413@gmail.com>>
>     Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org <mailto:20221011113417.794841-4-alex.bennee@linaro.org>>
> 
>     diff --git a/configure b/configure
>     index baa69189f0..45ee6f4eb3 100755
>     --- a/configure
>     +++ b/configure
>     @@ -2121,7 +2121,7 @@ probe_target_compiler() {
>           target_ranlib=
>           target_strip=
>         fi
>     -  test -n "$target_cc" || test -n "$container_image"
>     +  test -n "$target_cc"
>       }
> 
>       write_target_makefile() {
>     @@ -2268,7 +2268,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
>           config_mak=pc-bios/optionrom/config.mak
>           echo "# Automatically generated by configure - do not modify" > $config_mak
>           echo "TOPSRC_DIR=$source_path" >> $config_mak
>     -    write_target_makefile pc-bios/optionrom/all >> $config_mak
>     +    write_target_makefile >> $config_mak
>       fi
> 
>       if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
>     @@ -2276,31 +2276,25 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
>           config_mak=pc-bios/vof/config.mak
>           echo "# Automatically generated by configure - do not modify" > $config_mak
>           echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
>     -    write_target_makefile pc-bios/vof/all >> $config_mak
>     +    write_target_makefile >> $config_mak
>       fi
> 
>       # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
>       # (which is the lowest architecture level that Clang supports)
>       if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
>     -  got_cross_cc=no
>     -  if test -n "$target_cc"; then
>     -    write_c_skeleton
>     -    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
>     -    has_z900=$?
>     -    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>     -      if [ $has_z900 != 0 ]; then
>     -        echo "WARNING: Your compiler does not support the z900!"
>     -        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>     -      fi
>     -      got_cross_cc=yes
>     +  write_c_skeleton
>     +  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
>     +  has_z900=$?
>     +  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>     +    if [ $has_z900 != 0 ]; then
>     +      echo "WARNING: Your compiler does not support the z900!"
>     +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>           fi
>     -  fi
>     -  if test "$got_cross_cc" = yes || test -n "$container_image"; then
>           roms="$roms pc-bios/s390-ccw"
>           config_mak=pc-bios/s390-ccw/config-host.mak
>           echo "# Automatically generated by configure - do not modify" > $config_mak
>           echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
>     -    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
>     +    write_target_makefile >> $config_mak
>           # SLOF is required for building the s390-ccw firmware on s390x,
>           # since it is using the libnet code from SLOF for network booting.
>           git_submodules="${git_submodules} roms/SLOF"
>     @@ -2488,7 +2482,7 @@ for target in $target_list; do
>             ;;
>         esac
> 
>     -  if probe_target_compiler $target; then
>     +  if probe_target_compiler $target || test -n "$container_image"; then
>             test -n "$container_image" && build_static=y
>             mkdir -p "tests/tcg/$target"
>             config_target_mak=tests/tcg/$target/config-target.mak
>     -- 
>     2.34.1
> 

