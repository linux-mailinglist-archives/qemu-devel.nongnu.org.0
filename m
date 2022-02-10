Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA2B4B0809
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 09:20:32 +0100 (CET)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI4gp-00040r-1C
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 03:20:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nI4Kz-0000Oh-PX; Thu, 10 Feb 2022 02:58:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nI4Kx-00067R-OC; Thu, 10 Feb 2022 02:57:57 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A5WoTa032855; 
 Thu, 10 Feb 2022 07:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=aaWZIQs+H0zIr6nMTp63bWdM5NJILH5UrPttBMEnutQ=;
 b=AqseuWRBvy5nEZ/HRr2N3Y2M/NIW/miIzEjsrSi7oModsIfK9sXL2xE75dcd7iJZT4Gu
 CG68cnyQTkRRTY0QCVFbK9+YHJ4PKWDjDKvCseeiH/Odq0DSMyVpVzPH3hp2idIFjsPW
 9buXzHizp4+ERHgYRURFKdRXs+7CthWiYsHoBX/+AWo1B0qTJrzvXhi1b2SzDk3O9WRH
 WhF93DgSeXwJeN0bqgIKzmBnxHUFDr7VCyGs2aLjtUx32CdSdBOIeaufwXjfVawLuh6R
 YF3oZiEObu/zZ+LVEo6dvodUH5DdtQX+qcyt+v38nXlQwiE0QPNVUPrrZ1F1AFyrbllW Pw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4rn1eyff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 07:57:53 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21A7vpww001830;
 Thu, 10 Feb 2022 07:57:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3e1ggjknja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 07:57:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21A7vnfc44040604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 07:57:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4133642041;
 Thu, 10 Feb 2022 07:57:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 103E942047;
 Thu, 10 Feb 2022 07:57:49 +0000 (GMT)
Received: from [9.171.15.77] (unknown [9.171.15.77])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Feb 2022 07:57:48 +0000 (GMT)
Message-ID: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
Date: Thu, 10 Feb 2022 08:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: qemu-devel@nongnu.org, qemu block <qemu-block@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: qemu iotest 161 and make check
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZVUYn_uy0TI8ZAv1uSsegVby5u21J0TK
X-Proofpoint-ORIG-GUID: ZVUYn_uy0TI8ZAv1uSsegVby5u21J0TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_02,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0
 mlxscore=0 mlxlogscore=726 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100039
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello,

I do see spurious failures of 161 in our CI, but only when I use
make check with parallelism (-j).
I have not yet figured out which other testcase could interfere

@@ -34,6 +34,8 @@
  *** Commit and then change an option on the backing file

  Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
+qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
+Is another process using the image [TEST_DIR/t.IMGFMT.base]?
  Formatting 'TEST_DIR/t.IMGFMT.int', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.int backing_fmt=IMGFMT
  { 'execute': 'qmp_capabilities' }


any ideas?

Christian

