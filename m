Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED136ABDC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 07:44:05 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lau2O-00085a-I8
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 01:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lau0f-0007f2-ND
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:42:17 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:56178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lau0c-0003mW-Ta
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:42:17 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13Q5avcd172276;
 Mon, 26 Apr 2021 05:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=PoSUtQOB52vHJcdzjzxnPBSouZ6W3obE7xtAd5pv6gg=;
 b=iplIlLtabIsa2+b86EGj06m1J7BJr3H8EQSZ+E3aoGs0Y6FP8wWUN0hdc9goTIiw+/y+
 XxE3FCPEBnLHdWHVu4DXiD9BbfNNzUpGH5AykhaFSaPMIDtH/HbHiFmQ1jJ+c3YzFUvS
 p7F9SiFoEAR3Awo6zpmtrdqCPbCHgT2V9GOfokm+oixR1esM0bZMQy+2GCwTeCEAkyMt
 bFVgMovsFwwa+w5+BDE2so+zGrceQpc19lh+IJ1g01o5opEZnLJ0kE/36tWytf7RwvEs
 DMXqZnkv+RMPKLEKWaMIFHleLNj2OMT5rrlV0Dn5G9oUoRXvycGWgxy3ixeU/QR+2wmn 7w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 385afprn49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 05:41:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13Q5ZepC111815;
 Mon, 26 Apr 2021 05:41:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 384b53xhbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 05:41:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+h2nBt9ftOWFK7EBJ44bYjI69YLdeBz6AsZHh2G6T2vJoM1GbbIJD5t2Zfrbhg9ln6fBC0Y04TZBpxK8cvG8IXRnSuXOIYEeiSZCxlp+C6iFxGMa0KC+Z7HmbX+e4Nsv66P9Bd/FUZ2yeDaErHjXFsg1B7ufwuK61xQeXzK79PGk3Z0jKVK+YgYprMWhpbt7WeRdz7OaYqp2jdBXI/RVYkRM7F/AhzQHf+Yo9dyNuAU2IC4Ivkml9JjoqzUsB+hSNleMYv9bB0hqYmpAyvRwlt/qHdI7GbYnJVsJzFWRckc6hr0z1O4wsnK/KsbJDkjKzW6kAfvyi47ytxtwMExKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoSUtQOB52vHJcdzjzxnPBSouZ6W3obE7xtAd5pv6gg=;
 b=hqNsOCj/VesQe/u9yk+9v4wiAEJMQcN6JGboERgJx+L4PualICYErpz50hRoUD9NXY3PQXEf8MGuTRevnNyNwB7AqRxhtaHut1v/SWrnCsD36nroRzkACHbmV7gjTOqEqUDvhTheAFAAQP8gzO83kNLj4yDWbxz7o9VEhs0GvhAkgHXR5kCgiUTm4IY1U41GAc1P9nANTIjsAxk96jLLEvAMq20jnvRYRZB4HhMLpi7RRSsc6L/VGwobg5QEZlxEUug25qcDgRNx8OIZj2ZxYWiwUwdCj/QSl9kLpQYOi9Qwv3UH0aXatqEZduglEuBg1Jj8u4sENeIZV9LQkwLloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoSUtQOB52vHJcdzjzxnPBSouZ6W3obE7xtAd5pv6gg=;
 b=vfBscUYevo78LHkU5Stn2knThmkO9kMGRUZHBYeaAWf/J+XUzpIF99DDa1gnG03SdMG62zg/SF01U+JX/vU7JGdLc4vXxnosTT3L8YGHeCyYXbYRzDgv+rdZNvuo0rb+JxxHi1WPmjys9YH3JSbKtDRh1/envSzJKklZzlL23Xg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5469.namprd10.prod.outlook.com (2603:10b6:a03:301::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 26 Apr
 2021 05:41:07 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 05:41:07 +0000
Subject: Re: [PATCH RFC 1/1] msix: add hmp interface to dump MSI-X info
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <20210423044713.3403-2-dongli.zhang@oracle.com>
 <c4d7bc63-cb44-0795-a37c-dbe2cc9f6fb8@redhat.com>
 <dd7ae079-ad91-dfc2-1ca6-04a0bdb89b78@oracle.com>
 <4627d0c9-0859-da22-a9aa-e42021f9b0b0@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <45094de8-bf82-4f5e-8ee2-2bbe74d4d5b8@oracle.com>
Date: Sun, 25 Apr 2021 22:41:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <4627d0c9-0859-da22-a9aa-e42021f9b0b0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SN6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:805:66::28) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SN6PR08CA0015.namprd08.prod.outlook.com (2603:10b6:805:66::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 05:41:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6112465f-bde1-4405-6c00-08d90875e3cf
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5469:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB54699F48291E5C5D293D4AB5F0429@SJ0PR10MB5469.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJMmVeH8I4AUDerCpsqFB7x/c3PCBwbpSAOlQ+rlITqQfv1zjZsfGjglZUOgjTg3aZuqiVKi1M55ATeQX9XVgpXx68hOvixBwo5jZpVyOYunKKPP+u9l+1eK76Yd6BaZb5GpouQIdrNFjhLOvlP6MF+0PyI6QzTaPZ2JT0OwrQdR21XLrwLtWm75oPEnKn0QyN46AyKGER3dAMCoPg20kaoNSbC/UMMhL0KaRTf/6uh9WcraE7sii0xtvJG3xXLzzMp7SnIVX8keVrSjoKs2GVacWywUBjNeXeQmxaPMEGn3uJ0huMK9jLaeMwzdChnyukDkSAPh95wsTGFJp0VnrmXqNzRlqcu1DtZ4T+lC0Uxk4M+7Bqa1e/MvAgLAfTKLhhhy6D13gibmHjr4uQAWXBcp1BV3fiAwJl7jgMsB/XfV0vHu08JsieMcofZwPIp2IESs1gMoC9fWe+HBoKHsU1EyzZbtqLxNRZh+zvv2v86g9/35brhLEF/CzbpAuOz+wprcHMXmHEtQP+LKuIVn5l5czkLkEw61tI0V+dCBOJNznUF8gp7AAyHKLbe3Lq64RvnaAb9E53tcMB0Z+olcYV14cf9Cee5L9bpvtpdYTz5YcTOor00TLa+d4UXJg1s70suM2k/n8Si29Sd5dyWKEA9vSMMBNRclZE0I47dhKqlFqHpJC33odWXh+VNPO23r+m1YkUzmMh5FEg56eOCcMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(366004)(346002)(396003)(2906002)(36756003)(316002)(2616005)(66946007)(66476007)(31696002)(8936002)(44832011)(8676002)(86362001)(186003)(66556008)(31686004)(6486002)(5660300002)(38100700002)(83380400001)(16526019)(6666004)(478600001)(53546011)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzYzN0RsR1lCR0lyUGFacGR1a1djL04zcGtwNldYdG1OZkhRUk5uMnBXeit5?=
 =?utf-8?B?aXNzbDVMSXZTOW8zSEl6U2wvK2JyWkU4RVNwYXdXNXFnZTZqWUxyS1J1aWZM?=
 =?utf-8?B?ak9XWVhiaHZiOUE0VHZEbU9wM0NXTUUzMHJyUTRxSzF4QWxtUEc4aVU5eDBh?=
 =?utf-8?B?eE9YU1czcU9HOGZNc0hHOFZIUTU4UVRtSEJ1SXJFWGRMYncyM3pKdEo5T01n?=
 =?utf-8?B?R0NzZmhKYytRZVVwU3dFdUEyaHUvUkZYWlpPKzBEZ0U2UitkTHYwMCtHZGc4?=
 =?utf-8?B?VEw4Sy9NSEoyc3Fpc2QzdnMwYVhzLzNlaW9UN3lnUVhFVWJJNEZsY1BBUjdu?=
 =?utf-8?B?V3FrVi9iOS9OTzZlS2hIUkRxd2RHeFVFUWJUMzIwV3g1WjZSbS9QU0FRZU9P?=
 =?utf-8?B?R0ZnUVlpYjhpM043UzRvR3dkVEdrU0pyUS9XdTVCMG1KV0s3cURxb1U1OHVZ?=
 =?utf-8?B?SlQxTW9QMUFyM0xQa3A0UzlnQ0lYajdudkxkYnNpbWFEd0dQZmtadnNrbzBu?=
 =?utf-8?B?Q2sxUk1QZW50RjRpb05SS0c2eVRwbEVjWHdjSG4wNjdIc3c3ajVHR2hJb3pP?=
 =?utf-8?B?cVBBcUJWNG1ZM2E3Q3hVOEpFSDRkdDFlMVM1cXhDalV1bzFNZmJhNEw5bm9x?=
 =?utf-8?B?MWN5MHJCSUkxVFFWM0tEbTl6NkxDMmdQVDlQRkkxYm5hMjFFSlRsQ3BuWGRy?=
 =?utf-8?B?aHV6ZndHNmFGNzA2S2laMW5MendYR2FRdVV3MkZmTWVWYXV3cndYWEsvR3Rq?=
 =?utf-8?B?UmdKSFFaZ28yTGJzYWdtOXlqb3RnSXdiVHo3MjA5dlFQa29oaUxaN0ZjNURi?=
 =?utf-8?B?cDZqVEZHeTdnTXJWVVMzRFB1VHMrQ2NBUkwzUzErcnVFVmROczg0N0VEMHJX?=
 =?utf-8?B?ZEVDczYzRmpxcmo5bllCUFFjbElYRXlxL2tZeXNkUFc3V0t6V0FQQ0YzdkRy?=
 =?utf-8?B?bm80bytTMDBIblRQTWtDMU82dzUyWEdyK0RqMld2a3FQVHl4TXVaZjhtR3Ja?=
 =?utf-8?B?R1JyMnlScFVvNnFNaWVoT2Rpa3VaMzlibG5YcTBRSitrUW5zTWhpK0ZCb051?=
 =?utf-8?B?LyszcFpjenUwWVZCSlVNY1dVN2pMWnFieTR2QTd1YllKeEdaZHNBUk5ZYUt2?=
 =?utf-8?B?TVJLUWFNOFNGWjYxRUVEdHE2Zm9JZ3VWd2g3bTZ0cWtGNUYzVkFhamF5Z3ho?=
 =?utf-8?B?MEpmRktZaDd4Zmc3eEkwRTRJbFNwdE1IZzZ4UFVzeU9oWnJYamFLeFgvWHpv?=
 =?utf-8?B?d1c2SVNKWXNpOXJvQ3dDZ01acHNZb2RhbVlLMUNqMUdSYk9pWXUzRitvTmhw?=
 =?utf-8?B?aXdlZ05OaVFaVmFDS21WbVJwVjg5dVF6ZlBpQTg2SVUzMTB6U3RrdEIrL1dE?=
 =?utf-8?B?RjNhQkZPblE5UFYzK0ZGaXE3Yk5ZR1lJY29ra1hlcmpFWjQzczdabXBMVUds?=
 =?utf-8?B?aDJxRmRRek1RdGlrbjVxdXBWWCtaVTZDNUpZZnYxTW5GVVV3SVNNbGJsQm1I?=
 =?utf-8?B?V2JCMXAxUG1BRk5nVDVHenBJVjJIcnhlVUR0YnVlNHdxdU9NR3ZZUmE3RWZI?=
 =?utf-8?B?VWIvTmY3dTNmcUtSRHVMc2I0VzhYeFpTVk0wRTg3OWRmdFAyVHg4M1hVcVNK?=
 =?utf-8?B?WmJSWmxsOWsybkFsYXJiYlV3aGp0WldHU2IyTWIrZjl6OXhSODVZUXAwZ2NB?=
 =?utf-8?B?TEZGaWRlQk4vc0thbGFVQVdNaVArRnRIQ2lkenMwNjdxc1pjc1hCNThnc3ZF?=
 =?utf-8?B?VVBVc0RYVjAvdjd1cGwwVklHOWI2RTZvVDhSVU9idGhMajZHcVU1OUYyQWNN?=
 =?utf-8?B?SFhzYXNkLzdFOUJkQ2Y1QT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6112465f-bde1-4405-6c00-08d90875e3cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 05:41:07.7562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fezBOkuhycaojnrTcrr33YDz5cY9Kp51Tepr9vko8JLZNgov1Q4EXficw+vwAd7h8IKAzZvjd6CvCnnk12KAMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5469
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9965
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260040
X-Proofpoint-ORIG-GUID: fhIAaLtI_119phCfAMkKHHCKhkCgQHjb
X-Proofpoint-GUID: fhIAaLtI_119phCfAMkKHHCKhkCgQHjb
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9965
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260040
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/24/21 8:36 PM, Jason Wang wrote:
> 
> 在 2021/4/24 上午1:32, Dongli Zhang 写道:
>>
>> On 4/23/21 12:59 AM, Jason Wang wrote:
>>> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>>>> This patch is to add the HMP interface to dump MSI-X table and PBA, in
>>>> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
>>>> vector is erroneously masked permanently). Here is the example with
>>>> vhost-scsi:
>>>>
>>>> (qemu) info msix /machine/peripheral/vscsi0
>>>> MSI-X Table
>>>> 0xfee01004 0x00000000 0x00000022 0x00000000
>>>> 0xfee02004 0x00000000 0x00000023 0x00000000
>>>> 0xfee01004 0x00000000 0x00000023 0x00000000
>>>> 0xfee01004 0x00000000 0x00000021 0x00000000
>>>> 0xfee02004 0x00000000 0x00000022 0x00000000
>>>> 0x00000000 0x00000000 0x00000000 0x00000001
>>>> 0x00000000 0x00000000 0x00000000 0x00000001
>>>> MSI-X PBA
>>>> 0 0 0 0 0 0 0
>>>>
>>>> Since the number of MSI-X entries is not determined and might be very
>>>> large, it is sometimes inappropriate to dump via QMP.
>>>>
>>>> Therefore, this patch dumps MSI-X information only via HMP, which is
>>>> similar to the implementation of hmp_info_mem().
>>>
>>> Besides PBA, I think it should be also useful to introduce device specifc
>>> callbacks for dump the MSI messages used by the device.
>>>
>>> Thanks
>> Would you please help confirm if you meant MSI messages or MSI-X messages?
> 
> 
> E.g for virtio-pci, you need a way to know how the MSI-X vector is used by each
> virtqueue?
> 
> 
>>
>> About about MSI-X, I assume we are able to derive the message from the MSI-X
>> table, as in msix_get_message().  Therefore, the user of "info msix <dev>"
>> should be able to parse the output and convert it to messages.
>>
>> 34 MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
>> 35 {
>> 36     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
>> 37     MSIMessage msg;
>> 38
>> 39     msg.address = pci_get_quad(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
>> 40     msg.data = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
>> 41     return msg;
>> 42 }
> 
> 
> Something like this.

I prefer to print the raw data as I think the user of this interface is able to
understand it as MSI-X messages.

For instance, below is the data printed by "info msix".

0xfee01004 0x00000000 0x00000022 0x00000000
0xfee02004 0x00000000 0x00000023 0x00000000
0xfee01004 0x00000000 0x00000023 0x00000000
0xfee01004 0x00000000 0x00000021 0x00000000
0xfee02004 0x00000000 0x00000022 0x00000000
0x00000000 0x00000000 0x00000000 0x00000001
0x00000000 0x00000000 0x00000000 0x00000001

The 1st column is Message Lower Address.

The 2nd column is Message Upper Address.

The 3rd column is Message Data.

The 4th column is Vector Control.


In order to verify whether a vector is masked, usually I would just check the
bit 0 of Vector Control.

Therefore, I think we can assume the user understands the MSI-X table format
well and we just prints the MSI-X table memory data.

Thank you very much!

Dongli Zhang

> 
> Thanks
> 
> 
>>
>> Perhaps I should remove the inner for-loop for MSI-X table in the patch, and
>> call pci_get_long() for 4 times, for PCI_MSIX_ENTRY_LOWER_ADDR,
>> PCI_MSIX_ENTRY_UPPER_ADDR, PCI_MSIX_ENTRY_DATA and PCI_MSIX_ENTRY_VECTOR_CTRL,
>> respectively.
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>>>
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Cc: Joe Jin <joe.jin@oracle.com>
>>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>>> ---
>>>>    hmp-commands-info.hx   | 13 +++++++++++
>>>>    hw/pci/msix.c          | 49 ++++++++++++++++++++++++++++++++++++++++++
>>>>    include/hw/pci/msix.h  |  2 ++
>>>>    include/monitor/hmp.h  |  1 +
>>>>    softmmu/qdev-monitor.c | 25 +++++++++++++++++++++
>>>>    5 files changed, 90 insertions(+)
>>>>
>>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>>> index ab0c7aa5ee..cbd056442b 100644
>>>> --- a/hmp-commands-info.hx
>>>> +++ b/hmp-commands-info.hx
>>>> @@ -221,6 +221,19 @@ SRST
>>>>        Show PCI information.
>>>>    ERST
>>>>    +    {
>>>> +        .name       = "msix",
>>>> +        .args_type  = "dev:s",
>>>> +        .params     = "dev",
>>>> +        .help       = "dump MSI-X information",
>>>> +        .cmd        = hmp_info_msix,
>>>> +    },
>>>> +
>>>> +SRST
>>>> +  ``info msix`` *dev*
>>>> +    Dump MSI-X information for device *dev*.
>>>> +ERST
>>>> +
>>>>    #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC)
>>>> || \
>>>>        defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
>>>>        {
>>>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>>>> index ae9331cd0b..a93d31da9f 100644
>>>> --- a/hw/pci/msix.c
>>>> +++ b/hw/pci/msix.c
>>>> @@ -22,6 +22,7 @@
>>>>    #include "sysemu/xen.h"
>>>>    #include "migration/qemu-file-types.h"
>>>>    #include "migration/vmstate.h"
>>>> +#include "monitor/monitor.h"
>>>>    #include "qemu/range.h"
>>>>    #include "qapi/error.h"
>>>>    #include "trace.h"
>>>> @@ -669,3 +670,51 @@ const VMStateDescription vmstate_msix = {
>>>>            VMSTATE_END_OF_LIST()
>>>>        }
>>>>    };
>>>> +
>>>> +static void msix_dump_table(Monitor *mon, PCIDevice *dev)
>>>> +{
>>>> +    int vector, i, offset;
>>>> +    uint32_t val;
>>>> +
>>>> +    monitor_printf(mon, "MSI-X Table\n");
>>>> +
>>>> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>>>> +        for (i = 0; i < 4; i++) {
>>>> +            offset = vector * PCI_MSIX_ENTRY_SIZE + i * 4;
>>>> +            val = pci_get_long(dev->msix_table + offset);
>>>> +
>>>> +            monitor_printf(mon, "0x%08x ", val);
>>>> +        }
>>>> +        monitor_printf(mon, "\n");
>>>> +    }
>>>> +}
>>>> +
>>>> +static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
>>>> +{
>>>> +    int vector;
>>>> +
>>>> +    monitor_printf(mon, "MSI-X PBA\n");
>>>> +
>>>> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>>>> +        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
>>>> +
>>>> +        if (vector % 16 == 15) {
>>>> +            monitor_printf(mon, "\n");
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (vector % 16 != 15) {
>>>> +        monitor_printf(mon, "\n");
>>>> +    }
>>>> +}
>>>> +
>>>> +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
>>>> +{
>>>> +    if (!msix_present(dev)) {
>>>> +        error_setg(errp, "MSI-X not available");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    msix_dump_table(mon, dev);
>>>> +    msix_dump_pba(mon, dev);
>>>> +}
>>>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>>>> index 4c4a60c739..10a4500295 100644
>>>> --- a/include/hw/pci/msix.h
>>>> +++ b/include/hw/pci/msix.h
>>>> @@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>>>>                                  MSIVectorPollNotifier poll_notifier);
>>>>    void msix_unset_vector_notifiers(PCIDevice *dev);
>>>>    +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
>>>> +
>>>>    extern const VMStateDescription vmstate_msix;
>>>>      #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
>>>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>>>> index 605d57287a..46e0efc213 100644
>>>> --- a/include/monitor/hmp.h
>>>> +++ b/include/monitor/hmp.h
>>>> @@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_pic(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_rdma(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_pci(Monitor *mon, const QDict *qdict);
>>>> +void hmp_info_msix(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_tpm(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
>>>>    void hmp_quit(Monitor *mon, const QDict *qdict);
>>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>>> index a9955b97a0..2a37d03fb7 100644
>>>> --- a/softmmu/qdev-monitor.c
>>>> +++ b/softmmu/qdev-monitor.c
>>>> @@ -19,6 +19,7 @@
>>>>      #include "qemu/osdep.h"
>>>>    #include "hw/sysbus.h"
>>>> +#include "hw/pci/msix.h"
>>>>    #include "monitor/hmp.h"
>>>>    #include "monitor/monitor.h"
>>>>    #include "monitor/qdev.h"
>>>> @@ -1006,3 +1007,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error
>>>> **errp)
>>>>        }
>>>>        return true;
>>>>    }
>>>> +
>>>> +void hmp_info_msix(Monitor *mon, const QDict *qdict)
>>>> +{
>>>> +    const char *name = qdict_get_str(qdict, "dev");
>>>> +    DeviceState *dev = find_device_state(name, NULL);
>>>> +    PCIDevice *pci_dev;
>>>> +    Error *err = NULL;
>>>> +
>>>> +    if (!dev) {
>>>> +        error_setg(&err, "Device %s not found", name);
>>>> +        goto exit;
>>>> +    }
>>>> +
>>>> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>>>> +        error_setg(&err, "Not a PCI device");
>>>> +        goto exit;
>>>> +    }
>>>> +
>>>> +    pci_dev = PCI_DEVICE(dev);
>>>> +    msix_dump_info(mon, pci_dev, &err);
>>>> +
>>>> +exit:
>>>> +    hmp_handle_error(mon, err);
>>>> +}
> 
> 

