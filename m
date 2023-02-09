Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA13A6912AE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 22:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQEZI-0002Ep-T4; Thu, 09 Feb 2023 16:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQEZE-0002Eg-Bv
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:34:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQEZB-000311-J4
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:34:56 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319Kikqg019218; Thu, 9 Feb 2023 21:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=UazMxrnreFTnEC5fT4kRf7xqjg291y7cI2z+7GZx/E0=;
 b=KBZmxvdXCAHIksjG5iuaV1D9p1zx+6/B0ssS5+zwdYtTXSO/oLETnoACx0EbvNAf1Lnb
 otd1lbm8X4EZYHCtDlhFtij8Ze/D324L9BjfosYbB3p3eIZ8V3AnLG32O3nfNzhuEb6V
 5gI9FkT4tt5UUZP7G9EkdFcHbRgrzE6/6sIq0DBDPsR8DiKLVUko8RqBK69Mueqzvc0s
 ynrXBK4rwfuDdPXLr9hbFSdtIQgQ4YQy/gRG1M7FPruiGhFemNTESvWD7OUxMy9Ewh7l
 Z9AtiAVClfS+vbY42Qp3Yf6hkmMvA6uNXjrfnqY1YcCf2KT/ESNnoSDm0j1g58CO1tIt lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nheyu411f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 21:34:47 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 319Jp6xY002980; Thu, 9 Feb 2023 21:34:46 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt9xjwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 21:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpS+hOXDZFf8SBDawSGvR4So7gYJxxvOXrq14ZcEDuuEDMKNt8bv/ElTOpAja7//suW+EAdr4N9s3IucfTAqOnPMA3S8S6xs+pNqGniw2gKDZSBUAOjjImjX+NaqS1jdmyaGN3Dky33BF+nEHTk2p3OBqNkY95+SqUL47UG8loPS09D1Iy+kptT9jFyI41jxgkPlec4zcrNx43/sv/PxsNlI00YrznZvzSfSgqspnN+x7cRp2E6VIXNEvQv5ph190gyfzeADLH/4cOoVLFMYa6iMTlEiRBp9W/rdFhyx6qi1QTVO/GDFWbwC+yoaWV9TJPRzFQqhTTZxVRXu9z2Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UazMxrnreFTnEC5fT4kRf7xqjg291y7cI2z+7GZx/E0=;
 b=GVqQ8pd3Q8up8fNiFI9jG+2WNNi/bh5vr4jZbtabdek87J8O95n0hV0Cz/ikqXW5uAdA1IM8W1rdB81YaqGgGmhFugPyRX66OYR7zqShl7rO4vG0ZFwQUF9fj/82NUMrYbrXbu0F2hnoKHqdKxT6xRsIM0IDKx/rmpzG7Bt26Xi8kFPkKInxT2KUxtNqlZLHEFMxFKECLLqm31BqwKywvYCdwtJjGiKWHuY41zq7TeLR7h1R9PuwlJqdf509clYML0InAINOnbvPatUrElAb+Qmcx1VpHEA7MiSg4/vyqHEklNEwuXEljz3zOIz9fNhER85EgchS6LGSd4hDBhTlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UazMxrnreFTnEC5fT4kRf7xqjg291y7cI2z+7GZx/E0=;
 b=BV8qmpQgLI30QXyta5Er9dskQpqFnc2fw/mCiBS8yKmQ5fYw0bRZ4Lcx5u7dF3EB52dX6VrHG7/zggpdKclvypMbS8OLKIXhYzVnM6215kN7uNZ5ppH+n63IoQq9nwEKLukitcpk+xwJyyKtFMClwOpfSuYcg3wTA4KIBfebSgg=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by BN0PR10MB5125.namprd10.prod.outlook.com (2603:10b6:408:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 21:34:44 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%8]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 21:34:44 +0000
