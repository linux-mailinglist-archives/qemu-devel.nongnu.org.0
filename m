Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EF31AE63
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 23:57:39 +0100 (CET)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB3r8-0001fZ-J2
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 17:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3q0-0001Av-S3; Sat, 13 Feb 2021 17:56:28 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3pz-0008Jt-5J; Sat, 13 Feb 2021 17:56:28 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MRk8w-1lIAbA1cvC-00TDJ1; Sat, 13 Feb 2021 23:56:02 +0100
Subject: Re: [PATCH] hw/scsi/megasas: Remove pointless parenthesis
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201011195001.3219730-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c45beb4a-6100-4f56-66f6-f18c5060c6f6@vivier.eu>
Date: Sat, 13 Feb 2021 23:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201011195001.3219730-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8/QchC/Z/pV37sWgXi/WBc0gZ08x/8IPZ+anGfc9ccosCiIKN2T
 YYGptvTs8dl+wATFyI0x2oln1aqIeRyoL1UEPKjNBKBKGH2g8/ISTC4E3Mz3H16zYyWW9rx
 7NFx6QCiKxldbEM1s1IAuY8I8M1NuiK+62TnzcT7da38BzCSa61FFA1GR4cYG7t8/XcZQf4
 n1P85DMWFMgxgjZ/WuGLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p69VkhBGtz8=:DQrlVO3tWUvd6rb0bqybFl
 dTsJwYgeP0mNXg11EAzClLoTOdLEArt2M0TTUwvwrO7yX6LddESyT3ktgm4xNg/Wk7MIxey/2
 k1aaBytVN1nQxz/msItaLP5AgS0fru+kbyDiz17cq5OEJuDVR3tZ11yCfCBD2LDYS5rHePVLa
 7IHlcTBjQCc6ogJRfv8P80PhNbViBXkx2i/i8N/4VLxvTgf/DoSQlU10D5QJkOzq5WMeTAjEV
 zpDxk/ZbH+esdhMNDbwannKXXULzqgApz33wC6HQ69fe6EoZyLyo8Xhx8a4W1GhWsUan4epdL
 GALjK2xDK4pP3/keMA3Mxp9bCKP4suGRt7I894Jpr+XMa2F2QJHxyJ2KxWav0Bt3PW4xM7aAL
 FaeyuLr70fw1pfvWJkLhJ0LlI7Q9uh67595614wgmlJpCj0ZR1hqk07rykqRRtCabhzOl7G6T
 y32kSlIu+A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

