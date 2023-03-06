Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A236AD28D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:12:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJyo-0006DL-1A; Mon, 06 Mar 2023 18:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZJyl-0006D8-1u
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:10:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZJyj-0002dY-1J
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:10:50 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326L9tPm026386; Mon, 6 Mar 2023 23:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=lzZLMQBkK8zjuyuIYFQDJswt4pfFunfFPGAXo0QKKA0=;
 b=Lg1+1MWxeDHw+U+2vKNuELIQW9KGvDzOL2AbDSy5OSC7OnZFRfSVGcTEweRCWteGhony
 OwEU3sxdYfDf5FS1mT4cayeaJ738AgTh06lC0TO5Njyft6WSb1CRnpkVLXNO8puoEj8G
 RDTmhCJKWgvEbCBLhZesIBav1wJavjSi8TauIP77M1SK7xkX1C8+u0xYxyE2Ubz7Ush6
 HWFV9RE2CWmk8uvOimGjt3pY5miokmFX/rEWBLkb8g9ZG6/Wy1wxxVAkDHGz16i7GFoA
 /bGIzTC86nQtG5Uvl4LzQn9QJ8CqoSD8S/axSV/BxK9yntDacBAImOTxWiRrfTic3DxV rw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168m7yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 23:10:47 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326LDeSA008748; Mon, 6 Mar 2023 23:10:46 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u2gxqc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 23:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjvhcYam4sLt9YbBsSrufd9Dd440arK/mlu6nZdNondict+dpxw9ByLLikdYnEERAZatE7V3iddASX76hGYH8ZLQqCQhMIYCTjHAN/H79r0aDF3mJ63wfGA74pRg98mtUlHd1dg4h3audKj1xqQn3qmDaw66P1fGaIm/XuWqPZL/kMl4HdtXQ/urAnCjhWCJSsqMDLG+NcqyyEpHtPzmlxlCwAEOhpG/IjmAkax0v3s5kuwEkRHK7qKAjisH1z/4+PrADzv9X9eQ+gSY1XB8gfSu2Q9A+XWo9pbV4WvbPdqytrwDrD1CSrOV/2X1rZQSofygxkljeezA4NhCvmvnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzZLMQBkK8zjuyuIYFQDJswt4pfFunfFPGAXo0QKKA0=;
 b=BckL3HajP1DQyAwOhNDll/Ggk5cazm76i+dtNgkIrKLvqYF69nHS4aqvCuEx9GVsuhM5DC/cWidxBcQyUQpdyHjLJmN/jY//avx4GZBf/4vULSL3Rr17jg4Op6qxtPDUctjb7BpJSXgXn9wGV8/ycX064mBu3tV+PNHtQ7VIfp5RKsgwV/t16PPDBtZBkT8idI/Fm4ehH4pwH/0jCrVQZiauj+AzMlHBhZoULfZQWBoI/3ti5si5U/v/3zM4ay14zODkWoRPcHQ1drWBCkCtuUUnvBvwH2zSUobBiIEtN+wYmP1P77zMSFfv6y9eJ+j21bcpQAvBlllfJO0/SO8VLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzZLMQBkK8zjuyuIYFQDJswt4pfFunfFPGAXo0QKKA0=;
 b=f2d7BqvmcTqQ5ORqGkn/rZK77kcOhpbj5zcMEH/pOPfl7rISqd3t9sntIlDpVPWvpIlhfqM9AEaQxQfImKjFVJHG24Cqq5nUkkHdS31DemVFNTb/H9SXLhAOKB/8YPVQsuckidLsCj3L1g1dmlGKFJgH7uhPti2bUx4ITStlg8g=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB7006.namprd10.prod.outlook.com (2603:10b6:510:285::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 23:10:44 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:10:44 +0000
Message-ID: <cf0c34b1-1e2c-6676-832b-6056ee4d8488@oracle.com>
Date: Mon, 6 Mar 2023 23:10:37 +0000
Subject: Re: [PATCH v3 11/13] vfio/migration: Block migration with vIOMMU
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-12-joao.m.martins@oracle.com>
 <20230306124219.3ad325aa.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306124219.3ad325aa.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH0PR10MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2c9755-872a-4171-4062-08db1e98034b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlTByG6cZ1hKXemu0zaQ8Npsj74dS0YAjokiPZx8PyGeKzGIm/xJzaXmk1/0cWaVU7Wt33d9HARaLivjiJibJlg4y2H8dTJU5VXZrU7wmAPuDh76mGg6oSwCxz/+8cZH6G1kvx9yu57FhmlgOwdiuAvnJH31bON3uWagnK19r9XlCJXMfRUOc/HbVsmu8P0o48eBjsjzEyXU5r785rNsTdLoQwmsFNKagfPebwTiDeF7COjfaWU271uChuwBSI6E9HHiW9t3ZWU/YpbThXYhqWLefmhbfJeL88F4HV0Wu6VCzDde5mKkpId//bCuGOaYms+MzkVk/BPf75em1c5kN/b7ubC70ROBAu1M8ffQLwRMt3uPkaDdW9QWXGaWUTYa11bsy7sZw+gclituoPcBbX0icT5J1lLies1eOwknDtMq5oG07lBAnlL+plMK/WVUqQV3krn/St92JGGQsBsVCXJvcSx+P190Q5pG+9hRlttbEJoSnFQF32vxNXA/8nNlwOMFbfFR1WCi50etPlifKyAJODm4PZ7vG4QAz4n1SkwZoZptyzJ93v0p3JQtzfLFR9cz6p+uE738SG1kjZznTGJv6SuE77a/dOWMHVdkychEFmIHxx7Tne9W5zqoaN9qAL4xEddMmOQXO2tXrl5wgWYxzsy1vOODRKSE1y3DVvNZDUb00Z5QUhvXjyqwf54QluoTEFk0SQ4IFG08yyUfmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199018)(36756003)(83380400001)(53546011)(6666004)(6512007)(6506007)(41300700001)(186003)(26005)(2616005)(6486002)(5660300002)(6916009)(8936002)(66946007)(2906002)(31696002)(86362001)(4326008)(8676002)(66556008)(66476007)(316002)(38100700002)(478600001)(54906003)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBxWUI3KzN2VzF1aHkyYWNxTjNTdXl1b2EyWjJycTFkM01iL3FnUHI2aGgw?=
 =?utf-8?B?OElwYkpTL2FIdDRsbWo5N2pySVg5elZERE40aytkU3dyT1BrMytxc2RZbnJP?=
 =?utf-8?B?S2lkaGN4Z0JKNXhXdE5oVWd0U292SS95WWx5Z1FCRU9tWjBVL3UxT0EzR1lY?=
 =?utf-8?B?emU2aWVYZUJSVXorWVpBYWU0SVNIdGNSV1B5RWdUS2RUcDdJS3piZVRrNVc0?=
 =?utf-8?B?QmdKam5kTDBlR3V6ZlB4RVlnajVVOFgxVmE2SjY4VGZQczJ4bEExeDRyMzlr?=
 =?utf-8?B?YVNuRWxoem5LSlc3S0JxRGtTSHM1RWRWNWx1enpKQXdmWVJkcmRLTlVhNHB6?=
 =?utf-8?B?Ky9uV1VJV0xVcUJLWXZ4cnJmQXBucFNWaHlvNmkyUm1RUStVangrS3VpTGVN?=
 =?utf-8?B?NVJxSjFTWVUwNVJPWkNGRUlvT2kxeDZOQjVMTEdWd245d29lUHdVY25iRDZW?=
 =?utf-8?B?d0hZb0tvbEFKRytFekJ1NXFmWmxDL2ZVNzBoNlFsVTJjUnhXWE9KVWtkbDNi?=
 =?utf-8?B?cGhTc29VOEhzSU40dkVKRzdTZGI4VHZqaDR1RkdnVituaTFERngvT0xLTHlN?=
 =?utf-8?B?K25vL0RJVmJjZUNoQU1wZnJRaFVNV00vcy9VSW1mUUljbWR1SDl3NDk1eGhQ?=
 =?utf-8?B?ZHo3UHp2ZE94R3U5VVRIZm5wemh0aldsWVFkcWtNWFhGQmNKUmlwYlBtYWVl?=
 =?utf-8?B?dTZSaHFrQkRmZERDY29JZEg4c2RvZ3hUYzlBRWtBS3ppaEsyVlRqclVhbUdX?=
 =?utf-8?B?SytVWWVpa2RNcFk4WFhYMmhDc1drRDNmaTl2RExTY1J0eHZKQnRzS1FXRmQr?=
 =?utf-8?B?TVN3SUdCMktMNm05T1l1M1Z1RGRTa1YyRCs3RUdrWlFwV3NqR3ZBSHh6aWly?=
 =?utf-8?B?ZlhYRGZiTGovVGRFalN2MjJpeEl6MUNqbzNPQ01SZVBJbVIzYkcrUE9DZERl?=
 =?utf-8?B?MEk0bnlpM1d4engwelExUG9VTkQ0dDZIVzlYcnE3N3ZXRzBHUGxVeWtOR3Jx?=
 =?utf-8?B?Y25hVWJ4emRuN0R4Vk9XNHBnNkliazZUSk1mV0dqaFhPdkVmWTY2TEtNbVh1?=
 =?utf-8?B?bWxqUTljUjBtKzZ0amtsMUdXZTNxaktiNW9Xdm0zNHNWRzJhMEdPNloxcmFn?=
 =?utf-8?B?aXlvVk5HOFUyUFVDdjBEcFlYcjQzTzNzdStiVGNsdHRVOGdVcWIvSCsvSjhT?=
 =?utf-8?B?MW9udUFrTEpLQmd4QXdabFFjTnFtU2FVeWU5c3VHNVllb0w4M3U4d1BQVEFD?=
 =?utf-8?B?Zjduc1VWaDYwZ1RyRkQycUJVUTVkRW9OMU5JeDZ1NEpKckF5cDY2cG9LVmdE?=
 =?utf-8?B?QVRXYVJMNmRmNEx2Sm5tcDRrMzROa2Zhd3lZVll4U3ZFK3Rwb0x0SmszR2ph?=
 =?utf-8?B?SjdQY1ZWM0pKb2RVZG9rYThIT3pjVll0ZmFrMjB3WTc2UVo0cExoTm5EUXo2?=
 =?utf-8?B?OCtQQVpYS1hQMWthZnZuYzU4YzdyQ0tGNGJZaC8vajVzY0FRMjZzTlA4eGtO?=
 =?utf-8?B?aU83c09VTEhPWitWckRXQjZJQkpsS3pkNHAxZk5mUXpoNUp4aVJ1ZnFxMTNn?=
 =?utf-8?B?YnVEbHNxS3oyNjhDMnJjSEpXdlg5L0JuemdLSFAzVElndmp3U21GSWoxNktz?=
 =?utf-8?B?VzhXSElvcUZNZHhkT0l3bFBYYUJWeXZ4dnVtQXRjSG80U1p2LzdzQmZFWjJR?=
 =?utf-8?B?QTJ6Yis1eTBBdHlJeng3RlNsQnltOGd4eTltVlFQRXdMbFU4YzdRSGJMUUxG?=
 =?utf-8?B?aFdFZmEyNUM0VVpweTViZFpBV3BiNjkvOHJ1dFdmSXF1QVVGQkxPRDZDYmpX?=
 =?utf-8?B?VTlrZFI5T1hlRHlncUNVTWQ1azFaV215ZUVNMmRpYWFzbmNnZ2k5dnl2SCtj?=
 =?utf-8?B?WWsvWlRTWjgrU3FRbFFEU1FUWU1vZ2Zodk1ERkQrMFVaZHJEWGZyTnRWbFdp?=
 =?utf-8?B?QzMyYkVTUnF5bm1qc1A3MS80OXJ1bTUydEdQcUtkNnY2a0Rub1lGbm44M25v?=
 =?utf-8?B?Skx1Z1RqT0F3UjZteFF5V0srazFVbFh3RHM3V0RJT09FakFwQm1SNHhpSUpi?=
 =?utf-8?B?bjBjNU1DeUJMcWJZa0dXUUZJSmpYR3VGYllBWkNZS2lob01tdEJzeFZQS0NQ?=
 =?utf-8?B?VGt4Zm8vSzhNOUYwMW9aSzhJdStBQ0h1a0hLVGV2RzB2dG4xeDRoMHN0N3RR?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TRDcFz0NZjWUVq94hiVD8OQT0QU91dho5RljQf4mTBdx8bdfePUYwjFW55bIhxeaHV5FmGmC/RFKujD1YH9V7aIV0LoBduoOzEKfkxCMmH0itTqPYQ3dpYWjZ3uQl5pcy4VQ2yVxXbx3qaxPJkQRJ1euT7/Yqg908qtRCxplVUy9NjKPLMppRQ1J0FfTa2qIS5DGMLdIixwV3YgBH6dH3e805kKa/W01S32V0EgzzknAmCs6JYOA5RiH7FlwvWwkpmPrffMfjM7sFto3n9eUmLznmRNs59qK3RNPgipffDFdKmTtZn0UwZzJi8awygGsPIS9Mqm4TzO9rmRC8eI8DoLV9WfxIUyrCzZwWrixffhhpI3CZCTzKyGQkdnS+fEkjwPDAoIWm9kQX75hxyCPrCRqXAJhkEiY350An0EErGoXE3bfn+5uk3WLYBPKXfKbJh3PNFvd2M7wfAtBJoK4hNDdSy+4M/nZaVvDZgVSi+2WisFOpF4rLLYgF90CWl+gVgByeVbJId6WXaYVl2MybyJDk+ysk0wWf8p3x0+17wha3FdX75ZjbiRHabRol9vD+KXLuDXbtUn8MyaFfF4gyRyWUA7VRuAs1qISkDES2zsTUEAa7Xzc7sayKB1ZeRKuZm5I9oTJjiYU2w7SB9BQgfdVVCAAxDe/lLKd5T7HZzOyPx1MFZ+hriDlOhUDOPQ7UmZhQ+0pIAors6TKf8WNnqW6Qk+AC9ndhmBLWdYfZ0gBflLUl9Q7t1Gok9h8Jbe0O1b+jOfX03oGiNrWq9L5nLDV0TBgMnRZPzmk42B2weS3HqJXe8sJA0nt8/YzGWcG
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2c9755-872a-4171-4062-08db1e98034b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:10:44.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU8TMLkhgl/O/Qje+6q7iZkdS+J6jj8H8i9dUAlpY7MQ3ZQEvuOnXkNmDMeEZ6QtlyfAMvi2ji5rTVEhF9BlcAe64r2XZjob6aAnKpjZXmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7006
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060201
X-Proofpoint-GUID: LQRkM9cvlYBZG15-AvIAFaFjoVY8aTUe
X-Proofpoint-ORIG-GUID: LQRkM9cvlYBZG15-AvIAFaFjoVY8aTUe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 06/03/2023 19:42, Alex Williamson wrote:
> On Sat,  4 Mar 2023 01:43:41 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Migrating with vIOMMU will require either tracking maximum
>> IOMMU supported address space (e.g. 39/48 address width on Intel)
>> or range-track current mappings and dirty track the new ones
>> post starting dirty tracking. This will be done as a separate
>> series, so add a live migration blocker until that is fixed.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>>  hw/vfio/migration.c           |  6 +++++
>>  include/hw/vfio/vfio-common.h |  2 ++
>>  3 files changed, 59 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 5b8456975e97..9b909f856722 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -365,6 +365,7 @@ bool vfio_mig_active(void)
>>  }
>>  
>>  static Error *multiple_devices_migration_blocker;
>> +static Error *giommu_migration_blocker;
>>  
>>  static unsigned int vfio_migratable_device_num(void)
>>  {
>> @@ -416,6 +417,56 @@ void vfio_unblock_multiple_devices_migration(void)
>>      multiple_devices_migration_blocker = NULL;
>>  }
>>  
>> +static unsigned int vfio_use_iommu_device_num(void)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +    unsigned int device_num = 0;
>> +
>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->group->container->space->as !=
>> +                                    &address_space_memory) {
>> +                device_num++;
>> +            }
>> +        }
>> +    }
>> +
>> +    return device_num;
>> +}
> 
> I'm not sure why we're counting devices since nobody uses that data,

