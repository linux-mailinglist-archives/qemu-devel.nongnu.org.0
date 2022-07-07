Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4076456A6D7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:27:22 +0200 (CEST)
Received: from localhost ([::1]:34936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TPV-00021O-CC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TM1-000857-5L
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:23:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TLy-0007AR-7r
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:23:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267EkeA0004460;
 Thu, 7 Jul 2022 15:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=C0qjFu+4Twn7+zZO9QC5J6R0Prz9j+5+v40sGgeexTQ=;
 b=P+QwcUny4VnsxLU5e1QsTvj3i3RHGZp5dFddu0UONikI+KCQoQgSmkjkoUYpcEG/yPzj
 6ntNxAU98ML62vDDQ0b0CsGZCFFCnj251in1LDj0azgov5WRAjbS26nG18E1Rk3tV54/
 uf3BExDaKgTmuIFIREr1o5uxHCPIsSWph1hyQaTFavhH/CziaqrSji74R9lGmYZbOz8R
 1UX8nOFLjvKB+RrckwjvDnnR+zeKjURveIbeXEPzKyw2+hOIck+XG8j9YaTkY3uGqNus
 0OTOBn4YDG71q6mE+bisLYCQWkBUJlbYdiFyftUIHZrfEajZflkHlL0ymVJ3HRwbvxRj 3w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubynk5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:23:29 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267FFLTe020016; Thu, 7 Jul 2022 15:23:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud6sge0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPV/rnoJWS53gdOFzwWjGGbXY/h8uyQkmClA8q8sGf49zKMM2I8BJPy86Id9C0cInPm5KDqzFv0c7lGCqd5IArjAbgBq4HWKu6tJ4LNqetd/ooWzLFfQz3BNNYugnZbl5Nh11M21vK3pPue00Kk+Kk62aurEyIh7xTMrmkbrk6QGIizdLgx1H5xdzTm4oGvLxOF9qB276TjQs7WzHdjAW4e8DxqwABuvpgOsWCgFv6dx2+X4/HWW0+DuiWbhknC4ErUvrEJe1vbiV2LEJAR58VrADiDL1qE/E/1g2CBa1x6nykkpC8zyvshYd0GNTdUeSQyxgofgVzdFoFnHTz2DLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0qjFu+4Twn7+zZO9QC5J6R0Prz9j+5+v40sGgeexTQ=;
 b=U1yfaPT3Rf09SUPwan9Ooiy500Y5pnLESIBDlbM87UvBgKa0BM2TATz6VM68VtKqisUcYDPeYMgZ4gdjMDIUoNBH7kE0KtzC5qHr+/nKLfsK/j0f+D9v37Z1F259R9EvaqRhxzQg6V6qOdlmscixnM+rsRvfx9RRuH6YZn4wsh0NIiEsBhNHwhQz07SsNxZcd4jmgrXUHWnSZKOBBag00euTM0YXyPkVfr8/6jM5CdDgKymDPpVPgcCHgQMl4zGYjAZHkvdN4mJhjHnM9feDnZwydnZfK302ucIRgjXfCzKHPGzekl/E4p7NgXTqKizfJ70K9Nm54iEJw/iHDdB8pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0qjFu+4Twn7+zZO9QC5J6R0Prz9j+5+v40sGgeexTQ=;
 b=GYvHKlIPvNDJnE1f2hGkOC1SHFwLmkU1bGFUB5px7jtGYwtwNuXNEYh1hT834PZxlg29fjosTkTXI7g1j8oHUhd/JXLe1FByROZNUcLPuuaArIqF7OzewE8UQ5c3xESLh05ziADVj0Tjf9WCX/x1IGBReQTpmEtGJF3yqisRzPY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB2985.namprd10.prod.outlook.com (2603:10b6:5:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 15:23:26 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:23:26 +0000
Message-ID: <781fc6ae-fad3-18bf-3af7-170587dd330d@oracle.com>
Date: Thu, 7 Jul 2022 16:23:13 +0100
Subject: Re: [PATCH v6 08/10] i386/pc: factor out device_memory base/size to
 helper
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-9-joao.m.martins@oracle.com>
 <20220707151559.043fe91d@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220707151559.043fe91d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::16) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3615fe77-7aa3-4807-9c8a-08da602ca2e5
X-MS-TrafficTypeDiagnostic: DM6PR10MB2985:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JRpH0EcN6P1tFZl+8dIjySnAQ+DGH7LJ8XQV58bgHLxowZGQ30y791wnt24DGIOpB88ClSJh3hcRYPEJS9cdbldu6+Tu8oAyab6WW2PILAbkO55vQcSI/0hxBjUEWVzLdKCuYpEgz+qMs7IqrgHP8uZqIQuGBtzytv+gEwOYXW5JGeNHONI/i0AZZbwUNRVUIyo7x5sKMDNDRirgXOqkyY836jbhS+Olym4gyCmcbHnloeILjL+Re7L/tvbFNxYYgxpMsz3cJs2wg7910abjFl2JtpG5NszSK48K1BlzN3trFjrlWpnTr5SvChz+dUuW8cUB8AJBTcBOrz+V0T0JiAWNJJi91C0kTNMwbH09HA9eUV+lQ3h6UU39qEsA65q5I5UpZTV4FDhL4HpNRP2C1X/dFVEZWrGBtQHOVc76kDyyCzJ9fETge987kqu7lWeHz+Z5QUSX5/vOP80DrNB2QJF5d4iYpWaqVoSu7cLNflueywLGqp6Wjp6QA88xJbyFVlk2+yFH50Sh2PClWoB0MTByG3Hw+2bxqV7bPiAxYhDFPpHWK9e+mQQADJUgzJ07GYah8kIhG+P31+f4i6uB8ryN5l05R4e3SLPEsFR/45QnyYn+D3T9g3NTXK451onj+kgK/iEXdC9dZ0eKLKbmyP0byilhvw/xvJbvHY1faArghAH3bzil2sjvJawHUFLp96J9BNA80HqSHjOGmGX/WKaxEhHpcL8pvvSqTigL7gtb54i7iaYIRMN7Okp4Awvj+EXoM1UdT4DQEUwG0jgmPP83Jv1NMqkMBNyg7E7Nf49lVlIeT9NgrQRmOAeaVlE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(136003)(376002)(366004)(396003)(6512007)(66476007)(6506007)(66556008)(6486002)(8676002)(66946007)(4326008)(26005)(6666004)(478600001)(53546011)(316002)(41300700001)(54906003)(86362001)(31696002)(6916009)(38100700002)(83380400001)(2616005)(31686004)(186003)(5660300002)(36756003)(7416002)(8936002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dhVWFCZ3dGQmdGN0VGZjh0am5FTy9kaHZmRk1nekp6VWsvNzVzR1NEeHgw?=
 =?utf-8?B?djJVcW4ybWxlNTdidzJQUjFsUVNWVTFubTJWZkt4bktLbXI1WEhYQThQL010?=
 =?utf-8?B?WjJWNHBpMFVtK1dPT0NxQVcwQkYvL3BqeHd3eVQ5OFUvZjF5dWxrNGtGZnVi?=
 =?utf-8?B?Q0RGRDJUWWhNUGViNE9SUXZVUks1MnFycHJ3KzVxbTBSQzVBclBpUW1LbTV4?=
 =?utf-8?B?WDBCeDFsVlVXaDMxWFdKd0hhM0p5L0EyTEJjeEM1UjVBekw0UTgyYU14dnYv?=
 =?utf-8?B?eEREaEsrc3Nnc2ZnNjFKeFlzenhRT3lwMHVSWkpVWm9lM21QMTc1OWJ1ZVp0?=
 =?utf-8?B?N1NjS2hHckFzRzFhN2lJcnVZOVhMNGxlZ1c3bVpUcDZYTWpNUS9kb2E0Nlhk?=
 =?utf-8?B?VHZoL1Z0d3FxdWg0VWp6ZEJtWUd0N3FkdHp6MXZ6K3h5VmhhaFJNNUFpNHdE?=
 =?utf-8?B?WVBpMTdpMDNSbTZ6ajV0RzRTZ0h3cHJHUjFxbFpkblVZd2hiSW1NM2o4N1BX?=
 =?utf-8?B?cVRDZW9JTC8xekpEbkk0WjFlV0xqNW1sRHJDenl5Y2ZXTFFPN2RTTFAyMGN0?=
 =?utf-8?B?M0w4WUhIT3gxOC9EREhpMDZSYXhIVUJrV3Fpb09sRjZwbkpaK2NMMHFHcTdR?=
 =?utf-8?B?UEZLWW1sbkJIRXRsQXhkMVVLOGVKOGNhb1AwbDhWYU5BS2JScTRWdmlSb0hV?=
 =?utf-8?B?VmtGRTl5OWNuKzllbEJBcmcvRWZxU2c0c3lPZSswMnVrdFBFMzZGSlVzMmZk?=
 =?utf-8?B?czlUazZRUFB3N0J6Wmh6VWVYR2NYeWJVcWxIYW4zUkE1VXJTbnBzU2syVEtD?=
 =?utf-8?B?NytweG1Vc2IzY3pSTHc2eUdxSDRuYVcyVysxZmFrb09GWGtEVVRlOUxtZExV?=
 =?utf-8?B?bWVWSEVQYld3ME4zVndQV2FUNWlZM3dzanhuQzhLejF4Q3pkU0xDSnBWZFVw?=
 =?utf-8?B?TlJYYUl1MS8raDJPSEZvbiszNG5vY2N2QjJ2YVBITWV6dFJaT0tib0cyakNE?=
 =?utf-8?B?bmFFMVVRNzkxVXBiMlNJMVVpNVMvajZOZDkwM1Q2WTgrc01iZU14TllKOVA5?=
 =?utf-8?B?T0g5MVVlQ0gyZ0hWSTlVdXdtZFQ0Yk5JT3luTUl5OEVkcWQ1NElKSXhlV1dH?=
 =?utf-8?B?WTUwWnpwSzhaT3daRmMydkROaS80ZDd2MFVCRktLSjcxUVgwcHFNNVkwUVdO?=
 =?utf-8?B?dXZpclB5NUFiRXkycmVHMmRNbnVWT0hsK2RkcGVlQ1ZjN0F1a2NwMEFJS0NL?=
 =?utf-8?B?aElzc2VjdXFvVU44VjUwTkFWL3doeG1STm00U0xaN0tCTFI5QnhPcURFSE9v?=
 =?utf-8?B?bThZNFJZWlZjdHorWDNjZ1B5czdibHZxcFN0UHFxSTRrajB2WHpmSGNUbkMv?=
 =?utf-8?B?a0YzM2xIZktCcHBCSFUxWm45R3BlSjU3eVZxVzV1SXRjeTAzRUpMUmEyUFVL?=
 =?utf-8?B?SkNmc2l1U2NVRU5mL2pTeU9TYVdQVFdsTlQxakVpV3ZvdHJzRHZQV1ZWTnJp?=
 =?utf-8?B?YlhzdmZ1cktJNDBDY2dQMXRERDBZd2ZiS0dFM3hOTTRIOGN5V3NKRGNOUjlX?=
 =?utf-8?B?aUx2bDU5ekRNZmJLV3RRUHNTcnBIRWtzSkRBekFVVms4RW84TGxBUS9PYjZJ?=
 =?utf-8?B?Wnk3eHlIRzgwNTdjdEFLTGFSQW9KQjJmZlFCVnUzaDU5SkhCTWlBQ0hUNUhO?=
 =?utf-8?B?b0Y1VC9wU1dVY3FxZkUrWU1KMXJNVHlCdkFpL3huM0tSckFjMmdpMGVSKzl5?=
 =?utf-8?B?dnFuaHlFdXJCek00MXhaVFBPUlhKYm1GZGhJMTZtZVhlaHYxM2VoZHd3L1Iz?=
 =?utf-8?B?MHdNZlpXTGpYOEdVRmdMVGZkRkg0NzVDVy94N1BjVno3bTdBRFg2Zmp2aTV6?=
 =?utf-8?B?Rk9TcmdtQk8rS3JTSjdocTdJem5RUXV1K200WFlmTEQ1Wkw5RFl3a1k0QXdM?=
 =?utf-8?B?bXF2ZDd6YitSdExRQ0Ezc01GMzNjZk1HUmZXbVFoZmZjNGVwSGV2NmZIbUVl?=
 =?utf-8?B?M2NjR1FlcVZZSUxkUlNWa2VKRHdSczRsNGQ2dmptTjFyNHZFWnljMjFneHU5?=
 =?utf-8?B?TEZMeXJrYnU3amZzdko1K2F5QTVZTkh5TkZJSHM4MHpDcmVBLzZMZkRSNzd5?=
 =?utf-8?B?bU1PMU80NnBZNmhrV2lBV3BzdFkrZDRnM2t6VzdlRWYrUlN5ZklJNE1tbDdD?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3615fe77-7aa3-4807-9c8a-08da602ca2e5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:23:25.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/YRcvvUIGB9j9NhC7fCJ5XlqW92NMI86RxVttX7Ryq34BV1/U0j8zqvh6Shi7SjEiS0NGE1sxf8v8T+lHZlxFzNr0Kz2RFlOhh2MbyOP6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2985
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_12:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070061
X-Proofpoint-GUID: Od8YqO_nOv4of0ZsI-bFtN3aE6qhWMmv
X-Proofpoint-ORIG-GUID: Od8YqO_nOv4of0ZsI-bFtN3aE6qhWMmv
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/7/22 14:15, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:12 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Move obtaining hole64_start from device_memory MR base/size into an helper
>> alongside correspondent getters in pc_memory_init() when the hotplug
>> range is unitialized.
>>
>> This is the final step that allows pc_pci_hole64_start() to be callable
>> at the beginning of pc_memory_init() before any MRs are initialized.
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 55 +++++++++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 41 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index d6dff71012ab..a79fa1b6beeb 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -825,16 +825,48 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>  }
>>  
>> +static void pc_get_device_memory_range(PCMachineState *pcms,
>> +                                       hwaddr *base,
>> +                                       ram_addr_t *device_mem_size)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    ram_addr_t size;
>> +    hwaddr addr;
>> +
> 
>> +    if (pcmc->has_reserved_memory &&
>> +        machine->device_memory && machine->device_memory->base) {
>> +        *base = machine->device_memory->base;
>> +        *device_mem_size = memory_region_size(&machine->device_memory->mr);
>> +        return;
>> +    }
> is this block really needed?
> (i.e. shouldn't block bellow always yeld the same result
> as block above?)
> 
Similar to earlier patch -- I agree with you. It returns the same thing.

Might as well delete this block in favor of having different blocks returning
the same thing. I'll do that in v7.

>> +
>> +    /* handles uninitialized @device_memory MR */
>> +    size = machine->maxram_size - machine->ram_size;
>> +    addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
>> +
>> +    if (pcmc->enforce_aligned_dimm) {
>> +        /* size device region assuming 1G page max alignment per slot */
>> +        size += (1 * GiB) * machine->ram_slots;
>> +    }
>> +
>> +    *base = addr;
>> +    *device_mem_size = size;
>> +}
>> +
>> +
>>  static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>>  {
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      MachineState *machine = MACHINE(pcms);
>>      hwaddr cxl_base;
>> +    ram_addr_t size;
>>  
>> -    if (pcmc->has_reserved_memory && machine->device_memory->base) {
>> -        cxl_base = machine->device_memory->base;
>> +    if (pcmc->has_reserved_memory &&
>> +        machine->device_memory && machine->device_memory->base) {
>> +        pc_get_device_memory_range(pcms, &cxl_base, &size);
>>          if (!pcmc->broken_reserved_end) {
>> -            cxl_base += memory_region_size(&machine->device_memory->mr);
>> +            cxl_base += size;
>>          }
>>      } else {
>>          cxl_base = pc_above_4g_end(pcms);
>> @@ -937,7 +969,7 @@ void pc_memory_init(PCMachineState *pcms,
>>      /* initialize device memory address space */
>>      if (pcmc->has_reserved_memory &&
>>          (machine->ram_size < machine->maxram_size)) {
>> -        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
>> +        ram_addr_t device_mem_size;
>>  
>>          if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
>>              error_report("unsupported amount of memory slots: %"PRIu64,
>> @@ -952,13 +984,7 @@ void pc_memory_init(PCMachineState *pcms,
>>              exit(EXIT_FAILURE);
>>          }
>>  
>> -        machine->device_memory->base =
>> -            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
>> -
>> -        if (pcmc->enforce_aligned_dimm) {
>> -            /* size device region assuming 1G page max alignment per slot */
>> -            device_mem_size += (1 * GiB) * machine->ram_slots;
>> -        }
>> +        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
>>  
>>          if ((machine->device_memory->base + device_mem_size) <
>>              device_mem_size) {
>> @@ -1063,13 +1089,14 @@ uint64_t pc_pci_hole64_start(void)
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      MachineState *ms = MACHINE(pcms);
>>      uint64_t hole64_start = 0;
>> +    ram_addr_t size = 0;
>>  
>>      if (pcms->cxl_devices_state.is_enabled) {
>>          hole64_start = pc_get_cxl_range_end(pcms);
>> -    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
>> -        hole64_start = ms->device_memory->base;
>> +    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
>> +        pc_get_device_memory_range(pcms, &hole64_start, &size);
>>          if (!pcmc->broken_reserved_end) {
>> -            hole64_start += memory_region_size(&ms->device_memory->mr);
>> +            hole64_start += size;
>>          }
>>      } else {
>>          hole64_start = pc_above_4g_end(pcms);
> 

