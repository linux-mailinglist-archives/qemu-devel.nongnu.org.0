Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C93A67C6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:25:04 +0200 (CEST)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmaN-0004hD-9Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1lsmYx-0003pW-Ip
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:23:35 -0400
Received: from mout.gmx.net ([212.227.17.22]:47469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1lsmYu-0006OP-Lj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623677002;
 bh=J8YPL59ExGjMeSHR/oqwGKpbuJnLyuyOEsK3hnmMrKA=;
 h=X-UI-Sender-Class:Subject:To:References:From:Cc:Date:In-Reply-To;
 b=WMod7HQo2YXamvp0cFBGrYe6Upn+r/LtBSWUz8dq/kBEnuhhpKfvFjwDoaQuo3gxb
 WZO9t1yULIPqLIBbnFqnJMPSeeF5AjJTGUN8X7oeMDLG2UGClVETOgnYxsf63nVIq2
 i4T+YtpijcKU65zQuBiTZbZ32IkeO/EU11Z4cXx8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.188.47] ([88.130.62.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1m75ug2qQm-00GXjn; Mon, 14
 Jun 2021 15:23:22 +0200
Subject: Re: [PATCH] vga: Allow writing VBE_DISPI_ID5 to ID register
To: qemu-devel@nongnu.org
References: <20210607115303.228659-1-denniswoelfing@gmx.de>
From: =?UTF-8?Q?Dennis_W=c3=b6lfing?= <denniswoelfing@gmx.de>
Message-ID: <5079879c-942b-1f6f-0306-c64a09708108@gmx.de>
Date: Mon, 14 Jun 2021 15:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607115303.228659-1-denniswoelfing@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mIcVr90lGBUxN2lSbeHtueFBPf/G+WSbQl27QhI91SHY8S+KGMf
 3bRev8/bNzNmEuC63CnrLwtya2VrSJY9h1XGKVland7rjt+EKcLudmHQLvKs2Ddh8Vfe1Er
 xbaXUeurn5zzTPWnT2zqwrBQfRL66CwljtUcg2piPdQagHjMJggaOB2pU05i81wcvGmY+px
 8tu8KNAALguRwbpUWTjKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rMIexSCXNaU=:1mhLHJJYbEBytO8aHLGeYb
 /E3gaTSKuvVE3BJwLY12yhWmtHFZ3JBluYZ/NLojTnhbdwpF7/i69Q3luWloLDDEp2+wnMIEe
 QTVe3980/DATknW1+bVhs7IPjR3Npt1BhlqnWKCnREHzZwZlz5YZjx+XAK65qP/9hzWpLRkkg
 /Mz3vfkRvdYTOLvwlWfmR0bwhrm0Yp5EYKKp1t/E1rVzkI56sH8JcYsjnUNlFHPUU1z6gXHTo
 DZKWKr5fi4/EM2LzOVFhoy7vDI3SksE7oZId86Iv+SGPBYnEWbkh7lb6ziAV3uBjxSWaYeNpf
 KL0NFO2agKeq5c41ogu1XFzwLfew3V7CNqwXrLd+RBa0bodKOgSEtZoi8as6lXiHdGfh1Lq/T
 porN1xwSHAMA7S9zcnFRTyXSA3GMKgWTu9b1EDgpqNoine18jn1cV82w2pQQ3OuFa1uAKNTkQ
 zpt34o8OM3NsswtPQRkp3KUgchY09++hTCxDWvwskizaT+Nr1Fo+RdeUBoZ/DvgbYlqyrY+wQ
 ZNattO9NDdhJ0pl9mi/umXXVZWobLfRom7o67mtJbLSb0wXwRF3sZZucvjwt9RkIOuiNzRaKS
 ek15nScuPk1Bdl5+UZPiz91mGgSd3vBDm4kMu3FJh79Xnw+iUo1TPzhq4wgu+uGb1WWBisIps
 FdTdeesx5Cbgi2VtIrWnQzEG7pAYArw7rS1RMYFsLiEHfK6dm+7BzOavzh3uosu9YObVD4GYa
 TkPWP4day1pWTxmdroiDgQkQod3uNpmlJHf2FQlkpwRlb1ZNTIY+GlFStMiDMzm+8BTAe35R2
 4w6l9lOZCpKT01YJr1UVvAmhdyr549qyxC9Q5oehaFfvVPQ5ExuQl21FK75aODfZqz5I+mYXe
 hNk+1dJWlwZR6ZCu0GGuHFyG2CxkEO0xgQVVkvVf77JvA2Z506jwkPP1JejyhriCwQYp01k89
 fS4BTrJrCFkF5tOK7W9egLDgpdSe4Vz6Y3S8BUIb65WF3LiMTf+oOPoBQROJkOmQOEO0hWnV7
 X1eXG9WwMYVcAPGqjhogPuZsatpPey3ZGRkuBD7xCDpmtT9Oay3NayCoZZHIQsFqV0+5DN4Hm
 v9AIFbNTQwTHs4Fshyg1H/ILOedWONKBUwakBZc0v3XmPeT8aI8BpAPDA==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping
https://lore.kernel.org/qemu-devel/20210607115303.228659-1-denniswoelfing@=
gmx.de/

On 07.06.21 13:53, Dennis W=C3=B6lfing wrote:
> The highest VBE_DISPI_INDEX_ID version supported by QEMU is
> VBE_DISPI_ID5. But currently QEMU only allows writing values up to
> VBE_DISPI_ID4 to the VBE_DISPI_INDEX_ID register.
>
> As a result of this when a lower version is written to this register and
> later VBE_DISPI_ID5 is written back, reads from the register will
> continue to report the lower version.
>
> Indeed SeaBIOS is doing that during VGA initialization which causes
> guests to always read VBE_DISPI_ID0 instead of the correct version.
>
> Signed-off-by: Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
> ---
>   hw/display/vga.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 28a90e30d0..9d1f66af40 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -752,7 +752,8 @@ void vbe_ioport_write_data(void *opaque, uint32_t ad=
dr, uint32_t val)
>                   val =3D=3D VBE_DISPI_ID1 ||
>                   val =3D=3D VBE_DISPI_ID2 ||
>                   val =3D=3D VBE_DISPI_ID3 ||
> -                val =3D=3D VBE_DISPI_ID4) {
> +                val =3D=3D VBE_DISPI_ID4 ||
> +                val =3D=3D VBE_DISPI_ID5) {
>                   s->vbe_regs[s->vbe_index] =3D val;
>               }
>               break;
> --
> 2.31.1
>

