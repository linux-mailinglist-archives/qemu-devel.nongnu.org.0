Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD229F6FA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 01:38:10 +0200 (CEST)
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2l2P-0008JV-9h
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 19:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i2l1X-0007qn-Ob
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 19:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i2l1W-0001mA-MB
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 19:37:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34720)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i2l1W-0001lg-GV
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 19:37:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id d3so301897plr.1
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 16:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lNhY61kCNEIlXahWpgFva8wdwRqrY6iHqmW7zL+QA1c=;
 b=ZqXVd+VPNQJ7zaIY0GGDgHSGVtt7Lb9uI5SGT/2vPP4MJTyAjiUl308xcacMQ7EZuB
 tE1YNWqJf+vX6hDq3foxX3uvlgQiP3I7qAPRbpHHsaWhRB6GbXc1qhBv8EAnTCzsxS1e
 hESZ3tTDQ+CeJgcjEwc8X4CKyKJRXOlMNUeO55R34jucab6qswwczn07Me/A/ve9wcYl
 jrPUTrN95cSfzb37LEmCP14p0baPtzgW9bP/IE4pSPSUwcFqMV7edC6iGKpcaHaPrtYp
 qtKiFa2hc9KLCs9u9gfxW6dtEEMGhGB2rcu5RIfLNUX4rpQWmVTrNsoNo88tBDHjsE5F
 hWGA==
X-Gm-Message-State: APjAAAUvx1PDp2i4CZZqTHeVNXin0HNB3ErQhV8AGqguwIV/h74UxBtW
 oHxeQFc5203X+snbflCIdF5NJg==
X-Google-Smtp-Source: APXvYqx3sCMeUWqzcXSF7WkmHfah3oitVBBEOB9dvULZyUOg+1fx23voBYgpP1e7KoyGOiUbNnPHFA==
X-Received: by 2002:a17:902:8492:: with SMTP id
 c18mr1458294plo.279.1566949032948; 
 Tue, 27 Aug 2019 16:37:12 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r4sm436454pfl.127.2019.08.27.16.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 16:37:12 -0700 (PDT)
Date: Tue, 27 Aug 2019 16:37:12 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Aug 2019 16:20:29 PDT (-0700)
In-Reply-To: <CAEUhbmWmCqCGpbw30QS_kYADnJkZOVUAn3eqmxLKPWhHjfuT7w@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-e8630d97-52b4-4626-a9ea-ccbc1c921d74@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
Subject: Re: [Qemu-devel] [PATCH v2] riscv: rv32: Root page table address
 can be larger than 32-bit
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Aug 2019 23:00:40 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Wed, Aug 14, 2019 at 5:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> Hi Palmer,
>>
>> On Sat, Aug 10, 2019 at 9:49 AM Alistair Francis <alistair23@gmail.com> wrote:
>> >
>> > On Wed, Aug 7, 2019 at 7:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > For RV32, the root page table's PPN has 22 bits hence its address
>> > > bits could be larger than the maximum bits that target_ulong is
>> > > able to represent. Use hwaddr instead.
>> > >
>> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> >
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >
>>
>> Would you take this one too?
>>
>
> Ping?
>
> What's the status of this patch?

Also in the patch queue.

