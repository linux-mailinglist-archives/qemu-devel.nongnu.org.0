Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF35329119
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:22:49 +0100 (CET)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGp44-00038T-AA
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGp2u-0002hH-2E
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:21:36 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGp2o-0006Zh-Qn
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:21:35 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQuwR-1lT8y60VFv-00O22C; Mon, 01 Mar 2021 21:21:21 +0100
Subject: Re: [PATCH v2 04/42] esp: add vmstate_esp version to embedded ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9c5fe97c-d5f5-59b3-f37b-f95362559038@vivier.eu>
Date: Mon, 1 Mar 2021 21:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A0fskHHfKgeFvJQT60FgVs1rnujDhtingkUvY3ZX6OdYKMkO4Zb
 DSHoXpaVLe8LOsTf946f9BPy/6nHspojA73NIB6Lp47XXOynkFt4VMK9tS/L8opi99z0CG4
 HtCkb8QePMdWp1kk4wmJbZ+2OmECcg3heBHa/ZFiVjxuNgriXkCUkbJLDaK03kEZ53j7jnf
 EvhAS/sPoFTxoFP7bsENA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ui+7VkDa688=:YIgbrezoZOV10MMdJiUQ1Q
 W+EPfPfIAjxCjb+8Y30WaX84zc6SBqybpUIlbxMweD0anvGrq/o6z7QmrVWgBlWHmRgKH8ECR
 MWwMD2dVzCzXrhCxkX9uYbbcTvt2Jqx2pZqFwYGY6a4PiYFbywg3Gw3Q3qtQa1T5zXK2M12qH
 zXfTfzqeu6acJRJNORZnYT1933fZZtGyzFVxAsFfKgjspEmBnmGe9hRQnt8i+wCao/dpqcQD1
 NCwCYe3PPCMXGVZE4HbpxTU5GhzJkgI2fa+28y0fSmMiJHBbGq+m2Yv9QU9jIAIi/kv/OMYJE
 exfFWQQ8v/7tFt2DjEdVq8F4HNksKzGCfGXxsWn+hf1zbmk5S01qMYO4xNaqsVH8f7WE5fA3/
 xkZbJGDd04n59amFLx+k1VnY1Vx/LuiIqWuIaB4fwh46Jjubw+stDs2GQLQGmXzTfl1EHvpd2
 Ozx+hqxSww==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> The QOM object representing ESPState is currently embedded within both the
> SYSBUS_ESP and PCI_ESP devices with migration state handled by embedding
> vmstate_esp within each device using VMSTATE_STRUCT.
> 
> Since the vmstate_esp fields are embedded directly within the migration
> stream, the incoming vmstate_esp version_id is lost. The only version information
> available is that from vmstate_sysbus_esp_scsi and vmstate_esp_pci_scsi, but
> those versions represent their respective devices and not that of the underlying
> ESPState.
> 
> Resolve this by adding a new version-dependent field in vmstate_sysbus_esp_scsi
> and vmstate_esp_pci_scsi which stores the vmstate_esp version_id field within
> ESPState to be used to allow migration from older QEMU versions.
> 
> Finally bump the vmstate_esp version to 5 to cover the upcoming ESPState changes
> within this patch series.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp-pci.c     |  3 ++-
>  hw/scsi/esp.c         | 23 +++++++++++++++++++++--
>  include/hw/scsi/esp.h |  2 ++
>  3 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index ccf73bb901..8a82404853 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -330,11 +330,12 @@ static void esp_pci_hard_reset(DeviceState *dev)
>  
>  static const VMStateDescription vmstate_esp_pci_scsi = {
>      .name = "pciespscsi",
> -    .version_id = 1,
> +    .version_id = 2,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(parent_obj, PCIESPState),
>          VMSTATE_BUFFER_UNSAFE(dma_regs, PCIESPState, 0, 8 * sizeof(uint32_t)),
> +        VMSTATE_UINT8_V(esp.mig_version_id, PCIESPState, 2),
>          VMSTATE_STRUCT(esp, PCIESPState, 0, vmstate_esp, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 1635f86622..9427c55d1d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -796,10 +796,28 @@ static const VMStateDescription vmstate_esp_pdma = {
>      }
>  };
>  
> +static int esp_pre_save(void *opaque)
> +{
> +    ESPState *s = ESP(opaque);
> +
> +    s->mig_version_id = vmstate_esp.version_id;
> +    return 0;
> +}
> +
> +static int esp_post_load(void *opaque, int version_id)
> +{
> +    ESPState *s = ESP(opaque);
> +
> +    s->mig_version_id = vmstate_esp.version_id;
> +    return 0;
> +}
> +
>  const VMStateDescription vmstate_esp = {
>      .name = "esp",
> -    .version_id = 4,
> +    .version_id = 5,
>      .minimum_version_id = 3,
> +    .pre_save = esp_pre_save,
> +    .post_load = esp_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_BUFFER(rregs, ESPState),
>          VMSTATE_BUFFER(wregs, ESPState),
> @@ -996,9 +1014,10 @@ static void sysbus_esp_init(Object *obj)
>  
>  static const VMStateDescription vmstate_sysbus_esp_scsi = {
>      .name = "sysbusespscsi",
> -    .version_id = 1,
> +    .version_id = 2,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_V(esp.mig_version_id, SysBusESPState, 2),
>          VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 11c799d91e..7d92471c5b 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -68,6 +68,8 @@ struct ESPState {
>      uint32_t pdma_start;
>      uint32_t pdma_cur;
>      void (*pdma_cb)(ESPState *s);
> +
> +    uint8_t mig_version_id;
>  };
>  
>  #define TYPE_SYSBUS_ESP "sysbus-esp"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

