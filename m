Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FEF31F836
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:20:54 +0100 (CET)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3q9-00010J-Bk
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lD3oo-0000Zn-Ml
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:19:30 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lD3on-0007ey-5D
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:19:30 -0500
Received: by mail-lj1-x229.google.com with SMTP id c8so18231470ljd.12
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rNipZCd3vR6+yOXjOzaywkZOneGZxKJXnefaTPFELwo=;
 b=K6v4V0qAtyl5XdeOaq/xPY1jVTOVbEBOJW2tcdDTmmuzKGek0pbODVQsEqNle85Iy8
 gu6f2m9GKyxsM8invi75ov1ySFM/zTpUA8IMIjeSC8wVDv6rHZKAA/f2N1g7k/DSfp1S
 dG7RmcMvg7qHekHCqrLOPyX4IvEJ1mIIVv3bzENGI+WR1CsFjYXwGfXM+5APSR3KaeNA
 HwePsZgsxZu1yWi6C5LPXrl4gSB9fomQQYV08Lh9uALSHHdDYt9G1MBq9GTss28DFk5I
 YfFYmbqIjdc3mu3Fv2Us819195X7GQZc9Zm6fZFh4MP+/In5nPL3Wkx4U3J2kXFIYpGm
 icYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rNipZCd3vR6+yOXjOzaywkZOneGZxKJXnefaTPFELwo=;
 b=C73mCEqxCwEc45BhALp2Qc5BBY/tBybSTHcdQf23KYqZVjhsYqObrNXKEy8Zz47YRj
 Whf9s6uyC0ZrjZE6g1BA91dRRhpNJVNKUGDM6K6lMB6Jx7w6p4ZUeiTQCAIvfaL0QEAK
 SwP+BhycFzkKxG7xz1iKI9sWmQ0qfMBDVsDy22gig8Kikkd8JsYiOjNuLt8Hbg7EIWtU
 FaOj1qUIu/kyC041ceEWSLsvf4zStWZFoaruQXllQUn1ucwuI0cxTVWvMukVumTF3m3o
 27EqSbsiI5FvlGBAhrTIHMXLBr22H1VDz0VYm83QhsU8FsR7MWvqPRi7nn8HA7LjHBIf
 g+3A==
X-Gm-Message-State: AOAM531/rfJ1LOI6DMV+/0JmZ4iyUwm1WO7sjqfFodunnLAY0yECvKGJ
 5HyKbEjv1pvlD+sLTa2LFsc=
X-Google-Smtp-Source: ABdhPJwewJeXtD/5wIo60oL/2EmLKqwYY/ZzhkTFe7Hw3ytqx+kcED1Kr5PhYzDoZfzrWNjJ85u5Hg==
X-Received: by 2002:a05:6512:12c2:: with SMTP id
 p2mr5117114lfg.339.1613733566587; 
 Fri, 19 Feb 2021 03:19:26 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y27sm894162lfg.273.2021.02.19.03.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:19:26 -0800 (PST)
Date: Fri, 19 Feb 2021 12:19:25 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefan =?iso-8859-1?Q?Sandstr=F6m?= <stefans@axis.com>
Subject: Re: [PATCH v3] Correct CRIS TCG register lifetime management
Message-ID: <20210219111925.GQ477672@toto>
References: <20210219105349.11582-1-stefans@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219105349.11582-1-stefans@axis.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 11:53:48AM +0100, Stefan Sandström wrote:
> From: Stefan Sandstrom <stefans@axis.com>
> 
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.

Thanks Stefan,

There's still a couple of minor stylistic issues.

The Subject/Summary should be prefixed with the code area you're
changing. I'd suggest changing it

from:
Correct CRIS TCG register lifetime management
to:
target/cris: Plug leakage of TCG temporaries

We also try to avoid unrelated whitespace changes.
I've commented on the 2 I found inline.
Would be good if you could remove those in the next version.

Other than that, the patch looks good to me.
So, with those issues fixed, feel free to add the following tags:

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Best regards,
Edgar

> 
> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> Signed-off-by: Stefan Sandström <stefans@axis.com>
> ---
>  target/cris/translate.c         | 127 +++++++++++++++++++++++---------
>  target/cris/translate_v10.c.inc |  70 ++++++++++++------
>  2 files changed, 138 insertions(+), 59 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index c893f877ab..2b35d818dd 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -172,14 +172,21 @@ static int preg_sizes[] = {
>      tcg_gen_ld_tl(tn, cpu_env, offsetof(CPUCRISState, member))
>  #define t_gen_mov_env_TN(member, tn) \
>      tcg_gen_st_tl(tn, cpu_env, offsetof(CPUCRISState, member))
> +#define t_gen_movi_env_TN(member, c) \
> +    do { \
> +        TCGv tc = tcg_const_tl(c); \
> +        t_gen_mov_env_TN(member, tc); \
> +        tcg_temp_free(tc); \
> +    } while (0)
> +

Remove this extra blank line.


>  
>  static inline void t_gen_mov_TN_preg(TCGv tn, int r)
>  {
>      assert(r >= 0 && r <= 15);
>      if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(0));
> +        tcg_gen_movi_tl(tn, 0);
>      } else if (r == PR_VR) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(32));
> +        tcg_gen_movi_tl(tn, 32);
>      } else {
>          tcg_gen_mov_tl(tn, cpu_PR[r]);
>      }
> @@ -204,6 +211,8 @@ static inline void t_gen_mov_preg_TN(DisasContext *dc, int r, TCGv tn)
>      }
>  }
>  
> +
> +

Remove this unrelated blank lines.

Cheers,
Edgar

