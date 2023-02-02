Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC2D687503
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:22:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNS29-0000Cc-MI; Thu, 02 Feb 2023 00:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS23-0000CD-9M
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS1w-0003gy-Ta
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:11 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124hvat023776; Thu, 2 Feb 2023 05:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=FWjhEAHFy/wgVkmC61OiaN6QBSet4l0JJvAWAqrJv5o=;
 b=rhZqwLpLTH55GDI0nSl5xU6lFDC6GV+H5issXG8wBv5286nZF9d39IA8o+lLFNiAU1bm
 F2i1D/8KoE0K+Dc/ZcWfFHCstHv3qNlDgX199PhQMyIwCWn0VQz4T80qeXOwwQu9XRaO
 vHCw2ar5owzJxX6KU9KTDyX+8fSxja5EWgqgXaFyXOWwLAcIazbZo5YxZTKqaut96Zi+
 D3jCk8TFzcZBW/1AQ+1ser+1KxWCG7J0IrVEsuC9kTu2Xb3wYBuJNuHyFvqtuIzUTPRL
 VdG9LrDLmC8vMZD21/dHw+fEbj/aZSNYigOSsdhZYpex3QS4eL0CFTyg1yqeWpKHJzso WQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkd1tees-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:20:55 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3122jJ92003647; Thu, 2 Feb 2023 05:20:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5fn38v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXvGw7htSXKW+c4VTih1+9ftm0+J1rrZxEb5vPlU1g1Et0p9dEJcP8t6OAwSEimW5klao6QS06ykUU/Zh9Qk8rEvC2106NWXdsTCJrye1tnYkIi849KdoLOzxXYbZa4naU35sKWvgdw1qGdtflUgluj5Iwqvr7WI0BlpIjoqiBEnDKBGgXeMSpGBLN1bSXjY7GYremB3Kc7vdycNYcf3aqzWU4/MHCDdfn3Wk7/T7dBQKR7k+Rl0D3eqIPt8Qnwh7NZ7U59r1PUtDnA4YuPeppX7yFGtfZkdebmbWrW8JtaEUVLG1KPSqhooNYTE5keNkt0tGVEJ7lPA7M/gbglKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWjhEAHFy/wgVkmC61OiaN6QBSet4l0JJvAWAqrJv5o=;
 b=kzYW7KhUWgGZVJyLx0zz0O7YfL8qgLK10mgxujoi1q04KWpJWnPXFyFrwUKyGyFh2otOMVCKlUlmXBTbq8zBS/tnhFi2HQH5hCypvMtE/qZlnlfXHM+tVNySFlMq6IlyCSjlVJE/e0yEDL48PUm5U9wvR/0h2Xj1XoWOPDwiXva+nWPFpLCxzqGoMgncH/1zc/wLrSZEz6t7uAO8SvD9Xf5Y6dORsZ2ElIhg5BUIfLbcJwhm12fgL1vditrxUx4QW+BYWgIx3gCagMMR2LD4zCc/BouVx3cztkOBsO5cTCyY3Qc8/qHKWtpmx7flVSpUh67Dyi5s+bqrWbmrDnQTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWjhEAHFy/wgVkmC61OiaN6QBSet4l0JJvAWAqrJv5o=;
 b=LFuz+HE8IuHpMRbRk0n318p5ma/HPBqEc2JrJFlTdxWOV7K5KLAD+gpS9h3riLeaz+bQuhrJvZpCZvsrboCiri/e2dkfoG9COIbwdgZXMGpyH23YY6Crnxhu51zAeLhui35Yu2Twf0dQljysfFbryWg0C5bmp8G3dU5+PmdeIYw=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 2 Feb
 2023 05:20:52 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730%3]) with mapi id 15.20.6043.016; Thu, 2 Feb 2023
 05:20:52 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 00/24] vfio-user client
