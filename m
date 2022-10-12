Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB25FC663
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 15:26:47 +0200 (CEST)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oibkz-0006sM-NX
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 09:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oibj3-0004M1-9d
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:24:45 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:43902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oibj1-00021C-62
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:24:44 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1324e7a1284so19428241fac.10
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N2qC0amOFP+3YUXW+CQXrKmAkRnXuNoA0s569uza2b8=;
 b=Cxjm1b+T8AEEqTO0fswBbY5wFIqNpG2171id2zu/aPuQaDOE/MaGgWcrx+dTkUz/H1
 zgDi/vu/dgfYeX3U3CKpfpHePypQeaEGOsGWqL+Q+u2jS67bJTUHChctnB5xhA8dJwiE
 6aqOufyirNHQgLx4OXRX2/bdynnKUHAB+nd593MwwPLM8xbyCexFCagp0VyQHY8OTtat
 s8N7QENH03CLpA1BRKzTyWGE3MNjVaDBR0s7ycZaKle6I1emaqS3VGDqyyMOgE19m20o
 6RrHEPOlRmylEqqnpioOVQH8uTMVojpaoaX4SO6HNIZNuVO+LUgEVt0LU3A0wrTDZNKf
 6IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2qC0amOFP+3YUXW+CQXrKmAkRnXuNoA0s569uza2b8=;
 b=ETRNcsEcLd/d5npK7++m02mLx4VLE4am1milCKuLN9VaaEL335SmluReJgKI8TOeSX
 chyUfndCL5PPJambcFBjwMxoe3+mPMTfheel9PnSdduKG+r156Ih9l2edTcHcGMZDgSX
 M0BB2egt3cIa0xcso4uorDthSykTUOa8S+evu6gZ5AaOGRpZEjvpRwwlvi3ZGk+6cxpd
 ilgfrMtzduHzkjobwzo6VABH0Au1pHl3JzaQxzZz4D6li9+VfVv1o4Oerh6FhOfF+b/1
 30/dIHtJN/zrT6zRCgg4C6EFqCBoGziJvPHBcQQ1xXIjt/0//PVhaE7ivn/V0ZE4U7kb
 hkgQ==
X-Gm-Message-State: ACrzQf0UPZZNZlp3Fnx3qYOBbOLFZG94TYQFYpDTDMZkXxB11B1N7ZJ4
 KIqHaDqoRL0LBXU5vUnxXvQ=
X-Google-Smtp-Source: AMsMyM5fTrIoL1rZgbGi/CYuXKUF5gMFSnfiR9BcMv3YczPIUztQqNi+Tu+skl4BH2WznEcchHwwqw==
X-Received: by 2002:a05:6870:3282:b0:132:8af2:2871 with SMTP id
 q2-20020a056870328200b001328af22871mr2546525oac.293.1665581081960; 
 Wed, 12 Oct 2022 06:24:41 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.121.133])
 by smtp.gmail.com with ESMTPSA id
 j25-20020a056808057900b0034d14c6ce3dsm3908245oig.16.2022.10.12.06.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 06:24:41 -0700 (PDT)
Message-ID: <469324d0-64d2-e794-8a9c-53afb7ec795f@gmail.com>
Date: Wed, 12 Oct 2022 10:24:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
 <43330b01-01bb-e6db-1fb8-e737e1f92759@gmail.com> <87czaxqlvd.fsf@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87czaxqlvd.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.528,
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


