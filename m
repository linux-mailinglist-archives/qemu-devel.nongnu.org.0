Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221393D4535
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 08:16:14 +0200 (CEST)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7AxI-0002pT-KY
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 02:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stilor@att.net>) id 1m7Avg-0001g9-CY
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 02:14:32 -0400
Received: from sonic306-23.consmr.mail.ne1.yahoo.com ([66.163.189.85]:39416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stilor@att.net>) id 1m7Ave-0003ER-D2
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 02:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1627107263; bh=kBmLAsOovysvsLlk7Fj6xn63zHa30F8jl6Peb5ULOto=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=h5OpOLQMq7ocM/RtNrsS/Gd91oV54TeaNvpssIN+rW4IPUbbPcqhdNRDQIoZ2p5wcw3rhzxXb8Po1gmzfJ1wmEKBj/8Uaygajn5Aci7JUj7et9/+R1qclepejojrszpegL32hqlAEbWlLVOUXcy4EylqXots9WlDmP9qNwWnqc0=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627107263; bh=9VOCwI7prCmfwZ/t5JhlBNKHwrjzZXbNFQtuqkpqGbK=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=PO4hfq3SP2HZX46wxe18Rm/MB1Y0SX12yIJzogoScu20uL428sYhqXXjedoiJSFJ0y/Sp43hBOs/1MpTrFsHSQkQzhL6kP8iN4eoW+Btzy+zQPAX4IAdT8XpowgTiQyGslBw9Gkq/WYvGa6cIsfdN8IRMHE/ZBI/7BfPsL6Gtjhj5enOyDHawu9iWhJrJmB8WkPlKpFf/moDEOtYhh59qesJX9TzGZJTXzcEq+a/mn6eOjZF2ZcwGafNmhogT4ZRMd4x6Q6z7CTRcZPOZjjZmEx+eS7p+Sn2f+BHdBq0CZjpwf7puMOdzrU83unajqS9qMIv/ExW4ozbpupO/8zv5A==
X-YMail-OSG: Tr7A62sVM1lsxjwu_fUbmShy4c9_nAa99bg_1ljr.tPZoldWGLAG6PN0FNOvTXw
 dZNjtAK1caJ2exwBTkJf.quNR6aSLmq_hWIrWUa6kqu2YAVrlVBx5StVnRtjGiIFn_BeGYV2Z_Z.
 5RtvCd2rhcxqvZXw9Hco4bn2kwJDt1afsaaL_2Qz8pZLTWP4v3Y5pqzbKwCbd9egmr2Hi82oqnNF
 IDVPuDc24KD.LB4l8QSG40GdTe43TJus3GmUvgXDiNr.D5h8YXFEuAtjzgIY8.OKR9DgFnJID3El
 N349Gtb.vFrgbNOd81R58.ZVHrMbC6GlG7y7TY9582ZfRzJJgHpvtYl0CZ6jCE2FvQ61tDLCt4gz
 Ck3T2GLCQxthVmanqQ7NbbTNw9LQ9jKUgsqUrSvJl2KYLDf5N16rWiAfjwDlrmQy4baIGf_ZczvT
 H5DoejpDyfYe1N3HkGpfVnzM0ojs_u8pODRhpBqcC1PoQXSyfhbqSJZ.gWnRsmQI0_M8bdOMmH4D
 vln5Ya3AeK8fKORLm1x1a_lh_0e7vOJ4w3Z_25T.coXZXmD9WAIYIeijIykurQbywQ2y3RG0gLs7
 aVb44mqk65uvqtidQTRvix5O999qED41_qDJHifOQqc0ILPMRwNDrq5JgH5Pk40scF713cRd7lU3
 htyIj.0WVzvOAuIznNUfkARJFP_HwWk.vA28uW.xi7GxRylElbOc8K1flXUt9TGcsZ.9ZEMzS1Ma
 7U8AkeN_ccDTONS6zlKC_mxnwt.TXKlBheKsF3aCrakrQOrkJs.2UKkhpFEwIyjfJQ9_Ph2.uKMm
 wemC8zsVVkz0ymY7Bgyi9kUFzgGTOiVo74HwkcLhJ8xsasJ.QE.QHHobznSoTB_Y.Ct.9D94jywr
 rjUXvCstNNWEzpWG6MecEvwhmYGqobn9B3OpjKhUMOyWT02E5gpVcuO_YYvXB7z.f88KXmQ9chQ7
 0ABaXaoJqF2i5j8P1AFHrtosLd08fvrph9_8eITMszF78LIn_UDnJ5Xzo3ClpatWEMp7UNDkgQXQ
 BOLX6E7u8D3.m6bEq0.gzs0bfhcNw3LS4lALUFX3gIQBr5.Kbb2gMHe7_vUCWJxBS2imWztGh8Qg
 uV9dFnx2Ter.jXnP1gQS.ylWflnWso4N6sZr13y03PAyi_F6oqBf0iYGjrCfixPtDu.t9gmQXkY1
 PW6Umnmz6vzfrQyQsO2L4SV7vnttIh.24GMaqyeMdkeZccYf5JSBVHc3JEfEpm3uSUEaXBc08VDT
 Rp.8mGo4A_aJjFKJW.PM2XrpNtsy4PT0N15NZhPmHxtmip9FZZKmg0OJqWJl5KjSnUTsWC4Gz9WB
 ycj7RjSnRNrGwC1dcNJVSJh8UUkCN78OCVquajG8nSlOuokvdGbLaPLrh0iwZ_W6gGbMUfHmqJsY
 OTBquVaW15uplP3Y8gpBc2HOX7j7YL5unIU3ABj5SNGk_3UU4ccWkNOE1R8nuhAdvtDJpnsEE3GB
 TSN00S3E_99h__gGDSPIvGsX4EnjiC5oDmfu32RxLDmBmydN3L4A3_Q09ZwSnhwVunUmCepsyUv0
 0xotlkfNUOgpFig0GRvr1tU2.PE2RwlK5l.kxHjtMfkTTeoWOcNvysOXI6PlxcG8AlfV.8q9SmJw
 iqWklK9lzw9S0958A32ympNR7omuYU2oAn9d1hFIoyBqJ6iBKvWLmJh_.aJpewwC.no3wpvMUjYE
 .BkYOnBmY6MUqJbZWoaIC5Za0x5JRcMBykzp3ngR1TXUDJZtcEEIbM4CZ9OTf3tmRNnypTCqFvN2
 W6Hgkk9K6uznu6_FKwY1MAZR2X2UwqQVeYYMX5LzNtbziDJHg84rIdk.gjZtILi39cISJ18WD0_4
 RDww9kHgRyPu8qK3pYwY6XTfggxSKQTQ5yxIowsOzJkzmElIxtuzOPG6KinZtJdBVMOka3NGInI4
 ssyPJBVyQKWaTdt4feJo8YgM20tuyERQhHlfk7GsTYM7NdfsvjFWlnwSr6K6ASkyZ.Snjat73udv
 DiVMaQUr4We3hIq9CZwxVsldvFGrfh7NJrKXWt3DNSTPLH2tibosmnPhZCWx1sf2fzbnScTXmwet
 MB0aOOhNx3WDBo.RdiU.8sTZaxBQoVNV7yXbD9DjM6EwWsfx7r5mzhd0tpJfPOJW9a4ZDt1Um5Or
 f3K8si9aRPv0JxNhlSpXxNfGjq0j9pw0ETu2rp85w6V.ImvEvrVhiTuOvJUddOHKBC8mm4016Htn
 gDDio0AIwitonGZiPgo2RaMBo8..L_JUw2cZVbkqIEGyOeGmIgk5lKLR8YLooXuVvCbdSRZnwhzr
 he6oGk11YjdtivtMSlaj1kK5o.PPBhlt_Im0bzbijmFYGDTI1f92PQA1z2LUDdcUClYOHhGBT1ZU
 768tipU8CZ8ri7BJxyMQzuZupZQcnaVfWyAY14ZAVxYnUrTKPI.1UugWOPtFklVV_SSZNosVFKM9
 imJ0lwL7ShtToDgE-
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Sat, 24 Jul 2021 06:14:23 +0000
Received: by kubenode521.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID dd96e83cc08ee449ed602d2c941adfd1; 
 Sat, 24 Jul 2021 06:14:19 +0000 (UTC)
