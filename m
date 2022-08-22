Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9E059BF97
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 14:40:06 +0200 (CEST)
Received: from localhost ([::1]:39710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ6iq-0001ah-Cp
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 08:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1oQ6hQ-0008US-Kf; Mon, 22 Aug 2022 08:38:36 -0400
Received: from mout.gmx.net ([212.227.15.15]:60833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1oQ6hN-00027s-7P; Mon, 22 Aug 2022 08:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661171909;
 bh=R/aaE0sKC+8qtXCTAkwIAdBQ4jzbamBZRSTTqVoWIiE=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=WBzeSwXVrrbhFIrcFgbHf92ob5fCKLgfnjsVy3RikghdwFT7EIuHepa1N4xKTHw6h
 hTvMsFBLs5U+Bc6tBgspn94PCIFB2ECDVgH/JjmBydMgtwywrfMq8AgtZP7Nl3fCr+
 NjgT++KHBG63AR6VSWIsX7AAeI22UF6TiK7IHN20=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.222]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1oq80a05kf-00QoGC; Mon, 22
 Aug 2022 14:38:29 +0200
Message-ID: <83793e88-651d-0253-0f4e-cb632957de20@gmx.de>
Date: Mon, 22 Aug 2022 14:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] target/hppa: Fix proberi instruction emulation for
 linux-user
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20220822103131.381075-1-den@openvz.org>
 <20220822103131.381075-2-den@openvz.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220822103131.381075-2-den@openvz.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pNucMcSAAL+ldMtzax/cjlJV2vLNeTP/QBR2t+pXarZk3zFzfT5
 FFUkJP9bQMYUxkUSlFWMLSgo17JPrL/O1Y3CO7R0SlM+QvGV4VK2ivN0/VEX9tuO5dkMQtB
 fJkByS/hzbcb9DpNTzWsULzEaPQtddYugBRWM10wa7U4RLimJuAwoqkPhK6Wg4xxMCZy4W+
 zUd2N99rKWLcLw6TpXNQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0CFMgTHPdTU=:W87D1YZB/NdcKlU1MxGCbL
 37w636yStCTRb5ZgflutBmz45RuJsOPHxWukhzSmiaJ+ujVvf1WWfiKHv4KPfXTOyZR0v2Udy
 jmwHbvz8rKN0GX/z2sv1vo3erbgffPIXBo88GpqmLeRzuu2aaQNBCF9WB60ecyUS45DfJbIfV
 t2CNpxRcbvvzySpVv9Yrt8guZMpgaqae+mHTAP1lMw3SiUXDq1dWVv/WunYudAMZjgEEeLMGI
 52YTz+p8ArR++qMXMQNLH3+QEzADoGjG65/DA6zvIV5gB/Uk6vI6kPwYSI6XcGhLt1ctl18EE
 cNe9DDcsSIzbzmItUeqwz9+BifL4u2G9SMUIV7Eha/l+qVU2npe8vRmz5mpYsACkQxZDJJpUr
 jFJr94lRJhTQBZnOQ1jgZQjBUysPf+O3g60JQG4Qqa7FGe/bmucEhTx5KuwFW8LYRnpfY0E+S
 iEsHEEzhxl+KJmgNxVfYrhETHo2GG2WS2QCRuEC+r8FZBMydtjAoIPo4v38oZ99KFR9+qQAWv
 RmK6J1z0Jq1X6M6O+EJnlHimfJ8el0XmXb56kpaklKX84XmlzoyQiQ5zX0uohc5rdzMtPJRi8
 qrLJOF2SB9DvUVTFBu0cMrwAtLTBd8rDf3qwLPDBIVfofsAgmggHeThyJyeJk+US+edJIRynh
 434qSCseezjjF00dpGdJO1XiuiGL7+JcB+xgkvWU4MS0EUKsUtp6hpli1eNGzu8BsLVEugGP/
 Q2+h0DSsm8dKUE1E9y0fPe4GM32JX8UuahbBl0RxV/B3R7G5KuBbi8GoKJ6hM4ghALvK3a38a
 AZ9VmBGpc3LocFmeFrsrazDfmFq4bOIAGFu9YxyRJKVTpCvi1K4Jp0rL3Y5QlpEmLAZy4mHzm
 XRSDtAqkolSpEmdk1rBUT7ZCE5IoMOr7+um4+VJx3G0LYeBLEv40qLIHOofPxOF2XfarDnTY9
 XXrUs6ilde/j4f5xy91378UAzVoYYTwr4tePLCNi8YW15jGCdU6uNoBqvGTNgkRz9wyHyK5Lx
 OzMOnXZPnuzm24Ytd/6Q8jTkxU/983baNFv5/EpJJ9MyOBkDEEzLjZUAG4QQ9zP0PFFDR216n
 7jLLoY6PzS1D0Il66aQDCjSpXqG2GFALJGjoMB4zGcPKanzivOZaySs4g==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thank you Denis,

Btw, this patch was already pulled by Richard...

Helge

On 8/22/22 12:31, Denis V. Lunev wrote:
> From: Helge Deller <deller@gmx.de>
>
> The proberi assembler instruction checks the read/write access rights
> for the page of a given address and shall return a value of 1 if the
> test succeeds and a value of 0 on failure in the target register.
>
> But when run in linux-user mode, qemu currently simply returns the
> return code of page_check_range() which returns 0 on success and -1 on
> failure, which is the opposite of what proberi should return.
>
> Fix it by checking the return code of page_check_range() and return the
> expected return value.
>
> The easiest way to reproduce the issue is by running
> "/lib/ld.so.1 --version" in a chroot which fails without this patch.
> At startup of ld.so the __canonicalize_funcptr_for_compare() function is
> used to resolve the function address out of a function descriptor, which
> fails because proberi (due to the wrong return code) seems to indicate
> that the given address isn't accessible.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  target/hppa/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index cd304f051e..fbd80e4248 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -170,7 +170,7 @@ target_ureg HELPER(probe)(CPUHPPAState *env, target_=
ulong addr,
>                            uint32_t level, uint32_t want)
>  {
>  #ifdef CONFIG_USER_ONLY
> -    return page_check_range(addr, 1, want);
> +    return (page_check_range(addr, 1, want) =3D=3D 0) ? 1 : 0;
>  #else
>      int prot, excp;
>      hwaddr phys;


