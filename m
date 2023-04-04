Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F171A6D64C1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:06:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhIw-0008Vg-H0; Tue, 04 Apr 2023 10:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjhIt-0008Tq-RP
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:06:31 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjhIs-0007sb-Cq
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:06:31 -0400
Received: by mail-ed1-x52a.google.com with SMTP id ew6so131010045edb.7
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680617188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y02ISY3S09ifnrM8H4uPfcAcu3d/CzkYDRLxsqqisMg=;
 b=BLFvj1F54Gjoq5trao8J1a6ohTNKoeMyNgrFwV79aJp8OS3LBOqt+z7lQ/X6TyoeAU
 HGQi491Jgua0hjJIA35vqQunPMfD7IS0Le+CdU8NLhJHZgoNQoE3kYX3sAtfTRRZUmyU
 OQig1KAVFZqXdqelhSsCJogrgHETvJtWUxcPdnMn8Yt3cmXoFmU9IJJJ9xYKK6T+h3oE
 j+QX1h+/g3N9oSAy/15P8fmkqaRrH2vwy0vaMKUPeVKGb9NcxI/9RVl2b/HRQG/5p+0U
 2cL97d2JrUYooit8DdVsKpkxe71sz3sIR8xq+oofOWOMGADCgBo8I+RTikxeya/XQVJZ
 T34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y02ISY3S09ifnrM8H4uPfcAcu3d/CzkYDRLxsqqisMg=;
 b=fqM1EU0513p5vFOJHXrmFpW68LQ8VMQIp+6L3QUmcGm3kwZ8mLI2Cn43CtNxa0zP+s
 2d/UomTikrBq4/jP7lpUYoXsMn6pHksXE4QRyNYfbJm9DHU/YZ/PY/Z7cdepbmKj7aSu
 IW+ODG6qs71wgTphMu4ZRYROJvCcx0co1L+g3T6p0gFx/Wo38LG1U8f++hCoN5WnOf43
 Jn42IhLodEi2zLZctbh7M6vg+9L6RTaKYAkx9NMYk4kzIBXHgi9rlBBXF0euAAVjYx0a
 +vRhbbD4TV6I8X9NtNFZ3vZNh/kfa5DYg72Ej4il09ijX3X1Mr+DLloBJwZMY+DlnFX0
 p5yw==
X-Gm-Message-State: AAQBX9dw38lkow515ublAtIuIFiByBOmr3JdoujGzsQc9RjpP8W78ShP
 2+hkeL+3g40+JYeIlC38V3YnjE+ttLgge5t5pasHhw==
X-Google-Smtp-Source: AKy350YFrrjAxe+4nqZRYGSqnTjby6ct2aZsyrv6Br18IzFcirQV+4rtD3B6OUR1Fe+x1Ub1Ud6bYLDVncRw+H9CFPs=
X-Received: by 2002:a17:906:3701:b0:920:da8c:f7b0 with SMTP id
 d1-20020a170906370100b00920da8cf7b0mr1292839ejc.6.1680617188203; Tue, 04 Apr
 2023 07:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-4-richard.henderson@linaro.org>
In-Reply-To: <20230401045106.3885562-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 15:06:17 +0100
Message-ID: <CAFEAcA9j2Nre+OZbRhOWg-dAq+2-YKLt5oeevW7YXFtoS1gyJA@mail.gmail.com>
Subject: Re: [PATCH 3/3] accel/tcg: Fix jump cache set in cpu_exec_loop
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Sat, 1 Apr 2023 at 05:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Assign pc and use store_release to assign tb.
>
> Fixes: 2dd5b7a1b91 ("accel/tcg: Move jmp-cache `CF_PCREL` checks to caller")
> Reported-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

I don't fully understand the code here, but before 2dd5b7a1b91
this was a callsite for tb_jmp_cache_set(), 2dd5b7a1b91
expanded out the call but forgot the CF_PCREL half of the if,
and this patch restores it. Which all seems logical, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

