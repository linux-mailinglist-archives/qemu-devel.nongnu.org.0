Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351454B253
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 15:34:24 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o16gZ-0001N3-1e
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 09:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o16cY-0005vr-KR; Tue, 14 Jun 2022 09:30:16 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:43872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o16cS-0004mN-LO; Tue, 14 Jun 2022 09:30:11 -0400
Received: by mail-oi1-x233.google.com with SMTP id q11so11560577oih.10;
 Tue, 14 Jun 2022 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MzIMgYPrkGcxk+uhhwb0i9JSY9EVOuZlvQzhOxJXQbk=;
 b=R+KhlqjzYGvDjliC7zjV5JDsxmY9rNftkLGuMPhJQhZp3z3JDH8F8jYpL/AartsMog
 AUrmyz/ywqclRHOsujCTluPXKTqOgq8Nvzs26gtjQ36yDJPfIlxEp+Fn30gKRRn0ztX5
 mWi+bXiPXHuuz5StJMGrjqe1Oywag8UNOygvPZkAFEnjS/y1YTH41EMsuIWKlm4WLlob
 3E45MWcFZyqkSylrX9YqeJvi4HSEcCTeBnifWdAt24g79eXt1y20Lq+jqGx2KLDfap15
 6Q69mnFd7szNGkwkuR4v7x+2oeVbWctFfH5fx0Aj0U95Hy9f2eO/fMFxoS9KQebSNGpt
 rDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MzIMgYPrkGcxk+uhhwb0i9JSY9EVOuZlvQzhOxJXQbk=;
 b=O217ZEiSEaxMy3ubGc8rajrGuqkRauI8Dlpj2+9jkmZbI64U7245a6LswA3lO7Siq8
 wFhaQ2HpoMsuqzoJW7TIMMlKQpjRxUuIdm5dcnS5IU18CTR0gIxLBTABlRJ1pAp1IZ97
 VMvfJ3oh+YavFsa+iiBpnrLbTJfsgrLE7Ii6fVWWFuHF57HvbROlxkwn0Ay8eWS7HXCH
 rXotvGEyXsdxD0HTx/NkkbruTPgPtiKP1AGUDpgn5mxQuSAUQB836mTRSEk8sYwcjsHZ
 PtTsmB5Cxwghu/AUFLg0mH7V4kUfxI1GaCnK8GYTylJmMFWX2NlBRtbmVEHYZ6Dg6O8S
 DSpg==
X-Gm-Message-State: AOAM530ajjDlMEEYBrWK/vtcqr+HJhrR95oefuA8g1jiewtHkGhRZerk
 nJJxSNzHRyF2b5Y9aPjp4XY=
X-Google-Smtp-Source: ABdhPJxQjhF2ovPl3+QAArgNUJ0rA3b1NLaLz7InSN5zNziz8/qjzgJT7FS1MzAzNYPfwOWoZPqoig==
X-Received: by 2002:aca:2204:0:b0:32e:c3c0:88d7 with SMTP id
 b4-20020aca2204000000b0032ec3c088d7mr2073064oic.203.1655213405981; 
 Tue, 14 Jun 2022 06:30:05 -0700 (PDT)
Received: from [192.168.10.102] ([191.255.109.90])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a544708000000b00328c9e63389sm4537258oik.11.2022.06.14.06.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 06:30:05 -0700 (PDT)
Message-ID: <580c26a3-a701-6b91-f9a0-4c808b703082@gmail.com>
Date: Tue, 14 Jun 2022 10:30:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] Trivial: 3 char repeat typos
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru
Cc: clg@kaod.org, mst@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 kbusch@kernel.org, its@irrelevant.dk
References: <20220614104045.85728-1-dgilbert@redhat.com>
 <20220614104045.85728-2-dgilbert@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220614104045.85728-2-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/14/22 07:40, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Inspired by Julia Lawall's fixing of Linux
