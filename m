Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F158BE12
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 00:48:27 +0200 (CEST)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKp4L-0006Yu-Km
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 18:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKp2q-0005Cd-L3
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 18:46:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKp2o-0001Hd-VN
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 18:46:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id 17so7031855plj.10
 for <qemu-devel@nongnu.org>; Sun, 07 Aug 2022 15:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=U4AeULUgcvdlxEJ37DH22PHgQ6w7Vbu5WFEkUkkPbgw=;
 b=ghDCsYGyR1fyK8q1BUf16zxVklApwmV8chM8m0cp+miL5LTKPZafUx6YdSD7T3vAYL
 QbGaAdMn/kttO8qyk40nPY5aGyvyrS1bYeOLHGJ8Bi3SuwB+3MLlZoveW/RHD5afw/dU
 Dq4V3m+3yQRzjbd1do5Ve3zqcEGPUJ1GmRkY6sKIPlRletDV3jf0Us2SQD83W4/ioXio
 DuxChm/EslIv+mByVL1eCW+NJvRw7B1dYReHPs7wiGvsmwT0hs7WRWrC3ACE0D+dND7r
 cehWvApiweI2+zAl452eDxngpgF7c+G1MmI9fsxyAkDfRnqq9zryc2lspHGi76njA27P
 dqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=U4AeULUgcvdlxEJ37DH22PHgQ6w7Vbu5WFEkUkkPbgw=;
 b=5Wt+225DWKFOsSFPCMCgteciiKMdnIHVUf0X7ZQ6k+HcBVmm5qZG9YSVBnAJImE5tZ
 uKyV6fkZrWGJa7frr/KGKbih2KnJUkILXzOfQArNt4HYEF3YtCA7nVJu9MVszhOXb4+3
 dkeNSwnF1HT8ZoGxawnYkLUaWFV0rAyqnOV4vsk1R1ZtuSiKIXgs9NTmCB+17Ia/KVsK
 VcHmyPaYmfIgscZx6ouwcfAkMV+Fo5EnDYpN5GUSBFq5FpAW18x2mIgfAt/QEumPGWzu
 Hp2fhWbo7SUV+RSZHDEtzijMNayzVb+JnoBOi3qJ6cdji7Iioa7WpblqP598gsehEMlD
 7Qfw==
X-Gm-Message-State: ACgBeo0a+WORJK4ZSi63fzaWo8qDl2SIaYnjNCAIOhsZgrvuxsIDUVR4
 egXff6wW1T60xdMwCNirkcf7/+x5k2prQCMOGlU=
X-Google-Smtp-Source: AA6agR4SylyyUmDR+SKl7iBxKgrA/wnK3dl9/6cAirv8P7y2/A9RBqEWTvA2j2K5945UnplhjcZvBbGPZi4xM84f7Os=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr17716442pjb.120.1659912408825; Sun, 07
 Aug 2022 15:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-12-danielhb413@gmail.com>
In-Reply-To: <20220805093948.82561-12-danielhb413@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:46:22 +1000
Message-ID: <CAKmqyKO8geDgYszPQC5OsqK2zdeBYi0D563EMizSmax0jVGiXA@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v2 11/20] hw/riscv: set machine->fdt in
 sifive_u_machine_init()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Aug 5, 2022 at 7:49 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
> the sifive_u machine.
>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e4c814a3ea..10f5289966 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -634,6 +634,14 @@ static void sifive_u_machine_init(MachineState *machine)
>          start_addr_hi32 = (uint64_t)start_addr >> 32;
>      }
>
> +    /*
> +     * Update the machine->fdt pointer to enable support for
> +     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to shrink
> +     * the blob size we're going to store.
> +     */
> +    fdt_pack(s->fdt);
> +    machine->fdt = s->fdt;
> +
>      /* reset vector */
>      uint32_t reset_vec[12] = {
>          s->msel,                       /* MSEL pin state */
> --
> 2.36.1
>
>

