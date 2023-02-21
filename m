Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6569E08D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURxC-0002Ce-Cl; Tue, 21 Feb 2023 07:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pURx6-0002C7-My
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:41:01 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pURx4-0005yE-Sn
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:41:00 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q189so2092065pga.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676983257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oahe6bQC9BMjcmtOs2/N7gYj4LkKt20bVM5IJeRoyJE=;
 b=c9yu283cPgFkEWCJtgCv7tPpzT5nfWcvOY+VpDrQkGXOTGNdVLkL8nVIayU68KBR8S
 OFKxYNroSwouHJ4rZTxZJT5cEpB0qf1gImUTFB/XpvLwnhB9DqxWmSF6bsHoZ3Rj1Bp4
 j6y4Ezd6igR3pB6qBQhscOgm0pqHR4vw8dSmTXKLwc88OdCDG+QzFj3XAIi9NpktTLIi
 l/vlI4gJ+QN4EJ6xuvm6uU9Vrup/Jpvef8LTuhI09JnuNG1V6WDbp2zn0ynHaPQraknp
 VW7FekFb0qMW9upp9tpIODjEyLEkkW7939AVQnbDAK86t88WGK07hF1vIzq4tmQLY8FW
 5jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676983257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oahe6bQC9BMjcmtOs2/N7gYj4LkKt20bVM5IJeRoyJE=;
 b=Hb6w05+eF3AeJjE7vasckVsVIDg61bj0+E7ue3dz0Uh/evIzEOw0Z2RlK7moxju+OS
 CUjCMASz6vwQPbvdiHPdGFsDZ9ZANLOjNi0B9oIXbxSS2UV3jUqORcTkRZ607McI9H6k
 U6WRoGEGNHxiC/xaqLrCJM9pPH+odJlqKOcVWxKb+9AqM6/dnVtfcu1gsxPBxLEI3ER3
 yoi0W2UCr4c9sr0U/D0hylOxhmkYzI1q0iMdMqvHFGyYVW3tkIISNKJ8BFdkgiqYQEqS
 eJfszCzVFxUu6XTBDmP2TLysbvNAmxKELTq7Rgxt93I+VX3TofFTSqXZ4be13HSqYqg3
 0e0A==
X-Gm-Message-State: AO0yUKXOp/BrroD+EZflA2PexhHXhJ+2mWdvCVe1D9S7buo0NCUFJByX
 aLMv8A84/P/HJLIfkGeGhUIzhnrN5lrW9fojpiQ9oQ==
X-Google-Smtp-Source: AK7set8nzIG1XyMvT0/W65XixIZCPchtlRjMgiGfD/MA/Vbbxnl8mNooFvDH4atdlpUhrDq22ZCz9D/IhVs3nUke/kg=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr798362pfw.48.1676983257278; Tue, 21 Feb
 2023 04:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20230221122440.612281-1-thuth@redhat.com>
In-Reply-To: <20230221122440.612281-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 12:40:46 +0000
Message-ID: <CAFEAcA-PJNQHR0nyyObxBLqHDM6QBWzpz35Dc6o17S5n2Jbt2w@mail.gmail.com>
Subject: Re: [PATCH] qemu-keymap: Silence memory leak warning from Clang's
 sanitizer
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steve Sistare <steven.sistare@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Feb 2023 at 12:26, Thomas Huth <thuth@redhat.com> wrote:
>
> When compiling QEMU with "--enable-sanitizers --enable-xkbcommon --cc=clang"
> there is a memory leak warning when running qemu-keymap:
>
>  $ ./qemu-keymap -f pc-bios/keymaps/de -l de
>
>  =================================================================
>  ==610321==ERROR: LeakSanitizer: detected memory leaks
>
>  Direct leak of 136 byte(s) in 1 object(s) allocated from:
>      #0 0x5642830d0820 in __interceptor_calloc.part.11 asan_malloc_linux.cpp.o
>      #1 0x7f31873b8d2b in xkb_state_new (/lib64/libxkbcommon.so.0+0x1dd2b) (BuildId: dd32581e2248833243f3f646324ae9b98469f025)
>
>  SUMMARY: AddressSanitizer: 136 byte(s) leaked in 1 allocation(s).
>
> It can be silenced by properly releasing the "state" again
> after it has been used.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

The leak is a "trivial" one in that we allocate only one
object and we're going to immediately exit anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

