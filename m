Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DD3C8445
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 14:08:56 +0200 (CEST)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3dh9-0005xG-6c
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 08:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3df9-0003o2-Vn
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:06:52 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:53973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3df8-00047X-0s
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:06:51 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210714120638epoutp03633ff822829c14fe267b0bcca5c7a89d~Rptqgn78J1728017280epoutp036
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 12:06:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210714120638epoutp03633ff822829c14fe267b0bcca5c7a89d~Rptqgn78J1728017280epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626264398;
 bh=vZOBn7rX2iYlmm3qJIU0gSobNTWZp6iMarUwhXofvgE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tVpncV9Iy0bNRX2sqWwNBsYK/4T9AJk3H3TL6w2Nc/x2DNWf1uOW5hZNmza04sDTl
 dCKJOI3FzpwCrmF/JUP+Xoc4gF/MPc6//5XO1ZV1p+wR8CfQZpZOfjurVmKB3YOWFa
 z/fQoecGoVaa1F9Wxr/R/XpBpuwu24nGv26qPDhk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210714120637epcas5p1deb25f46ef23a606ce5613a5c172fa3f~RptpZhkyQ0964809648epcas5p1D;
 Wed, 14 Jul 2021 12:06:37 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.40.198]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4GPx7B1dWqz4x9Q2; Wed, 14 Jul
 2021 12:06:30 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A2.40.09452.643DEE06; Wed, 14 Jul 2021 21:06:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210714120156epcas5p212ae986c7e2ed4d30191ce8915304d2c~RppjvG-j81755417554epcas5p2e;
 Wed, 14 Jul 2021 12:01:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210714120156epsmtrp152a18c1f2f20f6d958b5c6acc0bdbc05~RppjtyhRe1846918469epsmtrp1K;
 Wed, 14 Jul 2021 12:01:56 +0000 (GMT)
X-AuditID: b6c32a4b-429ff700000024ec-9b-60eed346703b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.93.08289.332DEE06; Wed, 14 Jul 2021 21:01:56 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210714120150epsmtip1919aebb8dfa490dce61764762fa1f438~Rppe0zy8b2281022810epsmtip1c;
 Wed, 14 Jul 2021 12:01:50 +0000 (GMT)
Date: Wed, 14 Jul 2021 17:28:05 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 5/5] tests/qtest/nvme-test: add mmio read test
Message-ID: <20210714115805.GC28548@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210714060125.994882-6-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRmVeSWpSXmKPExsWy7bCmlq7b5XcJBscWsltc2X+e0WL/wW+s
 Ficb97BaTDp0jdFiycVUi08NUhbzbilb7N/2j9VizpkHLBa9y36zW8x6185mcbx3B4vF60n/
 WS1WHrNx4PP4ca6dzePcjvPsHptWdbJ53Lm2h83jybXNTB7v911l8+jbsooxgD0qxyYjNTEl
 tUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6GAlhbLEnFKgUEBi
 cbGSvp1NUX5pSapCRn5xia1SakFKToGhUYFecWJucWleul5yfq6VoYGBkSlQZUJORs/pq2wF
 lwQrms6uZWpgPM/XxcjJISFgItHw5yRzFyMXh5DAbkaJxateskI4nxglpu+cBeV8ZpS4/ng9
 K0xL35RzLBCJXUCJTZvZIJxXjBINB94ygVSxCKhK9N9cyghiswkYScx++wbMFhFQkXj6by9Y
 N7PAFWaJnV8/gDUIC7hKdDy6yw5i8wroS3zfDBHnFRCUODnzCQuIzSlgIbFn2Q5mEFtUQFni
 wLbjTCCDJAT2cEjsvb2dGeI+F4mnK/+zQdjCEq+Ob2GHsKUkXva3AdnsQHa1xOEiiNYORolj
 lzdAldtL/Hs2DexQZoFMiW2P/kC1ykpMPbWOCSLOJ9H7+wkTRJxXYsc8GFtNYsGt71D1MhIz
 /9yGBpeHxLvnUxghIbSTUeLbucdMExjlZyH5bRaSfRC2lUTnhybWWYwcQLa0xPJ/HBCmpsT6
 XfoLGFlXMUqmFhTnpqcWmxYY56WWI0f5JkZwktby3sH46MEHvUOMTByMhxglOJiVRHiXGr1N
 EOJNSaysSi3Kjy8qzUktPsRoCoysicxSosn5wDyRVxJvaGpkZmZgaWBqbGFmqCTOu5T9UIKQ
 QHpiSWp2ampBahFMHxMHp1QDU05c9ceCEwdbJa01FnN3zXbYnMjp/XlVhGkFX94E+a0nuGY1
 Pv1SdMZ4d9GPrJ2SbrkLlR5d/MH5Ne/dZamJV7wu/ow9V7ugSX+XrKWcKJO7zaKmxVm97sEZ
 zUqKtkePfDv0w1g+1+9vC+OnBzulRR3Mm7bq/t4qGL1hUWNdX7GbjFxuZZ3YKiXr4/1JqxiW
 lcx/uZ3TfJp1x5+Nqx8vjs2auPxes3VgjqnfgytK68V2mT2JtXtWqd5xdtGJS4+utd8QyPXc
 EjHlafLHw1bqh4Ou8j542M3x7J9w65119ZdeCrRuuHzn2QQRSSvWL99XGq1xfrxSbO25LEnf
 AzWPLx84fnPlereZXhaTGptsspVYijMSDbWYi4oTAblFQlhbBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTtfk0rsEg619zBZX9p9ntNh/8Bur
 xcnGPawWkw5dY7RYcjHV4lODlMW8W8oW+7f9Y7WYc+YBi0Xvst/sFrPetbNZHO/dwWLxetJ/
 VouVx2wc+Dx+nGtn8zi34zy7x6ZVnWwed67tYfN4cm0zk8f7fVfZPPq2rGIMYI/isklJzcks
 Sy3St0vgyth3+QdzQSN/xdfTC5kbGGfwdDFyckgImEj0TTnH0sXIxSEksINR4viiHiaIhIzE
 r1NTmSFsYYmV/56zQxS9YJRYs+U2C0iCRUBVov/mUkYQm03ASGL22zdgtoiAisTTf3vBpjIL
 3GCWmPigF2yqsICrRMeju+wgNq+AvsT3zR/A4kICqRK3F3xhhYgLSpyc+QRsAbOAmcS8zQ+B
 ruAAsqUllv/jAAlzClhI7Fm2A+w4UQFliQPbjjNNYBSchaR7FpLuWQjdCxiZVzFKphYU56bn
 FhsWGOWllusVJ+YWl+al6yXn525iBEeWltYOxj2rPugdYmTiYDzEKMHBrCTCu9TobYIQb0pi
 ZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTO6HVnxYIbuiIGy6
 k1DYNr+brKa7mi/ub9diyDr2buV0k13dbm2WvSwKSwqafC9JeN3tam4UPTx79qat9esjDr/S
 2r5t/1OPPV2GW9evNj/QPyGO3WN1Vtr+41xnHpfFbsyeYM3xaZ/vRZWG6YbFZkt5Ph+qdfJt
 tlXzs5Z8ZtJ1/9Dijju1kyRe5t8TlUs9I6znbMy3dY2LsKu3QdL8kpvBl6/OWdr2wPhl4ruw
 xgiWd5Kncq53282o2WE88X43c+zjK7Ki92Sdiqb4O5eIBybr7zV8O0c5iE9OQ7376DO33TsM
 XqatsOA6c3Rzl3L38vm/NV2+hwsnBU1JOHo05qWOsG3Qk83h7+MnbXfyV2Ipzkg01GIuKk4E
 AMUJwFcbAwAA
