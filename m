Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DB3600C6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 06:06:06 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWtGX-00022T-GR
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 00:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <LIZHAOXIN1@kingsoft.com>)
 id 1lWrDI-0000d7-5y
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 21:54:36 -0400
Received: from mail.kingsoft.com ([114.255.44.145]:18864)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <LIZHAOXIN1@kingsoft.com>) id 1lWrDE-0004q1-Ko
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 21:54:35 -0400
X-AuditID: 0a580155-2a3ff70000061b1d-d3-60779ccc3edd
Received: from mail.kingsoft.com (localhost [10.88.1.78])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-2-NODE-85) with SMTP id 44.A3.06941.CCC97706;
 Thu, 15 Apr 2021 09:54:20 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL3.kingsoft.cn
 (10.88.1.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 15 Apr
 2021 09:54:20 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::a5d4:d2ab:3048:62ec]) by
 KSBJMAIL3.kingsoft.cn ([fe80::a5d4:d2ab:3048:62ec%6]) with mapi id
 15.01.2176.012; Thu, 15 Apr 2021 09:54:20 +0800
From: =?gb2312?B?TElaSEFPWElOMSBbwO7V1fbOXQ==?= <LIZHAOXIN1@kingsoft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: Issue Report: When VM memory is extremely large, downtime for RDMA
 migration is high. (64G mem --> extra 400ms)
Thread-Topic: Issue Report: When VM memory is extremely large, downtime for
 RDMA migration is high. (64G mem --> extra 400ms)
Thread-Index: AdcxmeDs+PVo9tkbRByE2DQN6zgTjw==
Date: Thu, 15 Apr 2021 01:54:19 +0000
Message-ID: <0e83bff996fd4c098b679f04323d25e6@kingsoft.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.1.101]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsXCFcHop3tmTnmCwY07Cha92+6xWxzv3cFi
 cWdLH5MDs8eTa5uZPN7vu8oWwBTFZZOSmpNZllqkb5fAlfF/zXfWgj0cFXcubGBvYFzA0cXI
 ySEhYCIx63cPSxcjF4eQwHQmiS0T37JCOM8ZJZYeWw3l7GGU+LC7hRmkhU3AU+LTqjNsIAkR
 gX5GiRvrHzCBOMwCPUwSv9+0soJUCQtUSXTf38sEYosI1Ess/NbDDmHrScx/cYcNxGYRUJW4
 vesNWJxXwFrieMM7RhCbUUBWYtqj+2C9zALiEnOnzWKFOFZAYsme88wQtqjEy8f/oOLyEnsu
 t7FC1GtJzGv4DdWrKDGl+yHUfEGJkzOfsExgFJmFZOwsJC2zkLTMQtKygJFlFSNLcW660SZG
 SPiH7mCc0fRR7xAjEwfjIUYJDmYlEV63KSUJQrwpiZVVqUX58UWlOanFhxilOViUxHk70ssS
 hATSE0tSs1NTC1KLYLJMHJxSDUwal3Z9/G+y8HHD8tSjeerJ1emrny6bN99W67XVHq1IFcYd
 AifMlLm7K27PfVv9tnzXzZ6k4PqatO3HROfPdJ+60yYm0P53sqLOmqCv/3b/5T85tTtxzaEf
 AmnyW+Y4+Cxcc7H2AVvDr0tSxxqYd9z9u9j03pPzmYL7uKS09DVOCexe+5XzwYJV/g03f3+I
 4bxgL3Roso6kj59xwZ7UxL0lXWtuPHNaecea3+TBFfldPeujXixYr7Gh4/OM4BWz0vhycrcy
 yvn/beuw2/8mvm9m3L4Fv4VWBc2/G3hmq/LeBepXbCtMLocKbWvfq2uq62bZUKeWskEza9Pv
 nkk2n5cf0mWPPKH8/JSUuZTe/4eMSizFGYmGWsxFxYkA+0eXE+4CAAA=
Received-SPF: pass client-ip=114.255.44.145;
 envelope-from=LIZHAOXIN1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Apr 2021 00:04:51 -0400
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
Cc: =?gb2312?B?TElaSEFPWElOMSBbwO7V1fbOXQ==?= <LIZHAOXIN1@kingsoft.com>,
 =?gb2312?B?c3VuaGFvMiBby+/qu10=?= <sunhao2@kingsoft.com>,
 =?gb2312?B?REVOR0xJTldFTiBbtcvB1s7EXQ==?= <DENGLINWEN@kingsoft.com>,
 =?gb2312?B?WUFOR0ZFTkcxIFvR7rflXQ==?= <YANGFENG1@kingsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGk6DQpXaGVuIEkgdGVzdGVkIFJETUEgbGl2ZSBtaWdyYXRpb24sIEkgZm91bmQgdGhhdCB0aGUg
ZG93bnRpbWUgaW5jcmVhc2VkIGFzIHRoZSBWTSdzIG1lbW9yeSBpbmNyZWFzZWQuDQoNCk15IE1l
bGxhbm94IG5ldHdvcmsgY2FyZCBpcyBbQ29ubmVjdFgtNCBMWF0gYW5kIHRoZSBkcml2ZXIgaXMg
TUxOWC01LjIsIE15IFZNIG1lbW9yeSBzaXplIGlzIDY0R0IsIGRvd250aW1lIGlzIDQzMG1zIHdo
ZW4gSSBtaWdyYXRlIHVzaW5nIHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVyczoNCnZpcnNoIG1pZ3Jh
dGUgLS1saXZlIC0tcDJwIC0tcGVyc2lzdGVudCAtLWNvcHktc3RvcmFnZS1pbmMgLS1hdXRvLWNv
bnZlcmdlIC0tdmVyYm9zZSAtLWxpc3Rlbi1hZGRyZXNzIDAuMC4wLjAgLS1yZG1hLXBpbi1hbGwg
LS1taWdyYXRldXJpIHJkbWE6Ly8xOTIuMTY4LjAuMiBbVk1dIHFlbXUrdGNwOi8vMTkyLjE2OC4w
LjIvc3lzdGVtDQoNClRoZSBleHRyYSB0aW1lLCBhYm91dCA0MDBtcywgd2hpY2ggaXMgaG93IGxv
bmcgaXQgdGFrZXMgUkRNQSB0byBkZXJlZ2lzdGVyIG1lbW9yeSAodGhlIGZ1bmN0aW9uOiBpYnZf
ZGVyZWdfbXIpIGFmdGVyIG1lbW9yeSBtaWdyYXRpb24gaXMgY29tcGxldGUsIGlzIGJlZm9yZSBx
bXBfY29udCBhbmQgdGhlcmVmb3JlIHBhcnQgb2YgZG93bnRpbWUuDQoNCkhvdyBkbyB3ZSByZWR1
Y2UgdGhpcyBkb3dudGltZT8gTGlrZSBkZXJlZ2lzdGVyIG1lbW9yeSBzb21ld2hlcmUgZWxzZT8N
Cg0KSWYgYW55dGhpbmcgd3JvbmcsIFBsZWFzZSBwb2ludCBvdXQuDQpUaGFua3MhDQo=

