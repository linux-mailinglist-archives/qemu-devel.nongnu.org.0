Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2D2CC1A7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:07:20 +0100 (CET)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUf1-0002v2-8p
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kkUdU-0001cU-Mw
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:05:44 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kkUdS-0000xc-O7
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:05:44 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2G0mJm030523;
 Wed, 2 Dec 2020 16:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=xxcjt3mtG/KHaHQo8wbjGj0uXaf0aqSvVB1wzb68+XY=;
 b=Ng6LiJvBxoTLeeEEscwn8EX4TpUHsrxSmJzWO4/rQ3wRS62vip44iU0QTVTJVqyjT8Yp
 1GIFZxWuNBNVVYZHgoli3rnLpLgUPo6ldW0PkjMhvci6CT8nDJu5AtmCdF+gFUG65qI5
 WDsbJgUcGFsw29u7JQzgRF0Syvqa1i8YOuO3hpYxeeh0DaxbUleQVKsPxkiFNYGjcjse
 qCbbc9u4WoL9rhf8Gk8QhpMYFIkaW8EnGise+pQlsnCb8YMxqFES5JmSOPJTNuwF0G0t
 Z5d+qsVOIte6zvxL+wIWdIy3rdp1DCluR/OGeNLsYIgvWE3/8n1ZOiSgF+1gUT0vQOIZ 4g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 353c2b18gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 02 Dec 2020 16:05:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2FaYLT105718;
 Wed, 2 Dec 2020 16:05:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3540aug246-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Dec 2020 16:05:04 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B2G52hx017490;
 Wed, 2 Dec 2020 16:05:02 GMT
Received: from [20.15.0.5] (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Dec 2020 08:05:01 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 1/1] qemu vhost scsi: add VHOST_SET_VRING_ENABLE support
From: Michael Christie <michael.christie@oracle.com>
In-Reply-To: <20201202045807-mutt-send-email-mst@kernel.org>
Date: Wed, 2 Dec 2020 10:05:00 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <62EE5A4E-E817-43FC-91B7-0B1050D034C7@oracle.com>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
 <20201202045807-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020095
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=michael.christie@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 2, 2020, at 3:59 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> On Thu, Nov 12, 2020 at 05:19:00PM -0600, Mike Christie wrote:
>> diff --git a/linux-headers/linux/vhost.h =
b/linux-headers/linux/vhost.h
>> index 7523218..98dd919 100644
>> --- a/linux-headers/linux/vhost.h
>> +++ b/linux-headers/linux/vhost.h
>> @@ -70,6 +70,7 @@
>> #define VHOST_VRING_BIG_ENDIAN 1
>> #define VHOST_SET_VRING_ENDIAN _IOW(VHOST_VIRTIO, 0x13, struct =
vhost_vring_state)
>> #define VHOST_GET_VRING_ENDIAN _IOW(VHOST_VIRTIO, 0x14, struct =
vhost_vring_state)
>> +#define VHOST_SET_VRING_ENABLE _IOW(VHOST_VIRTIO, 0x15, struct =
vhost_vring_state)
>=20
> OK so first we need the kernel patches, then update the header, then
> we can apply the qemu patch.

Hey Michael,

Don=E2=80=99t waste any more of your time on this patch and the kernel =
related ones.

I=E2=80=99m working on the userspace initiated threading approach =
discussed the other week.=

