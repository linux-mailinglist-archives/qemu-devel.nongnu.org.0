Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AFD131718
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 18:52:12 +0100 (CET)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioWXz-0001nY-CK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 12:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ioWX0-0001HQ-Ky
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ioWWz-0002Eb-GS
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:51:10 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ioWWz-0002C1-8y
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:51:09 -0500
Received: by mail-pf1-x442.google.com with SMTP id x185so27287468pfc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=oC2sr88t+bxCA7MEstlJC7JQToE8IQv/b76cf7Wna2s=;
 b=cXE7GDhRYxyCS5UcqQktkwZTC5TNkE58ZArey/CN5QP2s+uR7kle2b91f711++6jnp
 R7cBZ8PT/Xz722+sPkopoYF9f8+F5perkLq6zZ9WrfsPvx48N5bt3sJh30+FrrX238U/
 J6bYt7RwOGsQz6XPAAUqjbnQyQ3KW6wAjYfK/kxrVdvFBAA1b6hD7RsUPBCFd/MjUurh
 +Ri6H201ZuvmiY7mhHqUKFT+8rLB1lts9axl3IgSvSVjXMO6Rizu0L4jQyAoTHlEY3rA
 QTi5WnzvGWyEhZ5jecxmW+MwaR2qqhYVtsb74YP2VlEIdHaBmBSXMm9GrFD6ZBAN4QYh
 +xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=oC2sr88t+bxCA7MEstlJC7JQToE8IQv/b76cf7Wna2s=;
 b=J0l9sRwfeVGEJC6dkk7EeRjBnrhyzFFq/4JuMomUEqaVzNaYuPJuEf9m+JoUMwOUX5
 4vsJdMm2120okQwexd6Pf29kmyIwwDegQ0EUTOLAoRsaYvkYP9vGHeZiU8jji54PQVzj
 vjqm/pvmnku461+jfMM5rdSgU68ToL5TQftyeaK27/PgpS4o7SEz2bT7SYZNkCk2YTQZ
 dZrzZE3UoK/2j+iJsk7f6fYgBDv5+lk2KkftOujkON2wwGwzL02exn9YaIy57uQ782FK
 ZtV7j3M1Xc/xHYcTLsshixjzvVAy7RKrBB958upNKWY1cQgkSTLa5dAsd4kUSgVvk62i
 G/0g==
X-Gm-Message-State: APjAAAVYX/zpd5ClXDIsvhpFZ+YGL3FM8z3UIRrGATbcMyp3ijR2Vnd8
 zRJDCzfY38DarddEy9CPM+Ah6uhHPJE=
X-Google-Smtp-Source: APXvYqzxTcU5mYeZFCkstumU+j3dHQ9cMO3ynAufjcUQ6jrPxPyMMcxR9BN9Pw124oJLI2OreGAStQ==
X-Received: by 2002:a63:fe50:: with SMTP id x16mr93610332pgj.31.1578333065423; 
 Mon, 06 Jan 2020 09:51:05 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id 68sm72969594pge.14.2020.01.06.09.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 09:51:05 -0800 (PST)
Date: Mon, 06 Jan 2020 09:51:05 -0800 (PST)
X-Google-Original-Date: Mon, 06 Jan 2020 09:50:25 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 02/36] target/riscv: Don't set write permissions on
 dirty PTEs
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <6a38e1a02e9a3d38fc311809772a152f0d99fd7a.1575914822.git.alistair.francis@wdc.com>
References: <6a38e1a02e9a3d38fc311809772a152f0d99fd7a.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-23785a15-6ae5-4a3a-8474-9bff5d0c2109@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 09 Dec 2019 10:10:45 PST (-0800), Alistair Francis wrote:
> Setting write permission on dirty PTEs results in userspace inside a
> Hypervisor guest (VU) becoming corrupted. This appears to be because it
> ends up with write permission in the second stage translation in cases
> where we aren't doing a store.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  target/riscv/cpu_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 767c8762ac..0de3a468eb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -344,10 +344,8 @@ restart:
>              if ((pte & PTE_X)) {
>                  *prot |= PAGE_EXEC;
>              }
> -            /* add write permission on stores or if the page is already dirty,
> -               so that we TLB miss on later writes to update the dirty bit */
> -            if ((pte & PTE_W) &&
> -                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
> +            /* add write permission on stores */
> +            if ((pte & PTE_W) && (access_type == MMU_DATA_STORE)) {
>                  *prot |= PAGE_WRITE;
>              }
>              return TRANSLATE_SUCCESS;

This is at least the second time I've spent a day or two trying to figure out
what the right thing to do here is, and once again I'm lost.  I think what's
really getting me is the original comment: why would this cause us to TLB miss,
wouldn't it cause us to not TLB miss?

Assuming that's the case, it seems to me more like there's some missing fence
in whatever program is blowing up due to this -- maybe it's just reading from
the page before marking it as read-only, then relying on writes to trap without
doing the requisite fence.

