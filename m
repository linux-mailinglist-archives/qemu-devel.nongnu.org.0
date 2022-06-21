Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6505533D9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:41:55 +0200 (CEST)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3e8d-0003xd-82
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e3L-0005TQ-7q
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:36:23 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e3J-0003H2-GK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:36:22 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MCKO2-1nvQpn2L7i-009OIp; Tue, 21 Jun 2022 15:35:53 +0200
Message-ID: <35287e26-473d-2235-5547-7d750f0e4e17@vivier.eu>
Date: Tue, 21 Jun 2022 15:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 6/7] target/nios2: use semihosting_exit_request on
 semihosted exit syscall
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
 <20220621125916.25257-7-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-7-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u9uaiiLWCJsGf47tkhNpF3+QeVS9FWkHkQH84oSVM0TDCaGOLbf
 /KGsQ3e3eR3AW2mLlBHcNv5Fe9YFjLYF3FYwFLhzBBgagxDezOgjatI36dzxURZqtpDUJkx
 9lrtnIMD/eAROlHNLvU1D+APVbTMr7yeCZ66eB+nXuLOrRdhJ6vh/j8v9xcSlgU/IxrBnf8
 Br7iHhA5jXq6oyjIQ5vqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+nbI4sn3fIE=:Tphy4CVD3IR9tDvPbiFO8x
 hhaWkiupov4W5Xr+CkVvOpMA8W0flLh/miRnv6VeyziE4zxWxLVQJcf/aNJZdiJWEzxRoC8PL
 FGLyGp33PEKJyKGvOJ+tHBnrIQPPQkEP8n0CbCSmvS3MwMTUcT7vXKbNunq9qCLyNxbBQVkkU
 pf4acPKkyLXrp8IaMbjdCBDB+oLT+09FVz7tV1pZvH1gJ6omMUqdHRQpBYf/pm5OZhOkQTp7F
 cK1TMxgiJrxFVzOi8wnX5z7ecLPolbVfYroa73YP8/4RBt7tw80IIJlURf/O9fAnR3scKZloT
 9UlpxYab92Mf/bF9QDQgrP6lmgaAjOiCfuHwLDPanIvx65GMC30UHd+A0oMKGSYoxrTnwqca9
 N3G0VSkwCsXbvrBxmPaXuAVJ62U9HBIROjocAAVloYunpObwY5QR07PON0X/6ttaJsC5qBAyx
 4cOV9lRqTduvceDn6BL5iQFJtrV0BeW3qI2L+Paj+Knl7UCQpK7zedDFoZvXsNlKJVkdZrz/P
 yGegOkBAVzEY7dUR7ueV95cil5B0tHhdulR+HmPxd24sBf1NocHUVx7hbjlIei6wkWWKj4Z7e
 06ZDzyBBjij7+4VevGCmdT1T0ZHpqTQjft+wqX7OPXB52e9kRmkC6iJVtDD85cA4/BvwFlsBY
 0ifNGRD8qiRcadTjmwFvsd+ivavBTSXzRFMaFxwoHPk/QLqckAebVUcF39DlJpDt7UR2xGVPf
 9xTPViS2XZS6ccUnkixHWcLMU+9sbeJ4CKq5+A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 21/06/2022 à 14:59, Luc Michel via a écrit :
> Use the new semihosting_exit_request instead of a call to exit when
> handling a semihosted exit syscall.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>   target/nios2/nios2-semi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.Eu>


