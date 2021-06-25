Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3C3B47B7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 18:56:55 +0200 (CEST)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwp8Q-0002pB-C2
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 12:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lwp6Y-00022j-70
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:54:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lwp6V-0000dH-Fz
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:54:57 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PGq7k6002929; Fri, 25 Jun 2021 16:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rePv37NX3kMuOL+Il6bInrWe52rP7SJmjBLbiuqH2Zg=;
 b=cz4mUT4EvV0NXj58NXWN4/J+UjchZz8mLPIb0rtGMVkUW0EYZgZmevsf1ph8iQoiKSBM
 WgocCvJc12GnhvuhGQHatGyglqORMipBMJ/im8+eGATbw/OkSYZYKsdtAmYGY/V57it7
 uuheiKhgdRF3SmXXag01AOCP4Y/bajf+xE5Yei19aZkNmNBQTtXwkmLYJMWgyqZxsK6m
 MVeTRl+G/ZzYseSgk13YUBE8n4kay4vCMCmyrPnFtH9AN2nfy0Iz9eZnpOkGId0/Bd5M
 EGOQbKeDxF69npfh4fYwPMj7Ms6YKRlsuUDBchulqyo+xgNXkwK3ctekWlaEgOKtBtZq 8Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39d2kxssbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 16:54:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15PGpU32177740;
 Fri, 25 Jun 2021 16:54:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 39dbb1ptkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 16:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXLRnrkE0weLi1aZeyKdzA98c1upH8YWev3pvxIIGGzhNznvqn2Vn7SOd58edND9HsAiJWTgZJrUpsHklp4Z3zxFZq4IWAZmoWJ50tCN9ja+hFOavqyQ3Dvp45z6RMvu6DA+ukLQZtfV2vIdS8Nq3DU9kvNULHydIhHN0hgbZ9b9zOuYMjLVCpq2OjDu2N/K+KUbYroIXNVMoGbUDH4URgcfX07ugpcmi8Q2b0FB5dKJHIYikpdaxx2H/smzvrpPP504ObAYWOupyx9e9H5wvsGey/zdV1TP46bGiNj8iFQj4dSDs4aHOqNrBpA1HUPl0ZrwPN1P4ekcDjop+YnmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rePv37NX3kMuOL+Il6bInrWe52rP7SJmjBLbiuqH2Zg=;
 b=Yu1D/B5Hch4HgmWu2aCZTJS8VMk1f5OioDzwEq2jaXNVjU4na2qYFOs6WB+6yfFv2O8OUegrkZMCimNMW7167SzcsGkid8uiMhTxF6i6kid+2o2xqYZ/Fld3HIM2P12GLmJkMIyyVGxk9kcBHphhfgQIrvJWVlovFcELoXPQT+qx+/5BFNpiYyob8Jg8fO5FmercT25HbyV0KSLiaonqOLLX/e1yb9BvT9NOGJn+QiYV9DWqSIRRNKTXCQTxUFxFe5H4FLW2oNoByRf0pFI/Sr6BTMot6oC9Lckx1dl2PMYOO6mqsKkKnoh8bQkXWpoDc7z08pL1vYBRDgw4ojpmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rePv37NX3kMuOL+Il6bInrWe52rP7SJmjBLbiuqH2Zg=;
 b=rL+IwQ/EMt5CACugcSBj9tI0SXfGNcPB0ixeTVfTCOJhuov1bNQfddURa2eLiC7rDLRG/uHcKk4JlRj4+o4b83QlTVvPqpSn12cidVBb3G9O+4myGjM2lEapexd3+sn7gRIr3bbnulnMYOjMyBi7J+nz4q/o/3vN3TWRBYayLLs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 25 Jun
 2021 16:54:46 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 16:54:46 +0000
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622151629.6c75427c.alex.williamson@redhat.com>
 <23cff9d2-cc9b-07ba-1c21-9798854e14d9@oracle.com>
 <20210623132736.1c7b326a.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <e236e766-d3ae-214f-4982-5ec38e3740f7@oracle.com>
