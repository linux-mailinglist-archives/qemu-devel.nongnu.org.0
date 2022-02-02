Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BDB4A787E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:06:06 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFKxA-0003jN-W6
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFJTH-0002D7-3k
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:31:07 -0500
Received: from [2607:f8b0:4864:20::1035] (port=55952
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFJT9-00037e-Lg
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:31:06 -0500
Received: by mail-pj1-x1035.google.com with SMTP id d5so20814557pjk.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hupKhPynLq1Bf3qlTLC4Kz0Lfmt5cTR5vZzYauE5o9o=;
 b=GFLGtErYAc2e9Ca+9es6uTpBLgahV9MpIoOOsarpStDCTLvX+yg5PnOn6Axu9IcqR9
 vx9yAET13X/RGK/4Z+tMosdTUrLlZknW996KvXdn0uDyRbO0sb/WhUcbX8WC/XJFjvrE
 JMWo/wEwG8xC2Js+m3ppdwzZ+iQYMnTXdG4tZyC2RGTTcgqE+qFi7hivd+rtpISbj9NT
 QmRiEDiAvr1GKiIdaGmRck5EkfeGq6Xs+7JsR9aQOsosPOHzqkQAvlU7+APxhri2n90M
 A9aiDUDg9f7x0xuZTMj3wkrtcAKhiX/Tep3KhbRzI9ECqbLwv5Kjf0LlKWTebeIz72N2
 ieIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hupKhPynLq1Bf3qlTLC4Kz0Lfmt5cTR5vZzYauE5o9o=;
 b=q2uBCbY3IVO6cKy+Xn7pAxzfbsrCHhS6Hg+1jrEc4VqN9wrKLaqIn8aiC3DlYjEpwS
 Uhe43lylP2rNqC5i10rdJ34ifvf0rEGY9lnLNP1XRGTvvOI2hvTAdTiWnu8mxFF21TGs
 WpDMVopmVBHKIzuzgLxeimBdojVxBgzJcw7eYUNvE8qJiNuqbPcQPIOEVZY3Fg+ybsXs
 0zcc/eOkjoTLuELTsHTVDpmPHH0oozs+D+6m41LfUSyZAzlmE2vWCefyvPR2OTOvasWm
 i/f5USenyW6ChewYWJFzLNNpT0F/ROF2vMW9uBFy46F+4HbwJmy6fU8+lQf7NYosLj7H
 ba2g==
X-Gm-Message-State: AOAM530kJ01Lp3gusiugETd8v3/5rMg0aA+6V7Xxin7QrtBzRz+3Vc1U
 5sQJN15Nb9ZCsPyxBSD7iu4=
X-Google-Smtp-Source: ABdhPJwpi9tZZn55K+KLXQi9Ghe9h8sXQXItUIk2yRhg0NJW/CWKTNzKIoir2q0VUzRbCpWRnxQ/fA==
X-Received: by 2002:a17:90b:1c85:: with SMTP id
 oo5mr9309183pjb.142.1643823057104; 
 Wed, 02 Feb 2022 09:30:57 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m26sm10439512pfe.162.2022.02.02.09.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 09:30:56 -0800 (PST)
Message-ID: <f10cbf13-ac56-cbe0-02f8-1d96a687700e@amsat.org>
Date: Wed, 2 Feb 2022 18:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
Content-Language: en-US
To: Patrick Venture <venture@google.com>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
 <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
 <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
In-Reply-To: <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 2/2/22 17:40, Patrick Venture wrote:

>     Philippe,
> 
>     I0202 08:29:45.380384  6641 stream.go:31] qemu: child buses at
>     "pca9546": "channel[*]", "channel[*]", "channel[*]", "channel[*]"
> 
>     Ok, so that's interesting.  In one system (using qom-list) it's
>     correct, but then when using it to do path assignment
>     (qdev-monitor), it fails...
> 
>     I'm not as fond of the name i2c-bus.%d, since they're referred to as
>     channels in the datasheet.  If I do the manual name creation, can I
>     keep the name channel or should I pivot over?
> 
>     Thanks
> 
> 
>             -- >8 --
>             diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
>             index f9ce633b3a..a9517b612a 100644
>             --- a/hw/i2c/i2c_mux_pca954x.c
>             +++ b/hw/i2c/i2c_mux_pca954x.c
>             @@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)
> 
>                    /* SMBus modules. Cannot fail. */
>                    for (i = 0; i < c->nchans; i++) {
>             +        g_autofree gchar *bus_name =
>             g_strdup_printf("i2c.%d", i);
>             +
>                        /* start all channels as disabled. */
>                        s->enabled[i] = false;
>             -        s->bus[i] = i2c_init_bus(DEVICE(s), "channel[*]");
>             +        s->bus[i] = i2c_init_bus(DEVICE(s), bus_name);
>                    }
>                }
> 
>             ---
> 
>             (look at HMP 'info qtree' output).
> 
>              >       }
>              >   }
> 
>             With the change:
>             Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>             <mailto:f4bug@amsat.org>>
>             Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>             <mailto:f4bug@amsat.org>>
> 
> 
> Just saw your reply, and found a bunch of other non-spam in my spam 
> folder.  I sent the message to the anti-spam team, hopefully that'll 
> resolve this for myself and presumably others.

Thanks. I suppose the problem is the amsat.org domain.

> I definitely see the same result with the qdev-monitor, but was really 
> surprised that the qom-list worked.  I'll explicitly set the name, and 
> i2c.%d is fine.  The detail that they're channels is not really 
> important to the end user presumably.

I agree it is better to follow datasheets, thus I am fine if you
change and use channel. How would it look like? "channel.0"?
FYI qdev busses are described in docs/qdev-device-use.txt.

We should be able to plug a device using some command line
such "-device i2c_test_dev,bus=channel.0,addr=0x55".
I wonder how to select the base PCA9548 ...

Maybe we need to pass the PCA ID to pca954x_init(), so we can
name "channel.2.0" for the 1st channel on the 2nd PCA?

Regards,

Phil.

