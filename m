Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433D28BAC8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:24:55 +0200 (CEST)
Received: from localhost ([::1]:48432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRykw-0003KX-AR
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyjl-0002eg-Gt; Mon, 12 Oct 2020 10:23:41 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyjj-0005cO-MQ; Mon, 12 Oct 2020 10:23:41 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2wbS-1kT5CN1M32-003MTk; Mon, 12 Oct 2020 16:23:35 +0200
Subject: Re: [PATCH] hw/pci: Fix typo in PCI hot-plug error message
To: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
References: <20201006133958.600932-1-jusual@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c0ab52bd-82a9-e85e-4598-5251c91c073a@vivier.eu>
Date: Mon, 12 Oct 2020 16:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006133958.600932-1-jusual@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IROZWIPEJ9i6h3KSYkKhsBol1CHpphIXyw5PG/OtTbWccZsHAMl
 d+F53nUT28zKAyAHqa+GgxuqOzF1FBIH7XrQSe+F5UusToLD2sAiSvRyUmNlmJwMQV4sGIy
 5wIdVHeHmmZGRn33RRtstTx4RYs95J+ZHeWUEzbrsEMHBTewXI/3MVz+3B+FZ+H7OS89rEf
 /H0XtI7OuQQHfWaHrmD7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jZWPemJoo5Y=:yrm4gDG2nK/bTTm6NFuEuz
 Tfpb1RXxOT0MoYlTNbOziX1RVobUIGeNZ7106Hi+QuufqAuIsI1IhaJFJWkv2dUjLIh/u1qgy
 6AI6bHixPKUeuodtuUmC4lXDgBVni+b9pUHToDYsSPNqp2DZ1ZupjncqRDwOLZba+Ar116cOy
 p0VOycWopIICd07jehcSTrNsygxQowvkuVDIGT/wUhCZWO+++b0dDb2Ss7b5tFyXIeaJx6+k0
 sizNkwC4hKnbGGUo7FdBshKhg71JntoKAjQbFB9UXKr7KdnK9WG0kO/K72qIMEmf58r6y5JSM
 7fMqnRxU+4pMAiKnr0AcAwP2xbVYMZYjGN11+npdGTYyqlnRTjHHi7yL4rzixgF4RfyZY26x/
 uM0QuFUoQMwj0HG/+7WvPe/jVoyvxTRomu2c6baiX0AYzL5Ejy2O4DdMIFLmOZ7Br0hjL/Tay
 8vfvHtTPut/7UolhERSpWuZvQ/YtX2hozwjxwX+ToJh/KdGCV/AG0XBUa8MND7FjcZQdnGIWv
 EnGTGa0RULLftdfb/Nk3bseRq4oXbKzw/vunpHF8i6pq0CxT6CRwSq571u93PLygEEV+gNQt6
 iiPa1fRwINqfx3U4bxqBVV5OPleLE01anG1p4r7eJFxp2rcGQeHVOuvKzWsKRivoejle+E0Wn
 D2S5Y8FkazHG3FRknEJtutJvksCqql4dW929yoaho2pyLjMyIE8UCRV7/8BJqjBUrEn8Ll4Yk
 pb060QppQutU55X9zYF4Cg+e9zBW/d+uR+3x8EuP+6uNbNNhj7jfS7KX9CAwkKBr9YE+1vc/h
 2HNOyWf9A6rx5rN7bmdmuM635c3J2C91P6nqjnur1BiZ1dCecNsYv0fsU5G6D2LzVY3fDLY
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:16:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/10/2020 à 15:39, Julia Suvorova a écrit :
> 'occupied' is spelled like 'ocuppied' in the message.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/pci/pci.c       | 2 +-
>  hw/ppc/spapr_pci.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 3c8f10b461..100c9381c2 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1036,7 +1036,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>          return NULL;
>      } else if (dev->hotplugged &&
>                 pci_get_function_0(pci_dev)) {
> -        error_setg(errp, "PCI: slot %d function 0 already ocuppied by %s,"
> +        error_setg(errp, "PCI: slot %d function 0 already occupied by %s,"
>                     " new func %s cannot be exposed to guest.",
>                     PCI_SLOT(pci_get_function_0(pci_dev)->devfn),
>                     pci_get_function_0(pci_dev)->name,
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 5db912b48c..68e2218fe0 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1572,7 +1572,7 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
>       */
>      if (plugged_dev->hotplugged && bus->devices[PCI_DEVFN(slotnr, 0)] &&
>          PCI_FUNC(pdev->devfn) != 0) {
> -        error_setg(errp, "PCI: slot %d function 0 already ocuppied by %s,"
> +        error_setg(errp, "PCI: slot %d function 0 already occupied by %s,"
>                     " additional functions can no longer be exposed to guest.",
>                     slotnr, bus->devices[PCI_DEVFN(slotnr, 0)]->name);
>          return;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


