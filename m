Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B153254F9C0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 17:01:13 +0200 (CEST)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DTE-0008Q6-8k
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 11:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o2DQ6-0005zp-I2; Fri, 17 Jun 2022 10:57:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o2DPy-0001KA-8D; Fri, 17 Jun 2022 10:57:53 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HETpen024084;
 Fri, 17 Jun 2022 14:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=XMQI4TGArTgrxEFvzKqwOFhOw1f1H9VcvmCPN7p0NmU=;
 b=X/LdkK+az++SnAdykfo7b7c6tEeIL+ORkxSXRI2cTpaTbsI80B+aesPOSxBn3MIPehjE
 9mINsgeqJ2ptF9ZnLzm4dmB6RVN9kBYNXz3WMToGWmzZrfHQkVdJxoR1AECJuCDNn9gV
 +WrIHQiqRh+Sh0Tdz7gMVCYC0zWfdzxRs/bIWoP/Oiu95Vm9QkZRi2S1yFHiX78tV78h
 Uvf7GQuxfao7GSpBQ1ii7782rX4IsYXMsRiDjC6oJubSQCzz/gN4/fl8akWnKabtBv8a
 zNqB4YyvHKfc/fOV11/SsOEFWBlObU5yRUnMqGPvFb8+ETsNPQB67B8rr1UDnlweoVJi kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grue78p2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 14:57:35 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25HEUNWe030785;
 Fri, 17 Jun 2022 14:57:35 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grue78p2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 14:57:35 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25HEpkre013835;
 Fri, 17 Jun 2022 14:57:34 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3gmjpau39c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 14:57:34 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25HEvXIR27197842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 14:57:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7A8DAC05E;
 Fri, 17 Jun 2022 14:57:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C593AC059;
 Fri, 17 Jun 2022 14:57:33 +0000 (GMT)
Received: from localhost (unknown [9.160.164.180])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 17 Jun 2022 14:57:32 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] target/ppc: cpu_init: Clean up stop state on cpu reset
In-Reply-To: <20220617095222.612212-1-fbarrat@linux.ibm.com>
References: <20220617095222.612212-1-fbarrat@linux.ibm.com>
Date: Fri, 17 Jun 2022 11:57:31 -0300
Message-ID: <87letv9w2s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Urx3OO_CtVF7dm-B0MKCj1MIPsIVz_hZ
X-Proofpoint-GUID: orX9k65p6VHua5QwS-9I30X6t0j20NAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_09,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206170061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Frederic Barrat <fbarrat@linux.ibm.com> writes:

> The 'resume_as_sreset' attribute of a cpu is set when a thread is
> entering a stop state on ppc books. It causes the thread to be
> re-routed to vector 0x100 when woken up by an exception. So it must be
> cleared on reset or a thread might be re-routed unexpectedly after a
> reset, when it was not in a stop state and/or when the appropriate
> exception handler isn't set up yet.
>
> Using skiboot, it can be tested by resetting the system when it is
> quiet and most threads are idle and in stop state.
>
> After the reset occurs, skiboot elects a primary thread and all the
> others wait in secondary_wait. The primary thread does all the system
> initialization from main_cpu_entry() and at some point, the
> decrementer interrupt starts ticking. The exception vector for the
> decrementer interrupt is in place, so that shouldn't be a
> problem. However, if that primary thread was in stop state prior to
> the reset, and because the resume_as_sreset parameters is still set,
> it is re-routed to exception vector 0x100. Which, at that time, is
> still defined as the entry point for BML. So that primary thread
> restarts as new and ends up being treated like any other secondary
> thread. All threads are now waiting in secondary_wait.
>
> It results in a full system hang with no message on the console, as
> the uart hasn't been init'ed yet. It's actually not obvious to realise
> what's happening if not tracing reset (-d cpu_reset). The fix is
> simply to clear the 'resume_as_sreset' attribute on reset.
>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

