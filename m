Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01E31A118
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:07:02 +0100 (CET)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAa29-0008CV-FJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAa17-0007S2-JP
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:05:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAa15-0004sQ-Mz
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:05:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id n10so1343358wmq.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=szATgumnk+A4AIyprCUztTZn3uA5PdEIigGHENDgVKQ=;
 b=AS5bjVZtMZsy9Uf8CcGj2TDEuTbzvjr185IYBRwh+XIyNR85zFtWsp40xGicQvQtst
 NYsXVplQzB9k1H4GlWqsXYZs56lfOBjvbP2BLf1YyggpDOVaW0JboxeAPiXFn61PGnAg
 4vnLdVELdfXeQ4aNIgdQMUj6Nk78QKMjvoWXMj5fnE9attHiJmm+dkDTVMXnj3SR4SW1
 I9NwCZeJ1lTBfPfZDCm4LHs7UjjimQb/qoCaTF4W6nZhQ7RG6cj6i/l5tN9MYuLeX2A7
 XLskCCpXMIjioB/KopaK6P/yJGXSt+Vhd3jixvzDbLFApLtQssUzXv0AooylEsCJuxo5
 tp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=szATgumnk+A4AIyprCUztTZn3uA5PdEIigGHENDgVKQ=;
 b=ZdfVMKR5ibHchOpRTueuR2xJ0xA0MqFPjku06ZYT5yggBfvx6L8kGg+VSXGb+DeDIe
 4Fb1DFoMgl2U+ZT7PHqKKuuXLgh4ESmeoQTcaJpMwkxfZR/Eukt0TMNc77kFzC41fijH
 5OYKSwKJQK5Cn9Iqh80inXRlxWCq03I3HoizZcLs64UHZt5krGyky2IbKm7rrvUNRADN
 ro6A+rTt8hdVL5i2X+gl/I3qGGYBnkaXPMH+BLZQlGJWJ5Qo928TwtWHpejXOAGubHun
 DBc96NxgCjrUrG9A39j8kAvBLvsYsRPIw+cH5vHleWyR6NVnH233Oyq3fpUYJnoaHpME
 yq4A==
X-Gm-Message-State: AOAM530LyseFCMeYoG0Yqu5pq/v31OAJGuNQDSG/GAof7EYU7t5/Quf1
 H3+SKneAaLULeM62KLhkq6zgmw==
X-Google-Smtp-Source: ABdhPJxRgl1t4KdPbpjuEq3gUqc+Jjc9iDMeO+hPoHPOHfXVJ7hgTRfVzWgRppM1gPcECUSWed4lyA==
X-Received: by 2002:a05:600c:41d6:: with SMTP id
 t22mr3150492wmh.74.1613142353610; 
 Fri, 12 Feb 2021 07:05:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c22sm12411319wrb.91.2021.02.12.07.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 07:05:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 477011FF7E;
 Fri, 12 Feb 2021 15:05:51 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain> <87a6s9v7ia.fsf@linaro.org>
 <YCaRMAPlhBLbDIDZ@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Fri, 12 Feb 2021 14:59:30 +0000
In-reply-to: <YCaRMAPlhBLbDIDZ@strawberry.localdomain>
Message-ID: <871rdlz5ps.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 12 11:22, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > On Feb 10 22:10, Alex Benn=C3=A9e wrote:
>> >> When icount is enabled and we recompile an MMIO access we end up
>> >> double counting the instruction execution. To avoid this we introduce
>> >> the CF_NOINSTR cflag which disables instrumentation for the next TB.
>> >> As this is part of the hashed compile flags we will only execute the
>> >> generated TB while coming out of a cpu_io_recompile.
>> >
>> > Unfortunately this patch works a little too well!
>> >
>> > With this change, the memory access callbacks registered via
>> > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
>> > re-translated instruction making the IO access, since we've disabled a=
ll
>> > instrumentation.
>>=20
>> Hmm well we correctly don't instrument stores (as we have already
>> executed the plugin for them) - but of course the load instrumentation
>> is after the fact so we are now missing them.
>
> I do not believe I am seeing memory callbacks for stores, either. Are
> you saying I definitely should be?
>
> My original observation was that the callbacks for store instructions to
> IO followed the same pattern as loads:
>
> 1) Initial instruction callback (presumably as part of larger block)
> 2) Second instruction callback (presumably as part of single-instruction =
block)
> 3) Memory callback (presumably as part of single-instruction block)
>
> After applying v2 of your patchset I now see only 1), even for stores.

Right - but any pre-instruction instrumentation shouldn't be done in the
(now badly names CF_NOINSTR) case. It's also confusing because we have
pre and post helpers and inline callbacks are always pre (you can only
count so don't see data).

Can you check the patch in my other email and see if that works better?

>
>> > Is it possible to selectively disable only instruction callbacks using
>> > this mechanism, while still allowing others that would not yet have be=
en
>> > called for the re-translated instruction?
>>=20
>> Hmmm let me see if I can finesse the CF_NOINSTR logic to allow
>> plugin_gen_insn_end() without the rest? It probably needs a better name
>> for the flag as well.=20
>
> Funny, the first time reading through this patch I was unsure for a
> second whether "CF_NOINSTR" stood for "NO INSTRuction callbacks" or "NO
> INSTRumentation"!
>
> -Aaron


--=20
Alex Benn=C3=A9e

