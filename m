Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220982EF47E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:07:47 +0100 (CET)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtMf-0008DV-Q6
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtLD-0007Fx-FS
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:06:15 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtL6-0000TF-Sa
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:06:15 -0500
Received: by mail-ej1-x633.google.com with SMTP id g20so15001799ejb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZxst5pG/lC60+vYJJBXGxA6kYccQzJdFjIbPSVft44=;
 b=nLhEmcr9sIZ3uCTKtR2XGMkf5iPKgVhAx/C/lz1ZR83XqDiaPQA2yowpJ/bpwcDXlD
 T+m81BQM+8b6x72FKjRkKUGFabruMJb+/RuDrLrB3vWoTuJdenEuzwwnDkD1uaxDnCyX
 SayNaJE3984/H+wZoqo5c0OSMEWWDY96hlq09paog2wADl2WaXFLB7wasbOvceMVtIu2
 BO+z8xI0NQ5BqPLw+Ieue+wiCrJDcD/TpKahhzv8uJhmYiE8+9YWEqnYcPRzuokjQE7s
 sE0nQ67ZfFHD57Ep082MyeTML/jXBZaEs8lWOviedSThMGlblnfKkIybb1aFW5p7leLy
 l6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZxst5pG/lC60+vYJJBXGxA6kYccQzJdFjIbPSVft44=;
 b=LyBhDNjiBKIfdc/V1MDmQw46pX+uQdbFbQyTztez4Z+bJb8OgFiXfaFzyAe94phZPI
 AOicYBam3dbRarXi7/yyGRwHV78N2ToAib64GVnhcWQPhJbOw4+9Pr0eJUtXe5jhSNJ0
 LCZkUkdu2Pi7Am65wcB5XUWKBBdMsTc+UsXV+br46JCaSHezaEDQ4uR4T5cfUYDC09Ei
 Pi1Yz198eEHcWN1jCbzd8eUF4cZsJplKTKdqNrydej//RoXFlhmhdJYy824oIDKZE3gy
 ZRpTBLzWP1iqgMK24DvIMeRU72J8IChp8RFbWWMqPwWpbjUJCnjLlHbuS6bwjVbTXz7g
 rutA==
X-Gm-Message-State: AOAM531D7eQUvB+kSHcugKW5sQ30U+DVdc4GeuzKvkhi/8hlUyEGoAQ4
 9t4h6vkKUdgz77olTVL8LlXZdQ2kUaEPPl9tlgXSrg==
X-Google-Smtp-Source: ABdhPJzBGV7WOpTgMkasIm0ahkaMexrPkljG6umrVOlY9CS0BU5d8uIHRZ3jYioZ63AQMtaB5K8u6K1RfQFh/8fhbp4=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr3021778ejb.56.1610118366278; 
 Fri, 08 Jan 2021 07:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
In-Reply-To: <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 15:05:55 +0000
Message-ID: <CAFEAcA_DONsg-c_-sEA_T_P+5jYSAXtTDfcvy7_h7oGWOqJ+nA@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > >
> > > ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
> > >       [-Wdeprecated-declarations]
> > >         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> > >                                            ^
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> > >       'openFile:' has been explicitly marked deprecated here
> > > - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> > > ^
> > >
> > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > ---
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> So I was just trying to test this patch, and I found that at least
> for me the osx menu bar has stopped working in QEMU -- keyboard
> shortcuts to it still work but none of the menu buttons respond
> to the mouse. Does that happen for anybody else?

This menu bar breakage appears to be caused by this patch. I have
no idea why, because the patch looks pretty harmless. Nonetheless,
I'm going to have to drop it from my queue.

thanks
-- PMM

