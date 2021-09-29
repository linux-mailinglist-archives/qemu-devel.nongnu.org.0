Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB641BE73
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 06:44:06 +0200 (CEST)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVRRs-0004Bb-Cp
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 00:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mVRM6-0003BE-VV; Wed, 29 Sep 2021 00:38:06 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mVRM3-0003jc-3d; Wed, 29 Sep 2021 00:38:06 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 58DBB580D8E;
 Wed, 29 Sep 2021 00:37:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 Sep 2021 00:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=7R3wAYcgB14F2kFwyulUbo7so3L
 VElM/4ks002ccbaY=; b=RlvdD81VOBonqAe7arbrVQddyxJqYgxPerZRH1zR2C6
 EFQxETOy+cJxp9vNxhx8FNmujviBvg94s+uwtsFyrpsrU3qCPsNLn1/zRF8otaqt
 wL/RRqoisZtkJQbZr6PXWaM0oBCuyvl3VfwKZeIXDqvzxhchachSd3wxDtYu0DES
 zxerz7zCr5MmdX24sJhLT6D6CrQ5MPEZHVoPmSZrEkvvCL0WhEW6vw26HdNZM1m+
 nyWxaMCH4a2vOQ4kIC8OGCYvxECA4L2UeP6H7Hqe/dg6J6DhBAMqyhqYlNo2EEPm
 YRWd+Xawh3vXHFLIkBBgHk+E2zeT8DKO9EX6UF3467A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7R3wAY
 cgB14F2kFwyulUbo7so3LVElM/4ks002ccbaY=; b=bZfKN820zhP1SwUT+ez9mD
 yosctcFYXZ0llhLAjmz5ZC5sWt5H+FAFXwVKiSTW9f5cfRX8yudvGzgNScCxgjWG
 VQduZ3iWCMuNhQaKIih8BansosSdKbVgKsRgfGMsfJsDZnJWzfhsUpVtDBXuJc1T
 Lr6BthoU0OLuORQ0OGu0IAyKUFrxgjPABlxGEQDfkfIcNSalW8pgGA4efZ/jgd5H
 I8kkG3q0ViR4W8kpuoGjW0n/Npko+KWwb+wWlh/8oS2pX847YXAvubVKHc7KWxrn
 VizrixB6hpbOtCa5//x0lC80sIe6jkoTkoFcLEYEVVRyh6zoPBpGOkiL/ZNGR/kg
 ==
X-ME-Sender: <xms:pu1TYZEINGTCIRLoBuxMrt0_FDD58fydiyu5VSH6HXVtrCczJaycxQ>
 <xme:pu1TYeUHfFUqbb2DhTYsu_xTavN-gGq-_w7LsyELa0eeH_QDRMf4G0ddVo2DuPNLS
 k9JGs2QPiVYIUwhc8c>
X-ME-Received: <xmr:pu1TYbJyY6nLvvJQuJfu6RCA3Z8hsZB3RWBhqNAiVwFZo-oVAJiESIZLhqa_KNJjZsju2-mapv_kRInm7UXK_kOlFOcAKsJKaljiKCH0DUT6efP7OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekuddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedtteeikeejffevgfejkeeuheejtdelhffffedugfeivdefleekteeigfdujeeh
 teenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhht
 rdgukh
X-ME-Proxy: <xmx:pu1TYfEtX9WxGw2hyq3jlMSNs_Zae0dmOWZ0JHKRG9FaKBFr08Y5Rg>
 <xmx:pu1TYfXZPPEpOIr0nKdgAAqEZpWVRr6lpWqWDZEtpaADqzG9lerjmA>
 <xmx:pu1TYaOHfUfPsn2ZcrXyc1dnhbANm8PsmkvX0H3UZE_xIXJPdcCnvw>
 <xmx:p-1TYYVMEGKkTQSxnm79QfnKKRkg0_MrHkFjF31-f7DRSNVAS-xxCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 00:37:56 -0400 (EDT)
Date: Wed, 29 Sep 2021 06:37:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [RFC PATCH: v3 1/2] add mi device in qemu
Message-ID: <YVPtogzu2OSh/1yK@apples.localdomain>
References: <CGME20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6@epcas5p1.samsung.com>
 <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ICBTQ9swzn8nbp+7"
