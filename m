Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1A55C0C5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:42:55 +0200 (CEST)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69cM-0006B5-7X
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o69SY-0007vp-2y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:32:48 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:58351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o69SW-0005nz-J1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:32:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mna0x-1nPLzz2OHt-00jXKL; Tue, 28 Jun 2022 13:32:42 +0200
Message-ID: <58f568e1-567a-6ba1-2e3e-93639c7d66b4@vivier.eu>
Date: Tue, 28 Jun 2022 13:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/2] target/m68k: Convert semihosting errno to gdb
 remote errno
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220628110047.666612-1-richard.henderson@linaro.org>
 <20220628110047.666612-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220628110047.666612-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qqVW+7UC8FXeT+UkaQW8U8kdJeZVpCycnPyHEQMZUERN2pKySpe
 zW7Ul4/2tVxIZyZ7jwUjrnaG5EcgAY03ce1KdbVJj9PV/GT/QUT2CT1a3MYlDqM2EPN7gST
 YwabUWa/DOVm592KhHzpF9qfv+JnVaLAtw5CDm8/kjr7pmoBMpBHYOYncUkzY1Ca1ry/FDm
 rBwFbTL3dZZppsDi4kfvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z1+VGCYBBvc=:a69tKU7H1f8FkRtpRMkosi
 EQRDLS29HfnEI7GuTNBVFUdR60EP04ZwQUIEhQAeeeVnfv369Ao2MxDPeHi+JofOvzXyZgrge
 9S77a4PjZvhtkh/r36J/Mjv+4CXNCu76hvg3Zen3P35N+LJQ9EpER+knaPi1MkMlaAMzk2SlD
 +dhTy2V3bI+O8Cq07G8PeVNW5TcZ8hKAtamubTAJnsEteow+dH9jUm0sDKDDH878yNrunAUHe
 e/H2ZlUZB0TcAd8NXjdxSdwLt97lZefd0tEvzmgFUXCAs//kY7CkhB8EmGJF4oC0PK2zuqDdV
 SfYq0bfKk/YYJ4q7z4YZvJBpltE4QKGmWZvkzhfYrOAsdSs186yh/bOamqPWjB6iwG1NHCwn4
 e/bo+AvJAsnvCz2Ohz/2f5vt5D/im9Fc12PfPO8p/ZosFopCS3F6gLt4UCUjB8u//8SAnAx6A
 Q1kIGvvFUZQ1pyLQ4ie9yGUih3ITOq0tyicw2tJ49HWAq0AV1A6/5O+QFotgXC7IeT7Du5Ct9
 fFNKni674AjZcRjlRhyE5ZCNWTfE3bPixMjIBRfewp1wjlmXHKZcN8+VnGuwN3NKR10/pVRra
 al8Fba8ILtxIKjDsyqoFlR/S3m47ctpIG8UuYU6NX+XJjPSG4q94tOepufWIYk4s8KwmchUwT
 f56TEAUEk8iwez3g6xF6pYXAW8M1KTHgwbAeZqe1JBMWXGCWOtDZus2KKsJgTChAG0BVhGiis
 NRJERd69fzaV2nqdEK6zVsfccDjnF/ZB323JZA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

Le 28/06/2022 à 13:00, Richard Henderson a écrit :
> The semihosting abi used by m68k uses the gdb remote
> protocol filesys errnos.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/m68k-semi.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)

Acked-by: Laurent Vivier <laurent@vivier.eu>


