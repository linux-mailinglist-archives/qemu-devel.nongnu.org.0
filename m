Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1F2E10FE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 02:03:23 +0100 (CET)
Received: from localhost ([::1]:42512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krsYj-0003PC-Pw
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 20:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krsWr-0002vI-Vs
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 20:01:29 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:43847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krsWo-0007TA-2r
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 20:01:24 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id y14so3358299oom.10
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 17:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQAyLC7kxYPIYl6NHOL3wHxxomzOA+9wdpBm72JR8zw=;
 b=GuPDRrNYbX9PaUgTNWcjAd31vGnZHuK61Ds4nSY/Oj5NNaLMW8Xp7f/tRON1TuSoAw
 SUuhA5rSgFsUxSML1bIC2hItRq1s8voGS8McaWnvoMQrVbPA8uiSGfShrZbuHA1j52zW
 YvVyewdqBFrljCMSDb9xFMbKJbQBZlGxnCDa1+nBnvm9Mtm0p16FqLEhuesGqxxvYxXA
 4eAzxbrbqd3dMBTFNbgSBhAE6lvncVNPVTmIO34bBPP6Y+b0bALxEG8tKUCvWovbMLXZ
 A6OFK28tlhfO+9yLGwp1kUjoFm1E1phmU+ar5n20Swmemn0T0xUzBZ+PUP5tmvhhY6Wo
 7x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EQAyLC7kxYPIYl6NHOL3wHxxomzOA+9wdpBm72JR8zw=;
 b=VBdb6Gj52w6IJyZgumR5OSpC/R05XizLngSI+/VnzaMWojYs3+aFWCAJLQrsR5oBwt
 5Y0u63HdxYZZC29vlpR6cYRhHDEt6NnyW8ahAGCgGGOmY9mFEPQBQVrwTCNodkFckJ1X
 i4w0zQYaNXCyx2BX/tb2EgsZxisKEho3RB0ueakknLfrHtyshugJ7rnqFKk/dun3fCGC
 SkUIYTIO+shb6v6gilou+yD5Z1zIPEGkMdY2a5KZZ0Ma5xswuiZ0jJctFq+lXv7KQOLG
 biREIIFsSwzmzR5Fl83JTd3OmemgV/6UxXlxglHgoVcC5KvfZnHPmEiv7bK6YSWD661e
 Lvlw==
X-Gm-Message-State: AOAM531H9h6TVxWiSuvgKfxBp2aiIn26dfurO7sU41KqqZpleOk40ejY
 ODoqBpram+0eL4m2KozwLq8=
X-Google-Smtp-Source: ABdhPJxpthH9t9Bjy7vNcNzF3f725cflVjaCwmA6gIfTYX3IJ51WyEh1e060MquGnsLBBMn7X7JL9g==
X-Received: by 2002:a4a:e687:: with SMTP id u7mr16772408oot.20.1608685279891; 
 Tue, 22 Dec 2020 17:01:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t26sm4850034otm.17.2020.12.22.17.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 17:01:18 -0800 (PST)
Subject: Re: Problems with irq mapping in qemu v5.2
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
 <e2a1818e-366d-8a58-ce-e3eacb6787d7@eik.bme.hu>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d337ba4c-3cd2-eb1a-4867-5e93bf510e4d@roeck-us.net>
Date: Tue, 22 Dec 2020 17:01:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e2a1818e-366d-8a58-ce-e3eacb6787d7@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 2:57 PM, BALATON Zoltan wrote:

[ ... ]

> I've already forgot about the details but we have analysed it quite throughly back when the via ide changes were made. Here are some random pointers to threads that could have some info:
> This was the final solution that was merged as the simplest that worked for all cases we've tried to fix:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg03977.html
> 
This set of patches is in v5.2, yet I can still not instantiate an IDE drive, at least
not with "-drive file=<filename>,if=ide". Is there some other means to instantiate
an ide drive with the fuloong2e emulation ?

For reference, here is my qemu command line:

qemu-system-mips64el -M fulong2e \
    -kernel vmlinux -no-reboot -m 256 \
    -snapshot -drive file=rootfs.mipsel.ext3,format=raw,if=ide \
    -vga none \
    --append "root=/dev/sda console=ttyS0" \
    -nographic -serial stdio -monitor none

Thanks,
Guenter

