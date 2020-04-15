Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D754C1A93D3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:05:46 +0200 (CEST)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOc7F-0001gO-Us
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOc5J-0008JF-JY
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOc5H-0003QL-M2
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:03:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33253
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOc5H-0003Pw-IW
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586934222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umqeUTIUC7tjpv2kxJkFd+h85fpLXwwGK3WPzkLot5M=;
 b=CIcPMuyBs0FapcDo/C9xE0G37hrE5Bibek0E6voW27kWAiit4sPlgGpQjHAB1RYoGiCrpE
 l8O/8sH4mRNQn09Wwvvz8tSXJbDSBYTJMsWSulnJ4oFS3wN3ZQjc81kjGc6CTJTbZ6N7Zn
 7jTjwLPD/grQatAcpt1vdeyS+tyLwzM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-RLOZrsUMMbWVRRq2h1-Jvg-1; Wed, 15 Apr 2020 03:03:40 -0400
X-MC-Unique: RLOZrsUMMbWVRRq2h1-Jvg-1
Received: by mail-wr1-f72.google.com with SMTP id r17so10108178wrg.19
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 00:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=67Jt2F68UY1Uql47K+hEgAPxcnn5LHCbfOX7OShW8/Q=;
 b=Vy2Vl8nxODVzMWRdyi6OjwmWpAZDFwxadfjb7omP2SSwTWlp/g6/uuymMi7M1jRahy
 FXhmcDjsV6H/H7pgKegPK7IEY3ixcIj/GV4pF4Tke6cA45GVKnSp+NK2jLCJlSi6BT2S
 7POdBBm873GNfIV8JFJKhhtvX3Gj9MPETAb/5cZQRa/liIzpz0qtGHzmnoNpAh28CGt+
 zVig/B6NQc80nofx3tqmlT42YFJ5WTRTdFDSkuCxKIldapq8QKX9MB7CDHIpdsKoZdD0
 XAyB5mnVFYv2RmppvQsmtMnH9ogZ2uLe15eSu6rkjpomG+v3QqqUNsWfCQU99ovLeBPr
 uWkA==
X-Gm-Message-State: AGi0PuYRsWdIQxQF+c2974ZpmJLx+8TEnSOWiso8yvYi9WtsYDLX75Jt
 gLnfVS7v0k5hs1Ya0B64L/GDxKnYdQvZBHVdjcwfdwc1VQIBx/CKn9S7vqOhOxDLk9tS7DeNGry
 Ns1+76hQ+By33UXg=
X-Received: by 2002:a1c:6503:: with SMTP id z3mr3791412wmb.92.1586934219008;
 Wed, 15 Apr 2020 00:03:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLt7vb050T4a+40XwBVRtsJF5Mgx2odC7GhLZYSYVOLs8isLAvXse0Kopil/fyiqJY+6XaSeA==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr3791391wmb.92.1586934218833;
 Wed, 15 Apr 2020 00:03:38 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id v16sm21571493wml.30.2020.04.15.00.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 00:03:38 -0700 (PDT)
Subject: Re: [PATCH v7 06/48] nvme: refactor nvme_addr_read
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
References: <20200415055140.466900-1-its@irrelevant.dk>
 <20200415055140.466900-7-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <08ae8e87-1bfc-85a2-edac-f704fed4fb3b@redhat.com>
Date: Wed, 15 Apr 2020 09:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200415055140.466900-7-its@irrelevant.dk>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/20 7:50 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Pull the controller memory buffer check to its own function. The check
> will be used on its own in later patches.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Acked-by: Keith Busch <kbusch@kernel.org>
> ---
>   hw/block/nvme.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 622103c42d0a..02d3dde90842 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -52,14 +52,22 @@
>  =20
>   static void nvme_process_sq(void *opaque);
>  =20
> +static inline bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)

'inline' not really necessary here.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +{
> +    hwaddr low =3D n->ctrl_mem.addr;
> +    hwaddr hi  =3D n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
> +
> +    return addr >=3D low && addr < hi;
> +}
> +
>   static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int siz=
e)
>   {
> -    if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
> -                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size=
))) {
> +    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
>           memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
> -    } else {
> -        pci_dma_read(&n->parent_obj, addr, buf, size);
> +        return;
>       }
> +
> +    pci_dma_read(&n->parent_obj, addr, buf, size);
>   }
>  =20
>   static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
>=20


