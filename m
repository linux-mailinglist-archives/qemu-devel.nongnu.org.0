Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1A4B8738
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:57:06 +0100 (CET)
Received: from localhost ([::1]:35356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIvh-00083b-A0
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nKItL-0006od-Pu
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:54:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nKItD-0007W3-AN
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:54:36 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G9mxGa024600; 
 Wed, 16 Feb 2022 11:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ca5pzV4UW1yrB5qfezp8sP1m1nTKclh3z8ZfQ+Lmm7Q=;
 b=YwbTMURtfyl2dcbAgHtpzew0AmO6PG1YqFA3g4jmxa6r0Sto5n7gsxbyAFhXiek8bDkM
 KuJGJMvTI3MzCJRi3IUyDVfddaVopyeGAVPOi3IWiTa4zGHWppr/gC76XaMsHdj1l9Ne
 Cn1lY9tEOURdJVs36//aNlhAZBVkFO1SUdXNAHfesoyaAyU8C7W0CIWJHiHPTXT/7Gp1
 Nh86AVZuoeBHM48K39+FAbcgypNiQ96bipo//QguzbdjkmjLfdrOzrfZbsw01CA1b01X
 ohnb0FT4ZadyUo1ldu3c9VTSIerWzzA+jtcfzEJzBsSRm1/OIHv9m3BT7AwtnvYJuJXJ nA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3hknx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 11:54:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21GBpN0n084398;
 Wed, 16 Feb 2022 11:54:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by userp3030.oracle.com with ESMTP id 3e8nkxx227-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 11:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B30J0FnbKJuQ+1EXujLByhfxxvxP0h8UVHGW5BJ3gL5Dxqr+ygCud9YIj02UX4DpnR49flyrQzKEuTxmYcw/v4WeBHR/KwKmAK0qXjM+sGT3q8Sft9QTaFaT8B7/mkP3Me+T1FPzUWk9vLW0I7MRGdhY4juoaOL5dAtVgjLXaogObQye28E2uC19c4NAgDSHpgQqfHvr/yM6KYj63atkeFhGcs+mY9mhYxl087qKZyvZEG4La+r3WpPsqaJ9q+AAv69GwdLWrNbjHFXzKvqLMAJEcRFvDAHlOGEC4sZgePuxoaEKFMrOohLAAcvOs/K64Y7p/P6MFT8db73s0pZ1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca5pzV4UW1yrB5qfezp8sP1m1nTKclh3z8ZfQ+Lmm7Q=;
 b=R9p6Nsh0kiMTxsT+VJ7tc6vVI9Dww6LNm5Jkn5jf5w+LsZIWHu9SA2egZ23N8szOjmNFWuM/n2RxLhaZrEtahQ1bPxlR1he/0W8ZrPLSY3IYwgniVVOokREU+o/E15WwWHGpVw2jaDH6EOV2wiaiz63x2LJJWZdUopKWzn01EMrx+Jdq920ldxKcWLOtWZ20Xqpg6G6BkDQrSHSuDqNcPYtKJbDyeylkbjtn4Te5n3aAVbUzTvs45bnVO5nTtIour+75O2BDCND29Tn0HNNSCMX9/a/q4MG7WWHIE/rm1KzLOcbQxd8ELAmnUGeuIT48oqbQLHoEGN4WsmWDlwtp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca5pzV4UW1yrB5qfezp8sP1m1nTKclh3z8ZfQ+Lmm7Q=;
 b=sLDOXUB7mkq1D2cYw+wqoDVxWpqLcWM+lPMqje9AFI0ucdRqGHH1MwWVOXGLIDKCy1GjodrVgWkjbLcpoKluMJSccoCqhZzNOLfJAo13iP56IJS5CXozOBwADCDCORy66WLd0TAkC1IArc/AJ8jDBMwkV3W1dWHrPouOgwY2yBA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW5PR10MB5851.namprd10.prod.outlook.com (2603:10b6:303:19b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 11:54:14 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%4]) with mapi id 15.20.4995.015; Wed, 16 Feb 2022
 11:54:14 +0000
