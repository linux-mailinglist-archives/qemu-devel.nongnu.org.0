Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B56A5241
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 05:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWrOC-0007Wh-VP; Mon, 27 Feb 2023 23:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pWrOB-0007WP-Bp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 23:14:55 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pWrO9-0002wf-QA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 23:14:55 -0500
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230228041453usoutp0255882cd362aba3a392ba40d3a3bb24b3~H4dV7dJuc1024110241usoutp02b;
 Tue, 28 Feb 2023 04:14:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230228041453usoutp0255882cd362aba3a392ba40d3a3bb24b3~H4dV7dJuc1024110241usoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1677557693;
 bh=ZknCFzYKebEQDxxUsyWUxlyxlk1O2ksEJZ8kmxaeM9c=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=F+267tgtKhnc69RL3KNalM3TdNAQhB4Fj/8xcEJUQfymW1e0oq6S59KRrddS1eAIU
 xGfrSpcQwhFEqhSn5eFv7oVcjmAa631Xfg2zvkNnVWJgSzI2IDL5odHDAxtIZGcGVa
 /huEy5tkDCvFYxxbuRzffVbAAOJT51n2lmPTzFBE=
Received: from ussmges1new.samsung.com (u109.gpu85.samsung.co.kr
 [203.254.195.109]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230228041453uscas1p266adeb86f5f460eaf08ec62bca5a75dc~H4dVvQdp51247412474uscas1p2O;
 Tue, 28 Feb 2023 04:14:53 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
 ussmges1new.samsung.com (USCPEMTA) with SMTP id 74.FB.06976.CBF7DF36; Mon,
 27 Feb 2023 23:14:52 -0500 (EST)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230228041451uscas1p19d32976b917a5b8eaf3cd9b413e911f0~H4dUtLSLS0424204242uscas1p1s;
 Tue, 28 Feb 2023 04:14:51 +0000 (GMT)
X-AuditID: cbfec36d-d99ff70000011b40-f1-63fd7fbcb60e
Received: from SSI-EX2.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 0B.E8.17110.BBF7DF36; Mon,
 27 Feb 2023 23:14:51 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX2.ssi.samsung.com (105.128.2.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 27 Feb 2023 20:14:51 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 27 Feb 2023 20:14:51 -0800
From: Fan Ni <fan.ni@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Michael Tsirkin
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v4 09/10] qemu/uuid: Add UUID static initializer
Thread-Topic: [PATCH v4 09/10] qemu/uuid: Add UUID static initializer
Thread-Index: AQHZSyszRQ9xpvKx/E6w+2kwgssCsA==
Date: Tue, 28 Feb 2023 04:14:50 +0000
Message-ID: <20230228041450.GI1339780@bgt-140510-bm03>
In-Reply-To: <20230206172816.8201-10-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A8BE30F3D1C82F4F9DE301740D01808B@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djXc7p76v8mGyyZYG7RPHkxo8WLP8+Z
 LPY/fc5isWrhNTaL87NOsVgc3niGyeL/r1esFmtWCFsc793B4sDpsXPWXXaPliNvWT0W73nJ
 5LFpVSebx51re9g8nlzbzOTxft9VNo/Pm+QCOKK4bFJSczLLUov07RK4Mtau6WIr2Mhf8X7K
 baYGxnbuLkZODgkBE4mFSw8zgthCAisZJT42+nUxcgHZrUwSd6Y+YYYpuvOzkxmiaC2jxLO9
 hRBFn4Aa3p1jhXCWMUqsudYDNopNQFFiX9d2NhBbRMBI4t2NSYwgRcwCX5gkpt7dyAKSEBZw
 kWjuP8gIUeQqMXf6eagGPYnGI7+ZQGwWAVWJ1mPNYHFeATOJSR8/A8U5ODgFHCX+3AZ7gVFA
 TOL7qTVg5cwC4hK3nsxngrhaUGLR7D1QH4hJ/Nv1kA3CVpS4//0lO0S9nsSNqVPYIGw7ib9n
 1kPN0ZZYtvA1M8RaQYmTM5+wQPRKShxccYMF5BcJgR8cEkc//INa5iKx5fFmdghbWuLv3WVg
 d0oIJEus+sgFEc6RmL9kC9Qca4mFf9YzTWBUmYXk7FlITpqF5KRZSE6aheSkBYysqxjFS4uL
 c9NTiw3zUsv1ihNzi0vz0vWS83M3MQKT2el/h3N3MO649VHvECMTB+MhRgkOZiUR3oW3/yQL
 8aYkVlalFuXHF5XmpBYfYpTmYFES5zW0PZksJJCeWJKanZpakFoEk2Xi4JRqYOKqLwp7rGez
 u0i7Ia3ZRXLJNO75Ssy+mipRrwuWqNZev57bzC7reFp/Ode8hM9OzG9Kbh1tf/BS1s993c+l
 0y/0Lp3Z8T7BScStrIrlk5i0sOiP1XE7BU5U6n5qSa1es+CPGaNcyevZDMWHnG9rHZ32YOra
 sslnFi6+abv6xfrXokaMr+rC4oXn9b7e/0nVcmlS5ppmX3l3VYV1V7arv+lctuFa0YWAX8Uq
 W0Pf6CivXfxtR/mtqKrkuDt/rSVPPztdzvIjk7P02gTG1iz/mE0ici/CCk3ZpXjPvTVJLv/5
 q9nYcRHrR9fwc/cmF4fVKXAv8Lpf/FHxAnvg07dzbuquXyZ3fsbp65bxSRxbWpRYijMSDbWY
 i4oTAfoAO3XVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWS2cA0SXd3/d9kg70rDCyaJy9mtHjx5zmT
 xf6nz1ksVi28xmZxftYpFovDG88wWfz/9YrVYs0KYYvjvTtYHDg9ds66y+7RcuQtq8fiPS+Z
 PDat6mTzuHNtD5vHk2ubmTze77vK5vF5k1wARxSXTUpqTmZZapG+XQJXxto1XWwFG/kr3k+5
 zdTA2M7dxcjJISFgInHnZydzFyMXh5DAakaJwz92skE4nxglFs1YBJVZxihx4u9aVpAWNgFF
 iX1d29lAbBEBI4l3NyYxghQxC3xhkrjx4TsLSEJYwEWiuf8gI0SRq8Tc6eehGvQkGo/8ZgKx
 WQRUJVqPNYPFeQXMJCZ9/AwWFxIok2ifcxwozsHBKeAo8ec22KmMAmIS30+tASthFhCXuPVk
 PhPECwISS/acZ4awRSVePv7HCmErStz//pIdol5P4sbUKWwQtp3E3zProeZoSyxb+JoZ4gRB
 iZMzn7BA9EpKHFxxg2UCo8QsJOtmIRk1C8moWUhGzUIyagEj6ypG8dLi4tz0imKjvNRyveLE
 3OLSvHS95PzcTYzAZHD63+HoHYy3b33UO8TIxMF4iFGCg1lJhHfh7T/JQrwpiZVVqUX58UWl
 OanFhxilOViUxHlfRk2MFxJITyxJzU5NLUgtgskycXBKNTCJmd0wYZ9d91LuZ6GcVlTncju+
 hsCpkr/CD6jE/T8jcedgyaajXHMrjuzjyks+zW6+3j1jAkvD4V79XaG/+AIufH5oqmN/9RBL
 9iMmowOuSfei7EVuBk3nKuqYkPRCUS1OP7hl/ilTt+C4y2sf7zI1U7ny7/5ZId9N/VX8Oi4F
 73etfDnL7/RsWefv/Vm70wri3koeUvCJWS/62sHPc99TqdQ/5z7c+bBz2vt3znzfg+ap5ERo
 +j+TrXl777t90b92d98jpjqP7IwshIS3lT7JCea2ci57+So01DBdWzllYbHYsnnibkxSlzI+
 96kxGnosamLlzM07nVIqYbGIUzjdUjjqgcnBPJ7UDvYfSizFGYmGWsxFxYkAWi1bGHUDAAA=
X-CMS-MailID: 20230228041451uscas1p19d32976b917a5b8eaf3cd9b413e911f0
CMS-TYPE: 301P
X-CMS-RootMailID: 20230228041451uscas1p19d32976b917a5b8eaf3cd9b413e911f0
References: <20230206172816.8201-1-Jonathan.Cameron@huawei.com>
 <20230206172816.8201-10-Jonathan.Cameron@huawei.com>
 <CGME20230228041451uscas1p19d32976b917a5b8eaf3cd9b413e911f0@uscas1p1.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 06, 2023 at 05:28:15PM +0000, Jonathan Cameron wrote:
> From: Ira Weiny <ira.weiny@intel.com>
>=20
> UUID's are defined as network byte order fields.  No static initializer
> was available for UUID's in their standard big endian format.
>=20
> Define a big endian initializer for UUIDs.
>=20
> Reviewed-by: Gregory Price <gregory.price@memverge.com>
> Tested-by: Gregory Price <gregory.price@memverge.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Fan Ni <fan.ni@samsung.com>

> ---
>  include/qemu/uuid.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
> index 9925febfa5..dc40ee1fc9 100644
> --- a/include/qemu/uuid.h
> +++ b/include/qemu/uuid.h
> @@ -61,6 +61,18 @@ typedef struct {
>      (clock_seq_hi_and_reserved), (clock_seq_low), (node0), (node1), (nod=
e2),\
>      (node3), (node4), (node5) }
> =20
> +/* Normal (network byte order) UUID */
> +#define UUID(time_low, time_mid, time_hi_and_version,                   =
 \
> +  clock_seq_hi_and_reserved, clock_seq_low, node0, node1, node2,        =
 \
> +  node3, node4, node5)                                                  =
 \
> +  { ((time_low) >> 24) & 0xff, ((time_low) >> 16) & 0xff,               =
 \
> +    ((time_low) >> 8) & 0xff, (time_low) & 0xff,                        =
 \
> +    ((time_mid) >> 8) & 0xff, (time_mid) & 0xff,                        =
 \
> +    ((time_hi_and_version) >> 8) & 0xff, (time_hi_and_version) & 0xff,  =
 \
> +    (clock_seq_hi_and_reserved), (clock_seq_low),                       =
 \
> +    (node0), (node1), (node2), (node3), (node4), (node5)                =
 \
> +  }
> +
>  #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
>                   "%02hhx%02hhx-%02hhx%02hhx-" \
>                   "%02hhx%02hhx-" \
> --=20
> 2.37.2
>=20
> =

