Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0D3B8BC1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 03:29:11 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lylVj-0007Uo-Dy
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 21:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lylUe-0006nw-UM; Wed, 30 Jun 2021 21:27:52 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lylUb-0005sP-R4; Wed, 30 Jun 2021 21:27:52 -0400
Received: by mail-il1-x12a.google.com with SMTP id i13so4862850ilu.4;
 Wed, 30 Jun 2021 18:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGugVe3FmRzC0IMdUAvn2yBv3VmysespYls7FeKoAIY=;
 b=CMb4333OD7HsBVy9ZPsRRqGF9POUelEtRC0Y7f67vY0FdBkGc/CtZN9FB6FTnIOdJf
 nvYKPFkVDtvJUhl+b+oJkIMs3jxsGanRX1swozn7S9oVj5kJiznl7qVG9uxOwQa4c+3w
 MdNMbaVi43GWubDxHpxDUoMmIMxAZ7lfREfzL+itCSeHbrXqJ0tJQIRB6qk3A2mpuwJW
 uRuslM58C18vQEmDdaKPeRGIfI82k3jRFVBRnaN1syINuOWxrT7x/lka0HWbtdRQjcqm
 RwvptRLB5Ur1xQRuXwGNXC00k+BS4H8D3d9HhyrOa41rxGTvO+aNiSCyDb+xOkOnmGe+
 Z2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGugVe3FmRzC0IMdUAvn2yBv3VmysespYls7FeKoAIY=;
 b=UbC+DK3UGDY/Qeavw11Tu11Gbj7+/StgobGWSYx61Gw0sYQEKDVPiF7icMttxzLboa
 4msLbGoLbAgwudilI88SEon1KvKnSbfkzPxQzCoUP27+0HwOctIizcwhB188NQCBCZfT
 yt252wZ+AGpxBMc0lnQe4meM1ewBgBnIz63m4VJuTzCHCAXxqZqbbvkCPrcfxNKF0Ge4
 uXvh8mD45byd58lt6OKCZF73wQER8DYXi7rdzzXeEHruOjWLbSgC6vbpbOnHkOV6Ld2/
 qTC8lKjb5DUsqiyplYt7seeQp3NY02a1zI1QcbF4ux6EJHbJWYrYaEaoQQf9jZP2MwHe
 kLmQ==
X-Gm-Message-State: AOAM530HPjC+2R5UB6Oc4OrXZCDXcDRIMYwjc9TmEDl7keqn2rIHIbmT
 ACSUC1l2miQgu9Z7oIQuz9YV5fn4NZuGrHZVs5w=
X-Google-Smtp-Source: ABdhPJwfV8tuT8hpl703rxdnQZPjKOYmUFG3o4gRp03lBxQ1qjUI/+XOXx15CWoXSDuhR1out1NxeaBxE82XzhTlzk4=
X-Received: by 2002:a05:6e02:184a:: with SMTP id
 b10mr3171052ilv.40.1625102867737; 
 Wed, 30 Jun 2021 18:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210627115716.3552-1-bmeng.cn@gmail.com>
In-Reply-To: <20210627115716.3552-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jul 2021 11:27:21 +1000
Message-ID: <CAKmqyKP6ZW=LYY7wHxk2Gxa_0s8z5xFhG=JdoX2SqJGLW6pAKA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Fix some typos
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 27, 2021 at 9:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> %s/CSP/CSR
> %s/thie/the
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/pmp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 82ed020b10..54abf42583 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -456,7 +456,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>  }
>
>  /*
> - * Handle a write to a pmpcfg CSP
> + * Handle a write to a pmpcfg CSR
>   */
>  void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>      target_ulong val)
> @@ -483,7 +483,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>
>
>  /*
> - * Handle a read from a pmpcfg CSP
> + * Handle a read from a pmpcfg CSR
>   */
>  target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>  {
> @@ -502,7 +502,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>
>
>  /*
> - * Handle a write to a pmpaddr CSP
> + * Handle a write to a pmpaddr CSR
>   */
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val)
> @@ -540,7 +540,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>
>
>  /*
> - * Handle a read from a pmpaddr CSP
> + * Handle a read from a pmpaddr CSR
>   */
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>  {
> @@ -593,7 +593,7 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>
>  /*
>   * Calculate the TLB size if the start address or the end address of
> - * PMP entry is presented in thie TLB page.
> + * PMP entry is presented in the TLB page.
>   */
>  static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>                                       target_ulong tlb_sa, target_ulong tlb_ea)
> --
> 2.25.1
>
>

