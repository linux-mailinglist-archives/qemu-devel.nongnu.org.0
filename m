Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36464899F9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:31:26 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ulh-000599-UR
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:31:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6udE-0001H7-Pl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:22:42 -0500
Received: from [2a00:1450:4864:20::42f] (port=42580
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6udC-0001zy-Cm
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:22:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id k30so9162343wrd.9
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01pfD9vRovZmXoIMeO0XdXXCy+Vz7Fot+bFTPDJAxs4=;
 b=tCUnYYwP7jUjI4btGTzU9RYNCGpIw6oNrmd/wg9lvBDD1mkL/fPgZyer+LYVSOukDX
 Ot44lLgbZ0tnR/1VM3WzGLBMa2kNt6q7tLRrIUEhXRSBofgUWPAKeL0QvYL1vImxF+Uw
 834BeVbyxTQ35KUqkc/GuWwhG2o5Z3upsTxQ9xEcMhDWz3Tm728d4ybwC3wt45DxxFj+
 u7F88KwfHNZTXxVTJCMPiTWb+XqsUfyAJpN1+lU4GZIZGTjyVokeO0/Tza5GX+aMkJOp
 jRc3soYMcjCml+Pa8oXydDL5X3ZRB6Fvm4lof952aC7BzzXZNvDif2G1BpBZBlgcRaQc
 76dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01pfD9vRovZmXoIMeO0XdXXCy+Vz7Fot+bFTPDJAxs4=;
 b=fViD02uBGf2yLLA80TU3+0209LGmplY69x90h2H94dLtE3PomvY/v4ZnPppfs4Tk54
 r+Ca6ihQzgZd4FFdXTEk/knFFlW+hLkX6oZ4f9GjtB2hHbyAcUs2tL2Y3ABu/liCnoJH
 UcIn6zaQAu3+IpGkS1LWws5vy9+8jyvr2GVjqJw8sOUOWhvXU35TlxZ+egn10TcV2kif
 oe40foJgWzy41Usd+tPvpQzgRPKxsEnwQ7WQOgfNtppvrxJkjIKZ9AuxExZsPANPBTpk
 GlFHcnWjzeo8k2yLDEnkrFr+FFdlPV16tzyCvKah++LVpUQXX27ya9nF0kWzoIxw88uD
 DGgQ==
X-Gm-Message-State: AOAM532f9TXhPRHAWf5BQNN/6j39qV893Teeeg9eCyr5nNDa2f0Koh7Y
 72Rk4nd7nWvF/EbOR7g2GHjL5sRNeNAVSM52Bap9mONWRPIycQ==
X-Google-Smtp-Source: ABdhPJxGrR3mh3Cw5z4GJ+iFRnDJGims+AIL72K0j+mot6jub+QADxJnJHAnvPoxJNS4oQIOJhx6bHKwYSGjpwpxTkY=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr13956125wru.172.1641820956995; 
 Mon, 10 Jan 2022 05:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20220106104137.732883-1-laurent@vivier.eu>
 <20220106104137.732883-21-laurent@vivier.eu>
In-Reply-To: <20220106104137.732883-21-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 13:22:25 +0000
Message-ID: <CAFEAcA-7=UgpBHP=PXzqRsKLJMV0+HYrd+Kr3mU-aX=qjwBkXw@mail.gmail.com>
Subject: Re: [PULL 20/27] linux-user/nios2: Map a real kuser page
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 at 11:01, Laurent Vivier <laurent@vivier.eu> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> The first word of page1 is data, so the whole thing
> can't be implemented with emulation of addresses.
> Use init_guest_commpage for the allocation.
>
> Hijack trap number 16 to implement cmpxchg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20211221025012.1057923-5-richard.henderson@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/elfload.c        | 50 ++++++++++++++++++++++++++++++++++++-
>  linux-user/nios2/cpu_loop.c | 50 ++++++++++++++++++++-----------------
>  target/nios2/translate.c    |  9 -------
>  3 files changed, 76 insertions(+), 33 deletions(-)

Hi; on my local Linux box clang complains about this code:

> @@ -2374,6 +2420,8 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>          } else {
>              offset = -(HI_COMMPAGE & -align);
>          }
> +    } else if (LO_COMMPAGE) {
> +        loaddr = MIN(loaddr, LO_COMMPAGE & -align);
>      }
>
>      addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);

../../linux-user/elfload.c:2423:16: error: converting the result of
'<<' to a boolean always evaluates to true
[-Werror,-Wtautological-constant-compare]
    } else if (LO_COMMPAGE) {
               ^
../../linux-user/elfload.c:1102:22: note: expanded from macro 'LO_COMMPAGE'
#define LO_COMMPAGE  TARGET_PAGE_SIZE
                     ^
/mnt/nvmedisk/linaro/qemu-for-merges/include/exec/cpu-all.h:231:31:
note: expanded from macro 'TARGET_PAGE_SIZE'
#define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
                              ^
1 error generated.

Using "if (LO_COMMPAGE != 0)" shuts the compiler up.

This is with clang version 10.0.0-4ubuntu1.

-- PMM

