Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E3150B1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 17:51:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNftX-0004pb-5N
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 11:51:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hNfsU-0004RR-5y
	for qemu-devel@nongnu.org; Mon, 06 May 2019 11:50:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hNfsT-0004rF-79
	for qemu-devel@nongnu.org; Mon, 06 May 2019 11:50:06 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:33358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hNfsS-0004pe-Si; Mon, 06 May 2019 11:50:05 -0400
Received: by mail-lj1-x241.google.com with SMTP id f23so11550183ljc.0;
	Mon, 06 May 2019 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YzBFLfOBNQD3UddUpNEOA3LwTR9aw0kS6lW55P95JdU=;
	b=TXtUfHJ/tlWKxLsRSf+QeJx5I6bzJhk1v4+pIVoZW1xW+DqROBb60WeUw83Lkia3f4
	OsZIi6k6FwvsGs6SDYAyYXxslhnV3h8NTsMSOY9qQKFDyltbgZMIVpvNYM2nO1nJ8rNa
	lKVVgbvTkF0s22sqS0qi4RGvpjQl2l91tewQ3DR+7XW7l8xCULdDKbNRoasT5yuxXRJD
	PQO74p0ZYwrMuhhoePO/6c2iHpP+z2jml1c/n65nCTEdNRoaIs2dzsF08DrxIc5YtjJL
	gO0Sn9hoJuuFN7gHmIsyDMmgp9cVmGEz/mjfmgFDKqNWoYN1dbKTwSIYhcZxcDcYIjPy
	mXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YzBFLfOBNQD3UddUpNEOA3LwTR9aw0kS6lW55P95JdU=;
	b=LAOOh5y3/4HyT/Ke7V60kKOLPWBYL9q/NZLCmTLxjg3WQ/gm9luj77ENEH1a/8Q3n9
	45NSR2KaAQSVpcb6849+OI6eGWXBYUKzQMlx2hnVYwUA+UvDyVx+sN9ntOy4NGzKnnkP
	+Oa/4XjvA/vaeCqFad8XwLbCFupSEBBo/Ulxj4ZOXXzkvW7Wcz0Y8EpK4W6rlXyFsanA
	o2hWCwKOfoOWyh76fS2aRFR/0eS/plOGx6/7QsBmEur9N53DYlRnNIM2x93Vz9y2An1k
	Hz9wC2sPN6N3TbiAB4N3AsLlCBof9Q0Ux2nAcbeA6h5ZgIBq69Oo0/fHQ8B7SzR82JbG
	xjmw==
X-Gm-Message-State: APjAAAV7Ay+QUsSWzMLfG/lmYVVgCEcau+tG5KQ1MapOkcVli8WPxKIm
	PTaDa2gAzJCAEdwKzDkAlCCLFiYSosjUABHDqml1l6Kh
X-Google-Smtp-Source: APXvYqx1RtrxJfKjJfkhihbQFKc1dcpoKPxa9QVhhTV+VeD06/aRqU2juURTGWWoIOB0+bCTIvuYD8Q88yGP146kzIw=
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr14240886ljj.104.1557157803107;
	Mon, 06 May 2019 08:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVFj9yhbjPY=_+LNDWwO=Q8jLFnH01AbTY8T0p=cmkrNiw@mail.gmail.com>
In-Reply-To: <CANnJOVFj9yhbjPY=_+LNDWwO=Q8jLFnH01AbTY8T0p=cmkrNiw@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 6 May 2019 11:49:36 -0400
Message-ID: <CANnJOVFnA=MT5SnaskcafM5e1nCTzzcXpwKZfHM-2bSx3fnoEA@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH for 4.1] target/riscv: Only flush TLB if
 SATP.ASID changes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Argh, meant to include a signed off by line:

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>

On Mon, May 6, 2019 at 11:31 AM Jonathan Behrens <fintelia@gmail.com> wrote:

> There is an analogous change for ARM here:
> https://patchwork.kernel.org/patch/10649857
> ---
>  target/riscv/csr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6083c782a1..1ec1222da1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno,
> target_ulong val)
>          if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>              return -1;
>          } else {
> -            tlb_flush(CPU(riscv_env_get_cpu(env)));
> +            if((val ^ env->satp) & SATP_ASID) {
> +                tlb_flush(CPU(riscv_env_get_cpu(env)));
> +            }
>              env->satp = val;
>          }
>      }
> --
> 2.20.1
>
>
