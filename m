Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887143337D5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:52:01 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuZU-00037E-HM
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWX-0008Lg-L2; Wed, 10 Mar 2021 03:48:57 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWU-0007zp-IF; Wed, 10 Mar 2021 03:48:57 -0500
Received: by mail-yb1-xb31.google.com with SMTP id h82so16974233ybc.13;
 Wed, 10 Mar 2021 00:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9CzsEx8p7QL01ZrqtKj6ByxfBALbGPdHj05TOav/S6U=;
 b=MRkI1FE58F7UoV4KJb1uDVyCXLZdyLCu1P4Rv5mDF5kj3cyGVJ2T7bVjlthPvx1EdG
 a3eQE//J8TOiLuwOh8y8ovEn2jTLJCxH+OaOAtQFrtZhkn0TTKdgsuXCDN+3Dwbo73vX
 MkEDDOwiA1HuUd8+22C+rRuFGUmu390sjomPgkAMyibg6YPKmFg8nAzG5I/tjEJU/Ph9
 OrKlcgcknyuMKxcIdlKU82/4lZnmhED/J3cRoARBcPOJzcx0Tn1bjJ5vIYtodFZ/ubjx
 DYyh5cbquJe99u0m+xANqjBj8f2F4cDglLbpgKgteW9J+GnoqVpJKPbItviwuUlIEZhF
 pWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9CzsEx8p7QL01ZrqtKj6ByxfBALbGPdHj05TOav/S6U=;
 b=E/A2ZPwOFA9JvoyQEh5TxQ1upxQ0XjoJG5Ht56mxwdm9UIQuOIhLRxLvEPE4i6O68Q
 SQOfRL587YjygS8aUN0WJFlB28T9pUczU908gA8oLnTsH8tpm1EZu5RaDvYEDcJd9mML
 75WCckfMbbaz+/eIgmoMe+qpibpdKkIjpvSE6xor3rK5/HDNG6CauqBzh9Ir3aTDxTcz
 n+Apw+TeQiNHklMd3Jq/qYeyhpXwZBWGef6Y3gL4ua4xq5xoMhmJia+Z7JbOlfTe/lhG
 NItN2+RZY6ESuyUiWQ8lVsdc77S2EMkZedVTtsvZBeI6a1KrzrBWCWcDEVF5+lFzBPmW
 TCXg==
X-Gm-Message-State: AOAM533rRLACxT+j5z4+kX2xmvjzrNq7/GXWMCwcoxk5FFcR+qEf1Oka
 d/Zj3a195sSYZEuznQCvy7Imzq6XQJBnoqNZ44k=
X-Google-Smtp-Source: ABdhPJy7WAaHRpcsqK+23N9dnDnXli7nE3sXmh5UU+eGZsE5bH98TvLxuN79ZrG2EmfUD4AWBLTCz91kAn1VlKcUobc=
X-Received: by 2002:a25:d08d:: with SMTP id h135mr2827439ybg.122.1615366133379; 
 Wed, 10 Mar 2021 00:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-7-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-7-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:41 +0800
Message-ID: <CAEUhbmWNQxNnvGnvOfUTjppjRcb3jeT9axFDV81CD_jJfnvgSw@mail.gmail.com>
Subject: Re: [PATCH 6/9] hw/block/pflash_cfi02: Rename register_memory(true)
 as mode_read_array
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The same pattern is used when setting the flash in READ_ARRAY mode:
> - Set the state machine command to READ_ARRAY
> - Reset the write_cycle counter
> - Reset the memory region in ROMD
>
> Refactor the current code by extracting this pattern.
> It is used three times:
>
> - When the timer expires and not in bypass mode
>
> - On a read access (on invalid command).
>
> - When the device is initialized. Here the ROMD mode is hidden
>   by the memory_region_init_rom_device() call.
>
> pflash_register_memory(rom_mode=3Dtrue) already sets the ROM device
> in "read array" mode (from I/O device to ROM one). Explicit that
> by renaming the function as pflash_mode_read_array(), adding
> a trace event and resetting wcycle.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 18 +++++++++---------
>  hw/block/trace-events   |  1 +
>  2 files changed, 10 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

