Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A82CDC3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 19:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVg5P-0002JT-4T
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 13:40:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hVfuM-0002LA-Kg
	for qemu-devel@nongnu.org; Tue, 28 May 2019 13:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hVfuI-0001g7-TZ
	for qemu-devel@nongnu.org; Tue, 28 May 2019 13:29:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>) id 1hVfuD-0001Yc-Cq
	for qemu-devel@nongnu.org; Tue, 28 May 2019 13:28:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00094300183A;
	Tue, 28 May 2019 17:28:52 +0000 (UTC)
Received: from [10.36.116.177] (ovpn-116-177.ams2.redhat.com [10.36.116.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFEF1017E3C;
	Tue, 28 May 2019 17:28:51 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190522222821.23850-1-richard.henderson@linaro.org>
	<20190522222821.23850-17-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <a8a1fd49-c368-ed38-4d56-8743db5dd5b5@redhat.com>
Date: Tue, 28 May 2019 19:28:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522222821.23850-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 28 May 2019 17:28:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 16/16] tcg/i386: Use MOVDQA for
 TCG_TYPE_V128 load/store
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.05.19 00:28, Richard Henderson wrote:
> This instruction raises #GP, aka SIGSEGV, if the effective address
> is not aligned to 16-bytes.
> 
> We have assertions in tcg-op-gvec.c that the offset from ENV is
> aligned, for vector types <= V128.  But the offset itself does not
> validate that the final pointer is aligned -- one must also remember
> to use the QEMU_ALIGNED() attribute on the vector member within ENV.
> 
> PowerPC Altivec has vector load/store instructions that silently
> discard the low 4 bits of the address, making alignment mistakes
> difficult to discover.  Aid that by making the most popular host
> visibly signal the error.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.inc.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
> index 6ec5e60448..c0443da4af 100644
> --- a/tcg/i386/tcg-target.inc.c
> +++ b/tcg/i386/tcg-target.inc.c
> @@ -1082,14 +1082,24 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
>          }
>          /* FALLTHRU */
>      case TCG_TYPE_V64:
> +        /* There is no instruction that can validate 8-byte alignment.  */
>          tcg_debug_assert(ret >= 16);
>          tcg_out_vex_modrm_offset(s, OPC_MOVQ_VqWq, ret, 0, arg1, arg2);
>          break;
>      case TCG_TYPE_V128:
> +        /*
> +         * The gvec infrastructure is asserts that v128 vector loads
> +         * and stores use a 16-byte aligned offset.  Validate that the
> +         * final pointer is aligned by using an insn that will SIGSEGV.
> +         */
>          tcg_debug_assert(ret >= 16);
> -        tcg_out_vex_modrm_offset(s, OPC_MOVDQU_VxWx, ret, 0, arg1, arg2);
> +        tcg_out_vex_modrm_offset(s, OPC_MOVDQA_VxWx, ret, 0, arg1, arg2);
>          break;
>      case TCG_TYPE_V256:
> +        /*
> +         * The gvec infrastructure only requires 16-byte alignment,
> +         * so here we must use an unaligned load.
> +         */
>          tcg_debug_assert(ret >= 16);
>          tcg_out_vex_modrm_offset(s, OPC_MOVDQU_VxWx | P_VEXL,
>                                   ret, 0, arg1, arg2);
> @@ -1117,14 +1127,24 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
>          }
>          /* FALLTHRU */
>      case TCG_TYPE_V64:
> +        /* There is no instruction that can validate 8-byte alignment.  */
>          tcg_debug_assert(arg >= 16);
>          tcg_out_vex_modrm_offset(s, OPC_MOVQ_WqVq, arg, 0, arg1, arg2);
>          break;
>      case TCG_TYPE_V128:
> +        /*
> +         * The gvec infrastructure is asserts that v128 vector loads
> +         * and stores use a 16-byte aligned offset.  Validate that the
> +         * final pointer is aligned by using an insn that will SIGSEGV.
> +         */
>          tcg_debug_assert(arg >= 16);
> -        tcg_out_vex_modrm_offset(s, OPC_MOVDQU_WxVx, arg, 0, arg1, arg2);
> +        tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
>          break;
>      case TCG_TYPE_V256:
> +        /*
> +         * The gvec infrastructure only requires 16-byte alignment,
> +         * so here we must use an unaligned store.
> +         */
>          tcg_debug_assert(arg >= 16);
>          tcg_out_vex_modrm_offset(s, OPC_MOVDQU_WxVx | P_VEXL,
>                                   arg, 0, arg1, arg2);
> 

This is the problematic patch. Haven't looked into the details yet, so I
can't tell what's wrong. Maybe really an alignemnt issue?

-- 

Thanks,

David / dhildenb

