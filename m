Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751344EFFB6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 10:42:56 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naZLT-0004kP-72
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 04:42:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naZHw-0003s0-5j
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 04:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naZHt-0000fN-Ab
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 04:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648888752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wC5oEwzEXmaIDIESs7kN+fAlPdD3V0fwEec7eaYGBnA=;
 b=TdnqGfYKyBK2YA0t4f+kp47pYpCOLjmfjUmAknEvmpFBlljbyUjI5w4/lMgeh8TSAtssnV
 APyeplXuqrGy+qGNr56rYSMAHDb6VQU0QywZccAt0bMnj+MZD2LjoLGj1jBNuBdNcG2+V4
 S4wwT99ML9OUOgLFje4yEGQ6MU0Mamg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-RJM80Tr6Nrmi2yySOh9o9w-1; Sat, 02 Apr 2022 04:39:11 -0400
X-MC-Unique: RJM80Tr6Nrmi2yySOh9o9w-1
Received: by mail-ed1-f70.google.com with SMTP id
 u17-20020a05640207d100b00418f00014f8so2705344edy.18
 for <qemu-devel@nongnu.org>; Sat, 02 Apr 2022 01:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wC5oEwzEXmaIDIESs7kN+fAlPdD3V0fwEec7eaYGBnA=;
 b=O4dbuQ2+SHeCN3xL3aZzHY/Q4GB0/Wg6BasihFV32XHdr9G6kzK1cm83Y09g15BjeP
 sjEZ4k9NoU1QkbQLjx1WO79F9X3ZYbPszVMxH6+INCM96XSIMJ1Hjt9Q4DPCbvlN2zQQ
 8TpEvuZsqAOsoLOl81sS0fE82AMVHfQbh/D6mdv4U+ZF0iXmPta/vSphXApi4XUdgJt2
 3In1becQZXYNjILijCPk3flUq8CL4SAI3VXzqVoj1V1aKfpES7BnvDprtk70YOkQBWS9
 FIGWXgKDpCpl2xQ1sa0khJ53+/MKyECOLzwN+URRL85jvxSD0rrxZxaEwlxgfbh286Z1
 S5OQ==
X-Gm-Message-State: AOAM530nAuYTyRVY+J8BgB7HGiRYA5PSi9YuZwyAGW7egmPQRIY7+SKW
 dN32JR5DCypf8QTlaBo/PbWo7bj04g/zZOt8CgSYJ7/g7HZ39Hh85tn3fkAZmy+zlY6jnRhJ1RV
 t1DeraCT3VhU0iGI=
X-Received: by 2002:a05:6402:254e:b0:418:e716:f987 with SMTP id
 l14-20020a056402254e00b00418e716f987mr24242268edb.74.1648888750313; 
 Sat, 02 Apr 2022 01:39:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjf6Nru/fTS3bc8i+yzq9wrhWybSmivJH6e/6rfIDh0C2VvwT2Nm1OLM3GkMjfA95suuboRQ==
X-Received: by 2002:a05:6402:254e:b0:418:e716:f987 with SMTP id
 l14-20020a056402254e00b00418e716f987mr24242252edb.74.1648888749909; 
 Sat, 02 Apr 2022 01:39:09 -0700 (PDT)
Received: from [192.168.8.100] (tmo-080-174.customers.d1-online.com.
 [80.187.80.174]) by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b006db075e5358sm1820583ejc.66.2022.04.02.01.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 01:39:09 -0700 (PDT)
Message-ID: <b3df0aa3-46eb-b7ed-93ab-1e5b3ec9f23f@redhat.com>
Date: Sat, 2 Apr 2022 10:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] target/s390x: Fix the accumulation of ccm in op_icm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220401193659.332079-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220401193659.332079-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/2022 21.36, Richard Henderson wrote:
> Coverity rightly reports that 0xff << pos can overflow.
> This would affect the ICMH instruction.
> 
> Fixes: Coverity CID 1487161
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 5acfc0ff9b..ea7baf0832 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -2622,7 +2622,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
>                   tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
>                   tcg_gen_addi_i64(o->in2, o->in2, 1);
>                   tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
> -                ccm |= 0xff << pos;
> +                ccm |= 0xffull << pos;
>               }
>               m3 = (m3 << 1) & 0xf;
>               pos -= 8;

Reviewed-by: Thomas Huth <thuth@redhat.com>

Is this still something for 7.0, or can it wait for the 7.1 cycle?


