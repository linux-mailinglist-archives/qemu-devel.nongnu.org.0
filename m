Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F0F609AB2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnHn-0004TS-7Y; Sun, 23 Oct 2022 22:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qviv=2Y=zx2c4.com=Jason@kernel.org>)
 id 1omgMI-0007gs-Hl
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 15:10:08 -0400
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qviv=2Y=zx2c4.com=Jason@kernel.org>)
 id 1omgMF-00014Q-Jr
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 15:10:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DD35B80D5F
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 19:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94EFC433B5
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 19:09:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Rxf4cNBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666552189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+xVLpe2ll3gczvzvPbhn6XJfh9pY8dHDYGHoV/FymM=;
 b=Rxf4cNBkAvVRP1NpnMiYXlKTPuqllNFjkHz/HTT2hZjGp/Uo2emDSc7dNHXyafuZz300FX
 6udHXimt2ubNH81L6fc1shZvvG5AfTmz52x2/3Yw3X1nW2IdZppRBUyBlcCJfQdANQJClO
 ESkSZ2qLhKrlFzCFJOpK/hGl/XYK3Xw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6cc54eb2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Sun, 23 Oct 2022 19:09:49 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id p89so4037068uap.12
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 12:09:48 -0700 (PDT)
X-Gm-Message-State: ACrzQf2yCzqMPyVtNnF8IiDdqvX6st3CjGLlRCz3zJ84ex78G/hM4IqN
 5CJfqlJWkz5HScB3agb8L8okEX8wyDxH8p3tYM8=
X-Google-Smtp-Source: AMsMyM4HW/jE5u9/XSuobygpBUu1yfdaIXxYF1Q9L4FD9DTqPeyyJBL/mo1fT9oq3j0SlIp5i2mIEvvoll3kEfYeYGw=
X-Received: by 2002:ab0:4467:0:b0:402:70c9:a0ce with SMTP id
 m94-20020ab04467000000b0040270c9a0cemr7476432uam.24.1666552187788; Sun, 23
 Oct 2022 12:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <fe30a5ce-f318-55f2-165f-b555e19f3160@vivier.eu>
 <20221017202952.60762-1-Jason@zx2c4.com>
 <e24ce881-2f0b-860d-05e5-a9a8a7dda3c8@vivier.eu>
 <CAFXwXrmNpYMBYC8A3kMMW3Jf3oHQurPwErHmrAh2Pjzf0==z_g@mail.gmail.com>
In-Reply-To: <CAFXwXrmNpYMBYC8A3kMMW3Jf3oHQurPwErHmrAh2Pjzf0==z_g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Oct 2022 21:09:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9oDuaukngYQDam3b1cybwP2cTw6vpn5Oh3uEhjzqf0_jg@mail.gmail.com>
Message-ID: <CAHmME9oDuaukngYQDam3b1cybwP2cTw6vpn5Oh3uEhjzqf0_jg@mail.gmail.com>
Subject: Re: [PATCH v4] m68k: write bootinfo as rom section and re-randomize
 on reboot
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=Qviv=2Y=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 22, 2022 at 8:41 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On Sat, 22 Oct 2022, 08:33 Laurent Vivier, <laurent@vivier.eu> wrote:
>>
>> Le 17/10/2022 =C3=A0 22:29, Jason A. Donenfeld a =C3=A9crit :
>>
>>
>> Notes:
>> - don't send your patch as a reply to a previous version
>> - add an history:
>>
>> v4: replace  (void *)(((unsigned long)base + 3) & ~3) by
>>               (void *)(((uintptr_t)base + 3) & ~3);
>
>
>
> QEMU_ALIGN_PTR_UP.

Will do. v5 on its way.

