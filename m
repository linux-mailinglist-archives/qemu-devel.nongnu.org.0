Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF3530671
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:16:07 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstrq-0006ck-O0
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstp9-0005RZ-GH
 for qemu-devel@nongnu.org; Sun, 22 May 2022 18:13:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstp8-0003wX-2i
 for qemu-devel@nongnu.org; Sun, 22 May 2022 18:13:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso15851027pjj.4
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 15:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/qw9ZnAtp1QPiZ8n+jUTEc7msv4Muy9qbVc8HGiWCC0=;
 b=cMoUKkwk/OTQ1bTrJUt8EW3aVyyRERmzSO1p0j3uoEmxEXe0zpdmOzUYf/bpGKgt7I
 ui7g1aV3ODCl6EpPLuMpPpaciqjOsbnXi12Lz2hQavZPC7fBucpN5gB0Q2uRqB+DtIvF
 gLnyzmA00DG8PPY45L/OF6s63oD0YqKttCaX6Tpf5GVdqir0EDTlsv9i8W6I+OF62CHJ
 BpWSHHpoUxeFg9ReiiKmk7GQkXpCygibpsad0yX8h7x7R9+/eooFQG0uN4nPxMSZcq6P
 4vasfgoSGyrz/cjh0J8BCvutdKZyGOvAkFxJJG4TyKNHSGT5ZIH+Ze8BUCKlqDJLZV6G
 SHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/qw9ZnAtp1QPiZ8n+jUTEc7msv4Muy9qbVc8HGiWCC0=;
 b=3OA/3gurqRmZhT55Di2iDnFjiHvNCd0wP2TzLR+jAwcOyXkuV/U/xMqkNFPcQ9P+iX
 wnwIwJZMecLv6v2B/LZKbva9y3oT5ck1bNXmEy6kevnTjTldWIVg3QE9c4at5mSB8stK
 h+zqoumuDG2feQ9VVsU03TLggZoegLxpzeSSk2Qf0O0YXyP1snndsyguDt7GEBbFggsR
 9Ozy6IYyRTiMExXQDOlzd0lbdN/UYPCmz+7wImZc5Q3AhnprJKEiTnqeS29kw4y5kun0
 1CAJ62AwXihjeV9FnWDeR0L6hUHkuMWZSOPyUvu41vpPUd8TMCTKeiXknLqvTdAEx/bB
 XF9g==
X-Gm-Message-State: AOAM5334uthQuVLoiq8wNBgTGg5V+tRQIUu5Uo0hF33qTIrRmJgiaTAm
 7dGa3lZKBYQ70jQDE44fw4w=
X-Google-Smtp-Source: ABdhPJxe5vig1G2Tq4FBxMQSUEW7d46sB1uut7d7saW80KDG4114I6UtVAwsdTBeM6NzAMe7TGtb9Q==
X-Received: by 2002:a17:903:1107:b0:15e:f451:4034 with SMTP id
 n7-20020a170903110700b0015ef4514034mr20251416plh.3.1653257596696; 
 Sun, 22 May 2022 15:13:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s67-20020a637746000000b003c6a71b2ab7sm3399853pgc.46.2022.05.22.15.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:13:16 -0700 (PDT)
Message-ID: <28a2c667-1910-0a20-60e6-510f662a8b2b@amsat.org>
Date: Mon, 23 May 2022 00:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 0/6] hw/acpi/viot: generate stable VIOT ACPI tables
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, jean-philippe@linaro.org,
 qemu-devel@nongnu.org
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 18/5/22 13:08, Mark Cave-Ayland wrote:

> Mark Cave-Ayland (6):
>    hw/acpi/viot: rename build_pci_range_node() to pci_host_bridges()
>    hw/acpi/viot: move the individual PCI host bridge entry generation to
>      a new function
>    hw/acpi/viot: build array of PCI host bridges before generating VIOT
>      ACPI table
>    tests/acpi: virt: allow VIOT acpi table changes
>    hw/acpi/viot: sort VIOT ACPI table entries by PCI host bus min_bus
>    tests/acpi: virt: update golden masters for VIOT
> 
>   hw/acpi/viot.c                | 107 +++++++++++++++++++++-------------
>   tests/data/acpi/q35/VIOT.viot | Bin 112 -> 112 bytes
>   2 files changed, 68 insertions(+), 39 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

