Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B93BCB60
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:06:57 +0200 (CEST)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ium-00053s-9P
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m0isv-0002yx-HN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:05:01 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:12360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m0iss-0004qp-Mh
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:05:01 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210706105858epoutp033152041551af119f3f592f400b757701~PLoThjdBt2397823978epoutp03D
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 10:58:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210706105858epoutp033152041551af119f3f592f400b757701~PLoThjdBt2397823978epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1625569138;
 bh=vl76bCpGN2hogCTabahQ64/cuvMe2nGd5+K4XpZAjoE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=L6Q1e5FCVTGQKhKjqc6Ee2sInCdamEEo/t5t1DlmixiADatrrB2IEOaqkJFDl7HCI
 FENHZG9SHCNz/zeSr9XvuG8DSFPBX7xNlaQl8sDolFn4RoED0dz6dTFcesXP2JIkgI
 9VejwEfad6kHxHHTMvnSQx6o9zX9P+K/hZyKIrP8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210706105857epcas5p2cb0d6c4df6b81563f91f4163630db362~PLoSnYUZ90374603746epcas5p2k;
 Tue,  6 Jul 2021 10:58:57 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.40.197]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4GK00v4RThz4x9Q1; Tue,  6 Jul
 2021 10:58:55 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A8.DE.09595.E6734E06; Tue,  6 Jul 2021 19:58:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210706104308epcas5p4547ee66f254ce8de5d43a375f5a6fd1f~PLaeqSaW30598905989epcas5p4B;
 Tue,  6 Jul 2021 10:43:08 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210706104308epsmtrp2b27eafb393ae46c5d31c04c600c8766f~PLaeowpcj2222322223epsmtrp2H;
 Tue,  6 Jul 2021 10:43:08 +0000 (GMT)
X-AuditID: b6c32a4a-eebff7000000257b-2c-60e4376e53bc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C5.ED.08289.CB334E06; Tue,  6 Jul 2021 19:43:08 +0900 (KST)
Received: from pkalghatgi02 (unknown [107.122.10.112]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210706104306epsmtip1b9716dbf479fe17855c757caf3d40417~PLachxhzx0310503105epsmtip1T;
 Tue,  6 Jul 2021 10:43:06 +0000 (GMT)
From: "Padmakar Kalghatgi" <p.kalghatgi@samsung.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH]: /hw/nvme/ctrl error handling if descriptors are greater
 than 1024
