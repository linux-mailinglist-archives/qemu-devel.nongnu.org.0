Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB6C428AC2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:29:05 +0200 (CEST)
Received: from localhost ([::1]:33954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZsYJ-0004pe-OG
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZsVi-0003is-Nr
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:26:22 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZsVd-0007tg-TK
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:26:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r10so54592542wra.12
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pxuhCdRVNct6NLGd8hgjgmxx/hiZ07K6i7ruKXO8/Q0=;
 b=oC3pzPa8Xo67ctYDhvqcT1G8jvUox8NlGNZQdvvpZ2ZBfRPNmNWaOUcvI4L8drO53q
 yK1ScBsy18hvxRVQ7/RMVU9ZlcXsyVM+kwuAPy+qbllVli9BgwyeTYcAwg3nWqhaR/zk
 /41EgYKZQTwFWQ5Jt+wRw/Fht9E9SPlLHspwNjQXz6SXnUO9OYrzZR8fUwRrRCp2r60b
 77ryjIgwJKd7IvDRyCcQSZm9eYjuXsb1MBEUKvofAVHk7r7++CMVotUt3XakJkcqf5kR
 AHTvXffZoqFyD/0toPuA68JtwnSI2bh6yapfQpkQI21g+4ZlK3aZjevETY57qbRZsEOG
 +iSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pxuhCdRVNct6NLGd8hgjgmxx/hiZ07K6i7ruKXO8/Q0=;
 b=Xh/4cHXrUkvED2FqjWK1MRh1k0WCOsjyGZHJ3fhanj83bQr26wfpUCXI51yH/Qzs62
 ewkyopif8Wh7bZZSztjXUZJDp+5eGSGB05GLptGkOsI56J6+1sel40I2IU3keHlNCiYR
 88ZNDe+jdsbb/8gjMzU63exZ1KGR5hxJ5vpcXHHdIm+/LuSqMC45XI7yK91ByCVDkkcs
 w2J2zGq33mc8SNzjyzJuiaAn8VVRFkrPOp4+ARC/I5M1I5/tUO74LXEYFUCOaxY1UoWZ
 fN6S48Ic17+ikspk0K9IB/0lE3nMcFsxT9vqgLeZP4Fq/FusEx0ML41JbOI4m1zkV/C0
 OMgA==
X-Gm-Message-State: AOAM531KUxXIrVfp6JNvjL5/XIlQ1Q4pUzy2swTXguzxlqkBScqASrYe
 Nzb+nF8b4Pf6ae3SU+skkkZ+8A==
X-Google-Smtp-Source: ABdhPJxMrWpt+5ul+iA7Q9ckxi12tSjo+vw4d9t+0kw4h5Cp9VDjjw5z3fn0z2dM/XG1AZln9+sSHg==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr910275wri.398.1633947976076;
 Mon, 11 Oct 2021 03:26:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t3sm16343136wmj.33.2021.10.11.03.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 03:26:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A75F41FF96;
 Mon, 11 Oct 2021 11:26:14 +0100 (BST)
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 5/8] linux-user: Support TCG_TARGET_SIGNED_ADDR32
Date: Mon, 11 Oct 2021 11:22:51 +0100
In-reply-to: <20211010174401.141339-6-richard.henderson@linaro.org>
Message-ID: <87bl3vyi0p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> When using reserved_va, which is the default for a 64-bit host
> and a 32-bit guest, set guest_base_signed_addr32 if requested
> by TCG_TARGET_SIGNED_ADDR32, and the executable layout allows.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h |  4 ---
>  linux-user/elfload.c   | 62 ++++++++++++++++++++++++++++++++++--------
>  2 files changed, 50 insertions(+), 16 deletions(-)
>
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 80b5e17329..71d8e1de7a 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -278,11 +278,7 @@ extern intptr_t qemu_host_page_mask;
>  #define PAGE_RESET     0x0040
>  /* For linux-user, indicates that the page is MAP_ANON. */
>  #define PAGE_ANON      0x0080
> -
> -#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
> -/* FIXME: Code that sets/uses this is broken and needs to go away.  */
>  #define PAGE_RESERVED  0x0100
> -#endif

Can we reference why this FIXME is being dropped in the commit message?
Looking at the current tree state I can see several uses of it due to
moves in 5b6dd8683d (exec: move TB handling to translate-all.c) which
post-date 2e9a5713f0 (Remove PAGE_RESERVED).

Otherwise looks reasonable:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

