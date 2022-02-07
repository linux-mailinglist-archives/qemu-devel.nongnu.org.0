Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34384ACA78
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:31:58 +0100 (CET)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHAg1-0002kv-RT
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZq-00050j-QB
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:25:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZj-0001uB-NJ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:25:30 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IpOSn013338; 
 Mon, 7 Feb 2022 20:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=BybzeQcufrT54wszFlXECjpBR8hWmEkE6RyWRmYTi20=;
 b=G4PLPhNob2LvJGHdWXwLB5zZliQG33ACEOHji8hcw6SQQ8As6UU4X2X3H2j0fqqlyb8P
 kLDoIl9d1j83JWONOAFk2XBs48cevXZXXyrZEHYTQhkQF13zRjDxMQa1STZz4B1wW2c8
 CDIZP0VeAqN0Xa8uRc5BgHR4Z7Ow6bBKrSzbqfLFrkLypuU86alexD26O0cTrSuwu8Ec
 GTsDGJNE1Es1vrUvEXgIK5IdFDBrhvKQpqRLhClv3UVeGWbKdj5yUlZ/Wi98ylyKwijD
 Y0Irf7b1/kHLEL6pU1rTgeN19BBVrAsVtWC7mMWXdZ+Vi25ES1JGRXEiPA9tpDD6tR8p Iw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e1hsu7brc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217KK14b024534;
 Mon, 7 Feb 2022 20:24:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by aserp3030.oracle.com with ESMTP id 3e1f9dxj7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/soNMCYSqMC8+nI9AEujnZV2mveTfWEs4oHog7RI5rcZhaguTOpbThGARol9nJ8SofvJBcUL+ugf/CJJDwD+XU+BYjbBO0ETwM8KLJrmPPNjb9dFq3QlAYizFAJBzuu7klVumCGHhj8fCsU5S0Yoz6vwQUNPHd5uRDRP2YS7KYymQ62JM9JAhVQsTUvLqsuQsw0Hw4gCa0Nrh5KpcJjaxYqvhqKQgmklgR5jTAEnjDSW1ecUgRw9e+KZjPQVWuqreBY/fZNaecTcqm7p+MVu486vVelYBKBSeLfE7Hu3reW9gjvp9vxVJYYyHJ5EUFfIS+LlRzzCt6I66I81w7yOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BybzeQcufrT54wszFlXECjpBR8hWmEkE6RyWRmYTi20=;
 b=H5hpmGFWBk+pGIrMlxwMqo3qahW2t4LpOXaI1DzJuGThWrNmTL1jSOZyNeFRTJ7Ch/5BLHEmPxAFr0sHhud4tMrdrG0pFWe8nCvPH157oUp7oJE2N0b81KJE1pTOrS/TZkDThwCnZCYgwOaS3bpPA0Ph1cK/uze2qoNq3CPMvCdKfwMk7b6vuAk8QTqtTbUU15NNdiTAPeSLh6OXZZiJY/JvQxDCqL574iJHe2x2rgFM5hYysrtyJthTm3NSyAKg318Swiay3b5/Xxpd/xlJ3qemZc5jCsQQWe+qeFaWdN8gTbaGEtnTo8Pqp6dilabRZxU8WakjejKez2bx02WoZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BybzeQcufrT54wszFlXECjpBR8hWmEkE6RyWRmYTi20=;
 b=a+weWTb46eGXndZpr37WbSVh6N/F8ZvP0Q+phON3iwlDHa5bAwxJHKaL65uova/1N1ctldcvFrD37I5dq6JQY6eDaZkQ6V/hLVUyTEfOWLYaeI4O7mESpYMa0V5qnyOfDcFnsQ/WnvbJKPyIjOWMzLntGgDsXcm3ywMAg025L8s=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1826.namprd10.prod.outlook.com (2603:10b6:404:fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 20:24:38 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 20:24:38 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFCv2 0/4] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Date: Mon,  7 Feb 2022 20:24:18 +0000
