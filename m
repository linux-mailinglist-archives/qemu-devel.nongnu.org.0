Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8B4A8C67
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:26:43 +0100 (CET)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhkg-0003Rl-K2
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFgsY-0000wb-9B
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:30:46 -0500
Received: from [2607:f8b0:4864:20::534] (port=34318
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFgsW-0006IC-MX
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:30:45 -0500
Received: by mail-pg1-x534.google.com with SMTP id v3so2993993pgc.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jmXWHfcZ46MI72djVkvm4qIlSx6rm5iEE9JNv22+ZAA=;
 b=k31iFVW+xm1ZTGntmbHSNGhHGLS3E7YY4yW6avp8V3Pj8HeeGMtdY9MKVl2/ZlrDPn
 GdroJQX7xYx+baTGP7JcZkdS7SDbhMSrz2hCYaIG5CseLLsnJZ41SEEn721fRZ152UXb
 2gusdytaysrzoSSKr/A1f5UUshLGm+sC11MZk3I3vmnp8suejYFrfzlTnsXm5Qe2etpf
 ZUwGe78B8W+T4jy6B3dzdMsWLAwdguARwuri8UbMEMa92ft78+Snq2EUtf6SOwsNe8vr
 bjVLanSDurV4tJH0Y45v75054Es+MelyGIt40Vng7+78DONHKbsdql87xGN4Kv9v62UO
 qx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jmXWHfcZ46MI72djVkvm4qIlSx6rm5iEE9JNv22+ZAA=;
 b=m0s5oYyPUy9GmqJWBlMd7h+WOIOfx8lyJ+y5P4A4pWnz66xYoSbkg8lCeCLJ5tCPnQ
 ua00FOgvZkphjxTEjHKVQ0YnkK0KijzMIsccHO/nl7UU2GBkyhF+4kucXyTtxZ3402cc
 5MruWM5Z9Awhjbh/c1ZgU46CX4cMjKZIX2Lelj+5YP7P7mTld3eF6/6F+5GpiaWfJdCF
 qilW+NF8Lx0Sf1zCEzE5P+Q1AbB9uS80tbJiNGtKtYDOZLPCt/gi3gT9a/I25Eyy+NCc
 iBz39EURC4XmNrEEv3bKaRlCl3qa+4AQ4Ho1pRf99VeoFXXLaNaN3Gb9zzbEc3dWiDDE
 P3xQ==
X-Gm-Message-State: AOAM531C+pJK2glaDVZdFWpvlwX2IcGktNP6TEJsXYCdYTPUkahTsm/T
 e9mTMfUzRxY5FcAYgfTmkco=
X-Google-Smtp-Source: ABdhPJxQSozQ30XmA6f6ahuuCkY52oVOFl0DHJxwAFkjVLmv5pIhH+9JTFmZfgnPJ4TNWg7gMgJfuA==
X-Received: by 2002:a05:6a00:2447:: with SMTP id
 d7mr35110251pfj.64.1643913043176; 
 Thu, 03 Feb 2022 10:30:43 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q1sm10632756pjd.48.2022.02.03.10.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 10:30:42 -0800 (PST)
Message-ID: <2f00f260-f8c4-55b2-7bad-efb5b7876eb9@amsat.org>
Date: Thu, 3 Feb 2022 19:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] audio/dbus: Fix building with modules enabled on macOS
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220203165859.41066-1-f4bug@amsat.org>
 <CAJ+F1CKgWg6rZMGHnvg_hX+7m-YXG7fCpVbTHPpCw0MoRE6c0Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CKgWg6rZMGHnvg_hX+7m-YXG7fCpVbTHPpCw0MoRE6c0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/2/22 19:05, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Feb 3, 2022 at 9:04 PM Philippe Mathieu-Daudé via 
> <qemu-devel@nongnu.org <mailto:qemu-devel@nongnu.org>> wrote:
> 
>     When configuring QEMU with --enable-modules we get on macOS:
> 
>        --- stderr ---
>        Dependency ui-dbus cannot be satisfied
> 
>     ui-dbus depends on pixman and opengl, so add these dependencies
>     to audio-dbus.
> 
> 
> Weird, why would the audio module need pixman and opengl, on macos?

audio/dbusaudio.c depends on module_dep("ui-dbus") which itself
depends on it (ui/meson.build):

if dbus_display
   dbus_ss = ss.source_set()
   ...
   dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
                 'dbus-console.c',
                 'dbus-error.c',
                 'dbus-listener.c',
                 'dbus.c',
               ), dbus_display1])
   ui_modules += {'dbus' : dbus_ss}
endif

> 
> 
>     Fixes: 739362d420 ("audio: add "dbus" audio backend")
>     Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     ---
>       audio/meson.build | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/audio/meson.build b/audio/meson.build
>     index 0ac3791d0b..d9b295514f 100644
>     --- a/audio/meson.build
>     +++ b/audio/meson.build
>     @@ -28,7 +28,7 @@ endforeach
> 
>       if dbus_display
>           module_ss = ss.source_set()
>     -    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
>     +    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
>     if_true: files('dbusaudio.c'))
>           audio_modules += {'dbus': module_ss}
>       endif
> 
>     -- 
>     2.34.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau


