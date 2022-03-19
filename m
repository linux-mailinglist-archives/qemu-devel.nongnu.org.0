Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A684DE83C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 14:58:26 +0100 (CET)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVZb6-0000IW-MO
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 09:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVZZ0-0007GM-MQ
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 09:56:14 -0400
Received: from [2a00:1450:4864:20::434] (port=43737
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVZYy-0006BC-TW
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 09:56:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id a1so13760742wrh.10
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c064RfI8l1te+8IfiqPeqYiqDxYsHx9Iux5okmRdy20=;
 b=nPDsGNFqYSwHJyW+JX826MMUa7/9JBMGLhQ+eoRreRNWWylsADzYaqok4YEvw5P96O
 YA6nLfpUK0g4g8cVX/oE6tlEXjHOP0Ve2K92M2NgFT4FRHoFH994XJ1I94z3bFMYyWIu
 Ej/DmXaXWLyE5A0Cg17puQIMCl6CmXeuBj437x8sI0cvCfYLDaHUcN3UqzeV3V0L5KZ1
 KYokwwBhoWx3evWnzW8A6nMohz2qMsFWUTAVarBWn7gUxyOkkIKNb6mgQIb7gU7ODDz4
 ht9fztKqe1cXZC0JWUaCYXr90Q9p6dNhsYftSLhDVMIOSfiHQkQhGJ5iMHZJ3j9nmuo6
 VdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c064RfI8l1te+8IfiqPeqYiqDxYsHx9Iux5okmRdy20=;
 b=3iwvuIufyba/OYxsVs04mRbLcmbEm56BA9H+MXFHXTH3IHjAFH4OhcD8MXDbAvcqZ5
 IcRBYWmR4az06Po6gHmounrBpmtkE6ABe9mPQQ5RLV/8w8fsqKgTvG3u6C7h1BRu8BB5
 jMQTDF/wA6K+ltLC1vlXJndscBLSYAPAzXrrbS9yCWUmxzRERCzdD1eeiL8oJVQGUB8T
 Lm6yKtuEfRWcZ14VTYfQiwIeASs6ba4nJbAY7EsyuqfAORfliFbfj8dJmZwy3WlvXjo8
 bh/W7xxmToAVDsu2B77nf1Wq6FPKtmMRfMC97hXkchBjGMW8UdLC7jMJRXuqxPlskxv8
 g/ng==
X-Gm-Message-State: AOAM532uL+djSFwT4mvJVYPSRnIN2paGFRZn+ig/1JK882bNpgWZtKaT
 vtKGPD2XNFx9WEs0Yk893X4BmMVE2F4=
X-Google-Smtp-Source: ABdhPJzY4H2w1Dv42X1lGDmevnybkTS9mGBajkV1BUjo4TFS7BBCbPCwYKXdIXI70OQTAfctMiUdAA==
X-Received: by 2002:a5d:4245:0:b0:203:dc49:2604 with SMTP id
 s5-20020a5d4245000000b00203dc492604mr12189785wrr.32.1647698170606; 
 Sat, 19 Mar 2022 06:56:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm4051289wry.32.2022.03.19.06.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 06:56:10 -0700 (PDT)
Message-ID: <342e06e6-8d38-d068-5686-eb13c70da93b@gmail.com>
Date: Sat, 19 Mar 2022 14:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v4 0/2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Akihiko, Paolo, Peter.

On 17/3/22 13:55, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Posting v4 in case someone want to iterate.
> 
> Pending issue raised by Akihiko Odaki:
> 
> * this actually breaks the "runas" option with ui/cocoa.
> 
>    [+NSApplication sharedApplication] calls issetugid() to see if
>    setgid() or setuid() is called before and calls exit() if it evaluates
>    true. It does not evaluate true without this patch since setgid() and
>    setuid() are called after [+NSApplication sharedApplication]. This
>    patch, however, changes the order and triggers the check.
> 
>    There are two options to solve the problem:
>    1. Move setgid and setuid calls after [+NSApplication
>    sharedApplication] to let NSApplication initialize as the original
>    user.

Akihiko, could you send a patch?

>    2. Do: [[NSUserDefaults standardUserDefaults] setBool:YES
>    forKey:@"_NSAppAllowsNonTrustedUGID"]
> 
>    Option 2 would be preferred in terms of practicality since nobody
>    would want to initialize NSApplication as the original user (usually
>    superuser). However, _NSAppAllowsNonTrustedUGID is not documented by
>    Apple.

What are your views on this problem for 7.0-rc1? Keep modifying cocoa
UI? Disable block layer assertions? Only disable them for Darwin?

> * Oudated comment in main():
> 
>   1970  /*
>   1971   * Create the menu entries which depend on QEMU state (for consoles
>   1972   * and removeable devices). These make calls back into QEMU functions,
>   1973   * which is OK because at this point we know that the second thread
>   1974   * holds the iothread lock and is synchronously waiting for us to
>   1975   * finish.
>   1976   */
> 
> (https://marc.info/?l=qemu-devel&m=164752136410805)
> 
> Since v3:
> - Move qemu_event_init before cbowner alloc
> - Reduce main_thread scope to applicationDidFinishLaunching
> - Updated updateUIInfo() comment
>    (s/cocoa_display_init/applicationDidFinishLaunching)
> 
> Since v2:
> - Extracted code movement in preliminary patch
> 
> v3: https://lore.kernel.org/qemu-devel/20220317115644.37276-1-philippe.mathieu.daude@gmail.com/
> v2: https://lore.kernel.org/qemu-devel/20220316160300.85438-1-philippe.mathieu.daude@gmail.com/
> v1: https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/
> 
> Paolo Bonzini (1):
>    ui/cocoa: run qemu_init in the main thread
> 
> Philippe Mathieu-Daudé (1):
>    ui/cocoa: Code movement
> 
>   softmmu/main.c |  12 ++--
>   ui/cocoa.m     | 161 ++++++++++++++++++++++---------------------------
>   2 files changed, 79 insertions(+), 94 deletions(-)
> 