Date: Tue, 6 Jul 2021 16:13:04 +0530
Message-ID: <1c9201d77253$b5708060$20518120$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_1C93_01D77281.CF29A6C0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AddyUrsLmOSQwaAuRymiCoGvwJng1g==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphl+LIzCtJLcpLzFFi42LZdlhTUzfP/EmCwf6HahZX9p9ntNh/8Bur
 xaRD1xgtllxMtZh3S9li1rt2NovjvTtYLF5P+s/qwOHx41w7m8e5HefZPTat6mTzeHJtM5PH
 +31X2QJYo3JsMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0y
 c4BOUVIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUGBoV6BUn5haX5qXrJefnWhka
 GBiZAlUm5GRMeCBasGETc0XP1J1sDYztC5i7GDk5JARMJI682MzWxcjFISSwm1Hi1d5/zBDO
 J0aJ21u6WSGcz4wSx092scK0bJp5kQUisYtRonHqS6j+14wS1/6dZQGpYgOqej7pLTuILSIg
 LdE/p50dpIhZYDajxJUXxxhBEsICoRI/bn0DauDgYBFQkZh01wMkzCtgKbH06U5GCFtQ4uTM
 J2AzmQWiJWbtPc4OcYWCxM+ny1gh5utJnP/5jg2iRlzi6M8esB8kBOZySKxqW8sE0eAi0XBh
 CVSzsMSr41ugbCmJz+/2skE0NDNK7PtyhQXCmcAoMWX+O6hue4mLe/5C2bISU0+tY4JYxyfR
 +/sJVJxXYsc8GFtV4vGFg2wQtrTE7JWfmEC+lBDwkNizG6xESCBW4ujj28wTGBVmIXl0FpJH
 ZyF5CMKWl9j+dg6QzQFka0qs36UPEc6SWPV4NlSrhkTrnLlQrdoSyxa+hmq1kZh9/RhUjaLE
 lO6HUDWqEr8OLGFdwMi9ilEytaA4Nz212LTAKC+1HDkhbWIEZwEtrx2MDx980DvEyMTBeIhR
 Baj90YbVFxilWPLy81KVRHhFpjxKEOJNSaysSi3Kjy8qzUktPsRoCozcicxSosn5wPyUVxJv
 aGpkZmZgaWBqbGFmqCTOu5T9UIKQQHpiSWp2ampBahFMHxMHp1QDk7BL8d7E5AKVjzb6HHLH
 urN5a/RvTToTOHWRdLOi+cRdxrGLNjkq7JJgSz9rbRQsoJp1ZnbFh7SsDROUj3rGv+FOcKgr
 21vavGqrV7NR/N35jxP2KmzaqDazM5qRyX7jryvVs5dlVLsLbv74IvCh/DPvR0+/nHOb7No4
 rWrtpwUNMaUtm9oOP2J5eeDIleoNT4Xj2n52LF1yUsz+VO9z9zkd/iWPfpblSZSbH9+m7/r9
 rqKAkZtzaeCz43M/CdlfOhaQ/vFnYmSVbv0R/zvGae7pAeHeX+a2ps5iM9jgNXv+ovB/veZ9
 f76aTPXbqxMT+//0nfXLzPpanj6v01jB8eqSDqectU6KOcdvk59NSizFGYmGWsxFxYkA8/3E
 jJcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJTneP8ZMEgzfHxS2u7D/PaLH/4DdW
 i0mHrjFaLLmYajHvlrLFrHftbBbHe3ewWLye9J/VgcPjx7l2No9zO86ze2xa1cnm8eTaZiaP
 9/uusgWwRnHZpKTmZJalFunbJXBlbPi7iLXgr0vFyb7pjA2M3627GDk5JARMJDbNvMgCYgsJ
 7GCU+NpTBRGXltj38DoLhC0ssfLfc/YuRi6gmpeMEi+ezWADSbABNT+f9JYdxBYBauif0w5W
 xCywmFFiw7w9jCAJYYFgia1/VrF2MXJwsAioSEy66wES5hWwlFj6dCcjhC0ocXLmE7BlzALR
 ErP2HmeHWKwg8fPpMlaI+XoS53++Y4OoEZc4+rOHeQKjwCwk7bOQtM9CUjYLaDMzUHvbRkaI
 sLzE9rdzmCFsXYn/z2FsbYllC18zL2BkX8UomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJ
 ERxTWlo7GPes+qB3iJGJg/EQowQHs5IIr8iURwlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90
 nYwXEkhPLEnNTk0tSC2CyTJxcEo1MHm+brwZIWy/pKJM+rXMzTUN8yJPSt5eEfjFM+TymnXb
 WWx4ci4YfDgRXqc4cda+QgGzYIla04P60hyq95hmOuapB/tp8RfMfWDqpbEtwyxgywOXDNYn
 i/+1P/9xb8bRKAbpN03u8/W845YzbjJWTtpvPNP6V86/5NlHi6Kev9BXLAxZPN1AbtVBlSOt
 3TNXnpDaqlh3IUI7Xd34o2Xjj4t+v3Y4VaVdu8cie+v5EY2AnRuv2rffVGJ94BHoP8GinSU5
 4Nfyv4Wf5uySbdt3z8jDxqF4auayDNkFGbO7Nov8e783/EKD8vUVZZp5dvlH/lQHzpl8/R3v
 9EMeLJd3Glj+mOclm/gyLJGlKi7PQImlOCPRUIu5qDgRAHFHDoQYAwAA
X-CMS-MailID: 20210706104308epcas5p4547ee66f254ce8de5d43a375f5a6fd1f
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210706104308epcas5p4547ee66f254ce8de5d43a375f5a6fd1f
References: <CGME20210706104308epcas5p4547ee66f254ce8de5d43a375f5a6fd1f@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -84
X-Spam_score: -8.5
X-Spam_bar: --------
X-Spam_report: (-8.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multipart message in MIME format.

------=_NextPart_000_1C93_01D77281.CF29A6C0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

From: padmakar

 

if the number of descriptors or pages is more than 1024,

dma writes or reads will result in failure. Hence, we check

if the number of descriptors or pages is more than 1024

in the nvme module and return Internal Device error.

 

Signed-off-by: Padmakar Kalghatgi

---

hw/nvme/ctrl.c       | 14 ++++++++++++++

hw/nvme/trace-events |  1 +

2 files changed, 15 insertions(+)

 

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c

index 40a7efc..082592f 100644

--- a/hw/nvme/ctrl.c

+++ b/hw/nvme/ctrl.c

@@ -602,6 +602,20 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg,
hwaddr addr, size_t len)

         return NVME_SUCCESS;

     }