Date: Fri, 25 Jun 2021 17:54:41 +0100
In-Reply-To: <20210623132736.1c7b326a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::34) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LNXP265CA0094.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 16:54:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2c2dedf-6c21-4c71-b271-08d937f9f035
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB40937D9B63F0296E28B6C166BB069@MN2PR10MB4093.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ys0TGkw6GjOYsd0bjrmDBM1+9J1JUQgLI8NN4jSgcTLCQakeW48f7x4S1+O7jxsPTidRYGSru6BTRJhUq0B7QaV6KQIfG22GI8a1/4867fTsh+ri11cTbvMkicqdtqVJDPpnPPCfa08QjcYhGbzupb75RnMx+j/6gKuIdCdY54Ij9Bsoou4noFZlg2xd6Uyip2MCq7DhM9dA/civzv4gg6tqGKTquZfiAmDH3bGk5eFIEo0z2nzGmpfujmUh/5676iiauYY3Vl8lGE8/8EMO2/ZI1wcH34+tIFJ6Be/3GMzkw/ExjKn2yXy97SaNGFCRUGdXstlOf2L+RTPAcjmW7j/BZpI0YsZ3S2+mSDdAitw6bpl0MpaDeHu/jDEVVEm3QX5I6us9DPoBk+q2OeLRf2Q9pKUvWW69FUfzjvp4Urf4nix79GvF9Z1nKyG8OJSxvJ2kT0miV6T43zJfrhSLCQMj2RdTa+HxQlTVTkT73oDB05rQiUyZtsmrMYQnSdmnYz/KHDUlue8CTCH79ccZ8UVbwU+Es22XM5h4sZfzT6Z+DzbL25jzyrFdjbO+PYjekKEI3hoET/Ge5gVS7/i2hRw6zn+QiC1FYoQeEiXbu47iiaRUtDhirtESNLlqg/EqJuy+5PAa0L+5X1fMkakkiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(346002)(136003)(376002)(38100700002)(53546011)(186003)(66946007)(31696002)(6486002)(66556008)(31686004)(5660300002)(54906003)(16576012)(16526019)(6916009)(66476007)(316002)(8936002)(36756003)(8676002)(2906002)(478600001)(4326008)(6666004)(2616005)(26005)(86362001)(83380400001)(956004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRDeDZNVnVsU1pRc1A1SUlmT3pNa3RQVkhRRG0rQ0RQNlFMRzdxQVg2RFFH?=
 =?utf-8?B?YkV0OGx3aVlEeTNvZitjNkNySmJDSkVSTjVldDB1UnhMTTJZVVhhVzlSdkJr?=
 =?utf-8?B?Yy9zazhxTHZRQWpMYU9GQy9PSWdtZlBnM3pqYTcxVnVUMjJPM1M3TWpIczVW?=
 =?utf-8?B?K2VKMmZpNHUvWjN0cEdNU0VyOVAxa2FEQnBPaTJsMUVRZzE3cTc3czZYSWRk?=
 =?utf-8?B?ajExK2ZjY3ZWMUxsOWE5Ymo2VEJxN09ERjhLUGs3dnZEKy9rL3gyYng3Wkpl?=
 =?utf-8?B?d3BYdUlaelk1Rytjb0liMmcreDFSZ2VaZXZpbzhZV0dXZW5WNXRad0lpVzJx?=
 =?utf-8?B?T05tNjBIMzVnckhLd3dZM2xaSnZ1REVKVlZNaVA4aG80Sk01azV0cWZQc0E3?=
 =?utf-8?B?QVg4Z21Qend2RDZnMjl5S0NrWWdoZ2sxOHpHVjkybGRSOEQxM051S0psK1Nk?=
 =?utf-8?B?OFRRSFlmVWMzUkUyK2dsbDFKMGV4OVNRaEVIdW9wWTllRno3NURtREVlRWtT?=
 =?utf-8?B?c08xTWxFcWZGSXp1Q1AyTFYrK0lmSitFZlZ2aU05SUg4WWFaZ3FuU2szUmE1?=
 =?utf-8?B?YnBDZnFURGRWTEZPckFNNnFEUzFaUzdhNEc3VHJjUFE3czdZSjdvYTFyb3lw?=
 =?utf-8?B?dWdQQzFJaGpObCtWbTNLNjNUcUVIY2pKc0w3N0tBUW4rUjNQdU5YTnRPUWNM?=
 =?utf-8?B?S3R3Z2lWelNvZG02d3A2cktjb2JYWml0cTZOV1lMYU8zL0l3VWRtd2owa2Q0?=
 =?utf-8?B?QzREazFZU3ZyNEhqdXRNa1UxK3pTOVVHa3dUb1J6bFVZN1lmSHRxKzhrcmVa?=
 =?utf-8?B?NUhPYlFiQnBhREJBMnhmY0J3RmpWSCsrUi9XSmRObVBUWXJtWW5rYzN6cUZC?=
 =?utf-8?B?Sk15Y0dvaG5rZTJSSXVFak1Kd21lSk9Zd0JzY0ZtQWg4ZzF6M1lhSENDZnFv?=
 =?utf-8?B?Mk9ZQWFrNEZkOXJCamI3TXEvdzRGNHp0T1NYQytzRnhSTFFTRzVqb1pscERq?=
 =?utf-8?B?a0llRkd4UEpuMUZndnJuL2RjZHNhdTdTb2E1SC9DV3NndldhTkMzTVJacDZo?=
 =?utf-8?B?RENBUG04aFdwSmE4TnQ1RXJoTFFKb2h5ZEs0VVhVd29id0VIQnF1UWNSZnRZ?=
 =?utf-8?B?aDY3M3JaRUtLQnpEY2JwUHpZckYxcUlRSmx5Q3lpZCt3b2VxUTFNRDRmZHlX?=
 =?utf-8?B?Yk00cmw0MzRRRFNxeXlqMUk0UzJZN1d4OFdRTFFWeDJIN1gyci82Rlo4cU5j?=
 =?utf-8?B?d0p2RUsrRWE4Y0xGQjlKeUlwVG5tY0c5VERBSDBRak1ZK3k5eHdOYTA3M2Vv?=
 =?utf-8?B?OHJucU1uZmZVeXBoOHBndTQ3dGczMVBjMUZSbURwNy9LRVNORHI0N2I2WGhr?=
 =?utf-8?B?L2ZEVjZEZGFLV3E2N2ZacktDV284R1FZSGoxdEtaQjJNOFM0WWU3KzhuNnlw?=
 =?utf-8?B?T2k2QllUVjFVa3FnWlQwRmNuVXNRSzhRaC9sWHdxZTkxQlRtdFJydXV4R1Jx?=
 =?utf-8?B?Z1ZRRVg4dm9OaTN1MDVkRk51d0pQNzBqb3U2RkxTZ3BSTG5FWTJkSWc3Z3hM?=
 =?utf-8?B?Wlg0YlBVQ1JnNHFhZ3kybnNUbFJjVm1pNFVNWjI2dXc0dncrWjVDbUZ6ZmVo?=
 =?utf-8?B?N1g3Uk51RktHVVM2U0ZKcE1RSlNyMHNmZ0lTOStLM3ptL2NSWTFhbng2b0Rr?=
 =?utf-8?B?RjlBLzdqQ3VWTmpXOE5jZGk4YWpVSjIxY1VHYUZ3RGt0c2UzZ0lrd1kxd0xj?=
 =?utf-8?Q?zKwGAWh0DV850lN3w63LGAYg4ndK3p/GTsoFARx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c2dedf-6c21-4c71-b271-08d937f9f035
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 16:54:46.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jJK4QTEpAe7NNBg3vLFbOKVSxSblE/EmXcdtYucGsppaha3x4xv45euPLIKJZ6tXEI0qGeC3olEZKdDrkQAR07yoJSrtQaTTUeRgczfb30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10026
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106250100
X-Proofpoint-GUID: i7oANwJZk2_so4W3Mb0IqNvGnQ4Qn1i0
X-Proofpoint-ORIG-GUID: i7oANwJZk2_so4W3Mb0IqNvGnQ4Qn1i0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Auger Eric <eric.auger@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 8:27 PM, Alex Williamson wrote:
> On Wed, 23 Jun 2021 10:30:29 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/22/21 10:16 PM, Alex Williamson wrote:
>>> On Tue, 22 Jun 2021 16:48:59 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> Hey,
>>>>
>>>> This series lets Qemu properly spawn i386 guests with >= 1Tb with VFIO, particularly
>>>> when running on AMD systems with an IOMMU.
>>>>
>>>> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
>>>> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
>>>> affected by this extra validation. But AMD systems with IOMMU have a hole in
>>>> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
>>>> here  FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
>>>> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
>>>>
>>>> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>>>>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
>>>> of the failure:
>>>>
>>>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
>>>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
>>>> 	failed to setup container for group 258: memory listener initialization failed:
>>>> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
>>>>
>>>> Prior to v5.4, we could map using these IOVAs *but* that's still not the right thing
>>>> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
>>>> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
>>>> as documented on the links down below.
>>>>
>>>> This series tries to address that by dealing with this AMD-specific 1Tb hole,
>>>> similarly to how we deal with the 4G hole today in x86 in general. It is splitted
>>>> as following:
>>>>
>>>> * patch 1: initialize the valid IOVA ranges above 4G, adding an iterator
>>>>            which gets used too in other parts of pc/acpi besides MR creation. The
>>>> 	   allowed IOVA *only* changes if it's an AMD host, so no change for
>>>> 	   Intel. We walk the allowed ranges for memory above 4G, and
>>>> 	   add a E820_RESERVED type everytime we find a hole (which is at the
>>>> 	   1TB boundary).
>>>> 	   
>>>> 	   NOTE: For purposes of this RFC, I rely on cpuid in hw/i386/pc.c but I
>>>> 	   understand that it doesn't cover the non-x86 host case running TCG.
>>>>
>>>> 	   Additionally, an alternative to hardcoded ranges as we do today,
>>>> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
>>>> 	   requiring to have a PCI device added in the vfio container. That would
>>>> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
>>>> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.  
>>>
>>>
>>> $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
>>> 0x00000000fee00000 0x00000000feefffff msi
>>> 0x000000fd00000000 0x000000ffffffffff reserved
>>>   
>> Yeap, I am aware.
>>
>> The VFIO advertising extension was just because we already advertise the above info,
>> although behind a non-empty vfio container e.g. we seem to use that for example in
>> collect_usable_iova_ranges().
> 
> VFIO can't guess what groups you'll use to mark reserved ranges in an
> empty container.  Each group might have unique ranges.  A container
> enforcing ranges unrelated to the groups/devices in use doesn't make
> sense.
>  
Hmm OK, I see.

The suggestion/point was because AMD IOMMU seems to mark these reserved for
both MSI range and the HyperTransport regardless of device/group
specifics. See amd_iommu_get_resv_regions().

So I thought that something else for advertising platform-wide reserved ranges would be
appropriate rather than replicating the same said info on the various groups
reserved_regions sysfs entry.

>>> Ideally we might take that into account on all hosts, but of course
>>> then we run into massive compatibility issues when we consider
>>> migration.  We run into similar problems when people try to assign
>>> devices to non-x86 TCG hosts, where the arch doesn't have a natural
>>> memory hole overlapping the msi range.
>>>
>>> The issue here is similar to trying to find a set of supported CPU
>>> flags across hosts, QEMU only has visibility to the host where it runs,
>>> an upper level tool needs to be able to pass through information about
>>> compatibility to all possible migration targets.  
>>
>> I agree with your generic sentiment (and idea) but are we sure this is really something as
>> dynamic/needing-denominator like CPU Features? The memory map looks to be deeply embedded
>> in the devices (ARM) or machine model (x86) that we pass in and doesn't change very often.
>> pc/q35 is one very good example, because this hasn't changed since it's inception [a
>> decade?] (and this limitation is there only for any multi-socket AMD machine with IOMMU
>> with more than 1Tb). Additionally, there might be architectural impositions like on x86
>> e.g. CMOS seems to tie in with memory above certain boundaries. Unless by a migration
>> targets, you mean to also cover you migrate between Intel and AMD hosts (which may need to
>> keep the reserved range nonetheless in the common denominator)
> 
> I like the flexibility that being able to specify reserved ranges would
> provide, 

/me nods

> but I agree that the machine memory map is usually deeply
> embedded into the arch code and would probably be difficult to
> generalize.  Cross vendor migration should be a consideration and only
> an inter-system management policy could specify the importance of that.
> 
> Perhaps as David mentioned, this is really a machine type issue, where
> the address width downsides you've noted might be sufficient reason
> to introduce a new machine type that includes this memory hole.  That
> would likely be the more traditional solution to this issue.

Maybe there could be a generic facility that stores/manages the reserved ranges, and then
the different machines can provide a default set depending on the running target
heuristics (AMD x86, generic x86, ARM, etc). To some extent it means tracking reserved,
rather tracking usable IOVA as I do here (and move that some where else that's not x86
specific).

