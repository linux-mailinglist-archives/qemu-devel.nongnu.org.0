Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA71628DC1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinH-0007Nt-08; Mon, 14 Nov 2022 18:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ouiew-0003Da-MU; Mon, 14 Nov 2022 18:14:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oucBG-0003HO-R5; Mon, 14 Nov 2022 11:19:32 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2AEGDtSh014932; Mon, 14 Nov 2022 16:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NAm2s+uEP4b1diyhZWf0MPGS2Y2i+RzBI2nlcBy+gSc=;
 b=Egchlb991HSGg8Nk+4nR5R+Iv9N/zt0MqWauzLFUNmnlWZ3GYXuJsRUAVfL0OQ4Bv1H+
 ZTJDpWTCabqDGKEJc5Lm9K3aDEc6Ot44Da7fEks+PXF1RWvO4D9L5CF7YQkUVQbowpgq
 N7YNuCwdBcSXkNBUBK39VD4N0we0nLJjGxdwEXkI0XKvsDWVCFg3rXpbVqSqH0pE2VmP
 JiyKTwvNxVIRhasWVJXsrM0wFwnvd7cOW/NE5OM4RrdiWm2gcZ0RlsIh7BqMBkFrRDqt
 hqiSHqERjTt5SB7A0CjJbP84X+3CAfeWZien4ftrK10Lmu9/zGW7e/QgQCZOAu78q1WD PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kus0q84ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:18:59 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEGDrBV014878;
 Mon, 14 Nov 2022 16:18:59 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kus0q84ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:18:59 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEG6Nri030383;
 Mon, 14 Nov 2022 16:18:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3kt34922td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:18:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AEGIso35898958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Nov 2022 16:18:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC2F75204E;
 Mon, 14 Nov 2022 16:18:54 +0000 (GMT)
Received: from [9.171.78.143] (unknown [9.171.78.143])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DCAAF52050;
 Mon, 14 Nov 2022 16:18:53 +0000 (GMT)
Message-ID: <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
Date: Mon, 14 Nov 2022 17:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20221108092308.1717426-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ws8wuQ0bk_xhtOL_IaGAp5SVt8p67WcQ
X-Proofpoint-GUID: 2zEIF0liqgsvtWjIfLYPDp9I1nIXvlRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211140114
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 08.11.22 um 10:23 schrieb Alex Bennée:
> The previous fix to virtio_device_started revealed a problem in its
> use by both the core and the device code. The core code should be able
> to handle the device "starting" while the VM isn't running to handle
> the restoration of migration state. To solve this dual use introduce a
> new helper for use by the vhost-user backends who all use it to feed a
> should_start variable.
> 
> We can also pick up a change vhost_user_blk_set_status while we are at
> it which follows the same pattern.
> 
> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>

Hmmm, is this
commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
Author:     Alex Bennée <alex.bennee@linaro.org>
AuthorDate: Mon Nov 7 12:14:07 2022 +0000
Commit:     Michael S. Tsirkin <mst@redhat.com>
CommitDate: Mon Nov 7 14:08:18 2022 -0500

     hw/virtio: introduce virtio_device_should_start

and older version?

This does not seem to fix the regression that I have reported.

