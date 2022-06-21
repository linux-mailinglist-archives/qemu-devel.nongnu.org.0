Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA3553382
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:24:45 +0200 (CEST)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ds4-0007gq-76
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3dqt-0006yY-A7
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:23:31 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:55467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3dqr-0001BP-Ku
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:23:30 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mrh9Y-1nIFrI0UDM-00ngFI; Tue, 21 Jun 2022 15:22:56 +0200
Message-ID: <0bdc9e64-3bfa-0f8b-c044-783486b16346@vivier.eu>
Date: Tue, 21 Jun 2022 15:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/7] softmmu: add qemu_[set|get]_exit_status functions
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
 <20220621125916.25257-2-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-2-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5sAvW+XeaTkr4s5+EvhekchF77YtfE/hSODNnDs5vYgZpeoxuE7
 54yA66bQ5+2Q35CD29qYxKZxLmO23iQlvUX4xf2SRJXEdQPZqUcpNQOh2KTRdpvyRM/y2ND
 JXvRe1EUbQNJ6njBN9ghsauWjieT7TCKb6VCsYw2xVHSHSJWAKntA65tuXnteaRu4/GLIrE
 1ysDIw6Uq2oeoZqcv6PUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:byoBuzLFIDw=:MXiOHNYjYSuQkq5QXgm+KU
 LSEuEb3OFZG9ME+SKbRyuDbYfpGQTHwqQveY5i33chVOBiftIAuK2Cnwt1iScMUYKWsS/GxlI
 5zcEU4rnGu22fSB4Kce2WxZRM5/ghX30/JoI2ND0II+noAXG98Kq6HKmciwmwhVEW0gKFkjb9
 zAdUfGStFdtu8e8J9GvWS8Xsbwt5JsY8jToPE+LHio8oXm5FXnijxvnDnzuWy/O+8kf6vijCN
 i6t3qh821ep1P9/8CaH8BP+9EkDHB4a7lpagl6IJ1dmedUZUKR3bIccAXsHitgv9LNf0E9ZGb
 ZVnxYnSe4pRXL1m3P7KtYUoHkkiqp6Y4/xeqp+P2KEMrx4y1hpjxQJUrKYMN/Y0pIRT8s3QKa
 lZxnJWW0YpWOcIxaT8Ce2f7oIQPWB6uUIU/dmOQBy4PMkvOnd1xuwTS+L6LL33kLM61HPQGaG
 WOc1fnZzZMIn/ssvNH2a034Y0JasQ1UYn4BGuMHNOF/U7rSUI0x0ThnoNrIYaIq8vT31VdJvH
 Mtf/UBFTbSnZ+49tIGDWoq/NN5ZRtN+/kAW45zLFO8MjFxMhB0PO4+HzV3Rnps+H4+sPT/lvp
 SuWvyhhJ7Q4gMrcbyHzkFo+g4BOC0QVupcZuM8pz/TUtUCbrsIYgaHuydi3rFjM5aBQvmVs/A
 9q5Z6Ha6gcMLIlwCu9Fnh+8VEAvmkgDf0fCAeFxq9a4d7kCSeq+ghmolAwEZCnNHGXm7LU6kp
 EdXu6bLi1Zw3+xt1LFdOIAJid94XXh7h9ifppA==
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
> Add the two function qemu_set_exit_status() and qemu_get_exit_status().
> Use qemu_get_exit_status() in main instead of 0 as the return value.
> 
> This is in preparation for the semihosting exit request implementation.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>   include/sysemu/sysemu.h |  2 ++
>   softmmu/main.c          |  2 +-
>   softmmu/runstate.c      | 13 ++++++++++++-
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


