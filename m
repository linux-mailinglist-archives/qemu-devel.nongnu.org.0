Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1060572982
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:52:17 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOjo-0005ul-Kr
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNxP-000671-VA; Tue, 12 Jul 2022 18:02:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNxO-0000Fe-9b; Tue, 12 Jul 2022 18:02:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id v14so13011581wra.5;
 Tue, 12 Jul 2022 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/X7oG475OToGde1WcglsnfrSumq722jBoNVKL8pjo8=;
 b=QUSsXj9c2OjqATP7/qEPNG6ORKdVIBMghPo6ek72euGrAiOqOI6+J6/WsdQkUHknU9
 3pC/Va8dkdTmZBmdes/oBdm9ZyLzF09O/yMGVvDpJfR/zMTMTqproMEh6hMNADsAPjd9
 8eQa1VjzCOpskiBzeP5iiQITWhpVjQ/vm2MF4MpJIGvcsfaWW7Y12P0p5z0XGC+TDbVm
 X+ocNvMwv0Fo4qiRPm54BkA+C122K207TgGH4ojnHDIUzXP82YbqtLAFKqSq6AzsXhLf
 IkLr9SLyz4H+QsOk0clLrAFmGI+xjL1NFOsYUnj7DkncgWnrMmKOm+0dGptwB9N69yzN
 Xt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/X7oG475OToGde1WcglsnfrSumq722jBoNVKL8pjo8=;
 b=jxhUX/nO0RNE6zwhQP0MFOsT5VS7wRe+25AtlhX0VJcFjA5HKYl8KE1fQVvmet/lhT
 fxkXKijFUujtKJv+vFixrkFU0P6Wr7Et0X8NcvH3Q1TmGyFnlU6amG4gD6R59dpDf+F5
 sRfqXdtHdZSmuAgKKsPszvnvzBtvIWjvgnjjr5Ys35Uiqj33zcepLxjS4dgA63+xoDDT
 4HcNuNO1M7iInoAGFTjHl3+DG3tQg0ljHgcucg8pIH68nd7/txe83Pb+pBbAnnZYp3yw
 Zyq+uoLNiNYiMqciRx6QPUn32pGUWf7K1J04ez2fqGIhjyPCfyxQrRL7kw1s20sX66Hn
 8K4g==
X-Gm-Message-State: AJIora+minu7ZuD/wplfstmbgG7jE1xxqnQFKtl9jFLWTVDi00CqGRkQ
 xmWuqEXfdly8ZXvyuW5vY6Q=
X-Google-Smtp-Source: AGRyM1vz+4s18fbXroVLEJoBoVZ05e9bFMRYN8m/DaQSNkgTVZ7duMI67xCQ/XWNYfhgnR+F/ksAyg==
X-Received: by 2002:a5d:4e04:0:b0:21d:6ec3:38a2 with SMTP id
 p4-20020a5d4e04000000b0021d6ec338a2mr121386wrt.362.1657663332238; 
 Tue, 12 Jul 2022 15:02:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b0039ee391a024sm214416wms.14.2022.07.12.15.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 15:02:11 -0700 (PDT)
Message-ID: <1b32c77e-9460-e163-f5e0-9b26cb2447bf@amsat.org>
Date: Wed, 13 Jul 2022 00:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/40] PS2 device QOMification - part 2
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

On 12/7/22 23:52, Mark Cave-Ayland wrote:
> Here is the follow-on series from part 1 which completes the work to remove
> the legacy global device init functions for PS2 devices. Now that part 1 has
> been applied, the hard part to remove the PS2 function callback and argument
> has been completed and all that remains is to improve the PS2 device
> QOMification to allow the legacy PS2 functions to be removed.
> 
> Patches 1-11 update the pl050 device to remove the use of ps2_kbd_init() and
> ps2_mouse_init(), whilst patches 12-34 make some more involved changes to
> the lasips2 device (in particular completing the LASIPS2Port abstraction)
> before doing the same.
> 
> Finally patches 35-40 complete the process for the pckbd (I8042 and I8042_MMIO
> devices) before removing the now unused ps2_kbd_init(), ps2_mouse_init() and
> i8042_mm_init() functions.
> 
> Note that this series is a migration break for the HPPA B160L and MIPS magnum
> machines: I've had agreement from both Helge and Hervé that this is worth
> doing to allow the use of the DeviceClass vmsd property to set the
> VMStateDescription rather than manually calling vmstate_register().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Patches still requiring review for updated commit messages (no code changes
> from v1): 27, 28 and 34
> 
> v2:
> - Rebase onto master
> - Add A-B and R-B tags from Helge and Peter
> - s/jazz/magnum/ for consistency in commit message for patch 35
> - Update commit messages in patches 27 and 28 to clarify why the int_status
>    bitmap isn't immediately added to the vmstate_lasips2 VMStateDescription
> - Update commit message in patch 34 to detail the extra changes to the
>    vmstate_lasips2 VMStateDescription

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



