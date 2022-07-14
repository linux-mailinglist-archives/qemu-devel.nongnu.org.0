Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E1574B25
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:50:13 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBwQ8-0005wk-3Q
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBwNh-0003uI-5H
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:47:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBwNd-0004di-9I
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:47:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E9PUse020554;
 Thu, 14 Jul 2022 10:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=FvfJzMSKaZ6SSvKwejMO4YxzP925660WuR8VroYXhVE=;
 b=U5eXsdGJ7c4LuhA535Paiu80Jtf5AAQRLys0heFTDsztBqs2XS9AT9LK6xnBY+X9UjNM
 A/etsdz7huagjvMLPW3WSe+Rf/mQiZskSgnzBnRSujdplK/BeGbhirz0FhCeZFZTL0BY
 b7OiLYrhsgaTPL7EAJrJJHP6uec3LRszZ8ZZGDLG8STyq0hw1I4Feg7UQ48W6shsIVjW
 S8g/Ab1QWId9hGgYmPDt4SlktXy6vjPDrNmufcnM2alJLvdvF6VHJdkGRgRrqOt5jR6V
 sm/5YSTMQmhLJLX0LrQI6TWlvpDmCvzT0EF41QLBGhg8oIRixbO5GOiAoEVTy/Zul+C0 pQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h727sn74n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 10:47:27 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26EAkHGY019407; Thu, 14 Jul 2022 10:47:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h70462qy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 10:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOJRrnlgwcARUXNI1Sca+jZtUWXJ0EUhTJVkWgrLuaaFLQaU7uelLWXcdgvDEKK6mw0l0d1GH4Z+o83uWdhaXyqF4AMmuJfJLD3L6V1spdzMsw8CTLgCHkWQFpb0dDfA9xpamtkw/pf+QKl1b4cv5k7eppYphFuBJ9Z+VVcKtvJNL5Hr6/2LDNotT3wuQR7yFNejajrMciwk0sKVw/BwdzPg/Gj5NGbrSpM4q3n8rG3Ji062K4sMPZpgTxhx+rd5meifkw+4dQVhSl1vyu7jhFShuKvcUkqAUdrrulN48gKnH+8qTy30D/UFitrj8gwb/kzsz+F8fNIF9CF/C3E63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvfJzMSKaZ6SSvKwejMO4YxzP925660WuR8VroYXhVE=;
 b=LvecBPCEuFofbTWHgwB2aLPmJGzNPzlmgSmTf4sF8yeK4JKOLksAJ1TnvDwo5Fhcz3BVqyIPwx5fsmp0En5DuNwY9P8qVEUvMqrGqW6txOqu5avzeoXQwqjMw8XofOzeXzhdqierHfSXFOpHS0X0SPf9cW/dYE2LV9aN9EfKQpVw5Tgj4Jtf0K/g3xzaZWBG7xhMvfd9nKmpXa5/ennEcwmGu7WctriqS4wHiNhsW3QDRc2z6mVDtP3XgiV8A14vjbu35VpkxK2FHvROfvsRgT0V+tyPZ4Lxh8uDuqJoTOc7oDuNn6DLwDJbdr5utNB4JJV9j0+M//X7Z33RQ+ZD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvfJzMSKaZ6SSvKwejMO4YxzP925660WuR8VroYXhVE=;
 b=GjdkblI2cYi3fV/1nYqZ2IpvFmHo1d5CP4uf6SR3++JVeVm6l0yK3JzmGGsddDt4x3UgcGk0uuqboIcfK8gYfBJ+BAJlll8REpZC88fFyylc7urq8pnBbhXijG7PM5i0arTbJ4A1P1nqE62rGVrwNu519kEVCp7qqWxEnv8iNL0=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DS7PR10MB5040.namprd10.prod.outlook.com (2603:10b6:5:3b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Thu, 14 Jul
 2022 10:47:25 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.012; Thu, 14 Jul 2022
 10:47:25 +0000
Message-ID: <22b27ecb-3ce4-bd47-90d5-4784468a8776@oracle.com>
Date: Thu, 14 Jul 2022 11:47:19 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
 <addb6d9f-5d04-0280-a0b4-79edd888faeb@oracle.com>
 <20220714112820.2cf526ea@redhat.com>
 <19de0ed6-f29a-2f59-658d-aeb694043038@oracle.com>
In-Reply-To: <19de0ed6-f29a-2f59-658d-aeb694043038@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::7) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f4cd80-4a61-4cec-6a63-08da65863ce8
X-MS-TrafficTypeDiagnostic: DS7PR10MB5040:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNLi1BTsyFVBI8uyw+hb0b5yCoZMC+x5QYjjP3NY+4+7sCDavFVGTlcpLk1bjrV9dU9vAzzzcrbmryq6mfsRCVOpx/z2HIe2M8nQ6Y7Vr8OuQanmcqMHusV41GoQxGJCg200g7aX/qJTiPof0/0hryZBHNi/U+W0n3/d6WIamht2sNaEaqTS+XPBnPecxBr21k4k4erPK+DCmCPcrXEDDhR3HgEJc0YPe8zMPL+cMez9iWVFgcJZWufgncwKlbaEIsOOuqsXhBuiuIoHEGM7MxuYCf0raxNUoYZ2TXJcrdpzKdDaIUF78PjR+mT19xCVDBjrFsmTnTnAoFS0xDgPq5PJI/K+8FKmSOpnrtsz4kWS4QD8mMORChY92HxHM7kDodNqaT7pSQ8Hq+WolXbZib0tK5KUy/NVnNtthSxdcvQbOZ+p13ueXGnPjAJfR5/U3W3TdVWnXObSpYekXU8SNq5LWaifeSXawRirNmjNyJYlY5t16vPn1Sx6A6VehyIpzBnRyn48JIrectjimAOMpfU/fxUqGw/DTiZcBhbtEiXcvyPqd8CFPc80b6ouA1Eba3ly/VgwsNJK5bkYCBt2vHe0MSNYw5ltPUJgWM4X64LSPD1rKFxlY3ldxTxHFrWjS0cynR8WzyG+02K3gLCq42V6qhqvN9HcafmVoG1mnn409kqNz9XiSTLthr6m1vWmobcRS0FkzX86Y3i6XX7FQahCrWgO18E3qwq5+pAJAmFxg9+1vft8c5tp6eClND7p9Wsrf97qUaPyVTAez7S9Py4hpUHeAPzoB11HQ3ExskbeCCxr6NjFtYDrBetamsIS+ekICW1bwhBZbqxzeC/yn1GOSC5BEvqlbDE44qKD0hZt+gcJcdGRo5zgl5cOT/y8P5gVwcbfCzgKnrF/29MxKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(136003)(39860400002)(346002)(6486002)(26005)(6512007)(6916009)(31696002)(8936002)(966005)(7416002)(5660300002)(478600001)(6506007)(41300700001)(86362001)(2906002)(2616005)(30864003)(38100700002)(53546011)(83380400001)(66556008)(186003)(36756003)(6666004)(31686004)(8676002)(66946007)(66476007)(4326008)(316002)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzM0ejk3bnppN29KK1k4SkU2RTYrWEt3c0Zad1V4MCtLdUdJd05LRDZzdVpj?=
 =?utf-8?B?MlpTcEk5TXBMM0Y3NjJFWFZHS295YnA5S0lpanZ5dWJZMHl3QVBTczMyeDNU?=
 =?utf-8?B?YXVmT1F3L1VIcWlUUURaK0tacWk4ajYvc09NTjYzWGhPWW5kd2tsaWdrcndH?=
 =?utf-8?B?ZkFpejBXODBCTncxS3JuK2w1UGQ5ckpjeDlpdHB2TEFXN2VwVmJYU2o1aVVv?=
 =?utf-8?B?WEl4VzF6ZDBORHNCSGRnSXZZNTZUR1dUbkZHMnQ0M3JUMTZhb0dQcTFOWUVH?=
 =?utf-8?B?dFIxaG9zZkEyNWVpSWFmMk1GSTJMYXlDQzhLbndEUThpZ2YxeVVLT2lLemtB?=
 =?utf-8?B?SUYzdnBBdWl1K2JsY2NOdEV6WFZia0NHRUk4MlMwN1pCVDJxWFMxQ2FXVmtV?=
 =?utf-8?B?cWJlRXFFSWdLRnhlUVQ5dU1INGU5M2Y1czRvTXZJclI3cXhETW1OazcvVXhH?=
 =?utf-8?B?ZmxyQkZUM1F5bGROQ05vK3Foam01RDNRQzZSRWtndzFxRXZxZ3Rva0ZrVnVF?=
 =?utf-8?B?ZERuK3lGeldWdzhMN01nMW96SFcyMGROZ2ZaYThJeStleVVGMmtFVVpFKzhD?=
 =?utf-8?B?ZVBsYWdlRHRPYm9La2hOaFRzejgvL0toaGZSRFNXMlZaa3o0ZHJYR0EzLys5?=
 =?utf-8?B?VUcrNEh3c2tiVDVVQjF2allYREt6aUhUaUlIKzdxVHNOYy92RzlReXNUVndL?=
 =?utf-8?B?VlByOERRMVQ5QlN6cWZ0bkU2MTdUZ2R1T0Z6cTFNK2I5VnJXODVmVVJWZW1s?=
 =?utf-8?B?cThjdTVqRXBrbUxiT3g0dFRoUlNkUmx5NDc5WHBaOS9oZGZTWk5UNGIzdEtW?=
 =?utf-8?B?OXpsQjdrUkRVRm51cDZLbm1FOGt6N3JXbHN1dS9pcnhIS2F4bk5YZXpqRGZG?=
 =?utf-8?B?ZkI4UnNzc0t1TkVyVmlZR0I2bklBMk5PbEhQbU16UDh6WThhb3pnYnBNbkx6?=
 =?utf-8?B?Y0thNldtN0NCdEExeUk3dTdONTBPOGE5emgwb2Q1YStsZW9WRldEOUJWV25H?=
 =?utf-8?B?TzVVSE8zVzFhVFZrWnBnSW1wVFRHamRCKzdSbHArK3Z4ZWdNN1lmL2JjRkUw?=
 =?utf-8?B?WmxKbFhnWXg4aGV6S20zQlNmRXd0and2eEwrMDBIYnlIa3Y3a3pyMkZwdTRw?=
 =?utf-8?B?ekdWaG9WUE91eFlpdUFkMmtRZUM0amJlLzBHNE1UMkJJTkdZUmdmN2U3YUI0?=
 =?utf-8?B?clQ3cStOMHpOdlhIbkZ1UU9Ld013OHpXa3NGNTZhdm9JZ2JVc0R2bXN1UDhu?=
 =?utf-8?B?MnZPT3NKWnNrMHN1VjRweXZOUmJwVkl6NzFGcWVmODFOdFpqOWFmTnVGTFlw?=
 =?utf-8?B?L3EySnFHckpzMlI3YjZiN3N5R3RhUldHMGpVb3oxMUxnbFZhSU9mTmhLQjN1?=
 =?utf-8?B?L0J6WVl5a1NDcEI2U1NvRFJOcW15cXV0RmVtM2hTM3RNbU1jWDNaT1A5SHcx?=
 =?utf-8?B?NFNlMUkyNjcySkJuOHYzRHUwem1vYTh5NTU3MDNldjRCVnlPYmVZNUVwcW1N?=
 =?utf-8?B?Nmdia0t2VUt1NVQ1RTNVdERTK2JaN1gxckN1RnpjTnVZK01SZTV3UDEvcHZO?=
 =?utf-8?B?ZzMxby9mOTFHVEY4WEJ4dExVQ09QeURhQks2VmgwcFhWcVR2cnRYdW9JeTFu?=
 =?utf-8?B?SEZYZURJSHJUSmgrSHpwMjNBOEt2aEpiNGVFZDI4U0NJeG4vbU5SaU5GYloz?=
 =?utf-8?B?K2Y5UUdVblRsV2NIbjJzQ0hkeDhXVEUzSzBBQU8vK1cxbG1icnRnRU1uOER1?=
 =?utf-8?B?cVY4MGJEZjNWTFhSd1hLVDRUV09MMFA1UVBZa1g0TWNlcnIrYmMwcXk3WktD?=
 =?utf-8?B?TW5aUlAzdk5YbjNKMlhmZDFDUU9Ua1ZCRUpSM20yNW0xdlc3N3hJd1l5STJp?=
 =?utf-8?B?VVdEUmZ5dzhIZUpPV1FkM2JTUk1zR0dsQi9WTDc3dUcwdTdlNW81WEJCbVls?=
 =?utf-8?B?cnVhYUcvcFpGcDNwdFljK0tBejVVZU5pVXo5cDBkR3dSeUFCVG1kR2RST0k0?=
 =?utf-8?B?UElZNWxSMTJZY2JQSlVJQXJXY05LcjlqdWtjUXFrZ1ZIV0tFbmNFMmNNeHVY?=
 =?utf-8?B?MG5DS3lSRnRNZ1l3R0ljNDUzbWdDbXA1dHNGU044V1Npbkt6d0VNZkZRQWJo?=
 =?utf-8?B?MHlqVWY2aXE1R0RWYm8vcmVCd0Q2RFE2S3N3Vkp2N0J4NXB1a3lRbXVaNlU0?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f4cd80-4a61-4cec-6a63-08da65863ce8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:47:24.9483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aNoEh2043nOwgpN7gC+2BMLy6CC5eWX1hv+lPHr+iUDS++B451WyOVZGHcUbYT2OMyBVMX6dp+LxCPekvfvBVsmQm/17J1a+sFWWvOWTac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5040
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-14_08:2022-07-14,
 2022-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140045
