Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF396165F72
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 15:07:43 +0100 (CET)
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4mUQ-00021d-Nj
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 09:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4mTM-00011E-JL
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:06:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4mTL-0003DL-FW
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:06:36 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:59161)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4mTI-0003AX-WD; Thu, 20 Feb 2020 09:06:33 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOAFl-1ipiYE0tdB-00OZA1; Thu, 20 Feb 2020 15:06:19 +0100
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org
References: <20200220134103.26224-1-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v2] test-vmstate: Fix memleaks in test_load_qlist
Message-ID: <d1b874a5-f754-b3af-1ff4-a30ebc3d1a26@vivier.eu>
Date: Thu, 20 Feb 2020 15:06:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220134103.26224-1-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xs6F7yo6VENbHzm543CV9AZBqDabYtn2Iz9YlfFe1lVvCuYZC0q
 pZXndCYYFXy5j0Lo83FSusZqwk8BP2GwO3HdAkRqUdbVE3BjMSTuHxG1qHkhjoSDc80r278
 sdhu11n727sEZfcvGKipt7w7mpxOsOXEcit7iM29RK/1fFg0Dcl1O47F+hnMoetdzGcvSxA
 wnbmyUxJN1u8FqOoxubvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/0Giy/QnkZw=:ZStS4A58gcbE+cRf9us4nS
 Sjj0KxPzTOawCUUdRhs+wnxteKmxmkEkbZm73bodG/z/dKQGIcLkqXRkOShjKtsWdHdjeCIZO
 5d4mlk02MkSglxry58zJ7zhQPLctmwrzcGNQRaTSd2hLZP0AVrI1t3kvvIHRNWVfiHgtl9vZA
 Va8FIZYOsxur/faJeQ6yvMdDhOmIJEzV6YFlbEIuaOVQE+JakUEL/EkClb9s6jk1aV5V//wyD
 TxgA8QzNz81iC4CVNLKyvr9Mbu403kHoaAphGeRTbZx+PqNY/lBjW3Yf88OeRfYA2sniaN/RV
 qgX6y5BzQ/4p+rOpchJXmeabDjG54yX/7+23tnof/3eeaMe1TtqoOhpIv1uBrZoxHBS45xTzq
 XbPGpI6JqKpNrv7k8Ry7pgk6CCvK/x8fz7Mc/GMqjZ1Pp7PaT29eiEwPkMDjugyuUNwCwLZvC
 vJzQu0gY2Cyovfer7zvDpQJr9hrDUhd6L7zsfyexARk9s8GsTiLQCv/1E7UD8AD+Ac17uhUcX
 1TCAeNcTKQvlgPYHZSdsIcZymDTNvBtzV357bnLJ7b0+a/VC4SGxoRszGVZSzZDxX/83i+qm0
 29KwHfw4jp82o2z3HRGxBu82WXQJX7SF+P6q7sCaHp/wuaQ7pTqeLG1dR+lJddPePv41ggaip
 ASmhJ2+7J4f0IblvzMiI9DXznvOMpEboZyRI+RVWzEEpECmR/g35dub/8GWnm4SCq1ZwYquAF
 cO3JKHgq3pnvSLYWsgkgH5D6QxQ5AneyBxvOg2YjB93Ve0QVEiSB65m6mkHwXOQQBxWD8/7s4
 YKyY0QnQBhdO1GW7XF+b51QPop172bpXzEMm10lvVXR2if2IvbG4+IuumGyJFe5FDY//+Gb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
Cc: thuth@redhat.com, ehabkost@redhat.com, quintela@redhat.com,
 qemu-trivial@nongnu.org, dgilbert@redhat.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/02/2020 à 14:41, kuhn.chenqun@huawei.com a écrit :
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> There is memleak in test_load_qlist().It's not a big deal,
> but test-vmstate will fail if sanitizers is enabled.
> 
> In addition, "ret" is written twice with the same value
>  in test_gtree_load_iommu().
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  tests/test-vmstate.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
> index cea363dd69..f7b3868881 100644
> --- a/tests/test-vmstate.c
> +++ b/tests/test-vmstate.c
> @@ -1241,7 +1241,6 @@ static void test_gtree_load_iommu(void)
>      TestGTreeIOMMU *orig_iommu = create_iommu();
>      QEMUFile *fsave, *fload;
>      char eof;
> -    int ret;
>  
>      fsave = open_test_file(true);
>      qemu_put_buffer(fsave, iommu_dump, sizeof(iommu_dump));
> @@ -1250,10 +1249,8 @@ static void test_gtree_load_iommu(void)
>  
>      fload = open_test_file(false);
>      vmstate_load_state(fload, &vmstate_iommu, dest_iommu, 1);
> -    ret = qemu_file_get_error(fload);
>      eof = qemu_get_byte(fload);
> -    ret = qemu_file_get_error(fload);
> -    g_assert(!ret);
> +    g_assert(!qemu_file_get_error(fload));/
>      g_assert_cmpint(orig_iommu->id, ==, dest_iommu->id);
>      g_assert_cmpint(eof, ==, QEMU_VM_EOF);
>  
> @@ -1395,6 +1392,7 @@ static void test_load_qlist(void)
>      compare_containers(orig_container, dest_container);
>      free_container(orig_container);
>      free_container(dest_container);
> +    qemu_fclose(fload);
>  }
>  
>  typedef struct TmpTestStruct {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