+    /*

+     *  The QEMU has an inherent issue where in if the no.

+     *  of descriptors is more than 1024, it will result in

+     *  failure during the dma write or reads. Hence, we need

+     *  to return the error.

+     */

+

+    if (((sg->flags & NVME_SG_DMA) && ((sg->qsg.nsg + 1) > IOV_MAX)) ||

+        ((sg->iov.niov + 1) > IOV_MAX)) {

+            NVME_GUEST_ERR(pci_nvme_ub_sg_desc_toohigh,

+                       "number of descriptors is greater than 1024");

+            return NVME_INTERNAL_DEV_ERROR;

+    }

+

     trace_pci_nvme_map_addr(addr, len);

     if (nvme_addr_is_cmb(n, addr)) {

diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events

index ea33d0c..bfe1a3b 100644

--- a/hw/nvme/trace-events

+++ b/hw/nvme/trace-events

@@ -202,3 +202,4 @@ pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t
new_head) "completion qu

pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write
for nonexistent queue, sqid=%"PRIu32", ignoring"

pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail)
"submission queue doorbell write value beyond queue size, sqid=%"PRIu32",
new_head=%"PRIu16", ignoring"

pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"

+pci_nvme_ub_sg_desc_toohigh(void) "the number of sg descriptors is too
high"

-- 

2.7.0.windows.1

 


------=_NextPart_000_1C93_01D77281.CF29A6C0
Content-Type: multipart/related;
	boundary="----Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_eefe0_"

------Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_eefe0_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D=22urn:schemas-microsoft-com:vml=22 xmlns:o=3D=22urn:schema=
s-microsoft-com:office:office=22 xmlns:w=3D=22urn:schemas-microsoft-com:off=
ice:word=22 xmlns:m=3D=22http://schemas.microsoft.com/office/2004/12/omml=
=22 xmlns=3D=22http://www.w3.org/TR/REC-html40=22><head><meta http-equiv=3D=
Content-Type content=3D=22text/html; charset=3Dus-ascii=22><meta name=3DGen=
erator content=3D=22Microsoft Word 15 (filtered medium)=22><style><=21--
/* Font Definitions */
=40font-face
	=7Bfont-family:=22Cambria Math=22;
	panose-1:2 4 5 3 5 4 6 3 2 4;=7D
=40font-face
	=7Bfont-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;=7D
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	=7Bmargin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:=22Calibri=22,sans-serif;
	mso-fareast-language:EN-US;=7D
a:link, span.MsoHyperlink
	=7Bmso-style-priority:99;
	color:=230563C1;
	text-decoration:underline;=7D
a:visited, span.MsoHyperlinkFollowed
	=7Bmso-style-priority:99;
	color:=23954F72;
	text-decoration:underline;=7D
span.EmailStyle17
	=7Bmso-style-type:personal-compose;
	font-family:=22Calibri=22,sans-serif;
	color:windowtext;=7D
.MsoChpDefault
	=7Bmso-style-type:export-only;
	font-family:=22Calibri=22,sans-serif;
	mso-fareast-language:EN-US;=7D
=40page WordSection1
	=7Bsize:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;=7D
div.WordSection1
	=7Bpage:WordSection1;=7D
--></style><=21--=5Bif gte mso 9=5D><xml>
<o:shapedefaults v:ext=3D=22edit=22 spidmax=3D=221026=22 />
</xml><=21=5Bendif=5D--><=21--=5Bif gte mso 9=5D><xml>
<o:shapelayout v:ext=3D=22edit=22>
<o:idmap v:ext=3D=22edit=22 data=3D=221=22 />
</o:shapelayout></xml><=21=5Bendif=5D--></head><body lang=3DEN-IN link=3D=
=22=230563C1=22 vlink=3D=22=23954F72=22><div class=3DWordSection1><p class=
=3DMsoNormal>From: padmakar<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;<=
/o:p></p><p class=3DMsoNormal>if the number of descriptors or pages is more=
 than 1024,<o:p></o:p></p><p class=3DMsoNormal>dma writes or reads will res=
