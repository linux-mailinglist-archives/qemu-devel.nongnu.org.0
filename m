Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C93330AA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:11:52 +0100 (CET)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjdv-0006RZ-QL
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjIv-0002XF-1f; Tue, 09 Mar 2021 15:50:13 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:55385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjIt-0001Ub-7w; Tue, 09 Mar 2021 15:50:08 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5xDJ-1lPTWj3iV1-007Rik; Tue, 09 Mar 2021 21:49:55 +0100
Subject: Re: [PATCH] fuzz-test: remove unneccessary debugging flags
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210216181316.794276-1-alxndr@bu.edu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <07e8f46f-4ee3-83f9-f429-eb34edb6e554@vivier.eu>
Date: Tue, 9 Mar 2021 21:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210216181316.794276-1-alxndr@bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9Sa5t1xKFOPqkmzq7yW7kasowgx0JoU/vqwmrRbZB3a3kRE0P93
 AoBSXUjzDYztoc0veHbpbEBBTOE6YF8JsgMZGX2A+tA57KzdvsxGcvw5QWG8i+SlfSpht7I
 KJ1tQD1qEbGlllEHGKgtvnFfCu80Ef7exb/R14zZoeqL5MsdvfgAnXbywe35WfbQ64CRTvd
 /nUzQ+/Kh7jyeA4wn0FfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/vzEO7KqX2w=:HK0JZtn3SkNRC9//m8aKjr
 Xg45Yu0tQ1bD6qGwjiHWdhPc+8alGkTIXQv+5l18nQDM6RVV6wxDAoYwpQY8iHyPGYVAeOBXe
 Vw+N30YFmGzgQTRcOwE/AtaJ/jLycewxoGw+zsnPOs7hRpj4kcatrEWEi3tie5eohe+Cg0+sq
 aRhkq2EVg5BBkMaGPuo6Qp0XLAEov8kI07UUvJQPROk5TUyyPxiqiOP1uLc9plChZXFq07BfR
 +gjp+m3mXxzq2EA7JT3WiW5lmqdPIBaDOt0qmB6bbG37ciVyKgWS17PIPREKLIoE0M2AHWKQp
 TGTV+/PRXAFqawr/2/E6FcIPhxiOfJrismD9FPSlNixNk+Eul75zHKe17XvayBWs/DqQ9R8Hl
 wlZb8hUOHwmMkPrGFQHFc4TFw/p3PN4Cdm+ISIlESxU+9JcX4zTrm0bJSvx0Q
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/02/2021 à 19:13, Alexander Bulekov a écrit :
> These flags cause the output to look strange for 'make check', and
> they aren't needed to reproduce bugs, if they reappear.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz-test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index cdb1100a0b..6f161c93be 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -39,8 +39,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>      QTestState *s;
>  
>      s = qtest_init("-M pc-q35-5.0 "
> -                   "-nographic -monitor none -serial none "
> -                   "-d guest_errors -trace pci*");
> +                   "-nographic -monitor none -serial none");
>  
>      qtest_outl(s, 0xcf8, 0x8400f841);
>      qtest_outl(s, 0xcfc, 0xebed205d);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


