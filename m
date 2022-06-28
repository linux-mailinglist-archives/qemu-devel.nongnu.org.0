Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE355E5AF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:31:35 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DBe-0004ai-EK
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o6D8e-0003Ml-Q1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:28:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o6D8Y-0006ok-4n
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:28:27 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SFJXEg018561;
 Tue, 28 Jun 2022 15:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=lKTVtNFEkqhSRLJjQ96YvgpZyctlgudWB6os/AdE5kw=;
 b=EInxXSgsgLrCmO/TRJfSBkfhBm95C2niHzZjfH25SBf27tShw4vm8UoiJokJn2gdNdg3
 jv1w13RVier/843PfO25mwWcodnXWdaoXs1iokfuM9n2/k8knEHg6OrE2DvzwblJH/WF
 /dbw3r1dubFFKIP3mtJhQIsVHG69CoxvnFjvJCi2PYTatpcJejwGRd0VzqEBX3IHNvyU
 UGFNwA6dBXVMT9kG3Hjj1EpQIWbQILlQ9951aGFyVoO1Edp98ZQ5rozLSjK8792Vre5+
 OBJYVcWc3PvsjnafkDU0Fakmkpm+HFrpenUrEOo4A6SQQamkK4OFt/IiPozlYC29DTu6 oQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwt89xc9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 15:28:13 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25SFQqhv016907; Tue, 28 Jun 2022 15:28:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt2fkxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 15:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXBd5vwO7zf2jNlstfVSjftHXO0SsEacE3PTdhRITufKv4/NO4IVCqjJYeuYrqD91zwoKLoHLsEaEObALt2j8Wi1VymA5uBDDj3V9jah5FPNbf+/g8C7nfrgt2IArLytHr6xVkMZEkk7dpq4dSTX+m44rvXmPbqLLk1CCc/oWqPWO0/CAC6TvUP04FDqYx3aBRQKztemkJaudXdYTPCdj92cvshWFvxf8pjc5RF26JNvB0oV09cGhDKovqmNLYb4P9hFGt72StZxoVkY1iuJFRt5fI9JCDowpQ/MUOlQXDcNXeQoA8ZD1RD2S6WpXqa+iAakQy6Q/qhRwY/2XQhawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKTVtNFEkqhSRLJjQ96YvgpZyctlgudWB6os/AdE5kw=;
 b=TawoDWEzFBSaEmqLuQOem/Q/a7SOF0syIRTNhWHOTppg7RIUdX4e+kQDMoWVH2+5VLtuhyfRs52N2JsOlttP5Few3nocBqVnT+FwmKsuH8ndXgWYoRym2xdkCjHwoXFM+0whjEJ4Q7FDTdzZoKZtgOVVBov3Aj0csIpoJMHMOdKWXe0/0LPiy+c3dU6MROfHzn1YCURKwNKYta4MjqrPujYD6Gl9dXq5szDnYVvDL1NfBtkuXfbIZS6PrRo9aLUkR/99JfRjVOEQxfr5nsBGA+n9QNZnKri1A7nZhXBoTARKR/nvIF3FzwWRMk3iZr/sGdxDryuaXCaVaK5uovI7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKTVtNFEkqhSRLJjQ96YvgpZyctlgudWB6os/AdE5kw=;
 b=k9x5bgj1rfnF9BME6yILFMVlqXAldLQYTWxueb1DSq3HJK2iR7CKejY4rWWkctKvAW3xsZsJLixFMbLS/yHZeUvdyU+/tyeBivX1KSL55ty7blDVSxKYj7uM/HWI7fwuYfHIMKzBb9gBqn7vuw4Z4g3Td7MuQB2LVlOeF8sPWI0=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR1001MB2080.namprd10.prod.outlook.com (2603:10b6:301:35::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 15:28:05 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5373.022; Tue, 28 Jun 2022
 15:28:05 +0000
Message-ID: <b59553db-09ce-3824-e3ea-a721def40cd1@oracle.com>
Date: Tue, 28 Jun 2022 16:27:56 +0100
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
 <20220617143251.5f064694@redhat.com>
 <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
 <20220620162720.2ea44444@redhat.com>
 <07368ec5-98bf-20e2-71e6-c258370970fc@oracle.com>
 <5a094bd6-ebc1-c512-e97e-c1edba94f41a@oracle.com>
 <20220628143803.538bfe74@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220628143803.538bfe74@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0086.eurprd03.prod.outlook.com
 (2603:10a6:208:69::27) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2265e2-8003-4a78-7515-08da591acc0c
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2080:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pYxepPG1FT2DPnfY8TH9sFWu/W+SMXz5F98mJW+3u0bo1iLWPq/PkFW8rA2jn63422WwNGj7zWzJCTX0BV/kQUc4L7pUZ7+pTKjqVeKCLtuBDWE072BeVsVmGFByLvra9DaZ9fqTKKjuIjV1cs+OSJkgoELVgYCXJCVs8v9x1GEwC7lvp2HL8n3yJWGDNSGbkWl91kHkQF1SA31bPz7Zw0cheqkieKuehS/f1GovsoLH5VfXo95rsf373FYEu2YWjq7CAhz/QC1vGvELoz8kmnzCEFBz+mX1MT3h4FKJgI7eeZKPCs2RLOf95fhv7zTB2G57M2bqZG2BtUEhxA3nPP0fRwx3Q5Hu9oiXtcd7Bl2j8v/DXrum9P+EYe0kcMYRLDvvd+7OzYSkm2V1LTFpGU8Nd+Jbm9Ur3r7FILzLaKkkmiQrqOEuXb+DhgQ9ZwNaIsVqisrxNHX41g7KllfYgw0bFgEclgiwGgnLHwzGF5h5JSLDHv0jBFvcy0IwjMVwTDlT4rRniFzcZzDk+eDd0HjquAI0+XjxpeLThvF84Uyw063p28+MYE/pIgWn7hb6hxH9beEoP94B7iU3QgD9S65kUvLpRw4Nh/sok8gZjO0KY3nK1fb1giIBk3LTKLLJNbuEKU0gn6byVMVTEDhO7sXCE2EoYKzWE11O+DkP3dhDwlsDHWg4rELMsLg9NNE8cs234/9rDrzCvLowM0R5/ro2UGjQ5IGX+f8AN+jPefHbUIqoC8HqrEof1b+YgbL9yvJXPqnzHUBW+nu0fZUvXYIe6HU9V0BWcAtNp9Hi7R0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(376002)(136003)(366004)(6666004)(36756003)(53546011)(66556008)(6486002)(31686004)(83380400001)(186003)(2906002)(6512007)(4326008)(26005)(66946007)(31696002)(6506007)(2616005)(66476007)(8676002)(5660300002)(54906003)(316002)(41300700001)(7416002)(478600001)(6916009)(8936002)(38100700002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdVdWFsVDFTNVR3WFpmblNrZU1xZnBiM0Z5R2R2OFlyS3JhalVmSkFjWlVU?=
 =?utf-8?B?K3VTdWR1UUhaS2tZbkxRZGY0M1VFUDNpcFN4ckhPbkZnYkJCVHhsNzV6Si9t?=
 =?utf-8?B?TlM0bjV5aDRCbTBZeFY2d0VWaGVUanh4c3dEMzVzSUpNM0xnVU5yR2tubktM?=
 =?utf-8?B?b2cwdW1nTGJqTkVsdDVMVzlkSUpJQlRyZ0c3Uzk2aWJGSFpZMGxqam56Umt1?=
 =?utf-8?B?cE11MTJUc1RTOHZUbUJyM2tOSHBya3B3K3hYUktLRThsYU1QZDF0RUxQeVBL?=
 =?utf-8?B?TXZsV3U3M05yWDFDdHp3M1d5Yi92SmV6TFpxZWFIaUtQUTJrVkRodGREMEIx?=
 =?utf-8?B?R2drTXpxMFVHeWh0Mk5ZT0pZdmV2UGx5UFpld0ZRYXh5RHBZUlIrNDF0S1pW?=
 =?utf-8?B?alY4VFJlUWpxQjY4dEtGQ1pKNjlSUXAydGhraGs5OVhKTEtiOTFuZG5jWXZw?=
 =?utf-8?B?dU1LNWlYOE9sYy95V28xQ1Y0QVBaRjhzeG9OQjNGYWRJME85MEZDNmxodmND?=
 =?utf-8?B?Tk5jVEhHcTUxblNTckF1YmwxVE90OWxzVGlFQ2lqQ2dIV28rWDJwakozV21p?=
 =?utf-8?B?SFVBcDFaNWVUVThNQkdjM2JXamNGczNXK2JOSE9kdHNiK1NMUW9rYitxZEdR?=
 =?utf-8?B?Z2RVQlI4bmlxSzRRbVpIVW5IVDBQaXNKczRpVitGUEV0WWdXZkFHRUhMbkpm?=
 =?utf-8?B?VlVsek1BQjdIWmpKcW4zcmswOE40S0FyWWhlNUVJT2FtajF0eVVGeTF0emYr?=
 =?utf-8?B?S3RHVHhzNzhkTjRjNzFiam1NZytycWZ6TmhDZUFrdHQySWMxWXBucWhWT3RN?=
 =?utf-8?B?Q3ZjZENRdFdGUVF3c0dzbzV0TGhLVHNMb1hhNHU3Yk1nUjcvaTkweXdhUnlq?=
 =?utf-8?B?Q1lwUEdnZXo0akNweFlwa2xSYk5IbG5qL044UnRHYzhnZXZMMDR1MDRpRjRY?=
 =?utf-8?B?S1F3MWoxUVdJR2pOK1NJSk05SW5pTjdWa1RuRlVzSVlTb05XeG5OSWVzclcx?=
 =?utf-8?B?ODFDSjVlL1hzVU5KRlBQa21ydnVkRGREdVdGQThYdFM2cTQ4ZUtZR1ljVmpD?=
 =?utf-8?B?S2ZxWWVIekdERys0WjR2dWJMbHFicnFsMU9TWklwb0o3aEJQTm1paU5VV2RZ?=
 =?utf-8?B?MStxckc1N0l5QXlYUmQrZDY1cE5ocFNHOEJudDVFOTV6Vnl5dFluZk5rUGNE?=
 =?utf-8?B?eTFYNUFvdjVCUHBtdlovSG9ReTRQQmNiVVB1ZUdlRlNDem5CNUFEdlN4QU1Y?=
 =?utf-8?B?UXozbmM3T0svQlN5MHJncEZkTlNYUERtanpVRTNUZy9Kc0JUKzMwMEhaZjh0?=
 =?utf-8?B?c1lUY1N4S1VtYnJ2OGV4b3JtVnQvOEFUT29YTTM1UjdHV2RWdlRmSFM0aGtt?=
 =?utf-8?B?NHpVeS9jQlp1L0c2V2JUQ09TeVh6eklndTNDVVlsbFY2WkxlVjJ5K3JKc1Fj?=
 =?utf-8?B?Yng0OE5Oa0EzK1JJRGJpOWo5bkVuaWZXSEpDNUlUNkphWE9MV0NjY2lDLzJq?=
 =?utf-8?B?TlIxeEFZcFh6MXpZSDlIaVZKMENnL1FGNy9qbSthazF0UFI2L25TbG9IWDlj?=
 =?utf-8?B?OWFoMXZoa0lteEJzcm1vek9ma0lrTGV5NlF0YjRkVWRqK0NlWm1CMFVER0Js?=
 =?utf-8?B?VmU5bUFXWXh1NFBNWUJBM2xVbWZMRmxONUVKZGE5aThrRnhLQ3F5Kzg0b3Rw?=
 =?utf-8?B?NEVHeGVuU0FJWDB3TVRLT1g4eXpDVlY4Zk9ZTmtiVjRoU3BUK3BYempXd0x4?=
 =?utf-8?B?ZEhFUTFPV0VOU1RNcWgxL3I5RlhydGp4R3hOeEQ1M1VPM0JYYVhkV2Q4SGxP?=
 =?utf-8?B?MXJHSVlkbnhuMjJIRGRiNlpWWjVxaTVZaUZuN0tBTjJDZ21pVGwvK09oYkFM?=
 =?utf-8?B?T3hZYWJ0VW1NemdreU9raGpjd3UzS2RTZG5LbDlaSEFSZkdkV09QcVZsVktz?=
 =?utf-8?B?WXRrOGFtZ21RbnZsUmJOYjhvYVdMeXo1VEt0ZXQ5bzArT2psWDc0ekk1ZUp5?=
 =?utf-8?B?N3dWcktLaDRvUTdSeWwzOXpLZlBDa0psRHBtcWpaUk5mV2R6S3NrR1ZjdlM4?=
 =?utf-8?B?R3dNcTdsVk1LMHdXbW9nZFp0NFd4MnVlTFFJR250TVlKTGMrQm0vT1psOUdN?=
 =?utf-8?B?WUo1VzRmdmZCOG1vZjNiemRPWWptTG9GeTltMnpWSTZxbHpWWGZpUzl5ZzRj?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2265e2-8003-4a78-7515-08da591acc0c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 15:28:05.4986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnxcXZcUcbzd4kG0KX90cPU87+CtwWsGM7S72itHtG4fD2jBThFKK5E2I/neAnVkGXw4Sz0R+98/k/rLWjUmLTtOyo+gesJFsroDQcmHO4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2080
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-28_08:2022-06-28,
 2022-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206280063
X-Proofpoint-ORIG-GUID: IVB88VHK9tFfTAtghGvz4-SiJHRXmeZO
X-Proofpoint-GUID: IVB88VHK9tFfTAtghGvz4-SiJHRXmeZO
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



On 6/28/22 13:38, Igor Mammedov wrote:
> On Mon, 20 Jun 2022 19:13:46 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/20/22 17:36, Joao Martins wrote:
>>> On 6/20/22 15:27, Igor Mammedov wrote:  
>>>> On Fri, 17 Jun 2022 14:33:02 +0100
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>> On 6/17/22 13:32, Igor Mammedov wrote:  
>>>>>> On Fri, 17 Jun 2022 13:18:38 +0100
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>>> On 6/16/22 15:23, Igor Mammedov wrote:    
>>>>>>>> On Fri, 20 May 2022 11:45:31 +0100
>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>>>>> +                                hwaddr above_4g_mem_start,
>>>>>>>>> +                                uint64_t pci_hole64_size)
>>>>>>>>> +{
>>>>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>>> +    MachineState *machine = MACHINE(pcms);
>>>>>>>>> +    ram_addr_t device_mem_size = 0;
>>>>>>>>> +    hwaddr base;
>>>>>>>>> +
>>>>>>>>> +    if (!x86ms->above_4g_mem_size) {
>>>>>>>>> +       /*
>>>>>>>>> +        * 32-bit pci hole goes from
>>>>>>>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>>>>>>>> +        */
>>>>>>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;      
>>>>>>>>
>>>>>>>> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
>>>>>>>> that's located above it.
>>>>>>>>       
>>>>>>>
>>>>>>> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
>>>>>>> otherwise. We won't hit the 1T hole, hence a nop.    
>>>>>>
>>>>>> I don't get the reasoning, can you clarify it pls?
>>>>>>     
>>>>>
>>>>> I was trying to say that what lead me here was a couple of qtests failures (from v3->v4).
>>>>>
>>>>> I was doing this before based on pci_hole64. phys-bits=32 was for example one
>>>>> of the test failures, and pci-hole64 sits above what 32-bit can reference.  
>>>>
>>>> if user sets phys-bits=32, then nothing above 4Gb should work (be usable)
>>>> (including above-4g-ram, hotplug region or pci64 hole or sgx or cxl)
>>>>
>>>> and this doesn't look to me as AMD specific issue
>>>>
>>>> perhaps do a phys-bits check as a separate patch
>>>> that will error out if max_used_gpa is above phys-bits limit
>>>> (maybe at machine_done time)
>>>> (i.e. defining max_gpa and checking if compatible with configured cpu
>>>> are 2 different things)
>>>>
>>>> (it might be possible that tests need to be fixed too to account for it)
>>>>  
>>>
>>> My old notes (from v3) tell me with such a check these tests were exiting early thanks to
>>> that error:
>>>
>>>  1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
>>>   killed by signal 6 SIGABRT
>>>  4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
>>>   killed by signal 6 SIGABRT
>>>  7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
>>>   killed by signal 6 SIGABRT
>>> 44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
>>>   killed by signal 6 SIGABRT
>>> 45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
>>>   killed by signal 6 SIGABRT
>>>
>>> But the real reason these fail is not at all related to CPU phys bits,
>>> but because we just don't handle the case where no pci_hole64 is supposed to exist (which
>>> is what that other check is trying to do) e.g. A VM with -m 1G would
>>> observe the same thing i.e. the computations after that conditional are all for the pci
>>> hole64, which acounts for SGX/CXL/hotplug or etc which consequently means it's *errousnly*
>>> bigger than phys-bits=32 (by definition). So the error_report is just telling me that
>>> pc_max_used_gpa() is just incorrect without the !x86ms->above_4g_mem_size check.
>>>
>>> If you're not fond of:
>>>
>>> +    if (!x86ms->above_4g_mem_size) {
>>> +       /*
>>> +        * 32-bit pci hole goes from
>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>> +         */
>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>>> +    }
>>>
>>> Then what should I use instead of the above?
>>>
>>> 'IO_APIC_DEFAULT_ADDRESS - 1' is the size of the 32-bit PCI hole, which is
>>> also what is used for i440fx/q35 code. I could move it to a macro (e.g.
>>> PCI_HOST_HOLE32_SIZE) to make it a bit readable and less hardcoded. Or
>>> perhaps your problem is on !x86ms->above_4g_mem_size and maybe I should check
>>> in addition for hotplug/CXL/etc existence?
>>>   
>>>>>>>  Unless we plan on using
>>>>>>> pc_max_used_gpa() for something else other than this.    
>>>>>>
>>>>>> Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
>>>>>> present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
>>>>>> large enough on CLI.
>>>>>>     
>>>>> So hotpluggable memory seems to assume it sits above 4g mem.
>>>>>
>>>>> pci_hole64 likewise as it uses similar computations as hotplug.
>>>>>
>>>>> Unless I am misunderstanding something here.
>>>>>  
>>>>>> Looks like guesstimate we could use is taking pci64_hole_end as max used GPA
>>>>>>     
>>>>> I think this was what I had before (v3[0]) and did not work.  
>>>>
>>>> that had been tied to host's phys-bits directly, all in one patch
>>>> and duplicating existing pc_pci_hole64_start().
>>>>    
>>>
>>> Duplicating was sort of my bad attempt in this patch for pc_max_used_gpa()
>>>
>>> I was sort of thinking to something like extracting calls to start + size "tuple" into
>>> functions -- e.g. for hotplug it is pc_get_device_memory_range() and for CXL it would be
>>> maybe pc_get_cxl_range()) -- rather than assuming those values are already initialized on
>>> the memory-region @base and its size.
>>>
>>> See snippet below. Note I am missing CXL handling, but gives you the idea.
>>>
>>> But it is slightly more complex than what I had in this version :( and would require
>>> anyone doing changes in pc_memory_init() and pc_pci_hole64_start() to make sure it follows
>>> the similar logic.
>>>   
>>
>> Ignore previous snippet, here's a slightly cleaner version:
> 
> lets go with this version
> 

OK. I have splited into 5 new patches:

578f551a41f0 i386/pc: handle unitialized mr in pc_get_cxl_range_end()
49256313cfd9 i386/pc: factor out cxl range start to helper
4bc1836bd588 i386/pc: factor out cxl range end to helper
e83cc9d3081c i386/pc: factor out device_memory base/size to helper
1ccb5064338e i386/pc: factor out above-4g end to an helper

Will re-test and respin the series.

The core of the series (in this patch) doesn't change and just gets simpler.

>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 8eaa32ee2106..1d97c77a5eac 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -803,6 +803,43 @@ void xen_load_linux(PCMachineState *pcms)
>>  #define PC_ROM_ALIGN       0x800
>>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>>
>> +static void pc_get_device_memory_range(PCMachineState *pcms,
>> +                                       hwaddr *base,
>> +                                       hwaddr *device_mem_size)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    hwaddr addr, size;
>> +
>> +    if (pcmc->has_reserved_memory &&
>> +        machine->device_memory && machine->device_memory->base) {
>> +        addr = machine->device_memory->base;
>> +        size = memory_region_size(&machine->device_memory->mr);
>> +        goto out;
>> +    }
>> +
>> +    /* uninitialized memory region */
>> +    size = machine->maxram_size - machine->ram_size;
>> +
>> +    if (pcms->sgx_epc.size != 0) {
>> +        addr = sgx_epc_above_4g_end(&pcms->sgx_epc);
>> +    } else {
>> +        addr = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>> +    }
>> +
>> +    if (pcmc->enforce_aligned_dimm) {
>> +        /* size device region assuming 1G page max alignment per slot */
>> +        size += (1 * GiB) * machine->ram_slots;
>> +    }
>> +
>> +out:
>> +    if (base)
>> +        *base = addr;
>> +    if (device_mem_size)
>> +        *device_mem_size = size;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -864,7 +901,7 @@ void pc_memory_init(PCMachineState *pcms,
>>      /* initialize device memory address space */
>>      if (pcmc->has_reserved_memory &&
>>          (machine->ram_size < machine->maxram_size)) {
>> -        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
>> +        ram_addr_t device_mem_size;
>>
>>          if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
>>              error_report("unsupported amount of memory slots: %"PRIu64,
>> @@ -879,20 +916,7 @@ void pc_memory_init(PCMachineState *pcms,
>>              exit(EXIT_FAILURE);
>>          }
>>
>> -        if (pcms->sgx_epc.size != 0) {
>> -            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
>> -        } else {
>> -            machine->device_memory->base =
>> -                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>> -        }
>> -
>> -        machine->device_memory->base =
>> -            ROUND_UP(machine->device_memory->base, 1 * GiB);
>> -
>> -        if (pcmc->enforce_aligned_dimm) {
>> -            /* size device region assuming 1G page max alignment per slot */
>> -            device_mem_size += (1 * GiB) * machine->ram_slots;
>> -        }
>> +        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
>>
>>          if ((machine->device_memory->base + device_mem_size) <
>>              device_mem_size) {
>> @@ -965,12 +989,13 @@ uint64_t pc_pci_hole64_start(void)
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      MachineState *ms = MACHINE(pcms);
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>> -    uint64_t hole64_start = 0;
>> +    uint64_t hole64_start = 0, size = 0;
>>
>> -    if (pcmc->has_reserved_memory && ms->device_memory->base) {
>> -        hole64_start = ms->device_memory->base;
>> +    if (pcmc->has_reserved_memory &&
>> +        (ms->ram_size < ms->maxram_size)) {
>> +        pc_get_device_memory_range(pcms, &hole64_start, &size);
>>          if (!pcmc->broken_reserved_end) {
>> -            hole64_start += memory_region_size(&ms->device_memory->mr);
>> +            hole64_start += size;
>>          }
>>      } else if (pcms->sgx_epc.size != 0) {
>>              hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
>>
> 

