Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2D5EBF1B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:59:58 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Nb-0008Dk-R3
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7HH-0007BG-Ql
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:53:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7HG-0007Qv-9k
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:53:23 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MekvV-1pDYcc3Psb-00amHe; Tue, 27 Sep 2022 11:53:19 +0200
Message-ID: <a3fab6a0-dd90-f87d-b23d-5c90f717bcc0@vivier.eu>
Date: Tue, 27 Sep 2022 11:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/8] linux-user: Sink call to do_safe_futex
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e/MEMtkIvbrQmG4rpMBaNza6trBEdJwJkmEgP0QMfqHT4UwWORp
 T7SiNFwCUVoMiqjmeblQ91/sS1LvHInBylK3mPaaHHgNwLUSaQ42cAZq7v8ekQ18g6J0OQz
 peeibD94+1JidICQG1DIjogGBwqKP/8Iayk6WMDEXjt8IcLdPRPsc11K7YY8w+3h+zx8tRg
 BsJ6tOwTS2R8PsnWKLx8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vZSDhsv7HUs=:1o3y8XVJ1mRAwm3qhPd3E/
 kHKQCoXEbZ60c38Nb0qW2PwoF6TBgehkUw4CxBTAK2hSRll9PPLAfoSCS532AAVR6mJKuCPBM
 ATNET1WcfIdo4cC6ff+VEOgLDgQfds7zuSvy50RvNt95xfxWEDzKH7JVXB+5oiunhiXuFzXkW
 bbNVeL2v3P75vijM8pkeHlPM2KV4ziIaKyMbXvJVdEn4dhqq8kS1VsK+f7B0S51czKJsxwohH
 p6CgOVoKXXCHL8DOBca5X8lSB5+12Rh+j1lS2Ej2eU5Q0jMlpplSM3luyUTphYu5pbjO9ZzLt
 vUzYwMZVRX7wD4O2/Kka9WKjDXzBt/xhyIJ7fsvJz8AownES4ttR29Aay0t1DPHDtLeOn4IL2
 fFpLlMVx6jiH7cZg3ZIQNQUqzEDzNZzIU1IS7YRvv+H2zjAphOcuz8aH7BOqs/wqiD+gnFXYC
 Yqfh2WIovlH2f82rv0bKdaAtFNWdzwfHIgE4Wm6K0BjWNbBhwSp2i6jSJjYfDODCjW4xHY61X
 wjo4+6sJ3UB7ql1/r2RJa/kMInBhuVgk9yUS9CQed9PbW81IBP2zrdkC1JN3NmdhlVfmYJY93
 sqOoDF1wbOlKwMhMrBdwRna6Dugz+9MKR3KiPmXVpv3zG4x0btUwlv+bVu23tfUUNOfWvHwA4
 0kuz3/D/xMNiqMwGuc2s6OZ1uh3cxErq1qJVpn2oE9RLKC96FGYc3VxBckUgtgIJxpc722wud
 sa5ogubS/1ioLm3gt7gL/ikDK/YQFBN1mjc8u7lDoNWCE73nhqyUb9g0zHDuUKxr9rUbAM9Vt
 uJR2Mnl
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Leave only the argument adjustments within the shift,
> and sink the actual syscall to the end.  Sink the
> timespec conversion as well, as there will be more users.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 60 +++++++++++++++++++++++---------------------
>   1 file changed, 31 insertions(+), 29 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


