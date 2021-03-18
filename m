Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C6340376
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:36:24 +0100 (CET)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMq0t-0003JT-UW
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpz5-0002VZ-1C
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:34:31 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpz3-0007RM-Dd
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:34:30 -0400
Received: by mail-ej1-x62b.google.com with SMTP id b9so3101164ejc.11
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3AcHZ+m5JmcWuxj/e1XOPuKZjFHSBYv50lUQL4aQME=;
 b=LN5YniyNYdpWzb8325D3OxDm+thnVTOlxvjamxvhmw2paREY5QOjshSDUlSGai0jrR
 TXuQF2kYDoBGCoU90I6pEtokBDroaifrzFF+NL8MN9DcmpcLS76yf5t/j1LRbnHxH31U
 JquavfJy7qwgKIT8dVa8fGuMbDXKBB9pmUmYZcgiP9MDhXVqmu+izJ6OAONH9IMWlazK
 sZV032IF89+EpnEM97DjY/tb1454DnkpHyqsu6XEBqwjeYGUfNfO7QQhf7o0izySUsiY
 bFj1VTw1XbZSI4rV8yuYY+NScMqE2jaXy0m+cO9JxFbhTIBqpHYUHJPCbM7H1Amw0F5j
 gkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3AcHZ+m5JmcWuxj/e1XOPuKZjFHSBYv50lUQL4aQME=;
 b=DoODNVocmKmDJz4kQpZhIp6FdSv/EfeUM8RHkJWWTpaR2Qdqy25kWNABUuxooxJ0/W
 bn3YW29Uo+yV2yWZs1EEHyYZJ05/JBYBey0UzTD/tdVHDLBk6mZMy556befRTdhRgCHI
 7X+UfCIyv60kmZwyiHVsycFQC65MOFUlxlMMXXik+qZCS1LErFd8ncxG9a4ndqWrIApg
 w+AdkSyeLS5sq6n7HC1l40aBbQ6xpp4hsVHm0NgCOuA30N+kkQGrs3JcqDZl8NdqjoFw
 uonF/sPeTDJ4/9t128nM2KkNz5jbOOTuP4qkaf5IcWu7B6EPy6l2C9ayHC43yhiMY6Yv
 YUxA==
X-Gm-Message-State: AOAM530C7YYnp5KTfbxNDuqUP8xtQVpjFAL300nJBpxxrMLM3Adp6gP+
 qU1ruu59ho8lYd0rhkzQ5dm0vPgHgg4PN2jlRUD2RA==
X-Google-Smtp-Source: ABdhPJzPY2d1clR6F3PFS/sNhcLS7PZOxxHMPiaDU8x2lRfTh2hkhlN88MYadY96emx9IkqfFKJ0z//Xu4KsEEQ/3qE=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr40510671ejg.482.1616063667636; 
 Thu, 18 Mar 2021 03:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
In-Reply-To: <YFMqmDmwDZwRQviM@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 10:34:03 +0000
Message-ID: <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 10:25, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> Oh yes, just:
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 52537f14ac..a7269955b5 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -81,6 +81,8 @@
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>
> +#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE
> +
>  static inline bool is_zero_range(uint8_t *p, uint64_t size)
>  {
>      return buffer_is_zero(p, size);
> @@ -4090,5 +4092,6 @@ static SaveVMHandlers savevm_ram_handlers = {
>  void ram_mig_init(void)
>  {
>      qemu_mutex_init(&XBZRLE.lock);
> +    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >= (1 << TARGET_PAGE_BITS_MIN));
>      register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
>  }
>
>
> works; lets keep that in mind somewhere after Michael fixes AVR.

You don't have a great deal of headroom even after getting AVR
to change, by the way -- TARGET_PAGE_BITS_MIN for Arm is 10.
So you might want to think about ways to eg reclaim usage of
that "obsolete, not used" RAM_SAVE_FLAG_FULL bit.

Also, what does the
 /* 0x80 is reserved in migration.h start with 0x100 next */
comment refer to? migration.h has no instances of "RAM_SAVE"
or 0x80 or 1 << 7...

thanks
-- PMM

