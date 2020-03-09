Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63717E063
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 13:38:39 +0100 (CET)
Received: from localhost ([::1]:42421 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBHg6-0001HP-P5
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 08:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBHdl-0006uF-2k
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBHdk-00022t-03
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:36:13 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53317)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBHdj-0001xK-MM; Mon, 09 Mar 2020 08:36:11 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N79ly-1jPjXs1R2S-017ZJT; Mon, 09 Mar 2020 13:35:56 +0100
Subject: Re: [PATCH v3 07/12] display/exynos4210_fimd: Remove redundant
 statement in exynos4210_fimd_update()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
 <20200302130715.29440-9-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9ff0b76f-a316-505a-852d-15790c4e1e6f@vivier.eu>
Date: Mon, 9 Mar 2020 13:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302130715.29440-9-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SeAvPVup5wS5LFL7xFTfTQcfW7xVfP1S7aZICbv6ZLY5UvDLZi6
 /yJeP4r8tOwQmtrD+q3yDpBs7W1MyQqT4DL8a2DvFcmmLABJHKbTa0Xh2O5tXO/mmYlsUzT
 vvtzxpsna6H0yEZi4WuaNv9lKgQnUZKzLbb/0ed9+yH1AmhjuK5NypyHxlo7DMcvX195L7A
 zt3EDlq9HDRf0B02aeGSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iy17NU6q1BM=:ibdU/N8ginG99LjwWepUxB
 PMtC2KnIC6eWv7rW/zxZ4pHSkrHGNZsZ5q5iWqU7uIlqYg8/aQs/iWV6pAjB11wlFt7ZvnDXi
 0Os3a1vzWtL8PsVHeIgTiqLX/L2ojd899FDQPqzOemV+/cNJE4vxN3N5KNGX0/Fw4Xi10NCgh
 5DIbh96/PGoVRQGbkLpG1yxXJ9S90qlakZhV08Fv9+cEegcL8Ac7J3y0fxDLQPWFd90sVl+Ha
 FUt00kDamldbw8fNrlWInLmRouHQBgRAf/yF5ptiM0+ZV6VeLdro+rMJHG/18FnBuUfMaUpJi
 r2+g9hkAL3cTjeFbuLEgCwtMCkxW6mgE6lvpOp8cRwRmJCcc96NnC1hQI+3sVfuOU12JOs+fm
 VY0rBjMoUa0J6cCfxCzWdNm1iOd0h24NNsuzdZqv/QxGjWKWvw22NkKaL23v+433Z/WfXZuyT
 1h8K5jAtK4CkMEXYXm9ds1iU4e7SFesBA7n6btjNut/ni3E93hl8RRHCEr+Hqfadx+JKIuIQW
 SrRJ4xOX9fp/h/SWzk1zLkQlNlRVf2tU5pp6dppX7JVjS5ujNJSFDdc0vRdaCLXLep+9L8ibE
 fwHrJSmkdLoJIag+nJXJ63f4wdK4w09DZMuSKy7RmR/T+dwDGNDQ5tzybHt4UZBqdnTA8dndp
 t6ACf0x+IHpVtO8elUKmbFED8Xc6E0whUUj17gguo6Yym8nxWihEWxiSXXkboCA+09Aw/HQX6
 a9PTSqXOpQ8zEI3XNVYpJOQZ0XBo+xyjyKtdv9KRNdOMxeE3BDk2Xy/7pkrUM/g8pIwvBRFMU
 G5EDBhqS3GVW7sFpsZX5BzNu+p2L/FCO/vagPISf2rH3Hw9uQhYHcWAEA9J8lrqVZZrUHmo
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, peter.maydell@linaro.org,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/03/2020 à 14:07, Chen Qun a écrit :
> Clang static code analyzer show warning:
> hw/display/exynos4210_fimd.c:1313:17: warning: Value stored to 'is_dirty' is never read
>                 is_dirty = false;
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/exynos4210_fimd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index c1071ecd46..05d3265b76 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1310,7 +1310,6 @@ static void exynos4210_fimd_update(void *opaque)
>                  }
>                  host_fb_addr += inc_size;
>                  fb_line_addr += inc_size;
> -                is_dirty = false;
>              }
>              g_free(snap);
>              blend = true;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

