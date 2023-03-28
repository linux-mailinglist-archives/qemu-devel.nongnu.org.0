Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6156CC82E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:38:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCL7-00027U-NQ; Tue, 28 Mar 2023 12:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phCL6-000270-6m; Tue, 28 Mar 2023 12:38:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phCL3-0003vE-2c; Tue, 28 Mar 2023 12:38:27 -0400
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SGZ8rI029808; Tue, 28 Mar 2023 16:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=C+4wY4iPcEOsIk5YP9O+8jXSTY8D5ZsxlsNHC7hnd+U=;
 b=0HZQB3NP6B7mmKEPJOPUyQHnf+zsFBRyfWkal2l1WXPnSc9i4Kb+LpS/IiubmPkiUOaB
 mt7UNbIpvRljgWpce1hOG9HNcO5n5xj5BkbyM/2LFb7FdqKpus62qDv51QnkYmObpMSX
 gsetOFesCBlBchIZ2Up456q79HyoAC6Y0E8BO+92LlpeDWkM2is1GDvPnMvZawpR8VM3
 Fn8Ol+DQGpqGfAKxzWCSmILJ4NwlyjKHEqbApiCSJp/7oilSsUXhvidpoSLfZQVhqqXM
 IeTqaNu7zQkA/Dld0AUDX1XXX9xmjCbbCHkevMbgF5AOHk7v+kwFcPUl31TblkxHkHOU vg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm3vnr0cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 16:38:16 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32SFRU0g027391; Tue, 28 Mar 2023 16:38:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqdd6hgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 16:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB2xfRScK+FIZ8jMNZVaz01kjo6dId/kU1xQe0BSOcvoK7Mi+UxB9SiSPULBCL1MAHTN334+2ihKLelaEH7sNz2kx3y8pBhylSPBtGCEZDRTlqxGvT0H5tfTuZweBCxqW/ng2S6ufAKJHOm+oPYxe0WffeaTq2glEHf7WE8sWNmjGdrTRJSEJDC6JzsXTAFDEVJ1pWgrwHu7Uiul14KdX7+wu8zn7TvLucHT2+vviaHRgMAneMJhzD25leqITa22WhPcH2cSMOhAda2JaP7y+m8LU+PRml+1m43kxRy6+rwe2qAsDhaJ36dzfMI1jN+6o8HJf14IW4Q3DewypoIDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+4wY4iPcEOsIk5YP9O+8jXSTY8D5ZsxlsNHC7hnd+U=;
 b=n0w4V+iDK3wHcJ2LRUg0hlwJpPVi1NaYc8twxkfDdky8rTbBzk/AezbHzo33DCfoYxHF+ktN6TLdZWvKZcrwejNIg6KuxEbeQoGxa46pjamWtU5LT5YHFVV3MZ0gZI2PCp+vLAnyfojDkwSk3S7cCtBNk/DrkYN3+0QJFMg4bJAU1JSpcq/T5AlvmwP4CtzdFZnOYtH673/ALpd66cayhv43TyhUwOoucpGbPBQbpi/FEISsT69P8PmEcJd/VRxa/E887aNXhMBPK8708jRn6QUDasqd61ItAhQHruh0bWqKh0vCS5ouAJ4PfpNjSDeSksXZkzMJOrZ95+YiS0WaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+4wY4iPcEOsIk5YP9O+8jXSTY8D5ZsxlsNHC7hnd+U=;
 b=N5ZRd8GhrZm0gWNp5X1wFmeSCRS3Mo56BZjg2OGtnviC5sUt8/q1irEMk57NeF+axOX0sK09cSESUiceivAbH1Orpu56wA5HXK27YmpNA8+qPp+u3BhN2hzjCwVa0XU5h0zW5/s5l+LwxZEIodoMftBfbxflenv4FIgrh57oEnI=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB5327.namprd10.prod.outlook.com (2603:10b6:5:3b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:37:58 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 16:37:58 +0000
Message-ID: <7d6ce104-a632-3647-02e3-2a227494a0dd@oracle.com>
Date: Tue, 28 Mar 2023 11:37:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Content-Language: en-US
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com
References: <20230328155926.2277-1-eric.devolder@oracle.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230328155926.2277-1-eric.devolder@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0526.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 584cd3dd-7043-45f0-ef4f-08db2faac9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGSwNv/n4CL+nXqvQxk3ZA/c7s6VyuO6TfzJOp8iIFPh5dSTI/KwPywGAmAb69o2o+XEdZ9t5wXRoN/Z+UN7F9qprD18XZK1+LuBm6MKfPxy8NYeEhB2e4mHsmFtwHOUcx8oAkVER/9bXlkDRa667XUVeY7JM+Nx4+udSBAdN/zxaLXV+YKnE2fVBc4W4SSQEYzKnUCW+2WCmYx6kUciJ9yGtghC3EzEm1EUA5wYq35gKhxcJdbhFSx0Hby7yziTOlsN2EKBTe2h3gagBGs3XwTiJ3Q+gUCQVba8D9v+/LBJQToreBze152B9SGxZAMbm/mBxVyE7LqaUvOAinkCCDmdEIB/Wsf+YbzYu0rCP3v+zXXW7m5cfFL/LKXKlOfr5PM02x5RDi7ApE/TUrVBJ2CFvdxq/6GkKSA8IKtB4c3LMW/2r7W3JDVrjyNfXqEu7CUc+Q0fMPo/H2C3jUVo5OfxSYFKSDTqEqLipPJEw1RySjmguwwrgzfgIKTvvf4OY7dnKwIjOJ4Qd+pitSn9ziAyN8ShMMRmsos8SFQZ+wAmW6OnqdZp64cxaN7iqGhJywcOhR3y8HfKXKoiMaULmxpw7XeKu+4BTNNSSXZH8sTotwnk9GmWVcHshXg/PJC7wuxOL47Aygcrwi+XpjMWlJLV9f5LZ2112ppWd5soDsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(36756003)(2616005)(186003)(83380400001)(6512007)(53546011)(6506007)(6486002)(86362001)(478600001)(31686004)(316002)(66476007)(66946007)(66556008)(8676002)(31696002)(41300700001)(5660300002)(8936002)(4326008)(921005)(2906002)(7416002)(6666004)(107886003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZxbzdxR051U1YwVGgwNjlkVUkyWk1sTjFtZ3hEOFdVejdhT2NDamd2T3gv?=
 =?utf-8?B?QXppdk5lemNZNG5XdlpEM0NsdlFuRWtpTWVIV0x5RjVQY3FIdTdaU2tyMHRp?=
 =?utf-8?B?UlVDNHFXbHhUMEo2MXFjNWxxYnM2b01kb3dXVXh1L3RjRVJ5TUlOU0gzdmVo?=
 =?utf-8?B?MmkvamZUN2ZlbE51OTVreElrbVhZcnJDTkpmSnA0TU5KdXBoM09IQ2dCZENz?=
 =?utf-8?B?bHFsZlg3V3QyM1M0bFFsU2FBZnF4QnhBL2tPYlVJYTNBSW5odWpySWpORzRG?=
 =?utf-8?B?aEt0eFl6YUJnd2ZHTXI2QlpPVlJyMVJ1a2pVVHZhVkhtd0VLa3JheldmNWtw?=
 =?utf-8?B?VEExNnE5TEtKaGxuL0pXVEVHVEpxd2Y4TUw3NTZhNk9MaUFocHEzRERvOWNr?=
 =?utf-8?B?cUp6eEhsVUd6S0lZTS82VXh6T2xUVklPbXRFSTVGZmdQYzRxZk1tTTEyMUdr?=
 =?utf-8?B?cko3U0xuUU92UDhuVHcwZmVZcytsUnFERW1TTjdNZHNHZDRweHBIQjZUYmRK?=
 =?utf-8?B?dlVoVE1zbUY0K2lqQlVvSGVkU0RpSUVOVVRQWU5qY2htM3Y2TFljVWszUDRU?=
 =?utf-8?B?SHBqRTRGRkJZNG1ESC9nMHdUU05DWlRlT0ZRWllwcjArdGZOM1lMdzBydHhz?=
 =?utf-8?B?U1R6dXYvamdyU1hNR3p3Zll1eFRwc1Y1dUx3R05SK0lwNHI4eWY2L20vSFZk?=
 =?utf-8?B?VG5PR285bzVyZ0FMYnVWalpkdmxsSjhua1AzRENSdmRHWUtHV1lERDRPZkor?=
 =?utf-8?B?QXVKbmNDbUFuRkM2d2g1UzBtRVlRY0ZpaUxBM3VPMlBadHhyeENLYjIzWjFZ?=
 =?utf-8?B?NlRmanV3UGFtQzVJdktFNHFWVXRicHVhMDF0T25wTGVLVmZ3dnNOZ0xxS0F4?=
 =?utf-8?B?SG4wRkltUi9TSjdDT2tHdTVnWCtpOW92U1FQdWVoT3J3NjNGUEVTKy9zaWFo?=
 =?utf-8?B?QWlVc2NJTzUvVU5wYUJkZGoyZ3VMRXhJQ2RnM0Nmb0JROTMwak85OWovMzhl?=
 =?utf-8?B?cEFDN0Q1UXI3TDdIYjdTeTNqdDVkYllWTDN6VnlvandkOFlxN1dKMGFSYjNH?=
 =?utf-8?B?MU9naDhxVE9EcnJ3RTRwd0pZM0hyL04xU3pvak1IQnNBNjNQZzFFNlVWaEpJ?=
 =?utf-8?B?U09wbEhsVVh5V2daaFYxbFNFYThLTXVrcjhYR0theEdFdGZMSG15TlZWVWdT?=
 =?utf-8?B?bHpxSEFCSEkxaFZmRU4rMllJcWFQL0p1aW81MkVQNDZTQ2VWdThkUEJ3UU5S?=
 =?utf-8?B?TC9DalJjZERsQmdLVG1CREtPdHdrOEp4Q08rd2cwVW54S0VJR1BmejIxRzhD?=
 =?utf-8?B?SklpTEF4bE9yR2RhRlpZQmJRZXltTWZtWUVOdkFmRHZPRk5BRE1oRENBL2Ny?=
 =?utf-8?B?bk9jWjhsMHVwcXBqSGJFTWVSRmNTK3dZNDlaa0RteUJ6RmhLNnhnRmZGU2NR?=
 =?utf-8?B?bzVGNVRMVmpQNUorak9HZnVKVUlsMFRyaEdWTW5KSUJxRE9lZGkrTEo4Y1l0?=
 =?utf-8?B?dFZkc2lWMW9rN3FaQjA5UVZPUWpjUUZPUmtVRE15d0ZNWlRmVzFmUy85UnU0?=
 =?utf-8?B?RkZyTkFnTnhvaXlXSjNsNlloOUtYWndSY1NWRXpvQzdvYjJTL09Wbm53NXY0?=
 =?utf-8?B?NXlHVGhzbFYvQTFraUZKZG9kWnlNUi9RV1J3Q21naTFvYm5jUGdxTGU4Mk9n?=
 =?utf-8?B?VmYvckpkSTJzZk4wbGdjVldrK1h6dlc2MDFuNUQ5N3pVU3FNUmN6eTBNcHRq?=
 =?utf-8?B?SFhQemlZWWRncmNBU3B4SktPeWFWWmozOVZSWWhnWXpseVpSSHZjd09zZHdR?=
 =?utf-8?B?ZWcrdXpFcEhnVDFxeC9JYUQzbko1eTErSVFBa0V6R2lRSWp3NFFyejgrTjI4?=
 =?utf-8?B?a0ZCQjlhdWJwZ05tTyszVXJOeWlxU0FUSnd1SEJpMW1BOUd1aWF2cWRZNHNr?=
 =?utf-8?B?TGhnMTNLSVNBWjM2N1p0TEtHT0N0dnpBbmxPbGZlcVJLSjVqRllVQndBZklH?=
 =?utf-8?B?WHFHUjl4RndtbUhLWVl1UVJKVXN2RVNKQnVGeDl4TkNjZ3oyY3dTMWhTb0lm?=
 =?utf-8?B?ZUNhRURCaFdNY2s3QTErYS9VbnVkZndCWTRvZXJoaU9YTU9wMWhBdjlCa0Zi?=
 =?utf-8?B?WDZ2bXBhSGhGMzJUUFBDVDZCUFl0eXJRSFlLZjhqSTR6djV6RWVuOUlVcElt?=
 =?utf-8?Q?jQovtMzzv8Yb6Dq3sL5cXZg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JGlFaHRUNDTByjyYYoHOS6yiACgKInYQz/iQYZWqeNPJ6mEfTfMslSn2O21SJQUIe23jdEU1BoRcEJnvlBeIu06edD89mbobZejeRvU/LKfM2SpWft/VxSglDITBxIzjuB8WEFoA3kisjh5c9gy6wSDTaZrhRnQJTsNzvzLTK5ZukYSRz1oMaGtTgfevKAhwCZQpwZ0AcGci3hKOe7utANx0jQp6u12RwIUD/xAVYlRLC4xA2UVDnuzZVY5qyc84KHu+VmW5mN+HounSPG8Kd4a/WXOhrILC76H/sS01St2j/ToLUQaltBwbLlZ1KH+2iRbYTeWEuMg1a5xy1LIBpiGuLC8J4I7mTrm8xWcmSwA01qp/VfntoUctvbJ9GP/1CQcUQ1UKvgEGZ1cCW4Y6GIPkpAdfItr3DLUjughkhzVwUWgwtbE2ljbAkm/vMGzwK5oKIwTU/j55UP2F8NJXVPPdH3AWmmp8lMTcwHas1Q/29R6ktnC29b1ZFamRF72qV+abxWbDwioc/s0NH4ApXD67S9AYXcBWmg481iSDdFiHjtkjaRz0APNVx+IXNg5PYn8z84P7tvxNx+TqZb3KzAn4IBMr5akjghnx3CTjcJHWutvfitQkNO1tJDYCv+Cnf80RDOaqBR4Qc6VULGLR56V9DGoEVIupWpyZtF2ChroiFn0pAGGY3lQ83gSUS0JN/NG62mr6mgrwbSLYgACs/LrqMK9urDyYl1ag0B6z5/qQedNZ1dbWxIEFAjdMDAsQcU43g2C4nicWEZ/iGOorY51oXrAxYJL3/IXbAlx+MvOtP9j3nO6Jc2Gans0Dp6QKRYjhUhKQnGKPrFkbYH5usbRG9ieltsceqsQu1mJKN4oyrhNBBtdfPDYWUC8tZTbuRc7zkHmIDt/GsJwjUReHxg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584cd3dd-7043-45f0-ef4f-08db2faac9c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:37:58.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF32VD7LoZX8SDmCE/EFcY+QBk8oySzUoDliqh4cWczr/TEklm6GnbrhgyQyYHu642UGit4EtscGUSrTN+qYx64wWjyKvI6DRd+gsny4V/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5327
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280131
X-Proofpoint-GUID: MNavjwT0HRhuDS0VtCfX6BC35lrivXc8
X-Proofpoint-ORIG-GUID: MNavjwT0HRhuDS0VtCfX6BC35lrivXc8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I forgot to include the updated ACPI tables. I will do that as part of v2.
In the meantime, I appreciate any feedback...
eric

On 3/28/23 10:59, Eric DeVolder wrote:
> The following Linux kernel change broke CPU hotplug for MADT revision
> less than 5.
> 
>   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> 
> As part of the investigation into resolving this breakage, I learned
> that i386 QEMU reports revision 1, while technically it is at revision 3.
> (Arm QEMU reports revision 4, and that is valid/correct.)
> 
> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
> 
> So in order to bump MADT to the current revision of 5, need to
> validate that all MADT table changes between 1 and 5 are present
> in QEMU.
> 
> Below is a table summarizing the changes to the MADT. This information
> gleamed from the ACPI specs on uefi.org.
> 
> ACPI    MADT    What
> Version Version
> 1.0             MADT not present
> 2.0     1       Section 5.2.10.4
> 3.0     2       Section 5.2.11.4
>                   5.2.11.13 Local SAPIC Structure added two new fields:
>                    ACPI Processor UID Value
>                    ACPI Processor UID String
>                   5.2.10.14 Platform Interrupt Sources Structure:
>                    Reserved changed to Platform Interrupt Sources Flags
> 3.0b    2       Section 5.2.11.4
>                   Added a section describing guidelines for the ordering of
>                   processors in the MADT to support proper boot processor
>                   and multi-threaded logical processor operation.
> 4.0     3       Section 5.2.12
>                   Adds Processor Local x2APIC structure type 9
>                   Adds Local x2APIC NMI structure type 0xA
> 5.0     3       Section 5.2.12
> 6.0     3       Section 5.2.12
> 6.0a    4       Section 5.2.12
>                   Adds ARM GIC structure types 0xB-0xF
> 6.2a    45      Section 5.2.12   <--- yep it says version 45!
> 6.2b    5       Section 5.2.12
>                   GIC ITS last Reserved offset changed to 16 from 20 (typo)
> 6.3     5       Section 5.2.12
>                   Adds Local APIC Flags Online Capable!
>                   Adds GICC SPE Overflow Interrupt field
> 6.4     5       Section 5.2.12
>                   Adds Multiprocessor Wakeup Structure type 0x10
>                   (change notes says structure previously misplaced?)
> 6.5     5       Section 5.2.12
> 
> For the MADT revision change 1 -> 2, the spec has a change to the
> SAPIC structure. In general, QEMU does not generate/support SAPIC.
> So the QEMU i386 MADT revision can safely be moved to 2.
> 
> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
> structures. QEMU has long supported x2apic ACPI structures. A simple
> search of x2apic within QEMU source and hw/i386/acpi-common.c
> specifically reveals this. So the QEMU i386 MADT revision can safely
> be moved to 3.
> 
> For the MADT revision change 3 -> 4, the spec adds support for the ARM
> GIC structures. QEMU ARM does in fact generate and report revision 4.
> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
> revision can safely be moved to 4 as well.
> 
> Now for the MADT revision change 4 -> 5, the spec adds the Online
> Capable flag to the Local APIC structure, and the ARM GICC SPE
> Overflow Interrupt field.
> 
> For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
> byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
> Overflow is not supported, it should be zero.
> 
> For the i386 Local APIC flag Online Capable, the spec has certain rules
> about this value. And in particuar setting this value now explicitly
> indicates a hotpluggable CPU.
> 
> So this patch makes the needed changes to move both ARM and i386 MADT
> to revision 5. These are not complicated, thankfully.
> 
> Without these changes, the information below shows "how" CPU hotplug
> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
> guest started with:
> 
>   qemu-system-x86_64 -smp 30,maxcpus=32 ...
> 
> and then attempting to hotplug a CPU:
> 
>    (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
> 
> fails with the following:
> 
>    APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>    ACPI: Unable to map lapic to logical cpu number
>    acpi LNXCPU:1e: Enumeration failure
> 
>    # dmesg | grep smpboot
>    smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>    smpboot: Max logical packages: 1
>    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> 
>    # iasl -d /sys/firmware/tables/acpi/APIC
>    [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>    [004h 0004   4]                 Table Length : 00000170
>    [008h 0008   1]                     Revision : 01          <=====
>    [009h 0009   1]                     Checksum : 9C
>    [00Ah 0010   6]                       Oem ID : "BOCHS "
>    [010h 0016   8]                 Oem Table ID : "BXPC    "
>    [018h 0024   4]                 Oem Revision : 00000001
>    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>    [020h 0032   4]        Asl Compiler Revision : 00000001
> 
>    ...
> 
>    [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>    [115h 0277   1]                       Length : 08
>    [116h 0278   1]                 Processor ID : 1D
>    [117h 0279   1]                Local Apic ID : 1D
>    [118h 0280   4]        Flags (decoded below) : 00000001
>                               Processor Enabled : 1          <=====
> 
>    [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>    [11Dh 0285   1]                       Length : 08
>    [11Eh 0286   1]                 Processor ID : 1E
>    [11Fh 0287   1]                Local Apic ID : 1E
>    [120h 0288   4]        Flags (decoded below) : 00000000
>                               Processor Enabled : 0          <=====
> 
>    [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>    [125h 0293   1]                       Length : 08
>    [126h 0294   1]                 Processor ID : 1F
>    [127h 0295   1]                Local Apic ID : 1F
>    [128h 0296   4]        Flags (decoded below) : 00000000
>                               Processor Enabled : 0          <=====
> 
> The (latest upstream) Linux kernel sees 30 Enabled processors, and
> does not consider processors 31 and 32 to be hotpluggable.
> 
> With this patch series applied, by bumping MADT to revision 5, the
> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
> hotpluggable CPUS.
> 
>    CPU30 has been hot-added
>    smpboot: Booting Node 0 Processor 30 APIC 0x1e
>    Will online and init hotplugged CPU: 30
> 
>    # dmesg | grep smpboot
>    smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>    smpboot: Max logical packages: 2
>    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> 
>    # iasl -d /sys/firmware/tables/acpi/APIC
>    [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>    [004h 0004 004h]                Table Length : 00000170
>    [008h 0008 001h]                    Revision : 05          <=====
>    [009h 0009 001h]                    Checksum : 94
>    [00Ah 0010 006h]                      Oem ID : "BOCHS "
>    [010h 0016 008h]                Oem Table ID : "BXPC    "
>    [018h 0024 004h]                Oem Revision : 00000001
>    [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>    [020h 0032 004h]       Asl Compiler Revision : 00000001
> 
>    ...
> 
>    [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>    [115h 0277 001h]                      Length : 08
>    [116h 0278 001h]                Processor ID : 1D
>    [117h 0279 001h]               Local Apic ID : 1D
>    [118h 0280 004h]       Flags (decoded below) : 00000001
>                               Processor Enabled : 1          <=====
>                          Runtime Online Capable : 0          <=====
> 
>    [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>    [11Dh 0285 001h]                      Length : 08
>    [11Eh 0286 001h]                Processor ID : 1E
>    [11Fh 0287 001h]               Local Apic ID : 1E
>    [120h 0288 004h]       Flags (decoded below) : 00000002
>                               Processor Enabled : 0          <=====
>                          Runtime Online Capable : 1          <=====
> 
>    [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>    [125h 0293 001h]                      Length : 08
>    [126h 0294 001h]                Processor ID : 1F
>    [127h 0295 001h]               Local Apic ID : 1F
>    [128h 0296 004h]       Flags (decoded below) : 00000002
>                               Processor Enabled : 0          <=====
>                          Runtime Online Capable : 1          <=====
> 
> Regards,
> Eric
> 
> 
> Eric DeVolder (2):
>    hw/acpi: arm: bump MADT to revision 5
>    hw/acpi: i386: bump MADT to revision 5
> 
>   hw/arm/virt-acpi-build.c |  6 ++++--
>   hw/i386/acpi-common.c    | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 5 deletions(-)
> 

