Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B730D73F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:18:52 +0100 (CET)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FFL-0001DV-QR
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7FAE-0005DO-1g
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:13:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7FAC-0001Vk-3P
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:13:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d16so23448880wro.11
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6NAteDmZWe/YdA2xg9IJx9OZK/46XnyTa3UZPAN9km0=;
 b=ukba6kcEZMrtYj53JJTg3eunKmljpHMe36zKu/uEyzhpR2ySNXkwHDTg6S7L4lIKbD
 YyDZTBYmzbTQQPvZvmEm+jwblxswleHmBPnH51D8PoVFrXLRY1GlZ2sCXhrcfiBARSua
 erOUfyxigwiTqXXFKAqWwaGUx92xJmnM+BScnjX6ynp5zftcQAPDzKOukfde5GM7G+AI
 caWRT0NcuwYq75jnboCV/c9mp7EqF9bEI02PtRL4BnQ4lLkEVR65A282OPzox8Z5t1IK
 WdVlRt8brMRUYFnJgAEFx6nXYKbgOa22TXf9NRhi/7dS83etrURF46B4V0OfVit97iOZ
 tREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6NAteDmZWe/YdA2xg9IJx9OZK/46XnyTa3UZPAN9km0=;
 b=ONx/Fc8H2xXL62Mg4EsqaWLRwBKwwLlN3OrqBSmOm+o+QJtAUgkKXgXOPis6Zp7OIv
 w9JVpHgANF5nbUz4mcFxneNrE/QimP2iUuWGj3/Ex08vc/Pk3xLKj6C/81tbS7/Ix1C9
 pBDjw1a9O5ZNRAaRXueXtgKTgB+qUjI0clAcZgFIewD3WqoK3ScHhRQ6xzqlPxV5EBXM
 eWqLPQflvlWkKneNMqfePkL6b2lTVeQ/XRZAWfuwx2RjzrCNgWfk+0Zzzp2CxoRFYclJ
 UGqcTPr070ll46QrPt2voHgm8cuS/9a5zZyChXU3XMNq7Zy9sskJXHr//RN9cHtOIslp
 qbvw==
X-Gm-Message-State: AOAM531hjPXCSilXz4mfFfeXmj0GzTWNm7U4AnzxZnXwWglgxtJnhMiN
 QkGZBSmJ/BfG2ykKMks7CvgflQ==
X-Google-Smtp-Source: ABdhPJwycIOcuvdtW4LEa8S/ND7ICrEx6HjaVwgur3Ik6PMT9kwuM0sfvksAhl8sfSvKYJxFOwvL9g==
X-Received: by 2002:a05:6000:234:: with SMTP id
 l20mr2616761wrz.212.1612347209922; 
 Wed, 03 Feb 2021 02:13:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r15sm2892403wrj.61.2021.02.03.02.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:13:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1155C1FF7E;
 Wed,  3 Feb 2021 10:13:28 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-5-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 04/23] cpu: Move synchronize_from_tb() to tcg_ops
Date: Wed, 03 Feb 2021 10:11:50 +0000
In-reply-to: <20210201100903.17309-5-cfontana@suse.de>
Message-ID: <87r1lxsblj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>
> [claudio: wrapped target code in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/cpu.h     | 20 +++++++++++---------
>  accel/tcg/cpu-exec.c      |  4 ++--
>  target/arm/cpu.c          |  4 +++-
>  target/avr/cpu.c          |  2 +-
>  target/hppa/cpu.c         |  2 +-
>  target/i386/tcg/tcg-cpu.c |  2 +-
>  target/microblaze/cpu.c   |  2 +-
>  target/mips/cpu.c         |  4 +++-
>  target/riscv/cpu.c        |  2 +-
>  target/rx/cpu.c           |  2 +-
>  target/sh4/cpu.c          |  2 +-
>  target/sparc/cpu.c        |  2 +-
>  target/tricore/cpu.c      |  2 +-
>  13 files changed, 28 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index d0b17dcc4c..b9803885e5 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -86,6 +86,17 @@ typedef struct TcgCpuOperations {
>       * Called when the first CPU is realized.
>       */
>      void (*initialize)(void);
> +    /**
> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBl=
ock
> +     *
> +     * This is called when we abandon execution of a TB before
> +     * starting it, and must set all parts of the CPU state which
> +     * the previous TB in the chain may not have updated. This
> +     * will need to do more. If this hook is not implemented then
> +     * the default is to call @set_pc(tb->pc).
> +     */
> +    void (*synchronize_from_tb)(CPUState *cpu,
> +                                const struct TranslationBlock *tb);

Did you miss my comment last time or just not think it flowed better?

  ...TB in the chain may not have updated. By default when no hook is
  defined a call is made to @set_pc(tb->pc). If more state needs to be
  restored the front-end must provide a hook function and restore all the
  state there.

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

