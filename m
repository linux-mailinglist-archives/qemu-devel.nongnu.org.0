Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5953068B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:31:55 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsu77-0003bz-QA
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsu4s-0002h7-ET; Sun, 22 May 2022 18:29:34 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsu4q-0006tR-RR; Sun, 22 May 2022 18:29:34 -0400
Received: by mail-pf1-x432.google.com with SMTP id h13so5861295pfq.5;
 Sun, 22 May 2022 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=36kH56MXj2vS/f1baq535OmNhPgotNq0slfSdgGopwY=;
 b=asQ8ASE0x4j3stbvC1yxlUvIE926fFiCSXXCbzgQdBriQ7J0Mb1RH5+w2wgYSQuXMU
 lPvprv0/N+Kxrl/27U/k/+b6x78AQ+Z6Sm3dWFDEz/x8IODJeRgz6XggnSh4lgxkem4j
 e9SWZXj9KULT1bwgfsIVu/DYdLecqLlnSnM8Suz3PQp81jcaLuCTUlo9bu9C0WCtQC3P
 43mH/MglTPkgJHpW/0Owlo7g991+4VjWfNgIwHUzhl05yunoYG+0U0cKI+8Wfu+Vii25
 ofmnHPo16L3XGt6NDqV7m5zd+OCw2ELkVz8HK2VVmWCjsXD4lQQccNBagYQ/GRxtCzhT
 EA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=36kH56MXj2vS/f1baq535OmNhPgotNq0slfSdgGopwY=;
 b=qUfrJlsCCF7995WC5DpvCaGghkKgxc7vBw7ICpbYZJbe8Pl6mVPzPGZy6wh7+BZu7e
 OUIJHPET39yTkI+P63bN8ZmZn0MrlafAwgfEQXxJrCU4yIJqziBtguVEMYVkHi8SLUSW
 HjMEgkrww3lh8OStC6FCuGbSqMx+5o/5iDMLvLmNFz3fMaDdO96D5Kz1RK4FcJU7iRr2
 XNW9ZR4D9E8zOgcGY+gYXlafLMdOl9vqnax2PrPA6lsHpkVxn7PEGBviP4QdinV6gaym
 IuQCFmQFgPLZwTo33jq2EmiZtk8d//DPHCiCV4NjjGpdlCe9cwKuSq8X+4m3BKLd1RkU
 e+hQ==
X-Gm-Message-State: AOAM531tHr1lqO9OoIoqj3b4qQE6HgQ1IUBD2fPq9a8MAj86vN2Ius4m
 RzP8VI2Lh3P6Awv61fKIxEo=
X-Google-Smtp-Source: ABdhPJzX7J7F87HpVqD/iuglfNO36aMNSSDl74UGJOtuUsrwMR5waCBy9CKQanBZwPupdk+Jp8cEMw==
X-Received: by 2002:a05:6a00:2481:b0:50d:4839:5896 with SMTP id
 c1-20020a056a00248100b0050d48395896mr20965206pfv.37.1653258570918; 
 Sun, 22 May 2022 15:29:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a170903411200b001619b47ae61sm3564486pld.245.2022.05.22.15.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:29:30 -0700 (PDT)
Message-ID: <2de65552-2c29-549a-3839-65cd3d090f3a@amsat.org>
Date: Mon, 23 May 2022 00:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 00/50] PS2 device QOMification - part 1
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
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

On 22/5/22 20:17, Mark Cave-Ayland wrote:

> Mark Cave-Ayland (50):
>    ps2: checkpatch fixes
>    ps2: QOMify PS2State
>    ps2: QOMify PS2KbdState
>    ps2: QOMify PS2MouseState
>    ps2: move QOM type definitions from ps2.c to ps2.h
>    ps2: improve function prototypes in ps2.c and ps2.h
>    ps2: introduce PS2DeviceClass
>    ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
>      ps2_common_reset()
>    ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
>    ps2: implement ps2_kbd_realize() and use it to register
>      ps2_keyboard_handler
>    ps2: implement ps2_mouse_realize() and use it to register
>      ps2_mouse_handler
>    ps2: don't use vmstate_register() in ps2_kbd_init()
>    ps2: don't use vmstate_register() in ps2_mouse_init()
>    pl050: checkpatch fixes
>    pl050: split pl050_update_irq() into separate pl050_set_irq() and
>      pl050_update_irq() functions
>    lasips2: spacing fixes
>    lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
>    pckbd: checkpatch fixes
>    pckbd: move KBDState from pckbd.c to i8042.h
>    pckbd: move ISAKBDState from pckbd.c to i8042.h

Patches 1-20:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

