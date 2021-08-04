Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489A3E06D7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:36:32 +0200 (CEST)
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKoh-0005V1-DJ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBIfl-0004vb-EX; Wed, 04 Aug 2021 11:19:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBIfj-0003l5-Gr; Wed, 04 Aug 2021 11:19:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so4191262wms.2; 
 Wed, 04 Aug 2021 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xtwnHMwolusEaGdAG6E/aKNyON+ZIfjNWbEjW9AsRNw=;
 b=t5loCa2lbl8YP2+bqkDD+w+YLvqTgVZnhNkYprp2Uui0u2k0xA+cUQCbX2iPEqL7lm
 RuJ9NzNgBLS97vIP/J6T6nYDMdOKfLO3SZl+AFDweLlEo5vIuSv6r8YyrOrZCsSZ3wRf
 v2+8KIdiZhpj95+yJcGl4N9XkirZnTW44GV4hK4eoFY7ZhY2ZTNtZeMuyE/2SKw7jrS2
 TG00RW6uYNf3ixdh2jrFgTn2huMviPhi7AVoJYENeR5oLZJYS1kymPqrE6BFcVsGTxGC
 ya0+eU0hXtyTWahNhUwOpz9SdCemUHx7MB3anOxy7h0PYuI7zO7r/vgWB9UHqNi1VePE
 l1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xtwnHMwolusEaGdAG6E/aKNyON+ZIfjNWbEjW9AsRNw=;
 b=bpuQuz6RXthxxdTCxcLwfmt+kQButnAKUuojTdhMdTUb6Mg+kwmKuhHYVvTWxmfx6L
 /O93kgeq0RX6jdl9S5SLmwLiABQwYw3ZvsXuF7CNP28uiyoCQmvFOkt4461AEA5pVI8g
 CL7Z7a0Rtr2E71lWM3OWZ4RR3SZkKXPqK9tWnE7ZtPtKAYkbv0LsDS4VgTO1QiQHv/Uv
 aknhqyJX2fu5tgUdcpTRE65mebGW943rTSFubvZDSZ6AEqKp4Et6QmsCH1ve1MxXvGBt
 l/hXWyuIhf3HfrMIL7/WSq3t/ecgx7isMX3jAk16MhkVbcnwNoMWqRJAwLlDX4acpFU3
 EBUg==
X-Gm-Message-State: AOAM532fDWWVQ2I/WiJpAerP0+LaXm7N4dy+/savUbZeOjvcRgIbYjj9
 Ol1Tplk6+efMMLiu5BNrxlM=
X-Google-Smtp-Source: ABdhPJyb3Zahy9+NaPbGXPbQ+XqWKimOgRqBcdtOUKRqWkmeU7D0K8mLwjXTcE6ZwsPf3CPk5VfCVQ==
X-Received: by 2002:a05:600c:3b15:: with SMTP id
 m21mr124133wms.99.1628090344498; 
 Wed, 04 Aug 2021 08:19:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w9sm2593131wmc.19.2021.08.04.08.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:19:03 -0700 (PDT)
Subject: Re: [PATCH 0/7] floppy: build as modules.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210804142737.3366441-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <477961d5-576b-a588-9cea-dad796c592d2@amsat.org>
Date: Wed, 4 Aug 2021 17:19:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mark

On 8/4/21 4:27 PM, Gerd Hoffmann wrote:
> Some code shuffling needed beforehand due to floppy being part of
> several platforms.  While being at it also make floppy optional
> in pc machine type.

>   floppy: move fdctrl_init_sysbus
>   floppy: move sun4m_fdctrl_init

https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html

Mark suggested:

  You may be able to simplify this further by removing the
  global legacy init functions fdctrl_init_sysbus() and
  sun4m_fdctrl_init(): from what I can see fdctrl_init_sysbus()
  is only used in hw/mips/jazz.c and sun4m_fdctrl_init() is only
  used in hw/sparc/sun4m.c so you might as well inline them or
  move the functions to the relevant files.

I did it and plan to send during 6.2. Sounds simpler than module.
You could easily rebase your series on top (or I can include your
patches while sending).

