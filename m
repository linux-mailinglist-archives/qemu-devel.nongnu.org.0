Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6A5FC073
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 08:13:00 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiUzD-0003jU-Cr
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 02:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oiUpX-0006Or-Ow
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 02:02:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oiUpS-0007Iq-J9
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 02:02:59 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C53two009813;
 Wed, 12 Oct 2022 06:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=aS1/nXrO8rcbyLItyvG+u84hvSF7LuWWWuIgoMepL6I=;
 b=bHpGmHvn43GEI+1HFp6bEqyIWXakzoAF8vKXaDsfZ0gzPPApqdJM+P/ERh7ylqQgdt5H
 Kr0qt9/XjfH/6tvlx9b2WFxQq7WTdMAy2vvPly38i6IFeB+i4qS1WocSCIbqqtfvPgoC
 tVN8CTNO7zwYlJ0BAfTFp6w4cOzKtkXyIKHko6NZ1i10QXYWkNWcvX3bnWcseEgweo8f
 uUQPpusKljRitqEBWpkJ69HO6y5GKZTYEoTxXAoRPXUF/X59FQy0OpF8mEtEEzrspcxX
 8sz3CjfHHyt2ezR41PPP5zziY5w7ONefFT+vjJguTSFeRgfyxspbUsod+ucNj2XyvJq3 EA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k31rtgvav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 06:02:49 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29C5Vl0U021862; Wed, 12 Oct 2022 06:02:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn4rmp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 06:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FObvk9Zdj8vdTwmvfbF/vcMOgkBCApl/7o153eCEKZdLkaI1M24ypKhdC3oJvMjzQWZA5bNLl96BXHtG3YykbKsJgh0RPsP2sBSpdM28wIFFro3WFTmS+qDPfYzxZr3Af+qAoOPiGqyfQ8Oh9D84scSpSkqavJwYcZyp+XlzPXFzVR0yr+lYVAaqg7kWwL5xQ2WzWlw2zN3NYI2uqRbheRbGZdMc2PZJ47UC2BnqlrDEvjYyTSjPUoocCGEvB8jKDlzCGYHy4GZ6T6RHlxsOvfMRahnop6VhmgM8v1AiV9n8h+i/LnE2GIhuLZd1XD9nOR2CxjtKrKkKmtJN5RZqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS1/nXrO8rcbyLItyvG+u84hvSF7LuWWWuIgoMepL6I=;
 b=ns4/Pb/nwvN7ZBVH6EVUHDqcvfRdW5UpQ0vVL7po8S4/2ZvJ/VbwDNGfXundIxGTy9HoZFHk3ihaWY6tYk4R+Pvi2YvFDMEvQsnIyOyEtpGa8TpluhtpokGxUOY48yfe/icnFcI0Oy5TCW1hlRlRbCr/orIRiAvLsEbNKS6yPmIv8FuTuz1ZWujuJUgdKWf/bvo6f5CX3MGVot+ZUNNMYpi3nEcvDrL4HoBjzZVikYnajea+brZX+SDZFpJOcdZ/T/yIzbNg7kCWLiSU+/JKqRPIBkB6szHoTQ8KQnr+8J9EQVAOhF4JRQ+xCTv82RtW0CB6vBaJBz3s/c1R5rGGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS1/nXrO8rcbyLItyvG+u84hvSF7LuWWWuIgoMepL6I=;
 b=RYaePTQ368sR9gga3Fzglcx+7mmmrrdBiu9K3RHTCsubciyTzn13JsrlrW9E1Np7gA69YiYGxEpcetNp4S0X9qiLCYAuNiu1bsVRldz2ZI51Mrh1abRk0O4e3oK7rOWIGtSl/H1FQNKxgE5bFdnDN20BDlMI7lpQl2Nw2TBzZ3k=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SA2PR10MB4588.namprd10.prod.outlook.com (2603:10b6:806:f8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 06:02:46 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc%7]) with mapi id 15.20.5709.019; Wed, 12 Oct 2022
 06:02:46 +0000
