Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18944BBC30
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:29:01 +0100 (CET)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL5Bs-0006fn-72
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL59v-0005Og-V9
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:26:59 -0500
Received: from [2607:f8b0:4864:20::b31] (port=35595
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL59u-0004RE-CI
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:26:59 -0500
Received: by mail-yb1-xb31.google.com with SMTP id bt13so20279733ybb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 07:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=azK4DR9T+XROJS0pZS6oprbW6WKgpJDfJ3WDjqn8VBE=;
 b=x92B5AWARb/B0Lo7bJila1VgpJoM3NzUNQU2wbpHiiDa2sl9ACLTTAqZFe/US7PoWM
 BHPtZ2gpTkdaz1dnMCPkJAL8PRLMp6laDbYpMJ9WFocDEdSbDtq1QuqD0Uvdmk5rGL0U
 xmzzv/LQ6hQ+q6l5kHXhFnCE+ePFb67n8ChN3a/72Tjd/iJThCVU84kiLS4XSenLhNvZ
 8wjdgeinJ6To4VwQzCRI72QYFNUFDzxlR+XJ8HgWHKCp8PRj8RIRMSsGr/+8YoEcixFe
 3jVOqimhMLf3xNH9gDGARslvvAIXa2N0t/wj1HZomBVq/Dx5lAVm/a9DtKwFQjRGVycR
 4exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=azK4DR9T+XROJS0pZS6oprbW6WKgpJDfJ3WDjqn8VBE=;
 b=FEXKOKQtEcGqSl+hcIB9FYghUAA7zomIJ96OFWC8I3Ga6pROODeR2mWQhtsFXaKoAr
 SXJgFJzdLg5+3LQd+kQRJR20jj9w+QurtnD8hbjyNJhOdOE8/w60zgbAZl4anbii+zbb
 QKNp3fFKC9LbQgXJqS4JIJp3B1v9T69FKXLBz1uYIuUZZg2GdXk3+voXlWHc/E1tmJBX
 gfotWrarfNT+THn4vS3MG+wHS6F5UNoEZU8ienrG9kW0T3v62XVsfa5XHwmO7+sV3cnu
 iZOt+OSgbzJdITibiRjvQ3bWIEN1D+yOOg5lOQVO8bboEpPO/SYsx2fep8BwR/Zg18lm
 hcAQ==
X-Gm-Message-State: AOAM532YutyKHRVS0qqHaYyf4VLFNU4xSAAFKz+naS1uECP2l7wHoe03
 SC8fvluy4ybQIa4W0qspyhQrr3e/cMKTIFMd9WwbiQ==
X-Google-Smtp-Source: ABdhPJwNG0zgLSIA4HFdFrRQFjWRHBCA5IFyXLnlEmuftMoa3uB650Pmp+jwQ0i7XtPCURgwEigrRJIn7ArLCD6uZ0Y=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr7856654ybk.193.1645198017158; Fri, 18
 Feb 2022 07:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 15:26:46 +0000
Message-ID: <CAFEAcA9MpiwF4m5tBfDfnq=QubHA=Ej=XvEodBbVcBbi-MriCw@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] host: Support macOS 12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Few patches to be able to build QEMU on macOS 12 (Monterey).
>
> This basically consists of adapting deprecated APIs.
>
> CI job added to avoid bitrotting.

Hi; I'm going to take the "obviously correct (to me)" cocoa
patches from here via target-arm.next:
 * MAINTAINERS patch
 * ui/cocoa: Remove allowedFileTypes restriction in SavePanel
 * ui/cocoa: Do not alert even without block devices
 * ui/cocoa: Fix the leak of qemu_console_get_label

Let me know if that's awkward for you and you'd rather I
dropped them.

thanks
-- PMM

