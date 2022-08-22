Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963CF59C04C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:14:53 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7GW-0006C1-Lg
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQ7BJ-0006lW-Q0
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQ7BH-0007Gc-8i
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661173765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDcNI0TkSkwmxcDpR3midvJlJDQ7edDAZ2IhOBh8rKw=;
 b=CptGTwPDK63A/AXpiLkBbLCVSRxmbH37RYXt+tLK8EjlmTsuH20KlVRpfYGbhAIJZ8gzFR
 EwTLxIMY4rIjW25E9ios/mcncc5SYvlSDSEbB6r2NOlRK2w1vrBw1CtvMEVsnh1wKUKrr5
 btQoVh33f47VU0p4yGyx6d8TFLXtX98=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-cMJQ7t-KPFyfT7H3h_zdAg-1; Mon, 22 Aug 2022 09:09:24 -0400
X-MC-Unique: cMJQ7t-KPFyfT7H3h_zdAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso1984580wmc.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=eDcNI0TkSkwmxcDpR3midvJlJDQ7edDAZ2IhOBh8rKw=;
 b=GYef39oqKaBQidRRJWFUWyNkMLk2wkLb27RN80qPSvKelSWCPc40KFGgP2jmV3j8ca
 sim00PaE+KtubOkcGV5fwZDEEmE4dMdpWM/pbldxo8T89//54mTb/YeMUu8++EkKWBm/
 htXujjFnuhis3PhQffAtOxLdoVnAs1InP6DGSOlgE3kMHWN+P28GEvMBvqVdyinAVRyh
 n0nyXYKXuN+69oPDVbsuZljO1KL7WTrlIRHOebvu6Ebs2uYOIKWs5NUL3zgqfJ5erLNI
 /Owl+8mt9d3QmravZiPRO4nQlzB89a93PC7Gvs2OqMbBly0JvmxG8GiXQMkJgUu2ZcCE
 c3DA==
X-Gm-Message-State: ACgBeo1of/WynVrNuJNdx4kHQ3PTUtjGHRKfWLuAfIHK/NlFSleENEUN
 UN/R0jIdC7iv3/sVKK+B+IvGIxZZdKY/+8NlW2t3c1Sw1sk7GnBMoa8JpOBik6bAZRAtF68FOnd
 zD2SoMDPgc6u0z5s=
X-Received: by 2002:a05:6000:1548:b0:223:141:8a06 with SMTP id
 8-20020a056000154800b0022301418a06mr10702583wry.153.1661173762901; 
 Mon, 22 Aug 2022 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77w+8PALOVvxQf4Kbc/tRbAn8GmcB4Lq8I4gd+W3VFas/QZkYhi7EcxnGgbwi8kYAZoYzxWg==
X-Received: by 2002:a05:6000:1548:b0:223:141:8a06 with SMTP id
 8-20020a056000154800b0022301418a06mr10702556wry.153.1661173762614; 
 Mon, 22 Aug 2022 06:09:22 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-237.web.vodafone.de.
 [109.43.178.237]) by smtp.gmail.com with ESMTPSA id
 y3-20020adfee03000000b0021efc75914esm11356395wrn.79.2022.08.22.06.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 06:09:22 -0700 (PDT)
Message-ID: <c5dc20b9-5c7a-d47f-d0f6-e0737fa5990a@redhat.com>
Date: Mon, 22 Aug 2022 15:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] target/s390x: Fix CLFIT and CLGIT immediate size
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220817161529.597414-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220817161529.597414-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/08/2022 18.15, Ilya Leoshkevich wrote:
> I2 is 16 bits, not 32.
> 
> Found by running valgrind's none/tests/s390x/traps.
> 
> Fixes: 1c2687518235 ("target-s390: Implement COMPARE AND TRAP")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.def | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 5e448bb2c4..6d2cfe5fa2 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -290,8 +290,8 @@
>       D(0xb961, CLGRT,   RRF_c, GIE, r1_o, r2_o, 0, 0, ct, 0, 1)
>       D(0xeb23, CLT,     RSY_b, MIE, r1_32u, m2_32u, 0, 0, ct, 0, 1)
>       D(0xeb2b, CLGT,    RSY_b, MIE, r1_o, m2_64, 0, 0, ct, 0, 1)
> -    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_32u, 0, 0, ct, 0, 1)
> -    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_32u, 0, 0, ct, 0, 1)
> +    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_16u, 0, 0, ct, 0, 1)
> +    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_16u, 0, 0, ct, 0, 1)

Looks right to me.

Reviewed-by: Thomas Huth <thuth@redhat.com>

I'll queue it to my s390x-next branch (assuming this is not urgent enough 
for going into 7.1 since it only happend with a testcase)


