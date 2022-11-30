Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF3763DF64
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0S5w-0005yk-Qf; Wed, 30 Nov 2022 13:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p0S5s-0005xo-NS; Wed, 30 Nov 2022 13:46:05 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p0S5p-0007oc-Fi; Wed, 30 Nov 2022 13:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669833957; bh=YNuVchso2w7r4t0ROOKUi09ulgf0L1YKz+LEiubRZ0s=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ovA+i7ovtGk+UE4FlscmVHmhEv+b0QMRWSFwuARJ03FmlSFhV5wRB/5Fhxu0042f/
 U8B2r+OWZDAIkDHM+Dhqh0TuOVHPhf65lDzIEPCNKBBmsvqRiHixtMELgKG92Wms6X
 6zBs3wSMcOKwL/SjhuMqR91+qRTeaJfu7X1JLVrRVJZMwmfNGIeNSrNmsA62LEqR/H
 fj67KTlhw8i3496mDjaqwvqZSLq1tFgtdyAA4aoKTTZLNs1i7T6sAoq5vm6hDDHW4V
 xCKLwbp0RJi1zNOAhEzgfzXLmodbwIJmYNSkcfzWGLw3srAjKMDUSqrg2La+fpQGCB
 8TyvZ0gQdmdVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([77.2.55.175]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1pAJyr2Hvg-00CBPl; Wed, 30
 Nov 2022 19:45:57 +0100
Message-ID: <0b181d4c-9e3a-2605-3ff5-8114830d394d@gmx.de>
Date: Wed, 30 Nov 2022 19:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git 1/1] hw/arm/virt: make second UART available
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 daniel.thompson@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <166982763526.10484.9925072056712598801-1@git.sr.ht>
 <5af1cbc2-5897-5e69-a727-6f423c5c08a5@linaro.org>
Content-Language: de-DE, en-US
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <5af1cbc2-5897-5e69-a727-6f423c5c08a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:puVnDqWQOK+y9mm/Jt7mnikFFoZUB4Cb2soQYbm7zDxzHT4xUC7
 k0cp05ufAWaEaY9KT0yffyEuH06tlluZGartSco50E4NuqHKz9+gXgp+vCUXfdERZ5Nvys/
 ZblQqL6qOJCCdssgZyl0AyQq9EMYjifaWjNapDuK6d7k/Wi/tc3EYeeYUEyW7n+F6r/Vekl
 vMbULjCNKqUzdiNiI90FA==
UI-OutboundReport: notjunk:1;M01:P0:VZwXOIcGFQ4=;wdZdxsyismip8j4L8aoN3pi6EUe
 o/HaN9nhDdoMIWXHyaJmkJdp93CFHzB3Jh1Of06BTp26Doz538EwZ4+9s51tL9loEajywNfZg
 PEwu2QvsUO+GD8Jj5iaP56jzFPZ8BtcoUldtlhPGmBQkBuvv9gLynWXYG1Xy9fUE4AKCZ1vO/
 b+QOKPEvHCCuGp803JG73B61caIC0QBCzLNEBKxcMUC2mBp1DHrMdKHW1sk28gtTyWcFOIIeW
 TmGZGBzUCFNHlroTbVc+o5KMXYjRrdyjdvQOqOb/3DxN1LHby3mom/PLjEfTEshWLKy0aXfIA
 wcefmpGt1lBqEf3e+gYVHOGsx5Ecmg+cFQoapr9p6wdfxLUxU90f3oYd7y+KuT9kSm/r43fcG
 etmMWLZE5HvVV6t3bRkEbx5Y7WsaRldmo76DlalJQieRsxxiHFauN03aBX9UOOPCGG39S4jqA
 1j7G47acsVdnvG9cU5ZQJdJMhfh7EavZsFgHTHCMiM6VA5VXONaGMsLmfli4tLVe2qgBXTS7z
 cpKk7Q3NSVuHhsHwxq42mWPlE8YQTC/h1RlxRT/p+HFf7Mf8FrS9FMfubkbxTHGXuYAOKSugN
 2SISG7MzCKybw6eayu4fBnth+w6L/gOzwoOpN1cPeimS4H/eUAzpBDbWlamy74hIr3OCKNd14
 IAR0BlN5Td8flaSGBqf1F85PBmEC2NR5LID1J7ddj/7waqFJd0u9Tv2Pw1y0oNANaX0WBffnO
 mWwCGzf5GniVQyAMo9X6nl2vo96vhjvrbqwKnLZrVqekQh/6xXqfkz+04SHSYeYNyqBMle7vU
 s8+5z6+LJ/lVPT5jl92gGd48EFc14HeymOEKGLa4PjruAfntJtCzMoYQUbOtqU7LWimflUyKz
 O8MMoQcyrUeAgBj0313xkJHKw1TKTDKKLXOFychZ1johQiF3T2s8ABXaY5h/VvaKZVy/x2bjf
 A6ReaA==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,


>> +=C2=A0=C2=A0=C2=A0 switch(uart) {
>> +=C2=A0=C2=A0=C2=A0 case VIRT_UART0:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case VIRT_UART1:
>>
> Maybe pass a 'is_secure' boolean?


I don't think this would really make things easier. I wanted to
avoid too many changes in this patch. The price is, that there
are two places where decisions about the configuration are made.
But these are also two independent decisions: (a) which memory
this belongs to and (b) if the UART exists at all. I think the
code is easier to maintain this way, because more UARTs can be
added with a small patch then. Note also, that a parameter
'is_secure' would still not avoid mis-usage, as we still need
the 'mem' parameter for 'secure_sysmem' or 'sysmem', because
this is no available from the 'vms' object.


>> -=C2=A0=C2=A0=C2=A0 VIRT_SECURE_UART,
>> +=C2=A0=C2=A0=C2=A0 VIRT_UART1, /* secure UART if vms->secure */
>>
> (I'm not sure changing the name is worth the churn).


After this patch is merged, we have two UARTs, so the naming is
a bit more consistent. It's no longer a secure UART only. And
when adding even more UARTs in further customization, it's easier
to understand the order of the UARTs.


Axel

