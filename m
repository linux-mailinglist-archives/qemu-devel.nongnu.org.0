Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EED2E8773
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 14:20:44 +0100 (CET)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvgpn-0001A0-7r
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 08:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvgmK-0000DT-OB
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:17:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvgmE-0000sR-49
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:17:08 -0500
Received: by mail-ej1-x62d.google.com with SMTP id q22so30497444eja.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Vu/dcABqb0MzI75FHAFPcY8gchkySpCEtt60bb3XMc=;
 b=zAhMH4lnjaYHw5pcie/jRBXo1wzrGeX1g/4H2p1Ol0FJDxdw0A3PthebTyvCtLvBca
 jKK4cm4cy3YzgFDvGYrgiUBQMeQLruBwoYg0G9hPfpYhRfh4a287/FNsk2APFSXpM8MI
 GAvN+7WfgvCim+cM61HU/Dy+L94HCW4WStlycThtT2Xt/0MZtnUiUdjjtIGIuVxUlBUj
 QE50MaA4A9HHdRjdx3PURYu26gbsdRoU+Bm8BUalTqN+dOjlh+uw9iCnBdBjYoEhw8gA
 y2lekllqcWWJcYqvSfzpFnRPjUThCS0m5zIchW/AGVXCgKDTRfOCpEuXbfPC6fG9rEoJ
 KxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Vu/dcABqb0MzI75FHAFPcY8gchkySpCEtt60bb3XMc=;
 b=VNkgL2KoN6blbMObmks/AmUyLLvT1Mb8aa0WO6whw2I+dt7VpiNR3QzxZ0rQeEC7CF
 mhtX0rerC2J2V5DTpzMYSxq2ZQg65PtKcC2ivdQUNFBVuoEdNZv3whA+Nwkk9+WgordI
 UzwF/9kl984tf4B28DXWklPyAJQ3Ve9XXL4s1jJIIX0jiibkCOmtHJS6x2wke2A4B+7v
 pYyE2Tcl0komGyVWi/jkbTEbiVnoi4Rulb+XLOMbDO/a4kFTpaRWrS2IYwMH4HNLO4uJ
 cx/tqD9RdMiPhM00GiV/nWJWTgo0ErVzdxHQT7zGvT+dRRDUFu8HeiY1HenZwgpKhDqk
 zOAA==
X-Gm-Message-State: AOAM531isPHv8Jvv4MYXqvRqApyTlHF2em+qFs3fxqLeqD0R1Ku+DamC
 g4YY4c5ShCEi3T9TLIp/oHOqMjy6CFYGspnMFcRmjA==
X-Google-Smtp-Source: ABdhPJy52f7ClXvsLuLwUJS2QrQ5ifQlzjH7ukl3XVJp5WhqOuRqVXmxdCxauUbEMP+ZAXz6erxk9QMiP99Bqc8RqOg=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr60239800ejr.482.1609593419768; 
 Sat, 02 Jan 2021 05:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20210102125154.41182-1-r.bolshakov@yadro.com>
In-Reply-To: <20210102125154.41182-1-r.bolshakov@yadro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jan 2021 13:16:48 +0000
Message-ID: <CAFEAcA_jTfLjgwPFXQ9TYv1hNK-G1HsXYq7m_eJodDtTPhuH2A@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Sat, 2 Jan 2021 at 12:52, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
>       [-Wdeprecated-declarations]
>         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
>                                            ^
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
>       'openFile:' has been explicitly marked deprecated here
> - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> ^
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  ui/cocoa.m | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index f32adc3074..5909758a09 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1178,6 +1178,7 @@ QemuCocoaView *cocoaView;
>      /* Where to look for local files */
>      NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"../docs/"};
>      NSString *full_file_path;
> +    NSURL *full_file_url;
>
>      /* iterate thru the possible paths until the file is found */
>      int index;
> @@ -1186,7 +1187,8 @@ QemuCocoaView *cocoaView;
>          full_file_path = [full_file_path stringByDeletingLastPathComponent];
>          full_file_path = [NSString stringWithFormat: @"%@/%@%@", full_file_path,
>                            path_array[index], filename];
> -        if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> +        full_file_url = [NSURL URLWithString: full_file_path];
> +        if ([[NSWorkspace sharedWorkspace] openURL: full_file_url] == YES) {
>              return;
>          }

The NSURL URLWithString method documentation:
https://developer.apple.com/documentation/foundation/nsurl/1572047-urlwithstring
says:
# Important
# To create NSURL objects for file system paths, use
fileURLWithPath:isDirectory:
# instead.

Should we be doing that instead ?

thanks
-- PMM