Message-Id: <20220207202422.31582-1-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c35596de-8cfa-4e4d-61fa-08d9ea77dcd2
X-MS-TrafficTypeDiagnostic: BN6PR10MB1826:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB18268ECAFD60634DA4B959AABB2C9@BN6PR10MB1826.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyXaoyYW8t9xL0ROU7PewOFD0u7qfJmOY/X7MIrG8YSMjSBndT7Mc+RzIuBgUzQQaWh8YiurCKYBeJPeHHsX3daMyBF6EYNDjIrjAxcIUtljm6m5ZkwcPVCAQ/WY7qzmjuguboO4waqyL6waqOWspi0X6OUfM6+ZZvH0m8TjjLlJmRskg0EM/v0hkB9wQ5dA2/GLvZjulGhAnrSrW2myntNIpJQgdaxZq5Ar1UfNkDRNYCRaMyIpHMGXodgWb2i+wTX+iUsdavlIChHeJnVa6IMCpqx9fOyhcNiRZHvgQ350h3C4p3rV4AjUmXKcXM/vSTIO9UewwbQJP8wLxPbcPcStemVOoUOViBwW26kufrCoPEvUNACavAqMXhT38vICQFMuY3G0uiJz0bQelpLaojo/SCTOvzM8mxDvkB2uOSB5FDBL43PzrOemH0s9U/O53ToIb6qN6zRv42HAuDUWnTQEXVnknx+Pwpy+h3CStMGMI6moeT6Ibfx4to6ouXBES3f63fgmnHxohvoFaRxTk5RUeQrSw7RSZBHP8BOx6Zn0yI8Sn25igTiMWwKhMzJRSzJ6ApdVoNEtcVgoyFk5ZzDTuHTMQbess3UivIL5NeSEqfOFyE9WtkPlzduyu3jWXIPubpH8VGT29L82ZrAd/YJE1JHmVh1Di9VgdSaL8o9oLgCwEtimzjXdJKxQaBNZQFh7ZDjMfaCmW/EqQx5OGePN+kqUsee1cyMx5ACHd7HQ654oAIRLhKDVw2Fhbs922gwJDEiMN/8zwx4mkBhqMak/yDhRJeconJEDlnOIj5t2uepUBcnk+2Pmm2zfX0+8zR61PlKnc+nRI0yOQrwlPXaGkINH0t/U/WVhV1wgjEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(2906002)(26005)(54906003)(4326008)(6916009)(8936002)(8676002)(52116002)(66946007)(107886003)(66556008)(66476007)(316002)(36756003)(5660300002)(7416002)(83380400001)(2616005)(6506007)(38350700002)(38100700002)(6512007)(6666004)(86362001)(508600001)(103116003)(6486002)(966005)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnsYecrsdYkEjoCibx4m0j/Ang6Oy4lNOiB8Qf3j78w2J9cPWLI9SpVUBPlm?=
 =?us-ascii?Q?M4ahu4upMXcBNPQ1xIMhZ4iifZY2TAqzp9UJjUFoIS7TVO+DqGrBHu6eZnwv?=
 =?us-ascii?Q?y6YSJtLNAyprd4w0DIkwqyceMSYiC5vOW98sut45mrLY1yKhCR5s7n1Vk6nG?=
 =?us-ascii?Q?IA7bf/rfm31/BHDlWFzshGnVg5ENHAg5yfEVDvtcQArzeA4f1Tx4gbW4v7Qx?=
 =?us-ascii?Q?kz+5mpHyyeK3NZ0VLsmtz0j2+Og0KGSxW0o6InVuneENXkvolIPOu+bEbO8M?=
 =?us-ascii?Q?WjfpiqPUVn17YrFHSYVvWHgNw7JIjA/LTInvOi7tWfIM72w7InzVV99Lr/SD?=
 =?us-ascii?Q?SeKcZD7VpVYj/bIZI5+OTQ9dAmqZPc3pPUDdd4GLCfYqyn5kYu2uo7LNPsuH?=
 =?us-ascii?Q?L3vWXaFBTPiqE2hYA8Np/GHz4LODpqbFESJW00ThBwdNYAExTHfKnqFwskse?=
 =?us-ascii?Q?LTLjEBZEEOLdchuMrYe2ZQ7XOcSiMlbNv7VTE2tTWIL8qtKjm+3OvN6dfVyr?=
 =?us-ascii?Q?Wk4He7d2MpWvwUjWT6aaHruOA4I7fzSI5tsP91Ipnqx1yx0EB1tWX/NVh2Xr?=
 =?us-ascii?Q?KRmn3gt7Rf6ZWMbEdUKqZcTBWHrLGpcv8lrrY1AhxXF66gGU4Y1tQTaI+ddu?=
 =?us-ascii?Q?ji7MZR+IAgXRzRQprpzIrS2DMPwMZg7hTZ6aPut3zKd8H3HZJtuvy7dvs6KV?=
 =?us-ascii?Q?kdIGtzfaNiV3FPIVR4yCCaAFn8EZJpqQMk07FCFKU+ZaspTmS7aTqfzkQP0B?=
 =?us-ascii?Q?xHiYuzuxdpBUQFVfpRaGjGYfUuxO89ZFdXPRUW1kvdmv+TQEJwk6inKjpxPi?=
 =?us-ascii?Q?j/oLRGYEiogUO74G3IGlZo5wXAXNUh9NdAAw72NyT408bu6TRk3YX07Q+lzS?=
 =?us-ascii?Q?DdBCeLsiA8njAHSdUDZu9lqJKDryFw7Hl1IZdsodX3GKk2FzxBnIMIkPhxHy?=
 =?us-ascii?Q?n1AebkZvBNMi00Tda8ba/ceMVnCS9mL6AEQDYZDtewYtQE5t8A2dodfqwcv/?=
 =?us-ascii?Q?4Mmi/KPtZ/4MlyNS38RtaXuP78K9ZsluUtQus0gL45N5WYZPek6tNB6GhLF6?=
 =?us-ascii?Q?Z71duMBZvec6N5NoqqStsoAMUcTMZghLfoof4MPOtC7dtOF0QvP+GjQiEZAM?=
 =?us-ascii?Q?kKl69+/D6LIhMVGvGtWl3uzFYQLY2ox6PRI0kdp9zj+Mc5CNZ3OmKx1/t3GY?=
 =?us-ascii?Q?jX7UeZMbxZlgBFAjFgVNP7hC3GSwp+Elovo8phDGnr8HWGjG1Phh2cpgQ7cO?=
 =?us-ascii?Q?Jk3X1f/4z3n9lFtWgdACAJ78mkayE4Ygkh7ePmY5P5wXocIxxjyhgoDBfDYc?=
 =?us-ascii?Q?OkV0BHQHVvlj2DTTEsKXepOeV/1czc2+N/sHqO/heeoi2fLv/5UU+mOsAaX1?=
 =?us-ascii?Q?vfTVstTLM92PbaT3jdfRZvlMqPM3IccmXuviFmsnTlWP1sbbkPMcGFJbqMTc?=
 =?us-ascii?Q?JTQ7iJsKCOWVBQjAGapo5mV2sapjmUfGpHWXn5R/ngpVjVPSIK/BSTYlNx2y?=
 =?us-ascii?Q?E5/1VN2lwkw86ARgr6Rj81giUgNnlvWY4iliy9ekPMfGB+zNkqUu/89NUufT?=
 =?us-ascii?Q?tRQ/9rvkf6rZA6oeAlUN6ZWV+HDVODxTC0aejGDNtrsnt6qj894iHEc4jcoc?=
 =?us-ascii?Q?WLx/ceT75Va2IeXtIR190NrSUnGM6L38fXRurvdnStbz0O2rEQkRZmuHuMJs?=
 =?us-ascii?Q?Qu+NgQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35596de-8cfa-4e4d-61fa-08d9ea77dcd2
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 20:24:37.9387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFN+0Rmo+cD6K9IfqEo7+nnwX0Xf0aI2V3SpMuyC7/+tO2AQs4oG4Fm0OIxYWhL6O8pdcGl+Zc3qgrNL5tZnpVJptzQAOh/Usu1uxUCLd0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1826
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070119
X-Proofpoint-ORIG-GUID: pgF3Z4vbVHH6wpRmmKIN0t4pBNMz5V6h
X-Proofpoint-GUID: pgF3Z4vbVHH6wpRmmKIN0t4pBNMz5V6h
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RFC[0] -> RFCv2:

