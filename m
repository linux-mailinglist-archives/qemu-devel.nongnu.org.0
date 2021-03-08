Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B4C3310A5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:20:38 +0100 (CET)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGkP-0006hw-Je
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJGhs-0005Ed-Ox
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:18:00 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJGhq-0004QS-OK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:18:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id dm26so14906330edb.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ULahwO70bBxudGXW/klpkhTfrsWAeUz1gUkiPsP1zwY=;
 b=jukw9tTSA7EijuMcHk7TXTpFhYbDPkuJmFuGG8b9uHodKCyjgEXar7wBkChZ8W7emF
 qU7GMgoIuXOaTKnfWDWavAipr353nDwQs9Ik4GhWYOIyjgCA+sX6LpdEzdVDN10OugYW
 yqTnO6I5Jmreb7tk0zs7BuSGoBfBTlflYRgpB9gS9Iv6uQHNvvxR7Ex1atmR/SYwsh8C
 pFXm30ogWuRa2bRYbjB5rCLO8veKzRNf1h1WO8qWA2y5fpmOJvYgLPcU0qnyoJGdsQoW
 h2RkDR2ea+sLj2XN63tS1LytKRrdR5SDq9+/0eZ5XLmnBv8MY+ir2ahab1FeOfxsgmPS
 RtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ULahwO70bBxudGXW/klpkhTfrsWAeUz1gUkiPsP1zwY=;
 b=gLsh+fcP0tdSW/b7L6gptG/UJ2T7Qu/SSgORZfqjX8kxZBrn/VbNsP078ggc7fqnUE
 GvAuEi0juifM47AMbIYV49gnV8vttko8nCeZdrFWg/flEU4ZYwXUCLhFOGArTixJcRvG
 pQD2zUcqxYLRlZaDw64fWUJASeV9SdDYeKrxhr9HurdhNCAEM9KVv0aSXqz9CDp9txS0
 btDr7ItfK2wQBWoKhQMKG6TifRTNadAgKhz7f6/bXb5NOqhTD+MWS5n1RdkvCfNzOl4i
 AGJ4KJyymyvKgoi3QASj8rA2bgMwrR7SYkZVsnToXKGLDKpmDYW4hl/4iZiXC+6dFd5g
 aACQ==
X-Gm-Message-State: AOAM5331QQPFAyPncluzTRQfBtM4npNodvoWA/769MYhUi3bgoKcXzdt
 GqABIYoBkVL7EMga6aarRy0hqIOtnSCSSEPkwpc=
X-Google-Smtp-Source: ABdhPJxw1ZaNZ9DtkF38ul+InhgPECuHz6FMKeVBbx9B0yP/A/9nMFyiXQ1aRI/iwETDlaiyIxjOKvEA4I9dSxknU4E=
X-Received: by 2002:a05:6402:484:: with SMTP id
 k4mr10897650edv.321.1615213075611; 
 Mon, 08 Mar 2021 06:17:55 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <134602378.QJW5UkElOJ@silver>
 <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
 <2083224.5eVbfnxiYP@silver>
In-Reply-To: <2083224.5eVbfnxiYP@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 8 Mar 2021 23:17:45 +0900
Message-ID: <CAMVc7JVK0FuBuyVvH3ai7V2HxQeiy8dMPHDYB-c7w7ARQL7nMw@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 23:03 Christian Schoenebeck <q=
emu_oss@crudebyte.com>:
>
> BTW, there is __nonnull supported by clang, e.g.:
>
> static void foo(void *__nonnull p) {
>         ...
> }
>
> Maybe as an optionally defined macro (if supported by compiler) this coul=
d be
> a useful tool for such intended nonnull designs, as it immediately emits
> compiler errors.
>
> Best regards,
> Christian Schoenebeck
>
>

GCC has nonnull attribute and clang accepts it too. However, it
specifies argument indices, which is harder to understand and to
maintain.
__attribute__((nonnull(2)))
void f(void *k, void *l);

Regards,
Akihiko Odaki