Content-Disposition: inline
In-Reply-To: <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, arun.kka@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 d.palani@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 u.kishore@samsung.com, stefanha@redhat.com, kbusch@kernel.org,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ICBTQ9swzn8nbp+7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  3 12:54, Padmakar Kalghatgi wrote:
> From: padmakar <p.kalghatgi@samsung.com>
>=20
> This patch contains the implementation of certain commands=20
> of nvme-mi specification.The MI commands are useful to
> manage/configure/monitor the device.Eventhough the MI commands
> can be sent via the inband NVMe-MI send/recieve commands, the idea=20
> here is to emulate the sideband interface for MI.
>=20
> The changes here includes the interface for i2c/smbus=20
> for nvme-mi protocol. We have used i2c address of 0x15
> using which the guest VM can send and recieve the nvme-mi
> commands. Since the nvme-mi device uses the I2C_SLAVE as
> parent, we have used the send and recieve callbacks by
> which the nvme-mi device will get the required notification.
> With the callback approach, we have eliminated the use of=20
> threads.=20
>=20
> One needs to specify the following command in the launch to
> specify the nvme-mi device, link to nvme and assign the i2c address.
> <-device nvme-mi,nvme=3Dnvme0,address=3D0x15>
>=20
> This module makes use of the NvmeCtrl structure of the nvme module,
> to fetch relevant information of the nvme device which are used in
> some of the mi commands. Eventhough certain commands might require
> modification to the nvme module, currently we have currently refrained
> from making changes to the nvme module.
>=20
> cmd-name                              cmd-type
> *************************************************
> read nvme-mi ds                        nvme-mi
> configuration set                      nvme-mi
> configuration get                      nvme-mi
> vpd read                               nvme-mi
> vpd write                              nvme-mi
> controller Health Staus Poll           nvme-mi
> nvme subsystem health status poll      nvme-mi
> identify                               nvme-admin
> get log page                           nvme-admin
> get features                           nvme-admin
>=20
> Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> Reviewed-by: Klaus Birkelund Jensen <k.jensen@samsung.com>
> Reviewed-by: Jaegyu Choi <jg123.choi@samsung.com>
>=20
> v3
> -- rebased on master
>=20
> ---
>  hw/nvme/meson.build |   2 +-
>  hw/nvme/nvme-mi.c   | 650 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/nvme/nvme-mi.h   | 297 ++++++++++++++++++++++++
>  3 files changed, 948 insertions(+), 1 deletion(-)
>  create mode 100644 hw/nvme/nvme-mi.c
>  create mode 100644 hw/nvme/nvme-mi.h
>=20

Some general comments.

* Please be consistent about MI vs Mi in naming. I have no preference,
  but NvmeMi is probably most aligned with existing style.

* hw/nvme generally does not mix declarations and code. Please move
  variables declarations to the top of their scope. And please get rid
  of the hungarian notation ({b,l,u,...}VarName naming) ;)

* I'd like that the header was cleaned up to not include stuff that
  isn't used.

* I understand that you'd like to not impact the hw/nvme/ctrl.c device
  too much, but the Identify, Get Log Page and Get Feature "passthru"
  commands could really benefit from using the same code as in
  hw/nvme/ctrl.c - this requires a bit of refactoring such that the
  data can be returned explicitly instead of being directly DMA'ed to
  the host.

