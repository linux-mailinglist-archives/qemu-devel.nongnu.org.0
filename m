Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3348C5E6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:24:35 +0100 (CET)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eYE-0006OW-HP
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7dxV-00011U-Jy
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:46:39 -0500
Received: from [2a00:1450:4864:20::42d] (port=46614
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7dxT-0000mR-U9
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:46:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so4273413wrb.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SOZlpkdHugrqqGDK5EyM9PNrSqKRxg4YklKVwQF+XQA=;
 b=g1WiCjACVH4ZN+S3suV+w8q+3QxRSMPvEPT3xweknXrKOorLGc9NpRIU4UZ+bLwKkX
 wSBm0LzfaFKSqeQYgt8vkuybUxOGmkwzmEB+aNMRH2v7zzsqpSzG4XmyxweSlSEvGKzN
 /9w4q1MYX5RSKEnXfdOmdKsEmOZM++tB/JWCI6rgXeqn0H99uJKesXjVHcWAFzFIjh9h
 zFaQng2apF9KwFNtphtXDUwm5yb6UUb8mNi8/sGjlwtkk0ALWKSfg11MZt4I4pzPqEj8
 MyJzlDveMQuwqikla9mFPBmen573WqK6pdhtvwL9LGVerOYQbKuoQo9TWtA4X7761ONH
 8jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SOZlpkdHugrqqGDK5EyM9PNrSqKRxg4YklKVwQF+XQA=;
 b=2ie1ASiuVchHYJF/a+Id6KKX6w2aRYgTZNS0cr4bwAoBbHvqJc6sp2UzdaSRV82TH8
 DrlhXO8EMUH96MaWetprsAx6bZ6pj9omAWoMD6lYI9bcYAEHZTReycUzV/3ajnsH7NYA
 bnCty8lZBFgeSb6pG97zltayHocUQQqHy4EwVi+Q0Dgi1NFz9TJw/CqLV1ahv8fboNEP
 yNrkk977+mW1XuPuturN65u9soIIn+eFTyiVXDkW9xGr5hPNHYY17JR+2Fh3SpePIEn5
 yP8AjVPqkBwQMcJLjbDXeQsp3cyBghTZDUc/K8Huuy2b0EEbeDEBAiZp3Y1PK3kSnqyU
 r94A==
X-Gm-Message-State: AOAM533yCXQiKs5prlxl3pr4KtyCYxls3sMGXqVOxyJR1HBxghIZljNb
 ff8mGKavBcnau7ClXacEsHE=
X-Google-Smtp-Source: ABdhPJxAOULNu9ezer1mEJ26LPyQ/lS6w+xZoEgeCy1aJMSLbvcq8H8TUuvQ+QYlzV2FxNnfQH3BEg==
X-Received: by 2002:adf:da48:: with SMTP id r8mr8206604wrl.710.1641995193600; 
 Wed, 12 Jan 2022 05:46:33 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c12sm12134252wrr.7.2022.01.12.05.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:46:33 -0800 (PST)
Message-ID: <7da4d428-9b9e-e4ee-39af-48a8223df8e6@amsat.org>
Date: Wed, 12 Jan 2022 14:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 1/7] configure: Allow passing extra Objective C
 compiler flags
Content-Language: en-US
To: Roman Bolshakov <roman@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-2-f4bug@amsat.org> <Yd27fVx1iHyvA9ng@roolebo.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <Yd27fVx1iHyvA9ng@roolebo.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Paolo who I forgot to Cc.

On 1/11/22 18:16, Roman Bolshakov wrote:
> On Mon, Jan 10, 2022 at 02:09:55PM +0100, Philippe Mathieu-Daudé wrote:
>> We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
>> variables, or via configure --extra-cflags / --extra-cxxflags /
>> --extra-ldflags options. Provide similar behavior for Objective C:
>> use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  configure   | 8 ++++++++
>>  meson.build | 5 +++++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 0c57a063c66..adb42d8beb1 100755
>> --- a/configure
>> +++ b/configure
>> @@ -288,6 +288,7 @@ done
>>  
>>  EXTRA_CFLAGS=""
>>  EXTRA_CXXFLAGS=""
>> +EXTRA_OBJCFLAGS=""
>>  EXTRA_LDFLAGS=""
>>  
>>  xen_ctrl_version="$default_feature"
>> @@ -400,9 +401,12 @@ for opt do
>>    --extra-cflags=*)
>>      EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
>>      EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
>> +    EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
>>      ;;
>>    --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
>>    ;;
>> +  --extra-objcflags=*) EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
>> +  ;;
>>    --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
>>    ;;
>>    --enable-debug-info) debug_info="yes"
>> @@ -781,6 +785,8 @@ for opt do
>>    ;;
>>    --extra-cxxflags=*)
>>    ;;
>> +  --extra-objcflags=*)
>> +  ;;
>>    --extra-ldflags=*)
>>    ;;
>>    --enable-debug-info)
>> @@ -1318,6 +1324,7 @@ Advanced options (experts only):
>>    --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
>>    --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
>>    --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
>> +  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
>>    --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
>>    --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
>>    --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
>> @@ -3843,6 +3850,7 @@ if test "$skip_meson" = no; then
>>    echo "[built-in options]" >> $cross
>>    echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
>>    echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
>> +  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
>>    echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
>>    echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
>>    echo "[binaries]" >> $cross
>> diff --git a/meson.build b/meson.build
>> index 0e52f54b100..a21305d62c1 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3286,6 +3286,11 @@
>>                                                 + ['-O' + get_option('optimization')]
>>                                                 + (get_option('debug') ? ['-g'] : []))}
>>  endif
>> +if targetos == 'darwin'
>> +  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
>> +                                               + ['-O' + get_option('optimization')]
>> +                                               + (get_option('debug') ? ['-g'] : []))}
> 
> Hi Philippe,
> 
> You need to add something like below to actually use the flags in build:
> 
> add_global_arguments(config_host['QEMU_OBJCFLAGS'].split(),
>                      native: false, language: 'objc')


But so far we don't need any particular QEMU_OBJCFLAGS, so I rather not
add unused code. This patch simply adds passing ObjC flags from
"./configure --extra-objcflags=".

Anyway, with your/Akihiko/Christian help during review, this flag
is not necessary anymore to build softmmu/tools (I still have to
figure how to silent the "#pragma FENV_ACCESS" warning in tests),
so let forget about this patch (except if we expect macOS ObjC to
keep evolving and need a way to pass OBJCFLAGS).