Content-Type: multipart/alternative;
 boundary="------------6mOsVIvgRzHilH9NwECndvcB"
Message-ID: <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
Date: Tue, 11 Oct 2022 22:59:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
 <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
X-ClientProxiedBy: SN4PR0501CA0102.namprd05.prod.outlook.com
 (2603:10b6:803:42::19) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SA2PR10MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e4eb7a-04c3-4a5c-75e3-08daac17627e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LPRy2j0zmSj3VGoJyIVPupmg4UU0CqoZwsmAWtohhN85YpPVEYPjXZMYAPg4HOzo+Z/9vb3fuHA0YNacrXOVmBOWjcHB7UjM7Ni+LhayrHvD3wnWTVYYCks3Dnw4OFc8m2u23iSl1631gRT9s/Ll+SyLqTJkwXowdJqX71WvQXwerbpI0RMKNzLTw2WvHA5bXO/i12kxVxa2StN/YCIE4OUYnWObOAPRg2yKNRFtETwe2k4tfpA3R3p4q+GoZDeaEeIDljt9HGgdHSro1SRTOdUsLHuGes99KZY8jeoRtkpH0D/GIMSODAqBe5IaSRtUP+GsjXVO+SN+jT+QuBJ0IirS2vwn7l3Q2HECrEOAVPDLJmGAynsRjpysC5PGgLKjCaB89rc3AvNioNZqykYhBCTjvdEG4HXkAaIvsjAsVBQ3RA8rMizt8PdpGv8IQXvsmc2JUNxl1YkAvf8fI3cE1oVPVplpIz6WCmhqo04UZqoIrvualfGprQe1R638Tmic/e3sL8KDSaTkPlz/L4+/V+RT9WACMr/RqmX2rMuuWf+SORjwi5vVvtOBO9lEDnSLroKCm18gkN750YseFYHRgGMzEYq6NwYM/o0r2SG0TmEi1WedmaQOTdeNi1r9EAhS31B0IEXzPkDV4sN/jvr2Yp5jgb9Pgbt7RMuX11iqluHOSAOajs56AsUNNDS1GxsqNSNUesTiWdwzhK60AeyI9f1QoHdZCZJlx75Wr8x61lXeztWTv+cdnZZb1Brn1tIgKRnQVcfmI/CxtCKr8k/QhqE2zST0JUZutVu/fcIM+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(6512007)(66899015)(31686004)(316002)(478600001)(8676002)(6486002)(38100700002)(53546011)(36756003)(86362001)(31696002)(66476007)(83380400001)(36916002)(186003)(6506007)(6916009)(2616005)(33964004)(66574015)(8936002)(4326008)(66556008)(5660300002)(30864003)(2906002)(66946007)(26005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEY1d1Z4RkRhYmY0cWhCaUVqcDdtc2kwNkNQL2NSejFwR29DdUNHR242Njc0?=
 =?utf-8?B?cUh6UWF2V3liTTlqL3RNMjJWU2dQSDNwSHpQTTgxWWdPY3hmRUdLRmdKVDhl?=
 =?utf-8?B?SE9SWWxSa3kyN0J4VndWLzRkV2NIL3NieEN3WUJOVFlZWkJxdW4rajdReTVY?=
 =?utf-8?B?eTIyNWYrR3FpN2puWndSc2tIdWhQZ3JOeno0T3grT3paTjNqQkxpL0d0NGRO?=
 =?utf-8?B?WDRRVWl4UTVOZUFGRnR0dzgweCtVdjdOZnNXZ2plNm85RUZhU05tNDdXOGZS?=
 =?utf-8?B?eFQ1cjk4c3VaTXFOYmdCdGowNVRxVWs0OWUvTWkzUzQveVIzTk1NSjFlRDYz?=
 =?utf-8?B?R0dQbHZSSjBtbGxvRGJOcVdzQnJnQTVvS2ZQZndBdVRuaUZvZzNYdU9kcVhC?=
 =?utf-8?B?cnk0WUxPZUk5N1k3UzlZTGdZT3NuNm5EUWxLQ0NoL3NTL29LblRKd0FTMFNq?=
 =?utf-8?B?Z2ZlYlo2WHNqZDFRcmx0NFRYUkQ4Q2w5UXBtYzR2ZGhvcnlvSXhvVlg0LzNG?=
 =?utf-8?B?Zi9CMnUyY1h0Q1BESzdEM2hvWDZQV2VUb0lEYWVibmpscGhVSXpHNkpVK1Js?=
 =?utf-8?B?ejU3YjhqYVhwUXc4d3Uwd1ZUcHoraStJQjhaU1U5K3FBVTJLdTg3aEEyWjdr?=
 =?utf-8?B?eGdDVWNTS1ZvNllxcVNQbWM2NmlCNHdQUkxLVzkwRit5Z0NqSG93dml6QTF0?=
 =?utf-8?B?UUFmMzY1UWVxU2dTMkxYOWhoY3UrclhIelhZOG1xaFRudXhCbW9rYk1YbXdD?=
 =?utf-8?B?NFZQSFVjejlaWGJmeWtidmg0NTdUKysvb0pkSm1PTk9VNWE2aGQwZHA5WHBj?=
 =?utf-8?B?K3VtaHpOWDBvc1pVeU5tdFVjOHFZcjFjQ0lQMks1MzQvcEs3Qy9Bcm45Tkgw?=
 =?utf-8?B?THZaNy80OXBtL0RCeWdDdmtpcUgwQ3JrRFI0L29zMnJud0hxYkZZdVY1c0FD?=
 =?utf-8?B?TlY4UDI0eTBGT3dnb2hxZGVhbHpWU1NBSFhjeUdET2dHelJMTks1NXJtY3Q2?=
 =?utf-8?B?SWwzYWRCSk1DYXZOZzFocG50aVA3WjF5SkpMTWxJaTZnT2tNWWpSaTRJMW1q?=
 =?utf-8?B?ZGNrUlVHZnA3ZzIvNUVKTFVENGNFSHV6Y1BtbjlBK2QxRHJHT254c21NYWhj?=
 =?utf-8?B?cS9nM3FZbFltZW9kazVla0FLRXgvMis3M2p4SnBkRzF0U1J0a1NVeEpSV0Fs?=
 =?utf-8?B?b3VGNlRBMVFENnhjb3NkaUxZeXhaZmJLdm5tenU5dXdtMjZpd3lKZE1xell4?=
 =?utf-8?B?a1FqTFV0WFVEdVovRi9EZXpkcXBoU3FaRmIyK29IbmIwUFRINm51MUZvTTlx?=
 =?utf-8?B?N1piYytCNEozUDl4cE5yT2dpczdhLzNIazNuSkRzQXdFVGQ1ak5RNHhZOUJH?=
 =?utf-8?B?UWllalFOYnU1VWVGV09pby8zWFRlMDJwRVJrTXFtTUJuVUkyUklaeUlPVTV2?=
 =?utf-8?B?K01pb0E0QUxNdjJINk9oa0V1dXpBMGtjVWpQSXZDY2ptWUtuZzJmVndNZHBi?=
 =?utf-8?B?ZytQcG8wRXRSV1BjMFo5MnpWNHR6WE9SdEpQOXJ1am4vMHV2Q3lZWUV2TUd2?=
 =?utf-8?B?SThhSTNlYTN5SHpSMzNKamF5cTFUR1pXbVVvaXlzUk15ZlJORWRoeGtabFJE?=
 =?utf-8?B?bG9UQjNnV0N2Mi90aUtueng3dnpER3IyNkVJL0lUWEUzbDgwbFdYazN3R0Vz?=
 =?utf-8?B?RkxmVHVVcjY0dnpUMWtRSGdLNUNzdjZzVzFhcWtDWXM3Wk5sdTl6dWhPZFJX?=
 =?utf-8?B?c3R1aDcybGxJbEZmSUZ5aE5wcUlQYkdwRkl6YUs5NTJEMXMwV1FReWgwUzVG?=
 =?utf-8?B?K2ovMnJLQ3lsMW13Q2N1TUVjRTRNVHFxVVIyekl4ZnRPajNhRUxRNENlb3ZN?=
 =?utf-8?B?TXdxRmQzaUVUL29NSkFjSHZJM1Fjb2oxczRKQ2RPZzBXR0R3a0NnRnFFNlNi?=
 =?utf-8?B?dFdOQWtvY251N3pQWkpWWnV5SElpVWxwck1MaEhsZ3hrdnkyNllqc1A0Q1R2?=
 =?utf-8?B?UkZCNWlxeG8yUzBYOEdHU1B1WE5EL2RNcENrMHE2cnJpeHZKcjBLbGY3aWhn?=
 =?utf-8?B?Qk5ONTlMOHFnU0xMWlprbUJ0ZW9YNVhBU3orNEQwdUhlQitENGI1dGY4c1dU?=
 =?utf-8?Q?hWLy3Q8yfOrxlq7RO/qetP6NM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e4eb7a-04c3-4a5c-75e3-08daac17627e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:02:46.4624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTzJI2Cl16/njxVEuPr55qx2+GzUSe2xR/7Eo6uwi1PH8PBVmulCrJNIMJSJgaoM7qHyBhVCVAgGabVRRK4nvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4588
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_03,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120039
X-Proofpoint-GUID: yFn-JV5rl2r1sqFecm_QHCaNLXZYQm7H
X-Proofpoint-ORIG-GUID: yFn-JV5rl2r1sqFecm_QHCaNLXZYQm7H
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------6mOsVIvgRzHilH9NwECndvcB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/11/2022 8:09 PM, Jason Wang wrote:
> On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>>
>>
>> On 10/8/2022 10:43 PM, Jason Wang wrote:
>>
>> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>>
>> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
>> backend as another parameter to instantiate vhost-vdpa net client.
>> This would benefit the use case where only open file descriptors, as
>> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
>> process.
>>
>> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
>>
>> Adding Cindy.
>>
>> This has been discussed before, we've already had
>> vhostdev=/dev/fdset/$fd which should be functional equivalent to what
>> has been proposed here. (And this is how libvirt works if I understand
>> correctly).
>>
>> Yes, I was aware of that discussion. However, our implementation of the management software is a bit different from libvirt, in which the paths in /dev/fdset/NNN can't be dynamically passed to the container where QEMU is running. By using a specific vhostfd property with existing code, it would allow our mgmt software smooth adaption without having to add too much infra code to support the /dev/fdset/NNN trick.
> I think fdset has extra flexibility in e.g hot-plug to allow the file
> descriptor to be passed with SCM_RIGHTS.
Yes, that's exactly the use case we'd like to support. Though the 
difference in our mgmt software stack from libvirt is that any dynamic 
path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ) can't be 
allowed to get passed through to the container running QEMU on the fly 
for security reasons. fd passing is allowed, though, with very strict 
security checks. That's the main motivation for this direct vhostfd 
passing support (noted fdset doesn't need to be used along with 
/dev/fdset node).

