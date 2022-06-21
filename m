Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440D05533CD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:39:38 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3e6T-0000mi-8O
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e2S-0004BA-6r
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:35:28 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:55593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e2P-00033Y-LJ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:35:27 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mq2vS-1nHiHE2lT0-00nAMp; Tue, 21 Jun 2022 15:34:46 +0200
Message-ID: <da574ddf-69ad-311d-6c64-366072cb6dc2@vivier.eu>
Date: Tue, 21 Jun 2022 15:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/7] semihosting/arm-compat-semi: use
 semihosting_exit_request
Content-Language: fr
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-4-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-4-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MYIPAxgT9OHmXYsukPw4cUDLSxKLNLdcs65Hm3ajNqTPpMr9Wh/
 xzIbztiFImjBO3rKBRcgOgDiLRICTjGQOXcMyacgXPOR4iwcYpRbSdx7BFvhlItZKVQaHPo
 7R290ftJMf8KgS28oXdOJz9S93tvB13ZmVKX3MiaLD+fVY7Rvc9ZdpND227vwdLhi5Z7AAN
 zZx9cTU4FmJqJxrgOrQfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mpv1RCIctA8=:sopaBQEnU7ZRXz+kvjI5cy
 CQE8eYV7ImJ4u2tTW6moC8ouuEBDDC0tVkVbUXonSaX8U00xLDx1+hFKGNpdiQDXN1xgo1OaR
 TlusimiM+dWP7MfjXWl58iPJ+6CCM1oWnNugcNhqBsHeqUA9qq3q1NXM0DZ7s+Ts9QNdAfRuW
 VoWNaMsNKGaikXhyqc1pBfaVxx6WQ+g4t2CV8och3EPrfj2jl0AtCvQuatagkCpSFRfx2NhYt
 Rv/0SAl37GkYJ3PJ+v6zvzHk8GrA+9fr+/W2UlID4U9DWBNfKeVysxG+Y77b2cPU6+gcNQYe5
 UfcL0BdykP3tkLLqqZn6Kw+iToumoVuhEaDRbiMKsTlH67FUHbodbaT9qojSoygvhiRULo13H
 EyW4OmVIfRjHrltVOwRuVWfHe5uo8SkRmoK6lcTraSLQbIJ/s8cyLlFbQ3kYzNGeXuQWj5DWe
 KstgeFn8hc7fJmJnLFcxNzd3uMM7zQfE7iR/w5PhYVchmrfN2VTvG+Qea5HT35HnDX0mEH1Qk
 z7C9pRRGh7DDv7n7AB6lLZZOrnUsHFjhR2Sl+7zDloaQ6JwFJ0Em77l5ahoKflW1muS9vmo9r
 gPHrhYF9hDvEDsBt6zN+5L8n3gxIJPY6nfOpFTWhB9FvHAoiPEeROSDDR5V0VOsp5qS/fiV1i
 tjlj/5cpG/RgtdUsVufm4ZO4eQUhE0S0FlwE4IHFjAhyAT7L0qpz3du2J0j0iUDbUqynMOJRb
 hlvJ7pnB5U30P1RamQb/7M4WpnWoMWEuPoGyzQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 21/06/2022 à 14:59, Luc Michel a écrit :
> Use the new semihosting_exit_request instead of a call to exit when
> handling a semihosted exit syscall.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>   semihosting/arm-compat-semi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


