Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72836B3D6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:11:19 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb11C-00011D-3K
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caodongli@kingsoft.com>)
 id 1laqv3-0003q8-20
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:24:17 -0400
Received: from mail.kingsoft.com ([114.255.44.145]:22820)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caodongli@kingsoft.com>) id 1laquz-0003rY-Mg
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:24:16 -0400
X-AuditID: 0a580157-e31ff7000005ac21-1c-608620b4eccf
Received: from mail.kingsoft.com (localhost [10.88.1.79])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-1-NODE-87) with SMTP id 55.12.44065.4B026806;
 Mon, 26 Apr 2021 10:08:52 +0800 (HKT)
Received: from DESKTOP-9MDAR6M (10.88.1.103) by KSBJMAIL4.kingsoft.cn
 (10.88.1.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 26 Apr
 2021 10:08:52 +0800
Date: Mon, 26 Apr 2021 10:08:52 +0800
From: "caodongli@kingsoft.com" <caodongli@kingsoft.com>
To: mst <mst@redhat.com>, marcel.apfelbaum <marcel.apfelbaum@gmail.com>,
 pbonzini <pbonzini@redhat.com>, richard.henderson
 <richard.henderson@linaro.org>, ehabkost <ehabkost@redhat.com>
Subject: [PATCH v2] hw/i386: Expand the range of CPU topologies between smp
 and maxcpus
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.273[cn]
MIME-Version: 1.0
Message-ID: <2021042610084739495617@kingsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: base64
X-Originating-IP: [10.88.1.103]
X-ClientProxiedBy: KSBJMAIL1.kingsoft.cn (10.88.1.31) To KSBJMAIL4.kingsoft.cn
 (10.88.1.79)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsXCFcHor7tFoS3B4PRtTYuGe6EWh/uvMFu8
 bD/BbPH/1ytWi/3b/rFaHO/dwWKx5MBOdgd2j52z7rJ73Lm2h81j3slAjyfXNjN5vN93lS2A
 NYrLJiU1J7MstUjfLoEr48f/DuaCMxwVN7fMY2tgXMPRxcjJISFgIrFz4wPWLkYuDiGB6UwS
 935sYoJwHjFKTL59grGLkYODRUBV4sdcT5AGNgFziStvZrGB1IgI7GWU+P10BStIglnAU+Lh
 yQ42EFtYIFxiS2sDK8QGXokZ7U9ZIGwBiZtbJrBB2AoSmyZ/AqvhFRCUODnzCQuEbSix7v5d
 doiZOhILdn9ig7AVJaZ0PwSLCwkoSxzdvx5qjrzE3d/TGSHsWImmA7fYJjAKzUIydhaSUbOQ
 jFrAyLyKkaU4N91wEyMk5MN3MM5r+qh3iJGJg/EQowQHs5IIL9uu1gQh3pTEyqrUovz4otKc
 1OJDjNIcLErivLPdGhOEBNITS1KzU1MLUotgskwcnFINTLUHryqfV9Wt4HvktyZafq6MTQHv
 Wvn173oyZpSdurCm0VUh4LOr+RlN36hvCgk3tLXXSiSn/F+2NSeJY1dA7k3fDVpcM64eCWTy
 LX/19v++d7u0F7xvauQPiDPJ82JyNFNOmb73q6B3Xuft0EfcL32lxWet2aOhpXIlir9Xv959
 Ebt12OdTIrtLJpso9d2vLpffZWT+P90o7ISueeBd2YWJlSw/GDtmsgmf2/uVUcJJKjZD+4jI
 LYefMacOLpa5LfFNIFrG5eut28l9bHvE7dgmc06qYj1qFSIR9MR8qc+Lrb/Piojmee+sP7L0
 2MzfcRuZv96w4dSbGK1/men05bt9dSJZTvJHnA9+rhVUYinOSDTUYi4qTgQAcKprl+gCAAA=
Received-SPF: pass client-ip=114.255.44.145;
 envelope-from=caodongli@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, MIME_BASE64_TEXT=1.741,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 09:08:52 -0400
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "like.xu" <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2hhbmdlIHRoZSBjcml0ZXJpYSBmb3IgdGhlIGluaXRpYWwgQ1BVIHRvcG9sb2d5IGFuZCBtYXhj
cHVzLCB1c2VyIGNhbgpoYXZlIG1vcmUgc2V0dGluZ3MKClNpZ25lZC1vZmYtYnk6IERvbmdsaSBD
YW8gPGNhb2RvbmdsaUBraW5nc29mdC5jb20+Ci0tLQpody9pMzg2L3BjLmMgfCAyICstCjEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3
L2kzODYvcGMuYyBiL2h3L2kzODYvcGMuYwppbmRleCA4YTg0YjI1Li5lZjJlODE5IDEwMDY0NAot
LS0gYS9ody9pMzg2L3BjLmMKKysrIGIvaHcvaTM4Ni9wYy5jCkBAIC03NTEsNyArNzUxLDcgQEAg
dm9pZCBwY19zbXBfcGFyc2UoTWFjaGluZVN0YXRlICptcywgUWVtdU9wdHMgKm9wdHMpCiAgICAg
ICAgICAgICBleGl0KDEpOwogICAgICAgICB9CgotICAgICAgICBpZiAoc29ja2V0cyAqIGRpZXMg
KiBjb3JlcyAqIHRocmVhZHMgIT0gbXMtPnNtcC5tYXhfY3B1cykgeworICAgICAgICBpZiAoc29j
a2V0cyAqIGRpZXMgKiBjb3JlcyAqIHRocmVhZHMgPiBtcy0+c21wLm1heF9jcHVzKSB7CiAgICAg
ICAgICAgICBlcnJvcl9yZXBvcnQoIkludmFsaWQgQ1BVIHRvcG9sb2d5IGRlcHJlY2F0ZWQ6ICIK
ICAgICAgICAgICAgICAgICAgICAgICAgICAic29ja2V0cyAoJXUpICogZGllcyAoJXUpICogY29y
ZXMgKCV1KSAqIHRocmVhZHMgKCV1KSAiCiAgICAgICAgICAgICAgICAgICAgICAgICAgIiE9IG1h
eGNwdXMgKCV1KSIsCi0tCjEuOC4zLjEKCgoKCgoKCgoKY2FvZG9uZ2xpQGtpbmdzb2Z0LmNvbQoK
Cg==


