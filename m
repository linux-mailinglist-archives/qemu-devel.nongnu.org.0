Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0A341FC55
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:36:36 +0200 (CEST)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfBr-0000yp-RL
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mWf9k-00080K-Qr
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:34:24 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:23196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mWf9h-0002Eb-Dt
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:34:24 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20211002132756epoutp01c462dd250839f2649982252d58400973~qObe_UG0r2450624506epoutp01b
 for <qemu-devel@nongnu.org>; Sat,  2 Oct 2021 13:27:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20211002132756epoutp01c462dd250839f2649982252d58400973~qObe_UG0r2450624506epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1633181276;
 bh=uwgkNaZtXJz7U5clKCeiosv9SJmGVj/DLYAPLa3tbyw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mPr7d6J2lXiIinYpXWxFp9Bv5vRCqeEm6l1TlImHe/oA2s9uHi1aCk3J4VuXEbZqm
 yxUElP/twaoXERdBlxwfH3ikCZLHF6aSddBXBR/Pr2qT2tmtSLISkvZamFNlW2BcJ3
 JXOYIDUhiwccDBvsVDpwYu8CzvmBh62bFMx8FPuE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20211002132754epcas5p4d913513011485112bc372e8957824f43~qObdqqiXm2804528045epcas5p4q;
 Sat,  2 Oct 2021 13:27:54 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4HM7845HWMz4x9Pv; Sat,  2 Oct
 2021 13:27:48 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 ED.B9.10367.45E58516; Sat,  2 Oct 2021 22:27:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20211001151602epcas5p182a07521717a77e665e7f4cfbe70be12~p8QlQiysL0646806468epcas5p1K;
 Fri,  1 Oct 2021 15:16:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211001151602epsmtrp2aed81a36c156cc304047301eb9227428~p8QlNvJLJ1174711747epsmtrp2b;
 Fri,  1 Oct 2021 15:16:02 +0000 (GMT)
X-AuditID: b6c32a4a-b2dff7000000287f-70-61585e54df32
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.E6.09091.13627516; Sat,  2 Oct 2021 00:16:01 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211001151559epsmtip2b2faadb5cbeb2962f788268c8783ec5e~p8QjDhWvB2182221822epsmtip2j;
 Fri,  1 Oct 2021 15:15:59 +0000 (GMT)
Date: Fri, 1 Oct 2021 20:45:28 +0530
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH: v3 1/2] add mi device in qemu
Message-ID: <20211001151528.GA32169@test.sa.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <YVPtogzu2OSh/1yK@apples.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmpm5IXESiQdtxZYs59y0s3n59wGZx
 Zf95Rov9B7+xWjy+85ndYul8fYuTjXtYLSYdusZoseRiqsWaF8oW824pW1yZsojZYta7djaL
 4707WCxeT/rPanGz+Smbg4DHj3PtbB7ndpxn99i0qpPN48m1zUwe7/ddZfPo27KKMYAtKtsm
 IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hoJYWyxJxS
 oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5eaomVoYGBkSlQYUJ2xuxT
 p5gLpp9nrOj89Zq5gfHhVMYuRk4OCQETiQnnZrF3MXJxCAnsZpRY1jiVBcL5xCixZ8JsNgjn
 G6PE780vmWBanh3+wASR2MsoMe3OPGYIp5FJYkdvEwtIFYuAisS6uQ1A7RwcbAJGEt9bbUHC
 IkDhp//2gq1gFjjLJDHp8S02kISwgJnEiq5r7CA2r4CHxL2t+5khbEGJkzOfgM3kBJpzYdlz
 MFsUaNCUk9vAzpMQOMIh8ffeAajzXCS6buyCsoUlXh3fwg5hS0l8frcXqqGZUWLflyssEM4E
 Rokp899BddhLXNzzF8xmFkiXmH19PStEXFZi6ql1UHE+id7fT6DqeSV2zIOxVSUeXzjIBmFL
 S8xe+YkJ5H0JoHdu3dGEBNEhRomT+26wTmCUn4Xku1lI1kHYVhKdH5qAbA4gW1pi+T8OCFNT
 Yv0u/QWMrKsYJVMLinPTU4tNC4zyUsvhsZ6cn7uJEZywtbx2MD588EHvECMTByPQWg5mJRFe
 vcDwRCHelMTKqtSi/Pii0pzU4kOMpsDYmsgsJZqcD8wZeSXxhiaWBiZmZmYmlsZmhkrivB9f
 WyYKCaQnlqRmp6YWpBbB9DFxcEo1MEnNFFjSHFdwOWCfShBPy0wNjdJvsckrVWTLBRr4Bdzs
 XaP0Ku4fEWv2fDa7gfPBL9uT83vV+mNPvuMQV5sznaFZ+u29PxxVjsaH5/rsO+s96/eDBp27
 rtIGtya8sVap2lTf8v1qm03F/MmsIc4TKyYv1FP/Wrslctbem8/OLai+/XHvNleLVqUiHwO7
 p4uv7zv80n2S/rlj2fJcZ/X/Tkj9bcXIKy+UMcep+7lT35VTLMtjK0/EK52wZ6q/IrHsBGNk
 8wm/aIdZE29b8yuGL/24W9wq8tpczocfnk7sea4nXu8+ZXoOj+i/3DcXnLncLj5ra4ydUOSa
 WO/IsPzS1IDjzQ1RGyPavzydmilwV4mlOCPRUIu5qDgRAINZImVhBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXtdQLTzRYMNLM4s59y0s3n59wGZx
 Zf95Rov9B7+xWjy+85ndYul8fYuTjXtYLSYdusZoseRiqsWaF8oW824pW1yZsojZYta7djaL
 4707WCxeT/rPanGz+Smbg4DHj3PtbB7ndpxn99i0qpPN48m1zUwe7/ddZfPo27KKMYAtissm
 JTUnsyy1SN8ugSvj+P9ZLAVnzjBW3N3cwdLAuGEyYxcjJ4eEgInEs8MfmLoYuTiEBHYzSlw4
 toUVIiEtse/hdRYIW1hi5b/n7BBF/xklLv1dwgySYBFQkVg3t4Gti5GDg03ASOJ7qy1IWAQo
 /PTfXhaQemaB80wS09b9AhsqLGAmsaLrGjuIzSvgIXFv635miKGHGCXuvWxjgkgISpyc+QRs
 MzNQw7zND5lBFjADXbT8HwdImBNo14Vlz8FKRIGWTTm5jW0Co+AsJN2zkHTPQuhewMi8ilEy
 taA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOMq0NHcwbl/1Qe8QIxMHI9BpHMxKIrw3eMIT
 hXhTEiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamAKZanRO7Fn
 sUvK4te+DuUMCz+LXF3QoyX9gHHOjh1eNbv6bt+W+8Tzo0I7XsMgdoJDFZflZoYPx/ua9/N4
 HFfkYxVk8H16q3LPkmN3rKReij+L4Xf98m291xLb19VS99WTDDbeyUw+lMk4+w1ryrQzPhG9
 y1LqUxx2TfxeOvlL8uYlulxfE3sijnzR+20mvIppx5X7sWvVGD7HfNb04PB4+T537qp/IioB
 7yU7Jj1eIeuxXPBQiJVrcrIas7/u4Z83dtosn3iX4Xjw2eVbRBLumRrN3qWnZ+WqsuJj0AXb
 CIe0lx1WB89PlV6/9UKlVJObw9R059SJzQwPQrL6DT/sPnyin8+664FAwoHsVnUlluKMREMt
 5qLiRAACivjgIQMAAA==
