Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C743FFFB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:59:56 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUIM-00047e-UB
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgUH7-0003PL-Cu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:58:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgUH4-0002jH-Fv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:58:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TFZCu4004510; 
 Fri, 29 Oct 2021 15:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1ygGVRO3VuuX+Jt5VqfU0uEVSkMU9V++YCm2AUNl1zA=;
 b=Nt69xa88IwBlcg0k+BKA+LgCITpSH9ZJejv8N21pMNYjX4TXJ9tH0x5RLL6kt/CgUqxt
 1S20WggmHPbyE/igec3j1i/u27Zzy3PwmnAQEL7G9Spt8T6fF+GrVkcSVTwvQsFn8M3V
 CgqGa6FJb1S5oMcjeXc6AyU7rLHO+JLxeB1Qv9/1DSSItdEzuYB7k9WlZz01h7J/jkSs
 +4gBWSRWnGEUHyXb6zpjPS8CIARLIeEFb/tgOexdfWUyIkS3Rd6NdvWXnhxDRiU+SaGR
 RCd7NedssrRoMacp2ReHSqxfgHTwcR5/5MJO4p/W6UoAFqjKmmRc8HxEg38IrXVG340Q Dg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byja2gw35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 15:58:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19TFtPBW177436;
 Fri, 29 Oct 2021 15:58:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3030.oracle.com with ESMTP id 3bx4gda8xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 15:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsNhXowowTXR6fWoi04H51tjEtMJ6On/heeWij4+dsJy4GkorltBcS6jP5Rc/I9PUXs5VDXayXYQ9VTl/Sy09w/+b5vpkdA6yx64L/bwzIW3Vsh6xBdMr28FSeUncL9WbWrQh35LpDuPKPyk0yKLeL9l0Td4OMDilICY6mNoAweZeQE6YRkL6cD43mXNFZQmW5fPG1wM14vxt6lfTnjg8KkHi2riiZV8eoBXBL0RRhUSe+YXgEkWWak+yy3131I6q1WVxfkmmqf5fFYyoPEPqLBHLIiIT9scrL8D6GERo/S03c12p1qu7tx3hQlD92z+BBJFKGjy4D4CecpMN0/gFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ygGVRO3VuuX+Jt5VqfU0uEVSkMU9V++YCm2AUNl1zA=;
 b=KKjGbQFXsGKBGbaQvodj8eiDENS6qdfEIzuvxDen7oa30LXy1uGMlJzuMHhODfP1JE6XXASlC+Hfg5jzhhk9L1IX/t5Rw/EOR4ZPRydEq+VKbd/vnf1N/TBapA7IH+Z+9eeovrXs91ihxIyEJAAQH9pLc4TiVv+yDAkIgDyeQC3KaLiSnurBOaBRC5gzPpZFk+V4NhV+hEDU4l/DzwRh7GvdmGt5IcmDT2lmTPHnnejnapDu5+v6fE96jz601+oSeO9rTkjheDFbCsBHGDG7I9k2oCsgPsJPzsZchQmb4jbHFiuq9rKdCc8NH1LS6V5EJU2xLGZr19idOVuAefXpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ygGVRO3VuuX+Jt5VqfU0uEVSkMU9V++YCm2AUNl1zA=;
 b=qg3hPkFeDv+/NreJnRsuis5+wkzvn/6rqA56VjtkXHlXSbVHbVBBQOp1om+batHO4t0JATwUCx/8txv1O25hWwq3J0YNhJgRi/ViFyG9EGI5ByUFHbM3OgIck2MUKJLOfQpRMHIaWZzq/Evvhsn6pGY7iXF++OVLDYZELzQDRQY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4964.namprd10.prod.outlook.com (2603:10b6:208:30c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Fri, 29 Oct
 2021 15:58:28 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 15:58:28 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 05/12] vfio-user: find and init PCI device
