Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FDE33BF94
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:17:40 +0100 (CET)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoyR-0003iU-6K
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLow2-0001WB-Vv; Mon, 15 Mar 2021 11:15:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLow1-00075P-2i; Mon, 15 Mar 2021 11:15:10 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FF4jbs188829; Mon, 15 Mar 2021 11:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=+Yyjc9hqoF8D3gFec0kn7vJOKZak4fJL+rfDW9bY0Us=;
 b=ILIw8+BhX2HUSvOJlQbDt7Y8itpho11We3vBy/ggkOPoGAHBSbZWRpdAEi+1MXAZH02f
 4+vqxE2cN/RwvRlt+b83W9DjF/O4oAPQo8PLVoR0O9J17eaQNon4mKeCcy/S2Ov2u0tG
 54eaOpxorUarf6OAk7QQW+cGJatzQixxN474wHIID4sfTJLMv9skBAIARgKSUOj3Z9Eb
 WxEQdOXnhJjL6Gl8+1EtThvQrCMs7qRAa/W2CpSAfmU9ROHFjIm1/869mRJJnUdpNyZJ
 FLl+DRvdlx6W/T/EJmmqqPolvPVNwg9cd2bHNXNx16t62Yi0TanIWpLwfzmwctQUrVQZ mA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yhvauxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:15:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FFEEIF016547;
 Mon, 15 Mar 2021 15:15:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 378n18hyrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 15:15:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12FFEk7G19661274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 15:14:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 814654C080;
 Mon, 15 Mar 2021 15:14:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E8DA4C070;
 Mon, 15 Mar 2021 15:14:49 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 15:14:49 +0000 (GMT)