X-CMS-MailID: 20211001151602epcas5p182a07521717a77e665e7f4cfbe70be12
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----Bww2r2r_ZJ565FiFgzkXgewsa8Sc30QGyjIZn8-jS2qXJIBZ=_767d_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6
References: <CGME20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6@epcas5p1.samsung.com>
 <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
 <YVPtogzu2OSh/1yK@apples.localdomain>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

------Bww2r2r_ZJ565FiFgzkXgewsa8Sc30QGyjIZn8-jS2qXJIBZ=_767d_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Sep 29, 2021 at 06:37:54AM +0200, Klaus Jensen wrote:
>On Aug  3 12:54, Padmakar Kalghatgi wrote:
>> From: padmakar <p.kalghatgi@samsung.com>
>>
>> This patch contains the implementation of certain commands
>> of nvme-mi specification.The MI commands are useful to
>> manage/configure/monitor the device.Eventhough the MI commands
>> can be sent via the inband NVMe-MI send/recieve commands, the idea
>> here is to emulate the sideband interface for MI.
>>
>> The changes here includes the interface for i2c/smbus
>> for nvme-mi protocol. We have used i2c address of 0x15
>> using which the guest VM can send and recieve the nvme-mi
>> commands. Since the nvme-mi device uses the I2C_SLAVE as
>> parent, we have used the send and recieve callbacks by
>> which the nvme-mi device will get the required notification.
>> With the callback approach, we have eliminated the use of
>> threads.
>>
>> One needs to specify the following command in the launch to
>> specify the nvme-mi device, link to nvme and assign the i2c address.
>> <-device nvme-mi,nvme=nvme0,address=0x15>
>>
>> This module makes use of the NvmeCtrl structure of the nvme module,
>> to fetch relevant information of the nvme device which are used in
>> some of the mi commands. Eventhough certain commands might require
>> modification to the nvme module, currently we have currently refrained
>> from making changes to the nvme module.
>>
>> cmd-name                              cmd-type
>> *************************************************
>> read nvme-mi ds                        nvme-mi
>> configuration set                      nvme-mi
>> configuration get                      nvme-mi
>> vpd read                               nvme-mi
>> vpd write                              nvme-mi
>> controller Health Staus Poll           nvme-mi
>> nvme subsystem health status poll      nvme-mi
>> identify                               nvme-admin
>> get log page                           nvme-admin
>> get features                           nvme-admin
>>
>> Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
>> Reviewed-by: Klaus Birkelund Jensen <k.jensen@samsung.com>
>> Reviewed-by: Jaegyu Choi <jg123.choi@samsung.com>
>>
>> v3
>> -- rebased on master
>>
>> ---
>>  hw/nvme/meson.build |   2 +-
>>  hw/nvme/nvme-mi.c   | 650 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  hw/nvme/nvme-mi.h   | 297 ++++++++++++++++++++++++
>>  3 files changed, 948 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/nvme/nvme-mi.c
>>  create mode 100644 hw/nvme/nvme-mi.h
>>
>
>Some general comments.
>
>* Please be consistent about MI vs Mi in naming. I have no preference,
>  but NvmeMi is probably most aligned with existing style.
>
>* hw/nvme generally does not mix declarations and code. Please move
>  variables declarations to the top of their scope. And please get rid
>  of the hungarian notation ({b,l,u,...}VarName naming) ;)
>
>* I'd like that the header was cleaned up to not include stuff that
>  isn't used.
>
>* I understand that you'd like to not impact the hw/nvme/ctrl.c device
>  too much, but the Identify, Get Log Page and Get Feature "passthru"
>  commands could really benefit from using the same code as in
>  hw/nvme/ctrl.c - this requires a bit of refactoring such that the
>  data can be returned explicitly instead of being directly DMA'ed to
>  the host.
>
>* This is not compliant with the MCTP I2C/SMBus binding spec. The spec
>  states that all transactions are based on the SMBus Block Write bus
>  protocol. This means that responses require that the device (which is
>  defined as an I2C slave must itself master the bus and do a Block
>  Write to the message originator (the address of which is contained in
>  the fourth byte of the packet).
>
>> diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
>> index 3cf4004..8dac50e 100644
>> --- a/hw/nvme/meson.build
>> +++ b/hw/nvme/meson.build
>> @@ -1 +1 @@
>> -softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
>> +softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c', 'nvme-mi.c'))
>> diff --git a/hw/nvme/nvme-mi.c b/hw/nvme/nvme-mi.c
>> new file mode 100644
>> index 0000000..a90ce90
>> --- /dev/null
>> +++ b/hw/nvme/nvme-mi.c
>> @@ -0,0 +1,650 @@
>> +/*
>> + * QEMU NVMe-MI Controller
>> + *
>> + * Copyright (c) 2021, Samsung Electronics co Ltd.
>> + *
>> + * Written by Padmakar Kalghatgi <p.kalghatgi@samsung.com>
>> + *            Arun Kumar Agasar <arun.kka@samsung.com>
>> + *            Saurav Kumar <saurav.29@partner.samsung.com>
>> + *
>> + * This code is licensed under the GNU GPL v2 or later.
>> + */
>> +
>> +/**
>> + * Reference Specs: https://protect2.fireeye.com/v1/url?k=b5aa98b4-d54805e9-b5ab13fb-000babd9f1ba-0224a06b55b4fe71&q=1&e=f0445d9e-6d0d-4fac-8d43-1785c5d98f8e&u=http%3A%2F%2Fwww.nvmexpress.org%2F,
>> + *
>> + *
>> + * Usage
>> + * -----
>> + * The nvme-mi device has to be used along with nvme device only
>> + *
>> + * Add options:
>> + *    -device  nvme-mi,nvme=<nvme id>,address=0x15",
>
>Considering that NVMe-MI can run with various MCTP bindings, I think
>this particular instance of it should be called 'nvme-mi-i2c'.
>Supporting VDM on a PCIe binding is probably not really a goal at all,
>but it's better to be explicit about this I think.
>
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/qdev-core.h"
>> +#include "hw/block/block.h"
>> +#include "hw/pci/msix.h"
>> +#include "nvme.h"
>> +#include "nvme-mi.h"
>> +#include "qemu/crc32c.h"
>> +
>> +#define NVME_TEMPERATURE 0x143
>> +#define NVME_TEMPERATURE_WARNING 0x157
>> +#define NVME_TEMPERATURE_CRITICAL 0x175
>> +
>
>These are from hw/nvme/ctrl.c - they should be moved to hw/nvme/nvme.h
>and shared (separate patch please)
>
>> +static void nvme_mi_send_resp(NvmeMiCtrl *ctrl_mi, uint8_t *resp, uint32_t size)
>> +{
>> +    uint32_t crc_value = crc32c(0xFFFFFFFF, resp, size);
>> +    size += 4;
>
>Prefer that a sizeof(<some header struct>) instead of the magic number.
>
>> +    uint32_t offset = 0;
>> +    uint32_t ofst = 0;
>> +    uint32_t som = 1;
>> +    uint32_t eom = 0;
>> +    uint32_t pktseq = 0;
>> +    uint32_t mtus = ctrl_mi->mctp_unit_size;
>> +    while (size > 0) {
>> +        uint32_t sizesent = size > mtus ? mtus : size;
>
>size_t and maybe just a MIN().
>
>> +        size -= sizesent;
>> +        eom = size > 0 ? 0 : 1;
>> +        g_autofree uint8_t *buf = (uint8_t *)g_malloc0(sizesent + 8);
>> +        buf[2] = sizesent + 5;
>> +        buf[7] = (som << 7) | (eom << 6) | (pktseq << 5);
>> +        som = 0;
>> +        memcpy(buf + 8, resp + offset, sizesent);
>> +        offset += sizesent;
>> +        if (size <= 0) {
>> +            memcpy(buf + 8 + offset , &crc_value, sizeof(crc_value));
>> +        }
>> +        memcpy(ctrl_mi->misendrecv.sendrecvbuf + ofst, buf, sizesent + 8);
>> +        ofst += sizesent + 8;
>> +    }
>> +}
>
>I think you are missing the PEC byte here.
>
>My back-of-the-envelope calculation tells me that the 5000 byte
>sendrecvbuf *should* be big enough to handle any message with MTUS of
>64. But it is still arbitrary I think. See below on the i2c_recv where I
>suggest that you assemble the packets on the fly instead of staging all
>of them in the sendrecvbuf.
>
>> +
>> +static void nvme_mi_resp_hdr_init(NvmeMIResponse *resp, bool bAdminCommand)
>
>Hungarian Notation is definitely not a part of the QEMU Style Guide :p
>
>> +static void nvme_mi_read_nvme_mi_ds(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
>> +{
>> +    ReadNvmeMiDs ds;
>> +    ds.cntrlid = req->dword0 & 0xFFFF;
>> +    ds.portlid = (req->dword0 & 0xFF0000) >> 16;
>> +    ds.dtyp = (req->dword0 & ~0xFF) >> 24;
>> +    int dtyp = ds.dtyp;
>> +    switch (dtyp) {
>> +    case NVM_SUBSYSTEM_INFORMATION:
>> +        nvme_mi_nvm_subsys_ds(ctrl_mi, req);
>> +        break;
>> +    case OPT_SUPP_CMD_LIST:
>> +        nvme_mi_opt_supp_cmd_list(ctrl_mi, req);
>> +        break;
>> +    }
>
>The Port Information is pretty important, isnt it? That's what should be used
>to negotiate the transmission unit size.
>
>> +static void nvme_mi_admin_command(NvmeMiCtrl *ctrl_mi, void* req_arg)
>> +{
>> +    uint8_t *msg  = ((uint8_t *)req_arg);
>> +    NvmeMiMessageHeader msghdr;
>> +    memcpy(&msghdr, msg, sizeof(NvmeMiMessageHeader));
>> +    if (msghdr.nmimt == 1) {
>> +        NvmeMIRequest *req = (NvmeMIRequest *) (msg);
>> +        switch (req->opc) {
>> +        case READ_NVME_MI_DS:
>> +            nvme_mi_read_nvme_mi_ds(ctrl_mi, req);
>> +            break;
>> +        case CHSP:
>> +            nvme_mi_controller_health_ds(ctrl_mi, req);
>> +            break;
>> +        case NVM_SHSP:
>> +            nvme_mi_nvm_subsys_health_status_poll(ctrl_mi, req);
>> +            break;
>> +        case CONFIGURATION_SET:
>> +            nvme_mi_configuration_set(ctrl_mi, req);
>> +            break;
>> +        case CONFIGURATION_GET:
>> +            nvme_mi_configuration_get(ctrl_mi, req);
>> +            break;
>> +        case VPD_READ:
>> +            nvme_mi_vpd_read(ctrl_mi, req);
>> +            break;
>> +        case VPD_WRITE:
>> +            nvme_mi_vpd_write(ctrl_mi, req, msg);
>> +            break;
>> +        default:
>> +        {
>> +            NvmeMIResponse resp;
>> +            nvme_mi_resp_hdr_init(&resp, false);
>> +            resp.status = INVALID_COMMAND_OPCODE;
>> +            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
>> +            break;
>> +        }
>> +        }
>> +    } else {
>> +        NvmeAdminMIRequest *req = (NvmeAdminMIRequest *) (msg);
>> +        switch  (req->opc) {
>> +        case NVME_ADM_MI_CMD_IDENTIFY:
>> +            nvme_mi_admin_identify(ctrl_mi, req);
>> +            break;
>> +        case NVME_ADM_MI_CMD_GET_LOG_PAGE:
>> +            nvme_mi_admin_get_log_page(ctrl_mi, req);
>> +            break;
>> +        case NVME_ADM_MI_CMD_GET_FEATURES:
>> +            nvme_mi_admin_get_features(ctrl_mi, req);
>> +            break;
>
>It would make sense that the nvme device functions were refactored so
>they are reused here.
>
>> +        default:
>> +        {
>> +            NvmeMIResponse resp;
>> +            nvme_mi_resp_hdr_init(&resp, true);
>> +            resp.status = INVALID_COMMAND_OPCODE;
>> +            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
>> +            break;
>> +        }
>> +        }
>> +    }
>> +
>> +    return;
>> +}
>> +
>> +static uint8_t nvme_mi_i2c_recv(I2CSlave *s)
>> +{
>> +    NvmeMiCtrl *mictrl = (NvmeMiCtrl *)s;
>> +    NvmeMiSendRecvStruct *misendrecv = &mictrl->misendrecv;
>> +    if (misendrecv->bsyncflag == true) {
>> +        return -1;
>> +    }
>> +    return misendrecv->sendrecvbuf[misendrecv->sendlen++];
>> +}
>
>As I mention at the beginning, this is not how responses are "sent".
>Responses (which is another MCTP transaction) must be done by the device
>mastering the I2C bus and doing a "master write" to the message
>originator.
>
>> +
>> +static int nvme_mi_i2c_send(I2CSlave *s, uint8_t data)
>> +{
>> +    NvmeMiCtrl *mictrl = (NvmeMiCtrl *)s;
>> +    NvmeMiSendRecvStruct *misendrecv = &mictrl->misendrecv;
>> +
>> +    misendrecv->bsyncflag = true;
>> +    misendrecv->sendlen = 0;
>> +    switch (misendrecv->len) {
>> +    case 1:
>
>Initially I thought that this should have been 2, but the address byte
>is not part of the data that the device receives.
>
>> +        misendrecv->total_len = data;
>> +        break;
>> +    case 6:
>> +        misendrecv->eom = (data & 0x40) >> 6;
>
>I think (data >> 6) & 0x1 is slightly more clear.
>
>> +        break;
>> +    }
>> +    misendrecv->sendrecvbuf[++misendrecv->len] = data;
>> +    if (misendrecv->len == misendrecv->total_len + 3) {
>> +        misendrecv->cmdbuffer = (uint8_t *)g_realloc(misendrecv->cmdbuffer,
>> +                                                     misendrecv->len - 5);
>
>You need to track the current length of the entire message (not just the
>packets), otherwise, in this case you just realloc to the size of the current
>packet.
>
>> +        memcpy(misendrecv->cmdbuffer + misendrecv->offset,
>> +               misendrecv->sendrecvbuf + 8, misendrecv->len - 5);
>> +
>> +        misendrecv->offset = misendrecv->len - 5;
>
>Think the offset must be +='ed here.
>
>> +        misendrecv->total_len = 0;
>> +        misendrecv->len = 0;
>> +
>> +        if (misendrecv->eom == 1) {
>> +            nvme_mi_admin_command(mictrl, misendrecv->cmdbuffer);
>> +            misendrecv->offset = 0;
>> +            misendrecv->bsyncflag = false;
>> +        }
>> +    }
>> +    return 0;
>> +}
>
>This is a little complicated to read. It could probably benefit from
>being "state-machined" up a bit and instead of reading everything into a
>buffer and copying out at packet boundaries, just append the actual
>payloads. Maybe something along these lines (totally
>untested/uncompiled, but you get the idea):
>
>    struct state {
>      uint8_t buf[4224];
>      int pos, pktpos, mode;
>    };
>
>    static int i2c_send(I2CSlave *s, uint8_t data)
>    {
>      state->pktpos++;
>
>      switch (state->mode) {
>      case READ_MCTP_HEADER:
>        if (state->pktpos == 2) {
>          state->pktlen = data;
>          return;
>        } else if (state->pktpos == 7) {
>          state->eom = (data >> 6) & 0x1;
>          state->mode = READ_PACKET;
>          return;
>        }
>
>        /* ignore data */
>        return;
>
>      case READ_PACKET:
>        state->buf[state->pos++] = data;
>        if (state->pktpos == state->pktlen + 3) {
>          state->mode = READ_PEC;
>        }
>
>      case READ_PEC:
>        /* ignore */
>
>        /* we are done with this packet, so reset state and expect the next one */
>        state->mode = READ_MCTP_HEADER;
>        state->pktpos = 0;
>
>        if (state->eom) {
>          /* we have a full message */
>          process(state->buf);
>
>          /* reset state */
>          state->pos = 0;
>        }
>
>        return;
>      }
>    }
>
>I'm not sure if there is any benefit to implementing the i2c event callback.
>Maybe.
>
>> +
>> +static void nvme_mi_realize(DeviceState *dev, Error **errp)
>> +{
>> +    NvmeMiCtrl *s = (NvmeMiCtrl *)(dev);
>> +
>> +    s->smbus_freq = 100;
>> +    s->mctp_unit_size = 64;
>> +}
>> +static Property nvme_mi_props[] = {
>> +     DEFINE_PROP_LINK("nvme", NvmeMiCtrl, n, TYPE_NVME,
>> +                     NvmeCtrl *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void nvme_mi_class_init(ObjectClass *oc, void *data)
>> +{
>> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(oc);
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = nvme_mi_realize;
>> +    k->recv = nvme_mi_i2c_recv;
>> +    k->send = nvme_mi_i2c_send;
>> +
>> +    device_class_set_props(dc, nvme_mi_props);
>> +}
>> +
>> +static const TypeInfo nvme_mi = {
>> +    .name = TYPE_NVME_MI,
>> +    .parent = TYPE_I2C_SLAVE,
>> +    .instance_size = sizeof(NvmeMiCtrl),
>> +    .class_init = nvme_mi_class_init,
>> +};
>> +
>> +static void register_types(void)
>> +{
>> +    type_register_static(&nvme_mi);
>> +}
>> +
>> +type_init(register_types);
>> diff --git a/hw/nvme/nvme-mi.h b/hw/nvme/nvme-mi.h
>> new file mode 100644
>> index 0000000..92a20e6
>> --- /dev/null
>> +++ b/hw/nvme/nvme-mi.h
>> @@ -0,0 +1,297 @@
>> +/*
>> + * QEMU NVMe-MI
>> + *
>> + * Copyright (c) 2021 Samsung Electronics Co., Ltd.
>> + *
>> + * Authors:
>> + *   Padmakar Kalghatgi      <p.kalghatgi@samsung.com>
>> + *   Arun Kumar Agasar       <arun.kka@samsung.com>
>> + *   Saurav Kumar            <saurav.29@partner.samsung.com>
>> + *
>> + * This code is licensed under the GNU GPL v2 or later.
>> + */
>> +
>> +#ifndef NVME_MI_H
>> +#define NVME_MI_H
>> +
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +#include <stdint.h>
>> +#include <stdbool.h>
>> +#include "hw/i2c/i2c.h"
>> +
>> +#define TYPE_NVME_MI "nvme-mi"
>> +
>> +#define NVM_SUBSYSTEM_INFORMATION 0
>> +#define PORT_INFORMATION 1
>> +#define CONTROLLER_LIST 2
>> +#define CONTROLLER_INFORMATION 3
>> +#define OPT_SUPP_CMD_LIST 4
>> +#define MGMT_EPT_BUFF_CMD_SUPP_LIST 5
>> +
>> +
>> +typedef struct NvmeMiSendRecvStruct {
>> +   uint32_t sendlen;
>> +   uint8_t len;
>> +   uint8_t total_len;
>> +   uint32_t offset;
>> +   uint8_t eom;
>> +   bool bsyncflag;
>> +   u_char sendrecvbuf[5000];
>
>5000 seems arbitrary - the max MCTP message size is 4224 bytes, no?
>
>How many bytes we need for MCTP and I2C/SMBus overhead depends on MTUS,
>so I 5000 enough? Is it excessive?
>
>> +   uint8_t *cmdbuffer;
>> +} NvmeMiSendRecvStruct;
>> +typedef struct NvmeMiVpdElements {
>> +    long common_header;
>
>Use a fixed length type here.
>
>> +} NvmeMiVpdElements;
>> +
>> +typedef struct NvmeMiCtrl {
>> +   I2CSlave parent_obj;
>> +   uint32_t mctp_unit_size;
>> +   uint32_t smbus_freq;
>> +   NvmeMiVpdElements vpd_data;
>> +   NvmeMiSendRecvStruct  misendrecv;
>> +   NvmeCtrl *n;
>> +} NvmeMiCtrl;
>> +
>> +enum NvmeMiMngmtInterfaceCmdSetsOpcodes {
>> +   READ_NVME_MI_DS                   = 0x00,
>> +   NVM_SHSP                          = 0x01,
>> +   CHSP                              = 0x02,
>> +   CONFIGURATION_SET                 = 0x03,
>> +   CONFIGURATION_GET                 = 0x04,
>> +   VPD_READ                          = 0x05,
>> +   VPD_WRITE                         = 0x06,
>> +   MI_RESET                          = 0x07,
>> +   SES_RECEIVE                       = 0x08,
>> +   SES_SEND                          = 0x09,
>> +   MANAGEMENT_ENDPOINT_BUFFER_READ   = 0x0A,
>> +   MANAGEMENT_ENDPOINT_BUFFER_WRITE  = 0x0B,
>> +   MI_RESERVED                       = 0x0C,
>> +   VENDOR_SPECIFIC                   = 0xC0
>> +};
>> +
>> +enum NvmeMiControlPrimitiveOpcodes {
>> +   PAUSE                             = 0x00,
>> +   RESUME                            = 0x01,
>> +   ABORT                             = 0x02,
>> +   GET_STATE                         = 0x03,
>> +   REPLAY                            = 0x04,
>> +   CTRL_PRIMITIVE_RESERVED           = 0x05,
>> +   CTRL_PRIMITIVE_VENDOR_SPECIFIC    = 0xF0
>> +};
>> +
>> +enum NvmeMiAdminCommands {
>> +   NVME_ADM_MI_CMD_DELETE_SQ      = 0x00,
>> +   NVME_ADM_MI_CMD_CREATE_SQ      = 0x01,
>> +   NVME_ADM_MI_CMD_GET_LOG_PAGE   = 0x02,
>> +   NVME_ADM_MI_CMD_DELETE_CQ      = 0x04,
>> +   NVME_ADM_MI_CMD_CREATE_CQ      = 0x05,
>> +   NVME_ADM_MI_CMD_IDENTIFY       = 0x06,
>> +   NVME_ADM_MI_CMD_ABORT          = 0x08,
>> +   NVME_ADM_MI_CMD_SET_FEATURES   = 0x09,
>> +   NVME_ADM_MI_CMD_GET_FEATURES   = 0x0a,
>> +   NVME_ADM_MI_CMD_ASYNC_EV_REQ   = 0x0c,
>> +   NVME_ADM_MI_CMD_NS_MANAGEMENT  = 0x0d,
>> +   NVME_ADM_MI_CMD_ACTIVATE_FW    = 0x10,
>> +   NVME_ADM_MI_CMD_DOWNLOAD_FW    = 0x11,
>> +   NVME_ADM_MI_CMD_DST            = 0x14,
>> +   NVME_ADM_MI_CMD_NS_ATTACHMENT  = 0x15,
>> +   NVME_ADM_MI_CMD_KEEP_ALIVE     = 0x18,
>> +   NVME_ADM_MI_CMD_DIRECTIVE_SEND = 0x19,
>> +   NVME_ADM_MI_CMD_DIRECTIVE_RECV = 0x1A,
>> +   NVME_ADM_MI_CMD_VIRTUALIZATION = 0x1C,
>> +   NVME_ADM_MI_CMD_DB_BUF_CONIF   = 0x7C,
>> +   NVME_ADM_MI_CMD_FORMAT_NVM     = 0x80,
>> +   NVME_ADM_MI_CMD_SECURITY_SEND  = 0x81,
>> +   NVME_ADM_MI_CMD_SECURITY_RECV  = 0x82,
>> +   NVME_ADM_MI_CMD_SANITIZE       = 0x84,
>> +   NVME_ADM_MI_CMD_GET_LBA_STATUS = 0x86,
>> +};
>
>These opcodes are the same as in the Admin Command set, why repeat them
>here?
>
>> +
>> +enum NvmeMiConfigGetResponseValue {
>> +   DEFAULT_MCTP_SIZE   = 64,
>> +   DEFAULT_SMBUS_FREQ  = 1,
>> +   SET_SMBUS_FREQ      = 129,
>> +   SET_7BITS           = 255,
>> +   SET_4BITS           = 15,
>> +   SET_16BITS          = 65535
>> +};
>> +
>> +enum NvmeMiConfigurationIdentifier {
>> +   SMBUS_I2C_FREQ = 1,
>> +   HEALTH_STATUS_CHG,
>> +   MCTP_TRANS_UNIT_SIZE,
>> +};
>> +
>> +enum NvmeMiResponseMessageStatus {
>> +   SUCCESS,
>> +   MORE_PROCESSING_REQUIRED,
>> +   INTERNAL_ERROR,
>> +   INVALID_COMMAND_OPCODE,
>> +   INVALID_PARAMETER,
>> +   INVALID_COMMAND_SIZE,
>> +   INVALID_COMMAND_INPUT_DATA_SIZE,
>> +   ACCESS_DENIED,
>> +   VPD_UPDATES_EXCEEDED = 0x20,
>> +   PCIe_INACCESSIBLE
>> +};
>> +
>> +typedef struct NvmeMiMctpHeader {
>> +   uint32_t byte_count:8;
>> +   uint32_t SOM:1;
>> +   uint32_t EOM:1;
>> +   uint32_t pckt_seq:2;
>> +} NvmeMiMctpHeader;
>
>This doesnt look right - looks like its mixing the i2c header and the
>mctp header. But I don't think its used anyway.
>
>> +
>> +typedef struct NvmeMiMessageHeader {
>> +   uint32_t msgtype:7;
>> +   uint32_t ic:1;
>> +   uint32_t csi:1;
>> +   uint32_t reserved:2;
>> +   uint32_t nmimt:4;
>> +   uint32_t ror:1;
>> +   uint32_t reserved1:16;
>> +} NvmeMiMessageHeader;
>> +
>> +typedef struct NvmeMIRequest {
>> +   NvmeMiMessageHeader msg_header;
>> +   uint32_t               opc:8;
>> +   uint32_t               rsvd:24;
>> +   uint32_t               dword0;
>> +   uint32_t               dword1;
>> +   uint8_t                *buf;
>
>That's not right. This is effectively just a 4 or 8 byte wide field. You
>might want to use a flexible array member at the end here and have it
>include both the request data and the crc.
>
>> +   uint32_t               mic;
>> +} NvmeMIRequest;
>> +
>> +typedef struct NvmeAdminMIRequest {
>> +   NvmeMiMessageHeader msg_header;
>> +   uint8_t                opc;
>> +   uint8_t                cmdflags;
>> +   uint16_t               cntlid;
>> +   uint32_t               sqentry1;
>> +   uint32_t               sqentry2;
>> +   uint32_t               sqentry3;
>> +   uint32_t               sqentry4;
>> +   uint32_t               sqentry5;
>> +   uint32_t               dataofst;
>> +   uint32_t               datalen;
>> +   uint32_t               reserved[2];
>> +   uint32_t               sqentry10;
>> +   uint32_t               sqentry11;
>> +   uint32_t               sqentry12;
>> +   uint32_t               sqentry13;
>> +   uint32_t               sqentry14;
>> +   uint32_t               sqentry15;
>> +   uint8_t                *buf;
>
>Same issue as above.
>
>> +   uint32_t               mic;
>> +} NvmeAdminMIRequest;
>> +
>> +typedef struct ReadNvmeMiDs {
>> +    uint16_t cntrlid;
>> +    uint8_t  portlid;
>> +    uint8_t  dtyp;
>> +}  ReadNvmeMiDs;
>> +
>> +typedef struct NvmeMiConfigurationSet {
>> +    uint8_t conf_identifier_dword_0;
>> +    uint16_t conf_identifier_specific_dword_0;
>> +    uint16_t conf_identifier_specific_dword_1;
>> +}  MiConfigurationSet;
>> +
>> +typedef struct NvmeMiNvmSubsysHspds {
>> +    uint8_t nss;
>> +    uint8_t sw;
>> +    uint8_t ctemp;
>> +    uint8_t pdlu;
>> +    uint16_t ccs;
>> +    uint16_t reserved;
>> +} NvmeMiNvmSubsysHspds;
>> +
>> +typedef struct NvmeMiControlPrimitives {
>> +    uint32_t nmh;
>> +    uint32_t cpo;
>> +    uint32_t tag;
>> +    uint32_t cpsp;
>> +    uint32_t mic;
>> +} NvmeMiControlPrimitives;
>> +
>> +typedef struct NvmMiSubsysInfoDs {
>> +    uint8_t nump;
>> +    uint8_t mjr;
>> +    uint8_t mnr;
>> +    uint8_t rsvd[29];
>> +} NvmMiSubsysInfoDs;
>> +
>> +typedef struct NvmeMiCwarnStruct {
>> +    uint8_t spare_thresh:1;
>> +    uint8_t temp_above_or_under_thresh:1;
>> +    uint8_t rel_degraded:1;
>> +    uint8_t read_only:1;
>> +    uint8_t vol_mem_bup_fail:1;
>> +    uint8_t reserved:3;
>> +} NvmeMiCwarnStruct;
>> +
>> +typedef struct NvmeMiCstsStruct {
>> +    uint16_t rdy:1;
>> +    uint16_t cfs:1;
>> +    uint16_t shst:2;
>> +    uint16_t nssro:1;
>> +    uint16_t en:1;
>> +    uint16_t nssac:1;
>> +    uint16_t fwact:1;
>> +    uint16_t reserved:8;
>> +} NvmeMiCstsStruct;
>> +
>> +typedef struct NvmeMiCtrlHealthDs {
>> +   uint16_t ctlid;
>> +   NvmeMiCstsStruct csts;
>> +   uint16_t ctemp;
>> +   uint16_t pdlu;
>> +   uint8_t spare;
>> +   NvmeMiCwarnStruct cwarn;
>> +   uint8_t reserved[7];
>> +} NvmeMiCtrlHealthDs;
>> +
>> +typedef struct NvmeMIResponse {
>> +   NvmeMiMessageHeader msg_header;
>> +   uint8_t                status;
>> +   uint32_t               mgmt_resp:24;
>
>Don't mix bitfields like this. Either do a bitfield on the status as
>well or use a uint8_t[3] for the mgmt_resp.
>
>> +} NvmeMIResponse;
>> +
>> +typedef struct NvmeMIAdminResponse {
>> +   NvmeMiMessageHeader msg_header;
>> +   uint32_t status:8;
>> +   uint32_t mgmt_resp:24;
>> +   uint32_t cqdword0;
>> +   uint32_t cqdword1;
>> +   uint32_t cqdword3;
>> +} NvmeMIAdminResponse;
>> +
>> +uint32_t NvmeMiCmdOptSupList[] = {
>> +  /*
>> +   * MANAGEMENT_ENDPOINT_BUFFER_READ,
>> +   * MANAGEMENT_ENDPOINT_BUFFER_WRITE,
>> +   */
>> +};
>> +
>> +uint32_t NvmeMiAdminCmdOptSupList[] = {
>> +   /*
>> +    *  NVME_ADM_CMD_DST,
>> +    *  NVME_ADM_CMD_DOWNLOAD_FW,
>> +    *  NVME_ADM_CMD_ACTIVATE_FW,
>> +    *  NVME_ADM_CMD_FORMAT_NVM,
>> +    *  NVME_ADM_CMD_NS_MANAGEMENT,
>> +    *  NVME_ADM_CMD_NS_ATTACHMENT,
>> +    *  NVME_ADM_CMD_DIRECTIVE_SEND,
>> +    *  NVME_ADM_CMD_DIRECTIVE_RECV,
>> +    *  NVME_ADM_CMD_SET_FEATURES,
>> +    *  NVME_ADM_CMD_SANITIZE,
>> +    */
>> +};
>> +
>> +void *vsock_server_start(void *);
>> +void *ControlPrimitiveThread(void *);
>> +void *nvme_mi_admin_commandthread(void *);
>> +
>
>These look like left-overs from v1.
>
>In general, please trim all the stuff that isnt used by the
>implementation.
>
>> +#endif
>> --
>> 2.7.0.windows.1
>>
>

Thanks very much Klaus for the review comments and feedback.
We will work on it and update the patch with these changes.

------Bww2r2r_ZJ565FiFgzkXgewsa8Sc30QGyjIZn8-jS2qXJIBZ=_767d_
Content-Type: text/plain; charset="utf-8"


------Bww2r2r_ZJ565FiFgzkXgewsa8Sc30QGyjIZn8-jS2qXJIBZ=_767d_--

