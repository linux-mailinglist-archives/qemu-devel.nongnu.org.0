Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D05E93F5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:29:00 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTYx-0001uq-M0
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTX1-0007Xp-Ei
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:26:59 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:48017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTWz-0006UR-UD
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:26:59 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MowX2-1p2Q8e2tva-00qQhm; Sun, 25 Sep 2022 17:26:54 +0200
Message-ID: <4840f479-34a5-fffb-def6-1c7d65d330fa@vivier.eu>
Date: Sun, 25 Sep 2022 17:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 05/12] linux-user/hppa: Use EXCP_DUMP() to show
 enhanced debug info
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-6-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-6-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1UCXRo8wJ1hxM8EaFtSDXjnLcRkW8oKaTE+TwLYBvjKH66jc8qC
 kjZ5Af/1APTDPKJto100MT6AZZNciCyieAqi32a4Ps6l6uqmLoZrzEiZSEBr53w0nJT0P1y
 pME0GxRTqSfg74YAw4UhaY85fM5rYTxSpl69r1gFbuRtjsw2f3fJY0gZmxxsRdxiyv0qoXX
 TSm4XOoDTyp1sFDGbViJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sCRVtczemrY=:21npg33DpDkcVJcWpdAOT6
 molNp9xi/DUilzOfuMTsH78fggIFgel26jatoDyZdb4xGjE7V2GeNRBnqhBwO10L0FTbUGy+w
 /ObDozPFOZQ1IqjCxm/6jX+gZKD5ghkOgJcB+irKZESdshIMs6a7HKqzgp5a0MB4wtbUAqDSt
 XFrkVFG+H73WnN74boU5AAGqYk8i/U73uqn6EuDE7385tUeQiIHLygGJ1XtcTLwdnh729aSya
 YzxDFmXnLbgw20nsyt5NIXXLWOrROS52RFl8dz5LrE43xHJCzUMHHjI/Wtw+O821sl/rvMDCQ
 GgiO2ZzwzBJzu/teegFp26YPP+K+S/q/KjBisRIKge8Kw1mZirXGkVgcjmk744GTeYyETAjnY
 cVOeA42n+rXIFpdaF8yfm2I8sNh3/wxpZ7VqEsbPyFA5+GSRQuR59eg05GJ30QBRjc/Fti4GH
 pOMtycqT2OUWxAZNy4dwFgodFwkwQiMssSflKMxgoyFfd2Rqu8/Y/DWrhadNGHNHwVSsdi483
 x4iVy3Dh7Q4stFt0wPCR6OA+HWy+qxcepQoMA1ba3jWE/Ujb7dCbc7pVoXgLjol/YQOxpskhy
 tnT7KUrc95oCYZLVvgquh0Kz+4aCi5HitocLOYvmtF4BzA6PF6qLRzAiqnuEejswA7QlWA2Kc
 JBighdLVRcbbo1GMW0fkt0UCYqGrnZrs+IhvK3iT/vDGatprupkhsprlObnTTe3xhWlJnsUmi
 uziQ4et+d5Sqkaxl+UOjns7lJ2HwMZAgXUoD3GHFbDm5f2z1mcE/3Zei515lrxavPtJykr+Yv
 R2ee253
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
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

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Enhance the hppa linux-user cpu_loop() to show more debugging info
> on hard errors.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/hppa/cpu_loop.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



