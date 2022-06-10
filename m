Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D83546DE8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:01:20 +0200 (CEST)
Received: from localhost ([::1]:53736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkop-0005i2-Oh
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf0-0000BZ-Dl
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkeu-0000P9-Re
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhqND016299;
 Fri, 10 Jun 2022 19:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=2dnGMjhIbhSHpuTnKaf5YwvSB7NNKyj11NLaPe8JCpg=;
 b=zcH9ps9Yn8JmBuNz2rAcsQUVrkuiHuKa3LDmnPiS5VIcftCS4aHgoyz/1fi2+UEOljXV
 SmRnKocJieCQ7tw55w/TCYrwYqNL9muidxPCOhOOuNQ4YaRvOKbvz5e683A/gG3gs5mY
 /LNo/1E+vGcAku332NPk3D9al38IHZ9+PIewGMvSL9hlv+x8ISBQBSbBWY2Ow0RyUx0C
 LX/HwcJeSVZobldee1UPYL4qq92eLNI/qQDKeFK0L6P2krs62u5KeBmXjbIbPsS+SFxP
 zLf/b739J5UrURi061+t4rzUY0bmMDkOYPG3rRm5picPyVApnzKy54HQwdHizIouNDiu aQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ggvxn4fag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:00 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjMGm030599; Fri, 10 Jun 2022 19:50:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwudf2dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPr8zpLDcRYB/ab+aLb1OBS4kNjwovqx3ICapOjcDi9T9WlLOcqR1xaDdtHRKhSTK/Y70UeJYuJjiQkd9Xi1LPQI2xnyEc0kVL5uSfFtjQemcNCwypKjRz3Wb0Qy6A4pJtHzCGqt/vHvkzvBWxBB8lFapXmqPQ40IOiJtoZCYZrZZrvPICkavtTTQ4uOUApJSghYr3x6FkVIRZv9VS8fqDrb69M8OwLrVN+gNcyNluzIhGFUk9MnviqwYttt/wZWI1koYA67sJXhNoywDjTzcPH3y8AlilFRqH6UHV//rL/dBLL9mUT04N0gmi9s7H6E+vPRk7WhC/hoPZ2ldTP0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dnGMjhIbhSHpuTnKaf5YwvSB7NNKyj11NLaPe8JCpg=;
 b=JCId3O1ahKbKA2q+ZyKy4iltAuIk4c98tjSCdukIZujWMfHQOZl5Mq8SMjPhBqC6KZXxEq6oci40T3PtzHVncLFrsHOERUuflQ/I4Sty1R3/YotBimcGp5Xr0OO81XD+Pe6Q5Fdm9xdEg/Alq/pMcy5xF1DROhmo3HJye4LwFRLySqX1RjIF9HLOasLm+396IN9u97udOWmlOiNlosqTk8YMXMSaa/LCaPdy63ynL8RmVyH2yfKkuoWEj3yGL6a5Iw+kyg94ZjHP36F6cM981bibYbOGo6DPb6dgazO3nM+wrgQceZf38P1k4hcdr6kT2/24N98n93vBlABeXcpMcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dnGMjhIbhSHpuTnKaf5YwvSB7NNKyj11NLaPe8JCpg=;
 b=E3Db7G6Khq8Hmse/BSGnfFwV85VeAj4fJE5Dm2meQ7uXQ98xHjL4brq3k1Q7MFY4dMpBdE40g/WqO9GhKomCX8SXQGJDKyXKHlSjqdiCxTl0bulDNV6FoD07jnomHrNPXh6cHN29vFTU+BVfIQgJmCvMDjEco6USRjLHB6gCq6E=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:50:57 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:50:57 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 04/14] vfio-user: build library