ult in failure. Hence, we check<o:p></o:p></p><p class=3DMsoNormal>if the n=
umber of descriptors or pages is more than 1024<o:p></o:p></p><p class=3DMs=
oNormal>in the nvme module and return Internal Device error.<o:p></o:p></p>=
<p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Signed-off-b=
y: Padmakar Kalghatgi<o:p></o:p></p><p class=3DMsoNormal>---<o:p></o:p></p>=
<p class=3DMsoNormal> hw/nvme/ctrl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=7C 14 ++++++++++++++<o:p></o:p></p><p class=3DMsoNormal> hw/nvme/trace-eve=
nts =7C&nbsp; 1 +<o:p></o:p></p><p class=3DMsoNormal> 2 files changed, 15 i=
nsertions(+)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p cla=
ss=3DMsoNormal>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c<o:p></o:p></p><=
p class=3DMsoNormal>index 40a7efc..082592f 100644<o:p></o:p></p><p class=3D=
MsoNormal>--- a/hw/nvme/ctrl.c<o:p></o:p></p><p class=3DMsoNormal>+++ b/hw/=
nvme/ctrl.c<o:p></o:p></p><p class=3DMsoNormal>=40=40 -602,6 +602,20 =40=40=
 static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t=
 len)<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return NVME_SUCCESS;<o:p></o:p></p><p class=3DMsoNormal>&nbs=
