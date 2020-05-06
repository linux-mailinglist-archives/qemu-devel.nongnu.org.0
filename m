Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B233C1C7C8D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 23:37:10 +0200 (CEST)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWRj3-0008P5-1D
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 17:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eyal.moscovici@oracle.com>)
 id 1jWRhK-0006hP-5r; Wed, 06 May 2020 17:35:22 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:41322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eyal.moscovici@oracle.com>)
 id 1jWRhH-0006fl-WD; Wed, 06 May 2020 17:35:21 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046LHnnc088527;
 Wed, 6 May 2020 21:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=HdN1UqFMciOkIwwQ7DVlFd6+2YPnNvPWrIVNPKoavKE=;
 b=rRPXeXlsOs8o/M8DTGmU5fCGGxwd0mDdZS+gU9gYnG/XhyLusQdB+hIatEmjnZ4J7r4a
 uPm9xPmRmAoAPm3P2LkAO7DeHlNlPL6OJrFQ6vg/tZ1ZJyzl3AZ3koqqMhHt9ndOQZ14
 X3eKEhbm95+EKYBI+6hiZ0mJ08Ryefm59W8fmH5fMAGGOHZEhTwO1AQ+zuqQvZ2kQZwJ
 /zz95fQAV9c/jfHguYavxOW8WGGBFMR1Hiy2gQhc53uEf391f7DUxHDnRvMUQHpsWbT1
 WiyEWZwZURsOjSgu04ow2f3KqXc4PPxgrHUa/L7QHaKs1zj08oMLvBAxFu5UD3LmrH/i ZA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 30s09rcwgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 21:35:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046LGboV070964;
 Wed, 6 May 2020 21:35:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 30us7nprm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 21:35:16 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 046LZFQE016342;
 Wed, 6 May 2020 21:35:16 GMT
Received: from localhost.localdomain (/10.74.121.228)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 May 2020 14:35:15 -0700
From: Eyal Moscovici <eyal.moscovici@oracle.com>
To: 
Subject: [PATCH v2 0/5] Additional parameters for qemu_img map
Date: Thu,  7 May 2020 00:34:54 +0300
Message-Id: <20200506213459.44743-1-eyal.moscovici@oracle.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <59b0896d-85ad-08b5-fcc1-36adad7501a4@redhat.com>
References: <59b0896d-85ad-08b5-fcc1-36adad7501a4@redhat.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9613
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 mlxlogscore=651 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060172
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9613
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=715 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005060172
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=eyal.moscovici@oracle.com; helo=userp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 17:35:17
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eyal Moscovici <eyal.moscovici@oracle.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 liran.alon@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The following series adds two parameters to qemu-img map:
1. start-offset: mapping starting offset.
2. max-length: the length of the mapping.

These parameters proved useful when mapping large disk spread across
long store file chains. It allows us to bound the execution time of each
qemu-img map execution as well as recover from failed mapping
operations. In addition the map operation can divided to
multiple independent tasks.

V2 changes:
1. add error reporting to cvtnum.
2. add image length validation in img_map.
3. rebase over QEMU 5.0.

Eyal Moscovici (5):
  qemu-img: remove check that cvtnum value > MAX_INT
  qemu_img: add error report to cvtnum
  qemu-img: validate image length in img_map
  qemu-img: refactor dump_map_entry JSON format output
  qemu-img: Add --start-offset and --max-length to map

 docs/tools/qemu-img.rst    |   2 +-
 qemu-img-cmds.hx           |   4 +-
 qemu-img.c                 | 106 ++++++++++++++++++++++---------------
 tests/qemu-iotests/049.out |   4 +-
 4 files changed, 67 insertions(+), 49 deletions(-)

-- 
2.17.2 (Apple Git-113)


