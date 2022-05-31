Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A3538C85
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:09:33 +0200 (CEST)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwwW-000680-71
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nvwp5-0001Kz-6G
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:01:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nvwow-0002x6-SJ
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:01:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MoNu2-1nTFuI4AqO-00ojo7; Tue, 31 May 2022 10:01:35 +0200
Message-ID: <34af03f0-6c53-17a3-b91f-d368fd2ef7c3@vivier.eu>
Date: Tue, 31 May 2022 10:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
 <20220527164807.135038-11-richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v5 10/17] target/m68k: Implement TRAPcc
In-Reply-To: <20220527164807.135038-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M1QLpIvyN4CaOWRbLUepzcwg5jCUdBSymE/uHf2vyQtdltyBVdp
 YRvjY7nDcIQJFAdhy27qNKPwXl9tGLKfwue37i+7ALQH/vZmCp3HLuRW9wlk7a26bhIeiB1
 I04Uxb+Z0IiDH4EJBf3xaLZQpWhn6I/0axuXiv8is6lrVWvX+rs6IscVoBkZbgo5I4LsFTm
 9YcSeR/TXiQMEOQtfIpBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eQv5m4XcJ60=:6CQylE4irnjo8vlU792H9N
 aT6xc69rGgeCfYRIem+re9fNyyJfTUd/xg/PRwhMbHG/6OQQWOyWUcfGujQZhkWN6XLGmnbMg
 fMLCqJ69xQcptxsMwoPru/PDvpYSX0qhMwFhaUAocjqZTn6mUvGWAU+OeiaKX4NJbvRn6S5au
 OpG0l2AJ/7qlniSCT97a01F45UanVTesRVefMYOXCYRI5PyDx9zC33dVK/c+iFx/NJva6QATo
 CPP8r1sSfHOrO7l1QzQyhSl3k5wpziUGJSiHlX9b/VDBCnkj0g1tIhAUGehyBQC1sbMvYIE1f
 92zW1FGBDeYKXWR6D/uvekhl+9dSr717zNVIKYZaPQe1WvHVTh/DT2o4xm1/BYMWPVhwEEaXN
 xLD90qIIib/UAaCbkVK4x7KRhMSi8ywm2X+CmSatPbL1h+fbswuwOxnkIqlkm5vCug/vC7HU2
 YE0oub7AH1dsh2/Rv7KL6EuzV0OhhUXK5n2PaP4VMy2clLBYIyrrbmd0U+FbF1jGftg7M3S/Y
 1Mg8ofZv3sv8JwT8aLdBrt0nyWX2tx+y/SUJc+peCUSzK1bsL0dzBZKOCEhO/kdoiihObLy8W
 2ST1Ds8Hj2Fx3cnCdlQEdG4aBrhQPelZIfXJknpicIYl72H5xRd35iDsdhuS44O5oXKvRfYYY
 a7nmrq3EQsMD+EkHY1KY5pIgdbBCA30nclAyX4btd1oc/JIfxw2FDp9hRSuToh8odEqlUyhZc
 Nscez7iexYJwTzEd/8k9ADkefMmc2CrPmfWzYw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 27/05/2022 à 18:48, Richard Henderson a écrit :
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu.h          |  2 ++
>   linux-user/m68k/cpu_loop.c |  1 +
>   target/m68k/cpu.c          |  1 +
>   target/m68k/op_helper.c    |  6 +----
>   target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
>   5 files changed, 54 insertions(+), 5 deletions(-)
> 
...
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 399d9232e4..c4fe8abc03 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
...
> @@ -6050,6 +6098,7 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>       INSN(dbcc,      50c8, f0f8, M68000);
> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>       INSN(tpf,       51f8, fff8, CF_ISA_A);
>   
>       /* Branch instructions.  */

This one breaks Mark's series to support MacOS.

I think the new opcode short-circuits Scc one:

   ----------------
   IN: INITRSRCMGR
   0x408011d0:  st 0xa58
   Disassembler disagrees with translator over instruction decoding
   Please report this to qemu-devel@nongnu.org

The following patch seems to fix the problem:

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index d5d73401b7cc..3b0e3d0b58f6 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6119,9 +6119,9 @@ void register_m68k_insns (CPUM68KState *env)
      INSN(addsubq,   5000, f080, M68000);
      BASE(addsubq,   5080, f0c0);
      INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
+    INSN(trapcc,    50f8, f0f8, TRAPCC);
      INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
      INSN(dbcc,      50c8, f0f8, M68000);
-    INSN(trapcc,    50f8, f0f8, TRAPCC);
      INSN(trapcc,    51f8, fff8, CF_ISA_A); /* TPF (trapf) */

      /* Branch instructions.  */

Thanks,
Laurent

