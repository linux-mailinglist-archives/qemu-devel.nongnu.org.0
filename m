Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB53330E9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:29:49 +0100 (CET)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjvI-0007b5-Sr
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjlY-0001ir-Ts; Tue, 09 Mar 2021 16:19:44 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:40269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjlT-0006Qg-AP; Tue, 09 Mar 2021 16:19:44 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHWvH-1lWe3l3tMP-00DW8L; Tue, 09 Mar 2021 22:19:37 +0100
Subject: Re: [PATCH] qemu-common.h: Update copyright string to 2021
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210309162258.28633-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <483713c4-0419-18ab-a0fa-74831eb8cf7b@vivier.eu>
Date: Tue, 9 Mar 2021 22:19:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309162258.28633-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Luc82Wg1KNNoyi6FTdivNmQepfBP+oX9FtTvgdNw9KDaYvhpCKv
 5pFaJHXoPoqHccqsFd3g5V05Po+ChSpCLAoUYVmlZ6ZEy49bHo2W+x6wZpJEkzR8LgieWku
 T8g6ZHsMMracmcdsrW9H3m8dnSbw52EXdjrJad0Iz3vJmEBDPZfr9iA4NLsQeGDh8izEhNV
 oKDZgnko6Ev69WpixcZrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L+EaZ1Kfx+g=:G1gVuDO5Nm8QTMA2RM7bF3
 zuOK2hRSbzbun3UdCW50asZXxzdVNRt6ul3dK4HulmfQ5MZN6WN94w8Grlnl6OewBZUEjEaBm
 h67dJnekjtiaSMd6+K1TKgRmQoBM1INB7po1ppNrs42Z41Qqfe5uKEfW96mv5jrWpIccX6qQJ
 dW9tXW2L4BKfARlwc43obb+hAzFKQlg5GK4kqzQsrr6j/aNbtdihUd5ZeFZhafF8njyCwSrIL
 oaQ8xiHY+XrgsB8UHcsng9Z4FLPE38sGh4h87PKKOsOF8rYZw7I1eYSbymDOQarPETg80O+RD
 DS71ssIEkLEEdLVVh7kTEfPJpfJmnzqIAJI7VflbV8o+ZBOWAx57m8xVpzSBafpSdCpwmi7Ck
 IaUqbkuwguSNnyHxKwCgrP0n+C+h5tr54afuUfofcp+r7ZEN43Z4/0IMhGoNbO/8rIcAiSAAm
 A4OGul2iJQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/03/2021 à 17:22, Peter Maydell a écrit :
> Update the common copyright string that we use in
> -version reports, About dialogs, etc, to 2021.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 654621444ec..73bcf763ed8 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -13,7 +13,7 @@
>  #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
>  
>  /* Copyright string for -version arguments, About dialogs, etc */
> -#define QEMU_COPYRIGHT "Copyright (c) 2003-2020 " \
> +#define QEMU_COPYRIGHT "Copyright (c) 2003-2021 " \
>      "Fabrice Bellard and the QEMU Project developers"
>  
>  /* Bug reporting information for --help arguments, About dialogs, etc */
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


