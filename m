Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16B5FF082
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:44:22 +0200 (CEST)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLvB-0003gi-Iy
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojLt6-0001FA-P2; Fri, 14 Oct 2022 10:42:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojLt4-0002Vd-F6; Fri, 14 Oct 2022 10:42:12 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EEagpu006171;
 Fri, 14 Oct 2022 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=K8CifaES3BEwrqMKt03vUCSuPRiPdDT6k036afu8vtU=;
 b=UGTT3DfqtKJIF/Noioa3PgJ1THo87aQV2P5lKM0Wx9Sxhl1saOGCoi9uJFbY4fuqxGtm
 Jz36fLnmp3zl6e5wyd/znWWHgUNclDan6V6TCXz6KUfae38uAgHZMEXBdJk6Ha+WVOmg
 FfpJc46CIL/hs2gsvK9qC/syWgjscmiCGeeTxruzVgsg7LCONzXndAXcB9NpzXgTCIOX
 2uPtVhWy3Ij4ScIg61FJmw2Z/XDKctZ2L1ZnjN/zlVXbWxmvIwDlrxzDt9J95ShCFJyK
 MDlngeZM2cIOub8efvsMl/yzz+5hKniWngZBy9bsYCeuICllZ4qO6U4I+VtkVs8/yWLH PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k78df39ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:41:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EEc4Ua016603;
 Fri, 14 Oct 2022 14:41:52 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k78df399a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:41:52 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EEa1tN025382;
 Fri, 14 Oct 2022 14:41:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3k30ub6k8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:41:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EEfm0i43254194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 14:41:48 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C2F158043;
 Fri, 14 Oct 2022 14:41:49 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBB7F5805E;
 Fri, 14 Oct 2022 14:41:48 +0000 (GMT)
Received: from localhost (unknown [9.77.138.198])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Oct 2022 14:41:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 13/29] target/ppc: remove unused interrupts from
 p8_next_unmasked_interrupt
In-Reply-To: <20221011204829.1641124-14-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-14-matheus.ferst@eldorado.org.br>
Date: Fri, 14 Oct 2022 11:41:46 -0300
Message-ID: <87pmeu4gd1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PBftFnlZSV6vW_JKkptfQ-uYV9DfTxjZ
X-Proofpoint-ORIG-GUID: 29yrwtTEaCbEsXiqAARD5GvmOIg-Rp6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=872 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Remove the following unused interrupts from the POWER8 interrupt masking
> method:
> - PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970, and POWER5p;
> - Debug Interrupt: removed in Power ISA v2.07;
> - Hypervisor Virtualization: introduced in Power ISA v3.0;
> - Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
>   for embedded CPUs;
> - Critical Doorbell: processor does not implement the "Embedded.Processor
>   Control" category;
> - Programmable Interval Timer: 40x-only;
> - PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

