Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72C3024C5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:19:36 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40qF-00014G-DN
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l40nb-00082H-Bm
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:16:51 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l40nY-0004vt-I2
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:16:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so11503942wro.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 04:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=glqmj19hETkX4bKvPeKvpEXN6NMsW+k/GLQSv7Vh4u8=;
 b=ITxenKmqfwCg3/eUFgfbX6tGkzsrtCtGW5QnrWCPJ8YMfiF1b1FA7ymA33kGu0GUDz
 /WwC87dGErf/R3tw9x21R3ndPhMCYh0utRK2Gr0xMkII+i0baDqJXV+e5lvVo41uU1Vj
 57ob+ujOGL9RiCXWWE0lULtvlKcskkv5hHVR6iEULq/NfsV9E6ZxgTCcc5bS92yMI3A4
 R1YBiI+J4V+uiiDXHHANudUco+YHQqZkABNPRsPbKPP9gQSXGmI95DGaTNbIXHLY7s6g
 bqtRtyMM7BSYFeQlqV2eUoFkXQuh0uHAz3XBmgS/Hl1YH+KW7ckhLP+mNjsWPNms2V21
 ZP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=glqmj19hETkX4bKvPeKvpEXN6NMsW+k/GLQSv7Vh4u8=;
 b=SMDZ50LLVe9Qa8qtDAAu7d/9IA79j6PqwlvC7d3F2KWiOGZdwN8vZdwa79FyDhhxQD
 Uki6tDqwM/URLVOM9sD4yoYA0SmXBF1/Zth/vYYfYpDk/Q8RBA9oFmSu12ssFTUm8Cim
 bWCKextA6+6xacakiRelCWDvm/bR4/k9hsTLF5MAbexADnVK6DAoqOxvf7wXLZe6Bt3V
 wbr5I1IahfXYxdGRjZe3m4I/kjVmrZ8c6FORYkiZnh1QMok37Re1HbFI2jtDPLf7V8lx
 Fi5K0SDdNtQ81Vru/y6Wi2jUTLHPdPLhJhvSXiIE3YQZGuHwOJkBsnCFcJgxpzoOR5sM
 vlfQ==
X-Gm-Message-State: AOAM532eO1/le9tgsBFJa0zZsHNi8oELz7oSXMTW7BUR0a2k13hS+D0m
 FdyNOphkA/V0xD92/aAhkSlXCw==
X-Google-Smtp-Source: ABdhPJwmSVojrh2wT+S3aynwbPK9S0pN0ooLxbQ+FRnAKx9mDZ9F4Hs4DRZx+4C6K2yRQNZvLWPQxA==
X-Received: by 2002:adf:fc86:: with SMTP id g6mr662851wrr.20.1611577006803;
 Mon, 25 Jan 2021 04:16:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j9sm23207127wrm.14.2021.01.25.04.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 04:16:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB25F1FF7E;
 Mon, 25 Jan 2021 12:16:44 +0000 (GMT)
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
 <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
 <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
 <CABgObfaFnKztrjc7mpgTxEi9R7jXD-Qed5vVcPBSGcE_nexONg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] replay: fix replay of the interrupts
Date: Mon, 25 Jan 2021 12:12:52 +0000
In-reply-to: <CABgObfaFnKztrjc7mpgTxEi9R7jXD-Qed5vVcPBSGcE_nexONg@mail.gmail.com>
Message-ID: <87sg6pmcsz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> In general I agree, but !=3D means that rr disabled returns true. In gene=
ral
> it seems to me that rr disabled should work more or less the same as reco=
rd
> mode, because there is no replay log to provide the checkpoints.

Is this not an argument to combine the mode and check into replay.h
inline helpers with some clear semantic documentation and the call sites
become self documenting?

if (deadline =3D=3D 0 && replay_recording_or_checkpoint())

which also makes things easier to compile away if replay isn't there?

>
> Paolo
>
> Il lun 25 gen 2021, 06:38 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> ha
> scritto:
>
>> On 23.01.2021 21:15, Paolo Bonzini wrote:
>> > On 19/01/21 13:39, Pavel Dovgalyuk wrote:
>> >> Sometimes interrupt event comes at the same time with
>> >> the virtual timers. In this case replay tries to proceed
>> >> the timers, because deadline for them is zero.
>> >> This patch allows processing interrupts and exceptions
>> >> by entering the vCPU execution loop, when deadline is zero,
>> >> but checkpoint associated with virtual timers is not ready
>> >> to be replayed.
>> >>
>> >> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> >> ---
>> >>   accel/tcg/tcg-cpus-icount.c |    8 +++++++-
>> >>   1 file changed, 7 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
>> >> index 9f45432275..a6d2bb8a88 100644
>> >> --- a/accel/tcg/tcg-cpus-icount.c
>> >> +++ b/accel/tcg/tcg-cpus-icount.c
>> >> @@ -81,7 +81,13 @@ void icount_handle_deadline(void)
>> >>       int64_t deadline =3D qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRT=
UAL,
>> >>
>> QEMU_TIMER_ATTR_ALL);
>> >> -    if (deadline =3D=3D 0) {
>> >> +    /*
>> >> +     * Instructions, interrupts, and exceptions are processed in
>> >> cpu-exec.
>> >> +     * Don't interrupt cpu thread, when these events are waiting
>> >> +     * (i.e., there is no checkpoint)
>> >> +     */
>> >> +    if (deadline =3D=3D 0
>> >> +        && (replay_mode =3D=3D REPLAY_MODE_RECORD ||
>> >> replay_has_checkpoint())) {
>> >
>> > Should this be replay_mode !=3D REPLAY_MODE_PLAY ||
>> replay_has_checkpoint()?
>>
>> It was the first idea, but I thought, that =3D=3D is more straightforward
>> to understand than !=3D.
>>
>> Pavel Dovgalyuk
>>
>>


--=20
Alex Benn=C3=A9e

