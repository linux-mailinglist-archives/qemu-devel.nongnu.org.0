Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0A523F73
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 23:29:31 +0200 (CEST)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1notth-0002Ml-V3
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 17:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1notst-0001h0-8B
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:28:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1notsr-0001sw-M2
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:28:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d22so3077926plr.9
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nd7A2mN7rcAH/cR6bTM41a+4kKbBpGP8RfCLDPEK5GY=;
 b=c0x+cvPP1FLDGTfmECHpJnYzgO6K/z+i1aSq1xAmf77q0EWlRJ78lNgzEMlO6594Tk
 NZ2HV1MkjRVPjfNvGBM2iDNcmMtXAEq4eJ7un2ifhptE597rhycLdefndKu+tOD7C+8d
 Zs7gYazJ82k07/vqx2kOJCn2dSPE/lNmWH06fi6Gt+fPL0eqKN6G4j6wKRHEmsNH3KCt
 UGP2uBID1KC/JkxCD00xeeYWWlOx31yBxYAxYFNXfeX6aLeHo6D+d98uAXT0sqtsWO/3
 MUFxCb9tXZLiuiDJjIujCxdtQFPlMsBfTTWWDslBypAQJHLTXwdfRhW3WsDkv9fsFcWG
 Ffrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nd7A2mN7rcAH/cR6bTM41a+4kKbBpGP8RfCLDPEK5GY=;
 b=xEuRpc4phMWttnVSwoPT74Mv/6n7xKuwBfSEqAPu7H7GtmMbjK6HFe6ANJPXxgBUwB
 SHGuv1WPDhxAZtIKsL2oT4NXhdGRSHcD3jV3ziU8yBE8MF9cg8bQ93QYeNdm1PmNSxu2
 WL5ORjaVfQPQd38eYyFPFK7JN31qfqM5vo6llR3lKcn6tucOBgu5i/7ZlZapZyf+rfm6
 yLU6rcgr3r8kbfehNpyCVNgn4i0jiGoLabOxiL0ptnU8MEW+CDaUFu1VCO7tDklncsCV
 SmKbWz15U0iUFxphDqLjeWPS2odHO55NaKdkd5ch336cpkNnPRKI4UW436+I/gH1Bjl1
 Ki2A==
X-Gm-Message-State: AOAM531z96G8XhS249czCaLdzg9KVUd0oiO4Mb5LpwLTFYtwsLEdgAt9
 VmBD4CUCbaRa1/ZvV0Nt4oY=
X-Google-Smtp-Source: ABdhPJxc0fqxfTBxBAlquINHZtnuG87uauq7+SKyRw6P8J29zlcFtdsniHts8Fg0J3pKL3olMflvrg==
X-Received: by 2002:a17:90a:9311:b0:1dc:8d06:eb1b with SMTP id
 p17-20020a17090a931100b001dc8d06eb1bmr7347294pjo.41.1652304515991; 
 Wed, 11 May 2022 14:28:35 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170902c20900b0015f36687452sm2098037pll.296.2022.05.11.14.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 14:28:34 -0700 (PDT)
Date: Thu, 12 May 2022 06:28:32 +0900
From: Stafford Horne <shorne@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PULL 3/4] Normalize header guard symbol definition
Message-ID: <YnwqgNjjYxLVkjR3@antec>
References: <20220511145922.3431407-1-armbru@redhat.com>
 <20220511145922.3431407-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511145922.3431407-4-armbru@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, May 11, 2022 at 04:59:21PM +0200, Markus Armbruster wrote:
> We commonly define the header guard symbol without an explicit value.
> Normalize the exceptions.
> 
> Done with scripts/clean-header-guards.pl.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20220506134911.2856099-4-armbru@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memopidx.h       | 2 +-
>  include/tcg/tcg-ldst.h        | 2 +-
>  target/alpha/cpu-param.h      | 2 +-
>  target/arm/cpu-param.h        | 2 +-
>  target/cris/cpu-param.h       | 2 +-
>  target/hppa/cpu-param.h       | 2 +-
>  target/i386/cpu-param.h       | 2 +-
>  target/m68k/cpu-param.h       | 2 +-
>  target/microblaze/cpu-param.h | 2 +-
>  target/mips/cpu-param.h       | 2 +-
>  target/nios2/cpu-param.h      | 2 +-
>  target/openrisc/cpu-param.h   | 2 +-
>  target/ppc/cpu-param.h        | 2 +-
>  target/riscv/cpu-param.h      | 2 +-
>  target/s390x/cpu-param.h      | 2 +-
>  target/sh4/cpu-param.h        | 2 +-
>  target/sparc/cpu-param.h      | 2 +-
>  target/tricore/cpu-param.h    | 2 +-
>  target/xtensa/cpu-param.h     | 2 +-
>  tcg/tcg-internal.h            | 2 +-
>  20 files changed, 20 insertions(+), 20 deletions(-)

I looked at this for the OpenRISC changes, but the whole patch looks ok to me.

Reviewed-by: Stafford Horne <shorne@gmail.com>

