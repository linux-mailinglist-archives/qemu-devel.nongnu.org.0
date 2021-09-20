Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87C410FA1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:50:11 +0200 (CEST)
Received: from localhost ([::1]:59028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD7y-0004Iy-Ea
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mSD3r-0007o2-By
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:45:55 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:41576
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mSD3m-0008If-Ab
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:45:55 -0400
Received: from macbook02.fritz.box (p57b42bf1.dip0.t-ipconnect.de
 [87.180.43.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id BACC6DA07FF;
 Mon, 20 Sep 2021 08:45:43 +0200 (CEST)
Subject: Re: [PATCH] tcg/tci: Remove its experimental status
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920062306.2723797-1-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <1722b3da-5d05-1bb3-18b0-ce613dcdf050@weilnetz.de>
Date: Mon, 20 Sep 2021 08:45:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210920062306.2723797-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.09.21 um 08:23 schrieb Philippe Mathieu-Daudé:

> The following commits (released in v6.0.0) made raised the
> quality of the TCI backend to the other TCG architectures,
> thus is is not considerated experimental anymore:
> - c6fbea47664..2f74f45e32b
> - dc09f047edd..9e9acb7b348
> - b6139eb0578..2fc6f16ca5e
> - dbcbda2cd84..5e8892db93f
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   docs/about/build-platforms.rst | 4 ++--
>   configure                      | 2 +-
>   meson.build                    | 4 ++--
>   meson_options.txt              | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index bcb15497213..2eff89e8cba 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -56,8 +56,8 @@ Those hosts are officially supported, with various accelerators:
>   
>   Other host architectures are not supported. It is possible to build QEMU on an
>   unsupported host architecture using the configure ``--enable-tcg-interpreter``
> -option to enable the experimental TCI support, but note that this is very slow
> -and is not recommended.
> +option to enable the TCI support, but note that this is very slow and is not
> +recommended.


Maybe "recommended for normal use." or a similar statement?

Reviewed-by: Stefan Weil <sw@weilnetz.de>



