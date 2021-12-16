Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B4477A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:15:28 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuLn-0008SB-CQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:15:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1mxuGm-0002Ng-2l; Thu, 16 Dec 2021 12:10:16 -0500
Received: from mout.gmx.net ([212.227.17.22]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1mxuGk-00046w-60; Thu, 16 Dec 2021 12:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639674609;
 bh=Sr3DNSTvuHdJHS4uMfLQmjs1ZX/M/8wpEH6/NRUNtyQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MuBr+PmCoRGNIqXezmMEBfCWY2iChu0yYxGjYfwQrSD1gLpWxWUDPdprzGJORlP/9
 ZJrMrXV5jmeaF+1djPuvQLzYroY1BfMdeE9fxZmNvF2hNBbtcKNI3WCb4WlX4i1dgv
 fmOTpJyWtsj4GXO90kwQGc6TeAj71LW3jo6JQtDQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.55] ([88.152.144.157]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1msfCc0Tq7-005JHm; Thu, 16
 Dec 2021 18:10:09 +0100
Message-ID: <ded35220-e2f3-da6b-560c-2e3bb2aed300@gmx.de>
Date: Thu, 16 Dec 2021 18:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20211215120926.1696302-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jCcIcviQejyr1ct+bC1d9ZFm7tjF/53dGPx5ueON/7cnd8H2uOL
 PoH/55DBnUCapXsVuVssm5s4ic63frVaDeDHsJtPm9Kfxz8Ht5s4iBIG9FX0VPBOnRokLjD
 UhwywxT+83gfIFmGZdj9RVa2tqbjVQy95wAs3fe2PTIMVNmRF0gUgCSMPqITrIFFed9S0K5
 kPKnIL7i5cJ8ZSYL7b3ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7aYLYJD8dwU=:zgRYt1a8QJRtVZFdTuuDe8
 FyAP3i8v1S3Z4QDwZlsyv0d+DQmACmDvR0lDJPQ1894O0/Gvi6Db4z0kp6CRHwcQfzBrmKIg/
 xF8FkXTSXevsB5Nfl1kaC0gH9ES7bKWzbrOJ1OOkgSsWb+xGWESAHUPedwq/NLLWzzp2YDBPC
 Jht+vtHzPTOIcMI7XBlmJEBHDd8Uw3ahTieXboUhGr9zFUpWu5A5QkxkftFWDrSlDyFqy/WdD
 cn4A33K8vbQO7SpQqCCiWC9gfUtFWABaR9fpIfNHO3ez1dzQsWgNjURtzKiQee+++sB/e8u4V
 Mavgl3vTKpYpgitcAccGrDTTk9AZhNOfvsnOjRRpDXBNFGMKAJnmkUMulMYaGA8p4oZWaSFjy
 7bcqut1yrHt5pqzma7EnuK2EZXaRZbRLdr1CRidUO3t9EBEl2xKRa88zq3+f9qj/HVW1llAGB
 9uckT3BRyNZi0yJvmEcvL4fkb9aP2uSKW3RHpV0NWnz762XN5djesdBOKFk1Nr8eZbylDywWt
 7K7RS/ty3EL/1CKmLevCi37NzZwIhBigquMPbCeRdNRLvJ9Rduo1ulsujp2AH1sq41r6XLwTd
 9aLmguLRYIX0nJtxvE5fYKS0Ipz7LRXLfAyElfD4c4XtwnAA217FVqXSXPujMQFic950FYeM/
 fVK6jGAAoXLDQJhDzPTZ1kVmKZVtpKGNd1UQNnlUmErbQDoxwkY8P9RM5Skwc/nn28uJeENoA
 ukrXlZywEMebSG6HWifoPADqRA7N8zTu9yBpbVtdkBjzM/7ayHRMbAj5Ofrnv+/E1BSnF0u+9
 fUT7oM3bkCp3XFsxOPb8ilPrayPoDmpXKFt7ipyRniswBXVIYBPSJMQa5/GyNCYdsDVExc7vR
 E/N58SjpYLmG4Fh3E7a8TyqbwgGDPIPMy/F8SBf6UojuAb6Md0Do4GYHO9plaXp8B89JpAoFR
 Swy7Pz1hgpITQt2UaEYuBdewIjaweiAE8iZWhPKEwjt+Yp7DRcw/nwjeUMBJsCuJq86YTNJ5I
 tsM2U3oztZPazjonbNLqRG2JqoQbVb8uLm6HRxZCZ/hsapEhjNuWpbScR+pWoZLrlcLe1HLMV
 Pzj/ST22FevTMg=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.034,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 13:09, Alex Benn=C3=A9e wrote:
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
>
> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
> Cc: Ilias Apalodimas<ilias.apalodimas@linaro.org>
> Cc: Jerome Forissier<jerome@forissier.org>
> ---
>   docs/system/arm/virt.rst |  7 +++++++
>   include/hw/arm/virt.h    |  1 +
>   hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>   3 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 850787495b..c86a4808df 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -121,6 +121,13 @@ ras
>     Set ``on``/``off`` to enable/disable reporting host memory errors to=
 a guest
>     using ACPI and guest external abort exceptions. The default is off.
>

Tested on top of QEMU v6.1.0

Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