On 10/12/22 09:13, Alex Bennée wrote:
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 10/12/22 03:46, Paolo Bonzini wrote:
>>> Il mar 11 ott 2022, 21:29 Alex Bennée <alex.bennee@linaro.org
>>> <mailto:alex.bennee@linaro.org>> ha scritto:
>>>      This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
>>>      Unconditionally building all the bios for all arches was a
>>> little too
>>>      far too fast.
>>> I would like to understand the issue better, because chances are
>>> that it is preexisting and applies to the TCG tests as well.
>>> Daniel, does building the TCG tests work for you? If not, I think we
>>> should just disable containers by default.
>>
>>
>> 'make check-tcg' never worked in this particular Xeon host I use. I never
>> had the curiosity to find out why because I have access to a Power9 host
>> that runs 'make check-tcg'.
>>
>> Using this revert patch on top of master in this Xeon box makes 'make -j'
>> successful and 'make check-tcg' fails with the following error:
>>
>>
>> $ make -j
>>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
>> [1/24] Generating qemu-version.h with a custom command (wrapped by meson to capture output)
>>
>> $ make check-tcg
>>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
>>    BUILD   debian-powerpc-test-cross
>>    BUILD   ppc64-linux-user guest-tests
>> Traceback (most recent call last):
>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 683, in <module>
>>      sys.exit(main())
>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 679, in main
>>      return args.cmdobj.run(args, argv)
>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 657, in run
>>      return Docker().run(cmd, False, quiet=args.quiet,
>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 370, in run
>>      ret = self._do_check(["run", "--rm", "--label",
>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 247, in _do_check
>>      return subprocess.check_call(self._command + cmd, **kwargs)
>>    File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
>>      raise CalledProcessError(retcode, cmd)
>> subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--label', 'com.qemu.instance.uuid=cf15761c98884d0a9b4e37f631ba593f', '--userns=keep-id', '-u', '1005', '-w', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user', '-v', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:rw', '-v', '/home/danielhb/qemu:/home/danielhb/qemu:ro,z', 'qemu/debian-powerpc-test-cross', 'powerpc64-linux-gnu-gcc-10', '-Wall', '-Werror', '-O0', '-g', '-fno-strict-aliasing', '-m64', '-mbig-endian', '/home/danielhb/qemu/tests/tcg/multiarch/float_convd.c', '/home/danielhb/qemu/tests/tcg/multiarch/libs/float_helpers.c', '-o', 'float_convd', '-static', '-lm']' returned non-zero exit status 127.
>> filter=--filter=label=com.qemu.instance.uuid=cf15761c98884d0a9b4e37f631ba593f
>> make[1]: *** [/home/danielhb/qemu/tests/tcg/multiarch/Makefile.target:26: float_convd] Error 1
>> make: *** [/home/danielhb/qemu/tests/Makefile.include:50: build-tcg-tests-ppc64-linux-user] Error 2
>>
>>
>> This is very similar to the error message I get when running 'make -j' on mainline
>> without this revert.
>>
>> So yeah, I guess we can say this is a preexisting condition that I always saw with
>> 'make check-tcg' in this particular host, and 730fe750fba just made it manifest when
>> running a plain 'make'.
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>      Signed-off-by: Alex Bennée <alex.bennee@linaro.org
>>> <mailto:alex.bennee@linaro.org>>
>>>      Cc: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
>>>      Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto:danielhb413@gmail.com>>
>>>      Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto:danielhb413@gmail.com>>
>>>      Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org <mailto:20221011113417.794841-4-alex.bennee@linaro.org>>
>>>      diff --git a/configure b/configure
>>>      index baa69189f0..45ee6f4eb3 100755
>>>      --- a/configure
>>>      +++ b/configure
>>>      @@ -2121,7 +2121,7 @@ probe_target_compiler() {
>>>            target_ranlib=
>>>            target_strip=
>>>          fi
>>>      -  test -n "$target_cc" || test -n "$container_image"
>>>      +  test -n "$target_cc"
>>>        }
>>>        write_target_makefile() {
>>>      @@ -2268,7 +2268,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
>>>            config_mak=pc-bios/optionrom/config.mak
>>>            echo "# Automatically generated by configure - do not modify" > $config_mak
>>>            echo "TOPSRC_DIR=$source_path" >> $config_mak
>>>      -    write_target_makefile pc-bios/optionrom/all >> $config_mak
>>>      +    write_target_makefile >> $config_mak
>>>        fi
>>>        if test "$softmmu" = yes && probe_target_compiler ppc-softmmu;
>>> then
>>>      @@ -2276,31 +2276,25 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
>>>            config_mak=pc-bios/vof/config.mak
>>>            echo "# Automatically generated by configure - do not modify" > $config_mak
>>>            echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
>>>      -    write_target_makefile pc-bios/vof/all >> $config_mak
>>>      +    write_target_makefile >> $config_mak
>>>        fi
>>>        # Only build s390-ccw bios if the compiler has -march=z900 or
>>> -march=z10
>>>        # (which is the lowest architecture level that Clang supports)
>>>        if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
>>>      -  got_cross_cc=no
>>>      -  if test -n "$target_cc"; then
>>>      -    write_c_skeleton
>>>      -    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
>>>      -    has_z900=$?
>>>      -    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>>>      -      if [ $has_z900 != 0 ]; then
>>>      -        echo "WARNING: Your compiler does not support the z900!"
>>>      -        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>>>      -      fi
>>>      -      got_cross_cc=yes
>>>      +  write_c_skeleton
>>>      +  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
>>>      +  has_z900=$?
>>>      +  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>>>      +    if [ $has_z900 != 0 ]; then
>>>      +      echo "WARNING: Your compiler does not support the z900!"
>>>      +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>>>            fi
>>>      -  fi
>>>      -  if test "$got_cross_cc" = yes || test -n "$container_image"; then
>>>            roms="$roms pc-bios/s390-ccw"
>>>            config_mak=pc-bios/s390-ccw/config-host.mak
>>>            echo "# Automatically generated by configure - do not modify" > $config_mak
>>>            echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
>>>      -    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
>>>      +    write_target_makefile >> $config_mak
>>>            # SLOF is required for building the s390-ccw firmware on s390x,
>>>            # since it is using the libnet code from SLOF for network booting.
>>>            git_submodules="${git_submodules} roms/SLOF"
>>>      @@ -2488,7 +2482,7 @@ for target in $target_list; do
>>>              ;;
>>>          esac
>>>      -  if probe_target_compiler $target; then
>>>      +  if probe_target_compiler $target || test -n "$container_image"; then
>>>              test -n "$container_image" && build_static=y
>>>              mkdir -p "tests/tcg/$target"
>>>              config_target_mak=tests/tcg/$target/config-target.mak
>>>      --     2.34.1
>>>
> 
> Can you check what ENGINE is in your config-host.mak? If no container
> engine is defined we should be gating against running docker.

Yeah. Running the case I mentioned above (revert is applied, 'make check-tcg'
fails):

[danielhb@kal1 build]$ grep ENGINE config-host.mak
ENGINE=podman


And with current master where 'make' is failing:

[danielhb@kal1 build]$ grep ENGINE config-host.mak
ENGINE=podman


podman version:

$ podman --version
podman version 4.0.2



Daniel

> 

