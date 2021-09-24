Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABAD416F0D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:36:25 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThd2-0000WG-MI
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1mThbJ-0008Fa-TB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:34:38 -0400
Received: from mail-mw2nam10on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::60b]:60481
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1mThbH-0002GD-1V
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:34:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neF4mxu9spzYiz0SgYNhdl7Lth9T/cVpU/0YNyjbdKEPuhIUrCM7DyaIjoIwFFeDYx+TWA+8VsneYxSkMM+37cnZzhHEIG7sQQullvfMn7dNg7HWmIWbB5BxRh/AocJf6LyI4LM9ifrvQiNi9/GAoTsEojWCBqJ5R+3mKi/6h+oV39glbIneJzmRpX17fP2nXAAXpZYfMx6rCMwZUrsdwee16UdZ7LJY6ltJmpdnjStPSYRXUeGfvnizlErvP+GaSSYNCKoTp7zMSRJ/y2SZJrS20PVCHEGVSxE9FauGx2uqFTedSY9U7hSndLpGX0YyWovK1SdOMTVLWSH+Er9LuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QBoNq5MtWXgIX/iicT5nd+zPLHZs1Zt5/TqWyNtTldY=;
 b=n8HbL8wdU0wLk/fvioEDjbpAjGK7UjZtQ88Y2pCX366mMhTn42EWT3IxFtfSlZdoh9nDtQ4glycWL2E9h1FEAbyVixbGzcDr0BVRFnUHB6wOeYu0SJ9jkqULq5SVa9IYFAdw+pL8imIijaTURqr4J9QqYc/GnvKa20cqG0ewn2hQw9XlwSKgiQb5Rh3/iWhL2k1hMq0ePdPkRF3wkFMlNvtD4hYvQqnTnee/dxRtBTxXkwrlrUUrIDTuTfSkAYs+Pmm91IjQlrRvDOt40yw341gKBty6L9OMsWhVL7Lw1jBzuahGK05aSFD12TNY99aW8B42dAUB6nsdoQLWMWva7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBoNq5MtWXgIX/iicT5nd+zPLHZs1Zt5/TqWyNtTldY=;
 b=Cqp0SQPwWz7BtOyFi95b/h4Kqlv+vqodjuS3OToISk6d0RmXJyXU6cyt9TSYYduVdGTPOzZMZ2YDNFYaG8wYIy/iOC9SkXLBKTshtljv+EUzjQ/oO6FxPNIU7lxPM0XW57PivJufnU3f4ZEQaG1UkGMJTjVbT89HNxWs+SXTki4tv23xbHSvUfSJAoFqxHWc+eAyhsKLH5qB2smc7MryCQGhZjLqLRTG4qlgbkRKpXC8UyhuNYqOhxtoDSFq1Yq/zS0oljkkaHepCGhEfT5XrB4Yx9+JYO/wdwtRkHPhgF/z/cSOyMMpLlg5O1Keg55eNk5BdyGaSngW0/Yh8aSeZw==