Thread-Topic: [PATCH v3 05/12] vfio-user: find and init PCI device
Thread-Index: AQHXvmCJ2HkghCyvZ0uEITCIXAxaBKvnHCIAgAMiu4A=
Date: Fri, 29 Oct 2021 15:58:28 +0000
Message-ID: <1D478072-7D63-482A-B32C-6108942BE9F0@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <697ee91edc2af1aae07a01d49a27156d0e87c00c.1633929457.git.jag.raman@oracle.com>
 <YXl4wsLA1/+pCfTb@stefanha-x1.localdomain>
In-Reply-To: <YXl4wsLA1/+pCfTb@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fa94ae5-dfcd-433f-f8fb-08d99af4f2b8
x-ms-traffictypediagnostic: BLAPR10MB4964:
x-microsoft-antispam-prvs: <BLAPR10MB49649D06795AEBA6C0E9E0D690879@BLAPR10MB4964.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:128;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: khzf7nfzarIYUEGQxtgt8ryrpJiupCJCVCpRgmp/BEr9QsCXC4vPbq78kpSBIMKTW3eL4IQVPIaPKRZvMvwA38tr24MrMpEgTEZKkna0HQoTTFfCclOtcyam4kWuLVpYOAIK1TEqWF9E2XpVV0oXR/1MMGTysGlAeWsqakTb0ifiJ5CuOcn5DRbb3U9VLnnUT5JqwL74d253/4VFQEgZ7eKD3vPZa2hA08ee4rJIwCrrzdUZv8EgcqkF58uxNnvqAZA3iaqIrgjdwU/tk1d7TzIsn+1wAIh7cITnupAD+HbsotqULluuUBDMgpWuQQ3lVnPePYLLnubnxuJDGQUiE/O0DVu6uHEdG1cBAvISgUYwxF3EfXn+WCXF5q6pvPHtAwNUzvLlOR1CFSJ7m3o7sXDfCWvh2lZgjaIkd6U7+j7ZIklW8071aBfitUTGWpK/G+FVnX/wVm7xtNB7KYTo9duFdC14u0nelmPNqQ+f6Fcj9H2ELiG3qp3FBSrKOYv1GufifdhRcABrPuO49G/7KOJqJo0sF6OvwIJr5vLb2V6JYnwlfuE9TmY9d7yW+hm9NoflPYipht3YxUiKSP8RmHw12+cYKw0YR1NuGpG07I4Dz7wt1xAwFBe/U68HTT/8xcghADC90yiywBwmL5Jt5UWtY/JR0vclRrrzO0Ppm0XaBxuRf/pAK4rYA6A2SBfC1VHHRnBQ+Nt6kcmMKUOf11pSucXjdJ2cgmGPNq3pN0c8VE8pEDEkUnB+6QK0p3ju
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(4326008)(2906002)(2616005)(66446008)(33656002)(6916009)(38070700005)(186003)(5660300002)(7416002)(8936002)(508600001)(71200400001)(8676002)(86362001)(6486002)(66556008)(54906003)(83380400001)(53546011)(122000001)(316002)(64756008)(66946007)(38100700002)(44832011)(6512007)(76116006)(6506007)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGl6clpEOXd2cEhiREFyUERhOE9qbHNzV0dDcnV3OEJKcVorWURQUUttS1Bj?=
 =?utf-8?B?a2FTY1h4MFpYaW1UWCtrcVlob2tJYzBMS0JOcU9DVlJaUUE4YVhtNDdRZzl6?=
 =?utf-8?B?ZFVqV1ZWaTBqWUJwYkR3V2hHRkt0dFVKWnlPdG1nbjJldEJWbHlYR01zSGd0?=
 =?utf-8?B?aC85TFN1d3NFdXVaL1ZJeGEreFA5VlVTQVlGSWdnZERQb2dRUkpadkJUamdT?=
 =?utf-8?B?azR6cE9hVHltZCsxVDh1cU1Cbk5pejg5RHhrZlh1R01CRDRkejBDT1dBSWdW?=
 =?utf-8?B?a1dsaitnYkhZa3JiZ3N6cjVIdHJHNkttNDY4SVJta2VHZmdIU29RdGtTK1Nl?=
 =?utf-8?B?NFhrbE13K1F3VjJMZnJaeHNpMTB5VEhXOWNrREF6cTZoM2U3Ym45alBIWFVM?=
 =?utf-8?B?RENDcmJhb21LaDMxZ1Irc0wvMll2N2p3UU5qZnB5alM0MzJoc295cjUyUmFF?=
 =?utf-8?B?SnB5RzV4ZTVRclVRSUtCTGpKcFFKQy9CdGovc3FvSWJGVjRHNGkrdlhqWjJm?=
 =?utf-8?B?dForSUMvR2Q1OUVvK2w5TEJZN2hHUkl4dW9BbURYT2R6NWFSdGlDdUpNRE52?=
 =?utf-8?B?VUp0UnJBUTFVNHRZOTEyQjl4RW1xdDN4QVo2V1MyemgxbXBqTmxuUEE5NFRl?=
 =?utf-8?B?VTBvaU4rSE1ucHhaQXp0WU9OaDE2bnpVb0VaallDL2N1VDNCSmFoVEkwOGI0?=
 =?utf-8?B?UjNvZ3NMTUFVaGZUWHpDZGMzYXpKZjAvRHl1alk4aVFyc0dlV1BCTmozRUEx?=
 =?utf-8?B?L3cxVFRzWkJCMFhhbmd2di9BWm01WVdXZTQycitIQjNFU2dGMEcvK0l1Sndx?=
 =?utf-8?B?K093Q1I4Z0EvUUl3RTR5S2ZYVmVEYUZ5M3lyRWpwV2JrTndSQjVYcE9yQ0lp?=
 =?utf-8?B?ZUJtNlZ6cVdvN3FYZnFUaGtqdDFIWStpcjZtbGNMUmNHbjlhdHRqbmpFbUhs?=
 =?utf-8?B?YjhxNEtKUFgvRjB1Ulc3VWY0SmFGVG8zTHY0elZyQXh4UEM4UGh3VjU1MFg5?=
 =?utf-8?B?SVRpOW9zZlZ4akI4OXF0UmJia2JTc1RUZVZNNjN3WWF2S3RjN0daT2ROSjhx?=
 =?utf-8?B?eUpKMkQraVY5NzBTVUFaNCtvZVJQUGd6d1F2eFIyc0gwU2RDc0NjYmNoYW90?=
 =?utf-8?B?bmFvZlRndm1kbkhFSXM3KzZJVkNBdThUSkFoUUJWZy9IWWlYQmFlNXpEdUNt?=
 =?utf-8?B?TzhOcE1mdWlkMURNdEMxaThkN2EzOHZFTC9uQTZ4c2xyU3cwdFlaeXd0S2c0?=
 =?utf-8?B?K21wYXJuWk1BZ3NFYUwyYXk0OUl5YUp5eUt5NC9sZ3V6ZFRJZkV6UUs4cnJH?=
 =?utf-8?B?disyWDFFZEdia2oyZ3RyZHgvYlA5ODhrVEZlR2wzcXVVcFo3Y2xiaW5VeExK?=
 =?utf-8?B?WlpEMXIxSG9wc2VrcmZwTHZDblBMTlFLRHA0ZHFYcXBNWjl0bS96SW45a1lI?=
 =?utf-8?B?a1Q0Wk9pU28vTUV1dDhEZHhvdGxSUk9BeDZKK0FBWXZ1U3Era1RUdUFiMXYv?=
 =?utf-8?B?cTd2azBZSlNtQzhLV01yQzZ6bEd2ckhTeVQ3dlhVR3ByY2JGdFhHSkxPalhY?=
 =?utf-8?B?T2MwODAzSElWRDFDcWg3WWNUdWxjYTh0Zmx1bkNwc3RESmxrVld6Wkp0MHNk?=
 =?utf-8?B?UThKV082VU9xL3E1dlNmQUlQY1d5UUlmMWVSMitkcXNBSGMvK2pMRnQxYk9S?=
 =?utf-8?B?Qkh4TG5sbDVnb1N0RlVpU0dvL3EybDZFWEtscDh0Y2FlN1A3NnUrUy9OQy9z?=
 =?utf-8?B?Y0IzSTFVZWxIS2NEVlk4dCtJSXc5SnFDTTBYVmFJZkIyUThQQ0hkTGtnZmJB?=
 =?utf-8?B?ZDNIWkFVQnhrS2JNajNQaHQyeU5aRUpCWitvMm9IVmdUdkVRR0ZCZWtuY3Vp?=
 =?utf-8?B?ZkUvNkR3QXZ3M1M2blpyZ2FTUDVrbkk5RFZDelBmWDEvdWoyOVJIKy9FSER3?=
 =?utf-8?B?RlEvZWh5d2k5dDVkOVhoWEc0YWQ0RjZXOGpMQ29PUFVQaC9oZW1mS0JYaGJJ?=
 =?utf-8?B?NVpKb0RjY0dWc2xsSEhlUldGV0M5R0tEeVF0VXlOZ0hhOGY4aDBuS2lGbjVS?=
 =?utf-8?B?OEQ4VDlrRFZKa2Q4S3VjdEtRazhhYVQyS01HU3pHSkdhZ1VsR1NmTUZCaDk2?=
 =?utf-8?B?TlJiOE44SjRERGZBTXo1bmhWTkV0Z2FsSlBXQzFPai9WNlpSYTgwRVpOZ3F3?=
 =?utf-8?B?em9CUmIrcW9mb0tlV3hKclQ5dTZtSDE2VVF0N2pOK2c2UzBYajdqUnhYMk9J?=
 =?utf-8?B?Wmp3Uk9aSzNSNWc3cC82VTlxcnJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5408E3CEE4747E48AA6A3D9BD8D02469@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa94ae5-dfcd-433f-f8fb-08d99af4f2b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 15:58:28.3083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rEzondxJDrqdP2ZAWhgdFxoBbBxACzQ1ZOWeszU1NQt2tMHyNGAE0EyP0nrvs6+4bSJsrgQhstMj9NdeaxUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4964
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290091
X-Proofpoint-GUID: JzOoFXEGZ3ju8f0ZXJYwlfubXQZTNWZZ
X-Proofpoint-ORIG-GUID: JzOoFXEGZ3ju8f0ZXJYwlfubXQZTNWZZ
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gT2N0IDI3LCAyMDIxLCBhdCAxMjowNSBQTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDAx
OjMxOjEwQU0gLTA0MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gRmluZCB0aGUgUENJ
IGRldmljZSB3aXRoIHNwZWNpZmllZCBpZC4gSW5pdGlhbGl6ZSB0aGUgZGV2aWNlIGNvbnRleHQN
Cj4+IHdpdGggdGhlIFFFTVUgUENJIGRldmljZQ0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVu
YSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1i
eTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0N
Cj4+IGh3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykNCj4+IA0KPj4g
ZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMgYi9ody9yZW1vdGUvdmZpby11
c2VyLW9iai5jDQo+PiBpbmRleCBkMjZlNWVjOWU5Li43Y2U0ZTViMjU2IDEwMDY0NA0KPj4gLS0t
IGEvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gKysrIGIvaHcvcmVtb3RlL3ZmaW8tdXNl
ci1vYmouYw0KPj4gQEAgLTQ0LDYgKzQ0LDggQEANCj4+ICNpbmNsdWRlICJxZW11L25vdGlmeS5o
Ig0KPj4gI2luY2x1ZGUgInN5c2VtdS9zeXNlbXUuaCINCj4+ICNpbmNsdWRlICJsaWJ2ZmlvLXVz
ZXIuaCINCj4+ICsjaW5jbHVkZSAiaHcvcWRldi1jb3JlLmgiDQo+PiArI2luY2x1ZGUgImh3L3Bj
aS9wY2kuaCINCj4+IA0KPj4gI2RlZmluZSBUWVBFX1ZGVV9PQkpFQ1QgInZmaW8tdXNlci1zZXJ2
ZXIiDQo+PiBPQkpFQ1RfREVDTEFSRV9UWVBFKFZmdU9iamVjdCwgVmZ1T2JqZWN0Q2xhc3MsIFZG
VV9PQkpFQ1QpDQo+PiBAQCAtNjgsNiArNzAsOCBAQCBzdHJ1Y3QgVmZ1T2JqZWN0IHsNCj4+ICAg
ICBOb3RpZmllciBtYWNoaW5lX2RvbmU7DQo+PiANCj4+ICAgICB2ZnVfY3R4X3QgKnZmdV9jdHg7
DQo+PiArDQo+PiArICAgIFBDSURldmljZSAqcGNpX2RldjsNCj4+IH07DQo+PiANCj4+IHN0YXRp
YyB2b2lkIHZmdV9vYmplY3Rfc2V0X3NvY2tldChPYmplY3QgKm9iaiwgVmlzaXRvciAqdiwgY29u
c3QgY2hhciAqbmFtZSwNCj4+IEBAIC0xMTIsNiArMTE2LDkgQEAgc3RhdGljIHZvaWQgdmZ1X29i
amVjdF9zZXRfZGV2aWNlKE9iamVjdCAqb2JqLCBjb25zdCBjaGFyICpzdHIsIEVycm9yICoqZXJy
cCkNCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfbWFjaGluZV9kb25lKE5vdGlmaWVyICpub3Rp
Zmllciwgdm9pZCAqZGF0YSkNCj4+IHsNCj4+ICAgICBWZnVPYmplY3QgKm8gPSBjb250YWluZXJf
b2Yobm90aWZpZXIsIFZmdU9iamVjdCwgbWFjaGluZV9kb25lKTsNCj4+ICsgICAgRGV2aWNlU3Rh
dGUgKmRldiA9IE5VTEw7DQo+PiArICAgIHZmdV9wY2lfdHlwZV90IHBjaV90eXBlID0gVkZVX1BD
SV9UWVBFX0NPTlZFTlRJT05BTDsNCj4+ICsgICAgaW50IHJldDsNCj4+IA0KPj4gICAgIG8tPnZm
dV9jdHggPSB2ZnVfY3JlYXRlX2N0eChWRlVfVFJBTlNfU09DSywgby0+c29ja2V0LT51LnFfdW5p
eC5wYXRoLCAwLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvLCBWRlVfREVW
X1RZUEVfUENJKTsNCj4+IEBAIC0xMjAsNiArMTI3LDMxIEBAIHN0YXRpYyB2b2lkIHZmdV9vYmpl
Y3RfbWFjaGluZV9kb25lKE5vdGlmaWVyICpub3RpZmllciwgdm9pZCAqZGF0YSkNCj4+ICAgICAg
ICAgICAgICAgICAgICBzdHJlcnJvcihlcnJubykpOw0KPj4gICAgICAgICByZXR1cm47DQo+PiAg
ICAgfQ0KPj4gKw0KPj4gKyAgICBkZXYgPSBxZGV2X2ZpbmRfcmVjdXJzaXZlKHN5c2J1c19nZXRf
ZGVmYXVsdCgpLCBvLT5kZXZpY2UpOw0KPj4gKyAgICBpZiAoZGV2ID09IE5VTEwpIHsNCj4+ICsg
ICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1OiBEZXZpY2UgJXMgbm90IGZvdW5k
Iiwgby0+ZGV2aWNlKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4g
KyAgICBpZiAoIW9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZUEVfUENJX0RFVklD
RSkpIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1OiAlcyBub3Qg
YSBQQ0kgZGV2aWNlIiwgby0+ZGV2aWNlKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAg
fQ0KPj4gKw0KPj4gKyAgICBvLT5wY2lfZGV2ID0gUENJX0RFVklDRShkZXYpOw0KPj4gKw0KPj4g
KyAgICBpZiAocGNpX2lzX2V4cHJlc3Moby0+cGNpX2RldikpIHsNCj4+ICsgICAgICAgIHBjaV90
eXBlID0gVkZVX1BDSV9UWVBFX0VYUFJFU1M7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0
ID0gdmZ1X3BjaV9pbml0KG8tPnZmdV9jdHgsIHBjaV90eXBlLCBQQ0lfSEVBREVSX1RZUEVfTk9S
TUFMLCAwKTsNCj4+ICsgICAgaWYgKHJldCA8IDApIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGco
JmVycm9yX2Fib3J0LA0KPj4gKyAgICAgICAgICAgICAgICAgICAidmZ1OiBGYWlsZWQgdG8gYXR0
YWNoIFBDSSBkZXZpY2UgJXMgdG8gY29udGV4dCAtICVzIiwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgby0+ZGV2aWNlLCBzdHJlcnJvcihlcnJubykpOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4g
KyAgICB9DQo+IA0KPiBJdCdzIHVuY2xlYXIgd2hhdCBoYXBwZW5zIHdoZW4gb25lIG9mIHRoZXNl
IGVycm9yIGNvZGUgcGF0aHMgaXMgdGFrZW4uDQo+IG8tPnZmdV9jdHggYW5kIG8tPnBjaV9kZXYg
bWlnaHQgYm90aCBiZSBpbml0aWFsaXplZCwgc28gaG93IGRvZXMgdGhlDQo+IGNvZGUga25vdyBu
b3QgdG8gc2VydmljZSB0aGUgdmZpby11c2VyIGNvbm5lY3Rpb24/IEl0IHdvdWxkIGJlIGVhc3kg
dG8NCj4gdGVsbCB0aGF0IHRoaXMgaXMgY29ycmVjdCBpZiBvLT5wY2lfZGV2IGFuZCBvLT52ZnVf
Y3R4IHdlcmUgZGVzdHJveWVkDQo+IHdoZW4gYW4gZXJyb3Igb2NjdXJzLg0KDQpIZXkgU3RlZmFu
LCBpZiBJIHVuZGVyc3RhbmQgeW91ciBxdWVzdGlvbiBjb3JyZWN0bHksIHlvdeKAmXJlIHdvbmRl
cmluZw0KaWYgdGhlIHNlcnZlciB3b3VsZCBzdGlsbCBzZXJ2aWNlIHRoZSBjb25uZWN0aW9uIGlm
IGl0IHRha2VzIHRoZSBhYm92ZQ0KZXJyb3IgcGF0aC4NCg0KSSBkb27igJl0IGJlbGlldmUgdGhh
dCB3b3VsZCBoYXBwZW4uIFdoZW4gdGhlIGFib3ZlIGVycm9yIHBhdGggaXMgdGFrZW4sDQrigJxl
cnJvcl9hYm9ydOKAnSBpcyBzZXQuIFNldHRpbmcgZXJyb3JfYWJvcnQgaW1tZWRpYXRlbHkgdGVy
bWluYXRlcyB0aGUNClFFTVUgcHJvY2Vzcy4gQWRkaXRpb25hbGx5LCB2ZnVfb2JqZWN0X2N0eF9y
dW4oKSB3b27igJl0IGJlDQphdHRhY2hlZCB0byB0aGUgdW5peCBzb2NrZXQgYXMgdGhlIGZ1bmN0
aW9uIGV4aXRzIGVhcmx5IC0gc28gdGhlDQpjb25uZWN0aW9uIHdvdWxkbuKAmXQgYmUgc2Vydmlj
ZWQuDQoNCuKAlA0KSmFn

