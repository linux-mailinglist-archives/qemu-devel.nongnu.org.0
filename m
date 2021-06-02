Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF80E398B20
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:53:53 +0200 (CEST)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRJg-0002ke-TT
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1loRHo-0007pz-KT
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:51:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1loRHj-0002CO-EP
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:51:56 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152DpE6o005254; Wed, 2 Jun 2021 13:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MIfc18JU7G91OIUcdYxqI4UDFTY2IC76/K58wggaj9o=;
 b=UsKKR7t2jOw3qQ/cfq1kLC86bQTHLtH6q2eeVj36gP/fW3cFtChE8HwaVLv+Ik2nGC9Y
 PwOg7r1G4YFddcfjelhkGt61FbSpZEA95htbSW7hfAx2asNkxcluTuCZSekWYvtdDYUO
 Wft79hsa36CxTsYgVNLjvlF9RIMd2SoZ5EzEuoeBjTfEAFe7CC1kEvAEVhiNHy8CyQq4
 C3cQ6sSdfG+roVCy458c9c2Hx5ue8o4RyEFYV2Ys/a/ZidaU1EmNR6MVKcV+ztEMiEpa
 AT2YHFv3pIew1qiKC6uUwsjwot/Mucb4yYQ6aYRAdBdTzpqYLH46NRW6hJIvIKv4ewFs NQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38wvsgr99w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 13:51:41 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 152Dpdol176933;
 Wed, 2 Jun 2021 13:51:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3030.oracle.com with ESMTP id 38uaqxb25x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 13:51:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSPFEblqt8x/q1pzF2suizjIrudHPMuMOZ1DHc8yV46CWIvUFLX6eed5qEpIFCikxPHmc4j8rvUqvOWUAcD1MRQdj/Xk8tnFzEjghn53j4kwCVghFGQanbec3RFJAPIJu+Af47f3ufSsp1EexEM0KRQUUf3Dk4Dv6ePx/MeVHry0vvDftxuO8QSkDYdenvw3pVvFCv7GM407lM1f2w85toYUE8/kdF80wH9nR78J9Yxh1TIkoTRYTBxOlUkvuNKlei1L2IQAVDon/2VRbQnbSoyCsptAsBF2foxpainlVq03Hnon89IOYnnOIIsUUDXU/95rfEIzM3kzu1nSHpJ63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIfc18JU7G91OIUcdYxqI4UDFTY2IC76/K58wggaj9o=;
 b=TpKi0SRQCprMclLL429oUWj8DGlV0Pd0BsLWB6teR0iv1AKPnyF6Fidk29NsJpIt0gjEo6QlCuFQbyBCyn5eMPPj1lSSLEXoSaWgCE16wcAQ9GONML6WTC7gT/D4vQiJpuRXYmfZ6wZNEgbznCDUeO32zARy6lWttiHdgPUa+kywTTzZ7rNPqnjo9CzBdzp9NGG8Wrv7u3pQzxZm2xt6i8DRIC0zjmzxKiGa1mOKJU4nzleLU02YKOpJHSbnY/dYBB40TSkgyh/PH5UlqbfLyuaOtGaLblEsZTQQ6RjPshrUay5K0Sxs4Zb/YTY0OyULgB+jfYb+UGDKgP5vGIIChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIfc18JU7G91OIUcdYxqI4UDFTY2IC76/K58wggaj9o=;
 b=q5gN0jvvvIHPWyFs9rabGEC5slvcmsBdWZLDNKF7afxDlHacvXuV9yjZGXb9adpGH9Wgq3dli2xRnu6C7h0IstbubbheTNaSrXt/3Xl2dYN/T8aYizLlKbE9IHD9sIg+YDmkVh/dEBmjEoEe2j1clVVvFH73FtmiXDVUInL3lv8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4244.namprd10.prod.outlook.com (2603:10b6:a03:207::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 13:51:37 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:51:37 +0000
Subject: Re: [PATCH V3 00/22] Live Update [restart]
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZgZELudL9HobEe@work-vm>
 <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com> <YKuCbujlfOCEYUP3@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
Date: Wed, 2 Jun 2021 09:51:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YKuCbujlfOCEYUP3@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN7PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:806:120::16) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0041.namprd04.prod.outlook.com (2603:10b6:806:120::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Wed, 2 Jun 2021 13:51:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3342cdde-44ca-43f3-1218-08d925cd8a71
X-MS-TrafficTypeDiagnostic: BY5PR10MB4244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB42441DAC0E543F2CDFF1ECFDF93D9@BY5PR10MB4244.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZiM5csD79qwI9zigq2aONRmqLq6zc0iO54DXqtXB41rV9y0a63AgwoJWDm6YIo09LlkpE9eZPAuWY8rernblNFUQXrQqkYNbh1lM7HGi2cVODCkDqJpncPjIFn5ZpvQNcsKfj6PUxatys5zXAPn2vi9EkYSb4OdgeREC5AkRpmSifkhWzsC/6p3RiasXvR6Idvrmlxd6/WyHDBaR6bnOqWAmpgZrlQQmaETbt0osCmwy+hWcs4ZkrggjdIuSHl3omc5odDPmvu91pAjNlKw2aXatCnMPfiFT+Q9BKxv/2d8JHNA+sft0aRNFhMdqgeMb8L1Pua72oh/ghoxixjnktv9ML4FvznUKMOr3xiegFGEcvX087JYwZtwYfkqeYWb3CDmR8wDoAt9zKpflWE6CO3ZxqzSZqBouXqv1D9a1XBn3bZVf3vJfBI77Ptg5tzfcg9g88STmn03MfctME+z+KIPK48s2dpi7YvcnhaXahc6JGQjO2uNA+DAmgipTyMvV/3eQjYke9i6NN7k//x+QfW0RTQOAtqrjoO2k05oekQtSlPFuPN5iqaxi98dlZ9OoFvd78ATjHJ0V2BZCR0/KRnjbx0lEfgWVGkeFi/0ZASYjRrEi6lHDiu2AuzSUIvl8EX0ujCE5ckTezXbvPzH6hSpT9y7599vMxkj2HOl7JuPDxQzqCuzun5T8X+f6Ojk+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(136003)(346002)(39860400002)(4326008)(316002)(26005)(478600001)(53546011)(5660300002)(83380400001)(66476007)(186003)(54906003)(16526019)(66946007)(15650500001)(66556008)(2906002)(36756003)(16576012)(6486002)(86362001)(7416002)(31686004)(31696002)(6666004)(956004)(38100700002)(6916009)(2616005)(8936002)(8676002)(36916002)(107886003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnQ3M2laVko2SVZrRTg1eWVLOXhBN3JvM0lxcnVESEVhMHYrYThDVlpoTUJ0?=
 =?utf-8?B?aEZGQ0hNMlZyc3RXamVKamhGNit2VnFTUDlvY3BMUmF3am5zQnFhSm55UHYr?=
 =?utf-8?B?Tno2SjlSTE50ZVlCcU55TjNseWV2Ukdrck9nQ1g0MTNoTmZVcE1wcDZOQ05S?=
 =?utf-8?B?N2ZMMDR1ejdnL01EVGFFdktiUG43eEM2MVhhTGxLZy9BSzJPaUlwc05RWnVS?=
 =?utf-8?B?bXF6SWVDdWZTem4yb3h3aTVabmFKNG9jK3NkTFpiUENCOFNPYktlbDZiK1JU?=
 =?utf-8?B?b3ZCQnM3MjJwM0tiSmJ2V1JOTmRPcXdac0M1SjNKd3NkU1VTNE1vL09CbU9P?=
 =?utf-8?B?RlM4cHoyN0JtT1BVekh3RkpOMzVyUCtWdTdUeGkrdWhpQXg1ZHZud2dvT0g1?=
 =?utf-8?B?NlptRy9vQWQrajR1S2Z0WnovNVpPMUR1WDN2RXMwZ2J0c0RVam03Z3NpNEJs?=
 =?utf-8?B?Q1gzZlJ6MnF6UXBucDhyVUw3RnQ1TzVqR1Qxb2lOdHNBc1Z5cnYySXZEb25l?=
 =?utf-8?B?T0tUMytCdzl4SkM5N1Z6MTd6Z0hScHp5M0lIbHpZNHFvWE0rK2JnYTJnUGc1?=
 =?utf-8?B?U1ZVd1FBd0ZQVFd3TEJlRFRVL0JlWHM2V1lhMjVLcmFsZElaMktESFVpaFRF?=
 =?utf-8?B?WmVlYTloajZ2UFVndytQQ3lvS0FRTnhPblB0U0U5WUlZWmttOVlhWW1NRmdx?=
 =?utf-8?B?TWhoSWhpenFXWEhOOWZjbUZVNDU5SERiMXFVRkJyS1BtRHErcGJhZFpzMml1?=
 =?utf-8?B?V0xlTS9iT2N0dno4L0NnL3JzNzJLa1JkVm9WQmJOWm5qSldOOTIwbVJkd2Ra?=
 =?utf-8?B?VmVyNHZXZWo3S0N0cEZvdnhIY2NIeml6MHRySWFHdU93bmlGRjd5Q3NQeWVQ?=
 =?utf-8?B?M21YSnpWTWdYMGRxQ2VNVjBDeEZ5WXNBK0dlc3NDZHRJd3VYVThxOWtJWFJM?=
 =?utf-8?B?dG5pQlV0d2ljdXpDT3B6ZmpNcEh0djZzbjU5RTR4MS83eTZCYVhFNi9TOVoz?=
 =?utf-8?B?aC9YZEJOMFFHSi95bmVGTXY3Ui9JbmdkK0ZJVDFFZHcxc1NJS3RVQ1FKbHBX?=
 =?utf-8?B?NUNZajE2Sm0wcDNraHdqZjRmS05zNDdxQ2pwOWFNb0RnTENUZ1hMTHlnd0wy?=
 =?utf-8?B?ZERWdHc2WTB0UGRPUUFvc08xQzhpdU9QczJFTTBmalMwOTNuMzI0TE8vTkxo?=
 =?utf-8?B?MnIyM0hZNG02UnBabVZHb2Q1TkZ5b2pZckhmWVVPK1h3Vld6QVFLNUZIRlRE?=
 =?utf-8?B?dEFKUGxYOGdBcE02ZGF1MmZEMElQS2FjZ1BwZjByejRzRk01R3ppK0lZblB3?=
 =?utf-8?B?M293ZldJWGE4c1ViMVVBQmxiaklUYTZIb3g1ZkMyMHRGVWNxWC96VlhCN1cz?=
 =?utf-8?B?S0VvNmF0M1lLWUp3OUhnbDNsOFBDeWV6YW5LZjdHU3p1U1VYdy9wU0hDU09L?=
 =?utf-8?B?T2czU2crV2syRHdxdTd5Q0VnTFJJQStxWXNMckZUditxSVlTVGlZVHF5cnl4?=
 =?utf-8?B?S1lIRE5Oak1mM0hwaXlYNjF3NWRzQmlleXNUN1hzWmorNjVHbFVoR0U0c0pU?=
 =?utf-8?B?K0czMC9tTzdJTklodTJreGl0WW1VbS9zQXk2c3NvaUVpVEhCOWc3NG1ZUW9q?=
 =?utf-8?B?dC8ySWRxNks4VXp1dUt4R3RRRkNlVTI3eVNROFphVjE4RUh4eG0zcFI3bkgr?=
 =?utf-8?B?cUVLZlpFR21ReDFhUGY3Q1FrMWl3cnpia21NT3ZkZ0dVOGxIM1laZDhQRmVF?=
 =?utf-8?Q?+oGh4X6DVj70VHsoBGwII7M34rfyIfzYCycJm/z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3342cdde-44ca-43f3-1218-08d925cd8a71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:51:37.2524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JAIAmbkGt4zlxi0L5vErEHG8LCpd7WkkSZnwfr/RyKo6Bh6y2fdfJjmQhv3RuJpHF8Vw8U0ioSnkEPBhP0Y3itigIymu1Dpf+6Ug21jmQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4244
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10003
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020090
X-Proofpoint-GUID: _VPtGya8fgsrcpnfXeNWtYhdCPMiJhSu
X-Proofpoint-ORIG-GUID: _VPtGya8fgsrcpnfXeNWtYhdCPMiJhSu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
> * Steven Sistare (steven.sistare@oracle.com) wrote:
>> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
>>> On the 'restart' branch of questions; can you explain,
>>> other than the passing of the fd's, why the outgoing side of
>>> qemu's 'migrate exec:' doesn't work for you?
>>
>> I'm not sure what I should describe.  Can you be more specific?
>> Do you mean: can we add the cpr specific bits to the migrate exec code?
> 
> Yes; if possible I'd prefer to just keep the one exec mechanism.
> It has an advantage of letting you specify the new command line; that
> avoids the problems I'd pointed out with needing to change the command
> line if a hotplug had happened.  It also means we only need one chunk of
> exec code.

How/where would you specify a new command line?  Are you picturing the usual migration
setup where you start a second qemu with its own arguments, plus a migrate_incoming
option or command?  That does not work for live update restart; the old qemu must exec
the new qemu.  Or something else?

We could shoehorn cpr restart into the migrate exec path by defining a new migration 
capability that the client would set before issuing the migrate command.  However, the
implementation code would be sprinkled with conditionals to suppress migrate-only bits
and call cpr-only bits.  IMO that would be less maintainable than having a separate
cprsave function.  Currently cprsave does not duplicate any migration functionality.
cprsave calls qemu_save_device_state() which is used by xen.

- Steve


