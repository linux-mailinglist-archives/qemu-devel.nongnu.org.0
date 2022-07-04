Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF95659E6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:32:44 +0200 (CEST)
Received: from localhost ([::1]:56468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O43-0004mZ-LY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Nzk-0007yX-0z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:28:16 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Nzi-00034G-EB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:28:15 -0400
Received: by mail-yb1-xb34.google.com with SMTP id l11so17409284ybu.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axUzXJT25gaTGOixzDSBa4XGgi9We+8IsX78+r6s7ng=;
 b=Jgy8lrTUq8Sv+FP1MB+qJlg6McwuhkQ3E4KXiOow3lj06I/IDgQR4cYts1SLx85dgU
 Dy3qIKnAhR3sOjPfQluK2N9W+iVTruLAUSp7aRC/njM8z7ivPlcqJzPe7+aB2vQIKT7/
 ZTAetrezbYmjJccBKpl4f0NN+CSFIrofGVHzc+EgP+cYgw0FA6sj9lVYLt+zJFkoUXJ8
 tfzpWBjBYDvhxFwoxtQ2lKpbAqOBm+JJxJITWyLPsk7d4J5zZDgXJA4Echfv+KnG4nG8
 6pQvFn437o2cANwFEqOdlPmWa6qPYxIlSZTPx00Synfdt0OO6E/yovUXo7K4NdWof+vX
 joqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axUzXJT25gaTGOixzDSBa4XGgi9We+8IsX78+r6s7ng=;
 b=ngBocXptUXnsk7qdBIyJbhT1rjz0VVHGymXUHQ8JNXkYG5V7+BTYdweHMjVOMXp0y5
 kYXH+FMR+weDeraYQ/g2qyQ1gop+ZK9f/+U7lWs3JM5MRsJ4rlz26g4fr8S0m8gMa2oK
 SSLyJ47Ueeh6QtVgW4NtkNUCBAnaKthFDbIfHruJJPpD+ddV4cMPv8rZfMyfDWNcaIQ7
 l8tyVAJQ9HkCHubkxTY/eUbUHMmtgRDc9L3KdzZwmBo3QWARVUArStiER2cge43ml5tM
 CgWttrQHOo2JVAmlhn+MaGYcza4hYyA2m+Mtl4kFBdJLjRv0TwBllFNgZgrBrKNHMAos
 uzOg==
X-Gm-Message-State: AJIora9TPe5+uGebIcJdcZOIfCJXZMxTbIOidQ9MYjV+vJPOSaNH08wg
 DpUx9uzSemJ4B31IG3ptVhBl4LXbz9yNTaVP+sCVMw==
X-Google-Smtp-Source: AGRyM1tfOr9WBfwl11uLevCiwowD9dSeLQBPFOP5IXiZZ7z30uQcIce7a/sEoTiL5kL8ISUeeoTxROc+YcnVM5Gen0M=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr12864882ybf.67.1656948493249; Mon, 04
 Jul 2022 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-2-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:28:02 +0100
Message-ID: <CAFEAcA-2fsJoHkaq1a_k+_D2V1J2oPkDZ+7Ua=tge--ay5HG7Q@mail.gmail.com>
Subject: Re: [PATCH 01/62] accel/tcg: Introduce PageEntryExtra
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an optional structure, controlled by TARGET_PAGE_ENTRY_EXTRA,
> that allows arbitrary extra data to be saved in the TLB for a
> given page.  Set it with tlb_set_page_with_extra() and fetch it
> with probe_access_extra().
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> -/* Add a new TLB entry. At most one entry for a given virtual address
> +/*
> + * Add a new TLB entry. At most one entry for a given virtual address
>   * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
>   * supplied size is only used by tlb_flush_page.
>   *
>   * Called from TCG-generated code, which is under an RCU read-side
>   * critical section.
> + *
> + * Returns a pointer to the iotlb entry, with env_tlb(env)->c.lock
> + * still locked, for final additions to the iotlb entry.  The caller
> + * must unlock the lock.
>   */
> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> -                             hwaddr paddr, MemTxAttrs attrs, int prot,
> -                             int mmu_idx, target_ulong size)
> +void tlb_set_page_with_extra(CPUState *cpu, target_ulong vaddr, hwaddr paddr,
> +                             MemTxAttrs attrs, PageEntryExtra extra,
> +                             int prot, int mmu_idx, target_ulong size)

The comment claims it returns a pointer to the iotlb entry, but
the code says it returns void... leftover from a previous design?

>  {
>      CPUArchState *env = cpu->env_ptr;
>      CPUTLB *tlb = env_tlb(env);

-- PMM

