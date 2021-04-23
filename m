Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E63369850
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:28:23 +0200 (CEST)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzbK-00059h-L6
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZzZp-0004dS-9w
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:26:49 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZzZf-0000z7-Tb
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:26:48 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13NHPiAG185670;
 Fri, 23 Apr 2021 17:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=nfjH4adu5sTW+EmDe6ACAN8kq++BB/PQN8x6x0cOOpA=;
 b=KvQKwP7Q8AMcG5tDglMKInQvq95S5KrJxN3nTKVMIBG9BpWRgRwQcODgs5tkw97ldF0O
 vJlqpvOUzhUJxW7AoWrVlSUGvSPnyayqO7Jvn5E2DM0gSe6tFQZujlLF4gp704mohflX
 8DZcxnLRhMqk+ZIzkHtIpyzP2jGFEqc/5vSX/s4gHJA6OsBRF4nvcKrGcRNBbqIx65di
 CU3ID4YRGNYQjMHgEc+nv7appjtQZnVz0prXNSjcN8AXIvdOXKq792wbup/ex3EI/Gqv
 2k7TftK6y78aaWNtHoJG0VXzlZ6dhu6OCZ/zpjAXaBnfd+uvE2ezFd39lrt7YFaEbiyf aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37yvearrhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 17:26:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13NHLVON045762;
 Fri, 23 Apr 2021 17:26:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 383cbfpjgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 17:26:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKVK1to0kykQm70Z7gheiwseuM91alSAx8idGdLzYFIiwmxAye0lKtLZZ7bApQiRztag6BfKhsK2B8yydFAmTLAI6TydyARvEuvRgYxEhHC+7/QC0i9+Jb/Nx+TSu+jTRQ27TYnhooDvBUCw004mV8X8L/Qw95sbi8f/fldqWVgCQGyIDwLtr/NBCvPwBS12Q/SVbRwi4wpwXEqtWvryOEH67Ciq78SJ+jH+YVHdWJalR9oQho2+b3/B1z3MSg3jgqFU7E1AujVpXEg39JLf0n1fpCW6X2OMUcfdKgEZtXyJJepvVDtghQOrCnW2llg4ExGiY9aNycai/pbUUj8xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPvOkp7Lr5dSY33oS9dQNuFjO/sz/kDxeTZC6vnvHeA=;
 b=DrX8LZxHsOzImA+kXkn/xKr/AycKCjIt3ETAEvc+FyHBh8hyYoyCut5X38XHtmI50L0rFxguSsgDRVDxKiLSVqWs+CKEAIxeoonZZkYaDwm8oetQlXXYseFfTL4Jx+PQSP9ni4eAw/JOt4SzVL+emhVsR3dPWYl64hok53CK+3BLy1r7nbms2hQtu4q3lGaiWWYGLK/n7bfi4hWvRmi+iihFSIsuw5AS/IMCdOqrvEDRUi2hV+pjUKeBl+zeJNFv04sgynySzr/s640ynejn5e+Ng8pQSH2jBJ8H6Y5BuZYFBqilS3XOcY4eDPPQKW0huo3f0nW1X9al827pvoObWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPvOkp7Lr5dSY33oS9dQNuFjO/sz/kDxeTZC6vnvHeA=;
 b=h4mpmhXL/Q3/LcjntnrqxFISIQ5qbwkv64NumOIaEbxEdPWFkJdTNBMM+sOJoiYINlZwUB/Q1vV+FoHmrMAeiinsAdL/msy8J1Nvt1SVDVEsP3QBziiI3E2ivfAlcz5NA/M+J3eyfszegEhr1vRzs0YQJCexI+8xZ+Qy8naoaZk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5424.namprd10.prod.outlook.com (2603:10b6:a03:3bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 17:26:33 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 17:26:33 +0000
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com>
Date: Fri, 23 Apr 2021 10:26:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SN4PR0501CA0059.namprd05.prod.outlook.com
 (2603:10b6:803:41::36) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SN4PR0501CA0059.namprd05.prod.outlook.com (2603:10b6:803:41::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.18 via Frontend
 Transport; Fri, 23 Apr 2021 17:26:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 206cb35b-d6e1-48c2-53d2-08d9067cf0a4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5424DA33DE6963511A6A64E4F0459@SJ0PR10MB5424.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uzn44u3t/5aQGtko7HbEie7QQNeP7mu/zCbth+Usu1anc5bthB+DD+wK5gwko+jVZLNhytPY0UGZB9Zi/n6jKrXbmsHeKijpJQofNvcbbHGusmmMQTDnhmDZZftkhqcBNZzh+uEyX7AgnbfWqS3iSCWR+2pCaaqzjoSQ8AjiUAMi7juEyxqejrgXmXQkBT/4teFz6NkAd++nOmTV8Bmdi3nl/EmlCJ/V0ZJL6/oRncWiFImD5fZQJqucvk68AKLjxESWBjhdXDhtp/667m++yplRMKQfdGI10I3GnjDykf8tw9QBhhS7SqjIIuyaO586qf+rIo5yq3poP2aZEo27A51qKQ/No2U6MLzbdPzZEFiRjf599BzaM4xLcSeqvV2xYiOpp5Tw2Nwi/vmvvHh8aMbeTEaJgIiCA8/dNL+Fc3jIHkwAha+UGwStNrLd8uQZCr1kaT//TMJ53kKfgwAu036VEUihdJci/Z+0SeSNSGeyABBe4yEuWopQbes2QJ24ehgXlwNR95++ZwiLH7oNmqmr5ElV5LEy6B8LyNNSFTtUmgsp5cqPYegABJSVcVVcCkSIH2XYs51cltkuIDLmr2jIwH1AqEsBRppYUMaXmPLMjzJbacTPzSIubUIKy6trj6hLqot7RA2lXasIk4ylRjQWlu5mz9IhDhKPh5t3ySaQ+nxB9c7ykjBTK0zKcWCaFRRu4CNftV/kpqtChvsX5lSQFKMMU3rojjAT+PjpSf6AcatSXnN1wIU4xIxepM5HHSX+2+qu5TdPDoy1BCKN3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(86362001)(53546011)(2616005)(478600001)(16526019)(4326008)(8936002)(5660300002)(38100700002)(186003)(316002)(2906002)(44832011)(66556008)(66476007)(36756003)(31696002)(31686004)(966005)(8676002)(66946007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?gb2312?B?S2RnY1F5SE1BL2JJbVdHa3FIU3lnMDVjRnpySWRmdzVmdVByR3dLSkFncDdO?=
 =?gb2312?B?eHVDaE9nbVRWcnd4V1Bpc3JkR2ZZRHE1TUZXR3B4bmorQUtOSThQWDdRNVhR?=
 =?gb2312?B?VWMzNEpxNXFDWU55bStYYWY4YThKOE5DK0JqWGpJdUt1WDV3RjNZT1VwVlJo?=
 =?gb2312?B?eHdDYTF3Q3BnWGhIUnBGZEpxRUpPcmNwQjVjY1hjVjNjemFoSGZjWVZkUFUr?=
 =?gb2312?B?eWRQckxoYmFmWVBBUkNiNGFOZTV4MHgrTHBOY3BlVTZPZ2hTeEJDaWpFVXBr?=
 =?gb2312?B?cGx4emZNcFFNQjNHbWlCeEhxOXdLNFM1SUV4Ykc2TnJ2NzhYakFMWGU0OEFu?=
 =?gb2312?B?SEVuYWtmMkVPaTdwcGRYdWNkL3dmdHZwdEwxRU9ZY3hkYklxdzRwa0RENmhh?=
 =?gb2312?B?MDdZemVoZGM3MURoRTJrNDVNN2M1d1Y1RVRGa3BaWkFraEJ1cHpzQ0dwYklY?=
 =?gb2312?B?QjM5VGtTVEVTY21CWkdEdUFCS0cySko0eGxnbndBRFB6bFQ5MFc5V1J2YXpx?=
 =?gb2312?B?WmMxalVvQTBCeU9Nd243MVJlSkordXhqSDVyU3UxTzNSUGRIWTM4OFVSd0JW?=
 =?gb2312?B?NEVUUGczOTF6eWZXbklYc1o4aVVNTzFlUkhaQmE3WlFIYmlMdTFod01FVDEw?=
 =?gb2312?B?S2o5enNudm9sWmtzc1NQcTUrQUI4MENwQnRDZUNobnpCT0xEbk0wNTBIbHhk?=
 =?gb2312?B?dDlRM1NscCt6ZC8wOU9uN1RlWk1Cdm40RnFycG9pVzZVcFVRelpqOXI5MXF0?=
 =?gb2312?B?cks4WHcwT2tpdWJueTg3NE9rb1dRM2huUWNYRGxvNkdPTGNSemxuSnByZFpI?=
 =?gb2312?B?Umg4RDgrVG5EbDVmcmRvVHRnL3R4TUEzcVdBRHRsMFhTSjlKMVZLQzQ2b2NQ?=
 =?gb2312?B?UDhSZ0xabnE3ZXpTb0FrZU5IbU13RGR0Y2VXRGJLcVd2MmxFL1UyWUVVSUNy?=
 =?gb2312?B?bElFdmZzWC9WeFIwMUtZVUdJbDNuT0ZjZWMvdUxINWN4emxmZWo1T2UzcE43?=
 =?gb2312?B?cno4RGw5WTZTVnJVK0Q3eENuWktTZ0VURExQTVVyWm42MlMyaTNpdjlJV1N3?=
 =?gb2312?B?ZVFqdFJvRWVJNGE2dHJlcWc2d3Vwa0NLOTZnK0xxcXhObGN2QjJFcklmQkR4?=
 =?gb2312?B?NnIzSzQ5c1o1eHpTTUJ1aW9SaVl2bms3NkNkcmFzcTlxZUhXL3VwUWE5d2l3?=
 =?gb2312?B?MU1ndjVzQ0lKeTFVWEl5d2pwTnNIZHJWcVI5U2dwYTVrSU1TNUZwcGVpOC91?=
 =?gb2312?B?L0VQTThVWVQwdjFtQkMyZ1pXcEhCV2NKOGQ4UTdrV0c2c1hNL2VlblExOVpR?=
 =?gb2312?B?QUlyZGU2eHBGTGpZRklxNlk0ZHN6S3UvTkhUbTRjWUNkb0IvdUJnUFJ1M2Iy?=
 =?gb2312?B?ZFhFY3I1UTErUjU4REYyNFZ2WERKWVVkUTVoSFI2eWtkZWc3NDV5djdxVWh3?=
 =?gb2312?B?WXIxSmlmL1pqN3R4RDVmekpmSWhybElaMlZWWVRiWDBWUlpET0FUamErb1ZF?=
 =?gb2312?B?dE1TNEwxN0RHbmR1d1NPdnJXK0RzWE85RXB5VVBlR0REdWZmQWY1NE51QU84?=
 =?gb2312?B?Q1VxYXFWcGRBdkFoYkNOYjMxRHB4cEZkdy9NY3lyNzVLcVp6MUNoNHNFWnBM?=
 =?gb2312?B?eW9iYVBiSEgxcHd1VEcxS2ZtalRQVWRyaUlmbUFycThzUXFmdjJzNmhQRVdl?=
 =?gb2312?B?TmdzOFJ4ZGo5ak1mVnpSVk1aK0NqenJNUHdXLzlTVTlnVldjRHkzRXV2WVlR?=
 =?gb2312?B?TDdKUjVNTHVjaFM2ZmQvUk9VUG5sOWVESTVlZytneFV3cm9ZamhUYStlQy9j?=
 =?gb2312?B?UEtFRmVvUzdNZVh6ZVhuUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206cb35b-d6e1-48c2-53d2-08d9067cf0a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 17:26:33.3427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/x5jaAhsgLpBMUFA7Ocl7OIiI0EzjeLX1cXhKWSwHuvPXRdSQZthEcP/jyaMj/pZ6sr17zcoGHle8/T6aYH+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5424
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9963
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230112
X-Proofpoint-GUID: TRGg6f1vt9XjBhFKmkpz8OPkufo7ztV8
X-Proofpoint-ORIG-GUID: TRGg6f1vt9XjBhFKmkpz8OPkufo7ztV8
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9963
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230112
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/22/21 11:01 PM, Jason Wang wrote:
> 
> ÔÚ 2021/4/23 ÏÂÎç12:47, Dongli Zhang Ð´µÀ:
>> This is inspired by the discussion with Jason on below patchset.
>>
>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmBTF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
>>
>> The new HMP command is introduced to dump the MSI-X table and PBA.
>>
>> Initially, I was going to add new option to "info pci". However, as the
>> number of entries is not determined and the output of MSI-X table is much
>> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
>> adds interface for only HMP.
>>
>> The patch is tagged with RFC because I am looking for suggestions on:
>>
>> 1. Is it fine to add new "info msix <dev>" command?
> 
> 
> I wonder the reason for not simply reusing "info pci"?

The "info pci" will show PCI data for all devices and it does not accept any
argument to print for a specific device.

In addition, the "info pci" relies on qmp_query_pci(), where this patch will not
implement the interface for QMP considering the number of MSI-X entries is not
determined.

Suppose we have 10 NVMe (emulated by QEMU with default number of queues), we
will have about 600+ lines of output.

Dongli Zhang

> 
> 
>>
>> 2. Is there any issue with output format?
> 
> 
> If it's not for QMP, I guess it's not a part of ABI so it should be fine.
> 
> 
>>
>> 3. Is it fine to add only for HMP, but not QMP?
> 
> 
> I think so.
> 
> Thanks
> 
> 
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>>
>>
> 

