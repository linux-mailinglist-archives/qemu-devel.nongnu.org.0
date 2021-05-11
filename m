Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FF379DDE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:35:57 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJBb-0001A3-V2
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgJAY-0008Vv-VE
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgJAW-0008Mc-El
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620704087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kY04rf/+FYLT2Si5bLMoshdBGdTWYQRYMVCcAJiLGI=;
 b=SMQVkIsOs69jb97yLPpNAtiu0kaUJ8kFYyUpvRGRE1g2XW2FqwjcA0U4G4gkoD0CCKenxV
 y+S5ZYn0mT/tiVguxaU+OR08QrzQWh6yyFgUJFyFadIb2bFsxNKc9zjcceLLxcxw6vkCf3
 +/VBQnJ10UXBSZvdXrx8tGypYxWJCvc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-OpTuCJaQO3CGCi4mtbCx2g-1; Mon, 10 May 2021 23:34:45 -0400
X-MC-Unique: OpTuCJaQO3CGCi4mtbCx2g-1
Received: by mail-ej1-f71.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso5473969ejc.7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 20:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1kY04rf/+FYLT2Si5bLMoshdBGdTWYQRYMVCcAJiLGI=;
 b=j+fmIw49oMb/oE+HgHxtQwxC45ZtY+/IesdJPNe5gFzxMAwzJHbi9k9cC/+Ga33OfP
 bqtU2/PAFlP7sfjeLTj+nuB1XP3oZ88Z5bd7Pq2czD9kGFMmtUIGbFXoS4bgnAxlI9JX
 3KYcrvqbBDiNvbwwOZyLKdTD9jZxtDzHpfq8CvjZWGHANAXXmenYLQMHOH4q48zV3R1w
 KBzBMVqinyjQocjdqeFA0jHoh5YRqU6CcblQ/KgkDvw7We5djAwgKnoFCfqcddRZP1ZB
 iq8TQNE5oV7y7mao7z4Mv2X5uced37Yo8WBD0dSQqJDOE2I8YpmWTAfQo4Ph5/TH/LgQ
 zKbg==
X-Gm-Message-State: AOAM533/F1ouqCc6lPvA+qwyreCj4QKVWoBaEJlPFBE1Hu9/W6FqxCXL
 a4MCGJaIKE+PnrcQh02s9YJY7q0VCKu3fwrNq6UdAP/F3BDLpDANmZNh0fyx9dxXh7IN34dSbwR
 OCr57C/rkQkKwI+M=
X-Received: by 2002:a05:6402:b91:: with SMTP id
 cf17mr34277126edb.19.1620704084508; 
 Mon, 10 May 2021 20:34:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvbkN7jmqC5fLCGyab07AZhEX/1CItqymjTNDOpOL5OnK5lMQ24AfEYApFJHeQttR66xt+KA==
X-Received: by 2002:a05:6402:b91:: with SMTP id
 cf17mr34277109edb.19.1620704084353; 
 Mon, 10 May 2021 20:34:44 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p2sm10388746ejo.108.2021.05.10.20.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:34:43 -0700 (PDT)
Subject: Re: [PATCH v2 0/8] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210428125104.358535-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a0e1177b-7021-f4ae-4c12-664fc5ad035e@redhat.com>
Date: Tue, 11 May 2021 05:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428125104.358535-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Miroslav Rezanina <mrezanin@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John,

This series is fully reviewed; can it go via your block tree?

On 4/28/21 2:50 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Since v1:
> - added missing "hw/block/block.h" header (jsnow)
> - inlined hardware specific calls (Mark)
> - added R-b/A-b tags

> Philippe Mathieu-Daudé (8):
>   hw/block/fdc: Replace disabled fprintf() by trace event
>   hw/block/fdc: Declare shared prototypes in fdc-internal.h
>   hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>   hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>   hw/block/fdc: Add sysbus_fdc_init_drives() method
>   hw/sparc/sun4m: Inline sun4m_fdctrl_init()
>   hw/block/fdc-sysbus: Add 'dma-channel' property
>   hw/mips/jazz: Inline fdctrl_init_sysbus()


