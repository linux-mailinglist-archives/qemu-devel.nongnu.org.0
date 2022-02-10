Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6364B12FC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:38:48 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICT1-0000TJ-2j
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:38:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nIAn7-0004sj-Sk; Thu, 10 Feb 2022 09:51:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nIAn5-0003uK-Gz; Thu, 10 Feb 2022 09:51:25 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ADwZRc005467; 
 Thu, 10 Feb 2022 14:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=l7QMjtPBbCFPAYnG8pXCOu/cM7Mj/PafSixeh53A35Q=;
 b=q24gcdSSpS25KjDgX32I02nCug1NLi10j7XjrtRc0TZAstEqNwNOFkPTRwtQeTgYQwIB
 mvAm5vRxWJYWhYKRy5031XM/HFgl7xzrYAOLqrZUK8SBLDcaBUL1ZXlb78o/3JeLdagW
 JbVQK/WVU8Oqxx6Mt+NGPh2KFzvZxDTsa7kbn+WB8L3g9xzmiUOG04KN1vK8Al/j1CSO
 bRCJn1GAQpi8ljLF2EOL7Xz+PgvywmpayUbgKEgtB2JjxMkSOE9O7fmEYdc99DnjKTLR
 +dabZRdKSBZtJIhhNo89kDiXyzog4Ob029BUIvmaSaXXHO/5dr5Uy1Kq1FNUKw8tI33i tw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e542f18rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 14:51:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21AEY8oU015024;
 Thu, 10 Feb 2022 14:51:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3e1gv9s4uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 14:51:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AEpAuj41091364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 14:51:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27BE0A407C;
 Thu, 10 Feb 2022 14:51:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2AC9A406E;
 Thu, 10 Feb 2022 14:51:09 +0000 (GMT)
Received: from [9.171.15.77] (unknown [9.171.15.77])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Feb 2022 14:51:09 +0000 (GMT)
Message-ID: <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
Date: Thu, 10 Feb 2022 15:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu block <qemu-block@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XWTNiSVCGSgbICcMgqIA9XCvKvyqPXN7
X-Proofpoint-ORIG-GUID: XWTNiSVCGSgbICcMgqIA9XCvKvyqPXN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_06,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=983 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100080
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
> 10.02.2022 10:57, Christian Borntraeger wrote:
>> Hello,
>>
>> I do see spurious failures of 161 in our CI, but only when I use
>> make check with parallelism (-j).
>> I have not yet figured out which other testcase could interfere
>>
>> @@ -34,6 +34,8 @@
>>   *** Commit and then change an option on the backing file
>>
>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
>> +Is another process using the image [TEST_DIR/t.IMGFMT.base]?
>>   Formatting 'TEST_DIR/t.IMGFMT.int', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
>>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.int backing_fmt=IMGFMT
>>   { 'execute': 'qmp_capabilities' }
>>
>>
>> any ideas?
>>
> 
> Hmm, interesting.. Is it always 161 and always exactly this diff?

Its always 161 and only 161. I would need to check if its always the same error.

> 
> First, this place in 161 is usual: we just create and image, like in many other tests.
> 
> Second, why _make_test_img trigger "Failed to get write lock"? It should just create an image. Hmm. And probably starts QSD if protocol is fuse. So, that start of QSD may probably fail.. Is that the case? What is image format and protocol used in test run?
> 
> But anyway, tests running in parallel should not break each other as each test has own TEST_DIR and SOCK_DIR..
  

