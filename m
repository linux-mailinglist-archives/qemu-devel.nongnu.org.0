Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11949089
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 21:51:25 +0200 (CEST)
Received: from localhost ([::1]:51602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcxf1-0007E7-K7
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 15:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55557)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1hcxcR-0006FF-8d
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:48:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1hcxcP-0004vC-Hc
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:48:42 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48966)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1hcxcO-0003hx-Ph
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:48:41 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HJT05H026644;
 Mon, 17 Jun 2019 19:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=Nr6FzsvieLhdWwVmL2bswTdLwSXYR3eOlAeAbkwJGUQ=;
 b=XGY59lDTrqudjlFjya1HFDDLRaSoAUCW1vss3y+FL6z7bfAXlt01vWu3X3MV2yBcNWVk
 OqLdQMd3IFE3ke5irtkVS/F/SlboRe6uDGN49O8HNNKC45QOZNVtsvn5to2dfCNCWr3E
 uIJYoU2Bw8Yv/J6Oj6ogkTY4c4Mmz+1XcXjz1mvi29Hj4s3buOWLUE5FGcNqc51smkq/
 PzkfW94TVsJJ8eo5yCq++tdi8bZbwHDcrPAT4nR3kIANynNy+4Ll27z4qPwEtewzrGZJ
 4hwPpdTEJJCK7uPtPZcCu1uvbhhZK4N+j/Ce5uIeTqs7YQDUrS/CTJ2ZfmRi6JuKJj2g qA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2t4saq8c81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 19:46:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HJj5DS106915;
 Mon, 17 Jun 2019 19:46:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2t5h5tb1j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 19:46:57 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5HJkpuj020193;
 Mon, 17 Jun 2019 19:46:52 GMT
Received: from heatpipe (/73.170.27.202)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 12:46:51 -0700
Date: Mon, 17 Jun 2019 12:46:49 -0700
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190617194648.GA24278@heatpipe>
References: <20190617181459.29139-1-elena.ufimtseva@oracle.com>
 <ae695f50-fa36-e6b8-9c8f-6e344da40fae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae695f50-fa36-e6b8-9c8f-6e344da40fae@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170172
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170172
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: Re: [Qemu-devel] [RFC PATCH v2 01/35] multi-process: memory: alloc
 RAM from file at offset
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, ross.lagerwall@citrix.com, liran.alon@oracle.com,
 stefanha@redhat.com, pbonzini@redhat.com, kanth.ghatraju@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 17, 2019 at 02:14:49PM -0500, Eric Blake wrote:
> On 6/17/19 1:14 PM, elena.ufimtseva@oracle.com wrote:
> > From: Jagannathan Raman <jag.raman@oracle.com>
> > 
> > Allow RAM MemoryRegion to be created from an offset in a file, instead
> > of allocating at offset of 0 by default. This is needed to synchronize
> > RAM between QEMU & remote process.
> > This will be needed for the following patches.
> 
> This message and the rest of the series was sent unthreaded (no
> References: or In-Reply-To: headers), which makes it very difficult to
> track. You'll want to fix your sending environment to ensure that
> threading is preserved correctly.
>

Hi Eric

Yes, my bad. I have adjusted my scripts.

Elena
> > 
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > ---
> 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
> 




