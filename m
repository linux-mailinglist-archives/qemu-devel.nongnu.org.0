Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E064552
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 12:44:16 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlA59-0003iJ-Cb
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 06:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hlA43-0002kL-L4
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hlA3r-0003hP-3d
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:43:00 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hlA3q-0003g7-SS
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:42:55 -0400
Received: by mail-wr1-x441.google.com with SMTP id g17so1907054wrr.5
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=sCLrU4HA9cFcMbhCjFqoPBGhIojQl55A+scyrMpFmNE=;
 b=egvSQ/TjcJG4VJ+baqQ1N/i0X9q3euU3CdUXd+msp/C9lGC9iOCdz/MrTFSjOSpjdi
 Wt2NMQey8i7AIanp+OuASuRayF8jTJvVmcLib2oRU4GYCaRZn3jIDFfXb9oxU6D92I6M
 t6oy0TRhyH/nnZHRaucjdFD7B0K7eL1gTqgpHktzsRAbUmo/TncSLit+B918mXNoWzqH
 1im7dM5qnzmIdhUuARPGaBWaxaenI/Y3SbhPY6WW5SWoVtBtPj3tl8vPB+mcGSpKvQ5M
 bxW8eOeKzQNsqw055yDBsezi3iqwf4jy1RrfCVFxesT95587SwTIWX/zrVFN72G3lMeN
 qJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=sCLrU4HA9cFcMbhCjFqoPBGhIojQl55A+scyrMpFmNE=;
 b=ZxwAgY+gsek2wPe88omA0agQuymk1pKfeTeuC52Khqmqnv8yPED7/dLO0hwsafYi/g
 dMNLS6cQuki9prwnBbFGfXkKEcDHyA8JaLf9fxYlUDdg7uC951/ID4jA478xUthlwRF/
 vWpGfgq769PDUhp6IDAGc3l0Dg1ufyQhWTHgJeBg9pQCr6anAgQN/Uqk0Cyqp8HbInHI
 r93eucqKYp1IsfCKe7ELkIfj8+XfF80EIEVORnCkUsBW24iMh0/gTcfxG8PZ7nhr3zVQ
 VPDqObuDIZuZVTtjPWoc6QuhU5h93FuRabqWwhLIUdw6wsjKP1OalurZGWaDEY/KW9Q+
 5Ong==
X-Gm-Message-State: APjAAAWqw8tn9HFnMiMuOPDBFM69JCfwr3vJwtVags5MRPIPDV5mb9Bz
 wGwQeXfcOOYwvh8Ez2a6SbYfBARxZAU=
X-Google-Smtp-Source: APXvYqyvmipb5zDEHM7rLe/E5CjMYdxQdVa1rS8D1A+p1z60WooDDgpgcaXp8Zi6aiXz+rB20oFaXw==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr30588755wrr.338.1562755373066; 
 Wed, 10 Jul 2019 03:42:53 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id j26sm3158172wrb.88.2019.07.10.03.42.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 03:42:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D1271FF87;
 Wed, 10 Jul 2019 11:42:52 +0100 (BST)
References: <20190709184823.4135-1-richard.henderson@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190709184823.4135-1-richard.henderson@linaro.org>
Date: Wed, 10 Jul 2019 11:42:51 +0100
Message-ID: <87muhmdvbo.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH] tcg/aarch64: Fix output of extract2 opcodes
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The aarch64 argument ordering for the operands is big-endian,
> whereas the tcg argument ordering is little-endian.  Use REG0
> so that we honor the rZ constraints.
>
> Fixes: 464c2969d5d
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I ran a bunch of AArch64 EXTR testcases on AArch64 and hit the code at
least 4600 times ;-)

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/aarch64/tcg-target.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index b0f8106642..0713448bf5 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -2226,7 +2226,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>
>      case INDEX_op_extract2_i64:
>      case INDEX_op_extract2_i32:
> -        tcg_out_extr(s, ext, a0, a1, a2, args[3]);
> +        tcg_out_extr(s, ext, a0, REG0(2), REG0(1), args[3]);
>          break;
>
>      case INDEX_op_add2_i32:


--
Alex Benn=C3=A9e

