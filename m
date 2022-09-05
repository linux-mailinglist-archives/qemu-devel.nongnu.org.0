Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A935AD36F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:08:11 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBpi-0002zs-Kg
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVBcl-0006dL-A8
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:54:47 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVBcY-0000to-Ah
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:54:46 -0400
Received: by mail-yb1-xb34.google.com with SMTP id 130so12649361ybw.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3ga/595fE8x15FKGYZ7HmtryMyJtS5OjiEez8PAcw5o=;
 b=yEjtWY76ZPizVlu1XL9OFB9Z4DMiYg5/yOchsjlERe5ZfAlyAzzdXi3lJqQlawZ5oo
 /Wj8iZf8sbf/dz5Y7lxMCXhpfGJFdURCL0bHH/OBjo7I1SFcnNT+H45aqumtTsew88PM
 6b/nt2PCIeUNXU0tThd8S9+8gU3jAhmp9cX/wHnkwto4iBdzJwCPct1DzFkJyECn/fO4
 /bvcp90NPm5zqo19ruh1+GnsAuKvqvxV+pcSe2Ug+g5qI5jvA7fINrXOQXVoUFBt9Sde
 ZWmglNl1wnEgQMJi+M/by3KXcwximp5TGQXc4QKs/EzDGj53EOYbRqOXX/K48VuH6q37
 9Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3ga/595fE8x15FKGYZ7HmtryMyJtS5OjiEez8PAcw5o=;
 b=R8A+hOM7WYfTKymadI7jhUeXN6pmwgufLbxCn0+4aNtGt36SoC8gZLPN91LsCDRwZ1
 vk305h1p8vuCiCIFNHzAbhI5iDkBlVxAaVmps0xgDZTyriqy0NTIgit7lOTc8V8LoLna
 3O/ox3WBitOE/qJPZ5u7aq69twdHvWIXTEawwOwGzvB86fsAMw4yOmQo/TM9yubu95JW
 42r5Rp6BNYpXLaNr//RVxF8Odrk6VXmIhWdZcubYrF5jufJXAhTTktlLCket4mWc4cgj
 VZj+9TZRWjSxaiRqZt+PzIsgoCTLT+hG9KXinevLpBSAg1kMk/pU5+VmSp4pglWGsRLp
 WluQ==
X-Gm-Message-State: ACgBeo0FJSWxBnkEmeK9/JwF0rqZNEejzG9bDelNE8eBd6O9zGK6rWNo
 Zz2SmZjHSb+3NGokLDThzgrahM/GFoXHb9xw1SD00g==
X-Google-Smtp-Source: AA6agR6XPyMJAVOSRTXm/v35RcrqywKbkh7mEzM8mPIH5zGHMVpUXhzWSb+mJRmhJd7/3DA30xv1w/KjJ8T9gNzqgWg=
X-Received: by 2002:a25:c07:0:b0:6a9:3eb:ef4e with SMTP id
 7-20020a250c07000000b006a903ebef4emr4960648ybm.85.1662382472072; 
 Mon, 05 Sep 2022 05:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220905102633.20940-1-pbonzini@redhat.com>
In-Reply-To: <20220905102633.20940-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2022 13:54:20 +0100
Message-ID: <CAFEAcA_UK6ZxkFXh2_P_qBdYptYFNqMPaGV_AMF1orcip4zzKQ@mail.gmail.com>
Subject: Re: [PATCH] coverity: put NUBus under m68k component
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Mon, 5 Sept 2022 at 12:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> It is only used by the Q800 emulation, so put it under that architecture.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-scan/COMPONENTS.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
> index fc1608932e..0e6ab4936e 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -22,7 +22,7 @@ i386
>    ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
>
>  m68k
> -  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
> +  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*|(/include)?/hw/nubus/.*)
>
>  microblaze
>    ~ (/qemu)?((/include)?/hw/microblaze/.*|/target/microblaze/.*)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

On the subject of coverity components:
 * we should drop the 'capstone' component now we've removed that submodule
 * https://scan.coverity.com/projects/qemu?tab=overview says the 'hvf'
   component has 0 lines in it, which suggests we got that regex wrong
   somehow, or there's an ordering issue and some higher-up component
   has already claimed all the files

thanks
-- PMM

