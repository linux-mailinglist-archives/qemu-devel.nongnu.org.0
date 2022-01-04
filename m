Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011D48479F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:16:36 +0100 (CET)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oMO-0000cP-4O
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:16:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4oKW-0007mS-QE
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:14:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4oKV-0008EG-7N
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:14:40 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204H5MDv014921
 for <qemu-devel@nongnu.org>; Tue, 4 Jan 2022 18:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gN6shiEZuBgEIj353BwyAn4UoktHToOgxBOU1OvmqbU=;
 b=jh7dWfxTPfb1wjwxgfw8sW3jYEUTyLYYcPzj4FSxGrVqDXWYAN+H3MVbWmhW0nPu/xdo
 oKGCxjqR+XsvNirZRywFDgWZUMK1aGU2tPQtG8LOWcOeIfGMd1i1rnS0s9FyY6y7wG21
 QptI4fb38m2pVSDTSqaMgJaHwBCkEWCb/eYM5KZVKQetMEJlyugoSygj69z9Afi84YhX
 QBH7Blgxbj2h0Og402fKLkn6CW3UkRQid8lofOJpjnQdJuPGhjWrgquE/hJCDRl8/tXD
 ogoxBiCXhAVIk6/5WwVt3nmjsQtuIACl1ze8E3T8ECX0bJNcydWyluCpP9FwgYf7yd5h 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqu1cjee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 18:14:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204ID72m013713
 for <qemu-devel@nongnu.org>; Tue, 4 Jan 2022 18:14:37 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqu1cje8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 18:14:37 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204I6mhQ008698;
 Tue, 4 Jan 2022 18:14:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3daekaush0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 18:14:36 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204IEZYJ31719724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 18:14:35 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8020C6E052;
 Tue,  4 Jan 2022 18:14:35 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26B1B6E054;
 Tue,  4 Jan 2022 18:14:35 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jan 2022 18:14:34 +0000 (GMT)
Message-ID: <31ef626c-ad4b-b948-41c9-5627f08163ba@linux.ibm.com>
Date: Tue, 4 Jan 2022 13:14:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 0/3] tpm: Add missing ACPI device identification objects
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <YdSNUYNxa/g1P3BR@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <YdSNUYNxa/g1P3BR@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aDrJzsTYMp-ySkd9JNYASJ_L_Cq9G0I2
X-Proofpoint-GUID: rbGfwC3-E9z1xM8HfwalQrDgOvGdYrDG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/4/22 13:09, Daniel P. Berrangé wrote:
> On Tue, Jan 04, 2022 at 12:58:03PM -0500, Stefan Berger wrote:
>> This series of patches adds missing ACPI device identification objects _STR
>> and _UID to TPM 1.2 and TPM 2 ACPI tables.
> What was the practical impact on guests (if any) from these ACPI
> objects being missing ?

As discussed in v4: I don't know if there's software relying on this or 
just a user who found these to be missing:

https://gitlab.com/qemu-project/qemu/-/issues/708

I can only say that these entries were missing, so I added them. It 
makes TPM ACPI more complete, for sure. Maybe someone else knows more if 
there's something out there that actually needs this. I'd be curious as 
well.

    Stefan

>
> Regards,
> Daniel

