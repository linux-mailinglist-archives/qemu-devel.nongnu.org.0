Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0633552211
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:18:21 +0200 (CEST)
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3K6W-0006ua-SU
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3K1Y-0002b4-IW
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:13:12 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3K1X-0002gy-0c
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:13:12 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id p69so8132580ybc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ND1tRkbAFJUxoa+j0+qytgdL0eImubBZV6kE4eLscfM=;
 b=hAZp5D+0MFJYXveDoSmq7YDIh5fZYdECsnILTGLx0C9izV4xj2Awpwg40dDT6SdXcL
 uyvzH/fWe3I2Wv4ltVfWA68Dv0M7GCyRmzDeZM76IPyQmaxzD9pgvVZhHdWfG4JJBTx3
 64xTrevBBNMO8qTFCfjPGTRDcC1aGl8UT1q/Rf57SmkvQMKDnoLM4DzOOUYtLD4y9zes
 BfiYwXJCKK3R402xGdgJdcUy72pF8uqaRjue9dMV5lS3ThKBdsmzMtF/60pk/OR9ouVZ
 WtO414znbhhJFESpYGBhJpHzcyshl2hFWWyJr1FRpEr59/heP3by/CZakiHms5INid+7
 Edlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ND1tRkbAFJUxoa+j0+qytgdL0eImubBZV6kE4eLscfM=;
 b=T++W8ZuYBYdMJ1n00YdrlZVK83/8fHGNA32C9+Blxe9uIEY7wlkoFaTIhi3uEI6TxS
 SOj8V9sNefAgetjUGJrEDny1bgRZYKZWkqsShp+fcDD1jLazFqSwWGFPPTilX46/gNLI
 OCx6NejS+V8KqAsTZoojZh18yaROwUI6BW9Odfq0OCf48qD77Rs8ClkqT5IV+E37cGZp
 /0WA4eYaqRR0ySFGETah/dyxIaCMedJddodPEZRE8Eg8YF0RbD+ZbY9JNJ8hwWFBQvVm
 rz/CovSxp4Pnf2EDGUQFVqFjm+eYL96I0jgBanCDRt53ED/7vcjb+pysMJvOD82KjjXy
 kyPA==
X-Gm-Message-State: AJIora/AGGIOjdUOKFCZOzpnhGKzboGd4gcDETvzGrpIehbIiytyiqX7
 7fSLWQ4laHD+rBimvxR+e9EInYvMT9wX55mOmJd+Cg==
X-Google-Smtp-Source: AGRyM1t432wHhBmQE84hxM397VKP02vb0kh9QEa7Rm2LYIs1azbVkLO+Y1fkn3KGjU0Ov9CFIhhgloGGrmuUXHLWDjg=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr8126697ybr.39.1655741589795; Mon, 20
 Jun 2022 09:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220620142426.15040-1-lmichel@kalray.eu>
 <CAFEAcA-++01L_S=G13AtMO9n4H0vvHZf3M68SOTAJ4sOzu9KGw@mail.gmail.com>
 <20220620151037.GB4427@ws2101.lin.mbt.kalray.eu>
In-Reply-To: <20220620151037.GB4427@ws2101.lin.mbt.kalray.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 17:12:58 +0100
Message-ID: <CAFEAcA9gg+krksUAUKCizuvSZLXee5L9KQPRKMAmxGo=G0xVJQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 16:10, Luc Michel <lmichel@kalray.eu> wrote:
>
> On 15:35 Mon 20 Jun     , Peter Maydell wrote:
> > On Mon, 20 Jun 2022 at 15:25, Luc Michel <lmichel@kalray.eu> wrote:
> > > This series implements a clean way for semihosted exit syscalls to
> > > terminate QEMU with a given return code.
> > >
> > > Until now, exit syscalls implementations consisted in calling exit()
> > > with the wanted return code. The problem with this approach is that
> > > other CPUs are not properly stopped, leading to possible crashes in
> > > MTTCG mode, especially when at_exit callbacks have been registered. This
> > > can be the case e.g., when plugins are in use. Plugins can register
> > > at_exit callbacks. Those will be called on the CPU thread the exit
> > > syscall is comming from, while other CPUs can continue to run and thus
> > > call other plugin callbacks.
> >
> > The other option would be to say "if you register an atexit
> > callback in your plugin that's your problem to sort out" :-)
> > There's lots of situations where code inside QEMU might just
> > call exit(), not just this one. (Mostly these are "we detected
> > an error and decided to just bail out" codepaths.)
>
> Sorry I was a bit unclear. I meant plugins using the
> qemu_plugin_register_atexit_cb() register function, not directly calling
> atexit(). This function documentation stats:
>
> "Plugins should be able to free all their resources at this point much like
> after a reset/uninstall callback is called."
>
> If other CPUs are still running, this is not possible. I guess it's
> reasonable to assume CPUs have reached a quiescent state when those
> callbacks are called.

Ah, I see. I wonder if we should be handling the system-mode
exit() more along the lines of what we're currently doing
for usermode exit(). In general I don't think it's safe for
the plugins/core.c code to assume that when its atexit() handler
runs that all the TCG CPUs have stopped. Semihosting exit is just
the easiest reliably-reproducible situation when that's false.

thanks
-- PMM

