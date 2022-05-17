Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F352A493
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:18:13 +0200 (CEST)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy1c-0002VP-H9
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nqxti-0001x4-SM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:10:02 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:60499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nqxtd-0004N2-GD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:10:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MlwFp-1nPZYX3es7-00izQc; Tue, 17 May 2022 16:09:54 +0200
Message-ID: <1cf1b835-6f10-6b4e-9473-50d8df811c01@vivier.eu>
Date: Tue, 17 May 2022 16:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] target/m68k: Enable halt insn for 68060
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430170225.326447-1-richard.henderson@linaro.org>
 <20220430170225.326447-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430170225.326447-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vAZMc/96p0Jm3Rc68JDqOAyGO+D1wkpydka4yv7RWZaKVMnYTRt
 hJJewdKsXOjjq7dOAm5vtcrQTdEodIqCjAXWncJC8lBxFWmSVZkyuXyW1pi5UszK+znqPcN
 oXtYUqT/QRK27AEefJGHf3m/ajSaPIAhNvgsAmc/qn3A9o1Q9RxmtU2yqTK6AYNPa/9TIxZ
 TO+Ju3X27nVh82Q6vX0RQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1FW6mY4PZ4o=:G21aI0o09O5hZd3N04vRmU
 OZZUi9pBcTab628tJr4jxZVGgSHsva8HtgiQBrvNZ7367nYOPTak8X40vDEF6i2gs3HE85l00
 7Vbn8C6fhZtZw3/1Spz9hpYAefgreLTnWf1xss/1Xd86GIJZD2mj4OX/R4GT4ztu6pkHztOMb
 nTMnCorR7T+UGQegRYIAOGlmQwxSKwuLJCj9qt57bFAlST9rLTZyZy33l/cy5/TiAvtMELA29
 r0IsFEfG+P/bjJ2XJKrtpT2Ly9y0h5FWfvvpQ8T2q2n5g+3akDX9XL7CwQ10Z+waZgXcmUdm3
 tKwYZ7N1rHuUZorKcOIk3HoB7jW0E+SSgtjKimbLVXljl5m6WImjCDk2SZSEPMYoZ4NoVvB4h
 /hMXGiVLOM/diWBUa3Y1qc9l2AlOhhQ5xoLh0Fm5c4MJc0bZ8i0iLWeaPAU7lOIAMl+ase00V
 8ebcc28OewhXcGgcH+P9DM+XhwsNLotoPIO04h5/uS2OdWSQx3Zs45EMOeBJRCv1GM6zwEtJk
 uDo1AoHr5AGmwyusdspksQPYi/uQQmCAeTyB/DEOuEapw6wKXtX0a+rKI/zQUezXx7aNsjRvH
 snQH3wYcZ6IFzPInsV3nNokxbF5khThwSaDZJqo/vOXotXKQ/bTUv7/FECNP16DSFjBXtyW9E
 6Ykl616qxw53hCaHpPflcpg0isi2v75Y8c699LbtkQgSLuZqmmhJxwVijHL5TwhlWzv6fSAdV
 iWEHKwF/WNlKDdkJWj5r18Cot9BJzeRyMMc+Ng==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 30/04/2022 à 19:02, Richard Henderson a écrit :
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 4026572ed8..e4efd988d2 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -6003,6 +6003,7 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(tas,       4ac0, ffc0, M68000);
>   #if defined(CONFIG_SOFTMMU)
>       INSN(halt,      4ac8, ffff, CF_ISA_A);
> +    INSN(halt,      4ac8, ffff, M68060);
>   #endif
>       INSN(pulse,     4acc, ffff, CF_ISA_A);
>       BASE(illegal,   4afc, ffff);


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

