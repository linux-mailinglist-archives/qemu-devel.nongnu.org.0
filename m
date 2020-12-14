Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AA42D95BC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:04:46 +0100 (CET)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kokij-0002LM-9o
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kokgh-0001Vy-W3
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:02:40 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:34588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kokgg-0006Pw-7u
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:02:39 -0500
Received: by mail-ej1-x641.google.com with SMTP id g20so21759932ejb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g6oGwWfC2tLM6MDB8VMiDetgNUyAFs9ZEtZ1bfezA0I=;
 b=gWxu5+4Kvk8taBGO1FUikbEV0D5yFPhMnPneyora0GdK3f4HG97BwCkkas4WPCS8eL
 KXDVa2bN8XGaxPTq/0XBvWXZTe1hNHzfT9VCVU+EfPSsd55+6VyyLEnbGm93CLAgeJRt
 x2dSq/bnsbtFoEmqjBe93UIO82FBdfnRadtyphLFHULPT9tljQCjYNXPWLs2TRfUArrG
 J6ETWmmjwPSZBmvaVjKP5RWu6vWnVwBHXeYPuHexmWzS+CtnxBIBvYFVO8Vi6PpWQeg+
 cdlzB1e/vzagLyXIUgzPe0N8E/kBsr3h1/yuZh96RDyDBHF09RSAC69ZR5WP0loeYxiB
 MT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g6oGwWfC2tLM6MDB8VMiDetgNUyAFs9ZEtZ1bfezA0I=;
 b=jJO8YRIQ0QIwo/jH3JQ4nHVI4egonC03Foal8qYG8DgasVu/JikrE9x97qtzHV946h
 esJeo1vjS8X26C+s0Vfs5obGcfBAqSF89Ql7esHejBOU5nvnrdcZvwEogcjbzPQAwSe+
 RtsjJTUBipfuZ+zRsGnLhn2vivkDQcKixK5/2+3XsMc4cLDhnMIErwTU/FqMLNG6PWcL
 sr5xj72Dwqcb+2xwNsHQc4+fGpwSMBWRJ1t2MYaH8gsH0N/i37jZwsMprXPx6O6FJ2fw
 EQG4pI6jLk23Zrnj2rssHV/n96VTvatN/eQuIHpRASRNG0+yfQiiO9drZD42Depyffhi
 zsYA==
X-Gm-Message-State: AOAM531vnlno7Tqdc5H7Sp7EeN4ynEGLBOBrg5F3aoZC6XGTJCd7RPTH
 axr2EI4e5BaO/ta8ugfaBQI/uwkfgdxn1umo5b5vsw==
X-Google-Smtp-Source: ABdhPJxaNAWKsm2wn0Jla+rzjzLkd73czIC3p9ZncAzAzQesid6qugXzKQqj2exsTmZkYosXFVjiVVSVRxQ37zMgx24=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr9782024eje.4.1607940156267; 
 Mon, 14 Dec 2020 02:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20201214002620.342384-1-f4bug@amsat.org>
In-Reply-To: <20201214002620.342384-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:02:24 +0000
Message-ID: <CAFEAcA8eB=EC2=_BJYrg3kPWi9U7tqrgg2M0UiOjKcyzgJN10A@mail.gmail.com>
Subject: Re: [PATCH v3] hw/block/nand: Decommission the NAND museum
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 00:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> This is the QEMU equivalent of this Linux commit (but 7 years later):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Df7025a43a9da2
>
>     The MTD subsystem has its own small museum of ancient NANDs
>     in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
>     The museum contains stone age NANDs with 256 bytes pages, as well
>     as iron age NANDs with 512 bytes per page and up to 8MiB page size.
>
>     It is with great sorrow that I inform you that the museum is being
>     decommissioned. The MTD subsystem is out of budget for Kconfig
>     options and already has too many of them, and there is a general
>     kernel trend to simplify the configuration menu.
>
>     We remove the stone age exhibits along with closing the museum,
>     but some of the iron age ones are transferred to the regular NAND
>     depot. Namely, only those which have unique device IDs are
>     transferred, and the ones which have conflicting device IDs are
>     removed.
>
> The machine using this device are:
> - axis-dev88
> - tosa (via tc6393xb_init)
> - spitz based (akita, borzoi, terrier)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: Do not manually convert tabs to space to avoid mistakes...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

