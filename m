Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6226E41F69A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:01:02 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWPeP-0005Gu-11
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mWPbl-0004VP-19
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 16:58:17 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mWPbj-0000ze-Lf
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 16:58:16 -0400
Received: by mail-ed1-x52f.google.com with SMTP id v10so39476671edj.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5VK6qUQFmrggD50kFnZO+WCgmdGLdymijek5r9LC8J0=;
 b=pvNJXLDkEs091zs6cwxxIQsBo8NJuH/fDm1GFZAx8j7b//N2oCcz1Bci8XtddxciaT
 B5YEqw7zzctgVKkm96YLF3EuKvghZu1GkHMIpNgT+JDkEgWYKcpaBSQDxAuNQGJzDuaC
 PYPUJCeHOHaGbva8a4D0xAvDOIZYgTKNjeX0/JXLQ8bVsJEITuxhRVn4tRtfR6JjOpuY
 JmKa5edVaJIKe9SJMSmWudEMXp+nVJ6YTw57YPwt/3cSDTIJaWVC2BImK6jLWz6bj2cM
 oBjKVBY1uEcYFPdR0n5W6JuVYTL8fOi0R08zML8THGZ/sUetSLwcCRZsbZw6scYGdV1o
 wxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5VK6qUQFmrggD50kFnZO+WCgmdGLdymijek5r9LC8J0=;
 b=xMfnh5O0GVwx0TNfJ8tWNStNeHUPB/flh7zUF+sCZvCUbhp2bCfkbquhBqNzHasYjb
 hPELCbWrkBAE8Z+556Hp9vg4bUWXElsd+rpfC6t8mmbTWGwVhGJpycp1AssOtClP5420
 SWBwGaSdE8nxBizR/MDxve5v877XPSHXRlZIF+yv4oe9Cantd/SkRpEEXJunqlfZMoqX
 ak0swK1TXkqflMmWu+WXkhguDLhZhVpWqMePLy3Q6XoJUQeaHVIG5ahNNDXUxbsTHX3I
 XtJEzS37U7O5mihUejZLFnfP1RvUPB57+pukmHaUAlWzMWm2NG4bLf8v2laG2ATVwHeY
 F+Vg==
X-Gm-Message-State: AOAM533la+wA7cq7Yo3LJFYhUn3+ugpj6aHd2m5o8SRhmYIobvuePkS3
 bxXGP4Vhf4gVlGx5p8d3RaZHOutig3ijWSFfuY8=
X-Google-Smtp-Source: ABdhPJzSdsSRdOpH3HMfrrfle+pg6YggXQ7ghOfYfxh78yV4JluFGUt3lQiVIEeVRTj4ZHVRJn6iHegUGIe5zkd0Ylo=
X-Received: by 2002:a05:6402:34d2:: with SMTP id
 w18mr250591edc.222.1633121893493; 
 Fri, 01 Oct 2021 13:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-41-richard.henderson@linaro.org>
In-Reply-To: <20211001171151.1739472-41-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 Oct 2021 13:58:01 -0700
Message-ID: <CAMo8BfLGSV1uOKYRqPkDofgOiasv4dekq6AT6aeJC93yzvbHXQ@mail.gmail.com>
Subject: Re: [PATCH v3 40/41] target/xtensa: Make xtensa_cpu_tlb_fill sysemu
 only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 1, 2021 at 10:15 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The fallback code in raise_sigsegv is sufficient for xtensa.
> Remove the code from cpu_loop that raised SIGSEGV.
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.h          |  2 +-
>  linux-user/xtensa/cpu_loop.c |  9 ---------
>  target/xtensa/cpu.c          |  2 +-
>  target/xtensa/helper.c       | 22 +---------------------
>  4 files changed, 3 insertions(+), 32 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

