Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE641C7E2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:08:50 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbCT-0000ZN-4R
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVb9a-0005Tk-No; Wed, 29 Sep 2021 11:05:50 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVb9X-0000n0-SF; Wed, 29 Sep 2021 11:05:50 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mdvyo-1n479g0aSk-00b6NH; Wed, 29 Sep 2021 17:05:38 +0200
Subject: Re: [PATCH] hw/remote/proxy: Categorize Wireless devices as 'Network'
 ones
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926201926.1690896-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <19cf1682-3436-11b4-ac8d-67841eaef663@vivier.eu>
Date: Wed, 29 Sep 2021 17:05:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210926201926.1690896-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uc+9F4abeVo+HQDxFyUCc3AQX5Cc08hbB4Km5uCegXfOADwBsQp
 zjjQp/zwcQkmsDUGc0iPE3OH/rn6SqY2G8dZQr3WjyENuqz7ngjHkWwZUxg/4m2XA1Ok+Ba
 a71+UdVuhMsHSX0xQWIU6XwMcabsf42mf0l/2pru3wzQ3Pv58mk6mDSA1jbeKuApwuPruBp
 wwLUPBPn2wVDjbTbu5FOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DT+caPNwDZ8=:4hW1lezI1UhixOIkgPuLgO
 6LhiNCBM9mnDsvtP1P44LYv1t8vcXOH6UFRJ0l2Nd+K7AZxPzm3u0A2mpZfl8D0qupHe7LLa9
 jlCZu2PauB+hC5JJt1Bdyi7Y9evNUD8NBz/Bmccb+MLMaaOmNhOkPfRbsbPQfbu24UWv4WWHp
 Pg5HFuQkdX+GhiU7AIEhSBK5at4w81kh3p0bVspp9Bu13348nkEdXFIogp2UGiu3mS+AsDLO3
 Aat9R20JQTbESdMvhpnbFtveKfSx0OVpFx901rTwFGmNmlA3gF2c1DozjfdSon/EjIk3qo94+
 4SpJoPb0HebwdCoNvfiQDPg5kmQLNShxe22UzoGqU1DsivkNTTpeti8pNpw2O5RO6v4qjqTYY
 YDIwWuEhXlX3UsCC7CBq+//dgDPbVMlXBL/lWfysoTjNnXFEb5AHrApZcFaa+L+qTF1uqfq3Q
 3KTPD2WT/+XTLy2kuK+QyiaEOh1WR5JxbZweuCp+TcHjr1RT+M9wXu5emGGVZMorXVr/oGjKb
 +KwPyn8KJY7khtNQp0pCRn2sQt/jO0PA6b30Kf/ZSK1+vAysGkhM6NCq4bpRMUgl1A0mkwE+6
 ipCvg3ReuTAuKaGwOaJa04YVB219iUFr7xRYsJeVz4CgwKM0p9EJbxW3fPTS8Sb+iO3PWaQnz
 4WCe2RoUlqRbGfsio5ySzGrw3lpYskhkmqVIrXR8U0PTu2B4kaGJfasHMqZUdCf94SNYW6t40
 qyp3ees6Htn9f/vaogWHucjN6IGt7Zii8MUc5A==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/09/2021 à 22:19, Philippe Mathieu-Daudé a écrit :
> QEMU doesn't distinct network devices per link layer (Ethernet,
> Wi-Fi, CAN, ...). Categorize PCI Wireless cards as Network
> devices.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/remote/proxy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 499f540c947..bad164299dd 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -324,6 +324,7 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
>          set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>          break;
>      case PCI_BASE_CLASS_NETWORK:
> +    case PCI_BASE_CLASS_WIRELESS:
>          set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
>          break;
>      case PCI_BASE_CLASS_INPUT:
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