> kernel comments, I looked at qemu, although I did it manually.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/intc/openpic.c                | 2 +-
>   hw/net/imx_fec.c                 | 2 +-
>   hw/pci/pcie_aer.c                | 2 +-
>   hw/pci/shpc.c                    | 3 ++-
>   hw/ppc/spapr_caps.c              | 2 +-
>   hw/scsi/spapr_vscsi.c            | 2 +-
>   qapi/net.json                    | 2 +-
>   tools/virtiofsd/passthrough_ll.c | 2 +-
>   ui/input.c                       | 2 +-
>   9 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index 49504e740f..b0787e8ee7 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -729,7 +729,7 @@ static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
>   }
>   
>   /*
> - * Returns the currrent tccr value, i.e., timer value (in clocks) with
> + * Returns the current tccr value, i.e., timer value (in clocks) with
>    * appropriate TOG.
>    */
>   static uint64_t openpic_tmr_get_timer(OpenPICTimer *tmr)
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 0db9aaf76a..8c11b237de 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -438,7 +438,7 @@ static void imx_eth_update(IMXFECState *s)
>        *   assignment fail.
>        *
>        * To ensure that all versions of Linux work, generate ENET_INT_MAC
> -     * interrrupts on both interrupt lines. This should be changed if and when
> +     * interrupts on both interrupt lines. This should be changed if and when
>        * qemu supports IOMUX.
>        */
>       if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 92bd0530dd..eff62f3945 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -323,7 +323,7 @@ static void pcie_aer_msg_root_port(PCIDevice *dev, const PCIEAERMsg *msg)
>            */
>       }
>   
> -    /* Errro Message Received: Root Error Status register */
> +    /* Error Message Received: Root Error Status register */
>       switch (msg->severity) {
>       case PCI_ERR_ROOT_CMD_COR_EN:
>           if (root_status & PCI_ERR_ROOT_COR_RCV) {
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index f822f18b98..e71f3a7483 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -480,7 +480,8 @@ static const MemoryRegionOps shpc_mmio_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           /* SHPC ECN requires dword accesses, but the original 1.0 spec doesn't.
> -         * It's easier to suppport all sizes than worry about it. */
> +         * It's easier to support all sizes than worry about it.
> +         */
>           .min_access_size = 1,
>           .max_access_size = 4,
>       },
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 655ab856a0..b4283055c1 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -553,7 +553,7 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>                * instruction is a harmless no-op.  It won't correctly
>                * implement the cache count flush *but* if we have
>                * count-cache-disabled in the host, that flush is
> -             * unnnecessary.  So, specifically allow this case.  This
> +             * unnecessary.  So, specifically allow this case.  This
>                * allows us to have better performance on POWER9 DD2.3,
>                * while still working on POWER9 DD2.2 and POWER8 host
>                * cpus.
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index a07a8e1523..e320ccaa23 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -1013,7 +1013,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
>       }
>   
>       /*
> -     * Current implementation does not suppport any migration or
> +     * Current implementation does not support any migration or
>        * reservation capabilities. Construct the response telling the
>        * guest not to use them.
>        */
> diff --git a/qapi/net.json b/qapi/net.json
> index d6f7cfd4d6..9af11e9a3b 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -298,7 +298,7 @@
>   #
>   # @udp: use the udp version of l2tpv3 encapsulation
>   #
> -# @cookie64: use 64 bit coookies
> +# @cookie64: use 64 bit cookies
>   #
>   # @counter: have sequence counter
>   #
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index b15c631ca5..7a73dfcce9 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2319,7 +2319,7 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
>            * If security.selinux has not been remapped and selinux is enabled,
>            * use fscreate to set context before file creation. If not, use
>            * tmpfile method for regular files. Otherwise fallback to
> -         * non-atomic method of file creation and xattr settting.
> +         * non-atomic method of file creation and xattr setting.
>            */
>           if (!mapped_name && lo->use_fscreate) {
>               err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
> diff --git a/ui/input.c b/ui/input.c
> index 8ac407dec4..e2a90af889 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -364,7 +364,7 @@ void qemu_input_event_send(QemuConsole *src, InputEvent *evt)
>        * when 'alt+print' was pressed. This flaw is now fixed and the
>        * 'sysrq' key serves no further purpose. We normalize it to
>        * 'print', so that downstream receivers of the event don't
> -     * neeed to deal with this mistake
> +     * need to deal with this mistake
>        */
>       if (evt->type == INPUT_EVENT_KIND_KEY &&
>           evt->u.key.data->key->u.qcode.data == Q_KEY_CODE_SYSRQ) {

