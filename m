Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0E5EBF94
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:19:29 +0200 (CEST)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7gW-00038e-Rd
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7CQ-0004FI-MH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:48:22 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7CO-0006hA-Sj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:48:22 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M3loZ-1ocq5B27vf-000we8; Tue, 27 Sep 2022 11:48:18 +0200
Message-ID: <427cbfc5-b6fa-9a53-6076-ea59399d4a04@vivier.eu>
Date: Tue, 27 Sep 2022 11:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/8] linux-user: Combine do_futex and do_futex_time64
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w7JQ/r7rIIiGCJP2Jw4TaR2s/4dQClVUGAghwN6CpSG3HThMefi
 qXq6JuJhI4WDrYTcMcvh5rb3KgLofwErmaREvdtHCCY9uvCSvDLIqD7FhKFXsbCxTjmrM+p
 BKek5Qd0gZLJYGLPy0NgkEqwEFNIW13dMWQSeGl5dvhqFg/cuNVvcRAYEOaedE5mbkixmdc
 QwHykiCEpo0hwM7c+WxOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:33t8FpUomW8=:Z4TWmdaphX94n/W+Vp2agx
 Sl+aRhcblo+N5njJWkeLSL132jEI/K0htkKfSKFWYYRoli3uRK+P/XqbN+1PwZMailYswQIV3
 LbA2X0aa4frYI0DtWkmyzp/vjqINzvoM26s6FHgmb+cULdk+dmZrfUZ2mgI2Txx73UMsuk431
 RwTziDfzRSs7khh/w+sWj0hRkfe+x8srhmvCbMu0vKB03Fy9/Lxa2TLoSo2EZ3g26MlxIPvtN
 AgywXFX4Pl4meQN30MMBKJ9FaOGJu2/ZNVXsUSX6ucAY2ii/IHVcPlBYS4jGNaf5uQInElGPz
 /eU4ThlYIb7T3zol+TNI7nS2tm8y5FZVZ5ZevzOiWU8BCFYWHNCQPGb5emK9O6mTNAxJ/Lxe3
 MHBrhamX56SFt5OwawI63JLhHBQCR99qUXxJaomZwY6lY4vV7Ax9VOjTp68HuTXb5tZGYfluo
 CL9UXpvP4ojXdnstEtoTBwboQsq3GdlXXcQY24a5rYsGCZ5JntzoezgO3BmZSLdDCWbUXECdp
 XWnvz+TcZA9Lru5+QsccKoYuRoZwdMnRZaR7Z1HkBEW8LzY/JMgeZn+Mi+cFvua7wA1hsPK9c
 6kgcP8mfyHzNr8qyvHwWotkmqvk8ST+QaetC/BWUI/5jczoOk4VkYgm4bYn1QMg2asnFqfNfy
 vfUOdDAO1wrejLX6Pwhl9jmUWho9QMyl+H9NNVuBQ2+ANFHFV9EjV944cVA6T55Yhmcb4VS/W
 nH1tV1h2DIihqL0DXC88X6KRoukYkgDvY+hMaVDhRPIq5yocPz+lCUEM0Onh3UnRR8dbuPh4r
 o3M6MDj
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 29/08/2022 à 04:09, Richard Henderson a écrit :
> Pass a boolean to select between time32 and time64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 67 ++++++++------------------------------------
>   1 file changed, 11 insertions(+), 56 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


