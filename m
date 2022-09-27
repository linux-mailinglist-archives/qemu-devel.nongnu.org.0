Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA875EC69B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:38:08 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBio-0006B5-LF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odAHo-0001Cp-Vf
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:06:09 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odAHn-0002x7-7i
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:06:08 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bj12so20505624ejb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=7zlAeg6JuU6OQZjGNcJyoSLPkw665ZW8XUzKem6q4S4=;
 b=SHxFnfeGAES8euDkXcJcJKCzZsmCMeBREc7/rlthAluE9Vw2b9qzm1ogTzw0tRD44j
 77IvVOQ8OqhYLTdyNhyeu9YxIatBY/Oe7yO2v3MeVfD09uN+GRM47Xh8Dzcx5FUHe4/9
 WeWXBs6veE5nEflNTgNngzHvOKjKrfv5hmC0jYXUKQ+NUoJ0ESfsTWFTidIJJMCieLv/
 8gPD5k0pizVWYQM4XjZDqFtbOZYlzuMsfXrYnAoPAguyzyPYXyEQsqh1fgWMxYQA+cfD
 QEaCkV388ZeQwxGZjEPalOUTb3+OskHny1XvnOCz7qCK7qhdU2wEBX2MffiHDT8A5t/p
 a60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7zlAeg6JuU6OQZjGNcJyoSLPkw665ZW8XUzKem6q4S4=;
 b=PtDH0eEH6FOxOZ0csoF/FGOaMVpMFYYXBvAhSrfJHNLcKrsnQPxs3Xu6dioG6AkBG7
 T6e57j4KhOieHxd01eGZ7hqcwwjeeu0EcGmGkWty9ev1dLNyXBL5DS+0Famg0DGXEicq
 F7pD/vspHonOQnDDsvQIPnOoW3zu2sQhqtD11pZYCAhRYAqD5pWJ0/e36v66lyZLj8Cv
 nd4GfbobNEWEr7nuXxSdr1nGUqFS7VnYrOVk5qhDevgwOzIx+M0c1/hyMKR6wYgyGTX0
 0fwYM/sVpCI1K76PcS9mY/GDbGlFENCLQKFgLzEpMoE4YNUFWIqqwN4+PQ1gNlJQdUPS
 Xjzw==
X-Gm-Message-State: ACrzQf3mrkrtOa/Yw6XhOaAL19+zZGu6vkA5xKNPwU3OXqOTJ4Xg5T6Z
 gKys4LxeuC6SsPdcpj6/d3fEElW2YtKNgIb8fPsKKQ==
X-Google-Smtp-Source: AMsMyM5RV06AdNbjPRyDZiMxMsxtj4sUKyHPAgBglp9cJSQ2EwrrmMyAUdvwYNebrkkXPKeQc12jUOuTWz7gtELi/xQ=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr21989244ejb.609.1664283965399; Tue, 27
 Sep 2022 06:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-6-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-6-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 14:05:54 +0100
Message-ID: <CAFEAcA_2UE4bP8qh-4GgQudyDYZmj6Ou5XhqN0a0B+ojs_v43g@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] target/arm: Add ARMCacheAttrs to the signature of
 pmsav8_mpu_lookup
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup to prepare
> for the Cortex-R52 MPU which uses and combines cache attributes
> of different translation levels.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

> +bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
> +                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
> +                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
> +                       int *prot, bool *is_subpage,
> +                       ARMMMUFaultInfo *fi, uint32_t *mregion,
> +                       ARMCacheAttrs *cacheattrs);

When you next rebase this series on current upstream, you'll find
there's been a refactoring of the ptw.c code, so that instead of
passing half a dozen pointers to each function, we pass a
single GetPhysAddrResult* for the function to fill in. That
struct includes an "ARMCacheAttrs cacheattrs" field, so
pmsav8_mpu_lookup() has access to fill it in, and this
patch won't be necessary.

thanks
-- PMM

