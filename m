Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE72E8E23
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:43:32 +0100 (CET)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwADr-0006zI-RD
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwACv-0006G5-LA
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:42:33 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwACu-0002nk-7p
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:42:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w5so29395778wrm.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=14YGCyQcsTpUXqnLyua3YyqyXQgpQUbwAidVZPQRmp8=;
 b=NyjTdAlVVl8OxJNjKlIS0wUtSjVNhphapn5tov6fKn1LBfVEEbW8JsAp2MueDOrSQz
 upj6+3ojZUJFBQ7pPHrUotzn3Q+phIC3w7XNJrcWZRupOl+99uTq/FCmxdU2QcxaDJON
 0cmF3rZ3AG+34Mi5XDWpCwBXsDAhvcBCCNiP3yAvmyXi8YeIeSaqnHmBeygpYNhxJW0x
 3jDCKGFFiizxhwYRrGDl8MvciTMHwesGUX+ZiFdyMorPEmFrpOMx7UC2G9lAe2hRRULU
 Wtd20LB1gxR9icp/oU0OUg72UXJQlnYiEKLN4lFIIPayB509giMB7m5ZLSWy3iXXMrDM
 ROYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14YGCyQcsTpUXqnLyua3YyqyXQgpQUbwAidVZPQRmp8=;
 b=n6WZ2kCQKTc2ntYk3pdrLEipdhhb4rF2dmxbu32oUd5spbT1GgKNpcuXdI13NOGSEk
 YxZhLL+IDk7Wclq93/KrGXvuOY/Mj9Ij7J2rg6wHueAISr9LVnWwTgcHL8W+Ib9mHs3s
 z8hAbRW9NeG2tjyTr8K1LsplRqQcbmczXaqCeop3XN+NGEy3RzIMDonoO9tJiraawTuT
 /f1MakARvVH7Tcs4ylg5jgar5wh47MV2RqQpGAdebC4tDk4r0e07i7Bi0+PJBR6bydQC
 L3K53+OMwOQLJzXU75paEaYjlmSgaInRlsVptZsZQoI3Td0yZG/62cRj0DFXux9sw9CE
 SOdA==
X-Gm-Message-State: AOAM533M0PMYA3PCHSOFcKZKDeWLraRJ8gv3CbNrJ0eB/qbWZZIYp2JG
 ljuESNaNIEYf4hdArb8D3CI=
X-Google-Smtp-Source: ABdhPJzanoWAuxuu/s3GT2qz5UUn2JkD7CtuDj7gzaEep1jldjaUEXUdcOt3hOPp96GaXijwS8gydA==
X-Received: by 2002:adf:fd42:: with SMTP id h2mr76692296wrs.142.1609706550873; 
 Sun, 03 Jan 2021 12:42:30 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id n14sm29245425wmi.1.2021.01.03.12.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 12:42:30 -0800 (PST)
Subject: Re: [PATCH v2 0/8] MIPS Bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f96001e4-5ef4-3d22-5372-45687761a951@amsat.org>
Date: Sun, 3 Jan 2021 21:42:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:41 AM, Jiaxun Yang wrote:
> v2:
> A big reconstruction. rewrite helpers with CPU feature and sepreate
> changesets.
> 
> Jiaxun Yang (8):
>   hw/mips: Make bootloader addresses unsgined
>   hw/mips/malta: Use address translation helper to calculate
>     bootloader_run_addr
>   hw/mips: Use address translation helper to handle ENVP_ADDR
>   hw/mips: Add a bootloader helper
>   hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>   target/mips/addr: Add translation helpers for KSEG1
>   hw/mips/malta: Use bootloader helper to set BAR resgiters
>   hw/mips/boston: Use bootloader helper to set GCRs
> 
>  hw/mips/bootloader.c         | 157 ++++++++++++++++++++++++++++++++
>  hw/mips/boston.c             |  62 +++----------
>  hw/mips/fuloong2e.c          |  48 +++-------
>  hw/mips/malta.c              | 171 ++++++++++++-----------------------
>  hw/mips/meson.build          |   2 +-
>  include/hw/mips/bootloader.h |  48 ++++++++++
>  target/mips/addr.c           |  10 ++
>  target/mips/cpu.h            |   2 +
>  8 files changed, 306 insertions(+), 194 deletions(-)
>  create mode 100644 hw/mips/bootloader.c
>  create mode 100644 include/hw/mips/bootloader.h

Patches 1-3 queued to mips-next.

