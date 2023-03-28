Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6616CC059
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:13:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph982-0002n8-Fu; Tue, 28 Mar 2023 09:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph97y-0002mE-M5
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:12:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph97s-0003ap-0C
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:12:37 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v1so12176621wrv.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680009149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gy49rPl6jeZvLoqUQrUIF3QO4w/Nda86notlZmm2040=;
 b=xOW4+p9Vt6uk3E0KGb45q7YT38T7rw/QOaD69isXKztkKFC6ITJ3PzHtKfHkXaT7IK
 dZn5Pbimng/0OqG0NPkUiNNqUJjxneaF9hVVW2BNSQfI9f6Aj5DUAPZKjHWBQyz4LSsy
 vMbC7bx1DQ1tVfB1wBLC6RSLUKxZ4O8fpsK8NPGhMOlIXgncj+ovOUY8rkzWA11oTuNZ
 igMAXhR+b2I95lKzoDNAQ1hfMlBEp/rsYHxHBRKYL23t7LIBPvFXu+NDBQtFbqDA241l
 iQHvg/KD4Hk4hTS3GrW4+0cvLIEzmQPUUzEB+QIJddQAl86plvINl66zOlTG7LZhZk8h
 xxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680009149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gy49rPl6jeZvLoqUQrUIF3QO4w/Nda86notlZmm2040=;
 b=A96xwmcCWMK3EOBtWzQ4hHzgUjzTabH9ZqZVbfA/mz/0Q+Z3uO3vItKNnwUs5dyTjj
 ElEmBPgvpr37R5pGaAXLwix4AUImo2mTyjeUZDnRzp3ixu4DDPnXLJBjxbbc65YagHFO
 nkq6Bow9w0IIKahnuYFIXHq+SZxo+eCGNzEtQf/FhFnQa7DYw45ZMOW968XFX1h0vndq
 FQYGnxmpfTnI1laGItLhfJ6xyiWlFGOaI2bliBTWnCLcDIZxOtftsQsFFj5HkzNRQ/Gw
 PvfqoRenUc5tHeoeD+FgS/pLUw6Su6mdxDhlygWZWLw1BkcpFkyXT1zTEdol5yhLoANv
 5/DQ==
X-Gm-Message-State: AAQBX9dcuXp92t6wf+UGiG55GIzcQ+74XhaK6/kCsghry/i2uI/LI1rL
 mml05u6sVn7QIXP3lsqdBQTr6A==
X-Google-Smtp-Source: AKy350a6f1X0rrhWPHHqz0+ewqcJ9UHSKttkQMlSz808E9H9ZevtYcmSyhPk4DhRc0DftY2tpw9a3A==
X-Received: by 2002:a5d:6344:0:b0:2c5:4c9d:2dab with SMTP id
 b4-20020a5d6344000000b002c54c9d2dabmr12031253wrw.10.1680009149648; 
 Tue, 28 Mar 2023 06:12:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b002c70851fdd8sm27772151wrt.75.2023.03.28.06.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:12:29 -0700 (PDT)
Message-ID: <84824486-6c67-3e78-fd93-91741d9fccff@linaro.org>
Date: Tue, 28 Mar 2023 15:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration
 mismatch from <lzfse.h>
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
 Julio Faracco <jcfaracco@gmail.com>, Eli Schwartz <eschwartz93@gmail.com>
References: <20230327151349.97572-1-philmd@linaro.org>
 <cc1f75ce-0295-cc57-1a74-71e036862bb7@weilnetz.de>
 <e4a0b994-965a-2bd4-5517-b11e31b002ee@linaro.org>
 <CABgObfZ8pfrfMV0YLWo-bPyh7fCehk+NjRRnkKA15DQnqy3Mpg@mail.gmail.com>
 <ac4ac6ae-9147-bdb2-5adb-3322182cba4f@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ac4ac6ae-9147-bdb2-5adb-3322182cba4f@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/3/23 08:29, Stefan Weil wrote:
> Am 27.03.23 um 23:09 schrieb Paolo Bonzini:
> 
>> Il lun 27 mar 2023, 20:58 Philippe Mathieu-Daudé <philmd@linaro.org> 
>> ha scritto:
>>
>>     > The warning can also be suppressed if the build uses `-isystem
>>     > /opt/homebrew/include` instead of `-I/opt/homebrew/include` as I
>>     just
>>     > have tested.
>>
>> Is that option added by QEMU's configure or meson.build? Or is it 
>> added by homebrew? The fact that /opt/homebrew/include it isn't 
>> considered a system seems to be a homebrew decision.
>>
>>     IIUC by design meson only allows including *relative* directories,
>>     and manage the system ones:
>>     https://mesonbuild.com/Include-directories.html
>>
>> That's for includes that are part of QEMU.
>>
>> Meson has as_system for dependency objects 
>> (https://mesonbuild.com/Reference-manual_returned_dep.html) but lzfse 
>> doesn't have a .pc file, its detection has to be done by hand.
>>
>> Paolo
>>
>>     > If we can find a solution how to implement that I thing it would
>>     look
>>     > nicer. Technically the patch looks good.
>>     >
>>     > Reviewed-by: Stefan Weil <sw@weilnetz.de>
>>
>>     Thanks!
>>
> 
> Typically I configure the build on macOS with `./configure 
> --extra-cflags=-I/opt/homebrew/include 
> --extra-ldflags=-L/opt/homebrew/lib --disable-werror`. With that 
> configuration I get the two warnings for lzfse.h.
> 
> When I use `./configure '--extra-cflags=-isystem /opt/homebrew/include' 
> --extra-ldflags=-L/opt/homebrew/lib --disable-werror` instead, I get no 
> compiler warnings (and `--disable-werror` could be ommitted).
> 
> So at least for macOS with Homebrew in /opt/homebrew (M1 / M2 Macs) the 
> patch is not needed when the right configure options (`--extra-cflags`) 
> were used.

What I learned:

- If lzfse were well packaged (as noted Paolo), we could use
   dependency(..., include_type: 'system')
   https://github.com/mesonbuild/meson/issues/963#issuecomment-1277851401

- I agree with Eli Schwartz, a Meson maintainer:

   > More bugs caused by and only affecting people who misuse and
   > abuse -isystem as "not system, but as a side effect please
   > don't emit warnings for this messy dependency"...

   https://github.com/mesonbuild/meson/issues/8755#issuecomment-836913759

I wasted few hours on this, and am now giving up in favor of this simple
patch.