* This is not compliant with the MCTP I2C/SMBus binding spec. The spec
  states that all transactions are based on the SMBus Block Write bus
  protocol. This means that responses require that the device (which is
  defined as an I2C slave must itself master the bus and do a Block
  Write to the message originator (the address of which is contained in
  the fourth byte of the packet).

> diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
> index 3cf4004..8dac50e 100644
> --- a/hw/nvme/meson.build
> +++ b/hw/nvme/meson.build
> @@ -1 +1 @@
> -softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c'=
, 'ns.c', 'subsys.c'))
> +softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c'=
, 'ns.c', 'subsys.c', 'nvme-mi.c'))
> diff --git a/hw/nvme/nvme-mi.c b/hw/nvme/nvme-mi.c
> new file mode 100644
> index 0000000..a90ce90
> --- /dev/null
> +++ b/hw/nvme/nvme-mi.c
> @@ -0,0 +1,650 @@
> +/*
> + * QEMU NVMe-MI Controller
> + *
> + * Copyright (c) 2021, Samsung Electronics co Ltd.
> + *
> + * Written by Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> + *            Arun Kumar Agasar <arun.kka@samsung.com>
> + *            Saurav Kumar <saurav.29@partner.samsung.com>
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + */
> +
> +/**
> + * Reference Specs: http://www.nvmexpress.org,
> + *
> + *
> + * Usage
> + * -----
> + * The nvme-mi device has to be used along with nvme device only
> + *
> + * Add options:
> + *    -device  nvme-mi,nvme=3D<nvme id>,address=3D0x15",

Considering that NVMe-MI can run with various MCTP bindings, I think
this particular instance of it should be called 'nvme-mi-i2c'.
Supporting VDM on a PCIe binding is probably not really a goal at all,
but it's better to be explicit about this I think.

> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +#include "hw/block/block.h"
> +#include "hw/pci/msix.h"
> +#include "nvme.h"
> +#include "nvme-mi.h"
> +#include "qemu/crc32c.h"
> +
> +#define NVME_TEMPERATURE 0x143
> +#define NVME_TEMPERATURE_WARNING 0x157
> +#define NVME_TEMPERATURE_CRITICAL 0x175
> +

These are from hw/nvme/ctrl.c - they should be moved to hw/nvme/nvme.h
and shared (separate patch please)

> +static void nvme_mi_send_resp(NvmeMiCtrl *ctrl_mi, uint8_t *resp, uint32=
_t size)
> +{
> +    uint32_t crc_value =3D crc32c(0xFFFFFFFF, resp, size);
> +    size +=3D 4;

Prefer that a sizeof(<some header struct>) instead of the magic number.

> +    uint32_t offset =3D 0;
> +    uint32_t ofst =3D 0;
> +    uint32_t som =3D 1;
> +    uint32_t eom =3D 0;
> +    uint32_t pktseq =3D 0;
> +    uint32_t mtus =3D ctrl_mi->mctp_unit_size;
> +    while (size > 0) {
> +        uint32_t sizesent =3D size > mtus ? mtus : size;

size_t and maybe just a MIN().

> +        size -=3D sizesent;
> +        eom =3D size > 0 ? 0 : 1;
> +        g_autofree uint8_t *buf =3D (uint8_t *)g_malloc0(sizesent + 8);
> +        buf[2] =3D sizesent + 5;
> +        buf[7] =3D (som << 7) | (eom << 6) | (pktseq << 5);
> +        som =3D 0;
> +        memcpy(buf + 8, resp + offset, sizesent);
> +        offset +=3D sizesent;
> +        if (size <=3D 0) {
> +            memcpy(buf + 8 + offset , &crc_value, sizeof(crc_value));
> +        }
> +        memcpy(ctrl_mi->misendrecv.sendrecvbuf + ofst, buf, sizesent + 8=
);
> +        ofst +=3D sizesent + 8;
> +    }
> +}

I think you are missing the PEC byte here.

My back-of-the-envelope calculation tells me that the 5000 byte
sendrecvbuf *should* be big enough to handle any message with MTUS of
64. But it is still arbitrary I think. See below on the i2c_recv where I
suggest that you assemble the packets on the fly instead of staging all
of them in the sendrecvbuf.

> +
> +static void nvme_mi_resp_hdr_init(NvmeMIResponse *resp, bool bAdminComma=
nd)

Hungarian Notation is definitely not a part of the QEMU Style Guide :p

> +static void nvme_mi_read_nvme_mi_ds(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *=
req)
> +{
> +    ReadNvmeMiDs ds;
> +    ds.cntrlid =3D req->dword0 & 0xFFFF;
> +    ds.portlid =3D (req->dword0 & 0xFF0000) >> 16;
> +    ds.dtyp =3D (req->dword0 & ~0xFF) >> 24;
> +    int dtyp =3D ds.dtyp;
> +    switch (dtyp) {
> +    case NVM_SUBSYSTEM_INFORMATION:
> +        nvme_mi_nvm_subsys_ds(ctrl_mi, req);
> +        break;
> +    case OPT_SUPP_CMD_LIST:
> +        nvme_mi_opt_supp_cmd_list(ctrl_mi, req);
> +        break;
> +    }

The Port Information is pretty important, isnt it? That's what should be us=
ed
to negotiate the transmission unit size.

> +static void nvme_mi_admin_command(NvmeMiCtrl *ctrl_mi, void* req_arg)
> +{
> +    uint8_t *msg  =3D ((uint8_t *)req_arg);
> +    NvmeMiMessageHeader msghdr;
> +    memcpy(&msghdr, msg, sizeof(NvmeMiMessageHeader));
> +    if (msghdr.nmimt =3D=3D 1) {
> +        NvmeMIRequest *req =3D (NvmeMIRequest *) (msg);
> +        switch (req->opc) {
> +        case READ_NVME_MI_DS:
> +            nvme_mi_read_nvme_mi_ds(ctrl_mi, req);
> +            break;
> +        case CHSP:
> +            nvme_mi_controller_health_ds(ctrl_mi, req);
> +            break;
> +        case NVM_SHSP:
> +            nvme_mi_nvm_subsys_health_status_poll(ctrl_mi, req);
> +            break;
> +        case CONFIGURATION_SET:
> +            nvme_mi_configuration_set(ctrl_mi, req);
> +            break;
> +        case CONFIGURATION_GET:
> +            nvme_mi_configuration_get(ctrl_mi, req);
> +            break;
> +        case VPD_READ:
> +            nvme_mi_vpd_read(ctrl_mi, req);
> +            break;
> +        case VPD_WRITE:
> +            nvme_mi_vpd_write(ctrl_mi, req, msg);
> +            break;
> +        default:
> +        {
> +            NvmeMIResponse resp;
> +            nvme_mi_resp_hdr_init(&resp, false);
> +            resp.status =3D INVALID_COMMAND_OPCODE;
> +            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
> +            break;
> +        }
> +        }
> +    } else {
> +        NvmeAdminMIRequest *req =3D (NvmeAdminMIRequest *) (msg);
> +        switch  (req->opc) {
> +        case NVME_ADM_MI_CMD_IDENTIFY:
> +            nvme_mi_admin_identify(ctrl_mi, req);
> +            break;
> +        case NVME_ADM_MI_CMD_GET_LOG_PAGE:
> +            nvme_mi_admin_get_log_page(ctrl_mi, req);
> +            break;
> +        case NVME_ADM_MI_CMD_GET_FEATURES:
> +            nvme_mi_admin_get_features(ctrl_mi, req);
> +            break;

It would make sense that the nvme device functions were refactored so
they are reused here.

> +        default:
> +        {
> +            NvmeMIResponse resp;
> +            nvme_mi_resp_hdr_init(&resp, true);
> +            resp.status =3D INVALID_COMMAND_OPCODE;
> +            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
> +            break;
> +        }
> +        }
> +    }
> +
> +    return;
> +}
> +
> +static uint8_t nvme_mi_i2c_recv(I2CSlave *s)
> +{
> +    NvmeMiCtrl *mictrl =3D (NvmeMiCtrl *)s;
> +    NvmeMiSendRecvStruct *misendrecv =3D &mictrl->misendrecv;
> +    if (misendrecv->bsyncflag =3D=3D true) {
> +        return -1;
> +    }
> +    return misendrecv->sendrecvbuf[misendrecv->sendlen++];
> +}

As I mention at the beginning, this is not how responses are "sent".
Responses (which is another MCTP transaction) must be done by the device
mastering the I2C bus and doing a "master write" to the message
originator.

> +
> +static int nvme_mi_i2c_send(I2CSlave *s, uint8_t data)
> +{
> +    NvmeMiCtrl *mictrl =3D (NvmeMiCtrl *)s;
> +    NvmeMiSendRecvStruct *misendrecv =3D &mictrl->misendrecv;
> +
> +    misendrecv->bsyncflag =3D true;
> +    misendrecv->sendlen =3D 0;
> +    switch (misendrecv->len) {
> +    case 1:

Initially I thought that this should have been 2, but the address byte
is not part of the data that the device receives.

> +        misendrecv->total_len =3D data;
> +        break;
> +    case 6:
> +        misendrecv->eom =3D (data & 0x40) >> 6;

I think (data >> 6) & 0x1 is slightly more clear.

> +        break;
> +    }
> +    misendrecv->sendrecvbuf[++misendrecv->len] =3D data;
> +    if (misendrecv->len =3D=3D misendrecv->total_len + 3) {
> +        misendrecv->cmdbuffer =3D (uint8_t *)g_realloc(misendrecv->cmdbu=
ffer,
> +                                                     misendrecv->len - 5=
);

You need to track the current length of the entire message (not just the
packets), otherwise, in this case you just realloc to the size of the curre=
nt
packet.

> +        memcpy(misendrecv->cmdbuffer + misendrecv->offset,
> +               misendrecv->sendrecvbuf + 8, misendrecv->len - 5);
> +
> +        misendrecv->offset =3D misendrecv->len - 5;

Think the offset must be +=3D'ed here.

> +        misendrecv->total_len =3D 0;
> +        misendrecv->len =3D 0;
> +
> +        if (misendrecv->eom =3D=3D 1) {
> +            nvme_mi_admin_command(mictrl, misendrecv->cmdbuffer);
> +            misendrecv->offset =3D 0;
> +            misendrecv->bsyncflag =3D false;
> +        }
> +    }
> +    return 0;
> +}

This is a little complicated to read. It could probably benefit from
being "state-machined" up a bit and instead of reading everything into a
buffer and copying out at packet boundaries, just append the actual
payloads. Maybe something along these lines (totally
untested/uncompiled, but you get the idea):

    struct state {
      uint8_t buf[4224];
      int pos, pktpos, mode;
    };

    static int i2c_send(I2CSlave *s, uint8_t data)
    {
      state->pktpos++;

      switch (state->mode) {
      case READ_MCTP_HEADER:
        if (state->pktpos =3D=3D 2) {
          state->pktlen =3D data;
          return;
        } else if (state->pktpos =3D=3D 7) {
          state->eom =3D (data >> 6) & 0x1;
          state->mode =3D READ_PACKET;
          return;
        }

        /* ignore data */
        return;

      case READ_PACKET:
        state->buf[state->pos++] =3D data;
        if (state->pktpos =3D=3D state->pktlen + 3) {
          state->mode =3D READ_PEC;
        }

      case READ_PEC:
        /* ignore */

        /* we are done with this packet, so reset state and expect the next=
 one */
        state->mode =3D READ_MCTP_HEADER;
        state->pktpos =3D 0;

        if (state->eom) {
          /* we have a full message */
          process(state->buf);

          /* reset state */
          state->pos =3D 0;
        }

        return;
      }
    }