My idea was to track in case some device is configured with bypass_iommu
PCI device option. But that would always be catched with same check below.

> but couldn't this be even more simple and efficient by walking the
> vfio_address_spaces list?
> 
Yes, or iterating groups too as Cedric suggested.

We don't care about number of devices per se, just whether *any* device is using
vIOMMU or not.

> static bool vfio_viommu_preset(void)
> {
>     VFIOAddressSpace *space;
> 
>     QLIST_FOREACH(space, &vfio_address_spaces, list) {
>         if (space->as != &address_space_memory) {
>             return true;
>         }
>     }
> 
>     return false;
> }
> 

Let me switch to the above.

>> +
>> +int vfio_block_giommu_migration(Error **errp)
>> +{
>> +    int ret;
>> +
>> +    if (giommu_migration_blocker ||
>> +        !vfio_use_iommu_device_num()) {
>> +        return 0;
>> +    }
>> +
>> +    error_setg(&giommu_migration_blocker,
>> +               "Migration is currently not supported with vIOMMU enabled");
>> +    ret = migrate_add_blocker(giommu_migration_blocker, errp);
>> +    if (ret < 0) {
>> +        error_free(giommu_migration_blocker);
>> +        giommu_migration_blocker = NULL;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void vfio_unblock_giommu_migration(void)
>> +{
>> +    if (!giommu_migration_blocker ||
>> +        vfio_use_iommu_device_num()) {
>> +        return;
>> +    }
>> +
>> +    migrate_del_blocker(giommu_migration_blocker);
>> +    error_free(giommu_migration_blocker);
>> +    giommu_migration_blocker = NULL;
>> +}
>> +
>>  static void vfio_set_migration_error(int err)
>>  {
>>      MigrationState *ms = migrate_get_current();
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index a2c3d9bade7f..3e75868ae7a9 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>>          return ret;
>>      }
>>  
>> +    ret = vfio_block_giommu_migration(errp);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>      trace_vfio_migration_probe(vbasedev->name);
>>      return 0;
>>  
>> @@ -659,6 +664,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>>          unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>>          vfio_migration_exit(vbasedev);
>>          vfio_unblock_multiple_devices_migration();
>> +        vfio_unblock_giommu_migration();
> 
> Hmm, this actually gets called from vfio_exitfn(), doesn't all the
> group, device, address space unlinking happen in
> vfio_instance_finalize()?  Has this actually been tested to remove the
> blocker?  And why is this a _finalize() function when it's called from
> an exit callback?  Thanks,
> 

I didn't test it correctly, clearly.

It doesn't work correctly as vfio_viommu_preset() always returns true and thus
it won't unblock, even after device deletion. I've moved
vfio_unblock_giommu_migration() into vfio_instance_finalize() like:

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a9e..30a271eab38c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3185,6 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
      */
     vfio_put_device(vdev);
     vfio_put_group(group);
+    vfio_unblock_giommu_migration();
 }

