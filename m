Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903A681865
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:12:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYd5-0003RQ-GM; Mon, 30 Jan 2023 13:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pMYct-0003N0-LM; Mon, 30 Jan 2023 13:11:32 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pMYcr-0002AE-VH; Mon, 30 Jan 2023 13:11:31 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKKER-1p4kcc2HPD-00LqgT; Mon, 30 Jan 2023 19:11:25 +0100
Message-ID: <664ef653-0026-999c-8c68-587c0442df04@vivier.eu>
Date: Mon, 30 Jan 2023 19:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
Content-Language: fr
To: ~vlaomao <vlaomao@gmail.com>
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <167510125533.6740.18222174398575558338-1@git.sr.ht>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <167510125533.6740.18222174398575558338-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gW5wbnEdnzyPJiGlKpl8910GHiI1XDAFr3aXh3wdmmRykIzeMbm
 M5ODyv10BdsOkWaL/iHP0uR2NJ4/fZpET5pUwbL8Z1/bvn/VaYqZ8s8A8uHGSF164rwXJXg
 YZ+RnFCVSfODBWUtbBuoSSzcdgqklDcrfvkhCuNeaDbni/3mP2P6UM/04Hk2av5nvNvP1Tj
 qOiEYf7Wkqoe5zxhEVIYQ==
UI-OutboundReport: notjunk:1;M01:P0:iigvjxWIxdU=;DZOdf9+xFSevBffMnzwXGxtDT89
 /xYWx7kbuyZ3O7Hd/x1b6/hv3cPKRtLszfVysVHauZs0A4YPj1Xh9SzSkZRtXEBJSzU08vgMK
 PCE/7+FlHbi4/v3MTQnWjzCy8Phoe2TAu72KbnI8aHZvoRV7hiB0D2Tw/JtzJ93/FwamTAOQK
 HlbYiZcGDxb+Zj7XcHFCtkj8i1ty6oP3hyxKygnoX7bxFof/Gc/Ey9MiVajFr44g6EcreqJNp
 oyNyafpaYeVBqP1rbTn7pCH/nLexUgvE8qRZerjSTQfpDEAeGQkNKTM1yb/4ZBio642sPWCBd
 rbZDB3E6Nwy9D5K41qcQvza2P8fNErV2SFOelo70SnRsqVYZD5mTCUpQNmE+fkNPKuiVBVYzB
 hUyFS1Th89TgOCbiJDbPq/Oh2Y+vmmWeEtay6P88XpNQX9jyFqoB4Ac5S0RKSpKSI/2FfQLVT
 D3/1YP9bLHvj9xxsRoluhWDTbc7KfppIDid+v9H+kZ5IaEMEQ45cPzokuV3/0jDM34/286gLZ
 9jUrarVhd3BO0ZJmBlrCAEvQh+rNw91IB6EEnVAphTteffsI6UZF8omrMcXK7PlOkksuqZO62
 uR5C+pi3x8T9ImGcm9G3Dcdi9NGq9/56Z+Sb5NaztO2deHY/t/uAXTH+avsL2B5luz93IPHQe
 Gme+919gD5owDqo6GbU9T9Jxalat8Agat4yTb03bvw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 30/01/2023 à 18:28, ~vlaomao a écrit :
> From: VlaoMao <vlaomao@gmail.com>
> 
> Changing the address with a subsequent reboot makes this address permanent until the vm is turned off

Missing Signed-off-by.

See https://www.qemu.org/docs/master/devel/submitting-a-patch.html

> ---
>   hw/net/vmxnet3.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 04159c822..695ca2f92 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
>       s->drv_shmem = 0;
>       s->tx_sop = true;
>       s->skip_current_tx_pkt = false;
> +
> +    vmxnet3_reset_mac(s);
>   }
>   
>   static void vmxnet3_update_rx_mode(VMXNET3State *s)


