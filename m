Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B7472706
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:58:39 +0100 (CET)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwi6Q-0005Wm-2T
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwi1W-0003Hv-Ut
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:53:36 -0500
Received: from [2a00:1450:4864:20::42b] (port=35351
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwi1V-0007AA-5R
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:53:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k9so8197912wrd.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WgNH0cVk7aJeyZ4Y98yhp1UGfqAyNGkhaQp8isYev0Y=;
 b=F0abeT7XTyq3McPd4laO6i1AOd2J04SMr+FqNl3WeHfh1s6uE/WFWwJFNvtKVUFLTQ
 5UFAGcYiCaGKvQJE4h7TCoRf+khlpm1j+gjuOElVVJqgdSKAKuNQJj/ZETHlcITF6lQk
 0hjSzum/A0Eu5TphF7HR4B+mP6CZOgx9psmSk/xfLimo1kIg7dsMjO9UX+UXvFFhW2+S
 UXuyAjbt+P+K+Ltd+TDybUTgbDBq0VNU2Wstam8P8cin+xrvFqEtS8MD8xoJteI85YwS
 cpEj06V/XBIqcKiLG2U2I+/9UTupd+LpI8bjpIaao59giqCkIALmjpBDiD+BB+dyBCEr
 A2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WgNH0cVk7aJeyZ4Y98yhp1UGfqAyNGkhaQp8isYev0Y=;
 b=vK+3dyhyXRUqaYCGOEWGgOsgaOIRpMFDZtIMghTYCzifl1BMO1wuQr1i+B66VSsDzS
 GeShW3WjaHGdh2bnNjwzKM22mx1T8hoD169T040Mw2gKk2Xa+E4mLH8ELfuRA1iNQtAu
 oeYzcPTvsbkfAs3Opdr2nEwQGwybPYtaO50eSfUbq9AjEy8bnD5u6c4ttpSxE2UE7Mem
 4MXZQI+upyTe+TKZYIX00KVDc/Qd5s0Mjzz8kLlHY68XmpP+WzaI5XVCQIFGZqtfzWXl
 T5sYWry7aFYPTKtkp8O8880OtlS6dUo9YhDmzwcMWl3yGAzhKIGMSphQ/wcTdzYEOjgf
 eTBA==
X-Gm-Message-State: AOAM53181ce3BeECHrTiEYFY7R+kDe3DSdykgxNKklURdKRvbvwxWxRB
 RedUv5w6volZDDxxlw7mB8ohmJVw7M828g==
X-Google-Smtp-Source: ABdhPJz8AYsQhsym0sJT7iXgQzDc160OSbPUvoK6RQRKGBctju3EzPWrxHZsDnOEU/Lm99yGzdJssg==
X-Received: by 2002:adf:fa04:: with SMTP id m4mr31710312wrr.389.1639389211664; 
 Mon, 13 Dec 2021 01:53:31 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l9sm8577420wrs.101.2021.12.13.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 01:53:31 -0800 (PST)
Message-ID: <e93651ca-cacf-5a9d-183e-68488325aa27@amsat.org>
Date: Mon, 13 Dec 2021 10:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/4] hw/display: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211206224528.563588-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206224528.563588-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 23:45, Philippe Mathieu-Daudé wrote:
> Convert the open-coded vga_mmio_init() to a sysbus device.

> Philippe Mathieu-Daudé (4):
>   hw/display: Rename VGA_ISA_MM -> VGA_MMIO
>   hw/display/vga-mmio: Inline vga_mm_init()
>   hw/display/vga-mmio: QOM'ify vga_mmio_init() as TYPE_VGA_MMIO
>   hw/mips/jazz: Inline vga_mmio_init() and remove it

Queued to mips-next.

