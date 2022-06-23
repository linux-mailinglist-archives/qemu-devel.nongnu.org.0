Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D385B55830E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 19:24:12 +0200 (CEST)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4QYt-0004Pd-Lb
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 13:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o4QOk-0006sZ-O5
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:13:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o4QOh-0000TX-9j
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:13:42 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NEQ05F004652;
 Thu, 23 Jun 2022 17:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=peFnNOIqZ+lPCxWzCowcKwCiz9nt0mAKjnWBChh09hQ=;
 b=kMaitxfVehIRIdWJxKgPT+LKCa3iqbMMw6SrJdKwhGkxiQaAMQKfS44YzweA0+kDV42/
 aeAo4qWaQCUpnc/q3v+ZMAklCdoEDPgGPXEqslbsztBOtdlAILlKAvHt2FKExIWOTnCV
 2qW3CLrVBxNYG8t4TNiKuXIS5R9DzAD/R9X0BF96KZEfpbnFdo4CgAEcOL7TUf+B4lvW
 UuLX2+5nOqhbNokId3cupVPoOY/h/Ww5lLntWxjNH50cMNjwI5OvPBSd7RzSnkPiPkA5
 EUgrwXudAa1gUmtLow/3qERD7wHk9M9H+qu33gHG59uv94yMdcJySfLOhCzPR1Xlqxne gw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54cuncm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 17:13:33 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25NH64Mf004648; Thu, 23 Jun 2022 17:13:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtkfwtqh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 17:13:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwKGnyPwP0j8UtimDk178RoprWAzJrFhQs1Qbo9JjIeg0oTyW5nx4wtLQU2iaw53/sCVk6sml3/DU5j5IvgWC13inpyxYNPD3D63T0g2jlQ3n9WmxVUMtPTqIdx2Duads/TMmhMm0bwqOMfIrDcl43UpzZp/ALG2OgpyYboEhLWN7rgASka9Ifq7dIStO3VMWT1qXLoasOSriJ9GGAqyqrDgiOr+2ijD4RFtc4ssLxTfqIx49RLtTR7t794EioCOR2OFsm8mByDkj+Zg8rZs0C/ddn2K0ICabE/1bH2KtF0jRtoZ9Tme3qa9rSnZAyWrCuVEAljnSyTyTe1hschnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peFnNOIqZ+lPCxWzCowcKwCiz9nt0mAKjnWBChh09hQ=;
 b=LBH1+fRWAVyNHt7DDN2bqK0FEhDmXYEnlXo1dSpS77ZYoSdyzICHTPqaXTbAc4j9Xv3NsW+C9RBesb8x/z8QeLOemDWoubJhTqkIhY/bFBM9Ey+n54WWfozDYa3Nbt4fxHE3JeyiKHkD6CamIE+lSeREKj/5rhlkNKBzbfxH4Uap7BfgmLEoWIY+PCHFU0brCITROAT8ffS2En0vB8cAIRidz5iaVOyu8joUMfhUrIVuGZ7HmMXfRh++lOnMtXwVkMxVGSHkLnUwQfhWlqqkIHD58IcV8IqUnmEsOybbKtM+7cVfE3Q3xOrDYkXLM4jxd3nz4EhLYoSDYicqmr2jUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peFnNOIqZ+lPCxWzCowcKwCiz9nt0mAKjnWBChh09hQ=;
 b=NFe9TpNj2AndQwe/qCTdpov1pHIcaPoWUvqPVnn5jj2J/7U6LF3Urzo+N6VqxDn/d/iB8125eX993fnUPNl7aZq/VZRw9c548TCgCd6R1GQahclrQ+6+qyntLdq1nSsp78j2wb0BbDSR9E4aRZo2nZEDo/ZxwPc3rnWc1xejPeY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BL3PR10MB6018.namprd10.prod.outlook.com (2603:10b6:208:3b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 17:13:30 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 17:13:30 +0000
Message-ID: <d46d3f13-dd31-8c14-ff6a-c350ddd3f5d3@oracle.com>
Date: Thu, 23 Jun 2022 18:13:22 +0100
Subject: Re: [PATCH v5 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 wei.huang2@amd.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220622163750.12424dc3.alex.williamson@redhat.com>
 <5bcd894f-ad8e-2b39-c4a0-33814eacd85d@oracle.com>
 <20220623100318.4f768681.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220623100318.4f768681.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:208:be::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dd0e313-5527-4a74-1805-08da553bb1be
X-MS-TrafficTypeDiagnostic: BL3PR10MB6018:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHx0Idiy4cY9dipQu5jFhuM5f0j1QjFpAXmEP3jBvI9w26wgllyJQq2pQN15LSwENZdp2IVGJvlPSe51kymuNF9boauzks/yJlU+31RWBxVXi6dv4OQjR3azP+bqUAdVeORqbcPv9lbEenQCM985s6KXvY53jEXnjRjzc9tK79OTcNBJ9ZShl/ddopsnJTwz85LhTXwNdeSaNe182CL8FoezkG1R3H7BqGLuzrz3hPcrtb+uQ1saMSnvBJAA1vXiOn9FXQmm+eHt8fvIxFdZK07rz7FdCnj6h653LMW8Nt3EsKOItDqeiAWB3bvFTjNPFrsFQPFcTQ+20KB4IRklrIUO/b+0FWXORohW9QVDMMQ6bcwG8+0WZUE34WFsgAETJDNSC+HSvQo+KpKmkwRQeGrxTabnPDStPVyqOXf2kS/m1Hmy9nvVvdKztILKO9LzeO5mUnxGCJ7/GYBIaT8ZeGqX7LQ3v5qj3HMYrpqMDYuJvWzN3GNqb6aGWA2geU2BBwi+Xziv4w5+aOPnum+ngI54n0IyR6yyo1emCtCcme6zJAaJHmCHKoyCMcbcH/XEzgx/RCy7Un0d7eYFSf2f1rZn8ZatOWEqHcaw6yaD7AOTSVHr5nwKYn4eUb7LX8INXqWg8DgNz5CEh+YLFjl0bUJ8/nTJLvPoCxREG6mfTd59qgqbjdEHRrPLjnWG2hJ63WaRMdG0HTMoVC+LkL0BgDbDiAbntIlSZl51vjLqf0MXeSKEK1VHqkwenjs6OMzdLDdUUvIYMEueBfR4RsY5G0B6+l3iCQqM3oAcaVfhnZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(376002)(366004)(136003)(39860400002)(54906003)(53546011)(31696002)(6506007)(86362001)(2616005)(5660300002)(83380400001)(186003)(6916009)(38100700002)(31686004)(2906002)(4326008)(7416002)(316002)(36756003)(6486002)(8676002)(26005)(6666004)(66476007)(6512007)(8936002)(478600001)(41300700001)(66946007)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akUxUzRkTzdmNkcxeVJha1dqbFlUVTlFUjdVRG8zeXcwVU1lRWNESCtDaGh4?=
 =?utf-8?B?ZzRIUzRDUkhNUDZlU0dHSXh5L1BVYTk5VE43aDNQOHk5eThwK1RMWWlpbExx?=
 =?utf-8?B?KzlKZkdGdG05MGVYYXZDN1FRbUlsRG1mSFk5Q1RxV3lnSmptcXNhUVZnbCtT?=
 =?utf-8?B?MXF3eHphVkNGU1hwZnFQLzNBVWNtSjIwbjhOMCs0RWh3czlEekZQWFljdHZP?=
 =?utf-8?B?REovU2RZSkJhbzFYRmtscWhQTUxBYjlYRUdEREZrOXIweDY3YndUVDZIUjVm?=
 =?utf-8?B?Y0YrVUFmTlNDNGNSZHdlODdHWndqbDZsNlhBbG41NHg2RjhFR3h6dngyR0RN?=
 =?utf-8?B?QmlzTWVYOFdkUmR5UmZQZDJhV0U3YmRnbFJNa0hTZDdHTUpERDFweC9LWk0r?=
 =?utf-8?B?MDdQc1JlZTdaTjBoc1R0QWJMS0tleXkxWWZsSEt5Z3NMaHdHQ1J0ZERkSWgz?=
 =?utf-8?B?NS9YeHdmSVpzd0FnZGJVZi9LMTB0QUdxelZUOGJYRmhsSytBLzhOTkhrR1Zp?=
 =?utf-8?B?Nk8xdmhYMXhRc3VzVWVRWi9EMWRoa1crSi9jUTRsSE1ZZThQUkRTOXFNakYz?=
 =?utf-8?B?dDhuRU1MbmhvQTJEbmw1RGk0UExKWHFmQUhlQThDZnJSbzN4STZ5NUNzV2U5?=
 =?utf-8?B?R0I0Q21QWTRMWFhXdktkTkxSWkV1K2pobGpsRkhET29jeFM1RmVHK09KSGh2?=
 =?utf-8?B?RVFpdWY5RCs4OFVLQUw2WXhkcTJ5Uk1jUWp2NFpyaFBpd1M5UWlSOVNpUkVn?=
 =?utf-8?B?YWlkZDA0NjEyOTRZM3d1SG9xTkhERVRmd3hsRjBpRSszeUIzeUJ1L1BzbjVW?=
 =?utf-8?B?V0hkcWhWNFU0VGtBeDNSMVZLS3JIZHRQMWlnaUZ5ajlWUkk2SjArODJaSlN5?=
 =?utf-8?B?N2J3K1crcHUrRDdiem1HQlR6RlFUNXNZbmtEOHpsL3Q0VmY4citIbEdXWVB0?=
 =?utf-8?B?QSswY3hTUHJoSHZoaThIQnArNGdCcnJUUHhPOFozemxaNk9ObDYyVTV4cXFT?=
 =?utf-8?B?YzQrZFVRQ3c0Ym5Wd0hUV01nWmNsMkVDZElyZEhQbHZNUmMvTXVmSHZDQ2Jw?=
 =?utf-8?B?VFd0K200ODVQN0ZTbE95b1kvbU0vR01GelZqZEY2NzZMNDZvMlhKUG5ENy82?=
 =?utf-8?B?SjhManBEUDBuK0ZLdUI3V1VxTTRLMzU3VVJQUkdsUUoydkp2dEloN1l2T0NO?=
 =?utf-8?B?TExkY3E4QnNmZFV0T3RLZTc0bWFMSHVMRFYxK285bTErZVpGNmUrUjRDRlBB?=
 =?utf-8?B?ZWIxUlcvY0NlUnhCeVVVSEdCRHlCeEV1WWF1TXlpTFIwNVg0emZYdzJ4cDdv?=
 =?utf-8?B?OFhuV1BQQ3J6OC8xUGVQa3czeURBaFUvMFlMaXh6VFFRSW9pbSs1TmRkbE9S?=
 =?utf-8?B?R1JjV3FzOWw5TkxRaHhuNE5abm84MStHU0xmVU5FNnFyaXVQa0tFaTVlaWlo?=
 =?utf-8?B?S1dEL2g0Kyt5Y3pXMSszMk9wQ2ovU1MzdDU0cW5PNFBURHVHZkpYNWgzQnpa?=
 =?utf-8?B?MWhHc1J3RUwwYWJPNENZVHNRdnF0eStQRFhDSXNlZytXZGRWczFxc1Z2ckZn?=
 =?utf-8?B?NTZ3Zlp5eHdQa29adFlVVGh5YURrZlE5L216WjFPVEJGWm9zRk92ODFBVWVT?=
 =?utf-8?B?Z2ZYeG1vRzFab3FSZEd1WVZuWmw3SGl0NVNKOHJRR2Y4VSswTWVuZExZN3VV?=
 =?utf-8?B?RmdaR0dqMVdKV1YzamhKNXkyOVpqbUFRbFFDNFNCUnRRT3VySzg3NkNmYlRC?=
 =?utf-8?B?NVRLck5nbU5tdGF6aFY0bXV0Q3hHdXFDMXNYb2ZxWFpYek1aNjFVbHBmaVhl?=
 =?utf-8?B?Y0wzbElDWjdLV3FkanVYOUJkUXhBbWJoZlczNXl5ZnhkaFJCakROajc0Qk43?=
 =?utf-8?B?MG5TWnVVNm9kRWsvUUs1RzIrdHNBSTJtV25jWWVRZ3ZnM2dyWlFDRlN6NzJO?=
 =?utf-8?B?aXBnS0xuWHd2MzhsMEY4b0MvN29SWk9kNGszUGlONHQvclJFSHpGWkFHb1Z4?=
 =?utf-8?B?aGI4V3hEUmZIS1ZtcnNHSlpQeXFSeXlmaUVPOEtYa1JzYVhDK1c2d1BxWTVM?=
 =?utf-8?B?YkpFa2ZaUnVXQTFmQWJVRmdTeVVMM2tnT2tFaVhFb0dVWGZSdE94b1krR0lY?=
 =?utf-8?B?UU1uTklPSkZqY3hyWThYQzIyem1LUkE1RmJ6cWY1OEEybHZYekdzMm9lZDlG?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd0e313-5527-4a74-1805-08da553bb1be
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 17:13:30.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QV/dLY9WSmKJyqdtT7RJ45Y7+i92Yb2OkwgYCtW/HkzHyPEnQu/S34+FLAMlG7EIfuYzIMiYZllz5spI5/Y24my3mP9Zs7AW/YCKe/E3PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6018
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-23_07:2022-06-23,
 2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230067
X-Proofpoint-GUID: -DbeLJyM5Pf9zbU3WtN6ixawnLR40IWm
X-Proofpoint-ORIG-GUID: -DbeLJyM5Pf9zbU3WtN6ixawnLR40IWm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 6/23/22 17:03, Alex Williamson wrote:
> On Thu, 23 Jun 2022 00:18:06 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 6/22/22 23:37, Alex Williamson wrote:
>>> On Fri, 20 May 2022 11:45:27 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>> v4[5] -> v5:
>>>> * Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
>>>> * Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
>>>> commit message;
>>>>
>>>> ---
>>>>
>>>> This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
>>>> particularly when running on AMD systems with an IOMMU.
>>>>
>>>> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
>>>> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
>>>> affected by this extra validation. But AMD systems with IOMMU have a hole in
>>>> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
>>>> here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
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
>>>> Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
>>>> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
>>>> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
>>>> as documented on the links down below.
>>>>
>>>> This small series tries to address that by dealing with this AMD-specific 1Tb hole,
>>>> but rather than dealing like the 4G hole, it instead relocates RAM above 4G
>>>> to be above the 1T if the maximum RAM range crosses the HT reserved range.
>>>> It is organized as following:
>>>>
>>>> patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
>>>>          address of the 4G boundary
>>>>
>>>> patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
>>>> 	     to get accessing to pci_hole64_size. The actual pci-host
>>>> 	     initialization is kept as is, only the qdev_new.
>>>>
>>>> patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
>>>> possible address acrosses the HT region. Errors out if the phys-bits is too
>>>> low, which is only the case for >=1010G configurations or something that
>>>> crosses the HT region.
>>>>
>>>> patch 5: Ensure valid IOVAs only on new machine types, but not older
>>>> ones (<= v7.0.0)
>>>>
>>>> The 'consequence' of this approach is that we may need more than the default
>>>> phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
>>>> address, consequently needing 41 phys-bits as opposed to the default of 40
>>>> (TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
>>>> pick the right value of phys-bits (regardless of this series), so we warn in
>>>> case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
>>>> ram blocks, but it was mentioned over RFC that CMOS is only useful for very
>>>> old seabios. 
>>>>
>>>> Additionally, the reserved region is added to E820 if the relocation is done.  
>>>
>>> I was helping a user on irc yesterday who was assigning a bunch of GPUs
>>> on an AMD system and was not specifying an increased PCI hole and
>>> therefore was not triggering the relocation.  The result was that the
>>> VM doesn't know about this special range and given their guest RAM
>>> size, firmware was mapping GPU BARs overlapping this reserved range
>>> anyway.  I didn't see any evidence that this user was doing anything
>>> like booting with pci=nocrs to blatantly ignore the firmware provided
>>> bus resources.
>>>
>>> To avoid this sort of thing, shouldn't this hypertransport range always
>>> be marked reserved regardless of whether the relocation is done?
>>>   
>> Yeap, I think that's the right thing to do. We were alluding to that in patch 4.
>>
>> I can switch said patch to IS_AMD() together with a phys-bits check to add the
>> range to e820.
>>
>> But in practice, right now, this is going to be merely informative and doesn't
>> change the outcome, as OVMF ignores reserved ranges if I understood that code
>> correctly.
> 
> :-\
> 
>> relocation is most effective at avoiding this reserved-range overlapping issue
>> on guests with less than a 1010GiB.
> 
> Do we need to do the relocation by default?
> 
Given the dependency on phys-bits > 40 (TCG_TARGET_PHYS_BITS), maybe not.

Plus this might not be the common case, considering that it is restricted to VMs that have
something closer to 1Tb of memory, (say +768GB) *and* have VFs attached that have very big
BARs enough that cross the 1010G..1T reserved region.

... Unless we could get an idea on how much the PCI hole64 size will be at surplus (based
on device BAR sizes) to understand if it's enough, and relocate based on that. Albeit in
qemu vfio is at a late stage versus the memmap construction.

>>> vfio-pci won't generate a fatal error when MMIO mappings fail, so this
>>> scenario can be rather subtle.  NB, it also did not resolve this user's
>>> problem to specify the PCI hole size and activate the relocation, so
>>> this was not necessarily the issue they were fighting, but I noted it
>>> as an apparent gap in this series.  Thanks,  
>>
>> So I take it that even after the user expanded the PCI hole64 size and thus
>> the GPU BARS were placed in a non-reserved range... still saw the MMIO
>> mappings fail?
> 
> No, the mapping failures are resolved if the hole64 size is set, it's
> just that there seem to be remaining issues that a device occasionally
> gets into a bad state that isn't resolved by restarting the VM.

/me nods

> AFAICT, p2p mappings are not being used, so the faults were more of a
> nuisance than actually contributing to the issues this user is working
> through.  Thanks

Ah OK -- thanks for enlightening

