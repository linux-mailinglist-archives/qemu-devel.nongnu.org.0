Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AE412716
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:01:54 +0200 (CEST)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPU9-0003XH-KE
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPRb-00016k-BL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:59:15 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:59917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPRZ-00007p-JC
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:59:15 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MK3eC-1mABph41tO-00LVHL; Mon, 20 Sep 2021 21:59:12 +0200
Subject: Re: [PATCH v4 08/20] nubus: generate bus error when attempting to
 access empty slots
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <22c414eb-2783-8879-eb5a-0be05a913f4f@vivier.eu>
Date: Mon, 20 Sep 2021 21:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kyGg6BafMEvbn/Q1jKtEfPv34J57meLpvjCVqsv/f7mlYmRNNtk
 6A6g/acXqBRn931m8FQE/DuHjMIir/ldOIf0TICR+Aug/jWeI+DF69tTGy7a0Zoyqa7GB55
 r/7Z0F0of9ksYkVGXmL0U7He0XDmk3GuDtkx+HIONrltHz5oT73ODDv4IFd2rMVxz8glu48
 iHpKYqSaPxAm6RRgKh5Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X8Nil4neHyM=:LMe227K6v0DcAHfjSf59vY
 5YjT/7sDXnvows+3h7ga+pHKOG2cuvjHw/cc8kosXs5EoI9ZMidzfTIp0y07HpilWdGW12a4E
 X6BjOiu+ZgQSMcGhXUwzB7erg8xsVf9WeknmyL8fOiVpg41zu3kU7J00WiXisfM/Fdibmp/5d
 Sl6HXHXH3QYkljg/gzZ7oQVNGkzm8H/oTU5FzqPENm0C20gcJ0AgyA0QcmLbPBvOp481JakQr
 TwXt4i/lToQ1Z4jE3CSQVV886PWJe5mQnGmQQcCBTOuD54RFQ4eB8g407hgridR6TAJ+k7U59
 v++WOVlXTMrScMMYAUJduIR3t9DMAyeUp20CgpT1ZcS23wRhdQgRuMN3h6Fo16mxU7gzYY2PK
 Xibp2VCJbTSP1DyBJPI8peH51kHQoMAlLCSSRMFfLD1Vf+ImfZmvSimeMQyDbFifIviF06AOv
 HRZLXV3gOebYM/dwB/q8pHbYMMlSSBCE39nUGNWjRVx0oIT9OD0wg4GR5ZvazuB2ezSxhgSlA
 +U/ZHv0kbnBkH9ozF2DhnULLovXXCCfJUza0gz/JIbGHKBffInZAXEV01eZYQPhmEQROI8KYE
 ehRXGugyxhgMmDMDXkyzjRVKGFYDKEmpIEZ9CE5SZqoKqTXyZe4cmN82FhaxNXXtCWobN/bqH
 YuILCjKwNsDM8GzrCxPf+0qnTw4qJtipquXJQSah+QlOK+2Yri0J0RWTz3Sh6s/dpGFiZIlB7
 TLAj3T4NeA8/ItbMOK85o0TCWpwzRdbOehUXlQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> According to "Designing Cards and Drivers for the Macintosh Family" any attempt
> to access an unimplemented address location on Nubus generates a bus error. MacOS
> uses a custom bus error handler to detect empty Nubus slots, and with the current
> implementation assumes that all slots are occupied as the Nubus transactions
> never fail.
> 
> Switch nubus_slot_ops and nubus_super_slot_ops over to use {read,write}_with_attrs
> and hard-code them to return MEMTX_DECODE_ERROR so that unoccupied Nubus slots
> will generate the expected bus error.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-bus.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 39182db065..a617459a4f 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -20,23 +20,23 @@ static NubusBus *nubus_find(void)
>      return NUBUS_BUS(object_resolve_path_type("", TYPE_NUBUS_BUS, NULL));
>  }
>  
> -static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
> -                             unsigned int size)
> +static MemTxResult nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
> +                                    unsigned size, MemTxAttrs attrs)
>  {
> -    /* read only */
>      trace_nubus_slot_write(addr, val, size);
> +    return MEMTX_DECODE_ERROR;
>  }
>  
> -static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
> -                                unsigned int size)
> +static MemTxResult nubus_slot_read(void *opaque, hwaddr addr, uint64_t *data,
> +                                   unsigned size, MemTxAttrs attrs)
>  {
>      trace_nubus_slot_read(addr, size);
> -    return 0;
> +    return MEMTX_DECODE_ERROR;
>  }
>  
>  static const MemoryRegionOps nubus_slot_ops = {
> -    .read  = nubus_slot_read,
> -    .write = nubus_slot_write,
> +    .read_with_attrs  = nubus_slot_read,
> +    .write_with_attrs = nubus_slot_write,
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> @@ -44,23 +44,25 @@ static const MemoryRegionOps nubus_slot_ops = {
>      },
>  };
>  
> -static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
> -                                   unsigned int size)
> +static MemTxResult nubus_super_slot_write(void *opaque, hwaddr addr,
> +                                          uint64_t val, unsigned size,
> +                                          MemTxAttrs attrs)
>  {
> -    /* read only */
>      trace_nubus_super_slot_write(addr, val, size);
> +    return MEMTX_DECODE_ERROR;
>  }
>  
> -static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
> -                                      unsigned int size)
> +static MemTxResult nubus_super_slot_read(void *opaque, hwaddr addr,
> +                                         uint64_t *data, unsigned size,
> +                                         MemTxAttrs attrs)
>  {
>      trace_nubus_super_slot_read(addr, size);
> -    return 0;
> +    return MEMTX_DECODE_ERROR;
>  }
>  
>  static const MemoryRegionOps nubus_super_slot_ops = {
> -    .read  = nubus_super_slot_read,
> -    .write = nubus_super_slot_write,
> +    .read_with_attrs = nubus_super_slot_read,
> +    .write_with_attrs = nubus_super_slot_write,
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

