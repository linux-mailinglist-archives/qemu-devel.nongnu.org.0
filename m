Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9136FB54
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:16:32 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT0R-0007wM-KM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcStF-0000WO-Dc; Fri, 30 Apr 2021 09:09:05 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:50025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcStA-0001dB-KM; Fri, 30 Apr 2021 09:09:05 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2etD-1la0IM1chL-004F0A; Fri, 30 Apr 2021 15:07:57 +0200
Subject: Re: [PATCH] accel: kvm: clarify that extra exit data is hexadecimal
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210428142431.266879-1-david.edmondson@oracle.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1c7d4641-7da2-ec5f-e931-c9499ff34205@vivier.eu>
Date: Fri, 30 Apr 2021 15:07:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428142431.266879-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QJ6V3Q9+FKxd+WkhS1cf8YqYJEvUkAerm7patM7RuiRdo3XY9DK
 WNT3hscPlTNuu1NGvOrrLuUlMv/FB7snhyV3VPt4RJw5x3+W6U0ZiXtk+nvxglN7P4nnrdA
 tcWbbQryZZQsJM0ObVATf1BnB9mygmPERPLJYql+oMAxC0UhkG/RKjLrOTv3OfLkE6SoOzv
 Vy3DlUfnI6HB0oew5Tmgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nF2FljgqfGQ=:JNoGSgYcG+JUTS0CpR4dnd
 X00xag9RUJyh5q4bq66A6Ddm0TdE5MCMm4b3T9m4PXhK0XS92gulVf9qgOT5XGgNl4fehKND8
 EwNrpjJ9Xd+nO2m3UJspehIwBbfuQjZPmfU2RhWKiPShJuzq7EB3ADmr2WVV33Z1UVQXWmwJz
 4k8gRvPu55Lu5tZKlMdPNiGwzV4sO8HykV4AO6Erphd4voZcpNTw1Avltdd9XgsGk6U+Ks0zc
 1bPpEuF3XYAVyOU80SdyTapYuBlFLRABHc+HqHv4IavS+8iysP2PN/zI1lwTtNOgB3jf+W2Ts
 sQKx+9O/DR8YfBG/qY94gXBSUGL0bgpLxbbvmBo2aZTennY0xnknYIX/sgaaLCEKSxfyj5Xue
 0YXN/xEKnRNfqkLV1N4Hq65dYGDd8eo3/J4D7jRgs88CS32CaXZSjbhpPGDc/Dl9i17iHa86P
 iovF6z9IVE7o7ioICoFtrXr37Rj0ldtYxQEVM3+yduzhCXg+m/whZCbUrk4WswsqsRflhWIHM
 CiLIPRBJh5uzWfplQ7vcEU=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/04/2021 à 16:24, David Edmondson a écrit :
> When dumping the extra exit data provided by KVM, make it clear that
> the data is hexadecimal.
> 
> At the same time, zero-pad the output.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index b6d9f92f15..93d7cbfeaf 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2269,7 +2269,7 @@ static int kvm_handle_internal_error(CPUState *cpu, struct kvm_run *run)
>          int i;
>  
>          for (i = 0; i < run->internal.ndata; ++i) {
> -            fprintf(stderr, "extra data[%d]: %"PRIx64"\n",
> +            fprintf(stderr, "extra data[%d]: 0x%016"PRIx64"\n",
>                      i, (uint64_t)run->internal.data[i]);
>          }
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


