Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA423A5BED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 06:13:55 +0200 (CEST)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsdz0-0005Ig-AC
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 00:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lsdxi-0004L9-7e
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 00:12:34 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:63691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lsdxc-0004Hd-0m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 00:12:32 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210614041213epoutp03ee5851b2bebcde7f5595c91a2d1c39be~IV44jU82q1089410894epoutp03i
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:12:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210614041213epoutp03ee5851b2bebcde7f5595c91a2d1c39be~IV44jU82q1089410894epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623643933;
 bh=Y4uba1wOoNEEBZW7MIHZ0xIOFK9tnAZ7DC7zWDxgtF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hkZiNf+H2mD0Htz7KOliQNZcTNhYGWUgYTYPEtgt5c/MVsvC9ZbdKWwhEnUJDMQA3
 MAYFkzEBr3RYFuXdj2KuZknh2dGZJ834m/GY0bxmMiCNcOiZVBG0zssmTVNjOuSvej
 KzoeZqWu48TYdi0jfDgnwIX/wojB0zBT18HfBAFQ=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210614041213epcas5p4ceab9f6f16e0da6a68b38dbca12c1b62~IV44VEzHQ0073800738epcas5p4a;
 Mon, 14 Jun 2021 04:12:13 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 42.0F.09606.D17D6C06; Mon, 14 Jun 2021 13:12:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210613120400epcas5p25cb6fb8a284acf8c2512e228e311c403~IIrhPab_U2128221282epcas5p2T;
 Sun, 13 Jun 2021 12:04:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210613120400epsmtrp1442e10f1b003311e9f7fc82cf85df00a~IIrhOmVhk0448104481epsmtrp1q;
 Sun, 13 Jun 2021 12:04:00 +0000 (GMT)
X-AuditID: b6c32a49-bdbff70000002586-b5-60c6d71d45f9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 70.BA.08163.034F5C06; Sun, 13 Jun 2021 21:04:00 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210613120359epsmtip165d20cec2bee2749b7058b66964e7e98~IIrgAJNkE0389203892epsmtip1e;
 Sun, 13 Jun 2021 12:03:59 +0000 (GMT)
Date: Sun, 13 Jun 2021 17:29:58 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 1/2] hw/nvme: fix endianess conversion and add
 controller list
Message-ID: <20210613115958.GA20730@2030045822>
MIME-Version: 1.0
In-Reply-To: <YMEjGTBNHmsu5RgT@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7bCmuq7s9WMJBqvO8ltc2X+e0WL/wW+s
 FpMOXWO0WHIx1WLeLWWLWe/a2SyO9+5gsXg96T+rA4fHj3PtbB7ndpxn99i0qpPN48m1zUwe
 7/ddZQtgjeKySUnNySxLLdK3S+DKmLdiDkvBcomK1hkb2BsY9wp3MXJySAiYSLx4+Iqli5GL
 Q0hgN6PEuZ+PmCGcT4wSm95tZIJwPjNK/N61EMjhAGvpfuUFEd/FKLGuYTI7hPOKUeLeptVs
 IEUsAqoSfROSQVawCRhJzH77hhHEFhFQkXj6by/YOmaBiYwSO3r/sIEkhAXCJa6v/88OYvMK
 6Ess2fgDyhaUODnzCQuIzQk0aFfvdrBBogLKEge2HWeC+KGVQ+LnohgI20Xi2uMrrBC2sMSr
 41vYIWwpiZf9bUA2O5BdLXG4COQECYEORoljlzewQZTYS/x7Ng1sPLNAhsS9aVegxstKTD21
 jgkizifR+/sJVJxXYsc8GFtNYsGt71CrZCRm/rkNdYKHxKXHN6DBu4NRYuKj7SwTGOVnIXlt
 FpJ9ELaVROeHJtZZwGBkFpCWWP6PA8LUlFi/S38BI+sqRsnUguLc9NRi0wLDvNRyveLE3OLS
 vHS95PzcTYzgdKTluYPx7oMPeocYmTgYDzFKcDArifA+6zqcIMSbklhZlVqUH19UmpNafIhR
 moNFSZx3KfuhBCGB9MSS1OzU1ILUIpgsEwenVAOT+l+xg8aS3q+LXl6Yve5086ZfqRsyt1ze
 rMBR6xDQzSX+p6h4jsHKMO07v8ymOV+q+35n8y1Z9cIrmXfvZCiX+QXnyTVMPbG1e7KbmMTl
 12oFihvK551/5mZpaq9SziQttviwRcd8YbatE49w/NwYyLz9G7/4ar6GTKfldZq8q7LvN1Za
 K5rs4X51p1UgxrNGfklztZv0rUN2kXrNkdtNttrl/Wg+6Sxcu013K6/6CzaT/NrCOXdirWPv
 np6nmGqi1vGaRajxTu7HGrXua+t3ffRc5D/f2MluQX/jhlPsuapMqcHvLlWda32uv+JXapb3
 WkdZS5VffEs3BW9c6Hm3sdI26tAn91PHXnOcuqTEUpyRaKjFXFScCABlyYTxtgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWy7bCSnK7Bl6MJBr+bFC2u7D/PaLH/4DdW
 i0mHrjFaLLmYajHvlrLFrHftbBbHe3ewWLye9J/VgcPjx7l2No9zO86ze2xa1cnm8eTaZiaP
 9/uusgWwRnHZpKTmZJalFunbJXBl/Jl9mqXgpmjF9/3fWBoYOwW7GDk4JARMJLpfeXUxcnEI
 CexglNj06jBLFyMnUFxG4tepqcwQtrDEyn/P2SGKXjBK/Fy5hQmkmUVAVaJvQjJIDZuAkcTs
 t28YQWwRARWJp//2soDUMwtMZJTY0fuHDSQhLBAucX39f3YQm1dAX2LJxh/scJu/rjwBlRCU
 ODnzCdgVzAJmEvM2P2QGWcYsIC2x/B8HSJgTaNmu3u1gy0QFlCUObDvONIFRcBaS7llIumch
 dC9gZF7FKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcC1paOxj3rPqgd4iRiYPxEKME
 B7OSCO+zrsMJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBK
 NTAdnXE46ytjhY2eb8Dh2JpL7+p63a8uORClN/HQT6Gzqs6f3/WduVDCvEXXQHk9Z5+D2yL9
 z8/ev7URu8DvNfNuzEt+8YtPtyvsZdln9Gjzz63i7qIPzn1oLS0r5gz4PN3i9d77azdcSil5
 ZLNw80reewau9y908ao/l5cOdFAu3b1oXU6pheCTfbfvX3hv92eT1fSvulpOl7Osq08+sb11
 5LBbW7O9kt6Fl3kL94qsmrlCQPLq06upDZuvdpZ1Vx7wM/h0Ovu23XwN7flv1M8qB84MWRU0
 k/l7xDz7F+1TH/ltL//zJ0jj5p5HMYfO2LUYdR6aGBPzPM78Rlu0LNci3ysXvrxN3xex6I7m
 Ddc5qkosxRmJhlrMRcWJAArZG4r0AgAA