I'm not sure if there is any benefit to implementing the i2c event callback.
Maybe.

> +
> +static void nvme_mi_realize(DeviceState *dev, Error **errp)
> +{
> +    NvmeMiCtrl *s =3D (NvmeMiCtrl *)(dev);
> +
> +    s->smbus_freq =3D 100;
> +    s->mctp_unit_size =3D 64;
> +}
> +static Property nvme_mi_props[] =3D {
> +     DEFINE_PROP_LINK("nvme", NvmeMiCtrl, n, TYPE_NVME,
> +                     NvmeCtrl *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void nvme_mi_class_init(ObjectClass *oc, void *data)
> +{
> +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(oc);
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D nvme_mi_realize;
> +    k->recv =3D nvme_mi_i2c_recv;
> +    k->send =3D nvme_mi_i2c_send;
> +
> +    device_class_set_props(dc, nvme_mi_props);
> +}
> +
> +static const TypeInfo nvme_mi =3D {
> +    .name =3D TYPE_NVME_MI,
> +    .parent =3D TYPE_I2C_SLAVE,
> +    .instance_size =3D sizeof(NvmeMiCtrl),
> +    .class_init =3D nvme_mi_class_init,
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&nvme_mi);
> +}
> +
> +type_init(register_types);
> diff --git a/hw/nvme/nvme-mi.h b/hw/nvme/nvme-mi.h
> new file mode 100644
> index 0000000..92a20e6
> --- /dev/null
> +++ b/hw/nvme/nvme-mi.h
> @@ -0,0 +1,297 @@
> +/*
> + * QEMU NVMe-MI
> + *
> + * Copyright (c) 2021 Samsung Electronics Co., Ltd.
> + *
> + * Authors:
> + *   Padmakar Kalghatgi      <p.kalghatgi@samsung.com>
> + *   Arun Kumar Agasar       <arun.kka@samsung.com>
> + *   Saurav Kumar            <saurav.29@partner.samsung.com>
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + */
> +
> +#ifndef NVME_MI_H
> +#define NVME_MI_H
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include "hw/i2c/i2c.h"
> +
> +#define TYPE_NVME_MI "nvme-mi"
> +
> +#define NVM_SUBSYSTEM_INFORMATION 0
> +#define PORT_INFORMATION 1
> +#define CONTROLLER_LIST 2
> +#define CONTROLLER_INFORMATION 3
> +#define OPT_SUPP_CMD_LIST 4
> +#define MGMT_EPT_BUFF_CMD_SUPP_LIST 5
> +
> +
> +typedef struct NvmeMiSendRecvStruct {
> +   uint32_t sendlen;
> +   uint8_t len;
> +   uint8_t total_len;
> +   uint32_t offset;
> +   uint8_t eom;
> +   bool bsyncflag;
> +   u_char sendrecvbuf[5000];

5000 seems arbitrary - the max MCTP message size is 4224 bytes, no?

How many bytes we need for MCTP and I2C/SMBus overhead depends on MTUS,
so I 5000 enough? Is it excessive?

> +   uint8_t *cmdbuffer;
> +} NvmeMiSendRecvStruct;
> +typedef struct NvmeMiVpdElements {
> +    long common_header;

Use a fixed length type here.

> +} NvmeMiVpdElements;
> +
> +typedef struct NvmeMiCtrl {
> +   I2CSlave parent_obj;
> +   uint32_t mctp_unit_size;
> +   uint32_t smbus_freq;
> +   NvmeMiVpdElements vpd_data;
> +   NvmeMiSendRecvStruct  misendrecv;
> +   NvmeCtrl *n;
> +} NvmeMiCtrl;
> +
> +enum NvmeMiMngmtInterfaceCmdSetsOpcodes {
> +   READ_NVME_MI_DS                   =3D 0x00,
> +   NVM_SHSP                          =3D 0x01,
> +   CHSP                              =3D 0x02,
> +   CONFIGURATION_SET                 =3D 0x03,
> +   CONFIGURATION_GET                 =3D 0x04,
> +   VPD_READ                          =3D 0x05,
> +   VPD_WRITE                         =3D 0x06,
> +   MI_RESET                          =3D 0x07,
> +   SES_RECEIVE                       =3D 0x08,
> +   SES_SEND                          =3D 0x09,
> +   MANAGEMENT_ENDPOINT_BUFFER_READ   =3D 0x0A,
> +   MANAGEMENT_ENDPOINT_BUFFER_WRITE  =3D 0x0B,
> +   MI_RESERVED                       =3D 0x0C,
> +   VENDOR_SPECIFIC                   =3D 0xC0
> +};
> +
> +enum NvmeMiControlPrimitiveOpcodes {
> +   PAUSE                             =3D 0x00,
> +   RESUME                            =3D 0x01,
> +   ABORT                             =3D 0x02,
> +   GET_STATE                         =3D 0x03,
> +   REPLAY                            =3D 0x04,
> +   CTRL_PRIMITIVE_RESERVED           =3D 0x05,
> +   CTRL_PRIMITIVE_VENDOR_SPECIFIC    =3D 0xF0
> +};
> +
> +enum NvmeMiAdminCommands {
> +   NVME_ADM_MI_CMD_DELETE_SQ      =3D 0x00,
> +   NVME_ADM_MI_CMD_CREATE_SQ      =3D 0x01,
> +   NVME_ADM_MI_CMD_GET_LOG_PAGE   =3D 0x02,
> +   NVME_ADM_MI_CMD_DELETE_CQ      =3D 0x04,
> +   NVME_ADM_MI_CMD_CREATE_CQ      =3D 0x05,
> +   NVME_ADM_MI_CMD_IDENTIFY       =3D 0x06,
> +   NVME_ADM_MI_CMD_ABORT          =3D 0x08,
> +   NVME_ADM_MI_CMD_SET_FEATURES   =3D 0x09,
> +   NVME_ADM_MI_CMD_GET_FEATURES   =3D 0x0a,
> +   NVME_ADM_MI_CMD_ASYNC_EV_REQ   =3D 0x0c,
> +   NVME_ADM_MI_CMD_NS_MANAGEMENT  =3D 0x0d,
> +   NVME_ADM_MI_CMD_ACTIVATE_FW    =3D 0x10,
> +   NVME_ADM_MI_CMD_DOWNLOAD_FW    =3D 0x11,
> +   NVME_ADM_MI_CMD_DST            =3D 0x14,
> +   NVME_ADM_MI_CMD_NS_ATTACHMENT  =3D 0x15,
> +   NVME_ADM_MI_CMD_KEEP_ALIVE     =3D 0x18,
> +   NVME_ADM_MI_CMD_DIRECTIVE_SEND =3D 0x19,
> +   NVME_ADM_MI_CMD_DIRECTIVE_RECV =3D 0x1A,
> +   NVME_ADM_MI_CMD_VIRTUALIZATION =3D 0x1C,
> +   NVME_ADM_MI_CMD_DB_BUF_CONIF   =3D 0x7C,
> +   NVME_ADM_MI_CMD_FORMAT_NVM     =3D 0x80,
> +   NVME_ADM_MI_CMD_SECURITY_SEND  =3D 0x81,
> +   NVME_ADM_MI_CMD_SECURITY_RECV  =3D 0x82,
> +   NVME_ADM_MI_CMD_SANITIZE       =3D 0x84,
> +   NVME_ADM_MI_CMD_GET_LBA_STATUS =3D 0x86,
> +};

These opcodes are the same as in the Admin Command set, why repeat them
here?

> +
> +enum NvmeMiConfigGetResponseValue {
> +   DEFAULT_MCTP_SIZE   =3D 64,
> +   DEFAULT_SMBUS_FREQ  =3D 1,
> +   SET_SMBUS_FREQ      =3D 129,
> +   SET_7BITS           =3D 255,
> +   SET_4BITS           =3D 15,
> +   SET_16BITS          =3D 65535
> +};
> +
> +enum NvmeMiConfigurationIdentifier {
> +   SMBUS_I2C_FREQ =3D 1,
> +   HEALTH_STATUS_CHG,
> +   MCTP_TRANS_UNIT_SIZE,
> +};
> +
> +enum NvmeMiResponseMessageStatus {
> +   SUCCESS,
> +   MORE_PROCESSING_REQUIRED,
> +   INTERNAL_ERROR,
> +   INVALID_COMMAND_OPCODE,
> +   INVALID_PARAMETER,
> +   INVALID_COMMAND_SIZE,
> +   INVALID_COMMAND_INPUT_DATA_SIZE,
> +   ACCESS_DENIED,
> +   VPD_UPDATES_EXCEEDED =3D 0x20,
> +   PCIe_INACCESSIBLE
> +};
> +
> +typedef struct NvmeMiMctpHeader {
> +   uint32_t byte_count:8;
> +   uint32_t SOM:1;
> +   uint32_t EOM:1;
> +   uint32_t pckt_seq:2;
> +} NvmeMiMctpHeader;

This doesnt look right - looks like its mixing the i2c header and the
mctp header. But I don't think its used anyway.

> +
> +typedef struct NvmeMiMessageHeader {
> +   uint32_t msgtype:7;
> +   uint32_t ic:1;
> +   uint32_t csi:1;
> +   uint32_t reserved:2;
> +   uint32_t nmimt:4;
> +   uint32_t ror:1;
> +   uint32_t reserved1:16;
> +} NvmeMiMessageHeader;
> +
> +typedef struct NvmeMIRequest {
> +   NvmeMiMessageHeader msg_header;
> +   uint32_t               opc:8;
> +   uint32_t               rsvd:24;
> +   uint32_t               dword0;
> +   uint32_t               dword1;
> +   uint8_t                *buf;

That's not right. This is effectively just a 4 or 8 byte wide field. You
might want to use a flexible array member at the end here and have it
include both the request data and the crc.

> +   uint32_t               mic;
> +} NvmeMIRequest;
> +
> +typedef struct NvmeAdminMIRequest {
> +   NvmeMiMessageHeader msg_header;
> +   uint8_t                opc;
> +   uint8_t                cmdflags;
> +   uint16_t               cntlid;
> +   uint32_t               sqentry1;
> +   uint32_t               sqentry2;
> +   uint32_t               sqentry3;
> +   uint32_t               sqentry4;
> +   uint32_t               sqentry5;
> +   uint32_t               dataofst;
> +   uint32_t               datalen;
> +   uint32_t               reserved[2];
> +   uint32_t               sqentry10;
> +   uint32_t               sqentry11;
> +   uint32_t               sqentry12;
> +   uint32_t               sqentry13;
> +   uint32_t               sqentry14;
> +   uint32_t               sqentry15;
> +   uint8_t                *buf;

Same issue as above.

> +   uint32_t               mic;
> +} NvmeAdminMIRequest;
> +
> +typedef struct ReadNvmeMiDs {
> +    uint16_t cntrlid;
> +    uint8_t  portlid;
> +    uint8_t  dtyp;
> +}  ReadNvmeMiDs;
> +
> +typedef struct NvmeMiConfigurationSet {
> +    uint8_t conf_identifier_dword_0;
> +    uint16_t conf_identifier_specific_dword_0;
> +    uint16_t conf_identifier_specific_dword_1;
> +}  MiConfigurationSet;
> +
> +typedef struct NvmeMiNvmSubsysHspds {
> +    uint8_t nss;
> +    uint8_t sw;
> +    uint8_t ctemp;
> +    uint8_t pdlu;
> +    uint16_t ccs;
> +    uint16_t reserved;
> +} NvmeMiNvmSubsysHspds;
> +
> +typedef struct NvmeMiControlPrimitives {
> +    uint32_t nmh;
> +    uint32_t cpo;
> +    uint32_t tag;
> +    uint32_t cpsp;
> +    uint32_t mic;
> +} NvmeMiControlPrimitives;
> +
> +typedef struct NvmMiSubsysInfoDs {
> +    uint8_t nump;
> +    uint8_t mjr;
> +    uint8_t mnr;
> +    uint8_t rsvd[29];
> +} NvmMiSubsysInfoDs;
> +
> +typedef struct NvmeMiCwarnStruct {
> +    uint8_t spare_thresh:1;
> +    uint8_t temp_above_or_under_thresh:1;
> +    uint8_t rel_degraded:1;
> +    uint8_t read_only:1;
> +    uint8_t vol_mem_bup_fail:1;
> +    uint8_t reserved:3;
> +} NvmeMiCwarnStruct;
> +
> +typedef struct NvmeMiCstsStruct {
> +    uint16_t rdy:1;
> +    uint16_t cfs:1;
> +    uint16_t shst:2;
> +    uint16_t nssro:1;
> +    uint16_t en:1;
> +    uint16_t nssac:1;
> +    uint16_t fwact:1;
> +    uint16_t reserved:8;
> +} NvmeMiCstsStruct;
> +
> +typedef struct NvmeMiCtrlHealthDs {
> +   uint16_t ctlid;
> +   NvmeMiCstsStruct csts;
> +   uint16_t ctemp;
> +   uint16_t pdlu;
> +   uint8_t spare;
> +   NvmeMiCwarnStruct cwarn;
> +   uint8_t reserved[7];
> +} NvmeMiCtrlHealthDs;
> +
> +typedef struct NvmeMIResponse {
> +   NvmeMiMessageHeader msg_header;
> +   uint8_t                status;
> +   uint32_t               mgmt_resp:24;

Don't mix bitfields like this. Either do a bitfield on the status as
well or use a uint8_t[3] for the mgmt_resp.

> +} NvmeMIResponse;
> +
> +typedef struct NvmeMIAdminResponse {
> +   NvmeMiMessageHeader msg_header;
> +   uint32_t status:8;
> +   uint32_t mgmt_resp:24;
> +   uint32_t cqdword0;
> +   uint32_t cqdword1;
> +   uint32_t cqdword3;
> +} NvmeMIAdminResponse;
> +
> +uint32_t NvmeMiCmdOptSupList[] =3D {
> +  /*
> +   * MANAGEMENT_ENDPOINT_BUFFER_READ,
> +   * MANAGEMENT_ENDPOINT_BUFFER_WRITE,
> +   */
> +};
> +
> +uint32_t NvmeMiAdminCmdOptSupList[] =3D {
> +   /*
> +    *  NVME_ADM_CMD_DST,
> +    *  NVME_ADM_CMD_DOWNLOAD_FW,
> +    *  NVME_ADM_CMD_ACTIVATE_FW,
> +    *  NVME_ADM_CMD_FORMAT_NVM,
> +    *  NVME_ADM_CMD_NS_MANAGEMENT,
> +    *  NVME_ADM_CMD_NS_ATTACHMENT,
> +    *  NVME_ADM_CMD_DIRECTIVE_SEND,
> +    *  NVME_ADM_CMD_DIRECTIVE_RECV,
> +    *  NVME_ADM_CMD_SET_FEATURES,
> +    *  NVME_ADM_CMD_SANITIZE,
> +    */
> +};
> +
> +void *vsock_server_start(void *);
> +void *ControlPrimitiveThread(void *);
> +void *nvme_mi_admin_commandthread(void *);
> +

These look like left-overs from v1.

In general, please trim all the stuff that isnt used by the
implementation.

> +#endif
> --=20
> 2.7.0.windows.1
>=20


--ICBTQ9swzn8nbp+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFT7YsACgkQTeGvMW1P
Dek+Ngf/bcMEF1xvIZGDypG3hZbvgii0G19WLxdkLQY//n06l76jYNx5cP946/gn
avC+if3AysxV9ICoEoGNkUVCFHs59bZWRQCIQ/XCfHGGIZMuwul1LOvBjmlFzHlg
cKaRoFhGk2vp6a5Z7oqSL/8kn7JIf7+MlA4MO6WMlWJ+/EMA/5R78o3zzWi7iVpr
c3j7z4Xpq1Q5vrSg3Kylzb5H5v1WVi1EG5yCl3ltzUmepCO0M0jeS1RvO6F7Ia3H
r1s9x6jB5OIzBIXyA7kocdFPQjrNmOpfvye4FpCoPz4xPohzvq5GAU848v5CHsxC
fNu/gzv+MX82Q8n+xX9DiR6FkLeD6Q==
=4a6z
-----END PGP SIGNATURE-----

--ICBTQ9swzn8nbp+7--

