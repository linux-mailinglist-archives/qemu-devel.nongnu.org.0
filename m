Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197456ADB98
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:17:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUN1-0000sk-O7; Tue, 07 Mar 2023 05:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUMt-0000ry-VB
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:16:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUMr-0002OX-Q9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:16:27 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783mrs003734; Tue, 7 Mar 2023 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=9ScZllFV4wwQQqsu/ja2L+c0unqRnGqojH/PqLdRcbQ=;
 b=ZRGzKx1N1WZ5krd0dCi2YvdBa7W0Tfr+kTQX1dCGWZ60OuGUN7olI3giMcdu1rSS0jsB
 RHzrxLo+xexlT+N/h9frLT1tSfyZs/7Ld/yDbmBdbttpi5GKzwNAP0xUwA7t+SY8jGjb
 LhCjeMywIKopsDUuEHMdRPH3PXI/Ujb1Jx9Y0S45tuPkYPl1cOCX3stXpQ69ClpAnEMR
 U0GdjdX5dawX1rrujVL/8R6bVggsqFCSVcuDSOwBOOuxe+g+5+0CH76TEpjo18ewM8al
 wi96bIVZtu85GW6VcQMMkVfs4cgA7Kj5t3Yj8VYmBe10QKCPD/YTvC392tKvGu13cd2c cA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168n5f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:16:24 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32797Ujn025835; Tue, 7 Mar 2023 10:16:23 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4ttjshfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERWS6ad4tj0K3wxcQmCzNFSYJo76TD+hg2tMIX9XvsnCe4MTa9Td32ycUDsFF2c0KWZTp/dyo5lLgN91UzRZ2e6GWr4yfcBD2vNuu0xRDDlaV8gvvlSscOn9FQ7X9Rl7tm1ie4aFvB6CLcMnEqw+EJOG9J2VumYo1PH0PwbonFteeYxIizsQZCz1x23daKlGWGPQMM06qCDFqqp2OVsfLFrHli6Be3u8WgAIYmFzk0tUCcMMoFU7vUxq4m1RKcId+8nqc8dReANDsC6M+zq3GwgkzzGHu/AhZgRO8JQeHCf7ebaSxmGIMjNszAlhDOcD9OvoJQAhG/XNIvSQN6h9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ScZllFV4wwQQqsu/ja2L+c0unqRnGqojH/PqLdRcbQ=;
 b=d6zzVIaba5MnUISQ6KWSRViyokz62hCMFwpvyzUOdsG08row2MCv0s80yN8tucYhwTbPLe5HQLmrL+mCPMi0/4pBPAd1iHMvmIOH3sGv5/G/uH8fCHmYewe3rQYHk5nzopYZaGctN453AAHLVSV8dVxf+p2ivMjDT44juJ2KXTkv+67Isgo7HYhPi7pe57K79UkA716x9iovmKbt7TLv0yT7/NVU986VOwIfV92Y4YsGcWQNoTrwddreXbDWIZALEtHv0wDwv8Dzb3wl9z4obnyzVjrg9FTDh+wtWiZQCeYj6+yD72bUEHkkkKWM1B5n7pd7m65VwkUOeHNi2cNVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ScZllFV4wwQQqsu/ja2L+c0unqRnGqojH/PqLdRcbQ=;
 b=uTr762HmLSxYDHsK6FUWU1sv6lBvaPAEnfW3xf2xf+WfJ7h7NzEwOrTFX4RR80MdsdQpHlbGdQFUv8Ic8CX8xd23BR/6scJNe52sdedAO/BwQZZhfx+b3oh5nTe2FljbZi3NOdATs63hsqUtKay65P8jUx71sFMACersXzGx5FU=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DS0PR10MB7067.namprd10.prod.outlook.com (2603:10b6:8:145::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:16:21 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:16:20 +0000
Message-ID: <83aaa9ab-2851-5a13-61ca-1a7ae827c64c@oracle.com>
Date: Tue, 7 Mar 2023 10:16:15 +0000
Subject: Re: [PATCH v4 08/14] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-9-joao.m.martins@oracle.com>
 <20230306195736.3efc6980.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306195736.3efc6980.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0396.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::24) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DS0PR10MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ec779b-fa26-403a-f462-08db1ef4ff46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArxFZfVeEykrGMIDEmVfHCxRpomMAKoI8hsSUM2ZZyYC1hKncA8j3wsXrPgFqYtUwJPx7fmBQSZFyiJte+hMUiJHxtZ+u8nBeA8I4JxDt4hDRXq1HGU98lKKhdweiaRIveac9oGNkhfxpeN8QbSvamqmqT96S2sS0Tsh4XpIkMAuIm6kb9swczv4+Wv9l0JZh9wr85Q2ThvmyEoa6FlpNqocTecxil28Lrql9du/z9KiulFxXy258zhrCC7gaNmhDntTmvmTg5f6mMSpqMtU4UUwIjWjl/jZRSm/Dt42vfTHBYNwFnW5nl3bfFoYVo5elWrBevPliQduMYMbkFeMDti8BbwWUhMAdrJOloNCK9juxsYwk4JUwJCG7RWAY8Sgri5T1axXSE7liozcLBYHzmqOS7F3XuXThVRBldhkMIceyMzHuhK9U668Q/TzI9C1PjZ0IpIiMNAvQYXPij8pIQeF3EvEIhKEmlXDCZw2t6owVmv6dy7a5rT8JvjyLLw4DOGLUdl5FmZcvFNkMvqdrMlOQZhXJSDJHrm/bjJoooMdhdUy2ZRHsWF0/cJuD1V/RPXUmM9iJhtE20ZnD4HFyogS230qyEGosy5v4lQ6Snt9/2qm0LlRwaygTd7OqvzPAgBXpQpsctsA3hNbM7HvHjl40fFr+o14tTVXqntJqZVVgJzrq3dm/GuMfROk16E2QSMH3WXvJ+sdU+My6qDv4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199018)(31686004)(5660300002)(8936002)(2906002)(41300700001)(4326008)(66946007)(6916009)(66556008)(83380400001)(66476007)(8676002)(316002)(53546011)(54906003)(6666004)(478600001)(6486002)(6512007)(6506007)(86362001)(186003)(31696002)(38100700002)(26005)(36756003)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1F1ZlRMcVIzMElMSWI3Z0pmU3RrSnFzdzREWWo0cTR0Rkx4SVdpZGpBYnNR?=
 =?utf-8?B?NGw5V1BEcnhCRGc3ZmdZYUtHRGg2OVhOVFYxeWtEZDBJQ3VHV3orc2lRY2ZG?=
 =?utf-8?B?ZklwNDVWaUF3OC9kYlpCMlEraWhRSlJqQWtkcUNYWk14MU04eWtUbmdZWVZD?=
 =?utf-8?B?VVA5L2hsbURLMm9WaDg5MkkvREpFZzhZVFlDRCt2R3JuTzZVSVJnYzM5UEV0?=
 =?utf-8?B?Tnhjekl2eUlNamVhaUFKNnlJbWZOdDcyYWNWRithL0RzelNwSkFqVVU2Kzl4?=
 =?utf-8?B?TTRQei90VVQveVBDdmk2d0M1TlU4K2Z3UHBQN2hxY0cyT1NUYncra29xR0R2?=
 =?utf-8?B?d09TVzNKQlNhVmdUc0V5bGJUc043WG1HZWZwTHEzWG9YbU5QT3VLRmhlQ0xj?=
 =?utf-8?B?cmZHMGNiRUY3MDB1L0pjSkhRRzlIQS9pekVHSWZqT2ZVdFNhTzcwK2dxSUhK?=
 =?utf-8?B?M2s5UnJJQ3BoQ3pHby9jejZyUEZvM1RFdFVvNGJqMnN0WmtlNXB3YStnTXR4?=
 =?utf-8?B?T1czRTlMYkpBRnJlR3RUZllqUW1URng1aVNubGdQNWhOaDlqM0tTS1c2aDVm?=
 =?utf-8?B?NDJIUXZkazUrUkxQaTB4Y0VhbngyS2lEWmcyMEE0aVlIVGR3UDVaSmttS2Fz?=
 =?utf-8?B?d0lJaUhHcnpXcXBhc0ZoZHNhOHMyemtzU2hXbG1TYk1lUi9ldHRweEk0NU5n?=
 =?utf-8?B?aXFPcW1lNmVIbFdoME51WGJTYVRkaUswZjJBTisrRGd5djRxdGxMbXJHQlhF?=
 =?utf-8?B?KzAvc3dtZklobXNFUHJBNGF2NlhVVFdaemY5c2diaGlqV0NoYmFFYXMzdTJD?=
 =?utf-8?B?dUNVQW80aG5Ud1loVTJ0VnUyKzBCdlFBaFFtQzY5SWxuVEtCZTlDWDVaVCt2?=
 =?utf-8?B?eXBsOGczdGlWZmoxUUNKL1ZtUTRVM240enM4ZVcreWxKeE40QVRpdU9WL0oy?=
 =?utf-8?B?WXkrUFpkUnBlMXhqZFQ5RGFOVVF2TEtVK29pM3ovdWRqc2VEdkRMNCs5UC9h?=
 =?utf-8?B?VFQxL0x3S1luazhoWWlJTlFvcGs2NXU2bWd6ZnJDbmRoSzdFbmlVVVR6Q28z?=
 =?utf-8?B?VEU3V3RMaG52aGVUd3I5ZkpYSFgxT1dINlpSL3Y0RlYwRE5qSUZ4d1prU1Nv?=
 =?utf-8?B?bXdLUjhjNFhzZ0Y4T29Nc2RRRnlONjV0cVg2cFJHeUc5NDVqeDF6ZkxiUGVJ?=
 =?utf-8?B?ekl4R3hxQ1FyRVJ1UkpKTGp4b3RqeXV0emx3L1NJSm5Xc0xJdE9kelpqenE2?=
 =?utf-8?B?dG9DTWJmQVNzNnFaV1B0SmdOeWlrL2ZBMGliSk1USjE2V1NSNXNOczZSVHNL?=
 =?utf-8?B?d1F1N245aFdMOVpmaEJiWXJ2dEE3UFd5TG5wVm5xTWxReFdTaTZDOWFSOHlX?=
 =?utf-8?B?c3lMbldUUVd0K05pQWNwMjhiQ29wMURrOU9xRjhFcDZDVXRNRUxKZW1FQ1JS?=
 =?utf-8?B?elNsQUpUT2dtTlg1QTI0aXlEWXBjWDhTSkE4QUExZjJPYkxaaHppNmtKZzlt?=
 =?utf-8?B?UWIzeS9MdHNXckNKd1Bta3p1Nld3cWR0MVRUL1ZkUUF1VUNhaDJjRG1jQmY3?=
 =?utf-8?B?Tk5IK0tDcFc5R1hIR1ZqOFMxOSt6NVpmYjFTbEIrZzE1M01VRk5SeDZ1SnUy?=
 =?utf-8?B?TWV1ZmVyS1FEQmp6WkN6MldQR1lTTkZ6R2lhWnY0N2pWbCtaYjJjS2dTYTRj?=
 =?utf-8?B?Y3lqRUZ3YkxIbTdjbEFoUHVQbmtUaFF4T0ZBTVg3dTRPUEdWZzEyMHh0MTMv?=
 =?utf-8?B?bHJkMStiVDhrWWExVXBCaDZRK1I2VzFuQ3pzN0cxSkI3UEl1NkhGMmpvQjc3?=
 =?utf-8?B?bW9wNFdrQVEzSDRzNjl0ZzJqd20vb09PQUFnVndOeFp2ZUlIaHpTbkhpMllV?=
 =?utf-8?B?dVUvdjA1czF1UmFxdWNQcW9CaElqM0JYOUphWC9NYkhqdThWQ3RjNXJjbVNt?=
 =?utf-8?B?ZFlpK1lVcnpKTHdCdXBxSGxiM01RK2M2Q3NiUDY5b1pmaUdnemJHa1hVNk12?=
 =?utf-8?B?OFlPWkRXaTJRTzExbXhiSE9QcnlKcWxQRXJNOHo0UllrL3pZaCsvSDBERkVH?=
 =?utf-8?B?UytPa2dmT2xwNEJHaHVMYVJKQmRvWkdCRE5RRWpIN1Ric2xybURtVU5ZaytD?=
 =?utf-8?B?RkhkY1dUQXo1YVZrY1ExeGNLbkxBd0JWOUpVTHpCRG5ZU2o1cWpwZGxXMUxZ?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NsBOCYihRv3+0/qlQTC/5Wd0pYRzFgx201qnlmbnjLBrJZ/xl4NpTBtc5I/BAwOElxTVRzBc34DejAaJ5qbLPLLwqGCfDoKULWLUKZG0p/bw9a78DS4EqP4hT7MWBLWsN+KbxFmUk6whU3vuZ55J7Mwdz1XaxtnUlCVh8gqQ1fDElNRElNC1XgGDabAp5WKGVOLyKbmVEcZGH5dyJzQpK18SJubOjbte/vuo3doNvyeyt6MAOb/94tCb53Gkog4hothqFE/iCqQqGj1FK2RWslYRF0nrJxG2LUB3WDC0RR4IhpIDl6NyXJZcxMTrwXqe2itR+puRXzYca6qj+EaZHX+rQ8CQ1cAIQRskSS/QLJ+RM1UPHQ3VVUMNQ3e7pkym0q+OMGNSaPxBo/Oz5ZnyL7t7Yh33Ozegj7wMeSLI2h3C4xRJSA2lImRm8QVmxAjxpZ09Cl1882X+KSs4NdRvsv0J0i5sxUh692RMmc82MBrG6QqalvLqhw8S4e6Vczc/GEkCUDbrsT0/kvuE00CTIK4THiDX5JSs8WsZCxyP0vNU51KWTkm0L1jQZaWXIoC/xSWlv4i/S2yEcAG1LnMlSYAT7FQdnIByg3XIA0TPhOamc/h6m+heiWufnLeusFjyVj4b3JWPjtAWFtlqbkJCnN8GacBPH5haVXJcvY/KuFxHJc/SoHnBJ6UTK2UkK9IFrVWHTH7R0r02GvgKLgj18CisVdkmHylO4LwtJeFbFa4B+RZQMpnCGsVjYACd/z8Y+EbiumS00eexGXKH6xIU9MmRcMCuRiTnp5lYXUf7BTeK56VlY6S1/OBHRRfA62G5
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ec779b-fa26-403a-f462-08db1ef4ff46
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:16:20.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJv4bosnfqYqMHdOUpOY8b6ukP56N3MRE/HRbSz6+7RzqdVi5bdEPKRPDbFaBwFcrUkE3BbrtJRUqStOU/prSBEx27EfcH6bPDq80/2uODI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070093
X-Proofpoint-GUID: MdA1LkJxPbS1JZPkCQgKhPF7jdo17C5m
X-Proofpoint-ORIG-GUID: MdA1LkJxPbS1JZPkCQgKhPF7jdo17C5m
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

