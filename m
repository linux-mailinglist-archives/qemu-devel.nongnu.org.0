Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98408357281
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:57:04 +0200 (CEST)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBUF-0006Os-NO
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUBS2-0005FJ-RM; Wed, 07 Apr 2021 12:54:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUBRx-0006sb-I0; Wed, 07 Apr 2021 12:54:46 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137GZ5ft124656; Wed, 7 Apr 2021 12:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hTPLJOEQHYmmnaWJyDaQ8eCE/PpN9vsvS4I3f+Vg4bE=;
 b=aXSLGd0GIDhkcOaU8prk9vRANLQPxmVAe4vSXjxhHJ5wS1JgR8FUmotMTLaCGvjT22KF
 FOjhIyD5fvNxxZ8IKRcgq+KkPXHSYfRzu/0fCm6jzN0QIi92XcGv++Xbg+GICIXp4Crk
 /ADaPbafujMw9UzK4ABN4FUbClUjuLbPIGC8LpA+E2aYWPMr1/2xK7BJe8Ihg6ZZUUxf
 Etq77lQDLSmFNr6yAK2tRH2jzb36IEkLaxudpXz7ps/xJsste71JLD2MwKR1zGSMrsNv
 EMvEWcWZi5tOTRsGZw32wSBdIOrXVUh69yUWrNBjuqFy2ITM8CfcLNaJz7Sa2ZuhJEKn 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw7jqq84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 12:54:36 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 137GZ7CT124899;
 Wed, 7 Apr 2021 12:54:36 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw7jqq6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 12:54:35 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137GsOs9025819;
 Wed, 7 Apr 2021 16:54:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 37rvbvgfsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 16:54:33 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 137Gs9mM25231858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 16:54:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E42A94203F;
 Wed,  7 Apr 2021 16:54:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE36342047;
 Wed,  7 Apr 2021 16:54:28 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.56.50])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 16:54:28 +0000 (GMT)
Date: Wed, 7 Apr 2021 18:54:26 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210407185426.257ed03d.pasic@linux.ibm.com>
In-Reply-To: <c541aacd-34cb-3ed5-0016-cca1064c67e6@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210406170306.1be374c2.cohuck@redhat.com>
 <c541aacd-34cb-3ed5-0016-cca1064c67e6@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y4wMebFzYXpFFniA31icDgQOXtK_mqyn
X-Proofpoint-ORIG-GUID: qYGeKvGY1_B8SQ93_w5qCIV6z7PNly0y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_08:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, david@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 13:41:57 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> > Here, however, I'm not sure. Returning a negative error here is fine,
> > but handle_payload_3270_write (not changed in this patch) seems to
> > match everything to -EIO. Shouldn't it just be propagated, and maybe 0
> > mapped to -EIO only? If I'm not confused, we'll end up mapping every
> > error to intervention required.  
> 
> I know very little about the 3270 but in my opinion accessing memory is 
> not the problem of the device but of the subchannel.
> So we should certainly propagate the error instead of returning -EIO for 
> any error.

I agree, what condition needs to be indicated when we encounter an
invalid CCW, IDAW or MIDAW address is clear. In the PoP this is
described under Chapter 16. I/O Interruptions > Subchannel-Status Word >
Subchannel-Status Field > Program Check in the paragraphs on "Invalid
IDAW or MIDAW Address and "Invalid CCW Address".

My guess about handle_payload_3270_write() is that IMHO the initial 3270
emulation code was, let's say of mixed quality in the first place, so
wouldn't seek some hidden meaning/sense, behind the -EIO. IMHO first
mapping architectural conditions to "errno-style" error codes, passing
these around, and then mapping them back is a litle non-intuitive. If one
looks at the purpose of handle_payload_3270_write(), it is basically
emulating an IO data transfer from the device into the main storage. If
that sort of operation. So with -EIO the original author probably wanted
to say: hey there was an input/output error, which ain't that wrong. The
problem is that somewhere up the call stack EIO gets interpreted in a
very peculiar way, and along with other errnos mapped to CIO
architecture stuff like SCSW bits.

Regards,
Halil

