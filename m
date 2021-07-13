Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4F3C7439
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:18:05 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3L6i-0002h2-2P
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m3L4U-0000m0-Kd
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:15:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m3L4S-0004W2-17
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:15:46 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DGBkVr012431; Tue, 13 Jul 2021 16:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=nynkM0XojDhkGZvXvHUeTFxITLwbVc49gIQzgD2hs+Q=;
 b=hgfjYLlrcbztSShoAF0yUc9TFv+SnFnnre4K/HajMYrbZuIv0dDqNrzMF4ydjgWMWc9j
 8z2osYfETt94TUlBUe4XnJ2YGbQBE8YfiusCTUy7r2uXRqzu84wqf4uYM2813+x1KBey
 bq8BXk8xNT8sT1b9l3xWT0oEpOyfuDESsgceJLcW19wACOWUjzR50o4myl9PdQ5oM5ZF
 8QY82j6FiYHVuzkVY/Ok6y/ShzLlD+1IB3nGKlI27KZvjI+K+3JvVP6gznGsBkMWcq4t
 rtqUHapeEcws3/7NAgmQrQwKNNXxRqwf087Y4Rs+iJLZb77i+sqk1JX0BMKkg093hw0P Vw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqm0tsq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 16:15:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16DGAjiR120722;
 Tue, 13 Jul 2021 16:15:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by aserp3020.oracle.com with ESMTP id 39q3cbttkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 16:15:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+HSlYciEHvQmoIIC5+hCe3meYPfzlLNPBC5T5miKzThyvLJlQ/c+3cjlQJOaawJTzLpfpeROEumhR2IdamQ5/luLdTULGRG7Y7gfOdxDcijF8vsWKWQgKBKkloCwO2+LAcvR3t91fog3pKU+H6R14xY8JYQHi2oMfLHII58ksiDwrVe2J/2k+GES0LxZNhjcwqPwKwXFhHlJ6L4nVPLUwMQs5NUpzDWCmdXJdiJLNC4SRIG3PHSGFjZHE96LzTzM30fhwK08VvN38X6dmsYfa4SF2AWM0LdZM5muGbtkwXbGs91xBFZBMAWhxE5S6SledNbbIMno+4P7/qSn9IWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nynkM0XojDhkGZvXvHUeTFxITLwbVc49gIQzgD2hs+Q=;
 b=W9JzXd87NE0J2XUYoNw/gnB81oAQSCk0sw29rE/8xZwCsssUCKy8T6ciEEleF/WC/bxV+XpqU6iB6SyN0XdKg7ulX9ZYS4I9cQk7bPdlFNdpCQcKUwavY42HL/z1foItTfMpe/oF1zS7a3nlH5pU2JTBKXKeTAVptqVGORyw2w8lwDarv7f5EvhKuDGa0YLXCPwrVz/hKfAeUg5S4OxnxYLCkhocwun44bmwo/Dr6verWdEA+H7KfJkPFDPPfAeFwFxB8jutfOotzooY2ne8gZktODaYzbcqDTgP79UqeaOW3W6tnThEWJmSDPwe6tgP3RQDYBXpSRZUOd878Ue3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nynkM0XojDhkGZvXvHUeTFxITLwbVc49gIQzgD2hs+Q=;
 b=upH0TS9o4UozwjL7EVXsrZdkfaeQjUEzas1yJV8u+UCqzgIw+DVr715QexBOWi/CrOjRDwbwnNde+3X5/P10Wn3UcZWGZVPam/r+zm1RSotuQUfSx/61eazW+QcwWbqYcpDdJzoFlZ/04q9vvybDTDKC4MCcKDyoC1os+rQc5io=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4308.namprd10.prod.outlook.com (2603:10b6:a03:203::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 16:15:33 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 16:15:33 +0000
Subject: Re: [PATCH V5 10/25] util: env var helpers
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-11-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKEPHdJLNc7gHzsRm8xz7=qXES2v-mjPrp_6WS+73hp6Q@mail.gmail.com>
 <a682572b-8d24-c6e3-9036-2ba6349eb4e6@oracle.com>
 <CAJ+F1C+OHw5=GOwSEtoEbpujVtbA80bBPmq3DFJKv5d9T1xxPQ@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <895c7a47-2c9a-3a8f-835d-b2798a92c890@oracle.com>
Date: Tue, 13 Jul 2021 12:15:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1C+OHw5=GOwSEtoEbpujVtbA80bBPmq3DFJKv5d9T1xxPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:806:125::8) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0153.namprd04.prod.outlook.com (2603:10b6:806:125::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 16:15:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c128139-f5df-43f5-211b-08d94619711c
X-MS-TrafficTypeDiagnostic: BY5PR10MB4308:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB430848B28EFC259CF2E17B22F9149@BY5PR10MB4308.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuBtFiZsGEU9uFTYoGi59OjhsW423WJpR4AofkjlzcnIlHHUAKFpWsdhDVkzkkJFs43sRUSYZXI4EkDiYSZZLrogH5zHZidE52yBqCTnKXvcLroXtmJjY/NetaOIkt/BIYZhhqgpCuzSNoAyyQ1D1irX59UFRMnCPQ8hrczk/8YupRHlkFKXVtrj9Ky2NGdilfoYFYc3kKQbTD9cJlKBeS2Zpu4wiMqyuo600n2qhIrWI3EKCti7L/JNPfhl8DXNPY2bqLCojyjj+ZvSWuKFx7TT+oIcufOVQixnnTP6OqxZEyjZB+TjqrHzLU/hbfYUYE3I3gV5taf1bbGv3JMEYsY/NIgMdpAO+ifSabLlgxPtuQ6c1TYFmzORS8PHXezzxMamCIEJWqMbRmeONfxgFittJVg0/lT9ODwZK5wGdc8HTgzJY6MTVLAECK/RqMon+pZgLEJhCSvMWDq1gE51MN/W48+QJxJW7w32Ql6uBPEba0rLaU3s6vesK5xTsOXpF73i+a3yAtB+AQFFBseCVsBF64aqxnYMnk0FJfKsMTYQcq77Qxp9kZN2cf3H76oqxQhcmEhozx7kA+23AdhmJgsgPlFh1B5AORKVb+lARX/V2Psakw8qnrlAdiaCmqJrxvMfocTCPukw4ln1g1gUh0BnADIbJ/VTh8A5Qww9iOX6pjC5rXfUD4t65dES4xLRUSNskPi9pgxizTbT1R42ZVqBDa1FuHiD7OhGo4xNOUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(396003)(346002)(39860400002)(66556008)(316002)(66476007)(66946007)(83380400001)(956004)(36756003)(8936002)(8676002)(186003)(31686004)(2616005)(36916002)(16576012)(7416002)(53546011)(2906002)(44832011)(31696002)(478600001)(4326008)(38100700002)(6486002)(5660300002)(110136005)(54906003)(86362001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHovaXlpV3BqQ0ZLMTFwNDBFUXJzbE9HQkhkWUxTR0lvQXFsU0tTalg5b2lP?=
 =?utf-8?B?d1dic0lxYnpPdUZHWW56aE9WVjB1dmJqeDNQNHFsVzhhV0ROUGgxS2F4VTFu?=
 =?utf-8?B?L1Z4eDlyYmJvbEZXT3dZMkpicTVUdkQ0OUQ5VGs4OHExZHF6SW5ieHFISDVD?=
 =?utf-8?B?bERwMitQTERkSVhuR3IycGN1TlVNeTBYWkUrS2JGb0pDbitMdGU1eW01ekdu?=
 =?utf-8?B?NXJrT0FuQ2MyLzRBRmNDWWJIUVZUWmNwcGZXVHVzMzFid0lLdUhjSkR4R3Yr?=
 =?utf-8?B?VjByRnRpSGFZck50cmFXQU1lVnMxODhXRnl2cUFVSHdZWDgrNkt0Sm92VnJh?=
 =?utf-8?B?VjZDMXFBaXF4aTA0Y1ZxQ2xzQlRRUkxVaWV0MmpGZFhPbmV6L1BZKzlxWTV4?=
 =?utf-8?B?WG9Lc29RUGM0ZExHajB2ck4xV0VYL2pEQUplTk9hT2I3cGZIWnQva0QwN2Yy?=
 =?utf-8?B?TDFqMXIwejJBbXI1UUtCaUxCWnFvMU5mb3E1OXBhMU9hTlYxRXRxMzNmWEVH?=
 =?utf-8?B?RDRmUWtadlMzNWprVTM5U3p3Um5GbDUzTm1Yc25WdVBpTGVLLzJITkVhWVpP?=
 =?utf-8?B?OGZoQTd4K0dnTWR1Z3QzTDVUcThoRzdnS3hYR3dpaGFZYTVFUEZxOEdNMXJ4?=
 =?utf-8?B?OXJWY0kxVmdtSm9Wd2F0STZQeVpTMmZMS3VyZTk0Q1poY2dZUTN2OEtaUWJy?=
 =?utf-8?B?TFBPNUt6WGk4b09BdnhTK1VSUkpzWUtiZE1icy8yMU5lOEd2WWZhUVA5Qm5X?=
 =?utf-8?B?U25IQlE1WDc2Vk92YjQrM2FOeWJPeHBtYVpSR21KaCtMNWJHQm8yWnF3ZHVs?=
 =?utf-8?B?S1JCNm92SmExZThDeTZINW1VQTVsSHBqQjVXNzU2RU1OMVpGd2FCbGhON2Fo?=
 =?utf-8?B?QWtwdVZhbDJVZ092dDNVMU05aVhxclZYQWo2MDk5cHFuS25iQUdPNFErelVT?=
 =?utf-8?B?VThPUWRnS0I4MDJXV1QxSnhRZUJVaU5uMkZ2Q2tFNm1QRTdGa0FoK0RtU2I3?=
 =?utf-8?B?cVVNcTZOdktKUEEyNE1TeHV6UXIrSW5PQk0vZGVuVnlXbVQ5dXFaZlFkR3B3?=
 =?utf-8?B?dm0vY3U5dFIweUN3cTd1VWw1bzdtU0RTVGZsd1IwbDJqWTVkbFB4TDUwdHFw?=
 =?utf-8?B?M0xSQjgrNGRQNmhIQnpocWJFRlhudE9uN1g1Tzh1MkU1MEU1TDFKUHkyd2Rt?=
 =?utf-8?B?bjdMR2QyVnE2eVJocktNeXVMWno3V1ZvRXp3Q2NNbS9raENlK2VBck5LWFl6?=
 =?utf-8?B?R3M5cFcxNDZoZGJRenZ0Q1V2RWhjMzh4MitUK25PSnBiVWUyVzdpajhFbFk4?=
 =?utf-8?B?M0M3dEdmS0ZwNjVyN1ZEOU9yQkVlU3JDVHZYeE43dldneWEraHlWSzFmakNH?=
 =?utf-8?B?OUlnZmdMbVFQWXJ2NEgyNHN6WHNGTHg3b1NrMDRMZlVPNUxoaEdmbVFoMEln?=
 =?utf-8?B?TjZxeUo2ajBuZGc4c0R0V21vQjdoZEg1ODQ2d1VEOU1hTC96Z204eG45am1D?=
 =?utf-8?B?clVoek5zTHpNamxEYy9ZYk5nK0gwUERkeWUyeFppQk9uQm1VZ3BpRjl5Y216?=
 =?utf-8?B?NmZZdDNaWUUvQkc0N2VlUUlzeFRWV0NUb3FRRnAzMWRvS1UwM0w1MzBId3NR?=
 =?utf-8?B?c1N3WjA0Q1huUlcyUFlCNVRUUkFTYVQ0cGc0T29NV0RNeGRza1VtVFZBTU1Q?=
 =?utf-8?B?Mk9QZHlSL1hEUEZ2TlA4YXJ5LzZlRlRvQ3hPOGZmS3YzekpvVmcyZkhoNjIx?=
 =?utf-8?Q?+eHPHaYQaAXV2Qy5fs9vcZYbx3vjLxsd3WsbRnZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c128139-f5df-43f5-211b-08d94619711c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 16:15:33.6540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /caRK1+06f4WohM7tNsEdCN0CY6IU8u5eL45+Mr1vro9z4wyHgkCWw3C7Kq9bSgj0+/Yto4c32/NAFHALXnjaAU1UVrj1Rn/N5cj4wdok9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4308
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130104
X-Proofpoint-GUID: 3OwAQkJPIcnl3mO3DAd9_vMo91VqHeKA
X-Proofpoint-ORIG-GUID: 3OwAQkJPIcnl3mO3DAd9_vMo91VqHeKA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/2021 3:36 PM, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jul 12, 2021 at 11:19 PM Steven Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     On 7/8/2021 11:10 AM, Marc-André Lureau wrote:
>     > Hi
>     >
>     > On Wed, Jul 7, 2021 at 9:30 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com> <mailto:steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>> wrote:
>     >
>     >     Add functions for saving fd's and other values in the environment via
>     >     setenv, and for reading them back via getenv.
>     >
>     >
>     > I understand that the rest of the series will rely on environment variables to associate and recover the child-passed FDs, but I am not really convinced that it is a good idea.
>     >
>     > Environment variables have a number of issues that we may encounter down the road: namespace, limits, concurrency, observability etc.. I wonder if the VMState couldn't have a section about the FD to recover. Or maybe just another shared memory region?
> 
>     They also have some advantages.  Their post-exec value can be observed via /proc/$pid/environ,
>     and modified values can be observed by calling printenv() in a debugger.  They are naturally carried
>     across exec, with no external file to create and potentially lose.  Lastly, libcs already defines
>     put and get methods, so the additional layered code is small and simple.  The number of variables
>     is small, and I would rather not over-engineer an alternate solution until the env proves
>     inadequate.  The limits on env size are huge on Linux.  The limits are smaller on Windows, but
>     that is just one of multiple issues to be addressed to support live update on windows.
> 
>     For the alternatives, shared memory is no more observable (maybe less) and also has no concurrency
>     protection.  VMstate does not help because the descriptors are needed before the vmstate file
>     is opened.
>  
> Why does it need to be "observable" from outside the process?
> 
> I meant memory to be shared between the qemu instances (without concurrency etc).
> 
> You would only need that memory fd to be passed as argument to the next qemu instance, to restore the rest of the contexts/fds I suppose.
> 
> I think we need to do this right, as it may have consequences for future updates. It's effectively a kind of protocol. We have better chances to handle different versions correctly by reusing VMState imho.

OK, I yield.  David also does not like using env vars here. I'll define accessors that manipulate a QLIST of struct {int fd, char *name}, create a vmstate struct to describe it using VMSTATE_QLIST_V, 
and serialize to a memfd.  

Sound OK?  

- Steve

