Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56044150C6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:54:04 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8Jf-00054l-Bd
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mT8Hi-0003PS-83; Wed, 22 Sep 2021 15:52:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mT8Hf-0000Rb-4R; Wed, 22 Sep 2021 15:52:02 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MJdDfx030420; 
 Wed, 22 Sep 2021 15:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6X27qNiCoLE5D4p6H1ENf1oEUgUy0wuSq9worWXPPuE=;
 b=bp8NiQh3gIA1sj2FBEYBMJzO6cWZ1Wx4k1f8F1yorpmiPrehAVnozL5R+dsD+pXlF8Uz
 fg50Zf3x+PT4T5zKeL778eryl7m5G6QpmiJho4afZ9Txyd4gf5d6O5G8itOooxjLkNM0
 SfrPOZgg2Sw8sCZxYgZ39xuIreim7F6lcQwOuvJ2tXgceWPc14UZvO1JsaOVaZjwnbBm
 TfTZ20x8cdYcs5SMjLocgyKg/JmlorYSKIhlhL7+k9sGkaML/1E+FbT+Cnh6xq+u3E+W
 9rabkbYN64c8l9f0neHP6wxNYc82jzZWff+gqX/myCox0Efjk+DLPWPZtZFKVQBcChr9 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8au3g7cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 15:51:53 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18MJffgu014086;
 Wed, 22 Sep 2021 15:51:52 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8au3g7c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 15:51:52 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18MJm1vc024889;
 Wed, 22 Sep 2021 19:51:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3b7q6ptr2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 19:51:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18MJpkbh3539606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 19:51:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED3B7A4051;
 Wed, 22 Sep 2021 19:51:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E49EA404D;
 Wed, 22 Sep 2021 19:51:45 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.4.199])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Sep 2021 19:51:45 +0000 (GMT)
Date: Wed, 22 Sep 2021 21:51:43 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 18/28] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <20210922215143.7f289016.pasic@linux.ibm.com>
In-Reply-To: <20210906162420.5af35eb9.pasic@linux.ibm.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-19-pbonzini@redhat.com>
 <20210906162420.5af35eb9.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3ED8RJs9OVxk3t969ai7KLBeBt10gJWa
X-Proofpoint-ORIG-GUID: Jou55GtoNk2dair_R_sPDj0AKeydEsKC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_07,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220128
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:AIO" <linux-aio@kvack.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Hoeppner <Jan.Hoeppner@de.ibm.com>, Stefan Haberland <sth@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sep 2021 16:24:20 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Fri, 25 Jun 2021 16:18:12 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > bs->sg is only true for character devices, but block devices can also
> > be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> > returns bytes in an int for /dev/sgN devices, and sectors in a short
> > for block devices, so account for that in the code.
> > 
> > The maximum transfer also need not be a power of 2 (for example I have
> > seen disks with 1280 KiB maximum transfer) so there's no need to pass
> > the result through pow2floor.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>  
> 
> We have found that this patch leads to in guest I/O errors when DASD
> is used as a source device. I.e. libvirt domain xml wise something like:
> 
>     <disk type='block' device='disk'>
>       <driver name='qemu' type='raw' cache='none' io='native' iothread='1'/>
>       <source dev='/dev/disk/by-id/ccw-XXXXXXX'/>
>       <backingStore/>
>       <target dev='vdb' bus='virtio'/>
>       <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x0008'/>
>     </disk>
> 
> I don't think it is the fault of this patch: it LGTM. But it correlates
> 100%, furthermore the problem seems to be related to the value of
> bl.max_iov which now comes from sysfs. 
> 
> We are still investigating what is actually wrong. Just wanted to give
> everybody a heads-up that this does seem to cause a nasty regression on
> s390x, even if the code itself is perfect.
> 

We have figured out what is going on here. The problem seems to be
specific to linux aio, which seems to limit the size of the iovec to
1024 (UIO_MAXIOV).

Because of this requests get rejected with -EINVAL by the io_submit()
syscall. Here comes a real world example:

(gdb) p *laiocb
$5 = {co = 0x3ff700072c0, ctx = 0x3fe60002650, iocb = {data = 0x0, aio_rw_flags = 0, key = 0, 
    aio_lio_opcode = 8, aio_reqprio = 0, aio_fildes = 38, u = {c = {buf = 0x3ff70055bc0, 
        nbytes = 1274, offset = 19977953280, __pad3 = 0, flags = 1, resfd = 43}, v = {
        vec = 0x3ff70055bc0, nr = 0, offset = 19977953280}, poll = {__pad1 = 1023, 
        events = 1879399360}, saddr = {addr = 0x3ff70055bc0, len = 0}}}, ret = -22, 
  nbytes = 20586496, qiov = 0x3ff700382f8, is_read = false, next = {sqe_next = 0x0}}

On the host kernel side, the -EINVAL comes from this line:
https://elixir.bootlin.com/linux/v5.15-rc2/source/lib/iov_iter.c#L1863
in iovec_from_user() roughly via: __do_sys_io_submit()->
io_submit_one() -> aio_write() -> aio_setup_rw() -> __import_iovec().

Based on the offline discussion with the DASD maintainers, and on the
linux in source tree documentation (Documentation/block/queue-sysfs.rst
und Documentation/block/biodoc.rst), I believe that the DASD driver is
not wrong when advertising the value 65535 for queue/max_segments.

I believe QEMU jumps to the wrong conclusion in blk_get_max_iov() or
in virtio_blk_submit_multireq(), I can't really tell because I'm not
sure what the semantic of blk_get_max_iov() is. But if, I had to, I would
bet that blk_get_max_iov() returns the wrong value, when linux aio is
used. I'm not sure what is the exact relationship between max_segments
and max_iov.

One idea on how to fix this would be, to cap max_iov to UIO_MAXIOV
(unconditionally, or when linux aio is used). But I have to admit, I
don't have clarity. I couldn't even find documentation that states
this limitation of linux aio (I didn't look for it too hard though), so
I can not even be sure this is a QEMU problem.

That is why I decided to write this up first, and start a discussion on
who is playing foul with the most relevant people posted. I intend to try
myself fixing the problem once my understanding of it reaches a
sufficient level.

Thanks in advance for your contribution!

Regards,
Halil