Having it said, I found there's also nuance in the 
vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation: the 
fd to open has to be dup'ed from the original one passed via SCM_RIGHTS. 
This also has implication on security that any ioctl call from QEMU 
can't be audited through the original fd. With this regard, I think 
vhostfd offers more flexibility than work around those qemu_open() 
specifics. Would these justify the use case of concern?

Thanks,
-Siwei

>   It would still be good to add
> the support.
>
>> On the other hand, the other vhost backends, e.g. tap (via vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as parameter to instantiate device, although the /dev/fdset trick also works there. I think vhost-vdpa is not  unprecedented in this case?
> Yes.
>
> Thanks
>
>> Thanks,
>> -Siwei
>>
>>
>>
>> Thanks
>>
>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>>
>> ---
>> v2:
>>    - fixed typo in commit message
>>    - s/fd's/file descriptors/
>> ---
>>   net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>>   qapi/net.json    |  3 +++
>>   qemu-options.hx  |  6 ++++--
>>   3 files changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 182b3a1..366b070 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>
>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>       opts = &netdev->u.vhost_vdpa;
>> -    if (!opts->vhostdev) {
>> -        error_setg(errp, "vdpa character device not specified with vhostdev");
>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
>> +        error_setg(errp,
>> +                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
>>           return -1;
>>       }
>>
>> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>> -    if (vdpa_device_fd == -1) {
>> -        return -errno;
>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
>> +        error_setg(errp,
>> +                   "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
>> +        return -1;
>> +    }
>> +
>> +    if (opts->has_vhostdev) {
>> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>> +        if (vdpa_device_fd == -1) {
>> +            return -errno;
>> +        }
>> +    } else if (opts->has_vhostfd) {
>> +        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
>> +        if (vdpa_device_fd == -1) {
>> +            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
>> +            return -1;
>> +        }
>>       }
>>
>>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>> diff --git a/qapi/net.json b/qapi/net.json
>> index dd088c0..926ecc8 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -442,6 +442,8 @@
>>   # @vhostdev: path of vhost-vdpa device
>>   #            (default:'/dev/vhost-vdpa-0')
>>   #
>> +# @vhostfd: file descriptor of an already opened vhost vdpa device
>> +#
>>   # @queues: number of queues to be created for multiqueue vhost-vdpa
>>   #          (default: 1)
>>   #
>> @@ -456,6 +458,7 @@
>>   { 'struct': 'NetdevVhostVDPAOptions',
>>     'data': {
>>       '*vhostdev':     'str',
>> +    '*vhostfd':      'str',
>>       '*queues':       'int',
>>       '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 913c71e..c040f74 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>       "                configure a vhost-user network, backed by a chardev 'dev'\n"
>>   #endif
>>   #ifdef __linux__
>> -    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>> +    "-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
>>       "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
>> +    "                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n"
>> +    "                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n"
>>   #endif
>>   #ifdef CONFIG_VMNET
>>       "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
>> @@ -3280,7 +3282,7 @@ SRST
>>                -netdev type=vhost-user,id=net0,chardev=chr0 \
>>                -device virtio-net-pci,netdev=net0
>>
>> -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
>> +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
>>       Establish a vhost-vdpa netdev.
>>
>>       vDPA device is a device that uses a datapath which complies with
>> --
>> 1.8.3.1
>>
>>

--------------6mOsVIvgRzHilH9NwECndvcB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/11/2022 8:09 PM, Jason Wang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">


On 10/8/2022 10:43 PM, Jason Wang wrote:

On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a> wrote:

Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
backend as another parameter to instantiate vhost-vdpa net client.
This would benefit the use case where only open file descriptors, as
opposed to raw vhost-vdpa device paths, are accessible from the QEMU
process.

(qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1

Adding Cindy.

This has been discussed before, we've already had
vhostdev=/dev/fdset/$fd which should be functional equivalent to what
has been proposed here. (And this is how libvirt works if I understand
correctly).

Yes, I was aware of that discussion. However, our implementation of the management software is a bit different from libvirt, in which the paths in /dev/fdset/NNN can't be dynamically passed to the container where QEMU is running. By using a specific vhostfd property with existing code, it would allow our mgmt software smooth adaption without having to add too much infra code to support the /dev/fdset/NNN trick.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think fdset has extra flexibility in e.g hot-plug to allow the file
descriptor to be passed with SCM_RIGHTS.</pre>
    </blockquote>
    Yes, that's exactly the use case we'd like to support. Though the
    difference in our mgmt software stack from libvirt is that any
    dynamic path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ)
    can't be allowed to get passed through to the container running QEMU
    on the fly for security reasons. fd passing is allowed, though, with
    very strict security checks. That's the main motivation for this
    direct vhostfd passing support (noted fdset doesn't need to be used
    along with /dev/fdset node).<br>
    <br>
    Having it said, I found there's also nuance in the
    vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation:
    the fd to open has to be dup'ed from the original one passed via
    SCM_RIGHTS. This also has implication on security that any ioctl
    call from QEMU can't be audited through the original fd. With this
    regard, I think vhostfd offers more flexibility than work around
    those qemu_open() specifics. Would these justify the use case of
    concern?<br>
    <br>
    Thanks,<br>
    -Siwei<br>
    <br>
    <blockquote type="cite" cite="mid:CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> It would still be good to add
the support.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On the other hand, the other vhost backends, e.g. tap (via vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as parameter to instantiate device, although the /dev/fdset trick also works there. I think vhost-vdpa is not  unprecedented in this case?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes.

Thanks

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
-Siwei



Thanks

Signed-off-by: Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
Acked-by: Eugenio Pérez <a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>

---
v2:
  - fixed typo in commit message
  - s/fd's/file descriptors/
---
 net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
 qapi/net.json    |  3 +++
 qemu-options.hx  |  6 ++++--
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 182b3a1..366b070 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,

     assert(netdev-&gt;type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &amp;netdev-&gt;u.vhost_vdpa;
-    if (!opts-&gt;vhostdev) {
-        error_setg(errp, &quot;vdpa character device not specified with vhostdev&quot;);
+    if (!opts-&gt;has_vhostdev &amp;&amp; !opts-&gt;has_vhostfd) {
+        error_setg(errp,
+                   &quot;vhost-vdpa: neither vhostdev= nor vhostfd= was specified&quot;);
         return -1;
     }

-    vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR, errp);
-    if (vdpa_device_fd == -1) {
-        return -errno;
+    if (opts-&gt;has_vhostdev &amp;&amp; opts-&gt;has_vhostfd) {
+        error_setg(errp,
+                   &quot;vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive&quot;);
+        return -1;
+    }
+
+    if (opts-&gt;has_vhostdev) {
+        vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR, errp);
+        if (vdpa_device_fd == -1) {
+            return -errno;
+        }
+    } else if (opts-&gt;has_vhostfd) {
+        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts-&gt;vhostfd, errp);
+        if (vdpa_device_fd == -1) {
+            error_prepend(errp, &quot;vhost-vdpa: unable to parse vhostfd: &quot;);
+            return -1;
+        }
     }

     r = vhost_vdpa_get_features(vdpa_device_fd, &amp;features, errp);
diff --git a/qapi/net.json b/qapi/net.json
index dd088c0..926ecc8 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -442,6 +442,8 @@
 # @vhostdev: path of vhost-vdpa device
 #            (default:'/dev/vhost-vdpa-0')
 #
+# @vhostfd: file descriptor of an already opened vhost vdpa device
+#
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
@@ -456,6 +458,7 @@
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
+    '*vhostfd':      'str',
     '*queues':       'int',
     '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }

diff --git a/qemu-options.hx b/qemu-options.hx
index 913c71e..c040f74 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2774,8 +2774,10 @@ DEF(&quot;netdev&quot;, HAS_ARG, QEMU_OPTION_netdev,
     &quot;                configure a vhost-user network, backed by a chardev 'dev'\n&quot;
 #endif
 #ifdef __linux__
-    &quot;-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n&quot;
+    &quot;-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n&quot;
     &quot;                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n&quot;
+    &quot;                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n&quot;
+    &quot;                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n&quot;
 #endif
 #ifdef CONFIG_VMNET
     &quot;-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n&quot;
@@ -3280,7 +3282,7 @@ SRST
              -netdev type=vhost-user,id=net0,chardev=chr0 \
              -device virtio-net-pci,netdev=net0

-``-netdev vhost-vdpa,vhostdev=/path/to/dev``
+``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
     Establish a vhost-vdpa netdev.

     vDPA device is a device that uses a datapath which complies with
--
1.8.3.1


</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6mOsVIvgRzHilH9NwECndvcB--

