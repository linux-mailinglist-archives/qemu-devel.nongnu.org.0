Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FD607670
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:47:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqV9-0006X8-0G
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:47:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olq9Y-0006hD-Vf
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olq9P-0006cr-4Q; Fri, 21 Oct 2022 07:25:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olq9J-0005GA-N0; Fri, 21 Oct 2022 07:25:18 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LBEJRn013270;
 Fri, 21 Oct 2022 11:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=dHXUBiWIrGrXar53PjbYgQ7zx6Wwzuo0cHuKvyEFqiQ=;
 b=XEFXY4cJ/j21X1edlXkwOnYqNrs08SghQtYJE9eAWXgjFLB+J/zop4j+Y23f1XQkgtoT
 NZtg1qqkDO9F4HBztH4rLcfHWOa2/xUOCTZe0nUWAGD2+YYCEpbo8pDQrwg14u330Nii
 ehJRceA2WQ6yKq/oQQ/8IsRWJhkr+diHZ/hN+NCZaznmPUA7Akk6fs1RtqmbRq1GqGn1
 +aDVWjOwKmyTpn4xfuiKEDXogZkPtJ4RLFhrJg+UbSCWi1qZgrpGSk/me8ecHu0msO7f
 c/fVUAR2TyhK8n2pM5fp7xlFNcoFgC9vO4Zprdstx0haeyUrAUZOE/1PMy7BvfDjDfZi SA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbtcd0awf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 11:25:11 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LBKNHC012044;
 Fri, 21 Oct 2022 11:25:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3k7mg9ftu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 11:25:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29LBPf1o45482242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Oct 2022 11:25:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7554FAE04D;
 Fri, 21 Oct 2022 11:25:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3256DAE053;
 Fri, 21 Oct 2022 11:25:07 +0000 (GMT)
Received: from [9.171.39.72] (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Oct 2022 11:25:07 +0000 (GMT)
Message-ID: <b75a3f90dbaf1afdd75980a455486d6ed2b70c7e.camel@linux.ibm.com>
Subject: Re: [PATCH 1/9] target/s390x: Use a single return for
 helper_divs32/u32
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Date: Fri, 21 Oct 2022 13:25:06 +0200
In-Reply-To: <20221021073006.2398819-2-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YUizIQjcxzCiCv1Y5t2jjr2PKMO9hQbN
X-Proofpoint-ORIG-GUID: YUizIQjcxzCiCv1Y5t2jjr2PKMO9hQbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxlogscore=634
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210064
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, 2022-10-21 at 17:29 +1000, Richard Henderson wrote:
> Pack the quotient and remainder into a single uint64_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h         |  2 +-
>  target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
>  target/s390x/tcg/translate.c  | 10 ++++++----
>  3 files changed, 20 insertions(+), 18 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