Message-ID: <1bb65a74-d444-7601-47d3-290959239831@oracle.com>
Date: Thu, 9 Feb 2023 16:34:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com> <87h6vwnstx.fsf@linaro.org>
 <87cz6j6tt0.fsf@pond.sub.org>
 <d25846e4-13fd-c683-b5e1-1660f4470d35@oracle.com>
 <875yca23dd.fsf@pond.sub.org>
 <7beaf84a-008e-c9a3-3698-2a230196acf9@oracle.com>
 <87cz6izmtz.fsf@pond.sub.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <87cz6izmtz.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:806:a7::15) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|BN0PR10MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 6773c098-6d22-47e8-1d6b-08db0ae57595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPQso38eOUX9pma7DKwB+wnR3nAj20JUst/pHdEJui+rc+vlTomk6a8Vo7sN2p+qcmncxdyBVytngH+97Rn9FtFwSjt2F+Xrpzwii9cN7eBVnmyU0duckQAH2gmdX2OWJSWvT9EZY/ldQ5yTOu1Fwv0WuhDSAdayLtkUZfiZQiTeAs8TAkfVPDnFUlOWYlm1dt98FgeZFyOifwAAGY62C4bDJ1gs1A41W/Vrm4IyZ+JLFJRLz41rmc63FZjePV03el4HMsNzl9P3sVvWbnVn/b2KD/wjy6s12e1cVS3ekNjGJSZA0ceOjbq44/tF/oytV1ychEixawynJ+71k7ScrLO3bx2Rd3Rc8P4T/DFv57D9O4DKm9pb71l8TQONCQLxVEpdaL56CAkefKfs4y+QUvuTRHYS4ayN8ZBSzRHrwQ7HdF6KJOhpZoXUb0AeSak6xuQYgXA8O0NfFkpNm+vqkhZqVShV919S2vLXUChV+7CnvYbOCFYHbYtQBt5kI2c9WqbvoyrHvFDuPSzA5r8qGsPJ6FYLfxPXzS4XCokusnsSGRj/vFZTI2ObYLsbLZPY1orz7vAmWs115iLUf7PJEwYrScfbR0QHxB5aliQJd1UzqClGzYD/jB0rGNlEYQP8n5Vqyt9KBxyzYTp3DA3DpM9q/bJgiMx9aZkNn39bsqS8kZ54sKxu37nW2xmw13CRFIeUAiEK7A/8L+iRK0+uGCd7eJuIrbvD1OM17UqsCC4trPUrOe5Q/MwK6vte7AQBRFjdG1Cc70B4In3Qf7mO77YMzCIyaBSKseKteHqANiT2p9/s2cuoK10dyU93+uHz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199018)(26005)(186003)(6512007)(2906002)(38100700002)(316002)(31686004)(8936002)(53546011)(5660300002)(6506007)(31696002)(54906003)(83380400001)(2616005)(6666004)(86362001)(66574015)(66946007)(66476007)(36756003)(478600001)(6486002)(966005)(44832011)(4326008)(41300700001)(6916009)(66556008)(36916002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtuSFVTR0dNTmdQRFJad21SL2NXaTNhaVdaTUx5Nmw5bFpnUWdqOENDdzhR?=
 =?utf-8?B?UG1YdUhwNndKNWhHaDJRbzB6ZUdiYlg0dHZuRHAzQklKZkFqS0ZTcHR2bUNl?=
 =?utf-8?B?Vi9aYzFybFZvVGJTN0RuSjk1akZiZytsQVZMN0hOUG0wVlU5anNkUUlNRXlN?=
 =?utf-8?B?ZngvTGQ1M3NXU3JCZTNDd2dXSzB6bjVuS1FMTGtjaVM1ejcrc2I1UGZHVG1J?=
 =?utf-8?B?STV3MUMxZUVYamNJb0xMZ1BXc1hGWFpxNmpjMENIcDlETHNIaGRuTVRXOGdi?=
 =?utf-8?B?TTludTRXbE5hejJ1R2pMZE52YUV4ZmpwVExlaWQ1U2hPaGJTMW1NVVFoQkor?=
 =?utf-8?B?MU9uYU9pVHp0Z2J0aGt4VzNnRzNxbTZEb1RWQ2s0bWVCcmRiejFrNTF1OGFT?=
 =?utf-8?B?NnBmaFpDQmdaYmFENCtNQkYyMm5keE1XQ28vTWhJWXJ2Um1ESFNGeTlQU3RW?=
 =?utf-8?B?NVlDVk55UWFmbFp1OW9hZzVYd3hWYzE1OVk1dW0rOXRHM1pSR2tBd1ZqcnVM?=
 =?utf-8?B?L1FOTzUyOTB4L01GTjVCRFk5cW1lbmcwdnZRSGlyTURHeWNmZG0ySlQwQzY0?=
 =?utf-8?B?czc2K1pIT2p2a3VaSEFUTjl0TEM4WFhIaHZiaVAwWWtkQTZ6K3h5WW93QXRS?=
 =?utf-8?B?WHRsb1hTSHI4SDFtV0JnOHp1ZjY5STU4aUw1OHlIQXUvbVE0dk9uRWJnQUtj?=
 =?utf-8?B?NVdGNjVnRDc1YlQvQVF0QmkxdzZSeXE2SjVFNEF5YUJ4QjA1dExjUkdXZC9w?=
 =?utf-8?B?N3dhQVpkT2dEWVZPTm5pQ0IxeU43b3ozdW5PWFNqYTIyUlNRNnRoVVFaVE5k?=
 =?utf-8?B?aGRuUU5WalY0aXhKRWdXbHVLOEp5Z0grTVhub3pBb2lERDZpWlBza1RpOElX?=
 =?utf-8?B?bEZvSklZZFF6bEJrVmtwa3c1MnRDTUxaSzdkM0tCVGpWQmJHRmlNUDYwWStq?=
 =?utf-8?B?ams1T3dCcmNpWlVlUzIxRE1zc0sycUFUUW4wNW10dDdWL01BcGpoMVJmT2sx?=
 =?utf-8?B?L0NmRE1TUE9TQzZTVmFGeTFjcVB4M3RGd1gvc053Wks1WFlkZlZXZzJuaktH?=
 =?utf-8?B?UFI1WE9Rb2kyVW9ER2VlMTAvaHIyampJenkrbkZtVi9wcWtEMVhYajI4WjBY?=
 =?utf-8?B?bEtiQ2IwYUZLdW1PRWQvVURhNWhtdDBYalRjdDkwZWl1TVFEdUFUYXhuamJa?=
 =?utf-8?B?TEg1N1gzNzZsa2RoRExjMUc1b0VUYXZCRDJFTkpYRzNmZFFXQ0hrYVowUFhB?=
 =?utf-8?B?YnBYRjJqSDh2RU53NG0wTnRqRmtnMjR1cFJhd3JxTjNlWTJzd0VrQ1V0RElW?=
 =?utf-8?B?Z2NSb0kxZlUrYUJFRjlWWWhoSE9UMzdYQVU1SlFGTUhXaElyVG9DSngrMlBi?=
 =?utf-8?B?cHZPUGRndWxnYkF4YlR6VHFxdVdCSzhKUTZHOXFwYSthMllSZmUxZERCNS9E?=
 =?utf-8?B?MXI4Y3R2YVVYQkZpT3BFTm51bE5YOTcwNnZybys4YU14ZXhSbUpTeitJeWlJ?=
 =?utf-8?B?REh3czFielFHZDhNMzFnNWJEdEdkRzZ3NGxkUHAwZ0FWNXh3aGJBcFFDNTR1?=
 =?utf-8?B?Q1BvVlRXSjB5M3J5OE5HbXd5Qy9FRWpPTVFCMzNuOWZ3WWZZM1RUYjRqMmhQ?=
 =?utf-8?B?UUpMV29SNDZmNGk4WFZ1eW8vaFlqbFllOEJZMXhPMHpkUzZ1Tk9GWjUxeGVM?=
 =?utf-8?B?QTBZV2pIWVFDZGs1MFd0WFBYSXRqS2p5Q3huZ3dBdzJVRFJ0WG8wSTYyUys2?=
 =?utf-8?B?ZWxTSGs4eHliNVNKQmpJbnJHSFJ2cDAzWHl1TVFhSHZvZUZLVGs2Q2p0aUd6?=
 =?utf-8?B?OWZoc1M5a3lZNWlSdlBKNG9YaTVqajFNN2Y4SWJRL3JYTVpER2NKbzg0OHRv?=
 =?utf-8?B?NXBOVW5RczcvcHVrYVdTOTBrdGloa0JFdDBwaHgrU0lRR1gvNTY0bVhhL09x?=
 =?utf-8?B?TExNQ21mcmpac29RM0x1YVo4NUJRdHN6Y2lzZEtkZ2RjY242T1NIYzJkL2Fl?=
 =?utf-8?B?Q0crRFNianNOZXpXbm9ZUDkxZGNXRDRkNVhDNWhORTl3blkyT2lYQ1RPRVlR?=
 =?utf-8?B?amszUUZneHZwUndJYnRzLzNjYy9BVEt0L29OL2l5a0UvcUt5L3J3SHQ0REhO?=
 =?utf-8?B?WkNiRlJFVWcrWXlKQVQ0c3IyYThCSlBkcUxEM1JQVGwwaWU3c1FJNEVtWGN1?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +6Xcj1JkP4ba1h6gSYueAEl9Yf+Fo4LdtNvHmIUOxriOQ2MasQTEX2voJaBd9F+pna7eLEX0QM4dsUnfOauj9U0dS9BzGkAu+Oxj7AXpUULu3hSSDq8TzdAjIDpm4+k0TU+YWkB2sPBkzatT9blITRxV58iT+NMimPzWjSDRMb4RXLkBHFo0s9eoV9kGqMLp+fF7n4Sopp4R7YdUpxxutuGmkxH3UQzHq0TiNUaWoRAE8bbpcqpLpVXbMAXUmIPWmseDHekN9mzU5nNE/SiV/kYEDoQ7w3S3GxKBRjXzcwMdoFt9TfU8MGsx91phJmg0LwnIvIYcwNwbwWooNBvCepy2wCwuT6qLpKlO8fQCS1mBogeLjqwtL1EqnORXhgUETLBJ0xtnwHrVZHNapokfoOLEk0ObmV6P+kD1Hra+d1dPKD/qGpEWuxUqs2Z8yAQoWR0pBiVG/81px6VY5zwzqIMWFXVaeAB9pXltAgTvKAV97H6iMsznpffri4Ze4cQklJxZSncoqleBlFlgh2WBlz5TY/0mM3pynErqSJ4+rkpBatL3Z3wyafB5J/r4068hjLNJtzB4QZa3Y9Tq40OHcSLUFdNy/MT5szpo8A1uuWpjJVmVmx0krOPXNAXyfRDW6ZiLEtI6DegIYlf/AYijH6VLied80UYnItMY+0rdyj8FGmFFjzLcFQeR8+VDi6rDpNVpGl2+W5DYmYkFPUerU0dsgQj/Y8dVBma/MSGQj3zu/fGDN4loZSsDulRkoMeVz9BkVfPqQsH6cwTK6hCaZxBvFzyETKzKis2rgOSvRQg9iwOOMaZFmBcwLn1TmUoTzKXj3PdkSYx565ayvkMMISQVgHj7yxDJnXG2NVILcWs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6773c098-6d22-47e8-1d6b-08db0ae57595
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 21:34:44.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAbo6RqUSUpWO9oUph9TJZF4WFtEaJQpyuU4wgAJBiCxsd/7zgAmCjTYIKl9iJEoGFoDjcj4XZ8WkO9PVoz2RB6rW0Om21uKch/7CcG8a7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5125
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090196
X-Proofpoint-GUID: q0n1GvMR-MZqsMRvkQ0OhTuVFuVh5_cT
X-Proofpoint-ORIG-GUID: q0n1GvMR-MZqsMRvkQ0OhTuVFuVh5_cT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/9/2023 1:59 PM, Markus Armbruster wrote:
> Steven Sistare <steven.sistare@oracle.com> writes:
>> On 2/9/2023 11:46 AM, Markus Armbruster wrote:
>>> Steven Sistare <steven.sistare@oracle.com> writes:
>>>
>>>> On 2/9/2023 5:02 AM, Markus Armbruster wrote:
>>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>>
>>>>>> Steven Sistare <steven.sistare@oracle.com> writes:
>>>>>>
>>>>>>> On 2/8/2023 1:43 AM, Marc-André Lureau wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>>>>>>
>>>>>>>>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>>>>>>>>> as strList_from_string(), and move it to qapi/util.c.
>>>>>>>>>
>>>>>>>>> No functional change.
>>>>>>>>
>>>>>>>> The g_strsplit() version was a bit simpler, but if you want to
>>>>>>>> optimize it a bit for 1 char delimiter only, ok.
>>>>>>>>
>>>>>>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>>>
>>>>>>> Yes, and it saves a malloc+free for the array.  Small stuff, but I
>>>>>>> thought it worth a few lines of code.  Thanks for the speedy review!
>>>>>>
>>>>>> But is the HMP path that performance critical? Otherwise I'd favour
>>>>>> consistent use of the glib APIs because its one less thing to get wrong.
>>>>>
>>>>> The patch reverts my recent commit 0d79271b570 "hmp: Rewrite
>>>>> strlist_from_comma_list() as hmp_split_at_comma()", with a different
>>>>> function name and place, and an additional parameter.
>>>>>
>>>>> There is no explanation for the revert.
>>>>>
>>>>> An intentional revert without even mentioning it would be uncourteous.
>>>>> I don't think this is the case here.  I figure you wrote this patch
>>>>> before you saw my commit, then rebased, keeping the old code.  A simple
>>>>> rebase mistake, easy enough to correct.
>>>>
>>>> Hi Markus, I am sorry, I intended no slight.
>>>
>>> Certainly no offense taken :)
>>>
>>>>                                               I will document your commit
>>>> in this commit message.  And in response to Alex' comment, I will use your
>>>> version as the basis of the new function.
>>>>
>>>> For more context, this patch has been part of my larger series for live update,
>>>> and I am submitting this separately to reduce the size of that series and make
>>>> forward progress:
>>>>     https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
>>>>
>>>> In that series, strList_from_string is used to parse a space-separated list of args
>>>> in an HMP command, and pass them to the new qemu binary.
>>>>     https://lore.kernel.org/qemu-devel/1658851843-236870-16-git-send-email-steven.sistare@oracle.com/
>>>>
>>>> I moved and renamed the generalized function because I thought it might be useful
>>>> to others in the future, along with the other functions in this 'string list functions'
>>>> patch series.  But if you disagree, I can minimally modify hmp_split_at_comma() in its 
>>>> current location.
>>>
>>> I'm fine with moving it out of monitor/ if there are uses outside the
>>> monitor.  I just don't think qapi/ is the right home.
>>
>> I don't know where else it would go, as strList is a QAPI type.
>> include/qapi/util.h already defines QAPI_LIST_PREPEND and QAPI_LIST_APPEND, so it
>> seems like the natural place to add qapi strList functions.  I am open to
>> suggestions.
> 
> What about util/?  Plenty of QAPI use there already.
> 
> Another thought.  Current hmp_split_at_comma() does two things:
> 
>     strList *hmp_split_at_comma(const char *str)
>     {
> 
> One, split a comma-separated string into NULL-terminated a dynamically
> allocated char *[]:
> 
>         char **split = g_strsplit(str ?: "", ",", -1);
> 
> Two, convert a dynamically allocated char *[] into a strList:
> 
>         strList *res = NULL;
>         strList **tail = &res;
>         int i;
> 
>         for (i = 0; split[i]; i++) {
>             QAPI_LIST_APPEND(tail, split[i]);
>         }
> 
>         g_free(split);
>         return res;
>     }
> 
> Part two could live in qapi/.

Works for me.

For future reference, what is your organizing principle for putting things in 
qapi/ vs util/ ?  I see plenty of calls to g_str* functions from qapi/*, so I 
don't know why removing g_strsplit changes the answer.

Per your principle, where does strv_from_strList (patch 3) belong?  And if I
substitute char ** for GStrv, does the answer change?

- Steve