Received: from DS7PR06CA0012.namprd06.prod.outlook.com (2603:10b6:8:2a::22) by
 CH2PR12MB3974.namprd12.prod.outlook.com (2603:10b6:610:2e::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Fri, 24 Sep 2021 09:29:29 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::b2) by DS7PR06CA0012.outlook.office365.com
 (2603:10b6:8:2a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 09:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:29:29 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 09:29:28 +0000
Received: from [10.40.102.56] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 09:29:23 +0000
Subject: Re: [question] VFIO Device Migration: The vCPU may be paused during
 vfio device DMA in iommu nested stage mode && vSVA
To: "Tian, Kevin" <kevin.tian@intel.com>, Kunkun Jiang
 <jiangkunkun@huawei.com>, Tarun Gupta <targupta@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Eric Auger <eric.auger@redhat.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 "liulongfang@huawei.com" <liulongfang@huawei.com>, "tangnianyao@huawei.com"
 <tangnianyao@huawei.com>, "Liu, Yi L" <yi.l.liu@intel.com>, "Zhao, Yan Y"
 <yan.y.zhao@intel.com>
References: <7494b6a8-8dae-cbe9-fcff-29e10a4f0015@huawei.com>
 <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <06cb5bfd-f6f8-b61b-1a7e-60a9ae2f8fac@nvidia.com>
Date: Fri, 24 Sep 2021 14:59:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8a1223-e4f4-465e-16d6-08d97f3dcef6
X-MS-TrafficTypeDiagnostic: CH2PR12MB3974:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3974B1A8F47255FA054CADA7DCA49@CH2PR12MB3974.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hrn/CKjczMZGRPeWuj4Vsa4CZxLePX5DZVahTb+N0jyF1/RrBedeJMf2LYaadcSdkrzETo/Y5ulV7MfXwyd54rTGGr4wQx4CYDJ67UvwxAsS8LTAIsfm5By5QU8TjZ9XSwKMXUlv4ymnILcHhK+BuvI2C70HvDww6+0uO4++YYABCcsmmYyvNJ3gds4PzxejE85EOgYbZ5eK4rZYtRnVxFeccy3d1i/l4z9hgP5TbpHfgQgyC2uGUNtWH7wRol0advPHPbsJdQkHexe1lMujcOtUzbUeKFdskOSiskkf3pytX11qGTCi0tnaw9QBpJ9ITrSvCC1ogCM/IBnqFWpLZEwtP3HDxohbufBhmxnP1XpT9iik0aN/zfarBYfuaABGGe3QW6cI90x92P8EFj3FgBWAfPiKsPw6JMrM3TENA77ZvORbqI7dMcadjEpHwaBL3Dnn3FO+5LbNrDSjF4QppuHn4vT56raVO2TNs3qxGvNat9n6dAbZsyVycbEEvOplSVbQA4+LcpkkWg7PYU5Htm8M0BBJ0ZuncVVfiZ35HEx8+TmIMiPdT1o5rzEciEywUuwIBRWeemDEiSHTJ+q7tWAFvHjRkco6wCKAT8dVfVizNjlM+bB4VeeAJxROw5zibtYP3YNe0tN0mkzTYhj1I1qosasVeAyXrATAu6aHNET+JZ5kCWjtvqD0baHsam2bxvymzPwsHfJ0RoEiVP7ApUMABZIjgbSoWGVrTwDoubU=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(53546011)(83380400001)(16576012)(31686004)(2906002)(5660300002)(16526019)(8936002)(316002)(36906005)(31696002)(110136005)(54906003)(70206006)(8676002)(26005)(426003)(186003)(70586007)(36756003)(86362001)(47076005)(36860700001)(2616005)(508600001)(82310400003)(336012)(356005)(7636003)(4326008)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:29:29.0563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8a1223-e4f4-465e-16d6-08d97f3dcef6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3974
Received-SPF: softfail client-ip=2a01:111:f400:7e89::60b;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/2021 12:17 PM, Tian, Kevin wrote:
>> From: Kunkun Jiang <jiangkunkun@huawei.com>
>> Sent: Friday, September 24, 2021 2:19 PM
>>
>> Hi all,
>>
>> I encountered a problem in vfio device migration test. The
>> vCPU may be paused during vfio-pci DMA in iommu nested
>> stage mode && vSVA. This may lead to migration fail and
>> other problems related to device hardware and driver
>> implementation.
>>
>> It may be a bit early to discuss this issue, after all, the iommu
>> nested stage mode and vSVA are not yet mature. But judging
>> from the current implementation, we will definitely encounter
>> this problem in the future.
> 
> Yes, this is a known limitation to support migration with vSVA.
> 
>>
>> This is the current process of vSVA processing translation fault
>> in iommu nested stage mode (take SMMU as an example):
>>
>> guest os            4.handle translation fault 5.send CMD_RESUME to vSMMU
>>
>>
>> qemu                3.inject fault into guest os 6.deliver response to
>> host os
>> (vfio/vsmmu)
>>
>>
>> host os              2.notify the qemu 7.send CMD_RESUME to SMMU
>> (vfio/smmu)
>>
>>
>> SMMU              1.address translation fault              8.retry or
>> terminate
>>
>> The order is 1--->8.
>>
>> Currently, qemu may pause vCPU at any step. It is possible to
>> pause vCPU at step 1-5, that is, in a DMA. This may lead to
>> migration fail and other problems related to device hardware
>> and driver implementation. For example, the device status
>> cannot be changed from RUNNING && SAVING to SAVING,
>> because the device DMA is not over.
>>
>> As far as i can see, vCPU should not be paused during a device
>> IO process, such as DMA. However, currently live migration
>> does not pay attention to the state of vfio device when pausing
>> the vCPU. And if the vCPU is not paused, the vfio device is
>> always running. This looks like a *deadlock*.
> 
> Basically this requires:
> 
> 1) stopping vCPU after stopping device (could selectively enable
> this sequence for vSVA);
> 

I don't think this is change is required. When vCPUs are at halt vCPU 
states are already saved, step 4 or 5 will be taken care by that. Then 
when device is transitioned in SAVING state, save qemu and host os state 
in the migration stream, i.e. state at step 2 and 3, depending on that 
take action while resuming, about step 6 or 7 to run.

Thanks,
Kirti

> 2) when stopping device, the driver should block new requests
> from vCPU (queued to a pending list) and then drain all in-fly
> requests including faults;
>      * to block this further requires switching from fast-path to
> slow trap-emulation path for the cmd portal before stopping
> the device;
> 
> 3) save the pending requests in the vm image and replay them
> after the vm is resumed;
>      * finally disable blocking by switching back to the fast-path for
> the cmd portal;
> 
>>
>> Do you have any ideas to solve this problem?
>> Looking forward to your replay.
>>
> 
> We verified above flow can work in our internal POC.
> 
> Thanks
> Kevin
> 