Date: Fri, 10 Jun 2022 15:50:31 -0400
Message-Id: <7ba5766a59baec1c527bf4594dcf1dd55615aa59.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f4ceeb1-8281-4671-62bf-08da4b1a892a
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1915205EE51F76A591E2328190A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mG3qh6Vu1m0ddb7rpbedsdEMP7/xLvA4IAsOiAP3TFMo8KRRp1VsHEaEfd2BtFC4Bl0hL0mSsJ6Y423WycAQ/FE5sMxRcb8fdzbrAXfkJnOT7dy6f5gDAut4U6MbMOdIVC6U+OYtHmm52roQbxsN1DyrNCDvw+AD+jxD/OcmYHOs0x8jyOiEfzx8jIAODVqJg7+V1L1w0Wt8c2J0hR5VUncqhw1ZWtxpf3SdmIxBJ/FULr9uNfmKi2O4UuzBwnHOvO8adEPPBfyCjFnYeoG6bDce0gb73VL2PNNjyJEfsapwtws/6+U1Zi1Y2+2BC7tcrpHMH/8TCj3D21FCBOuapX7FVAX0kE9/a+RMMj+I+hKtcQX2vN4yQ9gHgO6DpxfC5pCj8Nck2YjiTr/vZlKzZhBT/6eZB5tjefkOYfPimKCNEqbUtdlLH+lDPdCSFXuArmXaiU3x20KUSx0EIRYddMhXpWsq/Wsldrx9nWOmfgS3tom1wQM+Z2B+ICkz7DVn2AwSFxwT51QUs2Ehi4sRO1oaDpuJu/IJTzjaiKsOSs1zipzBrmxJs+nsl7d7qQSCRo9W79GtoK6Ax3Gym6qPTfralU1VwuEiQiLt7/Dtcu+oM3MYRYqobrORunaUR5BS96Dau6O17ORwOwBFAgUxQlmtuTn0TMYFKKyS75NkO4jF/VR5hfHH3RsWSWdykJPU0ZJ1Tk4VGItjNYCim2kL4n9MSrLDBkGurjc8E55W/BvHgOZh9EE9hN9vOadwUQXy3gpggOA1NdKQ0Pgg13YiLzG/Tv8LuTguNyUo/NL3t/dQ3skdpnldiEgqoLFtCRb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(966005)(66556008)(66476007)(7416002)(6666004)(8676002)(508600001)(6486002)(316002)(83380400001)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kMV0c7ZtveCOLkf4tbOKuNanAtMSg4+tt0gIBrjUV6XMgX+sh1vyI4gNeNn?=
 =?us-ascii?Q?E+fNO/f+fLcYo5Xb5Kkhz6GNd47j0MkOEcHKgfTOP/y+wdfBaWabzHDHKsKd?=
 =?us-ascii?Q?1EhNF+ICANBnzKSOjyh3fI6bWXY6V7vcIiQMYLnKI7Bai/0vqAYRQkJSvvCl?=
 =?us-ascii?Q?zu6damF6VkAWG+BBd9eQMMcLNkx+xsGerFkAdzz4+n6oV6BeSviQCNXyaMYU?=
 =?us-ascii?Q?NrsdKW8zYD4Sq1CUNuHAOAXeLnEqKeA11KpJqGzsWs0Azq6PgnVQ91MBMb6V?=
 =?us-ascii?Q?NZROYRQvljEvT4i2koEcB/70f0/LV5SUftDUrhJqzrgIWtneTTf5Akg+0WKP?=
 =?us-ascii?Q?TdYN26YKs0CrtkOTyq2sFKuVUnXYbImUPpq4dnJgUcCqtvot12ZzH8Qsfnje?=
 =?us-ascii?Q?+mnxVqhvpr+6U4voYthSQ73H1kJdFNSFWZUCQuiMiCys3KCHAck+klYYJMg+?=
 =?us-ascii?Q?+7h3iZyMA55FiD3dPLvHedM1hoCI4O50YJ+JBSGj4HecuvtGRcSa+MLMeGi1?=
 =?us-ascii?Q?3atbY6WxyeeqYkVxMZHUgaAzMuyvfljN62GJ3aoCcn3deFiFBo944l+45//2?=
 =?us-ascii?Q?fkSF8dlgvJZoN8bTw/NMN/j26WHbtFY55BAegQdzXhtQI0S/0Uvva7kEpaRw?=
 =?us-ascii?Q?zO/ztLRN4uEMydPFnx/pU4lZMppcTCEPczv8zWSye2vmxJ/iAiRMSRjnBBhe?=
 =?us-ascii?Q?8mS9Efz16Zl0FDsF2PxBpNyMnC+dFTEQKK7x7qwoSX6wu/7kM27fFF4PXYzp?=
 =?us-ascii?Q?AbYZMyHeMuiDtR2iaPUJinnEwZoUfXOj4Tmf37yedmUirr4QF9VusnaUP9SZ?=
 =?us-ascii?Q?I4S9DFw4RPQGcmEIkAobaTnmADfBZuFrVxa0WacNAII4/btpOlgg4Kz7sCS6?=
 =?us-ascii?Q?h/c99MmtifznksmTgodgv2XwX4zG1S/TqtH/RzNq0tMJL46TV6P1aVhBZMoN?=
 =?us-ascii?Q?ICo2SHtmXWMx0H4aIOwCjQBsW2TJ+x9yqQBMCRqF8zT+bqSEYuywIyVafyCQ?=
 =?us-ascii?Q?UqYUNjxNaIKS/ObVOltm3fn7pdYAT/DeEY6MTSb9Jwsvrx8szUOTE+7S3Htz?=
 =?us-ascii?Q?jRcp6V+9tpCaj59Br9Tf259wDVU+flp6xZ47D0V6U8G5YmESXw1VONv8RV/g?=
 =?us-ascii?Q?D04W6iRUOYP8splzoBJZxx3OJ3C9/MjleF34gCay3p7lHWYggHEuWOq///hx?=
 =?us-ascii?Q?AjPHIIG8itD3SH6nt8h0ub2SE8UHNm62OMD/OWr/9xqGUNIhvXY+OiS5DxOu?=
 =?us-ascii?Q?cgeaOqUjGR+LeLOYBDGq3Jsr9N1Ss5aaQpZ43uf6Czj0uupbV10bLjXIZoX1?=
 =?us-ascii?Q?mP78xr2ZK2R+/kECHQfMpgAb6ePEzlAGx0xW/CPj8M0Prgp3v9FpFs54Kdr/?=
 =?us-ascii?Q?fHyQha3tolK+j/rTpmSnoXR7pf/h2nvHptmQI9ZXMH8lGacYVbBEIUDgiaCT?=
 =?us-ascii?Q?1mGabxQ2ILzYaFIzHjYrCxlycB9th6dQM29NZn5ohsogLmxYVQ8pNhz2vf0L?=
 =?us-ascii?Q?VX5X1CE0+USRKgetF6jWsP7REKK7UT6XSNR0V15pmTiNlmuhEP6TdJMnJ6r/?=
 =?us-ascii?Q?8HaIfCwmroPnesKBRLcwhdFHH/SBHk0p5Am3tTKIp3GpFsNSvDCg8Mgf3gDC?=
 =?us-ascii?Q?xaurVFas+FCBIlzEVNtpgF7rNjgIsLmjYewjawneEhP6xk1nT5CY4sYpJcao?=
 =?us-ascii?Q?wtAGaeBvXJvaSTaA1kVGrrQnTsa8aQJ2ABnstEh/xGUQrIcZ3UMvvMb90RkR?=
 =?us-ascii?Q?iTUPbunGcQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4ceeb1-8281-4671-62bf-08da4b1a892a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:50:57.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mChNINqetB7nxJTeeMlTtdX7xSoP3AA6KD+ZMN9ARHZI/b6s12OZjjzKgbRRMMUG3yiGf8jloOpVyha5GiXQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: ioBlo-q5LeaU14vy6432C-w6qOc8Izyr
