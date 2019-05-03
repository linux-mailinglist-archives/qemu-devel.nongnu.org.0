Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648412B7B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 12:31:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMVTf-0003Ud-QA
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 06:31:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thatlemon@gmail.com>) id 1hMVSU-0002gA-45
	for qemu-devel@nongnu.org; Fri, 03 May 2019 06:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thatlemon@gmail.com>) id 1hMVSS-0004bK-Au
	for qemu-devel@nongnu.org; Fri, 03 May 2019 06:30:26 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <thatlemon@gmail.com>) id 1hMVSS-0004YK-4C
	for qemu-devel@nongnu.org; Fri, 03 May 2019 06:30:24 -0400
Received: by mail-wm1-x342.google.com with SMTP id b67so8531855wmg.1
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fc/N5b9VS5wVxbohjx+jnXucLx1niHoa1q6MBPoG5q8=;
	b=FAv408AUSMxfET85Xd+HvLwa+HdXRB5gEhy0iD2TX7+Fv1jS6aWCuzv/qLEdQ3bBvH
	jhJP82ZQXYYiylafgZGllZttAaZZ+aGgjv323es6jH3zxc/j4hYpSLoDLDE3mSky473e
	u5FnUyT8NiW55QTTQEc6P+rVijaTbniz7vqqaYCfdIai6YOjPL4xImFVX5A2ASlhYSwb
	ie67U/ZWA27FW++jETkOVWjlxbxiRyEGwa6dl6kPHvcisZVQQbBXoiBtrYGOx25vmRvm
	/bMIDbB5N0Ik9U0rhgKkdOeVteKGACdAcCdD9kXxs32RVE/wHzs3kVEUovtyVeo3xnVb
	a9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fc/N5b9VS5wVxbohjx+jnXucLx1niHoa1q6MBPoG5q8=;
	b=bXsQnKHZ/WQSrFfuH9qHqbl8RJczDKG1ZHlp7hEMLauwbuiiLX7LwW0OpAyIvI0Tia
	x9MO7lcVCSqR89XW5SJ1Wpo8E8lsUwIRZEQoGYgnak0AEjTc/vTHnFEEeyEbU+r/X0qF
	CHMcNVYv/CidIyQ4Dg8rSoiyGKduYns+30eLKJfjZZ3o+dZ372QFQ3Hy4DP6eg7B3Xaz
	iSHw/EI3zS0AYJalFmXqZ9axIL7lfhhgJ10sNHP3StIQ/71iZrlyy+zpoKXo0RUxwJRQ
	+/emqZAJu+z3YldzXN6NwZ1AKTOe+lG8knRJ2HrR56UdpUo/YdBjrL490NugFEW9tNVx
	tliQ==
X-Gm-Message-State: APjAAAWP+9zvn1cWERQEqpZ/74gMx14gPnGN0zPWw1O8EJVmBIT+htaS
	oCqote0QTtNV+Cjn26LGyvSzTUJ9lawveNb/q84=
X-Google-Smtp-Source: APXvYqxDGBdkOVyKKd2nLMUzdb5IGVYMQo8f/AaKKVLIIghaPcvW5KqcFZIY2lIf0059B9A5GWU6DmiXQo9DGkraavo=
X-Received: by 2002:a1c:2090:: with SMTP id g138mr5965731wmg.117.1556879420308;
	Fri, 03 May 2019 03:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190418153631.rl3lgadzrqqof72p@debian>
In-Reply-To: <20190418153631.rl3lgadzrqqof72p@debian>
From: Giuseppe Musacchio <thatlemon@gmail.com>
Date: Fri, 3 May 2019 12:29:42 +0200
Message-ID: <CA+pVVBLt4t3dzmE9fgMzWVM4mbuepVyK6ggog8c+QHbtB=Q4Dg@mail.gmail.com>
To: Riku Voipio <riku.voipio@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [PATCH] linux-user: elf: Map empty PT_LOAD sections
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Friendly inactivity ping.

On Thu, 18 Apr 2019 at 17:42, Giuseppe Musacchio <thatlemon@gmail.com> wrote:
>
> Some PT_LOAD sections may be completely zeroed out and their p_filesize
> is zero, in that case the loader should just allocate a page that's at
> least p_memsz bytes large (plus eventual alignment padding).
>
> Calling zero_bss does this job for us, all we have to do is make sure we
> don't try to mmap a zero-length page.
>
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  linux-user/elfload.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index c1a2602..e9a0951 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2366,11 +2366,17 @@ static void load_elf_image(const char *image_name, int image_fd,
>              vaddr_ps = TARGET_ELF_PAGESTART(vaddr);
>              vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
>
> -            error = target_mmap(vaddr_ps, vaddr_len,
> -                                elf_prot, MAP_PRIVATE | MAP_FIXED,
> -                                image_fd, eppnt->p_offset - vaddr_po);
> -            if (error == -1) {
> -                goto exit_perror;
> +            /* Some sections may be completely empty without any backing file
> +             * segment, in that case just let zero_bss allocate an empty buffer
> +             * for it. */
> +            if (eppnt->p_filesz != 0) {
> +                error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
> +                                    MAP_PRIVATE | MAP_FIXED,
> +                                    image_fd, eppnt->p_offset - vaddr_po);
> +
> +                if (error == -1) {
> +                    goto exit_perror;
> +                }
>              }
>
>              vaddr_ef = vaddr + eppnt->p_filesz;
> --
> 2.20.1
>