Thread-Topic: [PATCH v1 00/24] vfio-user client
Thread-Index: AQHY86IUhliLUK9YBk+jncZEVpfj3q5wnI8AgEsIZ4A=
Date: Thu, 2 Feb 2023 05:20:52 +0000
Message-ID: <8BAEF753-704F-400E-83D9-60D0F301A14E@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <960a864e-77d9-1a4e-89af-61c4a391d663@redhat.com>
In-Reply-To: <960a864e-77d9-1a4e-89af-61c4a391d663@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|CO1PR10MB4531:EE_
x-ms-office365-filtering-correlation-id: 907686f4-28c9-4bf0-46cb-08db04dd40b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpsKaGQM+GV5c3PBNpPv6mdY2B4n9RfL3OpZVpEWN9eS2DfVW55ByytxVhjflTiIqV3NWNnU7FC3Ug1GYp/ANLRw+tE+RoUDFNZAxWnyhaXJzjqox3Z764qtg/z2m6OWCTxnCPq+4o9rbM6FWFlSzx2vvhNskONmDUhT9KcczNvk0Cgqfj7rpRz9JUFo0INiH51CpIfIe8cpQ3ECckyNhJ7M8T/5rnp/riWvAKTWhZhIzhoCtLYC2yWVc18xrMhn0e+RYAUR2+iRRHkEhW07Cko9pvpCm0xahzR+L4kSIZ/lCPMim8UqCYBCnd0NI2c933UgHlJeowhQLM/hP0mwf7QgumY4DQZHL4un6a0+QbhWd1b/w5l9n0yl3jvpvNE1n1iDVKTb1SdRpxgSjAcgzIiZnkQm4IkQnP+byEJhJz6iQFA0HoLgqa5izzfBebZ1FwygRK2c56EOTEYveNHHSf24deWPMhTtrIQZGdawP04vGwVA1VVj0U8dpxggs8KrWJXuhL4vKGqCDfi+nOUSkSSRYPik46Jwy6F+CpEhYvbfoEB07pFmbWpPTSvjt0PT6Ii+G3hkUW1R+jT2psTBktNih+O6nXpyJOkab8dFd3YbglCv6Zs+s+Ozi3BLhpFjR/MELvFWoWROCF+588pEhro1N7DIshCAaMeRkEXHPzPo2ltZJTQX1NtIRZaBRVvxaMnQMHwx8CscjxEgDad/OuvI9wbBtUFClfSB0xQLoXtQESvBdppiIihRjAs5DVd78ntIv4PU8AWa+UkbpJrm6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(36756003)(76116006)(66446008)(66556008)(66946007)(66476007)(38100700002)(4326008)(6916009)(64756008)(83380400001)(8676002)(122000001)(316002)(6506007)(53546011)(26005)(186003)(6512007)(33656002)(6486002)(5660300002)(478600001)(66574015)(86362001)(41300700001)(38070700005)(2616005)(71200400001)(8936002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkwwYVd3cFhaY3UweURvejNyRHBBcGp3dEFuRlA5OU1vQVNPcFdwZlpHMUcy?=
 =?utf-8?B?US9NZjZhWW9vdVZqNGpvQ3ZKVUM4V1k5QUVnSFNiVnNVNndXRlVtbXVpQXBZ?=
 =?utf-8?B?S3VtYTJQSlFSc3huQ1Y2VUR5NStpaTVqRGdSVDVrZ3RkQzBUL0RHbGQraG41?=
 =?utf-8?B?ekJnLzhYY0hLeFRRd0VRNzdJMkRDSXEzcWtaOHhZSU5rRnB1emRjcGZ6MDVp?=
 =?utf-8?B?YWRWMEt3TTN2c3FvclphbWs3N1B5SEFrY2hWV3ZhelZEa1RnVFFYejcwVGx2?=
 =?utf-8?B?MzM3Um1lR2NDN3JCNmt3MFY2ZVF5a1ZpNUZmbUtIa3p6bGJIL29QbnJjYTdi?=
 =?utf-8?B?bmIzQUJFc3ZaZEUrS1dJMm00b0Y4VE1hMS9kZitub2Z2NHRtN0MzaWkwajhJ?=
 =?utf-8?B?RVVBUXBHSFl1NS84NU9VMEpxa1E5QWUzY3BJdnNkTGdvRzdMeURaL0xQYlNR?=
 =?utf-8?B?T0tPckdTZlBTY3FCdkRyTUlmS01ZMjJRZjN2QWdKQjBzOHUxd1B2WUhUOGZk?=
 =?utf-8?B?QnRhMU9vYXpzbngzU3BzODBZSnZLSlBrdEZyMFVXbDh0UzJNY2YycUlPSllY?=
 =?utf-8?B?N3U5MUVBZ283QnluSDF5NGtPLzRJaW5CZUZhM3UrZ0ZLSHZEdFNmQTErWEcv?=
 =?utf-8?B?WG1sZ2ZEOURtWW5NUHNjcTFqTEI3WndBb1VoeTJkVFRRYXROVXZUbFdVTnVW?=
 =?utf-8?B?OCtsYkxLdlhqVUtRVExEVkN4WllvYWJ4UU0yM0tmK2dBTmpoQVFUajRjU1Y1?=
 =?utf-8?B?aXNXeHJsWkxzbVRTU2VKMmRTQ0N5SHFLT3VROVdNQVNTZEFyams3MmQ5NjFL?=
 =?utf-8?B?UEJGeSttNW0vWGRlck1IdUxETVd4dXdhYXBVSFNmemI0a3RDYzdlZXprSDhk?=
 =?utf-8?B?NUlROE0rajRTTUcrdGkvK3hvbHROUmNSR0l1aXprTzBYNmxSWHpGMWlycFhs?=
 =?utf-8?B?eGxwa2c3MkFGZVNKMk9QcEhxMGp6L1JacEFSSzBEeUZValNLbWphTnNQLzAz?=
 =?utf-8?B?Kys5VEdOQ1pPTlRSclhwR3dYWXlpVTJMMmtHcnVVMjdEVEkvdUd0OEdXOFhs?=
 =?utf-8?B?N3QxVFg1WUQ4blFUU2Q1SEpIQmlyL1oyL1lqaVdLa0VSbkNOVmQyUXR5dkFa?=
 =?utf-8?B?RHFZeE5yVU1hc2pYOFp1SFI1WVNTU3ZrM08vaWIxaVBTQmppUjhwaVdzV210?=
 =?utf-8?B?cWxNU0xJTkU2dlVLYStBKzZZNXBLb1NOUitMNE9NQzF6bVpyWXd4ZHNsWTlF?=
 =?utf-8?B?Mk9VRHZ0ZGRvL3JFbmVGN2g3NVU5YzNJTDA0djQ2QnNKSTBxVHNqa3JqcGdh?=
 =?utf-8?B?Q0FSYlYvd3pLZmtKNHg4SEw2MUp4UUtGVUdqbWVNNXB6d2doZ2FkdllzemFo?=
 =?utf-8?B?cTAycXp4NVFKQnB3OXR6OEtiUTNZMVlPNkJFNHhrdnY0VU0vSURaVUlvbzBY?=
 =?utf-8?B?T2dDSHJLbnF2eFArdVZrSHM3VlFZL3R2MnB5Sm5HZUxMS05XU28xeVhkNWww?=
 =?utf-8?B?dUhPVmVGUUEyUGJnS0FTL1A1VUEyeWFsUTdxaDRaeU4venBEcE1idnA1bGo3?=
 =?utf-8?B?S3FEYTVBNkJvMlRndWRscEFZWS9XZFFHbUx6ai9pM05jQ3N3bXhVY2VwckVu?=
 =?utf-8?B?ZWpsNGljaWdmN01nNWNRNXBtK0VpMHBjeWVMVVpRblA2RzZ1ZjkwMEYzYXpX?=
 =?utf-8?B?Ryt5MGc4R0hwNlRveXh0eDRyQyt1VEFGbGFWOE90TXhvb2l4NmNqZUtpa3RE?=
 =?utf-8?B?bTA1bGk5dWo0YTI3ZWRHWXBmajJVVjBwQUNTcTRNbldRMVhldTRjc3R6aG1K?=
 =?utf-8?B?MmxONHNiOENaMEpMcE5qWnIrZmJpWmI0eEcySWpGOFJUNTNjVy9YMDMyS3lw?=
 =?utf-8?B?dnRnVkFOdElxT3c1SlNMWFhEREJvdTFEYlVYUWtvcmFISmNvanVyMytKRk1B?=
 =?utf-8?B?RjE4V01oT0VHQ3NBem9XVTV3RkYzWmRwZVgvOHpkb2lOTkl1TDZiQlY1OXZy?=
 =?utf-8?B?MlFIUnJnT1NLWlhqNEhYZm9tazZJYjAzODZvcyszUGhyWGYzYngrRGRtMFQv?=
 =?utf-8?B?bmpiY1ZJZFRSckNNUHMweHcxR3BxWExTLy9SRG1ubnJicTBkeHFFNllWYTVh?=
 =?utf-8?B?NFZUNmQ3TllMV1FRSEhSZU43aHVLbGdSR1lwVkNZd1pKSWViU0hhR20yQVp4?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A18BBDB4B3F7D43B6B6209B337A48AF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2WAGm4lQ11yUZnF81+4MSq/Na//9KNc1UP9Ss4WMdRj4Xyp//PqADaKvUGPVcO1FDkVacRm6yAw8J0BQ+Yt3O8LY6yq3eC+Ieh6tdLCjvq8lymOf4tkoBfRTTMTmS6PCoD5A0VpXoPUA5ri7r4kZLDd4rcptXkzD8WWSESl/8bLRoZRXN3tZscc9jADK8RE+WMyqirZ3u7c3JswQ9xfHEVGPbxhBUqprhjTMbLevp359tdze6eSGZXeqJF/seqNoIsYaQtU3K6hDIQp0qdY0QehRiJ25e4DYIOy4xlg2VBGqzfLU8SjjwwXSy1uXvkN7DzNz8gLHgJ2m4sLOATtokjkd7TVLMgGH9XOMnnFGyIINJt85BdBGQKuMRpOuh+Jbl63CmkvKVERbMAchjrdYZUPR8H/boVH9fHyivd9Hx0y+8qm1hBqVKF6JrEWJx5y0AKd/jVaLoCK/hHMyycV2iUoGWmn7Djm9SLrbO9hgMjAJ1zywR2jL0LkyAe8ITXVYkknEgmfGkAVFN8jPV+1jywFW7vIYb6jhkWNAgJ34JD42x14huVT/CU61gTfMMCw1AMmGHH0tr1rTWo9N6uz5q9ZxHb37tI7ypFRwFsW5nVI+uDCjvVcAA66f9HOVTp+2YeyuxKuoG/4DA6rQHL/PIm/cWd5DJy6uJwz0SjFKeceRjU9ogl5bojXGFV6SssNG8v/cs8JmLNDMQIUYMHGwkAz2S3dVnwSueWZRbLUvCmwKas0StMHLoBMks5lNeJsWyhHt3ShWpVYs5K8+dUG2TQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907686f4-28c9-4bf0-46cb-08db04dd40b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 05:20:52.2871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIsYkpft8xl2PybmmSumg5PlJ7CrLmXDdryM93t/eJtwgniZB3AVhR0mCFhYJFZSS3VTDoOXLqjiyjE3nRWyA+O/VunxiYbuP9HZKyg9Ksk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020048
X-Proofpoint-GUID: CPEJ4qa-DETZN4q00Kk2flUOd_XDi3LM
X-Proofpoint-ORIG-GUID: CPEJ4qa-DETZN4q00Kk2flUOd_XDi3LM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

DQoNCj4gT24gRGVjIDE2LCAyMDIyLCBhdCAzOjMxIEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEvOS8yMiAwMDoxMywgSm9obiBKb2huc29u
IHdyb3RlOg0KPj4gSGVsbG8sDQo+PiBUaGlzIGlzIHRoZSA2dGggcmV2aXNpb24gb2YgdGhlIHZm
aW8tdXNlciBjbGllbnQgaW1wbGVtZW50YXRpb24uDQo+PiBJdCBpcyB0aGUgZmlyc3QgcGF0Y2gg
c2VyaWVzICh0aGUgcHJldmlvdXMgcmV2aXNpb25zIHdlcmUgUkZDcykNCj4+IEZpcnN0IG9mIGFs
bCwgdGhhbmsgeW91IGZvciB5b3VyIHRpbWUgcmV2aWV3aW5nIHRoZSBSRkMgdmVyc2lvbnMuDQo+
PiBUaGUgdmZpby11c2VyIGZyYW1ld29yayBjb25zaXN0cyBvZiAzIHBhcnRzOg0KPj4gIDEpIFRo
ZSBWRklPIHVzZXIgcHJvdG9jb2wgc3BlY2lmaWNhdGlvbi4NCj4+ICAyKSBBIGNsaWVudCAtIHRo
ZSBWRklPIGRldmljZSBpbiBRRU1VIHRoYXQgZW5jYXBzdWxhdGVzIFZGSU8gbWVzc2FnZXMNCj4+
ICAgICBhbmQgc2VuZHMgdGhlbSB0byB0aGUgc2VydmVyLg0KPj4gIDMpIEEgc2VydmVyIC0gYSBy
ZW1vdGUgcHJvY2VzcyB0aGF0IGVtdWxhdGVzIGEgZGV2aWNlLg0KPj4gVGhpcyBwYXRjaHNldCBp
bXBsZW1lbnRzIHBhcnRzIDEgYW5kIDIuDQo+PiBUaGUgbGlidmZpby11c2VyIHByb2plY3QgKGh0
dHBzOi8vZ2l0aHViLmNvbS9udXRhbml4L2xpYnZmaW8tdXNlcikNCj4+IGNhbiBiZSB1c2VkIGJ5
IGEgcmVtb3RlIHByb2Nlc3MgdG8gaGFuZGxlIHRoZSBwcm90b2NvbCB0byBpbXBsZW1lbnQgdGhl
IHRoaXJkIHBhcnQuDQo+PiBXZSBhbHNvIGhhdmUgdXBzdHJlYW1lZCBhIHBhdGNoIHNlcmllcyB0
aGF0IGltcGxlbWVudCBhIHNlcnZlciB1c2luZyBRRU1VLg0KPiANCj4gVGhhbmtzIGZvciB0aGlz
IGNvbnRyaWJ1dGlvbiwNCj4gDQoNCglUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGltZSB0byBy
ZXZpZXcgaXQNCg0KPiANCj4gVGhpcyBpcyBhIGxhcmdlIGFuZCBjb21wbGV4IGZyYW1ld29yayB3
aGljaCBsb29rcyBxdWl0ZSBtYXR1cmUuIFFFTVUNCj4gd291bGQgbmVlZCBpbXBsZW1lbnRhdGlv
bnMgb2YgcmVtb3RlIGRldmljZXMgdW5kZXIgY29udHJpYi8sIHByb3ZpZGVkDQo+IGFzIGV4YW1w
bGVzIGZvciB0aGUgUUVNVSBjcm93ZC4gVGhlc2UgYXJlIGltcG9ydGFudCB0byBzaG93IHBvc3Np
YmxlDQo+IHVzZSBjYXNlcyBhbmQgYWxzbywgdGhleSBjb3VsZCBwb3NzaWJseSBiZSBydW4gZm9y
IG5vbiByZWdyZXNzaW9uIHRlc3RzDQo+IGRvbmUgYnkgbWFpbnRhaW5lcnMgYW5kIGRpc3Ryb3Mu
IGUxMDAwZSBpcyBxdWl0ZSBwb3B1bGFyLCBpdCB3b3VsZA0KPiBiZSBhIGdvb2QgdGFyZ2V0LiBJ
dCBjb3VsZCBiZSBhIHNpbXBsZXIgZGV2aWNlIHRvIHN0YXJ0IHdpdGgsIGJ1dCB3ZQ0KPiB3b3Vs
ZCBuZWVkIHRvIGNvdmVyIHRoZSBiYXNpYyBmZWF0dXJlcywgSU5UeCwgTVNJLCBETUEsIGV0Yy4g
d2hlbiB0aW1lDQo+IHBlcm1pdHMuIFRoZXJlIGFyZSBzYW1wbGVzIHVuZGVyIGxpYnZmaW8tdXNl
ciBhbmQgSSB3b25kZXIgaG93IHdlDQo+IGNvdWxkIGxldmVyYWdlIHRoZW0uDQo+IA0KDQoJQSBR
RU1VIHNlcnZlciBwYXRjaCBpcyBhbHJlYWR5IHVwc3RyZWFtLCB3aGljaCBhbGxvd3MgUUVNVSB0
bw0KYWN0IGFzIGEgdmZpby11c2VyIGRldmljZSBzZXJ2ZXIuICBXZeKAmXZlIHRlc3RlZCB3aXRo
IHNvbWUgZGlzayBkZXZpY2VzDQoobXB0LCBsc2k4OTUpDQoNCg0KPiBVbml0IHRlc3RzIHVuZGVy
IC90ZXN0cyB3b3VsZCBiZSAocmVhbGx5KSBnb29kIHRvIGhhdmUuIFRoZXNlIHdvdWxkIGJlDQo+
IHJ1biBieSBDSS4gWWVzLCB0aGlzIGlzIGEgbG90IG9mIHdvcmsgOi8gYnV0IHZlcnkgaW1wb3J0
YW50IGZvciBRRU1VDQo+IHN0YWJpbGl0eS4NCj4gDQoNCglXZSBoYXZlIGFuIGF2b2NhZG8gdGVz
dCB1c2luZyBhbiBtcHQgZGlzayBjb250cm9sbGVyIHRoYXQgZGlkbuKAmXQNCmdldCBwdXNoZWQg
d2l0aCB0aGUgc2VydmVyIGNoYW5nZXMgc2luY2UgdGhlIGNsaWVudCBpc27igJl0IHVwc3RyZWFt
LiAgSeKAmWxsDQphZGQgaXQgdG8gdGhpcyBwYXRjaCBzZXJpZXMuDQoNCg0KPiBUaGUgInNvY2tl
dCIgbmFtZSBwcm9wZXJ0eSBpcyBub3QgdGhlIHByZWZlcnJlZCB3YXkgaW4gUUVNVSB0byBkZWZp
bmUNCj4gYSByZW1vdGUgcGVlciB0byBjb250YWN0LiBJcyB0aGVyZSBhIHBvc3NpYmlsaXR5IHRv
IHVzZSB0aGUgY2hhcmRldg0KPiBpbnRlcmZhY2UgaW4gc29tZSBzaW1wbGUgd2F5ID8gSSBhbSB0
aGlua2luZyBhYm91dCB0aGUgY29tbWFuZCBsaW5lDQo+IGludGVyZmFjZSBhbmQgdGhlIGludGVn
cmF0aW9uIHdpdGggbGlidmlydC4NCj4gDQoNCglJIHdhcyBhc2tlZCB0byBsb29rIGF0IHVzaW5n
IHRoZSBzb2NrZXQgY29tbWFuZCBsaW5lIHBhcnNlciwNCmJ1dCBpdHMgdmlzaXRvciBmdW5jdGlv
biBkb2VzbuKAmXQgd29yayB3aXRoIGRldmljZSBwcm9wZXJ0eSBsaXN0IG9wdGlvbnMsDQpzbyB0
aGUgY29tcHJvbWlzZSB3YXMgdG8gdXNlIGEgU29ja2V0QWRkcmVzcyBhcyB0aGUgYXJndW1lbnQg
dG8NCnZmaW9fdXNlcl9jb25uZWN0X2Rldiwgc28gdmZpby11c2VyIGNhbiBiZSBjaGFuZ2VkIHdp
dGhvdXQgbXVjaCB3b3JrIGlmDQp0aGUgdmlzaXRvciBjaGFuZ2VzLg0KDQoNCj4gTW9yZSBjb2Rl
IHNob3VsZCBiZSBpc29sYXRlZCB1bmRlciB0aGUgKnVzZXIuYyBmaWxlLCBldmVuIGlmIHRoYXQN
Cj4gbWVhbnMgZXhwb3J0aW5nIGRlZmluaXRpb25zIG9mIHJvdXRpbmVzIHdoaWNoIGFyZSBsb2Nh
bCB0b2RheS4gSSBkb24ndA0KPiB0aGluayB0aGUgI2lmZGVmIENPTkZJR19WSU9fVVNFUiBpbiB0
aGUgdmZpbyBmaWxlcyBhcmUgc29tZXRoaW5nIHdlDQo+IHdpbGwgd2FudCB0byBtZXJnZS4NCj4g
DQo+IFNvbWUgcmVuYW1pbmcgdG8gYmUgZG9uZSwgbGlrZSBLZXJuIC0+IEtlcm5lbCwgZXRjLiBu
b3RoaW5nIG1ham9yLg0KPiANCj4gSSBhbSBub3QgY29udmluY2VkIHRoYXQgdGhlIG1hY3JvcyBo
aWRpbmcgdGhlIFZGSU8gYmFja2VuZCBJTyBvcHMgYXJlDQo+IHVzZWZ1bC4gSSBldmVuIHJlY2Fs
bCBzb21lIHBsYWNlcyB3aGVyZSB0aGUgdmZpby11c2VyIGltcGxlbWVudGVkDQo+IGhhbmRsZXIg
Y291bGQgYmUgY2FsbGVkIGRpcmVjdGx5IHdpdGhvdXQgY2FsbGluZyB0aGUgdG9wIHJvdXRpbmUg
Zmlyc3QuDQo+IEFueWhvdywgaXQgd291bGQgYmUgYmV0dGVyIHRvIGJlIGV4cGxpY2l0LCB0aGUg
bWFjcm9zIGRvbid0IGFkZCBtdWNoLg0KPiANCg0KCUkgaGF2ZSBhIHBhdGNoIHNlcmllcyB0aGF0
IHJlbmFtZXMgdGhlIHN0cnVjdCB0byB5b3VyIHByZWZlcmVuY2UNCmFuZCByZW1vdmVzIHRoZSB2
aXJ0dWFsIGZ1bmN0aW9uIG1hY3Jvcy4gIEl0IHdpbGwgYmUgb3V0IHNob3J0bHkuDQoNCg0KPiBU
aGVyZSBpcyBhIGxvdCBvZiBjb2RlIGR1cGxpY2F0aW9uIGZvciB0aGUgSU9NTVUgc3VwcG9ydC4g
RGlkIHlvdQ0KPiBjb25zaWRlciBpbXBsZW1lbnRpbmcgYSBWRklPR3JvdXAgY2xhc3MgdG8gc2hh
cmUgdGhlIGNvbW1vbiBiZWhhdmlvdXIgPw0KPiBNYXkgYmUgdG9vIGVhcmx5LCBidXQgdGhpcyBp
cyBjZXJ0YWlubHkgc29tZXRoaW5nIHRvIGtlZXAgaW4gbWluZC4NCj4gDQoNCglJIGRpZCByZWZh
Y3RvciB0aGUgSU9NTVUgZ3JvdXAgY29kZSBzbyB2ZmlvLXVzZXIgYW5kIHRoZSBrZXJuZWwNCnZl
cnNpb24gY2FuIHNoYXJlIGNvbW1vbi5jIHJvdXRpbmVzLiAgSSBob3BlIHRoaXMgaGVscHMuDQoN
Cg0KPiBUaGUgbXNnIHJlY3ljbGluZyBmZWF0dXJlIGxvb2tzIG5pY2UgYnV0IGlzbid0IGl0IGFu
IG9wdGltaXphdGlvbiA/DQo+IA0KDQoJSXQgd2FzIGRvbmUgbW9yZSBhcyBhIHBsYWNlIHRvIGhv
bGQgYnVnIGNhdGNoaW5nIGNvZGUgdGhhbiBhcw0KYW4gb3B0aW1pemF0aW9uLiAgZS5nLiwgSWYg
SSBtaXNwbGFjZSBhIG1zZywgSSBjYW4gdXN1YWxseSBmaW5kIGl0IG9uDQpmcmVlIGxpc3QuDQoN
Cg0KPiBNb3JlIGdsb2JhbGx5IHNwZWFraW5nLCBmb3Igd2hhdCBraW5kIG9mIGNyYXp5IHNldHVw
IHRoaXMgZmVhdHVyZSBjb3VsZA0KPiBoZWxwIHVzIHdpdGggPyBJIHdhcyB3b25kZXJpbmcgaWYg
eW91IGhhZCB0cmllZCB0byBpbXBsZW1lbnQgYSByZW1vdGUNCj4gZGV2aWNlIG9yIGJyaWRnZSBp
biBhbm90aGVyIFFFTVUgcHJvY2VzcywgZm9yIGluc3RhbmNlLg0KPiBcDQoNCglXZSBhcnJpdmVk
IGF0IHRoaXMgc2V0dXAgZnJvbSBhIEtWTSBmb3J1bSBpbiAyMDE5LCB3aGVyZSBzZXZlcmFsDQpn
cm91cHMgd2FudGVkIHRvIGRvIGRldmljZSBlbXVsYXRpb24gb3V0c2lkZSB0aGUgVk1NIGZvciBz
ZWN1cml0eSBhbmQNCnBlcmZvbWFuY2UgcmVhc29ucy4gIFdlIG1lcmdlZCBhIGNvdXBsZSBwcm9q
ZWN0cyB0b2dldGhlciBpbnRvIHZmaW8tdXNlci4NCg0KCVRoYW5rcyBhZ2FpbiBmb3IgdGhlIGZl
ZWRiYWNrLg0KCQkJCQkJCQlKSg0KDQo=

