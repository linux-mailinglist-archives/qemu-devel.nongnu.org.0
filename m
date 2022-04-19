Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF345507D28
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 01:20:54 +0200 (CEST)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngx9R-0006qZ-Ei
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 19:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngx7r-0006An-Rj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 19:19:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngx7k-0008KQ-Qb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 19:19:13 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JI4EZC009605; 
 Tue, 19 Apr 2022 20:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RlscMOJRrWxyCic13Ics/cLdDM0/3g5IkmCjSpKNxV8=;
 b=c2OKI2XJj9iGFJjNoUlYltAiKo+6ZylhqC3FuoqE6ZJQsKY9xhMcCkcR1Ivew/y5rWrV
 y+Ma6Ny9WG514cwlO7MNxdfkAC3tfb4lWAMpUOm9DlUaC8xwEle+IzZdziIoWMfM39sk
 z9gaXwFWwS6PYuT7euRB7fE8JrEcdKmz0d4fyg3lzJ6orlQ0GpKCN5+kxFm7MnI1LaR6
 xhVYdeklXKu/OrBzz4ziMJjlnlwqDv5fftTlAqgUCr3+raBzr8v+APouF0xFU/SIoEet
 bsrmKznXfYMW+dY8nmjJV5K7xDKDBkUVRr+9b441sKq+wxljEcYDxhIyYwfjumo5xelK 7A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmk2q79x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:22 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKaixE019904; Tue, 19 Apr 2022 20:45:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm892n1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB6SElNiz/Lctsv6q6xc9Q54gK6pINRTarPmMVteMaq9wi+IfGMpBgO7GOtaQCm1ucN5L/y6JRpVOvUWxJBJsjI4+g0+DVvuyFj2nRULOJh+bfFm/HpFAejpzZqgaX8Sy6OJGJ5c12ilw//wPAlFZ/RE1iPSrHNSkwPcSTSM2XYNlriKm34jgk3Dnib9RJsPWe7nmGj1l2EWohV/W8QnNl4wCH9ZERJiENm8Mvym8LknI7yYjjAsGX0WLrJJUAOgf3nT04wcsz5MVTaiwc+038swAMBB7ubr9smFzazFu4spIAlkJ+LTSJ+joTIltZ/HvIkHbOqogpPOnLpHOPh7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlscMOJRrWxyCic13Ics/cLdDM0/3g5IkmCjSpKNxV8=;
 b=OPR0TKasiYdfugAd069lyPhSlTZJwkMRb0P8thJHoXA3n5vKvwEhcgVLzxR5Jnn9yBkr8tAlRPDu3Ig0w6M3W2f8Lsusl1uTXi9SEZ2n990Q8hu/tzOePiHa/CR84pv94J1GR3aYUHxhpEmIF8e0dXxDSe5Y4uRzdRTJLyt2mmsp4F9qrPJ4nkN/BLoc+BOG6dAB26RZVTcq0LyCn4hCXxGXd8cXtHZzC+o8sJ20trhNs7314g1x3nnIz5t/INqr8cEXSOUfkE6S7XyoryMNcns8JNfM9gQGhNstrAjAKoHcdQrb7nvXsIsSuSfuiIwyhDLhKGut6QXj7HV5pS4xcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlscMOJRrWxyCic13Ics/cLdDM0/3g5IkmCjSpKNxV8=;
 b=CT8RMuLJx4MVRC/xZk2Xr+hX0jF7SQ3eNGCAEy0NQVd4QSOYrD/03Eh47Ab9wenQu0lxwD3oIi6DBrsHYHDl2Wv7kXMSkwiguHMtUMW0KnLvYoT28VAhvhk86mXu/+Pyr+uAQs040bjaP8yvlI6OQeKqqc3KbA2bB5cf5cgZyS8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:19 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:19 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Date: Tue, 19 Apr 2022 16:44:17 -0400