X-Proofpoint-ORIG-GUID: Zw4xdvwWrhTQpHEM-2Igs2VHOO9ETcJw
X-Proofpoint-GUID: Zw4xdvwWrhTQpHEM-2Igs2VHOO9ETcJw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 7/14/22 10:54, Joao Martins wrote:
> On 7/14/22 10:28, Igor Mammedov wrote:
>> On Tue, 12 Jul 2022 12:35:49 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> On 7/12/22 11:01, Joao Martins wrote:
>>>> On 7/12/22 10:06, Igor Mammedov wrote:  
>>>>> On Mon, 11 Jul 2022 21:03:28 +0100
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>> On 7/11/22 16:31, Joao Martins wrote:  
>>>>>>> On 7/11/22 15:52, Joao Martins wrote:    
>>>>>>>> On 7/11/22 13:56, Igor Mammedov wrote:    
>>>>>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>>  void pc_memory_init(PCMachineState *pcms,
>>>>>>                      MemoryRegion *system_memory,
>>>>>>                      MemoryRegion *rom_memory,
>>>>>> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>      hwaddr cxl_base, cxl_resv_end = 0;
>>>>>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>>>>>
>>>>>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>>>>>                                  x86ms->above_4g_mem_size);
>>>>>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>>>>>>      linux_boot = (machine->kernel_filename != NULL);
>>>>>>
>>>>>>      /*
>>>>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>>>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>>>>> +     * to above 1T to AMD vCPUs only.
>>>>>> +     */
>>>>>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {  
>>>>>
>>>>> it has the same issue as pc_max_used_gpa(), i.e.
>>>>>   x86ms->above_4g_mem_size != 0
>>>>> doesn't mean that there isn't any memory above 4Gb nor that there aren't
>>>>> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
>>>>> max_used_gpa
>>>>> I'd prefer to keep pc_max_used_gpa(),
>>>>> idea but make it work for above cases and be more generic (i.e. not to be
>>>>> tied to AMD only) since 'pc_max_used_gpa() < physbits'
>>>>> applies to equally
>>>>> to AMD and Intel (and to trip it, one just have to configure small enough
>>>>> physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)
>>>>>  
>>>> I can reproduce the issue you're thinking with basic memory hotplug.   
>>>
>>> I was mislead by a bug that only existed in v6. Which I fixed now.
>>> So any bug possibility with hotplug, SGX and CXL, or pcihole64 is simply covered with:
>>>
>>> 	pc_pci_hole64_start() + pci_hole64_size;
>>>
>>> which is what pc_max_used_gpa() does. This works fine /without/ above_4g_mem_size != 0
>>> check even without above_4g_mem_size (e.g. mem=2G,maxmem=1024G).
>>>
>>> And as a reminder: SGX, hotplug, CXL and pci-hole64 *require* memory above 4G[*]. And part
>>> of the point of us moving to pc_pci_hole64_start() was to make these all work in a generic
>>> way.
>>>
>>> So I've removed the x86ms->above_4g_mem_size != 0 check. Current patch diff pasted at the end.
>>>
>>> [*] As reiterated here:
>>>
>>>> Let me see
>>>> what I can come up in pc_max_used_gpa() to cover this one. I'll respond here with a proposal.
>>>>   
>>>
>>> I was over-complicating things here. It turns out nothing else is needed aside in the
>>> context of 1T hole.
>>>
>>> This is because I only need to check address space limits (as consequence of
>>> pc_set_amd_above_4g_mem_start()) when pc_max_used_gpa() surprasses HT_START. Which
>>> requires fundamentally a value closer to 1T well beyond what 32-bit can cover. So on
>>> 32-bit guests this is never true and thus it things don't change behaviour from current
>>> default for these guests. And thus I won't break qtests and things fail correctly in the
>>> right places.
>>>
>>> Now I should say that pc_max_used_gpa() is still not returning the accurate 32-bit guest
>>> max used GPA value, given that I return pci hole64 end (essentially). Do you still that
>>> addressed out of correctness even if it doesn't matter much for the 64-bit 1T case?
>>>
>>> If so, our only option seems to be to check phys_bits <= 32 and return max CPU
>>> boundary there? Unless you have something enterily different in mind?
>>>
>>>> I would really love to have v7.1.0 with this issue fixed but I am not very
>>>> confident it is going to make it :(
>>>>
>>>> Meanwhile, let me know if you have thoughts on this one:
>>>>
>>>> https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/
>>>>
>>>> I am going to assume that if no comments on the above that I'll keep things as is.
>>>>
>>>> And also, whether I can retain your ack with Bernhard's suggestion here:
>>>>
>>>> https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/
>>>>   
>>>
>>>

[...]

>>>      /*
>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>> +     * to above 1T to AMD vCPUs only.
>>> +     */
>>> +    if (IS_AMD_CPU(&cpu->env)) {
>>> +        /* Bail out if max possible address does not cross HT range */
>>> +        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
>>> +            pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>>
>> I'd replace call with 
>>    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>>
> See below.
> 
>>> +        }
>>> +
>>> +        /*
>>> +         * Advertise the HT region if address space covers the reserved
>>> +         * region or if we relocate.
>>> +         */
>>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
>>> +            cpu->phys_bits >= 40) {
>>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>>> +        }
>>> +    }
>>
>> and then here check that pc_max_used_gpa() fits into phys_bits
>> which should cover AMD case and case where pci64_hole goes beyond 
>> supported address range even without 1TB hole
>>
> 
> When you say 'here' you mean outside IS_AMD_CPU() ?
> 
> If we put outside (and thus generic) where it was ... it will break qtests
> as pc_max_used_gpa() does not handle 32-bit case, as mentioned earlier.
> Hence why it is inside pc_set_amd_above_4g_mem_start(), or in other words
> inside the scope of:
> 
> 	if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START)
> 
> Which means I will for sure have a pci_hole64.
> Making it generic to /outside/ this conditional requires addressing this
> earlier comment I made:
> 
>  our only option seems to be to check phys_bits <= 32 and return max CPU
>  boundary there?
> 

