Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02B4E80E9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 13:48:02 +0100 (CET)
Received: from localhost ([::1]:40558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY5po-0006MG-TP
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 08:48:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY5nq-0005VK-Ic
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 08:45:58 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=46708
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY5nn-0006pq-Qq
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 08:45:57 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d134so7569864ybc.13
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 05:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mSWQUM0nAJAjypMPRTfJNi1+Z3k1bfptyBppjV2rZFk=;
 b=F9wl+8cdK/fEkdcpApjVCSd7OK5+acRhxyui4Y551d+nYCjXwyXsMOpfOk/KKAXv+X
 mSXtNKG/ppMpkarhKCirC8sFxqyIygAtDCmUKHvnzHGJtq5JfcsdFS0Knzo4ruWwtcuA
 tC4IopgwwrijesiWoHfP20iZTYDcWQcXaRumvzQWXqKbRrP6q8CjQCewYgHIP6tHDCU2
 3ZMpB+Dq9vKCTF/R3SENpUyvWPpfRIbEdArg7FEXl65tGmgaiRZ2fg2yHUOChET3wy61
 HmUQwuzgSY24qbIBC3rz8ljxKPf/vW9Pey7YP2Uxy+n2mookeyc/vb6TFwCDJpHolEXL
 Bv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mSWQUM0nAJAjypMPRTfJNi1+Z3k1bfptyBppjV2rZFk=;
 b=ELjAsjVOcBa0Qx/phdvIL3I8f0TZBIvXMgMpWBx2L7adeLwg4x5WVbuDb1TFiUwvdt
 Lighnpervn4AGES/BKYQAXdvXToZDgL7MEsyXo91ebggI7NjAnRGJc14rFVPGDNL9Nce
 J9LffaUPtRgoIyW4b6mc4x9Ib+yDILuD/zLBS+FylASlWFrigf09PVtiYy81KUpEW+Kv
 yBCfyQDTxhcjgnOKuWxz45i/tnIcUWsbPisY/581fF70CsoJYPvqREr9Y7YDoGBg+bNe
 tA+tFgZQwe1RzlDOwE7JVLNx2waaIimxBNDWazXf0UIApQ7y4Z62zJBywpGEo/PIh98Z
 qEZQ==
X-Gm-Message-State: AOAM533rEDOvvUuvFf/3jnGrr7eH9G98i5yh4e6W753k2uZ8aNaahv2U
 OI1IqaCOIdf6xtWgcausL9WP3l2hZ7FOFy60m7BGiA==
X-Google-Smtp-Source: ABdhPJxKZNyXR5/XTJjpx7gdBeff91GjD1UxKLtdVlt/gar4z9Dh4Avj8/tF6/8RO8fiCOPSvz2kh9f8M1+6410mMNQ=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14882737ybq.67.1648298754498; Sat, 26
 Mar 2022 05:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 26 Mar 2022 12:45:40 +0000
Message-ID: <CAFEAcA9VKtzzFkyMLyeorqNs9+zmhUgcfrswcMAkQ+J50_+93w@mail.gmail.com>
Subject: Re: [PATCH-for-7.0 v3] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 18:37, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Since commit 0439c5a462 ("block/block-backend.c: assertions for
> block-backend") QEMU crashes when using Cocoa on Darwin hosts.
>
> Example on macOS:
>
>   $ qemu-system-i386
>   Assertion failed: (qemu_in_main_thread()), function blk_all_next, file =
block-backend.c, line 552.
>   Abort trap: 6
>
> Looking with lldb:
>
>   Assertion failed: (qemu_in_main_thread()), function blk_all_next, file =
block-backend.c, line 552.
>   Process 76914 stopped
>   * thread #1, queue =3D 'com.apple.main-thread', stop reason =3D hit pro=
gram assert
>      frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>   at block-backend.c:552:5 [opt]
>       549    */
>       550   BlockBackend *blk_all_next(BlockBackend *blk)
>       551   {
>   --> 552       GLOBAL_STATE_CODE();
>       553       return blk ? QTAILQ_NEXT(blk, link)
>       554                  : QTAILQ_FIRST(&block_backends);
>       555   }
>   Target 1: (qemu-system-i386) stopped.
>
>   (lldb) bt
>   * thread #1, queue =3D 'com.apple.main-thread', stop reason =3D hit pro=
gram assert
>      frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill +=
 8
>      frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + =
288
>      frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>      frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>    * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at=
 block-backend.c:552:5 [opt]
>      frame #5: 0x00000001003c00b4 qemu-system-i386`blk_all_next(blk=3D<un=
available>) at block-backend.c:552:5 [opt]
>      frame #6: 0x00000001003d8f04 qemu-system-i386`qmp_query_block(errp=
=3D0x0000000000000000) at qapi.c:591:16 [opt]
>      frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] addRemo=
vableDevicesMenuItems at cocoa.m:1756:21 [opt]
>      frame #8: 0x000000010003ab04 qemu-system-i386`main(argc=3D<unavailab=
le>, argv=3D<unavailable>) at cocoa.m:1980:5 [opt]
>      frame #9: 0x00000001012690f4 dyld`start + 520
>
> As we are in passed release 7.0 hard freeze, disable the block
> backend assertion which, while being valuable during development,
> is not helpful to users. We'll restore this assertion immediately
> once 7.0 is released and work on a fix.
>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

