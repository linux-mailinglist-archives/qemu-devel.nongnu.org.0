Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5B36FC3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 11:23:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYocH-0004b3-7k
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 05:23:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYoal-00040I-NU
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 05:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYoak-0000yj-Qi
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 05:21:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41455)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYoak-0000sM-H8; Thu, 06 Jun 2019 05:21:50 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1M5PyX-1haC2I2NmP-001OkO; Thu, 06 Jun 2019 11:21:47 +0200
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190530173824.30699-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <843a18f1-6d21-41fc-4e89-81b8c5f51fba@vivier.eu>
Date: Thu, 6 Jun 2019 11:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530173824.30699-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EEhQS2NuxrRhNUsIsYkxOhRgvVohjvggwNAA9EGV+FWFwj9WXlC
	dKV50mCMolFfB09x44dGyFhy2IZm3nFkwZomGhmTZCzZ8zUDyg9Rm1281eRI/uhzOQwOU3i
	GnocCJlB8tM8HdsGS5CYoOuDZwa9HuMGpfapYNQHEqHK2obJdw9WzTwhhJrE+XICdCiTtAp
	TXDv7RMypSNM27IVI8ABQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3NtbTELVJtI=:34ZTQLRw8Mobnb1Muzsnp3
	PtXbB+2B4NV57pWnYj8CP8USPnpM3Id68DXiVjNXXey8IW0kI2JKB5gn0ylgCueQmCthhaoFL
	itt5jiSe4fYUeghvssMYWR4FbZQAkxjBHvgjscX6UGpycqVQsrGDI4B1enQHw2yTVa0uSVqf2
	P6DrkDOOuGss8PXxEhc6R0xXG4gBqiGJX5BwPLcKpR/SoCPxxOS4Rq9ZDvuGeBHoPImmJls2F
	UV2ym5Gsk8J3bIx37XGRzrqau5BMl6Vag9lmmO4ku18KKxW9ruFOE2C79rkTIYENnrR6xe880
	wJrWSiu2rR8PPu0XNMWaqdXyPAE4CmYIw7NNI9Bk5Kx2qkcZZTGQ9UFbHMJvixeTPxuuB9Hs+
	rhXUwGNJxMX+7Hfnib8p+MLrNJgYXEFElzB/3OhatElWGixanGSy2O06m7r+Txtlf7OnWrV+L
	C79P5GJPO7yzxM61TOA3sPKzbgenxM7Es4o5DBwVRY2vjaBYVRs0XQxrz5TTjQuDMS3aDZoDz
	UXkedlwvCKIobNYFgXu+iSWXvRAk6LvKRihf0qnxwbPBiw4rBP4Ta+Msg1nnSBK4uqYkeHoXn
	omGBa9E14vtSJHeduV1VZYBS6zmuGMBhdGNiuSuBF9RkCbjl8EnL6gkx02CeCpr/2k/uwZ9ZS
	irek5YcdcWTFJTY2rS+KX5H1ZvN+eNF1q7R+JcgNk/JnT3Cx6xjnwyAa79t04HnKv4NuyvcAV
	4p0j0C+WkgZBT9lgZrbiLL3ryABCeBZMQj9/LCD0g1wyGa2SxU4qW5I3EAU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] util: Adjust
 qemu_guest_getrandom_nofail for Coverity
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/05/2019 à 19:38, Richard Henderson a écrit :
> Explicitly ignore the return value of qemu_guest_getrandom.
> Because we use error_fatal, all errors are already caught.
> 
> Fixes: CID 1401701
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/guest-random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/guest-random.c b/util/guest-random.c
> index e8124a3cad..00a08fd981 100644
> --- a/util/guest-random.c
> +++ b/util/guest-random.c
> @@ -56,7 +56,7 @@ int qemu_guest_getrandom(void *buf, size_t len, Error **errp)
>  
>  void qemu_guest_getrandom_nofail(void *buf, size_t len)
>  {
> -    qemu_guest_getrandom(buf, len, &error_fatal);
> +    (void)qemu_guest_getrandom(buf, len, &error_fatal);
>  }
>  
>  uint64_t qemu_guest_random_seed_thread_part1(void)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

