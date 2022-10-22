Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A26098EA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:33:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjkU-0007VV-W9
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLsP-0008Bq-Sj; Sat, 22 Oct 2022 17:17:53 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLsO-0001ha-1d; Sat, 22 Oct 2022 17:17:53 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7JvO-1oj1Q62MO4-007pLV; Sat, 22 Oct 2022 23:17:38 +0200
Message-ID: <1de34fa6-dbe8-d3e6-b097-a44d09dc32e7@vivier.eu>
Date: Sat, 22 Oct 2022 23:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] tests/qtest: vhost-user-test: Fix
 [-Werror=format-overflow=] build warning
Content-Language: fr
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221017132023.2228641-1-bmeng.cn@gmail.com>
 <20221017132023.2228641-2-bmeng.cn@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221017132023.2228641-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:++HFi38NnpqG2tTgSgWFdqpORQfoiIA+nsE6qUaqfA28cKM14c4
 bGBgo2hnT1Y4pY5g+0jfsRlAG13SVDTqWOBZDLQr4k1bDguN+NQX2LQ4LhFxPg/fNOl4J0Z
 ju8vujbc9NqQulwIsUgzMkcC7amkX47rPzHcn1NCIlpRCNTjJ4nANDESUm1O+WfyBlxQi3s
 ET0sNiXYdBvp9/olBq5GA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mwtVYedkVog=:xLV2xJYItZESUHU+m1VXU5
 KfTVwgBQRpsom6ccxUWpshlhRIo27L9AOMiPLvTTV7le5IT95HnLmCyqTyv7TsXQWzFsLhGsr
 wIFwWP0bjCBbwtdhiRiqHAuTuJ2FvkCF0YuxnKgooEeQZTw9K8y4EYBCdyjrtgRJBj5QR3g3C
 uizqJYILTjGLQZPsKPsqk02bLXj+KQAvDvCxRWtLMYw6XFywRg8O7zsr6KIQCT5l2dPiwknL+
 xP7bXS5dpg2suwNvtJ4JOAFzWKhJ5/8E+CC7tqJ0kgjlSEdyG6cIQbhkvpCvbQxpZTwNSc8qk
 HUeoGSZGAga/2VrY8aELyXWolEVTHoN8sVXWFY0agpjV/nTZBRC1UZV1eGyNabTtQCEsn3bAL
 vJINaHlCz9CQ3ObMipWNsAUzGJwtupGnK/Wzyo4mUbO71VHZ6WDIS3RCTKHQ0DVSszm4KYAMx
 qCnHqzYonpjWnKpoLa+9cq9ZgBD/IuufTDLvI2pk13w1dlqiHJnkLQOiPtgKk/jU2vf4AU8Lc
 xGjAajJWTdxTmrCcPwTJsHNLLTUfzatHhF7sP4xqeBwEQ92sVKHuQdbWxfYg7rNUNVcrMKp95
 ZzERQeMSeZ0AL9CkCPHE1tQL6C3OqB0S97oDT1LBg5gsl1ZWfBvpnu6qWNXHv3PCcyPLJUn4u
 VUmSx+YAfBdY1dOotNRazsXiBK5u5O+Ncxh1unF9/tZtAF12LWwmmWeyX3jkYu7ur2u4nULsQ
 GpTQO0YHhgZKABFNIRCpcy6T+geOnjUVL47I7QRvRq7QeSB6aXs7KIKh/IlOC1bAavBTwjDH0
 neQrspQ
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
> Fixes: e6efe236c1d1 ("tests/qtest: vhost-user-test: Avoid using hardcoded /tmp")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
> 
> Changes in v2:
> - improve the error message
> 
>   tests/qtest/vhost-user-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index e8d2da7228..bf9f7c4248 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -571,8 +571,8 @@ static TestServer *test_server_new(const gchar *name,
>   
>       tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
>       if (!tmpfs) {
> -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> -                       err->message);
> +        g_test_message("Can't create temporary directory in %s: %s",
> +                       g_get_tmp_dir(), err->message);
>           g_error_free(err);
>       }
>       g_assert(tmpfs);

Applied to my trivial-patches branch.

Thanks,
Laurent



