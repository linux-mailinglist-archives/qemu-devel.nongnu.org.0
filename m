Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16C351636
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:32:42 +0200 (CEST)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzJJ-0001yn-LT
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joe.jin@oracle.com>)
 id 1lRoqg-0007YJ-Rk
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 00:22:26 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joe.jin@oracle.com>)
 id 1lRoqe-0005Tx-0J
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 00:22:26 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1314J4N7098279;
 Thu, 1 Apr 2021 04:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=MbfuocyiQmRIsA35pMafZoxqOQTFbX5Ck2kHbB6+02Q=;
 b=Dwlecp/AwNXa1x48ORpAILk1ZUsDmtXxXCYEKHbRdbYDTIoM4ZEdWpfTSpSwYyulNAMV
 voOHU1HGNovIgri9rX2LB9Z6RfzRuIGY3cPcrx6g4eixe5H/9Lp7ZqvHHX1T35yKb+BW
 vGMELuu+N2R3Pb6CfdkYJ47zd34oV1YBpXBwAb5t2+kUVtCK4lE56Ubt0TtCqmXzlItn
 YoH3N8K5qXw8PeXklL9ov9bYuj8RUDVltTAN+P37LpDlmZ0hZ/h/dMdkZOPIsMZ6KLlX
 FW5zrdk9dulZqBuNQ5gmf2qkM4tWRCBNtEBRQMCTEYnIYjx8CvEYEDeQ4nKlL/ggXJKr GQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37n33drajj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Apr 2021 04:22:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1314KgRB035731;
 Thu, 1 Apr 2021 04:22:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 37n2p9ydnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Apr 2021 04:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7NX+34eAOOPTb+2UHxerP1qiPZuJTLgANDk2AzqjB6zksWNympeKGlYYK3XeA9SkInDAE9kaGa5m4y3XUQEK/beRhkmz643mopXwhfQapalyn35YyCqyNv2nj5+aoGTyz/jr8bLp7xMSi9ZFwyYA5e14vM32LkoecHh2V/18M7jsf513OsD4INkH9fx77J98iqhULPBrCnpIlkNtpun6gQAzpJPHvNBSG8D9ODW7IMfFt3U7XlKCTuS6sew2BHrAWBjBO4vzgYG7BKS4x0te12V7aevD/DMgxLg6PO95hIvcit89fZzO2T5g17ZqNrSU1Nk2L86mdxpjVUyD2B/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbfuocyiQmRIsA35pMafZoxqOQTFbX5Ck2kHbB6+02Q=;
 b=OvfK314AOBcbdIv1qKJn/JQJOZn++xA05H68/MhcRVrVVCl+SIqPc5v1TcoHjid/Ubq+OrCuYkcviak7nnI6La38uYnGBwmViV39hBrIH0KFneJmz5fFTIiLOxZYa8WYHEspw++ViqmfDYe5keL9pokKUg5oS/HqBepozPKVlbMEt973IvGx4rmLW8b4r/kxhGzcDKXHDFJPZ+4rt6ZZ9zHVJXz0rF7NoPkyAqxfSaMRFUb4oCNj0FTKa+tsW6jjLgOsAK2zgaZQtL/L2Ce6xchUASz0TFkMuFkVWRnNwGO9Uck6fMXjvEaG+3ssTGplHCBLhufx1PMBN7LaQ3EklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbfuocyiQmRIsA35pMafZoxqOQTFbX5Ck2kHbB6+02Q=;
 b=cpfbiNcn6vQS/69UYdL+qxqyrwRc1Grjs3xkKVFxkoOGeE2khxpYXvf0ajpucFFoyGOZbbZHiknBGaxNiYIoTbzgQ3nqlQWhVlEWecKj8YqCNlBoyp5C/gpV6IBB1d+8Ebw6XnyB8nvnkbbpy/IKc6N64y+hTslZusYhotS1iUY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 by BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Thu, 1 Apr
 2021 04:22:16 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::4929:75f8:9882:df9c]) by BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::4929:75f8:9882:df9c%7]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 04:22:16 +0000
