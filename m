Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC9644D23
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2eL0-0004vE-2r; Tue, 06 Dec 2022 15:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2eKl-0004t6-GO
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:14:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2eKj-0005tp-OQ
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:14:31 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6IDcw5008811; Tue, 6 Dec 2022 20:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=LbK5W+FvwQ5CnjRNqOr5MEIX+Or+v0nqvOCGoGe7MKk=;
 b=H2l/PEQTpv2GgrFIvZ3Lp+lxSwsuKxwCGt+3NlnuAVKWoddqQUvRVV0IKEbZvNvJUYEe
 TNajY4MztUJ/0RjgGX7aSPvxWksfRF0wjaa1fbFAb+IfG4WihOw1JZlqCVcABW6jmc5c
 UrnubCLc1O2agXE1RsZo5Z99XJvw3goUOFPbIx/QbnNKJHhH8vufqCm8/M7LiaVPnXCP
 4cdHfo+d3Y/mKnj0W++GQMox4sWzjNAuggkmzk2i0YfuEsI7tOtc4ne6NQof673jPZ5u
 WR4RNNv/Ty1vIBzUF+EjnhYuX+pHDhpHFtnOTsiY/fVLUxjw0GACrRqwkCX3Vdfr4atY TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3maatujuyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:14:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6KE4Ln017657;
 Tue, 6 Dec 2022 20:14:27 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3maatujuy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:14:26 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6DAkTw008091;
 Tue, 6 Dec 2022 20:14:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3m9ktqhddm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:14:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6KEMpM41287950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 20:14:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 588D920049;
 Tue,  6 Dec 2022 20:14:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06A8B20040;
 Tue,  6 Dec 2022 20:14:22 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 20:14:21 +0000 (GMT)
Date: Tue, 6 Dec 2022 21:14:20 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 09/13] tcg/s390x: Create tgen_cmp2 to simplify movcond
Message-ID: <20221206201420.jirpbwyqk2idmzf7@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-10-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G8WTUfHBGxScSuSjiOtr9dbRxLOrO__7
X-Proofpoint-GUID: 1NAAUT7ndD64kan3UqDtFKk4VmHTUQt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=724 lowpriorityscore=0
 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060168
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 10:51:56PM -0800, Richard Henderson wrote:
> Return both regular and inverted condition codes from tgen_cmp2.
> This lets us choose after the fact which comparision we want.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