* At Igor's suggestion in one of the patches I reworked the series enterily,
and more or less as he was thinking it is far simpler to relocate the
ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
and less intrusive. (patch 1 & 2)
* Check phys-bits is big enough prior to relocating (new patch 3)
* Remove the machine property, and it's only internal and set by new machine
version (Igor, patch 4).
* Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
* Add IOMMU SDM in the commit message (Igor, patch 2)

Note: It still makes me a tiny bit unconfortable to just remove memory from
[4G  - 1010G] range, but it's a little baseless. It's definitely a lot
better to maintain this set given its simplicity. For long term ideas proposed
here, perhaps a Igor's pc-dimm based model idea or equivalent's Alex's
suggestion of an option to control reserved address ranges could enable
adjusting the 1Tb hole to be closer to baremetal. 

The one downside of this approach is CMOS loosing its meaning of the above 4G
ram blocks, but it was mentioned over RFC that CMOS is only useful for very
old seabios. If so, either I leave it as is, or perhaps folks prefer that
I just set the ram above 4G in CMOS as 0.

[0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/

---

This series lets Qemu properly spawn i386 guests with >= 1010G with VFIO,
particularly when running on AMD systems with an IOMMU.

Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
affected by this extra validation. But AMD systems with IOMMU have a hole in
the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.

VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
 -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
of the failure:

qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
	failed to setup container for group 258: memory listener initialization failed:
		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)

Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
as documented on the links down below.

