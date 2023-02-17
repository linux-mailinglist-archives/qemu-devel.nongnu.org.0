Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6469AF94
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2jI-0007sj-71; Fri, 17 Feb 2023 10:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pT2jG-0007sX-73
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:32:54 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pT2jE-0007JB-LT
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:32:53 -0500
Received: by mail-pj1-x1031.google.com with SMTP id oo3so23820pjb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H3/suotgdEcuwaacJi/IHnbJovylEiGIrDSwa/AwIWM=;
 b=U9H/oGIykrhkgUi4eaIBsEEMnBCeRbVMoLGceKogdkDsyS6W0udunH4yRgKNA8qsZV
 VOkfDd2f3sDPZ9q8BrZ09r/CDoeDrfipKyb9NuwyILWs+Y0nuoSAv/STkNZwVXG90X+5
 tXrZPKWdyikqf7gJiZzGebgZiSUQQKDIZYXu/7gvPHyk7cL8T6kOoSjCoZ+R+asPUqki
 9cmU9+TBmjCXMl2wRjsii6iiro8YH/qx7/vtC3HL7YDYycCrWiWsaqe8LfMTTS3OYndx
 bjqQzPXcZWEn3V3qVF5jGzdpIHlKhbQi6MQrwjBiIrkvsnOLEsiz4nz2onT1I3Jmiuhf
 w+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3/suotgdEcuwaacJi/IHnbJovylEiGIrDSwa/AwIWM=;
 b=Htk1KHmgLWTQ0WioRigT9jDJcAtT1V2Q2n1o1iEZhViXaMYsJqCzYI8x5cWkhFdv3S
 f8eAxJFoF8v7FXSKt3Vxikn3irxQKmAgVglVSnNn9vFzMDGnfsyubdh/CjRvBlMi729b
 C5inTyRzOnDhqYMmlDWUxkRrm6EEblVnBLBEChDZssJOuIexGLF6Ink/piGZdR18x3TQ
 QRSbr77hKJCDBX7gMbmUIL06c0KEU5SRr3dbjzPckpOKL/h3t1gcC0DndWqtGilaECjD
 yqLoDmy05lAyFh1u3OrSRcjChUFgEKNo0ntRyiEeiSGvCd2j1PIlHqaYxVIx7Mcn99ey
 8SaA==
X-Gm-Message-State: AO0yUKUMJcOrqkBT0Qxo61v0U8pFknmyxysHgR0SKuwEvoBJHSDVG/o7
 sloeonLiD3wT8BTGZ2biFymhFrZ52X9IHEMUDr7HfQ==
X-Google-Smtp-Source: AK7set8zvsYTvfZd6Rz7fJrqbs9L6dK7scrsHCVbFaiopjIVKNHsy03Yw7QNRpADWXRdFllUbietjXopwYT1rZRJCi4=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1733748pjb.92.1676647971390; Fri, 17
 Feb 2023 07:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-2-pierrick.bouvier@linaro.org>
In-Reply-To: <20230216134911.6803-2-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2023 15:32:40 +0000
Message-ID: <CAFEAcA9yGESbN6GbX-mBL16gPkEacE+xGN6K3mF8nCLGuwJdQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] util/cacheflush: fix cache on windows-arm64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 richard.henderson@linaro.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 13:49, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> ctr_el0 access is privileged on this platform and fails as an illegal
> instruction.
>
> Windows does not offer a way to flush data cache from userspace, and
> only FlushInstructionCache is available in Windows API.
>
> The generic implementation of flush_idcache_range uses,
> __builtin___clear_cache, which already use the FlushInstructionCache
> function. So we rely on that.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  util/cacheflush.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/util/cacheflush.c b/util/cacheflush.c
> index 2c2c73e085..0a0acd70fa 100644
> --- a/util/cacheflush.c
> +++ b/util/cacheflush.c
> @@ -121,8 +121,10 @@ static void sys_cache_info(int *isize, int *dsize)
>  static bool have_coherent_icache;
>  #endif
>
> -#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
> -/* Apple does not expose CTR_EL0, so we must use system interfaces. */
> +#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
> +/* Apple does not expose CTR_EL0, so we must use system interfaces.
> + * Windows neither, but we use a generic implementation of flush_idcache_range
> + * in this case. */

QEMU multiline comment syntax requires the /* and */ to be
on lines of their own (here and in your other comment).

thanks
-- PMM

