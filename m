Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5AC25A53
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 00:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTDI9-0005Uw-V3
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 18:31:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hTDGh-00056R-Pz
	for qemu-devel@nongnu.org; Tue, 21 May 2019 18:30:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hTDGg-0003aF-Tx
	for qemu-devel@nongnu.org; Tue, 21 May 2019 18:29:59 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:39072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hTDGe-0003Xx-6O; Tue, 21 May 2019 18:29:56 -0400
Received: by mail-lj1-x244.google.com with SMTP id a10so245513ljf.6;
	Tue, 21 May 2019 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=29BSCA2fkS1Y9BJS7UXNaiuMLiXUVDwP1BjDEnpvkxA=;
	b=qZbe5ObguXzNiA/eaFZ6sK4inX5w1Gu9PHNciRaf9VThnF2MTjxRkiPvg8x9GMWoxE
	Fqmks/afQ1IXeFntv1uKWDkwIDrbgQREwxHicQqaq/4x3g/NNzHnOwA1dl7Z9DwpQ0cj
	k8X8YGjX0txyZySF4ebM1utR1PUUFKvGf5vhNPwhp7jxSOCSH7sMOEKDoYUIG3w0PEDN
	oA9a6safnlfHPAf4ZY4rW8o4ZRUQ9ob07whBju7heUMlvJuFVY92gIkG5/4+i8cnhDkJ
	keGcQGz3CvQQ0g8MN6/KUVNn8j2CHGl4bJy3w6mfbUG6NFDNLqCjL8vuveQ+QG62KjkJ
	xsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=29BSCA2fkS1Y9BJS7UXNaiuMLiXUVDwP1BjDEnpvkxA=;
	b=iKSh6Dmtl35Osqn1FuS/zcYiJRZ3bJCX2124bNMqh7oaXcohXGSgrWEEFmzA9pOjBP
	AJ5oXbWgTdqjX4rH73SCQjv+PxPhEjKJBfejH3PgEHdGan8bT4ZHzryF69ejbyhhJTp0
	2bBEg5eww6T4KMbOpjhhZKEyul6R5Sck7vsJa0TzdvMTVR3k0qIdh31tF+gsWfoOB+v7
	80MKKFZRwh0TjWcUPLYU/JAWbRJ6ITvNcu9RZ+5Tot+K0kokP1XbHIkmIQCB6fbOaYVp
	CkJd4QTNX2MUB3CUyG9peFuSfviAOSxtA5SFkCFwxL32V9e/v9Jv3mJu7YK5qPF8zIVC
	LrEQ==
X-Gm-Message-State: APjAAAWa8ianSE+cPwOn1xtF2z0N3cX4t/DpS28INAJt2O/8olSbQpz4
	nYF5CFs6k9zJ+dKLAqGPLzTEnGyDd2eh6wFgTyQ=
X-Google-Smtp-Source: APXvYqz/MAHXOTSVKA+RC6iK5rjiJDgdFXdWhoc29BHQOjv46/a65hjEHXd0beJuPIQngJUHJb3lQcGtQzLpthbLXCs=
X-Received: by 2002:a2e:301a:: with SMTP id w26mr28574251ljw.153.1558477794257;
	Tue, 21 May 2019 15:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
In-Reply-To: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 May 2019 15:27:38 -0700
Message-ID: <CAKmqyKP=n3p7-Nae29kqWSizo_=U6Pyrq_jnnVRzBtHok=tGpA@mail.gmail.com>
To: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCHv3 1/5] RISC-V: Only Check PMP if MMU
 translation succeeds
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 3:44 AM Hesham Almatary
<Hesham.Almatary@cl.cam.ac.uk> wrote:
>
> The current implementation unnecessarily checks for PMP even if MMU translation
> failed. This may trigger a wrong PMP access exception instead of
> a page exception.
>
> For example, the very first instruction fetched after the first satp write in
> S-Mode will trigger a PMP access fault instead of an instruction fetch page
> fault.
>
> This patch prioritises MMU exceptions over PMP exceptions and only checks for
> PMP if MMU translation succeeds.

It's probably worth noting in the commit message that this commit is
only required for the future commits. Otherwise it is a little
confusing.

Alistair

>
> Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
> ---
>  target/riscv/cpu_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 41d6db41c3..40fb47e794 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -401,6 +401,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                    " prot %d\n", __func__, address, ret, pa, prot);
>
>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +        (ret == TRANSLATE_SUCCESS) &&
>          !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
>          ret = TRANSLATE_FAIL;
>      }
> --
> 2.17.1
>
>

