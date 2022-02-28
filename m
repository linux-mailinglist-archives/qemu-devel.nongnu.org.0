Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A984C7E24
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 00:14:41 +0100 (CET)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOpE0-0006B2-3v
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 18:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOpBG-0004mI-0p
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:11:50 -0500
Received: from [2607:f8b0:4864:20::636] (port=35585
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOpBE-0006G7-IV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:11:49 -0500
Received: by mail-pl1-x636.google.com with SMTP id i1so11998222plr.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=X960JhOB+xNNlDyiGEI3W4W2r84WehBPfi7PuMEl6fs=;
 b=WIReuTokY2a7zYGk6b/VdwQLHK83Opq+O+Rl+pKnRr30NoyxnjY4ornbqJy5sKABPW
 2IxE9MY9HShgIQIO2yER56QdBGanDs1ZVOPudugIK/uIC2Ru5ZDGtMObQA19J4EXk5qm
 AiiQu3pc9OdmzU9p01AT31DKx+/3S8HFlmUlO3y/YymxFeT34TjlfMaESMbzAPsHb/1E
 Rb+SpaCc+k9CADVzA7GKdAbHwnL4b5ZV0CQesT1uqKEfky+qI32YPVpYo7AS8763/Tdd
 C4WnY5X4jz4rBw5ZPqYSopiCyySuffSvQrRVdAZLlNHbwYR74QASfTACi/ifRwPmnD/G
 tFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X960JhOB+xNNlDyiGEI3W4W2r84WehBPfi7PuMEl6fs=;
 b=ioF2oCgypmv1GQWA8LFn2gjPmPUfgFdUtjRDO/cVUjKh9n8SOXki/v5EZnOIUFKvWz
 RaUye6sqg4tu+4rfHs9Uuh7Cr7Z+LuUZkTNW+qEzMbPG8wZDxmmEbnv7uDDDtC/3NP+d
 DyQpjTpvU+FRzHf4ydDgademecRUG2n221kW7jLXvCBkgOYVEjaweZNMlBgcxoixaV5v
 lBcRUM6ru2zGBQzOlUKPxFtrJyDqg/w0xRMj1NjFeOBrLyWQBTy/5mAxuAX86CRWv8K+
 UvFaij/7JKaAgbpdLVy7FJ7miZq7zab3hMTGMjIT0141Li+lIulok5CqZko3d9f7gTCB
 m8xQ==
X-Gm-Message-State: AOAM532X70Q+SwQZLAjijB9TJBoWDet/DZzHoGQTwVVMpCKwrMI1Ilv2
 VxdR+j+TxuabE8cZkvNCKgo=
X-Google-Smtp-Source: ABdhPJwswwvVoM5K0PBaAimQQumaNARL3hPuSRwYSlpeUOwQq9OjKDWDxrae8L2suP67npWuHs3kvQ==
X-Received: by 2002:a17:902:db0f:b0:151:5fbb:5f4b with SMTP id
 m15-20020a170902db0f00b001515fbb5f4bmr9325878plx.36.1646089907020; 
 Mon, 28 Feb 2022 15:11:47 -0800 (PST)
Received: from [192.168.1.115] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa788d6000000b004f1335c8889sm14782227pff.7.2022.02.28.15.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 15:11:46 -0800 (PST)
Message-ID: <c1ffcf43-d4a9-4c56-a9c2-1cc09c5b6433@gmail.com>
Date: Tue, 1 Mar 2022 00:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 02/10] macfb: don't use special irq_state and irq_mask
 variables in MacfbState
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 pbonzini@redhat.com, fam@euphon.net, qemu-devel@nongnu.org
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
 <20220228222527.8234-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228222527.8234-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 23:25, Mark Cave-Ayland wrote:
> The current IRQ state and IRQ mask are handled exactly the same as standard
> register accesses, so store these values directly in the regs array rather
> than having separate variables for them.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c         | 15 +++++++--------
>   include/hw/display/macfb.h |  2 --
>   2 files changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