Here's how this patch looks like, after your comments and the above issue
I am talking. The added part is inside pc_max_used_gpa().

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 668e15c8f2a6..2d85c66502d5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -881,6 +881,51 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
     return start;
 }

+static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
+{
+    X86CPU *cpu = X86_CPU(first_cpu);
+
+    if (cpu->phys_bits <= 32) {
+        return (1ULL << cpu->phys_bits) - 1ULL;
+    }
+
+    return pc_pci_hole64_start() + pci_hole64_size;
+}
+
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -895,7 +940,9 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxphysaddr, maxusedaddr;
     hwaddr cxl_base, cxl_resv_end = 0;
+    X86CPU *cpu = X86_CPU(first_cpu);

     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -903,6 +950,40 @@ void pc_memory_init(PCMachineState *pcms,
     linux_boot = (machine->kernel_filename != NULL);

     /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (IS_AMD_CPU(&cpu->env)) {
+        /* Bail out if max possible address does not cross HT range */
+        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
+            x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
+        }
+
+        /*
+         * Advertise the HT region if address space covers the reserved
+         * region or if we relocate.
+         */
+        if (cpu->phys_bits >= 40) {
+            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+        }
+    }
+
+    /*
+     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
+     * So make sure phys-bits is required to be appropriately sized in order
+     * to proceed with the above-4g-region relocation and thus boot.
+     */
+    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
+    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u)",
+                     maxphysaddr, maxusedaddr, cpu->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
+    /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
      */

