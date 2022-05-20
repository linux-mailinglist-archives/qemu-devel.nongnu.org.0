Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2152F258
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:15:31 +0200 (CEST)
Received: from localhost ([::1]:54252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns79u-0007P7-SZ
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6y4-0006xt-UU; Fri, 20 May 2022 14:03:17 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6y3-0004Oy-5N; Fri, 20 May 2022 14:03:16 -0400
Received: by mail-ed1-x531.google.com with SMTP id i40so11735867eda.7;
 Fri, 20 May 2022 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=CYOXO7w+YaOikPq5sb8/wKG8W3/pVKxs0/7xFZtBths=;
 b=kh3E/sItV88oscO3L3iNnIGvXKZimmwlyBlmRjYzsJ5U82oGiqfmGFiNuSZjQoIe5S
 LvGXoJsbNwBQ/IG+DplBjnlCsr7Z+/vMcBtGrC2Iy5VjaSuxllwWQUBa6afjVqUYjXGb
 ic535seW49lTMNOWfK4uruYv2zz0OGcuQUS50QyhJsQ9F4psaEE2XyyXg+V8WxCc1K1J
 3KjnfSS8w6AQ2CgqRqgydixSWDzEMwcAJBCNAzETJfV7cBdMRyXi0vUvjhRLXM5Y/T9q
 t7mtvICm8Nidrk2dMOyx3W7YnxAByuokfQfB8wH9UtZ29mr6WwFEPk8MwmVznTzsOb0D
 BXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=CYOXO7w+YaOikPq5sb8/wKG8W3/pVKxs0/7xFZtBths=;
 b=7O+E2EdNmezttPViPluwb8ORoQgYgtYUQPk/Mbq16ZpBYomj5VOdIepxsfScD1Bo25
 6XuayLXrYvqHeQlfdhL5wApnyovBk1XSis1DDxdJiYrb/0WZBIkF5AzX/9JENBwD7ZlO
 RXQyndRxyE4HCTaJtWvyirUc+aqU1V4ZSee0FugahEKK5LC+FcU3362RntFIbPbTh01L
 wni9JHaA0XXx22ekO/DEeeO0r4zGFYASM3mPpz1HklAlMSkFBB19W0JkiWVnsnZbzpHJ
 fjVnLEMzxxJsf7b2s/Zjh8G+IGtl3pZvXkpTvaF5MlutYxIyTPcj8Z93XrLKzG3PvPQx
 /v9Q==
X-Gm-Message-State: AOAM530RUEevRhwyF6uImmoaeP/Mgr1NElUUFbnPnz4J0nMGXMJ3ZS2H
 6xdWPtx1aBrTCjA4NHJTttjnfCQktTg=
X-Google-Smtp-Source: ABdhPJwTaC195jo+4toAYYaJjTr6YmxmgG62jiOzr98msbMohUZV8QkrfNEHQw/x/HblI95pdH5jkQ==
X-Received: by 2002:a05:6402:510e:b0:42b:3d0a:41f2 with SMTP id
 m14-20020a056402510e00b0042b3d0a41f2mr568626edd.42.1653069789172; 
 Fri, 20 May 2022 11:03:09 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-209-236.89.14.pool.telefonica.de.
 [89.14.209.236]) by smtp.gmail.com with ESMTPSA id
 h22-20020aa7cdd6000000b0042abb914d6asm4428920edw.69.2022.05.20.11.03.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 May 2022 11:03:06 -0700 (PDT)
Date: Fri, 20 May 2022 18:03:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_09/10=5D_accel/tcg=3A_Inli?=
 =?US-ASCII?Q?ne_dump=5Fopcount=5Finfo=28=29_and_remove_it?=
In-Reply-To: <20220520180109.8224-10-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-10-shentey@gmail.com>
Message-ID: <690C842D-C1BF-4FA3-839E-4031EC4A90D0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

Am 20=2E Mai 2022 18:01:08 UTC schrieb Bernhard Beschow <shentey@gmail=2Eco=
m>:
>dump_opcount_info() is a one-line wrapper around tcg_dump_op_count()
>which is also exported=2E So use the latter directly=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> accel/tcg/cpu-exec=2Ec      | 2 +-
> accel/tcg/translate-all=2Ec | 5 -----
> include/exec/cpu-all=2Eh    | 1 -
> 3 files changed, 1 insertion(+), 7 deletions(-)
>
>diff --git a/accel/tcg/cpu-exec=2Ec b/accel/tcg/cpu-exec=2Ec
>index 7cbf9996b7=2E=2Ea565a3f8ec 100644
>--- a/accel/tcg/cpu-exec=2Ec
>+++ b/accel/tcg/cpu-exec=2Ec
>@@ -1091,7 +1091,7 @@ HumanReadableText *qmp_x_query_opcount(Error **errp=
)
>         return NULL;
>     }
>=20
>-    dump_opcount_info(buf);
>+    tcg_dump_op_count(buf);
>=20
>     return human_readable_text_from_str(buf);
> }
>diff --git a/accel/tcg/translate-all=2Ec b/accel/tcg/translate-all=2Ec
>index 291034cb09=2E=2E8fd23a9d05 100644
>--- a/accel/tcg/translate-all=2Ec
>+++ b/accel/tcg/translate-all=2Ec
>@@ -2124,11 +2124,6 @@ void dump_exec_info(GString *buf)
>     tcg_dump_info(buf);
> }
>=20
>-void dump_opcount_info(GString *buf)
>-{
>-    tcg_dump_op_count(buf);
>-}
>-
> #else /* CONFIG_USER_ONLY */
>=20
> void cpu_interrupt(CPUState *cpu, int mask)
>diff --git a/include/exec/cpu-all=2Eh b/include/exec/cpu-all=2Eh
>index 9a716be80d=2E=2Ef5bda2c3ca 100644
>--- a/include/exec/cpu-all=2Eh
>+++ b/include/exec/cpu-all=2Eh
>@@ -421,7 +421,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, tar=
get_ulong addr)
> #ifdef CONFIG_TCG
> /* accel/tcg/translate-all=2Ec */
> void dump_exec_info(GString *buf);
>-void dump_opcount_info(GString *buf);
> #endif /* CONFIG_TCG */
>=20
> #endif /* !CONFIG_USER_ONLY */

Ping