To: Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
From: Joe Jin <joe.jin@oracle.com>
Subject: [RFC PATCH] block: always update auto_backing_file to full path
Message-ID: <ce32e1c2-c652-e83b-a6f4-c9773099cf9a@oracle.com>
Date: Wed, 31 Mar 2021 21:22:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2601:646:c601:8dd0:adea:4c78:58c3:a24a]
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To BYAPR10MB3160.namprd10.prod.outlook.com
 (2603:10b6:a03:151::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c601:8dd0:adea:4c78:58c3:a24a]
 (2601:646:c601:8dd0:adea:4c78:58c3:a24a) by
 SJ0PR03CA0172.namprd03.prod.outlook.com (2603:10b6:a03:338::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Thu, 1 Apr 2021 04:22:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d957cd44-caf2-4950-dec8-08d8f4c5bba8
X-MS-TrafficTypeDiagnostic: BYAPR10MB3160:
X-Microsoft-Antispam-PRVS: <BYAPR10MB3160F36E0E1A893152B1E9E3807B9@BYAPR10MB3160.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rnjd3GbFvDSyJhxdz73smPj2+kZ6QznoWilpNXBuZEqXh8ydr7RlI2ua77QWLsBYAFfWgDRnoxygRkREvS1riVPTpFyuRGv7D0xRMtLurqOYV/1/rhk0PHaxVJqJYgCeiULTm103bHEypHncnmNbaBf5LEvxVEgpWWpm5/JIx1FVgnwYwVWhppS4Zmj0QK39LUaJTIkufSUWzEzjv33B8p+FFKqNZUi1eONlsq0Yr4mTspfHMkfY1FbFa2nKRUl9oAqU9vjayaRG0zQ3ApG4CgI9xzeYiP1OxLkGsjxaxO+KzVa1VuWwTDocYkAWUeMlBo7QYY2YY8/zNJ0oJtvkBalT9Msf+87DhOje8XWtUXgVw8TJJI7R5IFIqfD5T0jOy41u8PNmT9WwWe2Zc8OEbFkwSkzuVTqpdSe7OL9HIhVTWwEY+kYT5STKNsKygSLEZoD5K8Gk4KJiyb+YY98YecyZ124FY+CkbgHwMc/08jmUsmRjpNiKiSABZr30y6LGdCuUaqL11kma4THYY/bwpc/Xb4MEfUO9sG7bDWuWi2+uteZqTVVRxEsknlDhdzb5nn9ctpRCjleIQ14A5euFVhcQImx1fJTDfIh7z9ey78VF3cM4dPqxeX1bD05Fmtt4MmAJMPzuzv9E7C8pmTgOP3dfUpzDalXkmseMzgBwwL8Bx73dxvA5tXvKnbfCpUbc1bvgzfkEUpAjr3hKn8Uc1CEHKW/qRehvxib+OCWmr2LUFpaKo0qdOwJcCLHsvNG1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3160.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(186003)(31686004)(66946007)(16526019)(31696002)(2616005)(478600001)(6486002)(8936002)(66476007)(316002)(86362001)(15650500001)(8676002)(83380400001)(44832011)(36756003)(110136005)(4326008)(5660300002)(38100700001)(2906002)(4744005)(66556008)(46800400006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDhsQXBCYTFNeFc5QzcwOWx6RUJGNzU3eGRKQzF3UDB6OFhKck1BQjQvNXR1?=
 =?utf-8?B?QzBOUnlnOHpoL1NPWWVRU2w4Slc0eG05R2hVSUI4MFNEWkVyMUYzeDRmYmZD?=
 =?utf-8?B?NUNScHVzUnFUU3ZES1BHNXBNWnVXVnY3T29CaXJjZXZjZkZFbHVwZEFEbHNK?=
 =?utf-8?B?cDlyZ01UblFRU1ZUR1J0TloyVzV1Y25YUEhGZEZjQmZCd2h6MUt1SVc4bll6?=
 =?utf-8?B?ZVhSVzVlUWxxbzg5cmU0MlVjaEowUzcwQjI2TWRiZGpuUy9JVmJnZnQyQWY0?=
 =?utf-8?B?d2lHR1dHcnBETXhHdHVwM1B2dytzTUxhODRZOTIwL0ptSnZCdGJud2IzM3lP?=
 =?utf-8?B?K0QwNmIwR1BjQTRQU2FkMTgxajBSM1VaVzFVM3BqbnprenV1SjFhS21VNEhV?=
 =?utf-8?B?bzVKWk8zVURPdUFJUXAxaDd0amtRVUExZHlsYTgvd25PbXoxdjBMb1Y0M1Bt?=
 =?utf-8?B?Z1VTK2NXV1N2dFlDUElPNG5kYmYvT3FPUDUxUndsUDNobkZadE90V09YNVE0?=
 =?utf-8?B?UEV2dnJPeEprYzYzaytuNWhkK0VsVS9kNW93Wll3UHlSMVppb2VDbVAyMjFl?=
 =?utf-8?B?SHhTbzd0Lzk4TGs4U3g5N211eW9yTTRHMEpwN3BJVHZ2WWplK21jZFZDUzFs?=
 =?utf-8?B?QU5kb3ZXRnRsL05peU1IWkdjUGJ5dzc5VFdMUGNmMjk1blVScmdPVHVHQld0?=
 =?utf-8?B?Y2JFNU1WY1pqMlhoZFRUNmhwZVJIUE51MlZ5MW13c1RYYitiY2VyTk9qeWk1?=
 =?utf-8?B?WDNjSHZCeGMxT3J5ZFRtdGdwQzRJeWtiNlpXQnJQTW9sQStMWlYydEJkZUtH?=
 =?utf-8?B?MVFHM1Q2Rk4yUXFsQVJDMXBqSmpHL1lCYkJkOSt0dlB2L0czK0piaEhyY1Rk?=
 =?utf-8?B?VUYrN1pIQ2lGU25oM2tOeUtpdVNtc25wWXludGFmbDNUV3EwcDByY3BhcGMx?=
 =?utf-8?B?YVRzZDBueU9YYmNPU0xzV3pUUnRGajVJdVFGRklIaUJTcVdLcUFrcnhQNWlr?=
 =?utf-8?B?MGJaMXEyeG9SV0NvUGJFTGd5UVJXWjcyZHFiTmowbUhiZDNNUk5aWHVTZFJV?=
 =?utf-8?B?UWltWXhhWVVmTUh0U08rcGhOcDZaOGIzY1g0NHFSU3IyWUN2WXdXdFdpNDZJ?=
 =?utf-8?B?SHRDeFhGY0VwcGNINDBHYjlQL1FlcDRKUUJETmhBTnZrM1N5eFhrSkp5TG1y?=
 =?utf-8?B?WjdGYU1XMTlvcmFQWVdZTExSbUlkSlVrRzVMQzhEWVRCTFJXZnp4dnFuYWFY?=
 =?utf-8?B?ZGlOSkVGMzFNR2RUMDNBSzA5TmVqZTU1SmtwVkVIUmdSY3FDRnBSQkZ0ZTN2?=
 =?utf-8?B?a2Z0eUZaS3VzYVZGL3MvZU84Mnp0SWZ4Z1g2eXh0SkRIS3FCV3VrTVNlY2ps?=
 =?utf-8?B?UWpyOG5ZNGZWWDNpTWJWR3k3ZkNjZCtCSGswYW44dEQ2ejlTZGVGaysvTEsv?=
 =?utf-8?B?emsvMndsTFBib2FDUDdlVTNBZDZ1NURJWDhTbTV1azdDK3g1TEc4czhxRDUv?=
 =?utf-8?B?MjE3MUljL05HVGMwVU1nWnp2d3JCTWJnYjdJNXB4R0lxcFd3cG5JRnI2d09H?=
 =?utf-8?B?b2tHbjgvQldJL0FKWExGMTY0YUNubytWMDd0OGNpM2xzSy9iTWw4NE1pcVRw?=
 =?utf-8?B?TlNwN3Erd0tId0lVL3pLdXBBV2FwS0ZvR1U0V3ptcVFBQlpQMmJSd2F6azVD?=
 =?utf-8?B?U3RRK3NScGh1dmR1U0JGdHNpcmZCQUhiSStkMEloZjQ0Ly9vNDIzTldIcVBR?=
 =?utf-8?B?bVRENC9wM0Q4MndUR0tMUlZjajVCRWNDSk54UnhpRXBvMGhZZlJaMXRpR1M1?=
 =?utf-8?B?MGxiRUtBN2VKTUp6dDB6MFE3TzZKSTB5Q3hVNnF2RldMd1pGdnMrU0J5L0Qv?=
 =?utf-8?Q?zREvPeM/a7Fd6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d957cd44-caf2-4950-dec8-08d8f4c5bba8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3160.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:16.8375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuqpUZqqrsmfkLh/SVWGZ5hx4kqMM0jZypxfGzwvg9oJxW3ghon6s442QEuDOGjCaDvSNM57oKz6TZ1Qme26qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3160
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010029
X-Proofpoint-GUID: ID6Weqz4GwfHl3wV2GRcaZGPLkXpwTKN
X-Proofpoint-ORIG-GUID: ID6Weqz4GwfHl3wV2GRcaZGPLkXpwTKN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010029
Received-SPF: pass client-ip=141.146.126.79; envelope-from=joe.jin@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Apr 2021 11:27:33 -0400
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some time after created snapshot, auto_backing_file only has filename,
this confused overridden check, update it to full path if it is not.

Signed-off-by: Joe Jin <joe.jin@oracle.com>
---
 block.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block.c b/block.c
index c5b887cec1..8f9a027dee 100644
--- a/block.c
+++ b/block.c
@@ -6969,6 +6969,19 @@ void bdrv_refresh_filename(BlockDriverState *bs)
         return;
     }
 
+    /* auto_backing_file only has filename, update it to the full path */
+    if (bs->backing && bs->auto_backing_file[0] != '/') {
+        char *backing_filename = NULL;
+        Error *local_err = NULL;
+
+        backing_filename = bdrv_make_absolute_filename(bs,
+                                     bs->auto_backing_file, &local_err);
+        if (!local_err && backing_filename) {
+            pstrcpy(bs->auto_backing_file, sizeof(bs->auto_backing_file),
+                     backing_filename);
+            g_free(backing_filename);
+        }
+    }
     backing_overridden = bdrv_backing_overridden(bs);
 
     if (bs->open_flags & BDRV_O_NO_IO) {
-- 
2.21.1 (Apple Git-122.3)