Message-ID: <df167baf-c21f-75e2-ed4b-5b53ab4ac2aa@oracle.com>
Date: Wed, 16 Feb 2022 11:54:07 +0000
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <8a0bcebf-117e-fe41-a477-4769ca94472c@oracle.com>
 <20220216081917.sqc5jdikaoxjbciv@sirius.home.kraxel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220216081917.sqc5jdikaoxjbciv@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0075.eurprd05.prod.outlook.com
 (2603:10a6:208:136::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8edfd8da-6728-41ba-6080-08d9f1430db1
X-MS-TrafficTypeDiagnostic: MW5PR10MB5851:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB58515D11A5431E7EF33DBFFFBB359@MW5PR10MB5851.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: On0wfctXipR+SSxVizUkx2+Yd63qGE8PMTY1CLZecr+R6F5nSXeCWLxbScIHwIdiWmtD0IWLD1fc/bT6uCZF5Q3P6O69YQUIYrgw06Pm6MV7NLSmcYhU11LhY4LBT85fIFuStdN95KBjWKmZSIG4imfthkuKEnlz160ilBSe5RY5mvm3o/TBWJ9XGsfhLNx8jWWcmBlUdm/fn1mUiefhpM98+A1iX/Ckgy+NmiqC+7K7YGnR28PENWQPRXaf02oXKZXyNikWXwjLqOUgjFkJAAtvODickqASDvIDoyN7BhORPJB/75p2uHT0WsSSwAiLZg2jAAG318wW7Tx55C4pWm/AqCUvzbhKVM9GgAq4ZomB7jAxYz/e6f4F/pqWSfhiGHSSubbHTXHM+M3d0nJJgZ2GNvaO5edyXDDOo5vp2udJJsbqmZ1I9TTYvHpQVF7Lp4C6qajkpaDtLAHxiT+eEilBhFTq6lTqQoHOurumhR4kdeWlERkzcWqTHnuBBC7LtZVeqV09XY3OGbQqoWPVTOhykSVOs1Q7j73S/W1853LxKCQMboTGlkzB7xQPs5M2Sxhc8pknPC2uw/mH6M5MXFzTc0c7Y5IHMdqaDFVEwZ6rpMwnBEbCmbhW+Eci6EO54vJVSbvGXMdTqjqCvagWQrs0GPozZMuS8HIPeTIMiuQloed7MCfVyr2f0BaDnBzUk+x/caGjr+hnYpYMLrIr0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(508600001)(36756003)(86362001)(66946007)(66476007)(53546011)(26005)(186003)(31696002)(31686004)(83380400001)(8936002)(2616005)(6486002)(7416002)(316002)(38100700002)(6916009)(4326008)(8676002)(54906003)(6512007)(6506007)(66556008)(2906002)(6666004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG42U243KzZFaHhSUEU5VkkrZ2tycjkrUWNtdDJNRGV0Z2VTTW5YSE5Udk1H?=
 =?utf-8?B?SHFBb3lKdU9DYWR2R1FQVWkvMVRnVVUzdE5PYm1kVUFhNmZhY29sZUYvSHcw?=
 =?utf-8?B?d3l4VUQ3Z1UrOEt4YWU2Wjg0bjcrOUY4citkR0czNVhCcEpkWmNGU01SNXVD?=
 =?utf-8?B?RlBFMTVLalU5eStmQmNnampyWUJzbmZzU01wYng3cWFaMURMY3huMVVPcHFR?=
 =?utf-8?B?ZDMwQThpWWJFWDl0N0l2aHpuUDZidG4rM3lQanlIOE9vV2hadTZEYnduNWtT?=
 =?utf-8?B?VGYvZjUza2UrN2I1YnJyeXhwSHhqNFE1b3pvRjJGUlRHRDZYRzl1VmtHWFVU?=
 =?utf-8?B?SlRWY2FWL2xldjVtZTNnWDZXYW5tSW5tWVZYbFZ6MWpNZ0tWOGtWWGs4bFhn?=
 =?utf-8?B?bWJmOWRLL2JSYW9BNmxKUjl5SGFiamZlUzRKemhqU09DMDFIRWx1RmdCcjRR?=
 =?utf-8?B?Y1dPSHVVOUJRSmVWK041dVdSYnFWVWgxalNwd3VaQ212S3FNdmJkdForRGZ4?=
 =?utf-8?B?YW1xK0FKTDJpTWpOcCtRVFlrRWdWV1J3eHpROS9xaE5kVUxVM2hDcHJ6eEtM?=
 =?utf-8?B?OC9vdHFxUUFBNFJ2RWFFakthb3NROE0rUHg3WFNmaWhYbERsL1NtcC9saHdn?=
 =?utf-8?B?amNmYzFxSU1USENtMlo2bFhIREZmUngyMFZWQ1dyblYrbU1jQndac1VzaGlh?=
 =?utf-8?B?VjlockE1ZlAwRkxaL1RxaWxhWUN5WnVQOVBscmpEb2ZqYXBqUnNvWkc1UWgz?=
 =?utf-8?B?MWd4N25OTDM4T043UmVMb1lCd1Y0ZEJPUXNLTm9YUXlzRkJjQ08yMkRkUXZq?=
 =?utf-8?B?Umt0Q3RTYXNITU5VYVpzekhvLzVWUENGMjhwZE05aDI2djlVVURUTkRBUVg0?=
 =?utf-8?B?VmU4ZEhQMEhWUlpqV1RMbkE3VXVLcEZiR01DOFJQY1BQR2w4dmwwU0VrQTlQ?=
 =?utf-8?B?TWxOUVgwYURNUWdvTzV4cC9JVm9YaHVFbUJwMTdUdmlkeHEzYU9BWEh1MDMx?=
 =?utf-8?B?RXBYSmljVTVYQ01UUHFxVmkxTmJnVEF1cmVoZlZUQm9BTkN1YUF6MG91RU5U?=
 =?utf-8?B?UTA0amVkNW55VWcxWEwrQnJUTWxLQ1lBZnNOaVNpNVFtODM5S2MzUFhQN1Aw?=
 =?utf-8?B?NnNrb2ViUnE4T1ZpdGxLcmc4UGN6LzhSUnp3dzF2RjdsOU54dlNBb0dHcng2?=
 =?utf-8?B?M1NNMVpudUo1T2VYbjJVZTJjSkhkMkR2RDI4dU9OT0Q2MmtuTUN4RkM3Y3lL?=
 =?utf-8?B?NmV3VHNVYUZNTkkxSmU1NGREM2xqUEF2cEpxdEpOWDNlVUJQS0Frd3Z6cnVh?=
 =?utf-8?B?amtVNmdHT2FuRThNbFhzTjlpQzUwZWRzOGFWSWN6b3NXWDloMEFhYklQWjNX?=
 =?utf-8?B?bTh5NUZwR01oRGpET2lsZVBaY1VmZWZ3bWNvL2t2Sk02cW8yRnZuT0JzM0s2?=
 =?utf-8?B?MUVMaDhsdGkvcnFYTFg4L21BQTdvUkE1eXNWVC8rVUhtMDdCSGJ1M3BvTTJy?=
 =?utf-8?B?WlZFUld4S3hCeG9IaW1jYmRYeXJrUXl4dmt6RHlWaTdsT2xsZ2d5WGRQeVRW?=
 =?utf-8?B?dG9xQTBzOXZ3NkpZYkJWL0FYd1pkUC9UUjhSelo0bFRoOVpBTGVPTCtBMnpm?=
 =?utf-8?B?cnZpSDF4ZkVDc2kwTmNIOVNrY1hlU1BKVWNRKzhHOEZZVTNydUZMT1k5VmZh?=
 =?utf-8?B?RitTLzRMcW0zOVZVOHNtNEd2WVBCcUJ3Qjh3ZEdqZDJydWNXdVFBMjYzV2VG?=
 =?utf-8?B?MmpsQTB1TlJZbWd0SEQ4aVp2eGkyU09kR1FFUWxmSWZ4WlRLMXJhWkFyTzU2?=
 =?utf-8?B?eDZ2bkFjZ3NySlVlUERKUG9RNitWMlZBMm5FbG10cWRjem95b1hlMjV1U0wz?=
 =?utf-8?B?a3hzMzg3dGovbGdxbCszbnhYZzNJWnVMdjdSREFLQXphZFRCMmZaMmRvV3N2?=
 =?utf-8?B?Rk9zT0oza3paMHRhVTVLRWNyUHpRME1teGxJYUJpUVV2aU9KYllQRTB0NWc3?=
 =?utf-8?B?RWpkTEtCSGhibWcwemtoNm80WVFnUVZqRlpMVDMyUmIzREExZ2pJV3VNLzBB?=
 =?utf-8?B?M3djSmhGRUQrbmE5YytvallHWDhCRWlDRCs1VWNvSFFIVytUMGtHTlBqRHpu?=
 =?utf-8?B?dmRJQXFvWFNCMjhTYjRzY1dYdDV3bldWNmhwUWhiVHlHWEF1VmVCdDNBdHVk?=
 =?utf-8?B?R0xxVHM0ZDM5MDJnVFMvSjgyc1FnRExlVEFsS0J4bjlPdXFISWxUNzQyeVhP?=
 =?utf-8?B?RmdKdmMxWXNNVDdkVld6OHZPc1pnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edfd8da-6728-41ba-6080-08d9f1430db1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:54:14.6341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHHrijbqhyl+3qY2RaFtUL+X+Ff2jyzIV66iUrna7ABltnF6I18cvwVPbbGRrcDT2TYE5ZoCwhwfqAqoko3SQU/EX9TsRjlWMX6kqKmwuRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5851
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160067
X-Proofpoint-GUID: wTTwr1ol_xRUUynhV6pr509ZuwlzkrD0
X-Proofpoint-ORIG-GUID: wTTwr1ol_xRUUynhV6pr509ZuwlzkrD0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 08:19, Gerd Hoffmann wrote:
> On Tue, Feb 15, 2022 at 07:37:40PM +0000, Joao Martins wrote:
>> On 2/15/22 09:53, Gerd Hoffmann wrote:
>>> What is missing:
>>>
>>>  * Some way for the firmware to get a phys-bits value it can actually
>>>    use.  One possible way would be to have a paravirtual bit somewhere
>>>    telling whenever host-phys-bits is enabled or not.
>>>
>> If we are not talking about *very old* processors... isn't what already
>> advertised in CPUID.80000008 EAX enough? That's the maxphysaddr width
>> on x86, which on qemu we do set it with the phys-bits value;
> 
> Sigh.  Nope.  Did you read the complete reply?
> 
Yes, I did.

What I overlooked was the emphasis you had on desktops (qemu default bigger than
host-advertised), where I am thinking mostly in servers.

> Problem is this is not reliable.  With host-phys-bits=off (default) qemu
> allows to set phys-bits to whatever value you want, including values
> larger than what the host actually supports.  Which renders
> CPUID.80000008.EAX unusable. 

I am seeing from another angle, which the way to convey the phys-bits is
via this CPUID leaf is *maybe* enough (like real hardware). But we are setting
with a bigger value than we should have (or in other words ... not honoring
our physical boundary).

> To make things even worse:  The default
> value (phys-bits=40) is larger than what many intel boxes support.
> 
> host-phys-bits=on fixes that.  It makes guest-phys-bits == host-phys-bits
> by default, and also enforces guest-phys-bits <= host-phys-bits.
> So with host-phys-bits=on the guest can actually use CPUID.80000008.EAX
> to figure how big the guest physical address space is.
> 
Your 2 paragraphs sound like it's two different things, but +host-phys-bits
just sets CPUID.80000008.EAX with the host CPUID equivalent leaf/register
value. Which yes, it makes it reliable, but the way to convey is still the
same. That is regardless, of phys-bits=bogus-bigger-than-host-number,
host-phys-bits=on or host-phys-bits-limit=N.

> Problem is the guest doesn't know whenever host-phys-bits is enabled or
> not ...
> 
> So the options to fix that are:
> 
>   (1) Make the host-phys-bits option visible to the guest (as suggested
>       above), or
>   (2) Advertise a _reliable_ phys-bits value to the guest somehow.

What I am not enterily sure from (1) is the value on having a 'guest phys-bits'
and a 'host phys-bits' *exposed to the guest* when it seems we are picking the wrong
value for guests. It seems unnecessary redirection (compared to real hw) unless
there's a use-case in keeping both that I am probably missing.

	Joao

