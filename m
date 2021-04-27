Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDAA36C683
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:56:35 +0200 (CEST)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNGV-00033T-2W
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNEr-0002QD-0o; Tue, 27 Apr 2021 08:54:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNEp-0007AF-JT; Tue, 27 Apr 2021 08:54:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id n84so4576218wma.0;
 Tue, 27 Apr 2021 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vbBUTqURMsbbfAK+P0NQCFJGTxEK2u5lbAtkCybb8GE=;
 b=RV0fNdThnvG6jLP+TQkBXAdW8sT2GtnhxTnlvwfrb0GASzhj/aHRA9Z+QYJiwhS7SP
 6+2ZsKqY9W9H/cTfXM9pow7B91RPlRJUK3z8MRpXciBPNFOs/1LkDscmTT8WB9cZIHhL
 q+kaqLIvT4vTDwohgR+WmVrIBt3vVmJWbi0wW615pqCXJtMCJ1GSznvy4LZ0QCOOIh5+
 YmSEmpqp40H+eylIOSrjGJQ6kimFELnvOA/DQzo9Z9QB7e7Dd94mOERXEbvLUZ/1F+W9
 jEoYdyWAPE54VOXo4M6bvU5ZWygqwyW81KdyXMfFLxvIFxsBRVQz1fowLHqhZx3Xcp7m
 Yd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vbBUTqURMsbbfAK+P0NQCFJGTxEK2u5lbAtkCybb8GE=;
 b=X4QMUJGZ19RJpC8WUa59CMXBEFo9FwtRmRD4cwTQXwf9OAd7jkhlG88PzCG9IZIvYb
 2D60pIjTD6kU0ZeuNc68difkRcF9dX1dm/vfYv4jtidz/SrABHnHLFU+J5NOSDrKgmbC
 /xaw4RNnfEv2q1goXGCdSW8+EWYPvQ3ik8OsmGA63DaAe4xM0xz4PmC2VxQ6rXh/koVR
 05seYm9NUKOV3EQV75rI1l6bIytauzmGy0FlK74FnbLR7/dCfQnP3/7+JwFKH9Zhb+k7
 LC0ODe53GorUQv6gLRveVBGNJlZa3+Us36xbabC+cOQDkf99pgnAW0cIjkuPCQD17wIB
 62gQ==
X-Gm-Message-State: AOAM531HwcS/QVVZkU5ji6bp+iLECV3yAlVZdxLQCCWstIeLcjS9eRKR
 lPthjUdlOsPBEwJ7JVjFzQkDcmTHajl+rw==
X-Google-Smtp-Source: ABdhPJzjIdUoaF0SF1EZj2Eb20ZQuBq0a/WXKdze8cf+PhTYMQ7Rz7h1feNAt+wx/sFqWfobPNV3ig==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr4108149wmh.174.1619528089413; 
 Tue, 27 Apr 2021 05:54:49 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l12sm3868322wrm.76.2021.04.27.05.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:54:48 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <88c92d3c-bf13-5d07-62df-2315fffc7d78@amsat.org>
Date: Tue, 27 Apr 2021 14:54:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415102321.3987935-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 4/15/21 12:23 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (4):
>   hw/block/fdc: Replace disabled fprintf() by trace event
>   hw/block/fdc: Declare shared prototypes in fdc-internal.h
>   hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>   hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
> 
>  hw/block/fdc-internal.h | 155 ++++++++++
>  hw/block/fdc-isa.c      | 313 +++++++++++++++++++++
>  hw/block/fdc-sysbus.c   | 252 +++++++++++++++++
>  hw/block/fdc.c          | 608 +---------------------------------------
>  MAINTAINERS             |   3 +
>  hw/block/Kconfig        |   8 +
>  hw/block/meson.build    |   2 +
>  hw/block/trace-events   |   3 +
>  hw/i386/Kconfig         |   2 +-
>  hw/isa/Kconfig          |   6 +-
>  hw/mips/Kconfig         |   2 +-
>  hw/sparc/Kconfig        |   2 +-
>  hw/sparc64/Kconfig      |   2 +-
>  13 files changed, 751 insertions(+), 607 deletions(-)
>  create mode 100644 hw/block/fdc-internal.h
>  create mode 100644 hw/block/fdc-isa.c
>  create mode 100644 hw/block/fdc-sysbus.c
> 