On 07/03/2023 02:57, Alex Williamson wrote:
> On Tue,  7 Mar 2023 02:02:52 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/vfio/common.c              | 76 +++++++++++++++++++++++++++++++++++
>>  hw/vfio/trace-events          |  1 +
>>  include/hw/vfio/vfio-common.h | 13 ++++++
>>  3 files changed, 90 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 3a6491dbc523..a9b1fc999121 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1334,11 +1334,87 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>>      return ret;
>>  }
>>  
>> +static void vfio_dirty_tracking_update(MemoryListener *listener,
>> +                                       MemoryRegionSection *section)
>> +{
>> +    VFIODirtyRanges *dirty = container_of(listener, VFIODirtyRanges, listener);
>> +    VFIODirtyTrackingRange *range = &dirty->ranges;
>> +    hwaddr max32 = UINT32_MAX - 1ULL;
> 
> The -1 is wrong here, UINT32_MAX is (2^32 - 1)
> 
Ugh, what a distraction.

The reason it worked in my tests is because there's a whole at the boundary,
being off by one wouldn't change the end range.

>> +    hwaddr iova, end;
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(dirty->container, section,
>> +                                     &iova, &end, NULL)) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * The address space passed to the dirty tracker is reduced to two ranges:
>> +     * one for 32-bit DMA ranges, and another one for 64-bit DMA ranges.
>> +     * The underlying reports of dirty will query a sub-interval of each of
>> +     * these ranges.
>> +     *
>> +     * The purpose of the dual range handling is to handle known cases of big
>> +     * holes in the address space, like the x86 AMD 1T hole. The alternative
>> +     * would be an IOVATree but that has a much bigger runtime overhead and
>> +     * unnecessary complexity.
>> +     */
>> +    if (iova < max32 && end <= max32) {
> 
> Nit, the first test is redundant, iova is necessarily less than end.
>

I'll delete it.

>> +        if (range->min32 > iova) {
>> +            range->min32 = iova;
>> +        }
>> +        if (range->max32 < end) {
>> +            range->max32 = end;
>> +        }
>> +        trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                    range->min32, range->max32);
>> +    } else {
>> +        if (!range->min64 || range->min64 > iova) {
> 
> The first test should be removed, we're initializing min64 to a
> non-zero value now, so if it's zero it's been set and we can't
> de-prioritize that set value.
> 
Distraction again, I am sure I removed all. and the test is pretty useless as
this will never be true.

>> +            range->min64 = iova;
>> +        }
>> +        if (range->max64 < end) {
>> +            range->max64 = end;
>> +        }
>> +        trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                    range->min64, range->max64);
>> +    }
>> +
>> +    return;
>> +}
>> +
>> +static const MemoryListener vfio_dirty_tracking_listener = {
>> +    .name = "vfio-tracking",
>> +    .region_add = vfio_dirty_tracking_update,
>> +};
>> +
>> +static void vfio_dirty_tracking_init(VFIOContainer *container,
>> +                                     VFIODirtyRanges *dirty)
>> +{
>> +    memset(dirty, 0, sizeof(*dirty));
>> +    dirty->ranges.min32 = UINT32_MAX;
>> +    dirty->ranges.min64 = UINT64_MAX;
>> +    dirty->listener = vfio_dirty_tracking_listener;
>> +    dirty->container = container;
>> +
> 
> I was actually thinking the caller would just pass
> VFIODirtyTrackingRange and VFIODirtyRanges would be allocated on the
> stack here, perhaps both are defined private to this file, but this
> works and we can refine later if we so decide.  Thanks,
>
OK, I see what you mean. Since I have to respin v5, I'll fix this.

> 
>> +    memory_listener_register(&dirty->listener,
>> +                             container->space->as);
>> +
>> +    /*
>> +     * The memory listener is synchronous, and used to calculate the range
>> +     * to dirty tracking. Unregister it after we are done as we are not
>> +     * interested in any follow-up updates.
>> +     */
>> +    memory_listener_unregister(&dirty->listener);
>> +}
>> +
>>  static void vfio_listener_log_global_start(MemoryListener *listener)
>>  {
>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +    VFIODirtyRanges dirty;
>>      int ret;
>>  
>> +    vfio_dirty_tracking_init(container, &dirty);
>> +
>>      ret = vfio_set_dirty_page_tracking(container, true);
>>      if (ret) {
>>          vfio_set_migration_error(ret);
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07cd9..d97a6de17921 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
>>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>>  vfio_disconnect_container(int fd) "close container->fd=%d"
>>  vfio_put_group(int fd) "close group->fd=%d"
>>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..0f84136cceb5 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -96,6 +96,19 @@ typedef struct VFIOContainer {
>>      QLIST_ENTRY(VFIOContainer) next;
>>  } VFIOContainer;
>>  
>> +typedef struct VFIODirtyTrackingRange {
>> +    hwaddr min32;
>> +    hwaddr max32;
>> +    hwaddr min64;
>> +    hwaddr max64;
>> +} VFIODirtyTrackingRange;
>> +
>> +typedef struct VFIODirtyRanges {
>> +    VFIOContainer *container;
>> +    VFIODirtyTrackingRange ranges;
>> +    MemoryListener listener;
>> +} VFIODirtyRanges;
>> +
>>  typedef struct VFIOGuestIOMMU {
>>      VFIOContainer *container;
>>      IOMMUMemoryRegion *iommu_mr;
> 