p;&nbsp;&nbsp;&nbsp; =7D<o:p></o:p></p><p class=3DMsoNormal> <o:p></o:p></p=
><p class=3DMsoNormal>+&nbsp;&nbsp;&nbsp; /*<o:p></o:p></p><p class=3DMsoNo=
rmal>+&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; The QEMU has an inherent issue where=
 in if the no.<o:p></o:p></p><p class=3DMsoNormal>+&nbsp;&nbsp;&nbsp;&nbsp;=
 *&nbsp; of descriptors is more than 1024, it will result in<o:p></o:p></p>=
<p class=3DMsoNormal>+&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; failure during the d=
ma write or reads. Hence, we need<o:p></o:p></p><p class=3DMsoNormal>+&nbsp=
;&nbsp;&nbsp;&nbsp; *&nbsp; to return the error.<o:p></o:p></p><p class=3DM=
soNormal>+&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p></p><p class=3DMsoNormal>+<=
o:p></o:p></p><p class=3DMsoNormal>+&nbsp;&nbsp;&nbsp; if (((sg-&gt;flags &=
amp; NVME_SG_DMA) &amp;&amp; ((sg-&gt;qsg.nsg + 1) &gt; IOV_MAX)) =7C=7C<o:=
p></o:p></p><p class=3DMsoNormal>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; ((sg-&gt;iov.niov + 1) &gt; IOV_MAX)) =7B<o:p></o:p></p><p class=3DMsoNor=
mal>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NVM=
E_GUEST_ERR(pci_nvme_ub_sg_desc_toohigh,<o:p></o:p></p><p class=3DMsoNormal=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;number of=
 descriptors is greater than 1024&quot;);<o:p></o:p></p><p class=3DMsoNorma=
l>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n NVME_INTERNAL_DEV_ERROR;<o:p></o:p></p><p class=3DMsoNormal>+&nbsp;&nbsp;=
&nbsp; =7D<o:p></o:p></p><p class=3DMsoNormal>+<o:p></o:p></p><p class=3DMs=
oNormal>&nbsp;&nbsp;&nbsp;&nbsp; trace_pci_nvme_map_addr(addr, len);<o:p></=
o:p></p><p class=3DMsoNormal> <o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;if (nvme_addr_is_cmb(n, addr)) =7B<o:p></o:p></p><p cl=
ass=3DMsoNormal>diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events<o:=
p></o:p></p><p class=3DMsoNormal>index ea33d0c..bfe1a3b 100644<o:p></o:p></=
p><p class=3DMsoNormal>--- a/hw/nvme/trace-events<o:p></o:p></p><p class=3D=
MsoNormal>+++ b/hw/nvme/trace-events<o:p></o:p></p><p class=3DMsoNormal>=40=
=40 -202,3 +202,4 =40=40 pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uin=
t16_t new_head) &quot;completion qu<o:p></o:p></p><p class=3DMsoNormal> pci=
_nvme_ub_db_wr_invalid_sq(uint32_t qid) &quot;submission queue doorbell wri=
te for nonexistent queue, sqid=3D%&quot;PRIu32&quot;, ignoring&quot;<o:p></=
o:p></p><p class=3DMsoNormal> pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid=
, uint16_t new_tail) &quot;submission queue doorbell write value beyond que=
ue size, sqid=3D%&quot;PRIu32&quot;, new_head=3D%&quot;PRIu16&quot;, ignori=
ng&quot;<o:p></o:p></p><p class=3DMsoNormal> pci_nvme_ub_unknown_css_value(=
void) &quot;unknown value in cc.css field&quot;<o:p></o:p></p><p class=3DMs=
oNormal>+pci_nvme_ub_sg_desc_toohigh(void) &quot;the number of sg descripto=
rs is too high&quot;<o:p></o:p></p><p class=3DMsoNormal>-- <o:p></o:p></p><=
p class=3DMsoNormal>2.7.0.windows.1<o:p></o:p></p><p class=3DMsoNormal><o:p=
>&nbsp;</o:p></p></div><table id=3Dconfidentialsignimg data-cui-lock=3D=22t=
rue=22 namo_lock><tr><td>
<=21--<p>&=2310;<img border=3D=220=22 src=3D=22http://www.samsung.net/pt_im=
ages/PCL/securityimage/MSI_20140519003732214.gif=22/></p>&=2310;-->
<p><img border=3D=220=22 src=3D=22cid:XOK0LK7CT9SZ=40namo.co.kr=22/></p>=20
</td></tr></table></body></html><table style=3D'display: none;'><tbody><tr>=
<td><img style=3D'display: none;' border=3D0 src=3D'http://ext.samsung.net/=
mail/ext/v1/external/status/update?userid=3Dp.kalghatgi&do=3DbWFpbElEPTIwMj=
EwNzA2MTA0MzA4ZXBjYXM1cDQ1NDdlZTY2ZjI1NGNlOGRlNWQ0M2EzNzVmNWE2ZmQxZiZyZWNpc=
GllbnRBZGRyZXNzPXFlbXUtZGV2ZWxAbm9uZ251Lm9yZw__' width=3D0 height=3D0></td>=
</tr></tbody></table>
------Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_eefe0_
Content-Type: image/png; name="201602111742151_N3WZA6X7.png"
Content-Transfer-Encoding: base64
Content-ID: <XOK0LK7CT9SZ@namo.co.kr>

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
R8z0cn8fCaizfr8vHn+2vo6NhKdLSwA89sXjz7e3D5tN6b25FEn0DK1w2gN75h/G42fOnx8Jh/uL
GAjVlvWtYrFYvV5HJB6LxeBaimje7OvJZLInMHUmkyH8WNRCqB06AoyVesoczm00GhW3PXoi1tK1
EN7bpFWHFlDvgbQVXfbkFuCbpglm6LsiM6ZpSjF4RTDwYcSLnhYKBYCf99t99JH0tfRFcesF+zFu
jioN98rKiohgLNWV3BXBrJy94xIrdHGxWOx2u6xgCZ7dbYZblkVDII4LvS59UkFSNHj8AYJCy5wQ
arUa/gl1ItKpou4ROyjLy8vc5WLeCc77850duv1UCpCOi7i/v3aNnve05eCOc44taHLMcesfae2P
FxbU0IFuzxPWOn4cm55GkZUCV39sevrw8WP63KWtrSfHoPEj4fClrS3g8tqZDH4cnZiQ7j/DoqAq
SZG7Y+HTffF4IJt9a1hJlmVNTU0Nc+DovSCuMtUjtVotac3o74ps297c3DyRDI8mNaG2+506HNq2
LGww6NF5K/R2sJKwlfp+HRPV9OZtqvq6J02/YXq+ve2/dUvL4fdlGFAwp9e8Jje/YX5+HlVJWhq/
N3pRKn135cpZv/+ChxJMTadEGnZbkyZNmjS9AxGDJk2aNGl6pw3Dy/39o+HKYPulvgBmm5nMwMC8
7xHo7m+VupVKzzo/6VuGEhb4tLl9A58e7BOQDPiUFqIMw893V65wzbLFl9znPPKActI3OYh9aYxh
JDnMJBFXhLo10tJvSKf98i//8j8/+eSvjx//TZOmUyBMsF/+5V+8v/I4nf7p9u33hds3Sa07dx79
h/9wSo03/umf/t///J+ln/s/29uDaYn/7/nzxj/90//Z3tYLYZgZzmrp//nJJ29Anmf+eqJOhyZN
w9PAWMFaMsPQUafDISsM/znAjuqBG3Ic37yWPoOY64fr1xFS/XjzJk7BPd/Zwf1K+PHl/j4OyDUz
Gfz+482biL+e7+x8f+0ansTxOZw6QVPfX7sGjFn8GQEUoiEcBqFPoDUcx/juyhWwxAaGL/f30eZ3
V648mZ096nTcWOJSSQiEwQOe56QgdoGTBv25mclwbCNMbmYy1F/pSqA4nRqRMv9sfR1HIikoZgFS
frh+nWJkOkUpMu/2ozTV5tYvSPKH69ebmQyacussO2QU5D6ZncWPxD97hxSbX+pWKpDA99euPd/Z
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
AAAASUVORK5CYII=

------Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_eefe0_--

------=_NextPart_000_1C93_01D77281.CF29A6C0--