X-Proofpoint-ORIG-GUID: ioBlo-q5LeaU14vy6432C-w6qOc8Izyr
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a meson
subproject.

libvfio-user is distributed with BSD 3-Clause license and
json-c with MIT (Expat) license

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure                               | 17 +++++++++++++++++
 meson.build                             | 23 ++++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml              |  1 +
 .gitmodules                             |  3 +++
 Kconfig.host                            |  4 ++++
 MAINTAINERS                             |  1 +
 hw/remote/Kconfig                       |  4 ++++
 hw/remote/meson.build                   |  2 ++
 meson_options.txt                       |  2 ++
 subprojects/libvfio-user                |  1 +
 tests/docker/dockerfiles/centos8.docker |  2 ++
 11 files changed, 59 insertions(+), 1 deletion(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index e69537c756..39f30c0283 100755
--- a/configure
+++ b/configure
@@ -315,6 +315,7 @@ meson_args=""
 ninja=""
 bindir="bin"
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -909,6 +910,10 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -2133,6 +2138,17 @@ write_container_target_makefile() {
 
 
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2669,6 +2685,7 @@ if test "$skip_meson" = no; then
   test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
   test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
   test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
+  test "$vfio_user_server" != auto && meson_option_add "-Dvfio_user_server=$vfio_user_server"
   run_meson() {
     NINJA=$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD" "$source_path"
   }
diff --git a/meson.build b/meson.build
index 21cd949082..fac9853254 100644
--- a/meson.build
+++ b/meson.build
@@ -308,6 +308,10 @@ multiprocess_allowed = get_option('multiprocess') \
   .require(targetos == 'linux', error_message: 'Multiprocess QEMU is supported only on Linux') \
   .allowed()
 
+vfio_user_server_allowed = get_option('vfio_user_server') \
+  .require(targetos == 'linux', error_message: 'vfio-user server is supported only on Linux') \
+  .allowed()
+
 have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
@@ -2373,7 +2377,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2665,6 +2670,21 @@ if have_system
   endif
 endif
 
+libvfio_user_dep = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/meson.build')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  libvfio_user_proj = subproject('libvfio-user')
+
+  libvfio_user_lib = libvfio_user_proj.get_variable('libvfio_user_dep')
+
+  libvfio_user_dep = declare_dependency(dependencies: [libvfio_user_lib])
+endif
+
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
@@ -3783,6 +3803,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 544385f5be..fe8d34b022 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -168,6 +168,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index b8bff47df8..c4e66ddb6f 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 1165c4eacd..d763d89269 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -42,3 +42,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index b3af081c51..ef8f227fbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3631,6 +3631,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..7da83350c8 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/meson_options.txt b/meson_options.txt
index 2de94af037..2bf2d20b42 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -88,6 +88,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('vfio_user_server', type: 'feature', value: 'disabled',
+       description: 'vfio-user server support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
 option('tpm', type : 'feature', value : 'auto',
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..0b28d20557
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 0b28d205572c80b568a1003db2c8f37ca333e4d7
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4b20925bbf..10618bfa83 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -51,6 +51,7 @@ RUN dnf update -y && \
         libbpf-devel \
         libcacard-devel \
         libcap-ng-devel \
+        libcmocka-devel \
         libcurl-devel \
         libdrm-devel \
         libepoxy-devel \
@@ -59,6 +60,7 @@ RUN dnf update -y && \
         libgcrypt-devel \
         libiscsi-devel \
         libjpeg-devel \
+        json-c-devel \
         libnfs-devel \
         libpmem-devel \
         libpng-devel \
-- 
2.20.1