Message-Id: <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba5ca14b-aee5-429c-8b51-08da22458425
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998B72A7E842B4EA4AA08C190F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DA7yrPQNEv36yk+mIRGraqfcY1FBEWJqcnThY6QUvJK/SfTQdYIXMsb6MIhHM2L6vyUkX/ySnoC67tS4vCXrGFnD6eRdUZU3VtDe1zOjdziIrDBNiwg5ksjE9Za1gvVZBQ8uLDGYmT4hOpN8ZZvt8EYk37u3vVDyyAcqfcAj/O0HEe6849cKUR4/e1+wIZr+DZTF4Zba5ebGs9okcC7UEK7KmyZlkx/JF/gbVL/0+DFDoEs4rzxm48G3Be2PA51vV+seG/Sl7HospAVM0sNZDo+o2DBcZq+mkNM3DK1IR26xeCvgz83YLr0AgCK5tHgXH1Xph8UPEmIfKXFMkx/T5AWFeP3Phg3PY9L+HIvmnVs7V8sLNny+pB+X++Y0CPZrH2WK7fMjNUUHysQh6oWS07TNoVTV0AGvRidxL74jxAUcg44k7AUkFBvfQO7U1LZOSPhVcoBzGGG1B1AqRTQQDAl8sqWZvCQiozRMvN0IW+LmTVeE+eGzIl4i2OxYDU8/EdIj8DeJkXGehZTpvYMugi4UNR1cj3Yc8sM8W7orb930Apns9h1F9oyP/yxOWT1OhFs7rj87Xt5j14W3Bg4ST5gkdM2CEwQjBt/JPpBxk041aDFbDsCROwpJnqHFqNiaYzonDe5bNNA7altQf5dmLk16RQGmBBq/kVASDLgJFijAGNijsvdxrMlvk22/Hhn6vvzGBWhCY6FJtsuHItyhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEpGcGtySGVyQng3a2hWWHB6UHhxcGhoUjk2bm5VejIvU0tjNWJEL1FqUHYx?=
 =?utf-8?B?ZVJxazZTZTVVNnZkaHgzV1JJMVhnOHJmZUpZOUhmZjdMNFV6TC80ZVJlTjJl?=
 =?utf-8?B?WnluQzhhWUFUMFRrTVhtdGNqRlpHM0dWdDhhWHByQzhqTkp2SzU4am1tRG5K?=
 =?utf-8?B?Qi9mZUFYaGNFMzh4Q3lIdlpWQUhXU2lkR0FGcmlMVk9UTmV5T1pvMzdyeWFn?=
 =?utf-8?B?VUM2QnhNc1Q0cVBtM2piKzAzLzFqZE43eWx0QVVoRTdPRk8zN1lYL1loZlpD?=
 =?utf-8?B?VGRScVZBalJGT0tDa1BldGQrYWdLMVBnN20vSEtrOXozc01qOVhUelJBUTVs?=
 =?utf-8?B?NDc2a0xpSU9BRWdyVHUrQ3dZMVQvM2ZqMDczKzgyUnBxelNSTTdYY1NQTVo3?=
 =?utf-8?B?UHNqMlZ3SHFKRmdJOEl0bHFZQklFRm9mNWJFaHFvVjRBbW04RllUUVQ2aEFl?=
 =?utf-8?B?d3VkektvdG92VjhqcEQzS0xSbVZHRHBmVXlaNk4xaXFkRi9HY0VoM0tRZ3ZL?=
 =?utf-8?B?WjBBOFFzZ2lBby9CVytKSWxrMUhzamdNbnhweHBNclpvQnZRNklpdlNDRjFa?=
 =?utf-8?B?ZVlXWEtwUU1XRHpNWnc2V1d6UStIL1hGakk2OXNMdnpzaHpBWFNIZXJCQVE5?=
 =?utf-8?B?b1IrWE5FcHhCS211UUQ3VUFsYjFvRU5pWEcraDl1UVhnbUs5ZlNxWVpXaGgy?=
 =?utf-8?B?cmQzM0VWY3N3Y0dlbWF5eGlCcGFkZUNTTGFqTk1Mb3hMRGU3RFJFV1V0TTFj?=
 =?utf-8?B?MkVHcWk1cTBGeWIxUis2UEFZUFhVUXBYbHFJaGxLZlpBQWR4ZURkc1FIZ0gw?=
 =?utf-8?B?WTBqR2lZbWtacnpuL2hMcW1GNllGdFZxVWE3Szh4REpxVDcyOTR5RkYzaDNL?=
 =?utf-8?B?TlRKYmFiMXlabzBOVEk1Uk1QcFYyL1M5RDg2Qi9zamkydDd3UU04ZWZDbmMr?=
 =?utf-8?B?R2M1b2c2S21oK3JibEtjWncvRWNrdXJtSGY2K0RCK2tDN1BpcmxQb2JVV0VK?=
 =?utf-8?B?OGg1UnR4UVIvVFFNMW5HWWI0M05zUW5sL2VsbXhHdUJ1Q2owbVRGOFFROUU3?=
 =?utf-8?B?M3BaU2VvYmQ4UjBGa3VEcXpnU0pCcHZWdGRMRE9INjZMVVZMY2RFVHNPRHhZ?=
 =?utf-8?B?eFVNem11c2JZeFNoeU8xeENaTUEvMmxWcEZVaVFFM2RnVkJ0Y2VZRi92UjRO?=
 =?utf-8?B?WUJaaEJBV2FrSm5ST0dwNi9tbUVKelgxZ1BpRGNzY1VoQllvTE5NVE0wcHAv?=
 =?utf-8?B?TUlvcWgvK1h2M2Q5U3pZbWdpUHFvNURVQ1BJc2JxcTJ5N2ZhS1FpckpnTmJi?=
 =?utf-8?B?aUx6Snh3UkFxaG5mcVpsL1FFUVdGejVkOVVkZkFSaEVnTnNuYWlXMExhUkpo?=
 =?utf-8?B?czhOdE5SbjdQLzFBNit2VUJ3UUVpT09JcCtjOTY0Q3F5aTNsc2FNL2loRnlq?=
 =?utf-8?B?VW1MR2N2cVpMRkM5R1VSeGRWOE85N0xjVEgrNjZjb0xsMWtsN2M1b2pDV1Ix?=
 =?utf-8?B?SUtvbzh1RjNxOGxyS0NKMWNTcm1jQkZxam1UcEs1QStVR3U1Y01mQjVKdDJT?=
 =?utf-8?B?Smh5YmNXR3k3bncyenQ4cFV5YTNCdmtDY3hMWFB4WmtMaWZXUmNSVDZWWkpr?=
 =?utf-8?B?My9VOW1BbmxzN3pnb045akJ6bTN4eXNuTEE0b1ZEeEplUFRyNysrSjZMd0I2?=
 =?utf-8?B?dzV5dHBGWnNJZmU4YWxJTVd2eGNyVWptOHJjYTNiNTJPZXZDbVNRZDF6OFpk?=
 =?utf-8?B?bDc4TWtaUXZNcDZaVUZ0RDZnY3dHNDluQVR6cnY3ZHJzNEtZMXBNL0NkMFJB?=
 =?utf-8?B?QWNkNVhUVHovaHMyMzhjc1pLdjlqbThLdzFPU0ZtZU5nMmp3WENTNW5pUzU5?=
 =?utf-8?B?US9GRzVDeFBTb01qUVRkcFdRNUNjT2t4MTBab1pTZWY3WGI1aDA3VzhkNHc2?=
 =?utf-8?B?Nm1wVWQvMXp1U21QL1EvMWhKZzQ2SGZKbVR6MXlmRjBia1hoclloSm1hT05N?=
 =?utf-8?B?TWFaQUdFa1ovSmk0c0dxWmR3cGhUQW9NUTVVYVNqVjZZUHRPVmplZ2x2aVFD?=
 =?utf-8?B?L0VtNExPVzFDSGtsRjNBSnJ2ZExVekZ1TEJZYll0NWJxQm56Q0NPZGx0bStF?=
 =?utf-8?B?NSszMzd1dndROHRYS3VuQkMxc1A1N3NOVkVJTktMbjhBSnFRM09tQkRsaUsv?=
 =?utf-8?B?NEZQZnd1aHdiVzhoTURLQzY3UzF3aHlWSUVjRzVsSmhITHJHWEp5b1RDS0tq?=
 =?utf-8?B?QW1oVk85dk1vYStRMTdwSk5nODRDenZyODFoWjM4U2hMOTZFR2VVMlFXMi9E?=
 =?utf-8?B?YkpiVG1kUmNScE5tQ2ZLaEZoWDcvYTBOOVFZK1p3bWV0Q2UxMnlXdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5ca14b-aee5-429c-8b51-08da22458425
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:19.3362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L04n7gSwIwErs7QG/4Wrn/xC+lGwV/3Bi4YUmH9nQ3eI+2mM1XwMO025LtJPCnD4+YMATJtn/HH42fBAA5Yeww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190115
X-Proofpoint-GUID: xoQdWExnYrIqFK2ovGpzmcARF869R52n
X-Proofpoint-ORIG-GUID: xoQdWExnYrIqFK2ovGpzmcARF869R52n
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/iommu.h |  40 +++++++++++++
 hw/remote/iommu.c         | 114 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |  13 ++++-
 MAINTAINERS               |   2 +
 hw/remote/meson.build     |   1 +
 5 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..33b68a8f4b
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,40 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+
+#ifndef INT2VOIDP
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+#endif
+
+typedef struct RemoteIommuElem {
+    MemoryRegion *mr;
+
+    AddressSpace as;
+} RemoteIommuElem;
+
+#define TYPE_REMOTE_IOMMU "x-remote-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
+
+struct RemoteIommu {
+    Object parent;
+
+    GHashTable *elem_by_devfn;
+
+    QemuMutex lock;
+};
+
+void remote_iommu_setup(PCIBus *pci_bus);
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..16c6b0834e
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,114 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    RemoteIommu *iommu = opaque;
+    RemoteIommuElem *elem = NULL;
+
+    qemu_mutex_lock(&iommu->lock);
+
+    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
+
+    if (!elem) {
+        elem = g_malloc0(sizeof(RemoteIommuElem));
+        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
+    }
+
+    if (!elem->mr) {
+        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
+        memory_region_set_size(elem->mr, UINT64_MAX);
+        address_space_init(&elem->as, elem->mr, NULL);
+    }
+
+    qemu_mutex_unlock(&iommu->lock);
+
+    return &elem->as;
+}
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev)
+{
+    AddressSpace *as = pci_device_iommu_address_space(pci_dev);
+    RemoteIommuElem *elem = NULL;
+
+    if (as == &address_space_memory) {
+        return;
+    }
+
+    elem = container_of(as, RemoteIommuElem, as);
+
+    address_space_destroy(&elem->as);
+
+    object_unref(elem->mr);
+
+    elem->mr = NULL;
+}
+
+static void remote_iommu_init(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    iommu->elem_by_devfn = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    qemu_mutex_init(&iommu->lock);
+}
+
+static void remote_iommu_finalize(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    qemu_mutex_destroy(&iommu->lock);
+
+    if (iommu->elem_by_devfn) {
+        g_hash_table_destroy(iommu->elem_by_devfn);
+        iommu->elem_by_devfn = NULL;
+    }
+}
+
+void remote_iommu_setup(PCIBus *pci_bus)
+{
+    RemoteIommu *iommu = NULL;
+
+    g_assert(pci_bus);
+
+    iommu = REMOTE_IOMMU(object_new(TYPE_REMOTE_IOMMU));
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, iommu);
+
+    object_property_add_child(OBJECT(pci_bus), "remote-iommu", OBJECT(iommu));
+
+    object_unref(OBJECT(iommu));
+}
+
+static const TypeInfo remote_iommu_info = {
+    .name = TYPE_REMOTE_IOMMU,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteIommu),
+    .instance_init = remote_iommu_init,
+    .instance_finalize = remote_iommu_finalize,
+};
+
+static void remote_iommu_register_types(void)
+{
+    type_register_static(&remote_iommu_info);
+}
+
+type_init(remote_iommu_register_types)
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index ed91659794..cca5d25f50 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
@@ -100,6 +101,16 @@ static void remote_machine_instance_init(Object *obj)
     s->auto_shutdown = true;
 }
 
+static void remote_machine_dev_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        remote_iommu_unplug_dev(PCI_DEVICE(dev));
+    }
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -108,7 +119,7 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
-    hc->unplug = qdev_simple_device_unplug_cb;
+    hc->unplug = remote_machine_dev_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
diff --git a/MAINTAINERS b/MAINTAINERS
index 37afdecc61..3e62ccab0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3599,6 +3599,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 534ac5df79..bcef83c8cc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
-- 
2.20.1


