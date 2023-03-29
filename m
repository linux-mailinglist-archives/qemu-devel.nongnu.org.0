Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3746CDA42
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:16:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVe8-0007Wj-Ed; Wed, 29 Mar 2023 09:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phVdh-0007Uk-0Y; Wed, 29 Mar 2023 09:14:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phVdc-0000hI-BS; Wed, 29 Mar 2023 09:14:56 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TDA3RJ029193; Wed, 29 Mar 2023 13:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=npsoKjrDea/wiQH79ImFX6IAzplJwSodI1p7cQkmKR4=;
 b=mvGRvUx2LPN0VH8VrCqqCqzHf39+dqd3BLAHFU9VeLW31bRFsRG0gUP+tSkjGLCAVRFs
 BslOTEylUw1Jn4zAu5sbQoJgiqDVjuX61wz8ALEbmZ6zHIoMBut9sN5OTIcOr7CnBP7Z
 9xN3wtHC9HjXFrzs8aB2ki0O0oAcinRb5j9D5GGgTHudHNK67AaT4IHUWybWtFIoYxUe
 ngqW8a40jJkLpSSt6xVTNspFdoZXfN2KGnstwh3UF/zlMmS9vYBdKk43gk0U73qsYRMl
 qQrp3sS9s2WQHIr7irJjlSfprv5Do8jV18PrmXA4A+YCsLQPz4xMXmyQgje0qWFFVSVd lA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pmnyn80mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 13:14:45 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32TCYngZ010858; Wed, 29 Mar 2023 13:14:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqdeb4pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 13:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtVmzFKH4a3fuKsBTOSu6ZkFv8APQJ14wnkzs8uxz3ctXo26Dn03SWQjfdVGvK3+sPyFVmnylGn6h/NTTuXQWBqyi5HU5qw22DOKfGDoIA5PSk36NXEywiw08ss7kRrSLsBd05JHCQN3qCE/Q7XXMKszenmqy2sjbFwWfemidL7GIBHbT97Usz3pcv6Gj7iDuKGmekeItonJXcqTxHg1LTkSwW61lzjfBy8h4m9zB/rxhqW2XRM5ghoqtT5gEVpBil1sKNe8KkkxzdAk0xpXmHUTKdKQeprofLJHICi70i/4Y7PnrG3YdPB+rUD2mGoW7aHg1MwDkNbtIfFuFKIr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npsoKjrDea/wiQH79ImFX6IAzplJwSodI1p7cQkmKR4=;
 b=USdYe5jiQZWBResC38TEa8xTpv0qxXSQjJI+yOaKy1MLupesX/z6FWsmPnoVO2a+pmmZBam5ITjDsGXscfZ3q/xXAiFkkuuhoofSj4ffq0kcZp/dbdOzdecWw+B3EpO/JIQvjzOXDeq1CmydjkmLXYqsCjgSJJ/XJkvUDhllD6TiMHyTCkcKqMrmZ4cSXuGvBO55yr8jaLHhEq75irDKQqzQg6vnnSuRBo/jf0fsfoF8KBgvc7SZ4kNF8LD1gMtzOYdfjZpWonmnKnMGmCcnNz4gn3SnUC57ob4hktNMAlmI4QZM2DYrZoCAtJXgO7/76IsiTcNr43DTMFsZ2w+vIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npsoKjrDea/wiQH79ImFX6IAzplJwSodI1p7cQkmKR4=;
 b=JYlPwjCwwuzp3xLKXHFve0bhZ9hs2lPH8lI/1O4kWwLhItktyLP60L5uBeaN1T0HqBByYK1Sjv3w+qFaE3xwavxDp7X1+2nyDuW/lec2YKHNkE1T0CaNkZBlDVMmlyeYB16QzMdti4GUazBLS7kR0YoBZPLWFqPwnvbiagFjWVs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CY5PR10MB6189.namprd10.prod.outlook.com (2603:10b6:930:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Wed, 29 Mar
 2023 13:14:41 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 13:14:41 +0000
Message-ID: <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
Date: Wed, 29 Mar 2023 08:14:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230329010406-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CY5PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0f0b4a-fa12-4785-0fc4-08db30578e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCZcSpnIB0BgcBzXRm0VyG4QmZVYdtl927yHC+mqN648Ti9gsaNCo+Aq3owzP9lnbkbAyxyExnMb7LPta3JtWkZ0X6PJ5N14C9kl9ocu7yFiGFY83hSZXqWF2THgi0GG9ZnLmZIqYDS0gkchnu4+yGVLWsAKkbDrC0hbEUpH4AimHdyFcrmPwVYvbqEX515KII6ue5BhcdPeBHbnHtfsZdT/o79PtvrrQcp9vSBvA6Vn5nm3ZbIg8GmQVDwfyrFuRZnZgyZAAmhHcnmxFn3Lm4IBbCQ+Sq0ZaYdaAIDUeMOP8B2buPk4jtCTFpcgTvpKEcWyg/MZxH8wrVtbvrrXTiYWT/Bz2v3if36wQcHsXueM5YwWhgHOHvrMUBSgg+c+4IX/hJ2vbuQ8JBlzEIQGFWkNmHQP1helF/1eBi/m2MZGERqR4xra/Wziu6a5MX4Nm3ISaVkyOe0E5H0YpbB8H9fHAkHx774XVmu30HygDQzCE/kymQfQItFRb8ErxkvsF2zq/lxNO/lOoY/Dm6V5PB7rcGmNqykjppZHfpSKdg03sv8RazQFqvmkaxZ+iVXVi9rihzecunWypqAzFUogZteLcEFa4B6HKnUXljXtLxFvDIusTlRamPBxKPJIH8L9LRG0qRM2HNCldGAeXNSGNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(6506007)(6512007)(53546011)(316002)(6916009)(4326008)(5660300002)(36756003)(7416002)(8936002)(2616005)(41300700001)(8676002)(66476007)(186003)(66946007)(66556008)(83380400001)(2906002)(31686004)(6486002)(31696002)(107886003)(966005)(86362001)(6666004)(478600001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjlDRSt4QWxPdlRVdks4Z0cvSjc3M1R6dGl0b3lLanJkd1hPV21JdStqNncr?=
 =?utf-8?B?a1dsVGozMGVIdDRGeFZ2TTlmOXh1WVFZQnJWanZralp6MHZRLzVrcUFwWHB4?=
 =?utf-8?B?MVBleXJ4b3gwNms2MXlUMkFOSVo1M092amkwUkFHU2hVT3ZBQ2xNenBUdUZp?=
 =?utf-8?B?dTNONWlvbjJ4VFVwODFBaElidFB6WkpPZzRLN0d6ME9UVjVEbHB6aGI1U2w4?=
 =?utf-8?B?WmJvaExoN3JCc2IrdnphQlBjNjNzQTJQRW5Cb1JrVGhoRStmYzFuWmgzRUNr?=
 =?utf-8?B?TXlGeSt4T1orcW11dHIxL1JFUjRsQ2htaW9UeUtjdlZvL01pU0hNMk40Y3RM?=
 =?utf-8?B?a0VuSExOc1VYZ3l5cXJjZXV6UTI3bEJsMFRlSDVhZHpRc0pKSHJRLzQ5blkv?=
 =?utf-8?B?b3B5azlZcCsrY3JHRDFwckdvck1EY2hTUkJldDZwSlFMcTVyWHA5Tm5yaUgv?=
 =?utf-8?B?anpadlpZVjlrKzF6djMzUWk5YTFuSGxmbXZTVTUvQTlyRkc5N3lHYWRlREhW?=
 =?utf-8?B?SldkQWRMM0QvZ0NVVDI0ajB1dVZtVlF2VDRrc0tXRTltSTQyY3cxQVpsQmdR?=
 =?utf-8?B?c1VIbEgzclBpVVk4azRFbDQ4Z05LblB4V1QybEFRNDJFeFhKeE5mR3NkMy9D?=
 =?utf-8?B?SHpSaGpwUVZVTVlKUk9mZmJGZnFCdkRWV1VxV0RpZnQ1aW5xNW53Tjh5SEF1?=
 =?utf-8?B?SzVGZXNsVHcraVdBSVk3RGUzNGMyVjJOV2M4Uk9BQlViVzJCTExnQU5vd0dr?=
 =?utf-8?B?WUN2U2p5N2VKSFNUWW1xeFhidHdqWUgxSVUwN29VVk1pMmVyVzZmZG9Rbno0?=
 =?utf-8?B?SktXM2JBUGZSVXdTTEl6RDBrejczZHNxQyt2Zzlla09OeGhCU29vRlR0K0xY?=
 =?utf-8?B?b0VwQndhNmpzaGFMRWxwdkRSYWdwNWhOak41Ly9kaXdxNTE0VmtHTjI5ZTR6?=
 =?utf-8?B?blY3cFMxdVJqWEhNZmZMZjdkWVhiZG8vMENVeTlyOWJPZGQ5dkZJRHR6S3hh?=
 =?utf-8?B?N0RkNndVS2VHVW0xREREdTlLazl1OWJCSzNHdkZocHhsaGVHdVlucTdxL2xV?=
 =?utf-8?B?ZGsxcTJLWWJXdlpjQ0tjUmwxVjRDN2pTQzRkeFJjNTFaTWhoR201S2tTSVV5?=
 =?utf-8?B?bGlTRURmbDhIejh6aFlLeUZYZW9jbFFDVzgrenk4VkFIWDhHSm1mcHZXazZE?=
 =?utf-8?B?QXZwSXN5RVB0RzQ5TmFidDViMEE3eFZOanBIZ0FXSlp4bXN2dHlIZWpHWXNT?=
 =?utf-8?B?dWEwSFdnTURSUlpBeGVEK3pOWDNyR2NvNWVTMGhSU2Z3bFFqaS8zbUZMVEU1?=
 =?utf-8?B?VmdILzhXNXNxbnE1WUUyUWFmU1RKblhjdWRhaHZUVUhOeXhxbXAvamtRRmF5?=
 =?utf-8?B?QnBtQlNjNDdGRjFNYkp3QWlqbjNNY2FHWGlGeEt6dnAyenJmOXRxQXZRRUdQ?=
 =?utf-8?B?TjF4WnhlRmhoVmVYcEd6bkVQcEFNR1djMEtXMlpVSkZMaGhZS0N6em5YeDBK?=
 =?utf-8?B?Wk9EOWlhckhTTE5rU0FhdDl2YnA0ak5JOWIyTFM1QktZLzZsN1RVWGt1dEJr?=
 =?utf-8?B?NmwrWTBGK2FPM3BqbDl5WXd3Wm4rVHd2V2dLejhuSXJCbnBDU2EwTTBSM0pY?=
 =?utf-8?B?TEhRdklPZ1cxUlR6bjlmSXNHekRDOVdOL3kyalYweENKa3RzZ1luTnpta0Zl?=
 =?utf-8?B?cmJPcE5DT29meFIvaisrMlZ1WEdOc01JQmwzeXNCK2RDQUhsdmNyQnZ1VnJl?=
 =?utf-8?B?Yzg0dUdBL3RWekMyRnRKSjE0V05MWDhDWmM5dEFzbGxiK2tyNldBVXN4WHJp?=
 =?utf-8?B?QnFHY0IwbWVSdmdxcG02WVRMWkpRdzZ0dGdmc3pidVQ3WTllUFAxYUVpRGJE?=
 =?utf-8?B?Mk1Nbk51bnlvaXdRTlRxYzhnN2Y5MmNqTkkrL3VUTTN4dzZ5WlJQZUtvS3du?=
 =?utf-8?B?NU96M1IwZkt5cmZqZGhFVGVtV0NYVUNsSFRuOTZUdEVYdmFaUnVWL3k3VUFC?=
 =?utf-8?B?eGI2VFhtWlNJRHZCeUtZT2t6aFBKbVBLVmxqajhiZFFrVzZqWExuNUpvZ05T?=
 =?utf-8?B?RkpLWHJOS2FoU2g0Zm9wTEZnZ0JuYXJMQUFqczlGOWZKK3dhaFpZUnNpb0ha?=
 =?utf-8?B?WVVVZXNDQng3d1VncnIxNWhFUDVPZGJvaGNscXkxemhDN2F0ZnVPU083Z1pH?=
 =?utf-8?Q?++RikOYy+BDk1y4BopN5ka8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oUJG6OhYqM4BA6JeXPWLE5D75Uo0rtUPpSTiBv/geYjR5NhO9cPU+BaxxZmsbJSmOJYmgvfXA1yy4Z+vwyRdLa6cvd7QXuECbJ+eCRl/qPI1TMjK1VugpbYY9UMo+epgM1am1CMj1dhtZ9AZvzqEvE2iIk6fdczDHlb2IB2VzwmVnvta7vwRUSSgT4ASUSjSoae//q+mGwoDs4bvujtVSeuhJVOwAMMThJZHLHt0M1MZqH8dlrdRV/217r0Ihf51UrF1pobUJvUdOOCwuAWNemMUQzsD7+w8IPZAlOHG93HB93Zr1KtZRsspVv1wNK1oWZ1e6SAN5Mw8GLEi23CUU6/bX7Ebo7Pkd2xl+OdYaQCrBGqOnmcSSGVLQQDV8PrqrwyrUwbDj8REcW/p5tPS0rfSfGgg6Jfkgsu3/pPUa5cCfVFfK0Ctxp2myZgHxEfn8ybyBWOgOwvs7tU/NrZXOGmpZ8vMPnEe5K4zogQ8bhQUu8PNXcqqnVpDYdjujSX8W247lxsa2AQqYNR2CcHgn7wZuuGgAq+oWW4mn5dgvLjfDgWqVnPqmrjx4880H5zV7zVwBijouNF9zNvklJ87LDmdwkkh1F+wUUGUtmyRg+KT/ajT1Un0DIV3+6jMNnrKuSqcqvR0yvq7o9HmuGj3EZ8Fgq6QhsYSJtKWhUOkwh/zY2V3DBmvnzTPIz6PXgb03i0xwkDt3nF6/7AHPln6d3brPsdvGF8LChvTzQYjehryrBO4UtjM2xA2nLfTTZVt+mj+1YgrjDAxMlEPeBYyQq/RFJd6DvdAgf3FtbZevPVrx4bvddYloiWAsBZDJv36OcQebEqXzGdbfx76b8EGeXm6Chz7bbRbz2J8TGf2ky7Tq9a8NwWVZEBBJ/mkZBpg9t0AMhV2g3dr3G43iAehbQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0f0b4a-fa12-4785-0fc4-08db30578e1f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:14:40.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ko1jN1m45l+n7PW1LGL1bqSBf3j0Na3EDRmjwEYJnlAG8dGyB7CrMI/Gi1XmD/uVpmfI7iXvLil3SV6RcqfEWU2RXa3ej74DKOlKf2nsGt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_06,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290106
X-Proofpoint-ORIG-GUID: t8LjYhDo5cNfCo9zmFNcIddz-7-aeZqc
X-Proofpoint-GUID: t8LjYhDo5cNfCo9zmFNcIddz-7-aeZqc
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



On 3/29/23 00:19, Michael S. Tsirkin wrote:
> Hmm I don't think we can reasonably make such a change for 8.0.
> Seems too risky.
> Also, I feel we want to have an internal (with "x-" prefix") flag to
> revert to old behaviour, in case of breakage on some guests.  and maybe
> we want to keep old revision for old machine types.
Ok, what option name, for keeping old behavior, would you like?

> 
> 
> On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
>> The following Linux kernel change broke CPU hotplug for MADT revision
>> less than 5.
>>
>>   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> 
> Presumably it's being fixed? Link to discussion? Patch fixing that in
> Linux?

https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t

> 
> 
>> As part of the investigation into resolving this breakage, I learned
>> that i386 QEMU reports revision 1, while technically it is at revision 3.
>> (Arm QEMU reports revision 4, and that is valid/correct.)
>>
>> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
>> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
>>
>> So in order to bump MADT to the current revision of 5, need to
>> validate that all MADT table changes between 1 and 5 are present
>> in QEMU.
>>
>> Below is a table summarizing the changes to the MADT. This information
>> gleamed from the ACPI specs on uefi.org.
>>
>> ACPI    MADT    What
>> Version Version
>> 1.0             MADT not present
>> 2.0     1       Section 5.2.10.4
>> 3.0     2       Section 5.2.11.4
>>                   5.2.11.13 Local SAPIC Structure added two new fields:
>>                    ACPI Processor UID Value
>>                    ACPI Processor UID String
>>                   5.2.10.14 Platform Interrupt Sources Structure:
>>                    Reserved changed to Platform Interrupt Sources Flags
>> 3.0b    2       Section 5.2.11.4
>>                   Added a section describing guidelines for the ordering of
>>                   processors in the MADT to support proper boot processor
>>                   and multi-threaded logical processor operation.
>> 4.0     3       Section 5.2.12
>>                   Adds Processor Local x2APIC structure type 9
>>                   Adds Local x2APIC NMI structure type 0xA
>> 5.0     3       Section 5.2.12
>> 6.0     3       Section 5.2.12
>> 6.0a    4       Section 5.2.12
>>                   Adds ARM GIC structure types 0xB-0xF
>> 6.2a    45      Section 5.2.12   <--- yep it says version 45!
>> 6.2b    5       Section 5.2.12
>>                   GIC ITS last Reserved offset changed to 16 from 20 (typo)
>> 6.3     5       Section 5.2.12
>>                   Adds Local APIC Flags Online Capable!
>>                   Adds GICC SPE Overflow Interrupt field
>> 6.4     5       Section 5.2.12
>>                   Adds Multiprocessor Wakeup Structure type 0x10
>>                   (change notes says structure previously misplaced?)
>> 6.5     5       Section 5.2.12
>>
>> For the MADT revision change 1 -> 2, the spec has a change to the
>> SAPIC structure. In general, QEMU does not generate/support SAPIC.
>> So the QEMU i386 MADT revision can safely be moved to 2.
>>
>> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
>> structures. QEMU has long supported x2apic ACPI structures. A simple
>> search of x2apic within QEMU source and hw/i386/acpi-common.c
>> specifically reveals this.
> 
> But not unconditionally.

I don't think that reporting revision 3 requires that generation of x2apic; one could still see 
apic, x2apic, or sapic in theory. I realize qemu doesn't do sapic...

> 
>> So the QEMU i386 MADT revision can safely
>> be moved to 3.
>>
>> For the MADT revision change 3 -> 4, the spec adds support for the ARM
>> GIC structures. QEMU ARM does in fact generate and report revision 4.
>> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
>> revision can safely be moved to 4 as well.
>>
>> Now for the MADT revision change 4 -> 5, the spec adds the Online
>> Capable flag to the Local APIC structure, and the ARM GICC SPE
>> Overflow Interrupt field.
>>
>> For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
>> byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
>> Overflow is not supported, it should be zero.
>>
>> For the i386 Local APIC flag Online Capable, the spec has certain rules
>> about this value. And in particuar setting this value now explicitly
>> indicates a hotpluggable CPU.
>>
>> So this patch makes the needed changes to move both ARM and i386 MADT
>> to revision 5. These are not complicated, thankfully.
>>
>> Without these changes, the information below shows "how" CPU hotplug
>> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
>> guest started with:
>>
>>   qemu-system-x86_64 -smp 30,maxcpus=32 ...
>>
>> and then attempting to hotplug a CPU:
>>
>>    (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
>>
>> fails with the following:
>>
>>    APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>>    ACPI: Unable to map lapic to logical cpu number
>>    acpi LNXCPU:1e: Enumeration failure
>>
>>    # dmesg | grep smpboot
>>    smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>>    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>>    smpboot: Max logical packages: 1
>>    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>
>>    # iasl -d /sys/firmware/tables/acpi/APIC
>>    [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>>    [004h 0004   4]                 Table Length : 00000170
>>    [008h 0008   1]                     Revision : 01          <=====
>>    [009h 0009   1]                     Checksum : 9C
>>    [00Ah 0010   6]                       Oem ID : "BOCHS "
>>    [010h 0016   8]                 Oem Table ID : "BXPC    "
>>    [018h 0024   4]                 Oem Revision : 00000001
>>    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>>    [020h 0032   4]        Asl Compiler Revision : 00000001
>>
>>    ...
>>
>>    [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>>    [115h 0277   1]                       Length : 08
>>    [116h 0278   1]                 Processor ID : 1D
>>    [117h 0279   1]                Local Apic ID : 1D
>>    [118h 0280   4]        Flags (decoded below) : 00000001
>>                               Processor Enabled : 1          <=====
>>
>>    [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>>    [11Dh 0285   1]                       Length : 08
>>    [11Eh 0286   1]                 Processor ID : 1E
>>    [11Fh 0287   1]                Local Apic ID : 1E
>>    [120h 0288   4]        Flags (decoded below) : 00000000
>>                               Processor Enabled : 0          <=====
>>
>>    [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>>    [125h 0293   1]                       Length : 08
>>    [126h 0294   1]                 Processor ID : 1F
>>    [127h 0295   1]                Local Apic ID : 1F
>>    [128h 0296   4]        Flags (decoded below) : 00000000
>>                               Processor Enabled : 0          <=====
>>
>> The (latest upstream) Linux kernel sees 30 Enabled processors, and
>> does not consider processors 31 and 32 to be hotpluggable.
>>
>> With this patch series applied, by bumping MADT to revision 5, the
>> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
>> hotpluggable CPUS.
>>
>>    CPU30 has been hot-added
>>    smpboot: Booting Node 0 Processor 30 APIC 0x1e
>>    Will online and init hotplugged CPU: 30
>>
>>    # dmesg | grep smpboot
>>    smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>>    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>>    smpboot: Max logical packages: 2
>>    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>
>>    # iasl -d /sys/firmware/tables/acpi/APIC
>>    [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>>    [004h 0004 004h]                Table Length : 00000170
>>    [008h 0008 001h]                    Revision : 05          <=====
>>    [009h 0009 001h]                    Checksum : 94
>>    [00Ah 0010 006h]                      Oem ID : "BOCHS "
>>    [010h 0016 008h]                Oem Table ID : "BXPC    "
>>    [018h 0024 004h]                Oem Revision : 00000001
>>    [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>>    [020h 0032 004h]       Asl Compiler Revision : 00000001
>>
>>    ...
>>
>>    [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>>    [115h 0277 001h]                      Length : 08
>>    [116h 0278 001h]                Processor ID : 1D
>>    [117h 0279 001h]               Local Apic ID : 1D
>>    [118h 0280 004h]       Flags (decoded below) : 00000001
>>                               Processor Enabled : 1          <=====
>>                          Runtime Online Capable : 0          <=====
>>
>>    [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>>    [11Dh 0285 001h]                      Length : 08
>>    [11Eh 0286 001h]                Processor ID : 1E
>>    [11Fh 0287 001h]               Local Apic ID : 1E
>>    [120h 0288 004h]       Flags (decoded below) : 00000002
>>                               Processor Enabled : 0          <=====
>>                          Runtime Online Capable : 1          <=====
>>
>>    [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>>    [125h 0293 001h]                      Length : 08
>>    [126h 0294 001h]                Processor ID : 1F
>>    [127h 0295 001h]               Local Apic ID : 1F
>>    [128h 0296 004h]       Flags (decoded below) : 00000002
>>                               Processor Enabled : 0          <=====
>>                          Runtime Online Capable : 1          <=====
>>
>> Regards,
>> Eric
> 
> Can you please report which guests were tested?

I've been using primarily upstream Linux. Kernels at and before 6.2.0 didn't have the "broken" patch 
mentioned above, and worked (for the reasons cited in the patch discussion to "fix" that patch). Any 
kernel since has the "broken" patch and will exhibit the issue.

I've been using q35.

If there are other samples you'd like to see, let me know and I'll try.

Also, my responses will be delayed as I'm traveling the remainder of the week.

Thanks!
eric


> 
> 
>>
>> Eric DeVolder (2):
>>    hw/acpi: arm: bump MADT to revision 5
>>    hw/acpi: i386: bump MADT to revision 5
>>
>>   hw/arm/virt-acpi-build.c |  6 ++++--
>>   hw/i386/acpi-common.c    | 13 ++++++++++---
>>   2 files changed, 14 insertions(+), 5 deletions(-)
>>
>> -- 
>> 2.31.1
>>
>>
>>
> 

