Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9952EF457
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:02:42 +0100 (CET)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtHk-0004ic-K5
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtFX-0003ef-IV
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:00:25 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtFU-0006lh-VR
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:00:23 -0500
Received: by mail-ej1-x62e.google.com with SMTP id t16so14786734ejf.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aDRlnrCLOkV8rTIWKaApFgqCOGtFkSHZ3XWQZ5pxZ/0=;
 b=wjyVNO/j+NwHylL+Qk1g4n+AoLx3y83DvLEderNyqUekXqxl4vqGXj2r+8n3+nfC/J
 /3LHF4LFRPdFA+Y9j7SIE/abkmLYSPeO35qEfpr4RKX6uSAoqeIBlGryrHSgIMI/ODHU
 5ZySl/Sif2NFahLjbmeYG9T+WQgZwY5dsaGCitDSA9JYKrKQdrbK6ugvlaj2NP2PUK44
 74tAndKF4m/XN68hhp31jtEVRHFJ4sKrMXVGNIyEFqAI7I8H4JZCJl2HX3xfIGZUjFv0
 4h9TZGEnbOBREdlQ2T+GcokGkHdxI1X9eBO+KL4b0dME62ZQxXRDFtn3D6cPULeX3FiT
 PIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aDRlnrCLOkV8rTIWKaApFgqCOGtFkSHZ3XWQZ5pxZ/0=;
 b=WHrlYhzjEc2g0shZK0MHAv7XTvELQxFV+11FZTVl5U3E77pMuJZeGwHPkNAe6mP+0k
 I/MfgvK+AFqb8/+2h+attkaiuBrl91LTBNspsqPGzlLGw3aEMTJm7egShKEocMclHGaV
 JhnajGykYLpbJHWm2z/VJlzvyE36q2YQqqYtliREuibjUQ6ymoiMuE9TMaWpmEG9lRhS
 JygF/gs1Ka7KrM+IqhOBoQ9NH1Ehdf6jGV5jeAV334qHytFkPzCPxqH2jp9Mivpi25Es
 3gITDZVaZi6peCjZvi81wh+SfV4iYPmsPblo9n1UHvk1J2jqPoH5IzUJ6YzVux7BvgfQ
 ybBg==
X-Gm-Message-State: AOAM532qt3sb/ZbMxB7CsMAKC8GBGrRNWfRWfST9Cth750pFz9gKjxmT
 8wTw3tcdUTbElXf1ZsELOJ5jighWejWM2tfYjm2YOg==
X-Google-Smtp-Source: ABdhPJzywjUn+MP2arlbzhU8Sj9vRmY1F8VauQfs0b8E9p51Fc3LF+Z4UkucWkPUX71W1gXGhcap3KkUnrjfyNC0244=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr2997443ejb.56.1610118019245; 
 Fri, 08 Jan 2021 07:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
In-Reply-To: <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 15:00:07 +0000
Message-ID: <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
> >       [-Wdeprecated-declarations]
> >         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> >                                            ^
> > /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> >       'openFile:' has been explicitly marked deprecated here
> > - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> > ^
> >
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


So I was just trying to test this patch, and I found that at least
for me the osx menu bar has stopped working in QEMU -- keyboard
shortcuts to it still work but none of the menu buttons respond
to the mouse. Does that happen for anybody else?

Also, the "bring up the docs" help option (which is what this
patch is changing) doesn't seem to work when QEMU is run from
the source tree and the docs haven't been installed to the
locations where it expects it might find them. Probably the
code needs updating to work with qemu_find_file() or some
variant on it.

-- PMM