This small series tries to address that by dealing with this AMD-specific 1Tb hole,
but rather than dealing like the 4G hole, it instead relocates RAM above 4G
to be above the 1T if the maximum RAM range crosses the HT reserved range.
It is organized as following:

patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
address of the 4G boundary

patch 2: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
possible address acrosses the HT region.

patch 3: Warns user if phys-bits is too low

patch 4: Ensure valid IOVAs only on new machine types, but not older
ones (<= v6.2.0)

The 'consequence' of this approach is that we may need more than the default
phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
address, consequently needing 41 phys-bits as opposed to the default of 40
(TCG_PHYS_BITS). Today there's already a precedent to depend on the user to
pick the right value of phys-bits (regardless of this series), so we warn in
case phys-bits aren't enough.

Additionally, the reserved region is added to E820 if the relocation is done.

Alternative options considered (RFCv1):

a) Dealing with the 1T hole like the 4G hole -- which also represents what
hardware closely does.

Thanks,
	Joao

[1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
[2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf

Joao Martins (4):
  hw/i386: add 4g boundary start to X86MachineState
  i386/pc: relocate 4g start to 1T where applicable
  i386/pc: warn if phys-bits is too low
  i386/pc: Restrict AMD-only enforcing of valid IOVAs to new machine
    type

 hw/i386/acpi-build.c  |  2 +-
 hw/i386/pc.c          | 87 +++++++++++++++++++++++++++++++++++++++++--
 hw/i386/pc_piix.c     |  2 +
 hw/i386/pc_q35.c      |  2 +
 hw/i386/sgx.c         |  2 +-
 hw/i386/x86.c         |  1 +
 include/hw/i386/pc.h  |  1 +
 include/hw/i386/x86.h |  3 ++
 target/i386/cpu.h     |  4 ++
 9 files changed, 98 insertions(+), 6 deletions(-)

-- 
2.17.2


