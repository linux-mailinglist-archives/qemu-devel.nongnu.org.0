Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4131EA5B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:17:54 +0100 (CET)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCjBp-0000eD-NK
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lCjAX-0000Bh-Ft; Thu, 18 Feb 2021 08:16:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lCjAV-0007oS-JQ; Thu, 18 Feb 2021 08:16:33 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11ID2oRS108412; Thu, 18 Feb 2021 08:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : reply-to : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=1LRf0qnMQ3q755tzS3IRorBTpzu7X3I1rSTAGzVIotU=;
 b=YwoYf/NhfbwiNv8ctYihtkWBKzEDr303mEH4KCYnfpAIqMjIT1WnDSIuOJawwGsorcJg
 q9NTY2z83+6TLV5RXqNBesiJggFookTooccxTQAjNUVayBnEFMonmiB8VFg43QU95AsC
 /mgNFh45DQAb8KSFMu6Dny0F5t8S7rVp9J4S49iDKH1Tmw1E07PSU/Yx+ogrA+m2lluc
 xkj33zaaSXMfQBRIy1Orip5il5lw9BzjFOy6AKLyqyp5p+9QxXJa95kl5yagFcNak+o4
 7lfuSWfmwwttzD3H8wSmvhVsWrizkHTQ/oYFn/JwMH4ZF7uZE00GMlD85vLa1qbOjMEz hw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sqnqat03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 08:16:29 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IDFwG2029745;
 Thu, 18 Feb 2021 13:16:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 36p6d9p10h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:16:28 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11IDGRJY37028192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 13:16:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97FE8AC062;
 Thu, 18 Feb 2021 13:16:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8B58AC05B;
 Thu, 18 Feb 2021 13:16:26 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.80.219.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 18 Feb 2021 13:16:26 +0000 (GMT)
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
To: QEMU devel list <qemu-devel@nongnu.org>
Subject: Editing QEMU POWER Platform wiki page
Message-ID: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
Date: Thu, 18 Feb 2021 10:16:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_05:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=783 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102180110
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: lagarcia@br.ibm.com
Cc: QEMU PPC devel list <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi there,

I would like to edit the wiki page at [0] as it contains some outdated 
information. Could anyone that has access to the wiki please help me 
create a user so that I can edit it?

0. https://wiki.qemu.org/Documentation/Platforms/POWER

Cheers,

Leo


