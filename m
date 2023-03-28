Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B46CC74B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:00:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBjj-0004ir-Lm; Tue, 28 Mar 2023 11:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phBjg-0004hA-BT; Tue, 28 Mar 2023 11:59:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phBjd-0003LC-P2; Tue, 28 Mar 2023 11:59:48 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SFdXc7026181; Tue, 28 Mar 2023 15:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=9Rrwm+l0ovBrjPLb003/v8y9BGkbeZJc1V02WM7hZR4=;
 b=efHJxZrHRjQatacsADRiscp3cseStkLSKNKMlSC0h+78aWHV3iqoiWv3MabCxr98U5JX
 fXpOEc3zsb72UUOduWn+hqgb6aD0bVCJzOYcy7jFjcINY0nVTzdwxNnylFM1bkNHnUXM
 jzM2Y/dlyO7wSUL6G8jN8skFDJhnG8jniyoAP59RO3q0MkQN9enuLHRxkILiiyo7HrQs
 DKS9Nwm/agedzaemY7HqZbC4knAxSTFRIZLdasysIyW1ygxIRvIoQu2f9iuU8PzdpSDf
 JOIFEvS3G4NviyJTJbTCM1mGULGN6oiRrqCdy4VYb89sWdRPatSfBCopS8GAk2jcEJLh xA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm32kg3k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 15:59:42 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32SEqWhe027628; Tue, 28 Mar 2023 15:59:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqdd4n7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 15:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNQS89knRzbskirpS//Pi9JgTUf7ndXm7It3OMT9QIvU3kJ9PM2p8mSSC+/VTeFhLIGQL63MCVwDzvdJCg+wpwbWlrNZfd7zk23Tw6Y6fTnWLlmdrlHD19IPmhawQdlkO8Avlnf0B/Pvu6zPp2gnz0O93o5mBXnNUVNN7eEmJXwR6jp/giOyXkwKFfhfNHFt2KZS8O+V6P8S0LqI8ZOzmdhwyuFYRed5xGwasp50ZtIXw245UpNc82ByItlOIjGdr6OyV1IJmMo8xgwf29Xt06KzD9N4SD0+uP1OzfXHZDXemRYJ+jxD6ntb2POM6AJsN2q6hikkwdydI5z4ykeycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Rrwm+l0ovBrjPLb003/v8y9BGkbeZJc1V02WM7hZR4=;
 b=bsQNqPvPIwpJJ/M+K1J0CJlbUwk8zQkDPzl2UxXTKqhKxuLdGlQ9JCwX2CNffkpM0B1x89IpYwrNGDPD/xCKwdPpYqEu4xKUOv6yWWCmFEDW6++GN05BzLfTrwCYLm82SIbMwLgAJ9QhOxAvZv4+7sIAPVQ6+QKyaRjYYdqqljxmIX4LZmM/551YFZRei5GR/dB19MAZ8ViCxSp8vf5/QodsX0g7FFIKfxMfhq/UB+udgicDXfTzTVEdYBQUtgP1gwsnIzYsdWwGd86gemAQSg/pMRMGi4fbB+6t2L8NmEzXJOduB0SEjF45GAa+lJ6jZx975xjONpZRhuWLOqe06Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rrwm+l0ovBrjPLb003/v8y9BGkbeZJc1V02WM7hZR4=;
 b=HZViw0v4+elrSksCXyD38AcPvXmcUi7DesSWHaUNGp19OHIJkWW0z6ojUGtkkhA3afvqWEEX3uxc9oIQWlStq9XKPuJOWpc9ZZeofn8UZRdRb1P6phA4YbqxQPjj6a/3ETHXpEZPX0ZDtAWdoHTDHuLoOEHPaF37asKG1hWQ6ng=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB4486.namprd10.prod.outlook.com (2603:10b6:510:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 15:59:39 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:59:39 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Date: Tue, 28 Mar 2023 11:59:26 -0400
Message-Id: <20230328155926.2277-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328155926.2277-1-eric.devolder@oracle.com>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0074.namprd11.prod.outlook.com
 (2603:10b6:806:d2::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH0PR10MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: dc28bd9d-65e9-4ba2-9576-08db2fa56fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwJcr8w9bcYWIpLTPALUiBmY+7r/sWjfGIa90iafcfwaHhdrwt/h8X+EmrknTo0pihNcK5FjAiykvdFVzN3O9lF20rqdwQOMy1zjQkJMtMU6XCa5oGnQcIZHWn5hkm4iCnwqdgsaI64OdvxJ0aAAKODhRF41YiFgGlbzq7MblcdAOwy1a55m1EGF3Pd8C4ni4E59qMZp0v77A6MagqM2IDkPbGVDO64Qtbw+W4bXtIzLfNcuc1IB98Al9kc7CZbjNi7mWB0xpZFfFYg8lUZWgkAK/uTnD05BqsUhJYP6LxTh/vLYGyw+9I37WKrc8yt8fq5Z+oKOFSVdXtNVyfUX+4mHfBj8Y/PnFCbfR+maBz8Utu9DCeYUDJ9US3se+uPoV/9wI7ARFd8RcjAJfUMhgEjp5iK0yI9YVXVZ/fYLwmGZB5XTy0nj6NrSWkUYs1qUHbRuGfhdjq5PnR1lhTHIy9hopExx58qanFf/biUDlF0zBywpQ3CESA/VIAIdPX7h18cPi19Zz0Mx09Dt9NZ9ZPRGLjz07Yt2AXUfyen6rxBQ1cbGaS2CwpbSsUxMok1zFpTIWKL7IGQJ+fvZAJsBp4srDRpY4LEM9qxzk89La+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(107886003)(38100700002)(2906002)(86362001)(36756003)(921005)(6666004)(186003)(4326008)(6512007)(26005)(1076003)(478600001)(7416002)(5660300002)(8936002)(6486002)(41300700001)(6506007)(316002)(66946007)(66476007)(2616005)(66556008)(83380400001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtxcFI4T2N3M0xnWG5OYk9BN2cyTGRqb2krdEVGM1MzRStpWXdCUkVmLzVu?=
 =?utf-8?B?TFIzUm1iVURZakp5Ukx4dVRpekdvZG5nSjMwaHNJZm00Z0VjelJBQ2lzOC9I?=
 =?utf-8?B?SVFOdEp2YzVhTHMreFpnbklBdFRuVFgvK2l4eHpQdnVQUGhhR3RwMjBCRERv?=
 =?utf-8?B?cHN3ZmhNOERjQWJ0eW1lbHRKVHdWSi94OFIwbUkvWUJLblZFL1JNT3Zrd242?=
 =?utf-8?B?YW9oalZIYm1QOUFnallpRmV2d3diZUZxUVBzUitYczc5U1dxb2FmQjRWdjli?=
 =?utf-8?B?cHM3ZVVONXVEZUZjQTFySmlkbDE1dUc2SzRnWTZPcmlEcnNDSmVlYi9tZm4v?=
 =?utf-8?B?dVN0b2hoWTE0OGg0eXFDOTJNcExwOXdtdTNSSVo3VjhjRW9SeWhMRVZIWGx5?=
 =?utf-8?B?TUZ1WlE0d1BhMEw2bGM0eTVhQ1I2STBITzhTS0o1a01SaTdMWVZvQUxwaW5q?=
 =?utf-8?B?b2FuMjF5TWVMeUFMMnd0ekIrTEViM1kxOHFJUnJGV2c2U0M4dFBzNk5aL2ds?=
 =?utf-8?B?NVhSQVRuTmVGc3hiVDErL21vNjdScTBYbXNWeUJCcUdqZjE5eEc4TmYzRVI1?=
 =?utf-8?B?ZVprTFNMVVAzSnZldUxvSm1JbVJlVlRLNWZqTzkzbVNad1pQVnpIbG41MXpw?=
 =?utf-8?B?UjBNVDlRWFRhWFRnUHJPelRaZUR6a3Z1VWtQMnpkb2pCdG5mRlBYMWNKRlIy?=
 =?utf-8?B?WTFEUkdEVzd6Q3ZpWktULy9xMStkNm9LUCtqRWVoM0tIMEIxT1NzbnJNWFA1?=
 =?utf-8?B?dzNLanNxQVlncUVMSXJKU0I4TkNxRHBkODIycFZiUlZ0QVl3MXc0RUdHcjJn?=
 =?utf-8?B?aUpYTzVOTWI5d1dzWUZ2bWFhREMvazMxZDcvcVZsdUJBWG1iRldSdXh3aW83?=
 =?utf-8?B?UzdabGZEK0xmNy9TamFHOGd1VWlmMWIwWEg5cHNrVXN2TmRUVHVEaFY5NG5K?=
 =?utf-8?B?dGlNRVpmYVp6VlRKMyt2bWZIZFYwT2JkQjdSTUJlQVk2UUpKTzRHc2pQV3Js?=
 =?utf-8?B?c2pZL29VOXJnR1FTUHBwUWttQ2hqUU8zWkgyYWhNcElINFJqNVJsMWExNURv?=
 =?utf-8?B?NnJxKzFvdkFvVWdqVkFCQUZIblBrbExYbEk5bzI1Wjd3eXZoRDdCQU5MNFB2?=
 =?utf-8?B?YVdsS2pUZHJRRVNUQTE4SVdDcUpReWFPUnVKNUtsbkphZUdaNmFFNWpNbk1K?=
 =?utf-8?B?SkpzTXl0cVkxbkltaHRYbm5hVCtYRUk5aktyQ0I0WDQ4ejhmKzY4aXlxeHJx?=
 =?utf-8?B?UWZoU1J2b1hEb1JsMG9yWkt5bUpuYVlTUk1TNE9SZkhqa2R5ci90VFJIRnJT?=
 =?utf-8?B?NWhkVm80VXlOUXVlN241aTBSbkE2eEh6M2ZxNnplekpBTXdGS2xhZ3Y1UnE3?=
 =?utf-8?B?OG45dUFONW1oMjJnWHF3VzZiWi9JTEFPM1ZRN0l1T21QZGE0TTR1Zm9zK2lP?=
 =?utf-8?B?VUdIQ2xFeG9OWnNRYXFIY2pqUE44QUNyZmxBcWVsRjhybTZDaGFpVHd6L2Mr?=
 =?utf-8?B?dzd2dmE0QUJFbVhBazVrajArQUhQSTd3TlNYemhzanJYaTVrUXpHc2NNeDlv?=
 =?utf-8?B?bDRwWVlFekY2ZGdnQzVRR0h5TDZyTHhDamYxeFVCb0FTYTlXdUdKc1V3YU5G?=
 =?utf-8?B?M0I3b25zRFMyMi80SkRGaE52bHQ5L1VCTW5tc1g0NmZnRklYWGwweS9vQ1A0?=
 =?utf-8?B?ZWEzMVF3MGFCL0dteHl0TlFpY2NyanV0VjRCbkZnbFI3cWZUa1hkeFF2T2F2?=
 =?utf-8?B?M0d1SmR4dzdtL1JJSjBZTUJsYWZuaEhYRk81azc2c0tNcW5VZFZ5dTZ5QVdt?=
 =?utf-8?B?cEpYN2dScFNwbGlzUEpzV0V1MVNDWFRDRXJUU0JxV085QUZKNU1tSkJFWTQ5?=
 =?utf-8?B?M1VOeGdXWjMwQWRxNlIvZkhNdWg0TEJNcWd1OEduYy95Rmd4Y3NSMlpYRnkx?=
 =?utf-8?B?TnQ1YVpwR0RzZERBcjBtamJsTFZsRk1HYXFZOEUxOE9JUUhKMVVJcVB3TUF6?=
 =?utf-8?B?ejlONzZzOHpFYVJvYUt1ZitDQk5wS2tscUlQYkJqN0FwREpSMnlaZzF2L1hO?=
 =?utf-8?B?S1lIYkw4eU9taTl3WjlpdUV3ZzZHcERCN3lETGZ4Y1YxWG9IT2I4YmphZ2R1?=
 =?utf-8?B?cWI4QTZISElJR1BlOGoxKzkzMWhiT1pNT2RYbTluRmwxNFF1ekV6Y21rWkNr?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RFasG0nfmCvLzYdqgG/U3nqzI9AO9Wtfii8t8j2rPIPBnouSDqICNGWzhoG/75W9H0ejDU/C3RHSuIyiKu9keIt2zEpekg0utrjAcyHilPc7Kt8xXS+URkhOoQPNF5knEEiYWStIVYxyodR05iNyJ0Q8wE/3xRiJOP5kd12SYOltmhNK6CH8vdmkPMdgD+5Q5/5d3SdalNXfiqsxLB1XVnjc8INeregPK8hGAF/K06N0xw3pMHn8UDGJs2Jt5U7u9BZRV6UswMch55nzrEofOmOBM6Knb2tPx9qPmVt2qAXmM8LSS2MQPlB4puWtK0PLnDsPqYgBojWeH405QGrO/mi2FfLW95gcJMONjGFD+sc1sQKba8Gzg8U+5qLsFaYZ6zw48eaSER6fX9gVpYu9ofcnVyilDDL65VAa+Sivx6q1oleNxaMQi2cHMPlsNVHaQhTJhjTq4Y6HcqObF/qS4hdx3KiSJpx3ITECJfRsPrutVxg64X9GGLgYCPqds4JeBcnMDsIeS4lbZ+hR7SoCxG7RY5vJqdF5NFFmM+XN8SehJNCqccZGLN7AWhvzLWTzUIlcOO4rvNW1bhuZcGp5sUPz0RN2e3eZ3TjP2JMQpv6r8IpRL5roFcaIzy+2NcSN8Q3HQ/6MbeJ4f07RIMCSojzF7gjBOvtoOvTlFlLwMjhhvOCfuKDgHyAqdxnx6ChpynlAfogCqEFJvRyszii4+WSBPd5kEr4BGJk1eZZLbNjZ7i1EvNozEN4ExNkpKKtW5zk+z09bERI+XXA2xmCVtuRKu6qspUjRs4GrVunoNqH1tOV8n2YmAZcTFls19kr+2SzzdE92uowT0geirg3YghUxAQn0Z+nmtkovldiBUfsZiafaWJ4DGdvcbiDvfe4Lr/f9hc92+EZ751yjWCkHaQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc28bd9d-65e9-4ba2-9576-08db2fa56fc9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:59:39.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syB7b2tGKTTjfj7OPVkTjqjdNrf6LTRxGNnZPAQ0qvUm8uG0T3TwtI8fjXvqyAt6akUVwciWvjg+gOGi3jNJDdPLWutV8ijRaz6LUqFQ8dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4486
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280125
X-Proofpoint-GUID: cTaKxSuHCZ_weGk74MWYV3Z-JRAiwggE
X-Proofpoint-ORIG-GUID: cTaKxSuHCZ_weGk74MWYV3Z-JRAiwggE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Currently i386 QEMU generates MADT revision 3, and reports
MADT revision 1. ACPI 6.3 introduces MADT revision 5.

For MADT revision 4, that introduces ARM GIC structures, which do
not apply to i386.

For MADT revision 5, the Local APIC flags introduces the Online
Capable bitfield.

Making MADT generate and report revision 5 will solve problems with
CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 52e5c1439a..1e3a13a36c 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
 {
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
     /* Flags – Local APIC Flags */
-    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
-                     1 /* Enabled */ : 0;
+    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
+                     true /* Enabled */ : false;
+    /*
+     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
+     * if Enabled is set.
+     */
+    bool onlinecapable = enabled ? false : true; /* Online Capable */
+    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
+        enabled ? 0x1 : 0x0;
 
     /* ACPI spec says that LAPIC entry for non present
      * CPU may be omitted from MADT or it must be marked
@@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
-    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
                         .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
-- 
2.31.1


