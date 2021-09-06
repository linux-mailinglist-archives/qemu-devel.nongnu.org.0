Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15501401CFB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:25:54 +0200 (CEST)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFZJ-0001kc-58
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mNFYB-0000gH-Ap
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:24:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mNFY9-0002vj-NR
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:24:43 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186EB0Hp093857
 for <qemu-devel@nongnu.org>; Mon, 6 Sep 2021 10:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hffWge1NEV8UOwrAvY8wM1DpU+B40ZHbMxCCfrmb7vk=;
 b=rQe9p2F+tava+Dx4WcympuJrogB5BqVSpfgWt1U2Nqv6Az6jlIsnYZtbzkIQwUHy8Rfs
 R2vKTw9KiJ1B07elQvdovJOgDPWpzHegjinYHVgX5kfBzi6IX2pR6N3QyXJlTO/H2BtU
 nn/KX5Fs9IrgO4AVls/MwkUPK+kujv6f7gYaIxlmQecVvI+FSsPDLQVuHtf65Q9ymOVL
 tNUacYZMtFcc0tcJSSpgoSO3Nh7XXx9xIdlOTLpMbyy1IWDM48xuudUgDQGoNmFxk8xU
 wRzfhpcaR65Ix49YlZ4hR+y3iVDy3fcEp5uGSH5B0zl08VnFw/AUY9APmlweq2xg6wWJ 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awhbymtr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 10:24:38 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 186EBLoV095189
 for <qemu-devel@nongnu.org>; Mon, 6 Sep 2021 10:24:38 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awhbymtqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 10:24:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 186EDQdu004143;
 Mon, 6 Sep 2021 14:24:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3av02jda4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 14:24:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 186EOXbB56033552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 14:24:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E8484C058;
 Mon,  6 Sep 2021 14:24:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 182D84C046;
 Mon,  6 Sep 2021 14:24:33 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.69.63])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  6 Sep 2021 14:24:33 +0000 (GMT)
Date: Mon, 6 Sep 2021 16:24:20 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 18/28] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <20210906162420.5af35eb9.pasic@linux.ibm.com>
In-Reply-To: <20210625141822.1368639-19-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-19-pbonzini@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NhCXds4iN-n0mNnkFPZ0DYwJdrb2NF_z
X-Proofpoint-ORIG-GUID: ZnkOSNHM-w1f_j79f72tYki-lb_NSbYd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060090
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 16:18:12 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> bs->sg is only true for character devices, but block devices can also
> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> returns bytes in an int for /dev/sgN devices, and sectors in a short
> for block devices, so account for that in the code.
> 
> The maximum transfer also need not be a power of 2 (for example I have
> seen disks with 1280 KiB maximum transfer) so there's no need to pass
> the result through pow2floor.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

We have found that this patch leads to in guest I/O errors when DASD
is used as a source device. I.e. libvirt domain xml wise something like:

    <disk type='block' device='disk'>
      <driver name='qemu' type='raw' cache='none' io='native' iothread='1'/>
      <source dev='/dev/disk/by-id/ccw-XXXXXXX'/>
      <backingStore/>
      <target dev='vdb' bus='virtio'/>
      <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x0008'/>
    </disk>

I don't think it is the fault of this patch: it LGTM. But it correlates
100%, furthermore the problem seems to be related to the value of
bl.max_iov which now comes from sysfs. 

We are still investigating what is actually wrong. Just wanted to give
everybody a heads-up that this does seem to cause a nasty regression on
s390x, even if the code itself is perfect.

Regards,
Halil

