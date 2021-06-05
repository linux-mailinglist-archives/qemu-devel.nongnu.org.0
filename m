Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B239C9B7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:03:58 +0200 (CEST)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpYmD-0003j1-Bv
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1lpYjp-0007af-CC; Sat, 05 Jun 2021 12:01:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1lpYjl-0008Te-Tj; Sat, 05 Jun 2021 12:01:29 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 155Fu7Tc020849; Sat, 5 Jun 2021 16:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YtnzqbrSR+t2OqYB5yYM2icd3UEn1gAs3mbYpb55KQ8=;
 b=MntmWr2V99orG6Bc3LXy/vCqCEnx2xVuGO5Yoc7/rZOKi6hPZ9F+z2Lbsmr/uWC6kP9H
 TJiKnlCV8IP761IOFSLzXXCzXxJXzEWyDEznSKtMOdbA0IZooCePm/owtcklMZXZ/vSk
 YBRjG6+nlnNx0cKJjuLMPn2nFqzDPup/151axxCY3G86wlx8Z/amg1eE5G91epoL2Lfc
 6i+paaV0+PjaoLmvlLdiLcTUkexUFHoISd0+c5VEMD/rHGTyIPnte7sBpAoAzSGutjEr
 Hg4nas4rhfMAeatxZ6fh0A+rgNX0YIUq5PgsefLtn9FNJzQM4E27r0SdzOCQ2tnQK0A8 kQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3900vrg50m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 05 Jun 2021 16:01:20 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 155FujWq072255;
 Sat, 5 Jun 2021 16:01:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 38yxcsmp14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 05 Jun 2021 16:01:19 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 155G1IRw024334;
 Sat, 5 Jun 2021 16:01:18 GMT
Received: from [10.175.188.167] (/10.175.188.167)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 05 Jun 2021 09:01:17 -0700
From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH 0/2] Improve vmstate_vmbus_dev handling
To: Thomas Huth <thuth@redhat.com>
References: <20210603104139.556512-1-thuth@redhat.com>
Message-ID: <29f1529e-5865-db7e-698d-e7a046f012a3@oracle.com>
Date: Sat, 5 Jun 2021 18:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210603104139.556512-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10006
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106050116
X-Proofpoint-ORIG-GUID: 5QwytzCJ2PGUUOz2g-Cv27WLcMO_9Mg3
X-Proofpoint-GUID: 5QwytzCJ2PGUUOz2g-Cv27WLcMO_9Mg3
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=maciej.szmigiero@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Jon Doron <arilou@gmail.com>,
 Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 03.06.2021 12:41, Thomas Huth wrote:
> I accidentally came accross vmstate_vmbus_dev and noticed that
> it is currently not used at all ... wire it up and make it
> static, since it is only used in one file.
> 
> Thomas Huth (2):
>    hw/hyperv/vmbus: Wire up vmstate_vmbus_dev
>    hw/hyperv/vmbus: Make vmstate_vmbus_dev static
> 
>   hw/hyperv/vmbus.c         | 29 +++++++++++++++--------------
>   include/hw/hyperv/vmbus.h |  3 ---
>   2 files changed, 15 insertions(+), 17 deletions(-)
> 

I think the idea is to embed vmstate_vmbus_dev into a child device
VMStateDescription using VMSTATE_STRUCT() - since particular VMBus
devices aren't merged yet there are currently no users of it.

This is similar how USB devices VMState is organized - see
vmstate_usb_device and VMSTATE_USB_DEVICE() macro.

Thanks,
Maciej

