Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A832E8864
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:08:07 +0100 (CET)
Received: from localhost ([::1]:60348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnC2-0000Zv-LP
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnAy-0007fE-Rj
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:07:01 -0500
Received: from mail-il1-f182.google.com ([209.85.166.182]:38858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnAu-0008EO-1B
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:06:58 -0500
Received: by mail-il1-f182.google.com with SMTP id v3so21740356ilo.5
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HukakeC0uwdnstw9WpZxUn4k7szPmVv70QB+fzFuiC4=;
 b=CHKw419aKnjcRJgPIV8Bi7AAYS2eDqo2FUzXWXKtNYJCo1g4/KjpLLxnjImmnV72P7
 wpDAsrV/d0QJcOfX8c5qOvd2uqq+FVPhrLcFtHi+IXE6JxFBrhgyxHQcBgxBzFmAS+eF
 YSoJZlUwBOEQNK5Yp6pMsMIXuT1fuezKx8vXj3i0lhkj7Y8CjftKEugaVvZEWgvtoKtE
 iz1AX6838LQ9EVlp5QH/xbaa4aWJ92pHjtDC45YE6M0Bj4LvXMUBLdTkLftNqeirFoGA
 VRoJnC498iNiVTe7NkYF1eow4zulB5teZeyDrGS0A+Puz9hRO5XM7Ci3cBceg7DBVL0e
 +Akg==
X-Gm-Message-State: AOAM5333oALBuavTB9TMPsziywt3vU8dZbQKOnxC8QSgHPhY9FIZsTo/
 cVdOu0ZpGDvmyxUnUAy7O7lT4i3p9N4=
X-Google-Smtp-Source: ABdhPJxyW+a80EFSULbiIB1ntfyM54eKEOpf9MSxpiL1duVIhbo0tO6dQadiYRA6zhGh4tqMuX6xhQ==
X-Received: by 2002:a92:c26c:: with SMTP id h12mr62007479ild.165.1609618014003; 
 Sat, 02 Jan 2021 12:06:54 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id z8sm31743479iod.25.2021.01.02.12.06.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:06:53 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id q137so21410890iod.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:06:53 -0800 (PST)
X-Received: by 2002:a6b:7108:: with SMTP id q8mr53945728iog.204.1609618013572; 
 Sat, 02 Jan 2021 12:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-16-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-16-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:06:42 -0800
X-Gmail-Original-Message-ID: <CA+E+eSA7=WewjdsZ4xbHDa-4LOdUOsWfu5eK7D8c4+_+J_KPSQ@mail.gmail.com>
Message-ID: <CA+E+eSA7=WewjdsZ4xbHDa-4LOdUOsWfu5eK7D8c4+_+J_KPSQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/43] tcg: Make tb arg to synchronize_from_tb const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.182; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is nothing within the translators that ought to be
> changing the TranslationBlock data, so make it const.
>
> This does not actually use the read-only copy of the
> data structure that exists within the rx region.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h   | 3 ++-
>  target/arm/cpu.c        | 3 ++-
>  target/avr/cpu.c        | 3 ++-
>  target/hppa/cpu.c       | 3 ++-
>  target/i386/cpu.c       | 3 ++-
>  target/microblaze/cpu.c | 3 ++-
>  target/mips/cpu.c       | 3 ++-
>  target/riscv/cpu.c      | 3 ++-
>  target/rx/cpu.c         | 3 ++-
>  target/sh4/cpu.c        | 3 ++-
>  target/sparc/cpu.c      | 3 ++-
>  target/tricore/cpu.c    | 2 +-
>  12 files changed, 23 insertions(+), 12 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

