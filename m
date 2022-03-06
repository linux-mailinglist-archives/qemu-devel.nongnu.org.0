Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED204CEE24
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 23:23:03 +0100 (CET)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQzHJ-0006B4-Ti
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 17:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQzGE-0005VA-OZ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 17:21:54 -0500
Received: from [2a00:1450:4864:20::42e] (port=39638
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQzGC-0007tz-1i
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 17:21:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n15so6441928wra.6
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 14:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rycOLLhP1KADZm1AuzwIeE3zDxYtDS5tDXJOxfOqbKc=;
 b=mrHM2H01xH1Aq4XsDTWmFVOiJYCUuyjcXGbsS4jNkAhQ7SZBO548TkvCmUyXcS7MvF
 xIbrwZMOLWT7uoaxDApXF24zeuCPYyrpuHSONf9cmE3sZKKydTeyDqx03QZTO/1SX11n
 6/E650FTEWGvPDxQFJc9eqHOgyEYX/qBhvyNT7Be0p7mnF6ylngBcbo96iLeXrmPCGTI
 +v2r8/uXiTJZ+spSRprM8lPWFmNJ1wNjWPxI45t+5NBMWxC5bLn15fOkDQAogEoqoMCk
 wwAdt041k8N+x4m4e/ilyf7czc8mGsk01glJYbtFRjJKVI0r9QRlJZnpccJqbLnehbnH
 UfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rycOLLhP1KADZm1AuzwIeE3zDxYtDS5tDXJOxfOqbKc=;
 b=pSqywzCh7pdXX2vryvbMvw2mATAFFs0IqfZZTv7Rjgt1rlVRCA4vFTZgtFm870g3W7
 Zmx9dZekuUixYPOOmU0zvDHIEV7y4ykS7a4oRsh0XgyS6kRlDy8j/FL0g8LnEfjF3E2W
 m4SBdmWWdeMqxBtziAalUWBUC5K7yaXqB9rMz4+FVRJFk87XWsq7/qLTV9y7f2xcahFz
 a3C/4CvLeZ5wP/ZvGknk7VQdthDF7RQhz2r4xhpjWzJ7qSzz0Ie+QQIwlbutT5qlibK5
 9QkS/yRptxN4Dz0iOX7bqOxceDJyAWuhlKl/SylxJES4o6riVFwW4mgBQll9FaDDYq4u
 78ow==
X-Gm-Message-State: AOAM530YMP3lzN4xOpv2JK/WhUmQo7X+owjPQ9xPk02LUtGmfKLf8UKw
 P4m+14FcI1Dvst2xvxjQuOM=
X-Google-Smtp-Source: ABdhPJzuIizTJJFdaqtarDg8MKJ7h1XTyLrLuUcZeze4bb+ELoI+kZ+tudVuPGeR5D/MhzxyemOkaA==
X-Received: by 2002:a5d:5986:0:b0:1f1:f8fb:c543 with SMTP id
 n6-20020a5d5986000000b001f1f8fbc543mr1087140wri.480.1646605310256; 
 Sun, 06 Mar 2022 14:21:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d6707000000b001f067c7b47fsm13156700wru.27.2022.03.06.14.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 14:21:49 -0800 (PST)
Message-ID: <95f8f526-d980-ac38-2f72-63fa4b8c10e3@gmail.com>
Date: Sun, 6 Mar 2022 23:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
 <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
 <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
 <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
 <94417e74-a2e8-f23d-b4fd-e53c9d3c8323@linaro.org>
 <a85017ff-7363-7f95-6268-e386c8fdd88e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <a85017ff-7363-7f95-6268-e386c8fdd88e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Andrew Jones <drjones@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/2/22 16:36, Paolo Bonzini wrote:
> On 2/18/22 02:46, Richard Henderson wrote:
>>>>>
>>>>> I don't have gobjc/g++ installed, so ./configure defaulted to Clang to
>>>>> compile these languages, but compiled C files using GCC. At the end 
>>>>> the
>>>>> Clang linker is used (the default c++ symlink).
>>
>> This is another form of compiler mis-configuration.
>> If you don't have g++ to go with gcc, use --cxx=false to avoid picking 
>> up a different compiler.
> 
> This would be the kind of problem that this test is trying to cover:
> 
>      if do_cxx $CXXFLAGS $EXTRA_CXXFLAGS $CONFIGURE_CXXFLAGS 
> $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
>          # C++ compiler $cxx works ok with C compiler $cc
>          :
>      else
>          echo "C++ compiler $cxx does not work with C compiler $cc"
>          echo "Disabling C++ specific optional code"
>          cxx=
>      fi
> 
> In the past it detected issues with libasan/libtsan incompatibilities.
> We should either add a test for atomic operations, or just drop the
> test.

We shouldn't assume gcc is GCC:

$ c++ --version
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin21.3.0
Thread model: posix
InstalledDir: 
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

$ g++ --version
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr 
--with-gxx-include-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/4.2.1
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin21.3.0
Thread model: posix
InstalledDir: 
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

$ gcc --version
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr 
--with-gxx-include-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/4.2.1
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin21.3.0
Thread model: posix
InstalledDir: 
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

$ clang --version
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin21.3.0
Thread model: posix
InstalledDir: 
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

