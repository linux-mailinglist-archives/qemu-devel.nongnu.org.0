Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2676B9C43
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7u8-0001rb-Rn; Tue, 14 Mar 2023 12:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pc7u2-0001hc-Ub
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:53:35 -0400
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pc7tz-0003V8-9t
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:53:34 -0400
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230314165325usoutp020b3ce82ddc99201b0df1e34870c9cc04~MV1oKeG801871818718usoutp02B;
 Tue, 14 Mar 2023 16:53:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230314165325usoutp020b3ce82ddc99201b0df1e34870c9cc04~MV1oKeG801871818718usoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678812805;
 bh=oTnI488/uLD5F5rpsHGerOJAldgDGwy39PbLqwNfOfY=;
 h=From:To:CC:Subject:Date:References:From;
 b=KWB4KIryrr2+dmcr2FQoAKTx584wneZGuFNxwQsBfHkgjnouaTJtE87BxQzgAmmbe
 XBT+q+jLz5AjT/co2xWR844CxqaUvF6xR95NV2+uInSkU1B5pq6XthziRdgJ37l5oT
 4uX1iY53wKuDepQz9OZeB3HOCtNGAt1hrXHBs3Lk=
Received: from ussmges1new.samsung.com (u109.gpu85.samsung.co.kr
 [203.254.195.109]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230314165324uscas1p1e8db76cb3eab576f4f0c37f739f7fc1f~MV1nyjQGR1197511975uscas1p10;
 Tue, 14 Mar 2023 16:53:24 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges1new.samsung.com (USCPEMTA) with SMTP id 3E.4F.06976.486A0146; Tue,
 14 Mar 2023 12:53:24 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230314165324uscas1p231d1f8aeceb1b8c118abb76e915e7614~MV1neSnBU0689406894uscas1p2z;
 Tue, 14 Mar 2023 16:53:24 +0000 (GMT)
X-AuditID: cbfec36d-d99ff70000011b40-b3-6410a684cf75
Received: from SSI-EX3.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 48.CF.17110.486A0146; Tue,
 14 Mar 2023 12:53:24 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX3.ssi.samsung.com (105.128.2.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Tue, 14 Mar 2023 09:53:23 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Tue,
 14 Mar 2023 09:53:23 -0700
From: Fan Ni <fan.ni@samsung.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "alison.schofield@intel.com" <alison.schofield@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>, Adam Manzanares
 <a.manzanares@samsung.com>, "bwidawsk@kernel.org" <bwidawsk@kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, Fan Ni <fan.ni@samsung.com>
Subject: [qemu PATCH] hw/cxl/cxl_device: Replace magic number in CXLError
 definition
Thread-Topic: [qemu PATCH] hw/cxl/cxl_device: Replace magic number in
 CXLError definition
Thread-Index: AQHZVpV9MBCR+xP5UUawIvAUv5LpJQ==
Date: Tue, 14 Mar 2023 16:53:23 +0000
Message-ID: <20230314165317.1550986-1-fan.ni@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djX87otywRSDCZtNra4+/gCm0Xz5MWM
 Ft3nNzBarL65htGioekRi0XL7vdMFvufPmexWLXwGpvF+VmnWCyO9+5gceDyuDB5AqvH4gZX
 j5Yjb4GMPS+ZPDat6mTz2PjxP7vHk2ubmTymzq73+LxJLoAzissmJTUnsyy1SN8ugStj9xnZ
 ghesFf/mv2BtYHzL0sXIySEhYCLxcvMKti5GLg4hgZWMEheWtTFBOK1MEl/3zYerenVqMitE
 Yi2jxIQNd9lBEkICnxglvr20hEgsY5SY9245E0iCTUBRYl/XdjYQW0TAWOLY4SXMIEXMArtY
 JD7OuMEMkhAWCJM4c6CFBaIoWmLqisvMELaexOLbZ1lBbBYBVYmj/euBBnFw8ApYSvRs1QcJ
 MwqISXw/tQZsF7OAuMStJ/OZIC4VlFg0ew8zhC0m8W/XQzYIW1Hi/veX7BD1ehI3pk5hg7C1
 JZYtfA1WzwvUe3LmE6iPJSUOrrjBAnKzhMATDomDTSsZIRIuEhN//WaHsKUl/t5dxgRym4RA
 ssSqj1wQ4RyJ+Uu2QM2xllj4Zz3UnXwSf389YoQo55XoaBOawKg0C8kHs5BcNwvJdbOQXLeA
 kWUVo3hpcXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYBI7/e9w7g7GHbc+6h1iZOJgPMQowcGs
 JMIbziKQIsSbklhZlVqUH19UmpNafIhRmoNFSZzX0PZkspBAemJJanZqakFqEUyWiYNTqoGp
 I6T6hpZJ1fxyjXRrJ93jL1fJbCj6cNxmZfqTJzsvC1nYyIUcyT6pzuhq0Pf+WuZe386GuspX
 9rNPl7LYK7DPblbIOevi/0lgmm3Bnak+k5Imh2Vsn+mzfIe845cWtRSbpxdXPr3UfPGHvU2K
 FdOM25Hljx9t3H6/eMbq1uN5Mi+/rLp4LOHDqUP+YbvP159Ru3lMUfX7iZwHDlLH/G1vqkgE
 2lYcvh5g8dcj2EnRx2/KVv32hO5oNYVI8azFjY333xQ2/P9ScqTJ2UHuR+XUivSX8wMOpfnJ
 KUUn126dMOn0k7cVxrfm+wr1dz1t+Nnf+FSxXXMrx8W3MyarSHJ2d+kHn35lsYDBpOzKby4l
 luKMREMt5qLiRAD4hmNp0QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsWS2cA0SbdlmUCKQe8aOYu7jy+wWTRPXsxo
 0X1+A6PF6ptrGC0amh6xWLTsfs9ksf/pcxaLVQuvsVmcn3WKxeJ47w4WBy6PC5MnsHosbnD1
 aDnyFsjY85LJY9OqTjaPjR//s3s8ubaZyWPq7HqPz5vkAjijuGxSUnMyy1KL9O0SuDJ2n5Et
 eMFa8W/+C9YGxrcsXYycHBICJhKvTk1m7WLk4hASWM0osXtvGxuE84lRYsn8PywQzjJGiYeX
 loO1sAkoSuzr2s4GYosIGEscO7yEGaSIWWAXi8THGTeYQRLCAmESZw60sEAURUtsn3KXGcLW
 k1h8+ywriM0ioCpxtH890CAODl4BS4merfogYUYBMYnvp9YwgdjMAuISt57MZ4I4VUBiyZ7z
 zBC2qMTLx/9YIWxFifvfX7JD1OtJ3Jg6hQ3C1pZYtvA1WD2vgKDEyZlPoF6WlDi44gbLBEbR
 WUhWzELSPgtJ+ywk7QsYWVYxipcWF+emVxQb5aWW6xUn5haX5qXrJefnbmIERu/pf4ejdzDe
 vvVR7xAjEwfjIUYJDmYlEd5wFoEUId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwvoybGCwmkJ5ak
 ZqemFqQWwWSZODilGphqrsaqvSq6aZrvfXBGnaNeX0TArp3nNi/6kPlqxrk9Fidu/r68V0vx
 xINFN049ZHr1r07ssL7sk/gz6/LeGf6caL3+9i0ZibmRj19PeNd0487KKT/N359lz3r91Y7D
 ulnff5OB3tUfe4qDTyY9EUmfYuLStSRtw/7ipPX5E88/WKRltFLJJ9j167kwDyEW7v9lHgt+
 8d7ND1VIZt7z8691F/cjlzN7NZyu8m27c+6c07w10/YyzRPbsdG6fh5PWfppl7OP9lw6FDJN
 +8X1YJlXGzmMwwrOHPu/78yTB5n3xX6KFosJK4RWnX3I+kC46wxb4x7NhP+z7/1eGzn9sffq
 vN37dmnMuL/1SECTtdev6W+UWIozEg21mIuKEwEi4dBhTQMAAA==
X-CMS-MailID: 20230314165324uscas1p231d1f8aeceb1b8c118abb76e915e7614
CMS-TYPE: 301P
X-CMS-RootMailID: 20230314165324uscas1p231d1f8aeceb1b8c118abb76e915e7614
References: <CGME20230314165324uscas1p231d1f8aeceb1b8c118abb76e915e7614@uscas1p2.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Replace the magic number 32 with CXL_RAS_ERR_HEADER_NUM for better code
readability and maintainability.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 include/hw/cxl/cxl_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index d589f78202..34fde62eac 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -235,7 +235,7 @@ REG64(CXL_MEM_DEV_STS, 0)
 typedef struct CXLError {
     QTAILQ_ENTRY(CXLError) node;
     int type; /* Error code as per FE definition */
-    uint32_t header[32];
+    uint32_t header[CXL_RAS_ERR_HEADER_NUM];
 } CXLError;
=20
 typedef QTAILQ_HEAD(, CXLError) CXLErrorList;
--=20
2.25.1

