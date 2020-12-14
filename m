Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FA2D915A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:13:19 +0100 (CET)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobUM-000449-2o
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobSk-0003Yb-Sr; Sun, 13 Dec 2020 19:11:39 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobSi-0004sm-SO; Sun, 13 Dec 2020 19:11:38 -0500
Received: by mail-wr1-x441.google.com with SMTP id a12so14702065wrv.8;
 Sun, 13 Dec 2020 16:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qkMQV3cXRbzF/hBp73zazWCeTJbMonnL/lFhUDSLgSc=;
 b=DeJYEsavhRtDpMCDbFIOq9/T7nODx7oXmH0piEgI54WOi7Quf3PXnG+Rdv+/uLMkt7
 rFCKhP3bMKpg/eE8aeghtjlJovNrFhXmk+oCDyxRYIRHPmrUMiKjhDRUu2ywsa2xPebR
 LBD/+3e259JI7De3KWiZ7iDxrSpY0hcqnE0mh+7Vr4VWXcJBvLIarcWjVqZhGQNq6H6f
 o9+Tco7aUj1KIXR51LUpBh5afTrL0Gz85hrrt7xD3zWtv9t6KSIvYb2rfbhuY1MVHuBh
 TqVg7OzVQlHH8VfwyNPjA00dx9MkVhNnss/qFBUC8dAyyzOcc4Mhu9zdpJIHGpcZgGOw
 8BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qkMQV3cXRbzF/hBp73zazWCeTJbMonnL/lFhUDSLgSc=;
 b=MuEdOSjjlAVztvaYRJMS8oiT5KLD6nzTj2tdvEjkZuEmjkRIirzgrrQTjBJWnct5oX
 EAu5JkFtdJTVrqdajVW2AYscrRWVN2BFqt69dJQnRTRr1a+63EVTyD7dZsdxPVvNY+El
 Ja6/FcZU6S5XsQRfFTUEHpHJsD8oAiWrKjom1asOaMMALn3dyiq8y9bgIINVshrNTcKg
 tncEC/AahW0IREakOZFwLGDDvsQZT2tOXbiTo/KVGcNODPTZTfgOC2sWgmuaB3netlZg
 pXLBJKf0/1Cur6nAO4PWCWuTtI2cJ87GEllFTwsLvu5x2sGqpRpks5OD3BS4GcS1F91k
 xKFw==
X-Gm-Message-State: AOAM530xmozUrb9nqFwekjSc0eHqgE83o8VXu2QeMFic2X/wZaSunrEY
 XiCJxbCSWt0wgf5qTV2U3i0=
X-Google-Smtp-Source: ABdhPJxEX/hiyVh/IadfkTgUqnYm0QnKL4gV5/ICmzuvAxXGRehERUhe4Eyey9wdtI0q6HhfFRA+tQ==
X-Received: by 2002:adf:c589:: with SMTP id m9mr25877209wrg.370.1607904693585; 
 Sun, 13 Dec 2020 16:11:33 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v7sm27713470wma.26.2020.12.13.16.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 16:11:32 -0800 (PST)
Subject: Re: [PATCH v2] hw/block/nand: Decommission the NAND museum
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200915171639.1355800-1-f4bug@amsat.org>
 <CAFEAcA-YEYbLiDpx37cPF40giyr340Gx+V+Vbx+mdxiDZC_qxA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e23874c2-e51e-f88f-461e-4bb8b7ee4892@amsat.org>
