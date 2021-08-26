Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF63F8A13
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:27:32 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGLq-0000uO-UN
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGKc-0008F9-F6
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:26:14 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGKa-0002BM-Rb
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:26:14 -0400
Received: by mail-ej1-x635.google.com with SMTP id ia27so6669194ejc.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/zNi7sjaRrO8YP/D79a5nfilm9vrzzc3P/RNfzPzqcQ=;
 b=oEABQIOPqNvZUilPsNxa9pJXBn68C7iFip7Km4wT8QsJky0X49s9Zw6nZPHhsYt0pR
 QhNGrZfUyVg1aB0kcTfgGlI3E7XM46sxQIG84aA1Ubnr4JNCOgHzHHPwaEeFPUMlPyEn
 5MbyfxRRrwqOIUyUu2mzb1nKyY14nhfrtIhdVvHJJ/jJTvaQx1cOviG7aTSu+D/7qaox
 uvDRM6qFp4ua90qE9ZbWisN/vLeO2/l3mBluu3guvROIQwPYl29d+v8hoeXcE9hPUssd
 6q44Uo6eMQn+Gq6+IyB3oXw9yiJ1ipLy+IUrJ2Pl2hl/DZxHoNkXLJlQXGSF2Ok6SHR1
 2cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zNi7sjaRrO8YP/D79a5nfilm9vrzzc3P/RNfzPzqcQ=;
 b=FAKJ+FqavqNcq2xZ4cxnBM8q0Lmm7O4t9+13RAyN2MV3sz+WDQT5MlpaQZOeTLGsR6
 wU9r8pbbmC3t/FV8VfjzCtgPYRJZK821PxY2MWbQ7f16Y95kc0zvy5bn3HqKJNLcTcuR
 HWdu3Cc1VEV2n9zwXfYmi5mp8zTNd7nBKHyBOPKITPb1IPfxMg5OHKE0batuU037zWpq
 URoOheCUqGkj95MagIGFyBjlOJtBy1hBWIBphcqj+0QTFRT3IcYWTCEgOF8LGvxip6Pv
 xXfhV9o7gW2SYsgPiA8steC4Ne5CfVV2SFGT33ALQmuZqalHgnue7RsAbDPYSzXqXBEA
 Go9w==
X-Gm-Message-State: AOAM532Pzl9Zreiia0f+d+CPDA/1bNgBPsrUiGPd7B+C/Kj89TDOdPUE
 Cd4Iae1yj6txiY2qa65DNjE5QFc71aAwrlewIz6Cew==
X-Google-Smtp-Source: ABdhPJxR7/OUoG84fWeOhSUbJiTpuiU2/q63QdjbjGn03s3D5V9oqENgZVscjfjE6EX8IwKJ/sxN8D9CK3SUAcIVtkY=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr4677455ejz.250.1629987970632; 
 Thu, 26 Aug 2021 07:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
 <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
 <CAFEAcA8vKOmD+e7h1PSBEv_BUtkkcq8+SskZGhBNZ-kACs4S3w@mail.gmail.com>
 <22e65815-7aaa-69d1-fa72-d40f3d480498@fs.ei.tum.de>
 <CAFEAcA9itqeya5WVhfsVEvjvFStSW=yrAtOw6tcak9QrG+nxeQ@mail.gmail.com>
 <3ff9641c-a6b8-00aa-2ade-f8c89412059f@fs.ei.tum.de>
In-Reply-To: <3ff9641c-a6b8-00aa-2ade-f8c89412059f@fs.ei.tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 15:25:22 +0100
Message-ID: <CAFEAcA8B7dmQeQj9cpYOYck2BnuK6afGGC4H3UpRp+i-UQRLvg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] QEMU plugin interface extension
To: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 15:12, Florian Hauschild
<florian.hauschild@fs.ei.tum.de> wrote:
> Form my observation all three insn_cb would see x0 == 2. They are
> executed at the end of a tb execution.

The documentation for the insn_exec_cb says the cb is called
every time an instruction is executed. That won't always be at
the end of a TB, will it ?

> Please correct me if i am wrong:
> When the TB is executed, first the TB cb is executed, then the various
> instruction cb. If you would like to see x0 in between instructions (e.g
> mov and first add), QEMU need to be in single step mode.
> The plugin infrastructure does have some sort of infrastructure to tell
> the tcg if the registers are read or written to, but does apparently not
> use it. The register values seem to be written back before the various
> cbs are called.

Any new plugin API for "read/write registers" needs to work correctly
at any point where it is valid for it to be called, whether QEMU
is in single-step mode or not.

I guess we'll wait for Alex to get back from holiday and have a look at this...

thanks
-- PMM

