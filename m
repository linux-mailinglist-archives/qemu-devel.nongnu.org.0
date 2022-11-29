Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5663C4E6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 17:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p03F8-0004Ja-C0; Tue, 29 Nov 2022 11:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p03F1-0004I9-B8
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 11:13:52 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p03Ez-00006O-Fk
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 11:13:50 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id y83so18077269yby.12
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jnvnpMNe/1QLYSGrXpTG6iARBDmD2jjGjbI/mPIYJM=;
 b=ECVM07x+jK9b7Me5Or97G2pIzAn/rD8Ddl1WH//A0fuG/3yoYy24Vn5/Hf8E7K3Y5k
 UqdZ2lt5mdwMalejNwXLiT6SPdWfCCljgyDSdQuRkaIQSIV+7xA/L5noqbW9y37GAGeJ
 nnyJW+Z5wy0L49Vp3E77lfMeeJMF/Lkm3gx+6GQ7qyeh6d8YdesvLsfXMowb9TM29XHF
 u+n0KuTN3au7/6wYdTbl4aC6M4N5DJqOS3D4qSlwslH44oIRirmVWbp9PkU60Ffug0Mk
 nlloiGtRS9d6edy3/rBtt7JYNFAJE8F4j8nkpxVny6n0tzTHf6RkoAiHpfSL4MMutvUY
 8gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jnvnpMNe/1QLYSGrXpTG6iARBDmD2jjGjbI/mPIYJM=;
 b=3Bc8t3xk+20Nf4caEwalk4YoANllPJ241dWT7oTc5AJc2ffuKvcq2X/27W6MHiCkKr
 mEx4jRR7A9lnbR177RKw9mSpwMvClIHpTnJ0mndY6KAU7fPKnspVC4oTBVZwzS3rJWED
 fa/CZ4+0xgS9PdGm3Dk4RA3S8yAj8ghYRt7c6rPDSw+zDX69hME8MrF7B7GgJy+8jBdc
 8v0li8patEoFffTmbWv/lcLs6A6g9N814t7a06daS3i3L4zDizvIlPaNwXfeYmaMeA1W
 k4qiomYvj4s6vWuJCq84Rot9PSQxwW6B6ap/aSbBM5MdiMagr5D2pZl5g15liI9GtMBz
 Viog==
X-Gm-Message-State: ANoB5pmjM/Iq+9fVx4sXmBgRNmLhTPJqPRJSME/jn6BiSd+QiyqaWeh+
 pzBd/KXcqNjG2xRWAM/zkYqx+2OFTVSvfCBF4yw=
X-Google-Smtp-Source: AA0mqf4S9YrSsFo4ITJo/h4hq4vBAPFwt6JqMKT34RtLNrGUXu9OvuSoxGIPX3ecrd5jsYPXpY6frMXzZZ4N9sozBuI=
X-Received: by 2002:a25:e057:0:b0:6f8:c34f:227d with SMTP id
 x84-20020a25e057000000b006f8c34f227dmr4126573ybg.537.1669738428131; Tue, 29
 Nov 2022 08:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20221129010547.284051-1-richard.henderson@linaro.org>
 <d7d533b1-14b1-3fa9-432e-18f7d8fd8053@linaro.org>
In-Reply-To: <d7d533b1-14b1-3fa9-432e-18f7d8fd8053@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 11:13:36 -0500
Message-ID: <CAJSP0QX6c+9O3Vv1jM=X=8W17KPkQio4j17vYQRFdWxC3WGfjA@mail.gmail.com>
Subject: Re: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 pavel.dovgaluk@ispras.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, 29 Nov 2022 at 02:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 29/11/22 02:05, Richard Henderson wrote:
> > Fixes the build with gcc 13:
> >
> > replay/replay-time.c:34:6: error: conflicting types for  \
> >    'replay_read_next_clock' due to enum/integer mismatch; \
> >    have 'void(ReplayClockKind)' [-Werror=3Denum-int-mismatch]
> >     34 | void replay_read_next_clock(ReplayClockKind kind)
> >        |      ^~~~~~~~~~~~~~~~~~~~~~
> > In file included from ../qemu/replay/replay-time.c:14:
> > replay/replay-internal.h:139:6: note: previous declaration of \
> >    'replay_read_next_clock' with type 'void(unsigned int)'
> >    139 | void replay_read_next_clock(unsigned int kind);
> >        |      ^~~~~~~~~~~~~~~~~~~~~~
> >
> > Fixes: 8eda206e090 ("replay: recording and replaying clock ticks")
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   replay/replay-internal.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/replay/replay-internal.h b/replay/replay-internal.h
> > index 89e377be90..b6836354ac 100644
> > --- a/replay/replay-internal.h
> > +++ b/replay/replay-internal.h
> > @@ -136,7 +136,7 @@ bool replay_next_event_is(int event);
> >   /*! Reads next clock value from the file.
> >       If clock kind read from the file is different from the parameter,
> >       the value is not used. */
> > -void replay_read_next_clock(unsigned int kind);
> > +void replay_read_next_clock(ReplayClockKind kind);
>
> Preferably having this file including "sysemu/replay.h" in the same
> patch:

ReplayClockKind isn't declared by anything in replay-internal.h but I
see another instance of this in the file (e.g. InputEvent).

Maybe send a follow-up patch for 8.0 that cleans up the #includes?

Stefan