Subject: Re: [PATCH] Makefile: ignore long options
To: qemu-devel@nongnu.org
References: <20210722040535.3683543-1-stilor.ref@att.net>
 <20210722040535.3683543-1-stilor@att.net>
From: Alexey Neyman <stilor@att.net>
Message-ID: <b55095dc-4500-2139-0e17-d1865e624fab@att.net>
Date: Fri, 23 Jul 2021 23:14:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722040535.3683543-1-stilor@att.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.18736
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Received-SPF: none client-ip=66.163.189.85; envelope-from=stilor@att.net;
 helo=sonic306-23.consmr.mail.ne1.yahoo.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: stilor@att.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch ping...

On 7/21/21 9:05 PM, Alexey Neyman wrote:
> When searching for options like -n in MAKEFLAGS, current code may result
> in a false positive match when make is invoked with long options like
> --no-print-directory. This has been observed with certain versions of
> host make (e.g. 3.82) while building the Qemu package in buildroot.
>
> Filter out such long options before searching for one-character options.
>
> Signed-off-by: Alexey Neyman <stilor@att.net>
> ---
>   Makefile | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6c36330eef..401c623a65 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -129,9 +129,11 @@ endif
>   # 4. Rules to bridge to other makefiles
>   
>   ifneq ($(NINJA),)
> -MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
> -MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
> -MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
> +# Filter out long options to avoid flags like --no-print-directory which
> +# may result in false positive match for MAKE.n
> +MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> +MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> +MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
>   MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
>   NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
>           $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \

