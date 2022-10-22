Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD1B609AD4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:58:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjhh-0006na-U0
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLsA-0008Az-5o; Sat, 22 Oct 2022 17:17:38 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLs8-0001gA-0d; Sat, 22 Oct 2022 17:17:37 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MF39S-1osxZd2bua-00FUIX; Sat, 22 Oct 2022 23:17:25 +0200
Message-ID: <066ae14c-d92f-de2c-1787-6bc2553b19df@vivier.eu>
Date: Sat, 22 Oct 2022 23:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/2] tests/qtest: migration-test: Fix
 [-Werror=format-overflow=] build warning
Content-Language: fr
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20221017132023.2228641-1-bmeng.cn@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221017132023.2228641-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sapLzfozshUtiaLd8l7X0xNnxBp0GR3F/R79nK/8eGYKHNoUTL+
 wSh0y3WlRqaiXDhcRENm1/aIAKygTAMAGX9d+n5Ax2La6aO6eurJhvV4sjikzXDrtMw4LGr
 gHHz0JoE2KrnxdfPDa3bRDALfJiX2P82etxASDzoobvdRhNmXG5Tk96rCtph6LE+7SMToZj
 AMr/XhhpeQ2SfcaLYzO5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c/HvC6j+9Bs=:fQqMdsPatckbGbCZYEd+yW
 W8Ak3/Rr/493kQbwacSiluVoJa23crTqJ/+1SBghrLiN3vjDgAlRqYsVKZ9WUKK2xzk2Sui7y
 XrM8kJLbHpPshIRlDV3a0fKybd66HJwNWrbL1i2RhFemWk1yXV9SmpJRFUWIbdRVt0LigHuSx
 kTWdRbLcL2FE4CuUQWHqupK33HFEioiv8OAIMB7kqYLaYiABKS5mmSXtEvQZ4WZ8TParyI2mS
 LdUuNz8xEZ8bj1Zhm6s9BMK5uRfb3d1oIDF6tctt7vDHb+PImtThQ7bD6rqWTLYxxvdcdiIRf
 wQXPvit+ssn0YPbvTT5ucxHsQBsFInh1OVjZgHYXV4u6cOGGJ8nRiY9xQWfGCuEOIkxrbV9as
 RP0TDran11ZlyGAklIueI1TbBrrd5bIY5QuykQm90dHj7MA2kWKlztRKeVQTAG0itxNZB9rcu
 tsNxK1t+90L1Ueax4N3cm7MgmZKlpdXGUnQLBZETuOqsvVgDsL9ipi45fSyKHwYHFyIoks3/v
 gxBrvVK7EI9T5//iOlOVsuJBBLLoSYYBr23/XiMlhmgPRDoMueJSw2wDrAQR+7RbbmE88tCBF
 RaFVS5VqitzsicIZ5vcNdtDwxNffTPjZ36ZNznDWXGFGZMa7qLb25kc59ntj20yFx981bHOXi
 YE7AWfpBwbP2zER4uR5VpC+9wTUv1GwYqPJdHc6eyixyRc8EvKbek8Uml61Tcsaj0H8WJ0VqM
 97uecdJjWqrVeH3NypHNtXK1uDQ7WUlx8R5x/u0XiaFQ9HvB29oFKoe8K7hzwAap5QAZ7BTsH
 bnpMPR9
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 17/10/2022 à 15:20, Bin Meng a écrit :
> From: Bin Meng <bin.meng@windriver.com>
> 
> When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
> It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
> neither did the QEMU CI.
> 
> While we are here, improve the error message as well.
> 
> Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
> Fixes: e5553c1b8d28 ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
> 
> Changes in v2:
> - improve the error message
> 
>   tests/qtest/migration-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ef4427ff4d..aa1ba179fa 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2481,8 +2481,8 @@ int main(int argc, char **argv)
>   
>       tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
>       if (!tmpfs) {
> -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> -                       err->message);
> +        g_test_message("Can't create temporary directory in %s: %s",
> +                       g_get_tmp_dir(), err->message);
>       }
>       g_assert(tmpfs);
>   
Applied to my trivial-patches branch.

Thanks,
Laurent