Date: Mon, 14 Dec 2020 01:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-YEYbLiDpx37cPF40giyr340Gx+V+Vbx+mdxiDZC_qxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/20 6:05 PM, Peter Maydell wrote:
> On Tue, 15 Sep 2020 at 18:52, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> This is the QEMU equivalent of this Linux commit (but 7 years later):
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7025a43a9da2
>>
>>     The MTD subsystem has its own small museum of ancient NANDs
>>     in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
>>     The museum contains stone age NANDs with 256 bytes pages, as well
>>     as iron age NANDs with 512 bytes per page and up to 8MiB page size.
>>
>>     It is with great sorrow that I inform you that the museum is being
>>     decommissioned. The MTD subsystem is out of budget for Kconfig
>>     options and already has too many of them, and there is a general
>>     kernel trend to simplify the configuration menu.
>>
>>     We remove the stone age exhibits along with closing the museum,
>>     but some of the iron age ones are transferred to the regular NAND
>>     depot. Namely, only those which have unique device IDs are
>>     transferred, and the ones which have conflicting device IDs are
>>     removed.
>>
>> The machine using this device are:
>> - axis-dev88
>> - tosa (via tc6393xb_init)
>> - spitz based (akita, borzoi, terrier)
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Peter, as 4 of the 5 machines are ARM-based, can this go via your tree?
>> ---
>>  hw/block/nand.c | 13 ++++++-------
>>  1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/block/nand.c b/hw/block/nand.c
>> index 5c8112ed5a4..5f01ba2bc44 100644
>> --- a/hw/block/nand.c
>> +++ b/hw/block/nand.c
>> @@ -138,7 +138,7 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
>>  # define ADDR_SHIFT            16
>>  # include "nand.c"
>>
>> -/* Information based on Linux drivers/mtd/nand/nand_ids.c */
>> +/* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
>>  static const struct {
>>      int size;
>>      int width;
>> @@ -154,15 +154,14 @@ static const struct {
>>      [0xe8] = { 1,      8,      8, 4, 0 },
>>      [0xec] = { 1,      8,      8, 4, 0 },
>>      [0xea] = { 2,      8,      8, 4, 0 },
>> -    [0xd5] = { 4,      8,      9, 4, 0 },
>>      [0xe3] = { 4,      8,      9, 4, 0 },
>>      [0xe5] = { 4,      8,      9, 4, 0 },
>> -    [0xd6] = { 8,      8,      9, 4, 0 },
>>
>> -    [0x39] = { 8,      8,      9, 4, 0 },
>> -    [0xe6] = { 8,      8,      9, 4, 0 },
>> -    [0x49] = { 8,      16,     9, 4, NAND_BUSWIDTH_16 },
>> -    [0x59] = { 8,      16,     9, 4, NAND_BUSWIDTH_16 },
>> +    [0x6b] = { 4,        8,        9, 4, 0 },
>> +    [0xe3] = { 4,        8,        9, 4, 0 },
>> +    [0xe5] = { 4,        8,        9, 4, 0 },
> 
> This line adds an entry for 0xe5, but there is already one
> further up in the array (you can see it in this hunk).
> 
> More generally, it doesn't seem to match the referenced
> kernel commit, which deletes 14 lines and adds 5
> (which are a subset of the 14 deleted, really, so
> they probably show up for us as "9 deletions" since
> we don't have the #ifdef...#endif the kernel does).

Well, this is what this patch intended to do...
14 deletions:

-    [0x6e] = { 1,      8,      8, 4, 0 },
-    [0x64] = { 2,      8,      8, 4, 0 },
-    [0x6b] = { 4,      8,      9, 4, 0 },
-    [0xe8] = { 1,      8,      8, 4, 0 },
-    [0xec] = { 1,      8,      8, 4, 0 },
-    [0xea] = { 2,      8,      8, 4, 0 },
-    [0xd5] = { 4,      8,      9, 4, 0 },
-    [0xe3] = { 4,      8,      9, 4, 0 },
-    [0xe5] = { 4,      8,      9, 4, 0 },
-    [0xd6] = { 8,      8,      9, 4, 0 },
-
-    [0x39] = { 8,      8,      9, 4, 0 },
-    [0xe6] = { 8,      8,      9, 4, 0 },
-    [0x49] = { 8,      16,     9, 4, NAND_BUSWIDTH_16 },
-    [0x59] = { 8,      16,     9, 4, NAND_BUSWIDTH_16 },

and 5 additions:

+    [0x6b] = { 4,      8,      9, 4, 0 },
+    [0xe3] = { 4,      8,      9, 4, 0 },
+    [0xe5] = { 4,      8,      9, 4, 0 },
+    [0xd6] = { 8,      8,      9, 4, 0 },
+    [0xe6] = { 8,      8,      9, 4, 0 },

When combined, the resulting diff is:

-    [0x6e] = { 1,	8,	8, 4, 0 },
-    [0x64] = { 2,	8,	8, 4, 0 },
     [0x6b] = { 4,	8,	9, 4, 0 },
-    [0xe8] = { 1,	8,	8, 4, 0 },
-    [0xec] = { 1,	8,	8, 4, 0 },
-    [0xea] = { 2,	8,	8, 4, 0 },
-    [0xd5] = { 4,	8,	9, 4, 0 },
     [0xe3] = { 4,	8,	9, 4, 0 },
     [0xe5] = { 4,	8,	9, 4, 0 },
     [0xd6] = { 8,	8,	9, 4, 0 },
-
-    [0x39] = { 8,	8,	9, 4, 0 },
     [0xe6] = { 8,	8,	9, 4, 0 },
-    [0x49] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
-    [0x59] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },

But trying to commit that I get (while only removing lines!):

ERROR: code indent should never use tabs
#14: FILE: hw/block/nand.c:150:
+    [0x6b] = { 4,^I8,^I9, 4, 0 },$

ERROR: code indent should never use tabs
#15: FILE: hw/block/nand.c:151:
+    [0xe3] = { 4,^I8,^I9, 4, 0 },$

ERROR: code indent should never use tabs
#16: FILE: hw/block/nand.c:152:
+    [0xe5] = { 4,^I8,^I9, 4, 0 },$

ERROR: code indent should never use tabs
#17: FILE: hw/block/nand.c:153:
+    [0xd6] = { 8,^I8,^I9, 4, 0 },$

ERROR: code indent should never use tabs
#18: FILE: hw/block/nand.c:154:
+    [0xe6] = { 8,^I8,^I9, 4, 0 },$

So I changed the tabs by space and committed.

TBH I don't understand what happened. I suppose I
messed while replacing tabs by space... I feel
ashamed, sorry.

> 
>> +    [0xd6] = { 8,        8,        9, 4, 0 },
>> +    [0xe6] = { 8,        8,        9, 4, 0 },
>>
>>      [0x33] = { 16,     8,      9, 5, 0 },
>>      [0x73] = { 16,     8,      9, 5, 0 },
> 
> thanks
> -- PMM
> 

