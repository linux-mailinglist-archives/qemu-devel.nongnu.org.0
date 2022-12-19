Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55581650E76
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HsG-00042J-Dt; Mon, 19 Dec 2022 10:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7HsC-000414-HK
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:16:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7HsA-0001dc-Ie
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:16:12 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJFDvZA029603
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Mg81QwCyf/eSaqSp7iHXH64GSh+ARKdfvsBYx+ipXGU=;
 b=lQSDruKTyHMUzB61QkbA+E6U+qCnkiozXDyGhXtlw1GC4ge8Z7Gl3kc01DOw3JRfRhFm
 3vOIS3jW37T8rmfIuUpGC2skspht9TKQ42IMvjxUbAutThBDpYOuyq0EWiO0KL5xlbr/
 kfIgVKeo31tOm+ySd75PLXiL4jEKbO/8aQUjOSOp0tuuiYxQzpSpDZwvZSU9rSCFY1Zc
 IxzfcXhuYP7nGTw4rg2Lh3JTQHHrTiirBspzfQ7AAWMx+8Xw2Dr31ISLCVxJ5EgYzo8m
 Hy2nF4JIUbJ2nph+Ox4lqdyBWNDXY6pfGA6oYI7wMybluPFHzZVYPmd5X5gxWbiOKOPT Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjtdpg2d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:16:08 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJFEDJK031245
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:16:08 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjtdpg2ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 15:16:08 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJF6OxJ027541;
 Mon, 19 Dec 2022 15:16:07 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mh6yuhmu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 15:16:07 +0000
Received: from smtpav01.dal12v.mail.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJFG6H89831042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 15:16:06 GMT
Received: from smtpav01.dal12v.mail.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3BE058057;
 Mon, 19 Dec 2022 15:16:05 +0000 (GMT)
Received: from smtpav01.dal12v.mail.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF88C58065;
 Mon, 19 Dec 2022 15:16:04 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 15:16:04 +0000 (GMT)
Message-ID: <bf7aa576-b4b0-5054-915e-7933bf1abac8@linux.ibm.com>
Date: Mon, 19 Dec 2022 10:16:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/2] tpm: add mssim backend
Content-Language: en-US
To: James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20221219131344.18909-1-jejb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BKM4W2Gn83W0MZMzS66y5SU8ppZhPpwO
X-Proofpoint-ORIG-GUID: mSbUeRtbReByTWmP3YW-rjg_qxHNIlQB
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=776
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190134
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/19/22 08:13, James Bottomley wrote:
> From: James Bottomley <James.Bottomley@HansenPartnership.com>
> 
> The requested feedback was to convert the tpmdev handler to being json
> based, which requires rethreading all the backends.  The good news is
> this reduced quite a bit of code (especially as I converted it to
> error_fatal handling as well, which removes the return status
> threading).  The bad news is I can't test any of the conversions.
> swtpm still isn't building on opensuse and, apparently, passthrough
> doesn't like my native TPM because it doesn't allow cancellation.

For passthrough you can use /dev/null in place of the cancel file. Libvirt does that also:

https://github.com/stefanberger/libvirt-tpm/blob/master/src/util/virtpm.c#L88

    Stefan