X-CMS-MailID: 20210613120400epcas5p25cb6fb8a284acf8c2512e228e311c403
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----PyqjeP1gTdP4rESW.nws3AXy0L8foNIaj5wxWxPMMBRbdI4e=_6b6f0_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0
References: <CGME20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0@epcas5p2.samsung.com>
 <20210601150226.5558-1-anaidu.gollu@samsung.com>
 <YMEjGTBNHmsu5RgT@apples.localdomain>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------PyqjeP1gTdP4rESW.nws3AXy0L8foNIaj5wxWxPMMBRbdI4e=_6b6f0_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Jun 09, 2021 at 10:22:49PM +0200, Klaus Jensen wrote:
>On Jun  1 20:32, Gollu Appalanaidu wrote:
>>Add the controller identifiers list CNS 0x13, available list of ctrls
>>in NVM Subsystem that may or may not be attached to namespaces.
>>
>>In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
>>for the nsid field.
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>
>>-v2:
>>Fix the review comments from Klaus and squashed 2nd commit into
>>1st commit
>>
>>---
>>hw/nvme/ctrl.c       | 26 ++++++++++++++++----------
>>hw/nvme/trace-events |  2 +-
>>include/block/nvme.h |  1 +
>>3 files changed, 18 insertions(+), 11 deletions(-)
>>
>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>index 2e7498a73e..813a72c655 100644
>>--- a/hw/nvme/ctrl.c
>>+++ b/hw/nvme/ctrl.c
>>@@ -4251,9 +4251,11 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
>>    return NVME_INVALID_CMD_SET | NVME_DNR;
>>}
>>
>>-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>>+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
>>+                                        bool attached)
>>{
>>    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>>+    uint32_t nsid = le32_to_cpu(c->nsid);
>>    uint16_t min_id = le16_to_cpu(c->ctrlid);
>>    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
>>    uint16_t *ids = &list[1];
>>@@ -4261,15 +4263,17 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>>    NvmeCtrl *ctrl;
>>    int cntlid, nr_ids = 0;
>>
>>-    trace_pci_nvme_identify_ns_attached_list(min_id);
>>+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
>>
>>-    if (c->nsid == NVME_NSID_BROADCAST) {
>>-        return NVME_INVALID_FIELD | NVME_DNR;
>>-    }
>>+    if (attached) {
>>+        if (nsid == NVME_NSID_BROADCAST) {
>>+            return NVME_INVALID_FIELD | NVME_DNR;
>>+        }
>>
>>-    ns = nvme_subsys_ns(n->subsys, c->nsid);
>>-    if (!ns) {
>>-        return NVME_INVALID_FIELD | NVME_DNR;
>>+        ns = nvme_subsys_ns(n->subsys, nsid);
>>+        if (!ns) {
>>+            return NVME_INVALID_FIELD | NVME_DNR;
>>+        }
>>    }
>>
>>    for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
>
>Assume that `attached` is false and `n->subsys` is NULL.
>
>KABOOOOM :)

This scenario has been tested but executed without any issue, since here
ARRAY_SIZE calculating size as per the "NVME_MAX_CONTROLLERS" defined.

These two CNS values shows affect when there exists a Subsystem. will add
check condition if there is no Subsystem will return invalid field in command.

if (!n->subsys) {
	return NVME_INVALID_FIELD | NVME_DNR;
}


------PyqjeP1gTdP4rESW.nws3AXy0L8foNIaj5wxWxPMMBRbdI4e=_6b6f0_
Content-Type: text/plain; charset="utf-8"


------PyqjeP1gTdP4rESW.nws3AXy0L8foNIaj5wxWxPMMBRbdI4e=_6b6f0_--