To: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: compile warning in i8259.c
Message-ID: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
Date: Mon, 15 Mar 2021 16:14:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=856
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150109
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rm9yIHNvbWUgdGltZSBub3cgSSBkbyBzZWUgdGhlIGZvbGxvd2luZywgd2hlbiBJIGNvbXBp
bGUgeDg2LXNvZnRtbXUgb24gczM5MDoNCg0KRkFJTEVEOiBsaWJjb21tb24uZmEucC9od19p
bnRjX2k4MjU5LmMubw0KY2MgLUlsaWJjb21tb24uZmEucCAtSS4gLUkuLiAtSXFhcGkgLUl0
cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL2NhcHN0b25lIC1JL3Vzci9p
bmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWI2NC9nbGliLTIuMC9pbmNsdWRlIC1JL3Vzci9p
bmNsdWRlL2xpYm1vdW50IC1JL3Vzci9pbmNsdWRlL2Jsa2lkIC1JL3Vzci9pbmNsdWRlL2dp
by11bml4LTIuMCAtSS91c3IvaW5jbHVkZS9saWJ1c2ItMS4wIC1JL3Vzci9pbmNsdWRlL3Z0
ZS0yLjkxIC1JL3Vzci9pbmNsdWRlL3BhbmdvLTEuMCAtSS91c3IvaW5jbHVkZS9oYXJmYnV6
eiAtSS91c3IvaW5jbHVkZS9mcmVldHlwZTIgLUkvdXNyL2luY2x1ZGUvbGlicG5nMTYgLUkv
dXNyL2luY2x1ZGUvZnJpYmlkaSAtSS91c3IvaW5jbHVkZS9saWJ4bWwyIC1JL3Vzci9pbmNs
dWRlL2NhaXJvIC1JL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL2d0ay0z
LjAgLUkvdXNyL2luY2x1ZGUvZ2RrLXBpeGJ1Zi0yLjAgLUkvdXNyL2luY2x1ZGUvYXRrLTEu
MCAtSS91c3IvaW5jbHVkZS9hdC1zcGkyLWF0ay8yLjAgLUkvdXNyL2luY2x1ZGUvZGJ1cy0x
LjAgLUkvdXNyL2xpYjY0L2RidXMtMS4wL2luY2x1ZGUgLUkvdXNyL2luY2x1ZGUvYXQtc3Bp
LTIuMCAtSS91c3IvaW5jbHVkZS92aXJnbCAtSS91c3IvaW5jbHVkZS9wMTEta2l0LTEgLUkv
dXNyL2luY2x1ZGUvU0RMMiAtSS91c3IvaW5jbHVkZS9jYWNhcmQgLUkvdXNyL2luY2x1ZGUv
bnNzMyAtSS91c3IvaW5jbHVkZS9uc3ByNCAtSS91c3IvaW5jbHVkZS9zbGlycCAtZmRpYWdu
b3N0aWNzLWNvbG9yPWF1dG8gLXBpcGUgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1z
dGQ9Z251OTkgLU8yIC1nIC1pc3lzdGVtIC9ob21lL2Nib3JudHJhL1JFUE9TL3FlbXUvbGlu
dXgtaGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFkZXJzIC1pcXVvdGUgLiAtaXF1b3RlIC9o
b21lL2Nib3JudHJhL1JFUE9TL3FlbXUgLWlxdW90ZSAvaG9tZS9jYm9ybnRyYS9SRVBPUy9x
ZW11L2luY2x1ZGUgLWlxdW90ZSAvaG9tZS9jYm9ybnRyYS9SRVBPUy9xZW11L2Rpc2FzL2xp
YnZpeGwgLWlxdW90ZSAvaG9tZS9jYm9ybnRyYS9SRVBPUy9xZW11L3RjZy9zMzkwIC1pcXVv
dGUgL2hvbWUvY2Jvcm50cmEvUkVQT1MvcWVtdS9hY2NlbC90Y2cgLXB0aHJlYWQgLVVfRk9S
VElGWV9TT1VSQ0UgLURfRk9SVElGWV9TT1VSQ0U9MiAtbTY0IC1EX0dOVV9TT1VSQ0UgLURf
RklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09VUkNFIC1Xc3RyaWN0LXByb3Rv
dHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVd1bmRlZiAtV3dyaXRlLXN0cmluZ3MgLVdtaXNz
aW5nLXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3cmFw
diAtV29sZC1zdHlsZS1kZWNsYXJhdGlvbiAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XdHlw
ZS1saW1pdHMgLVdmb3JtYXQtc2VjdXJpdHkgLVdmb3JtYXQteTJrIC1XaW5pdC1zZWxmIC1X
aWdub3JlZC1xdWFsaWZpZXJzIC1XZW1wdHktYm9keSAtV25lc3RlZC1leHRlcm5zIC1XZW5k
aWYtbGFiZWxzIC1XZXhwYW5zaW9uLXRvLWRlZmluZWQgLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aD0yIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1
ZSAtV25vLXBzYWJpIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtZlBJQyAtRFNUUlVDVF9J
T1ZFQ19ERUZJTkVEIC1EX1JFRU5UUkFOVCAtV25vLXVuZGVmIC1EX0RFRkFVTFRfU09VUkNF
IC1EX1hPUEVOX1NPVVJDRT02MDAgLUROQ1VSU0VTX1dJREVDSEFSIC1NRCAtTVEgbGliY29t
bW9uLmZhLnAvaHdfaW50Y19pODI1OS5jLm8gLU1GIGxpYmNvbW1vbi5mYS5wL2h3X2ludGNf
aTgyNTkuYy5vLmQgLW8gbGliY29tbW9uLmZhLnAvaHdfaW50Y19pODI1OS5jLm8gLWMgLi4v
aHcvaW50Yy9pODI1OS5jDQouLi9ody9pbnRjL2k4MjU5LmM6IEluIGZ1bmN0aW9uIOKAmHBp
Y19yZWFkX2lyceKAmToNCi4uL2h3L2ludGMvaTgyNTkuYzoyMDM6MTM6IGVycm9yOiDigJhp
cnEy4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdl
cnJvcj1tYXliZS11bmluaXRpYWxpemVkXQ0KICAgMjAzIHwgICAgICAgICBpcnEgPSBpcnEy
ICsgODsNCiAgICAgICB8ICAgICAgICAgfn5+fl5+fn5+fn5+fn4NCmNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQoNCg0KRHVlIHRvIG90aGVyIGNvbXBpbGUg
d2FybmluZ3MgSSBmaW5kIHRoaXMgaGFyZCB0byBiaXNlY3QuIEhhcyBhbnlvbmUgc2VlbiB0
aGlzIGFzIHdlbGw/DQo=

