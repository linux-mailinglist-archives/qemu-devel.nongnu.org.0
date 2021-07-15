Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AE3CA12B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:08:10 +0200 (CEST)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42y9-00017c-9Y
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1m42xA-0000Hd-Iu
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:07:08 -0400
Received: from mail-mw2nam10on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61a]:48608
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1m42x8-0005Vo-0v
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:07:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VahAaW4c5EbxjO9GZuWAFJF0ZVaUidRfVMllGYlkbpVrgZJQuowgv0/GmwighWmbLcwstOnUoyC4MwPU09bJ1NEIXAij6QuQonB8iCCBQ4tJzMnnRM2Kz30G5hKrlBoxLvjQVj5gwb6+AS3Oa6SZtWazUVf72EDVuio0N/1cKGufast/FjsKDMSvU4a3qBo73h9F5RHESghDLl9p4y/rKszL5CKnKw2ucjyr+dhh7sSVIy27o+HehXcqoNWgrGVrjzvGu1h7qX8BIzKV6AVetef0jxSH+RShLtOvL3pXkGNAw6BZub6Q+hq/opV+n2Tl7MctBzwVsx+YM9/LYuMKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0RRDL/B/ZL7hfcynqcErmpy3DDwA+yrJMN3EV3Wgcg=;
 b=b8vxWu897Dp/S8ITL/6SXoK+cIf1PD1FkuF8MsQ5SNnzzRhOyGEyORELCFeDpX/GDvivaWXbaGQAujOYqm79XjzA6vURYFbvAZUE4PzoeQDDpu1/fuz8Ga/95HNvs7l7MkJyPWBefTEsuuhfg0Mzzesz/Obl8fdpwX9PRfhLaAYNay71613qoPPdnfZ5s975CgHE7nlmmtVJlhG+oOt4ugwvysTbX2Ojw8qKhyDMeXfzuOy1lmRWhpH5wtp6he2XMykXoCuhHY4rmK6t/1Nk5C2zM7sIx8h3oHpMPv75L3o7MMuLl9bf80hakEK8IrGfLvIWKdebaS9+UAfopyYcKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0RRDL/B/ZL7hfcynqcErmpy3DDwA+yrJMN3EV3Wgcg=;
 b=RVmQBgyBcWNsSklkvCfYhjwuBGAwZnxZXEG2crtD05tTesruiHfRwHHbD2YLEq3KKG9O5SbeXp6HKf6qzBwySKqoSvAvA00VsTCYHLi4k5PwUWP4RRtn9SsHqapAdtUg0O9uDT2zN5PLdor/KNQLylEku0eaJhM5M7qO3YpxqWObvzbpcyr9c6venSj1fOnJ9sxEbQ+84ySYbNinnplvGpj1dzKls2j2XaxCsRNdjYiLLMNWHS7iI+jfYvw7QgBjzzI6ng0R1NQffSGvV/V1cYBVEjF8XIoqtF+c6c3CUVZiupzhGSNMm0kVszR1YbKgeLEzn7WKU9bUeBK8dTXcqA==
Received: from MW4PR04CA0279.namprd04.prod.outlook.com (2603:10b6:303:89::14)
 by DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 15:02:00 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::b2) by MW4PR04CA0279.outlook.office365.com
 (2603:10b6:303:89::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend
 Transport; Thu, 15 Jul 2021 15:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 15:02:00 +0000
Received: from [10.40.102.146] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 15:01:58 +0000
Subject: Re: [PATCH v2 17/21] contrib/gitdm: add domain-map for NVIDIA
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Yishai Hadas <yishaih@nvidia.com>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-18-alex.bennee@linaro.org>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <819c7cdc-1c97-b050-e09a-4dc93e15b599@nvidia.com>
Date: Thu, 15 Jul 2021 20:31:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714182056.25888-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f238292a-dde5-489e-90e1-08d947a17f5d
X-MS-TrafficTypeDiagnostic: DM5PR12MB2471:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24712CD0502656E7AA04C1FCDC129@DM5PR12MB2471.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFA4AiOkMDIAAd5bsx+bjKRK/gleziKuUxWMJ+Vdyk7auk6Jb1JtNUS2ne12zIZINa58AmScLpNlKUo2n9lptHbgK9YC6oK9Yl+Qi2Ugc6RLykZEq6qTkMy416K57vSDPCFV5yXZ/czB5pxDCaYSy/EvksMJjpANJBUELDMHo653YjOgVUcBymeKn56DbS7qgclGITLSEL5/pxRNPBiUagVljOH+dLeQK9st6+4yRmwhEx0b1YubVIkalCVqbvbzCz9hc88+7lmBuwFYVVy4qQGZR4uVRBrh3n0eE0SdQuSkT3P5qgTcig7TaQs2I4nVOWDZQlYG+PO72He9kmxEi5hNRsFuyLmodBxcRCD9CyGy8V/OaXEGIuw6O4WJMPtEok9ps0P2XyAK85wSsZEHwA4jjAKVNsEo/qeJprDRenHX3Ik9We6FGgsTGYHkj7JCfLt8oF/78QTMfOb+onDrJTEpe7rH0ZPKYeEcroUbevIXZgyxYWP0tlrttNNU2/3sdsdU8fwYo7lNm0jAsKts9YC/Gd7MY7lKjaRGOgYrCZSN60l5f/G/Z00CgbQ5qF6IvZmUIRITLDTN9nXstWColfPGNby4zlcY3qm7lfNZ7W4EUkjLNxF54/8iJhOkAt+Z8vM29b3IDnlRRw+RrhISNQA1rEyL+C0M61pwGqijY5QtT6+ZGsD6+Ej3akeO2F/l91Nd7Se8FLEKQtJzpiMLurl0IXniVenTDDDlX3QTiGdytg5qENSkmEMk3td/4ems5w31qSjZ1cePnsozBGJOpw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(6666004)(2616005)(70586007)(70206006)(186003)(5660300002)(16526019)(4744005)(107886003)(7636003)(26005)(83380400001)(31686004)(31696002)(356005)(47076005)(478600001)(36906005)(34020700004)(45080400002)(316002)(4326008)(2906002)(82740400003)(336012)(82310400003)(8676002)(36756003)(86362001)(53546011)(8936002)(36860700001)(426003)(16576012)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:02:00.0791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f238292a-dde5-489e-90e1-08d947a17f5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2471
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61a;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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



On 7/14/2021 11:50 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Yishai Hadas <yishaih@nvidia.com>
> Message-Id: <20210714093638.21077-18-alex.bennee@linaro.org>
> ---
>   contrib/gitdm/domain-map | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 0b0cd9feee..329ff09029 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -24,6 +24,7 @@ microsoft.com   Microsoft
>   mvista.com      MontaVista
>   nokia.com       Nokia
>   nuviainc.com    NUVIA
> +nvidia.com      NVIDIA
>   oracle.com      Oracle
>   proxmox.com     Proxmox
>   quicinc.com     Qualcomm Innovation Center
> 

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

