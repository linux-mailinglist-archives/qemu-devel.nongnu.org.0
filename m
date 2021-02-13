Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B281931AE7B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:15:34 +0100 (CET)
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB48T-00035j-Ny
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB47A-0002KF-Fc; Sat, 13 Feb 2021 18:14:12 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:54085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB478-0001Ty-6N; Sat, 13 Feb 2021 18:14:12 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7gfa-1ly6Jw3x4c-014ivG; Sun, 14 Feb 2021 00:13:51 +0100
Subject: Re: [PATCH] hw/scsi/megasas: Remove pointless parenthesis
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201011195001.3219730-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ba6f06a4-d90e-176e-60b7-351be1619595@vivier.eu>
Date: Sun, 14 Feb 2021 00:13:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201011195001.3219730-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+NAQGJZwACJhrYogA4XTEnqqLc4FAMdwJHmCLIKI3VyU8vkx0C0
 bWmLbdha+fZlqAJi24wUtifvkGhtFMzLCxpw6ygHchOBgvZyOQO2RLgNzjrP6ge+kl4fULi
 kzmypTKhtEpj8xB5L1994zW7a0+H/Yt9HvG+JiJT/sVT2Wsz71G2SOSMSHIzHY9Gokmz++x
 1vhae/Oq9HWgYLzfwEU6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MibstNTrv5o=:GUEz1FzX4KX4dXw+YpmOR1
 UPA8bdsdpX4oN2kEUuY34j1eQwpTLyIfQxXm9F5ZlpbNzK2t/g5CnHdC9w5+WgLXV8uBkyBu1
 1zsLuXOJ+3WV9N6gA1A111N/25hOlKxoTLYuVho3niOZ8LE2tJEemgcvYha9zbgVvnYZzILkd
 7A75142JVHci8zkjtCM3J0vMdCcUwUVEayqN7Jzjxv2/gMmCe4OEgimt28RbiGqOnpcVV3lZO
 mloXwaBNOTPLaVlbdj2lzCMjpBN8dg4kjkEHTOeKnKcoQWi21EdTh7GomqIt1sWC/om0p1kzV
 n+B5NV1e4cAUi8LIQby3aqhVr39Lno/PXOCAxjOrza0DDAQ+FUdFa1sp75nXR4cvKPYHPtry6
 3EpHDl4aAbyKjNoxXsW5eKg17lUvrYeoveaczc6lAqTlDnu0zBFgZ3mOyEHg7/2YIr8PhjXHB
 76SSP5Kj9g==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/10/2020 à 21:50, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/megasas.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index e24c12d7eed..d57402c9b09 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -2384,8 +2384,8 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
>      if (!s->sas_addr) {
>          s->sas_addr = ((NAA_LOCALLY_ASSIGNED_ID << 24) |
>                         IEEE_COMPANY_LOCALLY_ASSIGNED) << 36;
> -        s->sas_addr |= (pci_dev_bus_num(dev) << 16);
> -        s->sas_addr |= (PCI_SLOT(dev->devfn) << 8);
> +        s->sas_addr |= pci_dev_bus_num(dev) << 16;
> +        s->sas_addr |= PCI_SLOT(dev->devfn) << 8;
>          s->sas_addr |= PCI_FUNC(dev->devfn);
>      }
>      if (!s->hba_serial) {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


