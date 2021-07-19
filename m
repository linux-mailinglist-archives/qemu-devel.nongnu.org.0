Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C03CEB4C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:23:11 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Yr7-0004vg-Tr
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5YqN-0004GN-B6
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:22:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5YqL-00053D-JF
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:22:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id d2so23414041wrn.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Z5KLa+M3s4UZHJEKU5SppoLDOa597CAWD1GzSKUNxkA=;
 b=B/pSiXr9nhG/thrds04xE0vhMRUH/7ydibZs7fwgL3OnXK0SmLP4DTl8VBVc0eWCi8
 uPzKa4/ZqHDomELPva32dt54mX3ABw9PcHcXnquPP90urIVa/i4RqJ1Tv/b+WBv9uE8L
 hTz2Dp4xH+gT0a6/ja3RXK9Jxm880LF8e/BP9CcLOkQoKlJDQWBjRcwJ+MtPS8dWJkeq
 U7OcbPpEEmtSeSW8iP5UbXT+ax448XNKN6+GqSV1BcDpTcI27Obvex2lbtNOmN7k8AUU
 c+FUyVysaQVmX8Z9iwelLLvLUEyCdYDOcPAlcEvQwpu34U9eBsQG1x540WW8q9sNTOrL
 1S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Z5KLa+M3s4UZHJEKU5SppoLDOa597CAWD1GzSKUNxkA=;
 b=Yzn9u6P4wRq9r0qEgy6iKPDJeTvhFXWpcrt9XlxVpqTs2aH6uxtrW5tf8PBWus/0Pj
 3jKcr3X8BhRRLT+LKKpF68W1eHwPJLLfZni/cZ5FTBKyz/h3tja2iZksmMvyGZXQrdvO
 Vk94YWgm10IPN6U38aqqzDsOk1J98tdC6wKZTN5DHBsaiv4/rAjG+x5xhH4z8tWcHYLp
 H9sp1m8h1lPUGC3ClCcjQ4P0VZnHG02xjxMm36sw2BsYmcFYYcqgyRyVp4HvSLdaj6iJ
 pDMj6wpWDEEzXRl9B60LdjjAbhCzhIEgD3M03qKHiVwBJE1HLfvC0muiXHtO678gMckP
 BODQ==
X-Gm-Message-State: AOAM532rRQ/o3NhGBsw5VEkwPuVDY3qE/Ffa0gxoSMGSexK10RvcmHT/
 SKeMZWOxU+iogDroeLCCxPz+Kg==
X-Google-Smtp-Source: ABdhPJzKljYyfln+qK6sNFyPbH1K+ZJigJsO9Gjt5Ye6E2S1Fj489/idIZYCkuctR/DH28oWUhBQYQ==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr12788513wrq.377.1626722539765; 
 Mon, 19 Jul 2021 12:22:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d8sm22032324wrv.20.2021.07.19.12.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:22:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DD211FF7E;
 Mon, 19 Jul 2021 20:22:18 +0100 (BST)
References: <20210719123732.24457-1-alex.bennee@linaro.org>
 <87im16pfsq.fsf@linaro.org>
 <CANCZdfpsEdupxRPxKt42ki1B0Kckmgu=+m8pXRRFS2J+qDJrTQ@mail.gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [RFC PATCH] tcg/plugins: implement a qemu_plugin_user_exit helper
Date: Mon, 19 Jul 2021 20:21:55 +0100
In-reply-to: <CANCZdfpsEdupxRPxKt42ki1B0Kckmgu=+m8pXRRFS2J+qDJrTQ@mail.gmail.com>
Message-ID: <87eebunm6u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: minyihh@uci.edu, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 Laurent Vivier <laurent@vivier.eu>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Alexandre Iooss <erdnaxe@crans.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Warner Losh <imp@bsdimp.com> writes:

> On Mon, Jul 19, 2021, 7:57 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>  Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>  > In user-mode emulation there is a small race between preexit_cleanup
>  > and exit_group() which means we may end up calling instrumented
>  > instructions before the kernel reaps child threads. To solve this we
>  > implement a new helper which ensures the callbacks are flushed along
>  > with any translations before we let the host do it's a thing.
>  >
>  > While we are at it make the documentation of
>  > qemu_plugin_register_atexit_cb clearer as to what the user can expect.
>  >
>  <snip>
>  >=20=20
>  > +/*
>  > + * Handle exit from linux-user. Unlike the normal atexit() mechanism
>  > + * we need to handle the clean-up manually as it's possible threads
>  > + * are still running. We need to remove all callbacks from code
>  > + * generation, flush the current translations and then we can safely
>  > + * trigger the exit callbacks.
>  > + */
>  > +
>  > +void qemu_plugin_user_exit(void)
>  > +{
>  > +    enum qemu_plugin_event ev;
>  > +
>  > +    QEMU_LOCK_GUARD(&plugin.lock);
>  > +
>  > +    start_exclusive();
>  > +
>  > +    /* un-register all callbacks except the final AT_EXIT one */
>  > +    for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
>  > +        if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {
>  > +            struct qemu_plugin_ctx *ctx;
>  > +            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
>  > +                plugin_unregister_cb__locked(ctx, ev);
>  > +            }
>  > +        }
>  > +    }
>  > +
>  > +    tb_flush(current_cpu);
>
>  We also need to disable memory helpers during the exclusive period as
>  that is another route into a callback:
>  --8<---------------cut here---------------start------------->8---
>  modified   plugins/core.c
>  @@ -498,6 +499,7 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t=
 id,
>   void qemu_plugin_user_exit(void)
>   {
>       enum qemu_plugin_event ev;
>  +    CPUState *cpu;
>
>       QEMU_LOCK_GUARD(&plugin.lock);
>
>  @@ -514,6 +516,11 @@ void qemu_plugin_user_exit(void)
>       }
>
>       tb_flush(current_cpu);
>  +
>  +    CPU_FOREACH(cpu) {
>  +        qemu_plugin_disable_mem_helpers(cpu);
>  +    }
>  +
>       end_exclusive();
>
>       /* now it's safe to handle the exit case */
>  --8<---------------cut here---------------end--------------->8---
>
> I think both of these are find from a bsd-user point of view.

Acked-by: or Reviewed-by:?

--=20
Alex Benn=C3=A9e

