Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A822E9EE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 12:24:01 +0200 (CEST)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k00Ib-0006ko-0Y
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 06:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1k00HW-00069s-MQ; Mon, 27 Jul 2020 06:22:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1k00HU-0004nY-Ne; Mon, 27 Jul 2020 06:22:54 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RA34sX183814; Mon, 27 Jul 2020 06:22:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32htsjv0n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 06:22:49 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RA35Sp183844;
 Mon, 27 Jul 2020 06:22:48 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32htsjv0mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 06:22:48 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RAL1hf003364;
 Mon, 27 Jul 2020 10:22:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpw998n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 10:22:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RAMhuQ58785856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 10:22:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 802B0A404D;
 Mon, 27 Jul 2020 10:22:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07625A4057;
 Mon, 27 Jul 2020 10:22:43 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.147.182])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 10:22:42 +0000 (GMT)
Date: Mon, 27 Jul 2020 12:22:41 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/1] s390x/s390-virtio-ccw: fix loadparm property getter
Message-ID: <20200727122241.222e4127.pasic@linux.ibm.com>
In-Reply-To: <0ce16e30-a5ea-f9ff-89a8-83c393b5118c@redhat.com>
References: <20200723162717.88485-1-pasic@linux.ibm.com>
 <0ce16e30-a5ea-f9ff-89a8-83c393b5118c@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_06:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 06:22:50
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jul 2020 18:37:50 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 23/07/2020 18.27, Halil Pasic wrote:
> > The function machine_get_loadparm() is supposed to produce as C-string,
> 
> sed "s/ as / a /"
>

Nod.
 
> > that is a null-terminated one, but it does not. ElectricFence can detect
> 
> maybe: sed "s/null/NUL/"
> 

https://en.wikipedia.org/wiki/Null-terminated_string

but it does not matter to me all that much.

> > this problem if the loadparm machine property is used.
> > 
> > Let us make the returned string a null-terminated one.
> 
> dito
> 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Fixes: 7104bae9de ("hw/s390x: provide loadparm property for the machine")
> > ---
> >  hw/s390x/s390-virtio-ccw.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > index 8cc2f25d8a..e0e4a69ac8 100644
> > --- a/hw/s390x/s390-virtio-ccw.c
> > +++ b/hw/s390x/s390-virtio-ccw.c
> > @@ -701,8 +701,12 @@ bool hpage_1m_allowed(void)
> >  static char *machine_get_loadparm(Object *obj, Error **errp)
> >  {
> >      S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
> > +    char *loadparm_str;
> >  
> > -    return g_memdup(ms->loadparm, sizeof(ms->loadparm));
> > +    /* make a null-terminated string */
> 
> maybe: sed "s/null/NUL/"
> 
> > +     loadparm_str = g_memdup(ms->loadparm, sizeof(ms->loadparm) + 1);
> 
> Wrong indentation.

Nod.

> 
> > +    loadparm_str[sizeof(ms->loadparm)] = 0;
> > +    return loadparm_str;
> >  }
> 
> With the cosmetics fixed:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Thanks!

Regards,
Halil

