Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C433D4CD7BA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:28:01 +0100 (CET)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9qa-00009T-Sd
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQ98i-00028m-0F; Fri, 04 Mar 2022 09:42:40 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQ98f-00011N-M7; Fri, 04 Mar 2022 09:42:39 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBUZr-1nKLJx3MGF-00D1gv; Fri, 04 Mar 2022 15:42:30 +0100
Message-ID: <d3c76cc5-90c0-6abd-1f67-9b6b1b0230b7@vivier.eu>
Date: Fri, 4 Mar 2022 15:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
 <20220113170456.1796911-4-matheus.ferst@eldorado.org.br>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH v3 3/3] target/ppc: Fix gen_priv_exception error value
 in mfspr/mtspr
In-Reply-To: <20220113170456.1796911-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eSXtTXVeiiVr44X9IhwylESTjNhfYcKdEh/tzbmq5ZJzzQLEh70
 Ke5g8L8ysjDGzoZPKrCvzNnVQgRazxvFzdBQzEYa9dD5COSfKI3rYNvFjVA7PFF6A3firpE
 tnuadMDUHPcFLy0x26MwCPcykNMA0oruA1TEHnqS+80j9mCfA2otOYFJdP5hQhK2srSoHbq
 d9PDoQKRniKCMW7SckwQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S4zJCyMZduM=:Jgz1XDgr+f/nrp6PUma3yN
 z0vD1fQbdadSh8HqmxbXScUve9bB12Nmu434ziu8bJHV4NnuT8r1pnfg7RIra9JCfrgaV8oLb
 AE2mszhFNv13IV5GBydCtCUsdVrSg9W5/ChA6BipvGnkf4StRbx/Nqg827j4BTE5TXm4i+N5M
 qk+kNwxGJULkwyTDCRvehWiJKPUno3QHUM7ASalctCPmogKQxe3+80PFhvTXgAB1097nSlgux
 YyZV8MmLrWhJMT2RYW3X0Lv0M/M/R+R7TiZu52hEF2QKXtEIB945ZPYOMk2DJmlM34rgyPQcV
 zcwUQvWJKlV+wEruIAC8033otUaNOXn0Lajj+B/rfhrAqA6i7RDeQiWPgGwpvDGsPnhU99G7m
 /TatpAuh+jeB73LJCuwGWI/WnRVPRtFOHg4A32F9Q/ICHIzFsEkcZEMwtOP+FqFcpiBKu9sZK
 pFjqRA4KVFUVyrsuk3yCAtLjg2CVbudbbwghlT54GhTrAcHll2sUyuV4cPPk/GAmk2TswM5Qx
 cyq8bkLUSQhySkm07UDMxwI0vBdEBti6mdFlSNKgFpJKBAQmZVqUC+aXfC8H3uiZ4llfLiMEy
 52kHs8sg5JJYQjJZFYGSoO9KaZa2RhCfjAAhiAvt/LqYauXCl2RjhcsOluXdc9ByCTfO5GSHv
 YtkeEN4Q9vO3ukU8sfpPEv3IrsHgiRqpEIS+cvMPcGQSRuqD3PSn51nOr7jR1w925u14=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2022 à 18:04, matheus.ferst@eldorado.org.br a écrit :
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The code in linux-user/ppc/cpu_loop.c expects POWERPC_EXCP_PRIV
> exception with error POWERPC_EXCP_PRIV_OPC or POWERPC_EXCP_PRIV_REG,
> while POWERPC_EXCP_INVAL_SPR is expected in POWERPC_EXCP_INVAL
> exceptions. This mismatch caused an EXCP_DUMP with the message "Unknown
> privilege violation (03)", as seen in [1].
> 
> Fixes: 9b2fadda3e01 ("ppc: Rework generation of priv and inval interrupts")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/588
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/588
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> Is there any case where throwing a PRIV/INVAL exception with a
> INVAL/PRIV error makes sense? It seems wrong, but maybe I'm missing
> something... especially with the HV_EMU to program check conversion.
> 
> Also, if this patch is correct, it seems that all invalid SPR access
> would be nop or privilege exceptions. In this case, is
> POWERPC_EXCP_INVAL_SPR still needed?
> ---
>   target/ppc/translate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 40232201bb..abbc3a5bb9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4827,11 +4827,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>            */
>           if (sprn & 0x10) {
>               if (ctx->pr) {
> -                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>               }
>           } else {
>               if (ctx->pr || sprn == 0 || sprn == 4 || sprn == 5 || sprn == 6) {
> -                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>               }
>           }
>       }
> @@ -5014,11 +5014,11 @@ static void gen_mtspr(DisasContext *ctx)
>            */
>           if (sprn & 0x10) {
>               if (ctx->pr) {
> -                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>               }
>           } else {
>               if (ctx->pr || sprn == 0) {
> -                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>               }
>           }
>       }

It seems logic to emit a POWERPC_EXCP_PRIV_XXX exception with  gen_priv_exception() (POWERPC_EXCP_PRIV).

Moreover in line above we have a  gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG) if the register 
cannot be read (SPR_NOACCESS).

But in helper_load_dcr() we have POWERPC_EXCP_PRIV_REG with POWERPC_EXCP_INVAL (whereas in the 
helper_store_dcr() function we have POWERPC_EXCP_INVAL with POWERPC_EXCP_INVAL_INVAL).
It looks like another bug.

and in gen_slbfee() we have also a POWERPC_EXCP_PRIV_REG with gen_inval_exception() 
(POWERPC_EXCP_INVAL).

What is interesting is gen_inval_exception() uses POWERPC_EXCP_HV_EMU that could make thinking we 
could try to emulate the operation (for KVM PR, for instance).

Thanks,
Laurent

