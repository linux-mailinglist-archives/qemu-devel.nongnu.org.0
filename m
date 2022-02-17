Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61D4BABD5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:36:59 +0100 (CET)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKoSP-0003ZR-Mr
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hamachiach81@gmail.com>)
 id 1nKnCf-0005QF-S2
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 15:16:38 -0500
Received: from [2a00:1450:4864:20::533] (port=44652
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hamachiach81@gmail.com>)
 id 1nKnCd-0004zq-Oz
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 15:16:37 -0500
Received: by mail-ed1-x533.google.com with SMTP id x5so11647347edd.11
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:date:mime-version:user-agent:to:content-language
 :subject:content-transfer-encoding;
 bh=bXUVYmxmr2BWnCFpLSUhWOOG0HMrohicF0qi9WuXILE=;
 b=bg6WoKUmQu44kePgLWhheNQvgFbb7f4GRo6mPN+TpKQr5kU4BizGrxyKVYdSFed6vB
 kHnCe1P9iItS7qZSrdaZw1sYDu8Jk9IRoNRUdV8xPKbBicB6S18ZwX87kj4FC6nK2umK
 W5+ogUxaXbpyIAA3ezo6HpQUZzDX5DmE0f4dARm7qA9Rrda8sNi2hVSZbYkwlCfZyNJ8
 iCyzeAksVsEzgjFcX+xgEh/+7Ejb9oqkBnmCVfra29643a7/cIL1DqR3KStHxdqwT9qS
 MU/kHkHbGC2BxDlSW6YJW5u6OU4tyGVnAE9jUkLZezyoheFnH26X1Zc0yOmPJKxjrDXe
 3KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent:to
 :content-language:subject:content-transfer-encoding;
 bh=bXUVYmxmr2BWnCFpLSUhWOOG0HMrohicF0qi9WuXILE=;
 b=xPSF1GOADrYUAaV07j/eD4GCBNCd7yEbQWCLlaFs7twBnT+ZLuBhcNjYhAhP9l4Llp
 rghO778n/+er71cjhs1KrhmjwPAFXwPsIB7g4lc6XbkW9NRaE6xRNdpAQ4mJYmUEFjAl
 OAb0BVIISXH23iamIckUygYKCp06is59q4bI7XmykDKaS6zOu0rABPWjwFoduQv3/dbw
 idWqBg430+Ivby/+BL92DnfUCcMujzIUhqwjBAzSb/NLCoI9MTd45nFKLBlv52CzyJ4k
 JhJ1luNkPo6X69ONTTF09d32Ze+yl+kj1IiDQl4dqSQbXuOkDjcNym2rNvXEPYiZ4vvT
 SNBQ==
X-Gm-Message-State: AOAM531sgmGSKbrATgreZCojMu7XJx8QdOnFrVBvRdR8JEn9LHloH/Ja
 6LXc4yzi2v1VhsY7a1orl6FSRSbAUps=
X-Google-Smtp-Source: ABdhPJxI0sLkho8KgHFOwFIHRzcRcIvLID95bRfx+5TqrP9OJE7c3HRvRbXlmUok3RCP5Nyj0mfMUw==
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id
 f11-20020a0564021e8b00b003da58e69a09mr4598146edf.155.1645128993037; 
 Thu, 17 Feb 2022 12:16:33 -0800 (PST)
Received: from [192.168.178.38] (dyndsl-091-096-223-141.ewe-ip-backbone.de.
 [91.96.223.141])
 by smtp.gmail.com with ESMTPSA id bo11sm1494166ejb.24.2022.02.17.12.16.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 12:16:32 -0800 (PST)
From: Anon Anonymous <hamachiach81@gmail.com>
X-Google-Original-From: Anon Anonymous <Hamachiach81@gmail.com>
Message-ID: <96f6290f-9465-eac6-2810-5e027d5e3281@gmail.com>
Date: Thu, 17 Feb 2022 21:16:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: qemu-devel@nongnu.org
Content-Language: en-US
Subject: A Virtual Bios in Qemu with GUI by Boot QEMU with SHORTCUT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=hamachiach81@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Feb 2022 16:33:57 -0500
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

Hello can you build a Virtual Bios with Hardware Simulation Emulation 
and change Hardware?

CPU Option = CPU x86/x64/SPARC/ARM/ARM64/ANDROID/IOS/MAC

CPU Standard Config Name = Original CPU in HArdware or Simulation 
Emulation All INTEL CELERON, CENTRINO, ATOM, PENTIUM (MMX) 1234, 
i3,i5,i7,i9 , ALL MAC Processors, ALL AMD Processors, ALL 
HANDY/SMARTPHONE Processor, ALL ONE PLATINE CPU and Hardware Raspberry 
Pi ZERO, 1, 2, 3, 4, CM4, 400, RockPI and all other or Optional Config 
and Retro Computers AMIGA, COMMODORE, SPEKTRUM, SINCLAIR, PC IBM DOS ALL 
8086 up to 486 CPU

CPU Core MAX USE MANUAL OPTIONAL = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 
12, 13, 14, 15, 16, up to 256 Cores.

CPU Core Speed min. 1 MHz up to max. CPU Speed from Hardware

CPU Architecture Simulation 8-bit, 16-bit, 32-bit, 64-bit (Future: 
Quantum Processor)

GPU Grafic Card Simulation Emulation = Orginal GPU from Hardware or 
simulated emulated all Graficcard from RETRO MATROX S3 NVIDIA ATI 
DOS/WINDOWS and all other from other hardware

GPU Grafic Card Space from 128 Kilobyte up to max Speed GPU.

GPU Grafic Card Core = 1 up to max from graficcard Autodetection

1 - 4 Graficcards

Architecture Graficcard from 8-Bit up to 64-Bit

Graficcard Simulation = Hercules, CGA, EGA, VGA, SVGA and greater 4:3, 
16:9, 16:10

Graficcard Min Size max Size = ALL DOS 320x240, 640x480, 1024x768, 
1280x1024, 1600x1200, HDREADY, FULLHD, 2K, 4K, 8K

RAM from 0,5 MB up to Max hardware.

mount 26 Drives Floppy, Harddisk, SD-Card, CD/DVD/BLURAY REAL SATA / USB 
or Emulation Hardware Controllers Master SLAVE IDE/ATA FDD or Image file

Sound Card EMulation Real or Creativ Soundblster, Terratec, Roland, 
Adlib, or / and PC Speaker

Boot Option 1234

1=First drive Boot or USB Boot

2=Second Drive (image) Boot or USB Boot

3= third drive boot

4=fourth Drive Boot


And i can change with File Folder Image File by Short Cuts in System 
CD/DVD/BLURAY/FLOPPY IMAGE


Best King Regards




Daniel Frank Nommensen


