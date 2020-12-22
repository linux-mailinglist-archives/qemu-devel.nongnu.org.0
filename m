Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661502E0D13
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:08:12 +0100 (CET)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krkCo-0002u0-Vc
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1krkAJ-0001ZJ-N3
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:05:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1krkAH-0007q6-FE
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:05:35 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BMG4cu8120034;
 Tue, 22 Dec 2020 16:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 content-transfer-encoding : from : mime-version : subject : date :
 message-id : references : cc : in-reply-to : to; s=corp-2020-01-29;
 bh=pw4fExT0ZF0fnQ2babVp/BuAsaQ0FyfHedOkwYxIohQ=;
 b=IHz+3tAID/dqhLopo8t/CZg6SpF7cWBkLpsoClPR43OjbdwYzMYNUP4orgGdiZGB/4+G
 on2fcp2O1JXFR9QyZuVMZXEyMxDrArLOIfrfhiPZsv80rILztoxutRJ41x4lHxviXSKQ
 SUUSLC/oBtrkiMxpjMj0WbRYaPYdUk3RRyCJSF4xNaUIthLLiKqzEmYfHUQyQCdBbZEP
 IH10D6aUnwBaz1rSIrPuTzRRqNQjfhocSFrDdnrPM0ePgBhtYqW8delDcLHFa+wrmOEn
 k+l0GBMn6qDKEYNa7VjquCDggDRurZ7qyY9KuiD/oivPf2Numb6Z6XXoaPsaXCilz3go 6w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35k0d8c4dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Dec 2020 16:05:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BMG1aIZ192634;
 Tue, 22 Dec 2020 16:03:28 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35k0e1gq0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Dec 2020 16:03:28 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BMG3RsM009744;
 Tue, 22 Dec 2020 16:03:27 GMT
Received: from [10.139.169.170] (/109.166.128.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Dec 2020 08:03:27 -0800
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mihai Carabas <mihai.carabas@oracle.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 2/3] hw/misc/pvpanic: add PCI interface support
Date: Tue, 22 Dec 2020 18:03:24 +0200
Message-Id: <9C823DFA-9E6A-4D38-AB50-EFB6528124DD@oracle.com>
References: <20201222153034.r7lgpmrycx6k6kr4@sirius.home.kraxel.org>
In-Reply-To: <20201222153034.r7lgpmrycx6k6kr4@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: iPhone Mail (17H35)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9842
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012220118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9842
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012220119
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 22 Dec 2020, at 17:30, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> =EF=BB=BF
>>=20
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index 259f9c9..e9512ab 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -108,6 +108,7 @@ extern bool pci_available;
>> #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>> #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
>> #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
>> +#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0101
>=20
> qxl has 0x100 for historical reasons, otherwise devices are simply
> enumerated upwards.  NVME has 0x10, so PVPANIC should simply take
> the next free which is 0x11.  Didn't I mention that in my last mail?
>=20
> thanks,
>  Gerd
Sorry, my mistake. I did not read your email carefully. Consider this modifi=
cation done.

Waiting for other feedback a couple of days and I will send a new revision w=
ith this update.

Thank you,
Mihai
>=20


