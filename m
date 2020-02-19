Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF4164079
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 10:34:34 +0100 (CET)
Received: from localhost ([::1]:47852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4LkY-0003Lf-1J
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 04:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4LjR-0002hv-Tr
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 04:33:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4LjQ-0000GK-U9
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 04:33:25 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:56397)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4LjQ-0000Ez-LR; Wed, 19 Feb 2020 04:33:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mj8eD-1jgjPi03hV-00fB4m; Wed, 19 Feb 2020 10:33:15 +0100
Subject: Re: [PATCH 1/3] hw/nios2:fix leak of fdevice tree blob
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 jcmvbkbc@gmail.com, crwulff@gmail.com, marex@denx.de,
 edgar.iglesias@gmail.com, david@gibson.dropbear.id.au
References: <20200218091154.21696-1-kuhn.chenqun@huawei.com>
 <20200218091154.21696-2-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dd5daa65-ce76-ec35-9c83-d9a14aec08b4@vivier.eu>
Date: Wed, 19 Feb 2020 10:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218091154.21696-2-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ALkcF1KhMko347O882/h6VAQqlnRjl3CAljYEk/l+rLdFFMVwa8
 PHthbMeI8rI7pEDuhPdQ2NL0NsoirEQqjrhoo6EpEnH19Nbv58UCZomDZQeFaQsolj8hY8F
 7+8q5BO2Ng8HL4uOhOYpr2EfCqmTwgAV9cxD8ToUCCJgfqlFGiAIKoM9iiGIWU1TEv0Jxf/
 kigDrFkA9gOAcMYyc4XJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ew5kKQk+hoY=:C54o6r24JXTFPMpQyLAV6g
 cZIdovNImw9KB0Wt6sE5kzrvwGvm17qn7YRMdg6YZIX9iRxwra8V+0onpEk8YCx0OSMM995DF
 XIaMIf2TcgUe6Z+d9eMtSO7FIfhJIazK99b27VwSyTRWOuhjKQ++vY4M41NKeQ9ZmJ2fCte8h
 EUY8qvZJ9wpSWCrxGUdua7P/Iec1aG9kSbcsZE3ceCNUNZofd51aGj/Xg2z8EaEzZgjrHPDSX
 AbTjOxoZEULjl6lYqNmY3/DT3wa7o1G8tIcft1XWBik/vzXkAaXYYjuwsdNcDZMokA2B66L9b
 8p/gFpWrBBy8B2nCTG4JKqWW+w8NCftnSlNfqs7AvhhM45q+j5vRET9ejgEr69IAC/4xKVLVa
 GDL2gpK4g4L6Jv/FgaNQnc2APg8R+SmHSCRvwsI7Yqwnc+htUS/M1VT+sTInuXrIq/YT716+h
 li2GkVSmdGaeUZ1fCldfkWNkAC/msfV+c0pm3IWbRP5YtsWzfXSZrivoCxNe3S8FhE+qIm+d3
 aCWjGT50W1baM0wWLCiWyH1ZvIYzRRZBtyNPGOaUKsCAQk7aPCkvPsuH4qAe+tWvJ0sqzU78m
 01CIfpcAmjPafNr00qbLpMVaSy0RWi2UDdHqc6Rle3xJho3is3dT/Fq3gyojJsnYjAi+fuZDp
 Ma/NRZzyHSFLwnpQE87X/Qc0BkSqBnsU0NzfILe/VbnhSz0vn0OQY07kWGlzVw0mdFQvoV3jK
 WAe2E4s6wJkkpghk+bezUvQMZIkqZl+bVk/m0FdW6opnU0oL+MIlMaiVszkgrVBd1GRBjYSOT
 +Dkdb3ry2P3xBo/9GjsGqcDIFgCxHXZHGk8UGZaz05v+BmwoIyyXqywVTrBeOOsrZA8vS/3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/02/2020 à 10:11, kuhn.chenqun@huawei.com a écrit :
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> The device tree blob returned by load_device_tree is malloced.
> We should free it after cpu_physical_memory_write().
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  hw/nios2/boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index 46b8349876..88224aa84c 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -109,6 +109,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
>      }
>  
>      cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
> +    g_free(fdt);
>      return fdt_size;
>  }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