X-CMS-MailID: 20210714120156epcas5p212ae986c7e2ed4d30191ce8915304d2c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----VYnW_YH6BccH6sEamlDP6FsSReon7PG0N2YL-DUAR5gZxX6T=_11c056_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210714120156epcas5p212ae986c7e2ed4d30191ce8915304d2c
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-6-its@irrelevant.dk>
 <CGME20210714120156epcas5p212ae986c7e2ed4d30191ce8915304d2c@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------VYnW_YH6BccH6sEamlDP6FsSReon7PG0N2YL-DUAR5gZxX6T=_11c056_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Jul 14, 2021 at 08:01:25AM +0200, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Add a regression test for mmio read on big-endian hosts.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> tests/qtest/nvme-test.c | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
>
>diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
>index 47e757d7e2af..f8bafb5d70fb 100644
>--- a/tests/qtest/nvme-test.c
>+++ b/tests/qtest/nvme-test.c
>@@ -67,6 +67,30 @@ static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator *alloc)
>     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=, 0x44332211);
> }
>
>+static void nvmetest_reg_read_test(void *obj, void *data, QGuestAllocator *alloc)
>+{
>+    QNvme *nvme = obj;
>+    QPCIDevice *pdev = &nvme->dev;
>+    QPCIBar bar;
>+    uint32_t cap_lo, cap_hi;
>+    uint64_t cap;
>+
>+    qpci_device_enable(pdev);
>+    bar = qpci_iomap(pdev, 0, NULL);
>+
>+    cap_lo = qpci_io_readl(pdev, bar, 0x0);
>+    g_assert_cmpint(NVME_CAP_MQES(cap_lo), ==, 0x7ff);
>+
>+    cap_hi = qpci_io_readl(pdev, bar, 0x4);
>+    g_assert_cmpint(NVME_CAP_MPSMAX((uint64_t)cap_hi << 32), ==, 0x4);
>+
>+    cap = qpci_io_readq(pdev, bar, 0x0);
>+    g_assert_cmpint(NVME_CAP_MQES(cap), ==, 0x7ff);
>+    g_assert_cmpint(NVME_CAP_MPSMAX(cap), ==, 0x4);
>+
>+    qpci_iounmap(pdev, bar);
>+}
>+
> static void nvmetest_pmr_reg_test(void *obj, void *data, QGuestAllocator *alloc)
> {
>     QNvme *nvme = obj;
>@@ -142,6 +166,8 @@ static void nvme_register_nodes(void)
>                  &(QOSGraphTestOptions) {
>         .edge.extra_device_opts = "pmrdev=pmr0"
>     });
>+
>+    qos_add_test("reg-read", "nvme", nvmetest_reg_read_test, NULL);
> }
>
> libqos_init(nvme_register_nodes);
>-- 
>2.32.0
>
>

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>


------VYnW_YH6BccH6sEamlDP6FsSReon7PG0N2YL-DUAR5gZxX6T=_11c056_
Content-Type: text/plain; charset="utf-8"


------VYnW_YH6BccH6sEamlDP6FsSReon7PG0N2YL-DUAR5gZxX6T=_11c056_--

