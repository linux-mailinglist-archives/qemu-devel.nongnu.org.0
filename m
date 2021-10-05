Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B1422062
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:14:16 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfaZ-0001rn-MH
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1mXfTo-0003oQ-9G
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:07:16 -0400
Received: from mout.gmx.net ([212.227.17.22]:41041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1mXfTi-0003B0-QT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633421218;
 bh=kmLWD9FuE2oTt3Jyj7b1NX2D8UoVt/LkKtGjRbl5LLo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NO0vBHL5hOvtW1j1+3G88o3xwPENLc/jiOXRstQBjUekIq3a5N1lIuVIPiSbfErEV
 AWoLA4Aphclho0b3DkXqa6Kd/OpWiNQxZEv2ZOeBfFr/BCyF2NthGvjrKIka11BpcY
 LsZRNoxRXSEYVwn5itYpyVVReB60BnoCEYQ4zN6k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.189.35]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgesG-1mzKCE06Ie-00h9jW; Tue, 05
 Oct 2021 10:06:58 +0200
Message-ID: <eb37d456-f796-7d83-886d-3fe0dd5a2f19@gmx.de>
Date: Tue, 5 Oct 2021 10:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211004083835.3802961-1-f4bug@amsat.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20211004083835.3802961-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QZjx65W9VBidwnWMBcJfLTvv3BfbxT8F457QBZ/BA8du1emQ7cy
 6sYTAU20LYs5ALydUF2bTUdpBfBwT36hwmtKuVk97qaQEHiNNPpGMKuEHV/+i+hXZe6G4xa
 N4+K1NKWX905vRJSWu667H5fewFnlya6g9WyoMYrALPUO230ewkdQ9dITuCfipsZUpafY1z
 +EgxPS+pZCaKLsc//AdQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d4Vn2u/+J4E=:eYJ9tGdXB3TgK8JzP3B9QF
 sF/78qu2o1RwwDm5bOvuwQEJADdS8ezcwlduyT39wOr1eBomdGtzeBGzKc2TJBrdvI+wp7+Dg
 xMn8uDk1opYxh/t0P43SOgXHDGcMG30baS+VWdIRTTgilib4MK9ChsN0lFh8GYCTFFcx7UU81
 NuVzu4YIqRVOECJbUGw/aBAnJ5qVGoSqdfQ159PLUwYKJ9oAqyjMgm2KDFbt9ywqfC3wJSL0o
 xDXS0vCHMKRIb07QtDKObNUjS8BDuZ12TPc3WyNlW3QW2WhsXnakfHeQ2jTQynJKffmbsME2n
 ie3spGp15qogbzEbWGP9c66jZQ5SI+hex9cIVQ/VeSyes7NUHOFfDGDRDZkIzDZV7Eb1m2QLl
 Qdkl98i4FdBMM02Z9VaH378dCwlLB6cJME17XWU45cq7WWzpBztTF95Rfn8ePvpmaHAhkG+Cn
 RUywWvuaO3FJPZVkmZV6HzHTImm5Rh7xw1f5zpnSF6LEXz0pqHg08D3igNnZDDoNVTonDjIsA
 xnz4Dk31qFMdMDmjxeaC1vpAdS7PXcT+Lg8jQ8TCF/Ine9AJEWLQZA3yMexmLN4InYE35trs8
 k2MOfSI5STVSquLmw+UTlp0V8EBMsDV95qfnkXM7ske0B/JeC/RaA/Z5LIM+ptM8RpiZh4gsC
 ZgFkegldUQyFu1vH2msHf6MFSZTV8t6nlIbgOiMciHyeFsihjy58AuIxMF0xb2K7o+IcSK98k
 a5VK9j1/fBG3+PQOyZNyybxPftbO9ClEpzCDOVhMfmdKkwqtbiUgxnX6orx4vnJU2fP+9PCUw
 ktuvom8w9S5Wt5o+qkGZ6OSF+l+xnaxAMOLgSbzQXfDtpdpmfoWc5fZgG/J7T5C4QXOLOVf70
 KHZyBUqXdTaEkXmuffXN+f2eTPIXSSi0WsaG6ArHTHGIP6m0IHcXO4UaaiX6BbT+D6aEEn2Oc
 wZTphGf6T9T2Uo9dic623nge//8gybNe/D0qnUS5be9/joIr7dJIs/mtNr7Pge+4gd+ZSXiSg
 X+ajruhseJoMlSI5SoJy0qJhUhCQv+/mRVWdsp54k/hXwY0Du+uUq4CSBRs6oO88SpD5V8k/I
 AXztikw76bQ4QE=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 10:38, Philippe Mathieu-Daud=C3=A9 wrote:
> Hardware emulated models don't belong to the TCG MAINTAINERS
> section. Move them to the 'HP-PARISC Machines' section.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>  MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..002620c6cad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -205,10 +205,7 @@ HPPA (PA-RISC) TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  S: Maintained
>  F: target/hppa/
> -F: hw/hppa/
>  F: disas/hppa.c
> -F: hw/net/*i82596*
> -F: include/hw/net/lasi_82596.h
>
>  M68K TCG CPUs
>  M: Laurent Vivier <laurent@vivier.eu>
> @@ -1098,6 +1095,8 @@ R: Helge Deller <deller@gmx.de>
>  S: Odd Fixes
>  F: configs/devices/hppa-softmmu/default.mak
>  F: hw/hppa/
> +F: hw/net/*i82596*
> +F: include/hw/net/lasi_82596.h
>  F: pc-bios/hppa-firmware.img
>
>  M68K Machines
>


