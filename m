Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3954213DB0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:43:15 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrOmQ-0005rl-Sz
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1jrOct-0005ry-6x
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:33:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1jrOcr-00085A-FX
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:33:22 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063GWLJi051730; Fri, 3 Jul 2020 12:33:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322144vcnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 12:33:18 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 063GWdhZ052640;
 Fri, 3 Jul 2020 12:33:18 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322144vcn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 12:33:18 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 063GUrqq004811;
 Fri, 3 Jul 2020 16:33:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 321kkys5vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 16:33:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 063GXD7627722228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 16:33:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB8F7805F;
 Fri,  3 Jul 2020 16:33:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B83E978060;
 Fri,  3 Jul 2020 16:33:13 +0000 (GMT)
Received: from [153.66.254.194] (unknown [9.85.161.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 16:33:13 +0000 (GMT)
Message-ID: <1593793992.3972.33.camel@linux.ibm.com>
Subject: Re: [PATCH v2] SEV: QMP support for Inject-Launch-Secret
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Fri, 03 Jul 2020 09:33:12 -0700
In-Reply-To: <20200703160208.GG6641@work-vm>
References: <20200702194213.23272-1-tobin@linux.vnet.ibm.com>
 <20200703110929.GB6641@work-vm> <1593791654.3972.26.camel@linux.ibm.com>
 <20200703160208.GG6641@work-vm>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_13:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 cotscore=-2147483648
 suspectscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007030110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 11:35:39
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Reply-To: jejb@linux.ibm.com
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, tobin@ibm.com,
 qemu-devel@nongnu.org, Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2020-07-03 at 17:02 +0100, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
> > On Fri, 2020-07-03 at 12:11 +0100, Dr. David Alan Gilbert wrote:
> > > * Tobin Feldman-Fitzthum (tobin@linux.vnet.ibm.com) wrote:
> > 
> > [...]
> > > > +    input.trans_uaddr = (uint64_t)data;
> > > > +    input.trans_len = data_sz;
> > > > +
> > > > +    input.guest_uaddr = (uint64_t)hva;
> > > 
> > > Thanks for changing these; although it fails a 32bit build (which
> > > is probably mostly pointless for SEV, but it fails the build
> > > rather than building it out). The easy fix here seems to be:
> > >    (uint64_t)(uintptr_t)
> > 
> > That's a pointer width issue.  The recommended way to communicate
> > to the compiler that we really want to cast a 32 bit pointer to a
> > 64 bit value is actually to cast to unsigned long before casting to
> > pointer, so
> > 
> > (uint64_t)(unsigned long)hva
> > 
> > Many other things work, of course, but if you follow the
> > recommendation you (hopefully) don't trip future compiler warnings.
> 
> OK, fair enough
> (Out of curiosity can you explain why unsigned long not uintptr_t?)

You have to cast it to a matching variable size integer first, so both
unsigned long and uintptr_t work because they're 64 bits on LP64 and 32
bits on ILP32.  The only minor problem with uintptr_t is that the
checker may or may not be programmed to know what it does and there's
nothing more annoying than trying to get a warning message you know to
be wrong fixed.

James


