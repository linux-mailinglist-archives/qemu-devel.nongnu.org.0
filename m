Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9184DCA8C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:52:31 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsQJ-0006M8-HA
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:52:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsO1-0005SW-6u
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:50:01 -0400
Received: from [2607:f8b0:4864:20::b32] (port=45742
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsNz-0006YG-J6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:50:00 -0400
Received: by mail-yb1-xb32.google.com with SMTP id t33so3385700ybt.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JlrUiQWZUNJYbLo3LDB9lybhRKEGfBQ5VzLhG1e7xjQ=;
 b=iMKH1mSz8+ooi7Xg13Y0SV/UYQDk8Cv3/6JnIIXoI6C33BTMerpqWP5dKMfIzElaJb
 QOICFnm3nMYwgV/mjLGxCL9snVaITQK5uGvcfRbBY0sftRc5msN8D5g8WUVV5qe5S7pP
 2f/uM5xssYB2WPfketUdj+8cHl6PvoHFuOGCccBlUFvA9X7wRGG0AreMKJ49M4KKrSv2
 H507yprOb432IFHabbyraV+uW6nJRXEdycsbrsabKk9tZTh1jTCKAaeYdhiHF3Sw9Pnw
 LxmvDymzK2PcONUiXNkrjjoKnf+OhiAIlhITum0WMrLietMuMgKsjlzENrTE91Nca9ow
 2mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JlrUiQWZUNJYbLo3LDB9lybhRKEGfBQ5VzLhG1e7xjQ=;
 b=hqObIGumkHN7WwYDN6EsSYGkV2iDJhPRaE3kR7iTXIMxssNDWTXvi8IMJ/iusdWXiI
 re+2l47G162fP90XPn0whus1gQA0tLMk/cwbiojDhkpxxkHOdkMJjfGJQvO8OilId9nZ
 i/gxIINsA1YoJ2W5E7gQvVi0vA9Eb6UaEtLxyeVGhyR3hmAmEMcyt7hxgtgu0jfkh58p
 sVZihdXIh0HEy+N8qX2AfvdPNEK7PVBa9aWqBW/0HXUwkoGiQLk+I3mvibEEemgHPGAa
 ix2phs+9uONLHAbHiH8n4S6a/alpSzVjC6Z/h7SLCumshF9xFUnCfwyIvsahn2yEVlQA
 GKow==
X-Gm-Message-State: AOAM530r1A13wu3x2a9cBMdJZXTuEGrp5KZ8oTuU2pMSBdcu+WagC3Ai
 sNCUualdBsny3Yws1d6ftiqLD08Xg7ZpcIHXOacrpg==
X-Google-Smtp-Source: ABdhPJyjZMfqM9j8n7nQ1I3h86LtcqjQUWVIeUix4mEcs5b+K7ywnA7hvW3ioEMJW8Ju8FTsvJmCIFYLmP7YBwMw1gE=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr5667766ybf.288.1647532196995; Thu, 17
 Mar 2022 08:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-27-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:49:45 +0000
Message-ID: <CAFEAcA_HLwHWKb44U4Dp_jsCyam8kEuAgKjszWPt2vnaEApoYw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 26/51] target/nios2: Prevent writes to
 read-only or reserved control fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create an array of masks which detail the writable and readonly
> bits for each control register.  Apply them when writing to
> control registers, including the write to status during eret.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -34,6 +34,15 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
>  #ifndef CONFIG_USER_ONLY
>  void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
>  {
> +    Nios2CPU *cpu = env_archcpu(env);
> +
> +    /*
> +     * Both estatus and bstatus have no constraints on write;
> +     * do not allow reserved fields in status to be set.
> +     */
> +    new_status &= (cpu->cr_state[CR_STATUS].writable |
> +                   cpu->cr_state[CR_STATUS].readonly);
> +
>      env->ctrl[CR_STATUS] = new_status;

Isn't this allowing the guest to write to readonly bits ?

>      env->pc = new_pc;
>      cpu_loop_exit(env_cpu(env));

-- PMM

