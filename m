Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9935B775E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 19:12:00 +0200 (CEST)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY9S3-0001cD-Sv
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 13:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9Gc-0000qM-0A
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62828
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9GZ-0002k3-EP
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:09 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DGlEAf031892;
 Tue, 13 Sep 2022 17:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=k3/xP4S9AG3jTRmmkPQHRKAqtBae3ak67tDrizMJEgI=;
 b=MINAMwqtNaKgTyuHFYyQ1arpuVYkWcQhIux2xFsi6eDNrtufpuCtfwHkkHw3oY/iO8C5
 Ip7VsxMdpA41Akkw1OTnjfgKxhqyUZmMp4B64eYIGFFeTirP6niFl20ai502N6bj4+u/
 +9H3RyW8Lt0dslf46SKgyniJFr0jcFJwmvJHNwkH3EhvzxoHKQ213A5gNOKE075JQRhT
 00Hotm5MZPa/lgN92an6GUtbUoKbjkQ+Bl6udhfJCRkV5rU9DSBs8aQdDoC674XFtzf5
 d4LFXK+SjFGYIS71+0S/jS7xip5YF1toXlf7j/KXsM4Oa3SLoGSps8kzgZ1AqsV721O7 Qw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjwpjgb46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DGoghN021985;
 Tue, 13 Sep 2022 17:00:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3jgj79tjmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28DGxwaC44302706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Sep 2022 16:59:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 449FE78063;
 Tue, 13 Sep 2022 17:14:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC7F67805F;
 Tue, 13 Sep 2022 17:14:28 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Sep 2022 17:14:28 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 0/4] Merge tpm 2022/09/13 v1
Date: Tue, 13 Sep 2022 12:59:41 -0400
Message-Id: <20220913165945.1635016-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UQWX8gKYMQzRCLqSnQ6Z3oPsBz4xVIB2
X-Proofpoint-GUID: UQWX8gKYMQzRCLqSnQ6Z3oPsBz4xVIB2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=801 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hello!

 This PR contains TPM-related patches for Xen and shared storage support.
 
 Cheers!
    Stefan

The following changes since commit 79dfa177ae348bb5ab5f97c0915359b13d6186e2:

  Merge tag 'pull-qapi-2022-09-07' of git://repo.or.cz/qemu/armbru into staging (2022-09-07 13:13:30 -0400)

are available in the Git repository at:

  https://github.com/stefanberger/qemu-tpm.git tags/tpm-pull-2022-09-13-1

for you to fetch changes up to 99bdcd2cc2d05833f5c11caca22193f8dd878ae9:

  tpm_emulator: Have swtpm relock storage upon migration fall-back (2022-09-13 10:27:17 -0400)


Ross Lagerwall (2):
  tpm_emulator: Avoid double initialization during migration
  tpm_crb: Avoid backend startup just before shutdown under Xen

Stefan Berger (2):
  tpm_emulator: Use latest tpm_ioctl.h from swtpm project
  tpm_emulator: Have swtpm relock storage upon migration fall-back

 backends/tpm/tpm_emulator.c | 70 ++++++++++++++++++++++++++-
 backends/tpm/tpm_ioctl.h    | 96 +++++++++++++++++++++++++++++--------
 backends/tpm/trace-events   |  2 +
 hw/tpm/tpm_crb.c            |  7 ++-
 4 files changed, 153 insertions(+), 22 deletions(-)

-- 
2.37.2


