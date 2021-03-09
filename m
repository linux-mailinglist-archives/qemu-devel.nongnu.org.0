Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8444033309B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:04:57 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjXE-0004Ks-H9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJj1N-0007M7-Mu; Tue, 09 Mar 2021 15:32:01 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:46737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJj1L-0002Xr-Cj; Tue, 09 Mar 2021 15:32:01 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N9Mh8-1lnEsk3348-015GYW; Tue, 09 Mar 2021 21:31:50 +0100
Subject: Re: [PATCH] target/hexagon/gen_tcg_funcs: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210225181507.3624509-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fba1c87e-e89f-2d19-796c-3e2b5850fb25@vivier.eu>
Date: Tue, 9 Mar 2021 21:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210225181507.3624509-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZhfMPSn+flO9xgZvUmDzS/A6ZXvIrfqxmi91U+Nv7TMmzd0Xaz7
 /0zrLryrlPkBkxwSBFehdbk4tJJg1c00zFe/ltOqtVQx096N196Q34qecrnjPWoqXAdyMgA
 qb1/LHfVTiiX5Z20bmgd108HLjjdYPICBk+VPzvImLry+xk0Ba+N2PXxI90NkeFi7pQ2uaN
 HvE4g9MSsF2vtkhWKxrog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iYqQ7Mci/0U=:IjWurBtgqh+KdJohtpcNzS
 8tlYdJkQgANVq+MR6BeUSZztnHTepIeFSPWm+SQ9B+s1W73RV5bocTWHT++Xo9myvfdJL5LL2
 6h/D4YoNDulDGWvs3wfj4WSYI5l2L/wK03e9vEK/shgtGG0HzLZk/2XkujHoZkCZsYtassK+U
 gQYGKXFwy20yl3mPm/8YdkxaNh0z0Ct7Ys2peUOAk+NtqDg6SU/NYqFgFJ2/IEbXoT5bzJXDm
 Cxrg0hMU+dvp2Pq7iYMKD1MBa6MxoEZU88uJCBmsCgoxPq3RbtsvODs4hzkfFowSol0Jux4lu
 +NM/KLgWg46oLf4TAn0qZDQn84zDJP+kYDwCcbdjDkZwOUEcNG0t6L2lHjY66/y1Qrf0COhvA
 nMW+Wt9/i9JSSKJ/HW+8z3SGeor4o4FRIdrnzzR4uRxluVyQNd4AUGZtLtYeY
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/02/2021 à 19:15, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hexagon/gen_tcg_funcs.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
> index fe4d8e57303..db9f663a778 100755
> --- a/target/hexagon/gen_tcg_funcs.py
> +++ b/target/hexagon/gen_tcg_funcs.py
> @@ -35,7 +35,7 @@ def gen_decl_ea_tcg(f, tag):
>  def gen_free_ea_tcg(f):
>      f.write("    tcg_temp_free(EA);\n")
>  
> -def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
> +def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
>      regN="%s%sN" % (regtype,regid)
>      f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
>          (regtype, regid))
> @@ -54,7 +54,7 @@ def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
>                               (regN, regN))
>          f.write("    }\n")
>  
> -def genptr_decl_writeble(f, tag, regtype, regid, regno):
> +def genptr_decl_writable(f, tag, regtype, regid, regno):
>      regN="%s%sN" % (regtype,regid)
>      f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
>          (regtype, regid))
> @@ -78,12 +78,12 @@ def genptr_decl(f, tag, regtype, regid, regno):
>              f.write("    const int %s = insn->regno[%d];\n" % \
>                  (regN, regno))
>          elif (regid in {"dd", "ee", "xx", "yy"}):
> -            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
> +            genptr_decl_pair_writable(f, tag, regtype, regid, regno)
>          elif (regid in {"s", "t", "u", "v"}):
>              f.write("    TCGv %s%sV = hex_gpr[insn->regno[%d]];\n" % \
>                  (regtype, regid, regno))
>          elif (regid in {"d", "e", "x", "y"}):
> -            genptr_decl_writeble(f, tag, regtype, regid, regno)
> +            genptr_decl_writable(f, tag, regtype, regid, regno)
>          else:
>              print("Bad register parse: ", regtype, regid)
>      elif (regtype == "P"):
> @@ -91,7 +91,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
>              f.write("    TCGv %s%sV = hex_pred[insn->regno[%d]];\n" % \
>                  (regtype, regid, regno))
>          elif (regid in {"d", "e", "x"}):
> -            genptr_decl_writeble(f, tag, regtype, regid, regno)
> +            genptr_decl_writable(f, tag, regtype, regid, regno)
>          else:
>              print("Bad register parse: ", regtype, regid)
>      elif (regtype == "C"):
> @@ -101,14 +101,14 @@ def genptr_decl(f, tag, regtype, regid, regno):
>              f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
>                  (regN, regno))
>          elif (regid == "dd"):
> -            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
> +            genptr_decl_pair_writable(f, tag, regtype, regid, regno)
>          elif (regid == "s"):
>              f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
>                  (regtype, regid))
>              f.write("    const int %s%sN = insn->regno[%d] + HEX_REG_SA0;\n" % \
>                  (regtype, regid, regno))
>          elif (regid == "d"):
> -            genptr_decl_writeble(f, tag, regtype, regid, regno)
> +            genptr_decl_writable(f, tag, regtype, regid, regno)
>          else:
>              print("Bad register parse: ", regtype, regid)
>      elif (regtype == "M"):
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


