Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B75D683131
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsOw-00047h-SF; Tue, 31 Jan 2023 10:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsOq-0003vC-Cs
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:18:20 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsOU-0005W0-VY
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:18:15 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNss4-1oyjqG45Ye-00OD75; Tue, 31 Jan 2023 16:17:57 +0100
Message-ID: <fd1a910e-f22a-5f72-e835-608799da38ee@vivier.eu>
Date: Tue, 31 Jan 2023 16:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221212173416.90590-1-deller@gmx.de>
 <20221212173416.90590-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221212173416.90590-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NdgaCX4F6RiFy3SXUZfBJAceI7mp86oQdshw9rtT/n5Rqc1Ma/o
 heZezoRD7RWmzi+OK/74LlZZw7mKk6LH4mB4aC/o9oKrrVso7BK1SkTUaEYQP0xjK5np1lA
 VwSvF3KWxYVpODDTv7kx7BJp+T8JUetPZKQ8oTrOlLRJFDQ6YuQ4URofbHpdwgGfk8Nx8LO
 qERTwgPOvmSaTjNt26w5A==
UI-OutboundReport: notjunk:1;M01:P0:OLcOrtAuM+E=;fQfw+ani6xLSCLypLKFyjfJNG68
 vQOBxn11qaraTWF1uU+sSEdCozEC+8fTDyeDdeRfvXsn/hTsdhsTPNHwLsY88Tj9ETZ4XlOrV
 +tREUYXW/3eV3Atmlvwx8Tpj32MLVGua658kETq0aCzFGLnoUT7WIyaqXdvXI50CUfLs/Ux8Y
 l1+iLnahbd31VBAo95WlqlSbLmc3lc1KqqSif1mhpcySExmYVQj5fWGTf5V8nLpvDK194xlyT
 cd5ZbqpB5M7Jk86XhdvFEPycWmClCRseDyjHqsZc2H+uCn9wFL/w/Rr7fTciLikKjzlUzYwnY
 N3K8/IU7Pl7xCcelXGVHH3Q+SjRzVCbDsn1Opbq5kKAP2A6/YrUg+FZu83JTrDANT480zmcYA
 Ek6EkllQ5sf+J3VIQL3nZXiFx0yDCTFVL1RvT4vg/StMwzUD7AV2xttmwH4naW74HJla0pPwk
 T4lrWXBteRXcgi9O5PqMrUSDJvf/wtXlSfISSCsz2lFuT/mFIKC6U46kPT2Aex5iJpFbtzad8
 Dnk/wG6fLNXs+ZVmpB4VHTaxpatcxuvTKXE1wuaHQWhVJOLmrfMDZWUxhGIbJxUD3PhZ0ZBtE
 Ojm5JnhURjIHU67cI90G/qgBOUpMZY27b9oov6N/EljDIf+nt2k3Hd5u9y+UjKFx9uQOgLsBi
 FPtW3ocisDv1RHzioCpkPolxMOdLjHETN5B7y9InOw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 12/12/2022 à 18:34, Helge Deller a écrit :
> Applications do call sendmsg() without any IOV, e.g.:
>   sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=NULL, msg_iovlen=0,
>              msg_control=[{cmsg_len=36, cmsg_level=SOL_ALG, cmsg_type=0x2}],
>              msg_controllen=40, msg_flags=0}, MSG_MORE) = 0
>   sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="The quick brown fox jumps over t"..., iov_len=183}],
>              msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_ALG, cmsg_type=0x3}],
>              msg_controllen=24, msg_flags=0}, 0) = 183
> 
> The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg()
> and calls lock_iovec() to lock the IOV into memory. For the first
> sendmsg() above it returns NULL and thus wrongly skips the call the host
> sendmsg() syscall, which will break the calling application.
> 
> Fix this issue by:
> - allowing sendmsg() even with empty IOV
> - skip recvmsg() if IOV is NULL
> - skip both if the return code of do_sendrecvmsg_locked() != 0, which
>    indicates some failure like EFAULT on the IOV
> 
> Tested with the debian "ell" package with hppa guest on x86_64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/syscall.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



