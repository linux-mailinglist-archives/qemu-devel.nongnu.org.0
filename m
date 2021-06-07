Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F314A39E5F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:54:35 +0200 (CEST)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJSN-0001sS-09
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lqIuF-0003WF-Ra
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:19:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lqIuD-00088x-3D
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:19:19 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157HGSPe000643; Mon, 7 Jun 2021 17:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=2iSwP3L3zyWDbu/T6lOYtdOTSWxu4In3VPj+Md8FzcE=;
 b=kJ+1GyLnI0Tl9D1euBLdRKb1vKKhlYCqIMvC1yypLMHKDecpHrlKi7IjRbv/XtMQ9pdA
 p/WbNGHIEkDw32RMjoypGUZ8q+Mcz4w7at3LFkNrVu0laO+ykh1tm3KV5uqB20/S5LQC
 83cAGTtLCS1eOWLNpvERWkMXZtH12aVgFAbE+v9bAyIDTfGPrpm1meidbxzv0iEsQKtn
 NlKfyFFwC0ylpI8JNJgD0Cnw3cC3YuPExJFofC6LmJlVy5i+cSQZtRCx7cICC9X7qyhv
 5QMMGu6qgz6pyyRM2ifbE/DAZKT/sbYk0OFU5Y7BCs1QcMhhED9d6PR5oNJlbnGAZ4bZ Bg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 391fyr05r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 17:19:11 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157HB2qm161121;
 Mon, 7 Jun 2021 17:19:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3020.oracle.com with ESMTP id 3906sqebx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 17:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNNW3XO9JJ04v6R8sQKLvLFw1gnA5Js+RNHdshWteg6l2VO3DpReOUlnvRB/0wxUE2QWx8MpI8ic5lWDiRbZremxdFyKpDe7Q/aItojLhxhxZ9khiY8lpJidHEMd58TCMaXJjkQNQnHNyqWJj6C2CpPjXfhOy+PdAVFwaQkSpjEdmKe6ooBryB5etFfet+b3Qp/AKtMKVot1BK/QkB+KvTxvZxsFY7ze3eVPpY5Nai1uhzaflGSfTh8VS8j9CLfYY5+uudDJu3CNcA2EKSOr+FGoEbDExJadWq4Yn7Oi1+TYsuL7Ew1/4ZYuRSY0Bw+BFWwA49Tru8AUYEjCTXGOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iSwP3L3zyWDbu/T6lOYtdOTSWxu4In3VPj+Md8FzcE=;
 b=AQA4z5QyFoL5fariIzXcMY6PB++b2Z10dttsk9uuKFPCYkBv7cFPOV6IFAkJRLhIaMO8DLqF+GjNKqcvi9JOdlSk+5ski4R7j6tr+kB1P5QJK5lh+BtH8iShQljZsfd3rf2GxiMUFZiWx/TfYLLq4pYV+++ZEgrLg0f2WytH8nddcIy5Rv8IBOXW9pmgiQIPBxIe5nZqdlrB5wShq4TdE4pN8Ax4z4C2ok8S4t0xNM5t0VmWO4afxDPZYizVkSPXnZka3RwaOTM0t2aKZfwE8Rq5zXRWyMOGwgSrEKOuSzziz4D+3qzHoLmpOecHO+rmmNHuiCknHJtT0mGxkjakmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iSwP3L3zyWDbu/T6lOYtdOTSWxu4In3VPj+Md8FzcE=;
 b=ZOE0NF9V5kxAd5+iNfAMJWjqZlkEQfOI5OoNyJ2/jmH0BPx9GBrMk+Uts3vkqR4WQ1EyJHJ3obVq4ehr+/1mbubh+80RWLCuSsn5sfP6PGCWMdkiKGxDQ5WjwF4L9U52Dvj5hqieFzsj/4aEdk+F/18/K6tddCNfOPFV5VUAKog=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3940.namprd10.prod.outlook.com (2603:10b6:a03:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Mon, 7 Jun
 2021 17:19:08 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 17:19:08 +0000
Subject: Re: [PATCH V3 08/22] cpr: QMP interfaces
To: Eric Blake <eblake@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-9-git-send-email-steven.sistare@oracle.com>
 <20210604135923.4tyhd2hoakhoz5qr@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <c78cb5a2-0ba5-7399-4043-9438feb08981@oracle.com>
Date: Mon, 7 Jun 2021 13:19:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210604135923.4tyhd2hoakhoz5qr@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0801CA0017.namprd08.prod.outlook.com
 (2603:10b6:803:29::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0801CA0017.namprd08.prod.outlook.com (2603:10b6:803:29::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 17:19:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1dc6c07-2e8b-4fa0-3b59-08d929d85bd0
X-MS-TrafficTypeDiagnostic: BY5PR10MB3940:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB39404BCFD06448A4B4A55170F9389@BY5PR10MB3940.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5OFboQndRr+Y/7JKw4YUS5+GP84Vu8osF3ayYALk3q+/iGWv1koPiT8H1NsfN+9VhJXy40cfm9rfXJKVUjnybTS2bHDDFnF2Fc5qLewZiH9vgyMjvXAGvp0OjOFZaeCgxNEr8C44AS0mhSqzr1RhFcEWxv/LxhYCmbphPWHpwK06h4EsFVdkaHZ8crgzW+fEtvFldumAppcXDY/VWYeWDk/zZww6fEFlHU3MeLmRKGq5lHPy88VfbV7E+iE4b4EIkZXMh6UV5PAu8o8ko+Ihc32iyyRT9U0Wj1kIZJlq74pacYWmYPp3xMj2WVdBHQMaHhzeg88VmgMUHfXgKuuIAGZXtnhv+/SwsI3PkjrUq4kj1wZzgDnPDWgnXrdAuVqR8dxS8tzgvvQn/UAfzAMSdOKayRjr7Ns2GEczBz0pqUy9lkgBo87h5+DW4aqd7XCndp49Z+/znJmjXT5utdC28iYSBijh7cdjCTOvZtM4HnYtRhopOdITQS3lBCeZnDpwCZJvodOy8rrhYWiu6jBvJzXo40uL7k5nx3ZHIBsFwam2w/nAngXXpyh5L0k2/RZHoBaDwq/Mm2LHF3npcCUHUlmBDmE2QVo8TVfPMwg8J3Pdi4Cpzy5jq7k/aV54fYXbJXhceY87et0xnueUYX3AaR8B1dZpFIb3LCDJnd+x5feI8KpEgKIG/4YlHZ8UbJ9a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(346002)(39860400002)(396003)(478600001)(6486002)(956004)(8936002)(16576012)(53546011)(2616005)(66556008)(2906002)(4326008)(8676002)(36756003)(7416002)(66476007)(5660300002)(6916009)(86362001)(54906003)(44832011)(66946007)(36916002)(186003)(31686004)(16526019)(26005)(107886003)(38100700002)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eEdSWW5PSnc5TTRSMEdsZkQzNm9qMVZnYlVTSmZlTG9tQS8yYm11cFFTZ3hX?=
 =?utf-8?B?ZDJaSUNKM0ZNeUhLSDJ4Zm16bG01VXhkbG9PeDYvMzRhSy80Qkhrb00xaGNJ?=
 =?utf-8?B?Vlc0RlhHNU42TXptZlRvZ3U0dmdpeS9OWFpaaVkycDdGaFN1UjZHNTZsZ3dQ?=
 =?utf-8?B?VWlad0tRRCtpQm01bXpWZ0tRazMzeng5dnRHUDNjT1d6NUpBcjBqQkJhN1hO?=
 =?utf-8?B?NWc4QVdSREhxTmlod3U2Y2RlL1ZEenllSTdoM0Q3dytVU1FVblg3SEpycXFh?=
 =?utf-8?B?TUxXdXRBa2ZUckxhanhqT20wM0hHMGxGdnhWVjZzc0RyYTNBWXIzU3RaWXht?=
 =?utf-8?B?N1Z2Y2hsL21pVStSYk5jRXB6T21NQWNzVDZ5aW9mQ3l4UEZXZmI0RFlDb3Fq?=
 =?utf-8?B?WGhZai9qMHBHWHhUZHVvQ0MwZVgwVGsvWUtuR3lESEt4N3gvcEFtSUtWUlZj?=
 =?utf-8?B?dEIxc1RuV21uY0YralYzcythZW5UcGlPSmJ2ZkN5MGZtSHI2c1M0UHFNNXRD?=
 =?utf-8?B?RmExT09YYm1nbXlKMlhzU3hnSFN2TzArWVhZcWZqOWxPQ1RwU3pQU3JGcUtG?=
 =?utf-8?B?aTVnczNBU2pTdGE2RWlCcWFBQUE3eDB1ME5JMHVBNHhhRGk4eHlEc01OYWRC?=
 =?utf-8?B?ZW5GQXpiMFVLMzd4aDU2WFo2RjJDNFo2VWhxa1FYV01kVHlkSlVkdGY0NzRr?=
 =?utf-8?B?Zlp5b2lqRmduYUFaQjNJMW9jVUo0a2MxOGluZDNJOERheWVHblFUc3MxK1U5?=
 =?utf-8?B?VUhzZjNoVm1oeHpWRWJCN1lieDJWc01BRjcrOE9CTmIyY1FiaFVZdFY5b2o0?=
 =?utf-8?B?VExQbDBOWVVTRTZIODlOZE00cmJreEpRREc3WmNDOVVGa2hWVDIyN3BKT0Jw?=
 =?utf-8?B?Qjl2VVlsc1B0TGYwMjE5d1U3SmNTWjRqeWRyS0dCSlNnaE5Gdk9rdER1dXhl?=
 =?utf-8?B?aEpxVDdrVDk3OTRvVW9WZlBBd3I5N05laW5PdVRTZVR6elFEb0dKdTFldW9y?=
 =?utf-8?B?SFE2V1BkS2ZBSWdtd0xGbnk1VTBWYVgvWVNBQ0R0d3M1cjdXeTJDK0pUMU0r?=
 =?utf-8?B?aG9KejZ3QVQ5cm1naVcwT2xYWFFiejhCRUI4ckxaWUNJMVIwVmpUOW9FMVNy?=
 =?utf-8?B?ZWxrTTducE1CMFg5NlducXJHWHF0aTZNanl1T25ab09YbXpTd2xIQ0hzbXE4?=
 =?utf-8?B?OEd3T2E5Qk9wdUJkL0lERmM2bTBlbnpnYncyaURERGZiS3NSU25WdnpWRU9Y?=
 =?utf-8?B?TkNCUHVGNkExeXlLYjMxdVNRNlZTT1dScjBubjM4UHRLMWFWQTRNaGhxelhS?=
 =?utf-8?B?V2JKLzROVjR5MHJUSFY0V29RcUNOZFhlZFR0SENFWnp5TU9kdmkxZFlVNWd2?=
 =?utf-8?B?aUNhcklGbE4xMjdoMGJJejZGOFZpYjVsSVFmbVE3QU1aU3VwQnN1dys5em1x?=
 =?utf-8?B?aTBYUjE2WC9GdUh6TlZUMUN0U2wvSWhHeEVheVZTN1cxOEU5cXVNRDI3czBB?=
 =?utf-8?B?dVBKeTBma0NtV1JMMkFDOUhMWkRnWXo1eHhOalNFMHN1OFV5d0o0TllESXVW?=
 =?utf-8?B?YWJHYzRFT08zSEEyR1IwTFJ5cFVQUTRIdkd1NDJCVU82SzkxVHVlbTQ4emVl?=
 =?utf-8?B?R3FudFVNQWpsWFdVWnUwM210TnVzZ2U1TENIS1R2OUNvalZuSktzSUlNcHBo?=
 =?utf-8?B?TE0rc3ZkeHowbUdRcmMwOStMUDFDSkVpLzhKZ2tSWEpIb0dNVjU1NG5VVG5v?=
 =?utf-8?Q?nO9pI/G77hrT85Uuu387aWdu8u+5T/pRowVh/5e?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dc6c07-2e8b-4fa0-3b59-08d929d85bd0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 17:19:08.1792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKyKbie+1HcgMWi7L7jC0KA4dxUTKqeflC3ZVdLfsYW5gJIMequq7A84kSR5e9ZTKDSVFrdrQmw3ZpCSbHm0Dgqt4kMWYcEh+cL9Mg5Uig4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3940
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070121
X-Proofpoint-ORIG-GUID: MWRv2XlhaXcpLGp41IWbrgvtazyKsvPf
X-Proofpoint-GUID: MWRv2XlhaXcpLGp41IWbrgvtazyKsvPf
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/2021 9:59 AM, Eric Blake wrote:
> On Fri, May 07, 2021 at 05:25:06AM -0700, Steve Sistare wrote:
>> cprsave calls cprsave().  Syntax:
>>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
>>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
>>
>> cprload calls cprload().  Syntax:
>>   { 'command': 'cprload', 'data': { 'file': 'str' } }
>>
>> cprinfo returns a list of supported modes.  Syntax:
>>   { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
>>   { 'command': 'cprinfo', 'returns': 'CprInfo' }
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
> 
>> +++ b/qapi/cpr.json
> 
>> +##
>> +# @CprMode:
>> +#
>> +# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
>> +#
>> +# @restart: checkpoint can be cprload'ed after restarting qemu.
>> +#
>> +# Since: 6.0
> 
> We've missed 6.0; this and all other since tags should mention 6.1.

Yes, thanks.  You caught a different instance in a previous email and I did a global search 
and replace in my workspace.

- Steve

 

