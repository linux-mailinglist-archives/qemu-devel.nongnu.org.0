Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2F6D4D51
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:13:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMnV-0003h9-0x; Mon, 03 Apr 2023 12:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pjMnS-0003fD-AF
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:12:42 -0400
Received: from mailout1.w2.samsung.com ([211.189.100.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pjMnO-0004Mc-NB
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:12:41 -0400
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20230403161231usoutp019abffc54d20751eaae05887fd0138bb3~SeLoZtR2H0296002960usoutp01m;
 Mon,  3 Apr 2023 16:12:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20230403161231usoutp019abffc54d20751eaae05887fd0138bb3~SeLoZtR2H0296002960usoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680538351;
 bh=/89FKJn8O+K4M+L/t8O6QMIgGK3omS9+L2WS6HKm9Kw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=QwuHOfRP+QXYuNOWtfZ9y5xOU4EvZLNoDLExrQgjKA/g2Dyg9fGIYk43UJh5jcc66
 uuLoYLpb9lwftXOrkwkhioqcbfn/boUb/8q52qH3GVSfErbe7THfuksgxWrU8SBCkp
 i9B7jArtkHJXp6x9MwnhP1M3akM+In4HU7UQnPh0=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230403161231uscas1p286d3129777f4c6da34a018cfe619017b~SeLoE4bzF1952319523uscas1p2y;
 Mon,  3 Apr 2023 16:12:31 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id 4B.20.09670.FEAFA246; Mon, 
 3 Apr 2023 12:12:31 -0400 (EDT)
Received: from ussmgxs3new.samsung.com (u92.gpu85.samsung.co.kr
 [203.254.195.92]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230403161230uscas1p2012cc71d5d95b6f44be42031ba0d90c4~SeLntqx081951919519uscas1p20;
 Mon,  3 Apr 2023 16:12:30 +0000 (GMT)
X-AuditID: cbfec36f-6f9ff700000025c6-0c-642afaef7c78
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs3new.samsung.com (USCPEXMTA) with SMTP id 57.80.09515.EEAFA246; Mon, 
 3 Apr 2023 12:12:30 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 3 Apr 2023 09:12:30 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 3 Apr 2023 09:12:30 -0700
From: Fan Ni <fan.ni@samsung.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Maverickk 78 <maverickk1778@gmail.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, qemu-devel <qemu-devel@nongnu.org>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: Re: property 'cxl-type3.size' not found
Thread-Topic: property 'cxl-type3.size' not found
Thread-Index: AQHZZhAYabuU7RRa+ke6FPcUtNczWK8aN2EA
Date: Mon, 3 Apr 2023 16:12:30 +0000
Message-ID: <20230403161221.GA1765179@bgt-140510-bm03>
In-Reply-To: <1a4048c2-b9cc-fe3c-cbba-64fe84f78827@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9106B8DF3F43CF4DB5E10EDED975CA73@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djXc7rvf2mlGOw6x2exauE1Nov+jXvY
 LP7/esVqsWaFsMXx3h0sDqweO2fdZfdoOfKW1ePOtT1sHk+ubWbyeL/vKlsAaxSXTUpqTmZZ
 apG+XQJXxrp3D9kLXktWfF04i6WB8aRYFyMnh4SAicT5v6+Zuhi5OIQEVjJKtJx7zQbhtDJJ
 rNt9gx2mqrWtDapqLaPEmp3XGCGcj4wS76Y9YoVwljJKdE89wAzSwiagKLGvazsbiC0i4Cgx
 q2cTWBEzyJKdH/aygiSEBQwk/j+8AFTEAVRkKPHpeDiEaSSx4lkQSAWLgIrEuhWLGEFsXgEz
 iX8Pr7GA2JwCdhL33y8DizMKiEl8P7WGCcRmFhCXuPVkPhPE1YISi2bvYYawxST+7XrIBmEr
 Stz//pIdol5P4sbUKWwQtp3Ew7bfjBC2tsSyha+ZIfYKSpyc+YQFoldS4uCKGywgr0gIXOCQ
 WPG1C2qoi8SL1e1QRdIS09dcZgH5RUIgWWLVRy6IcI7E/CVboEqsJRb+Wc80gVFlFpKzZyE5
 aRaSk2YhOWkWkpMWMLKuYhQvLS7OTU8tNspLLdcrTswtLs1L10vOz93ECExFp/8dzt/BeP3W
 R71DjEwcjIcYJTiYlUR4Vbu0UoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzGtqeTBYSSE8sSc1O
 TS1ILYLJMnFwSjUwSVn8juy4u2M/21523at59esDPGNVlT5ytx7R/GWms891oWHwlNWSqb1l
 y5aYTajNmJyhbKf0fGkW651tB6eKKh5xM2O2VfYXmS0+j4tnW0G9Att8+W/huc3mJTwWcvw3
 E4WW/wxMPnbkTZTD9w9SXH4u67/oFwbZVSxN2VqsGC4mwLS6TatvXssbz8o1ZZJSb8VdvjKL
 hckIly9KV4s7saYhmrN5zrdcswWWG36xf13T1baZxXBfrm13/bRI+acWYl9vrNAo03AzVU/X
 lAn4vfJeutHJy7eUSp+vKxer3diSzFt4r/AVX8MSj42vd3zId05as5Wj8LeDjJ+2jkHXx28G
 6+cY3nzRvfblEyWW4oxEQy3mouJEAEcOaPy0AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWS2cA0SffdL60Ug8YlRharFl5js+jfuIfN
 4v+vV6wWa1YIWxzv3cHiwOqxc9Zddo+WI29ZPe5c28Pm8eTaZiaP9/uusgWwRnHZpKTmZJal
 FunbJXBlrHv3kL3gtWTF14WzWBoYT4p1MXJySAiYSLS2tTF1MXJxCAmsZpRYeewfM4TzkVFi
 1eK3bBDOUkaJjz3nmUBa2AQUJfZ1bWcDsUUEHCVm9WxiBSliFljJKLHzw15WkISwgIHE/4cX
 gIo4gIoMJT4dD4cwjSRWPAsCqWARUJFYt2IRI4jNK2Am8e/hNRaIXTcYJd6dWM8OkuAUsJO4
 /34ZWBGjgJjE91NrwG5gFhCXuPVkPhPECwISS/acZ4awRSVePv7HCmErStz//pIdol5P4sbU
 KWwQtp3Ew7bfjBC2tsSyha+ZIY4QlDg58wkLRK+kxMEVN1gmMErMQrJuFpJRs5CMmoVk1Cwk
 oxYwsq5iFC8tLs5Nryg2zkst1ytOzC0uzUvXS87P3cQIjOTT/w7H7GC8d+uj3iFGJg7GQ4wS
 HMxKIryqXVopQrwpiZVVqUX58UWlOanFhxilOViUxHk9YifGCwmkJ5akZqemFqQWwWSZODil
 GphOeK961xru/OVupG9Mpqfl46U3s+TFbGqNFE+tmcO26FdO+8P5x73Nrj/jnHihJu3VlFPb
 71iL/Spf8SNfebpsRWv3264Ngi/2Bp55Xnn04R7WH74/N7NP+/2KW6l+1Xk5y5quX4+/8q/Z
 dCfG2+rKoiqF3llHV62w+M4zT6R9A6/n2Q8l8U+Cz3Cbu/5w/nau6rVoeXjTVr6Xn4T2mWlf
 q7T7rNEp0xjVd0Atb8Gz1dcKqveLS7hVMF1oPZq8QPXcUfugr1csooPndR8JUGCbdqD+cmHI
 SVUhSSYdsfVMdiZOzkxVNw5yX75QFRDPqff/9IdyF/NnEla+1077soj+5TQztynrmW2gkz5n
 8gElluKMREMt5qLiRABKuoUoUwMAAA==
X-CMS-MailID: 20230403161230uscas1p2012cc71d5d95b6f44be42031ba0d90c4
CMS-TYPE: 301P
X-CMS-RootMailID: 20230403093826uscas1p2ba12423655f742977ebd458e3e8f6328
References: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
 <CGME20230403093826uscas1p2ba12423655f742977ebd458e3e8f6328@uscas1p2.samsung.com>
 <1a4048c2-b9cc-fe3c-cbba-64fe84f78827@linaro.org>
Received-SPF: pass client-ip=211.189.100.11; envelope-from=fan.ni@samsung.com;
 helo=mailout1.w2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Apr 03, 2023 at 11:38:22AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing CXL maintainers.
>=20
> On 3/4/23 11:04, Maverickk 78 wrote:
> > Hello,
> >=20
> > I am trying qemu-system-aarch64 & cxl configuration listed in
> >=20
> > https://urldefense.com/v3/__https://www.qemu.org/docs/master/system/dev=
ices/cxl.html__;!!EwVzqGoTKBqv-0DWAJBm!RhlUw_6f1jcigdN0SxPK7vXwp0-XgEXVUUvB=
pQ4M4D0ourDVGBkVXgVapWI3nQuQcq-73-XqXFBIGMz1$  <https://urldefense.com/v3/_=
_https://www.qemu.org/docs/master/system/devices/cxl.html__;!!EwVzqGoTKBqv-=
0DWAJBm!RhlUw_6f1jcigdN0SxPK7vXwp0-XgEXVUUvBpQ4M4D0ourDVGBkVXgVapWI3nQuQcq-=
73-XqXFBIGMz1$
> > >
> >=20
> > qemu-system-aarch64 -M virt,gic-version=3D3,cxl=3Don -m 4g,maxmem=3D8G,=
slots=3D8
> > -cpu max \
> > ...
> > -object memory-backend-file,id=3Dcxl-mem0,share=3Don,mem-path=3D/tmp/cx=
ltest.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/cx=
ltest1.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-mem2,share=3Don,mem-path=3D/tmp/cx=
ltest2.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-mem3,share=3Don,mem-path=3D/tmp/cx=
ltest3.raw,size=3D256M
> > \
> > -object
> > memory-backend-file,id=3Dcxl-lsa0,share=3Don,mem-path=3D/tmp/lsa0.raw,s=
ize=3D256M
> > \
> > -object
> > memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp/lsa1.raw,s=
ize=3D256M
> > \
> > -object
> > memory-backend-file,id=3Dcxl-lsa2,share=3Don,mem-path=3D/tmp/lsa2.raw,s=
ize=3D256M
> > \
> > -object
> > memory-backend-file,id=3Dcxl-lsa3,share=3Don,mem-path=3D/tmp/lsa3.raw,s=
ize=3D256M
> > \
> > -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
> > -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port0,chassis=3D0,slot=3D=
0 \
> > -device cxl-rp,port=3D1,bus=3Dcxl.1,id=3Droot_port1,chassis=3D0,slot=3D=
1 \
> > -device cxl-upstream,bus=3Droot_port0,id=3Dus0 \
> > -device cxl-downstream,port=3D0,bus=3Dus0,id=3Dswport0,chassis=3D0,slot=
=3D4 \
> > -device
> > cxl-type3,bus=3Dswport0,memdev=3Dcxl-mem0,lsa=3Dcxl-lsa0,id=3Dcxl-pmem0=
,size=3D256M
> > \
> > -device cxl-downstream,port=3D1,bus=3Dus0,id=3Dswport1,chassis=3D0,slot=
=3D5 \
> > -device
> > cxl-type3,bus=3Dswport1,memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1,id=3Dcxl-pmem1=
,size=3D256M
> > \
> > -device cxl-downstream,port=3D2,bus=3Dus0,id=3Dswport2,chassis=3D0,slot=
=3D6 \
> > -device
> > cxl-type3,bus=3Dswport2,memdev=3Dcxl-mem2,lsa=3Dcxl-lsa2,id=3Dcxl-pmem2=
,size=3D256M
> > \
> > -device cxl-downstream,port=3D3,bus=3Dus0,id=3Dswport3,chassis=3D0,slot=
=3D7 \
> > -device
> > cxl-type3,bus=3Dswport3,memdev=3Dcxl-mem3,lsa=3Dcxl-lsa3,id=3Dcxl-pmem3=
,size=3D256M
> > \
> > -M cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.size=3D4G,cxl-fmw.0.interleave=
-granularity=3D4k
> >=20
> >=20
> >=20
> > I hit this following error
> > qemu-system-aarch64: -device
> > cxl-type3,bus=3Dswport0,memdev=3Dcxl-mem0,lsa=3Dcxl-lsa0,id=3Dcxl-pmem0=
,size=3D256M:
> > property 'cxl-type3.size' not found
> >=20
check cxl_type3.c where you can find the properties supported by the
device. 'size' is not needed and it will take the size of cxl-pmem0.

Fan
> >=20
> > Any clue if I am missing something?
> >=20
> >=20
> > Regards
> >=20
> >=20
> >=20
> =

