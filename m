Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC5570657
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:57:42 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuqz-0004Ny-5x
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAuSk-0000wS-8A
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:32:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAuSg-0006pm-7G
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:32:36 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BDoRS0006736;
 Mon, 11 Jul 2022 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=bJ0J+HLk0eqzO8wgLMbeSsg4hb0wcXlsUmDrn67kKSM=;
 b=AcXbXRHOdRm2qxkHX8yHIj4XES2FoaExI2sZUZb3apYnLh6xeB4xJAtufzc14yDnyzNb
 e+Q3QeqUCZSc501+TJM98yVW7ksIGZ1DRRZKyDTmbm3nj1v6GeFnmo4L9Gc8nZkM/PZF
 ZUzoKkKsGO7FAzdlbXKScJ8a0mr5jAC6CU4vzbAExJx6TXO0HIujm5/kYW2XoLK1W2fi
 8QwBCfQT9lf/oOagvwFtjYz4APUPoTUkK0EMvsv9+mif5XnOuoJt0dwTO9K386SXJKZM
 kQbPc1zNUrGqyvTBhAsDPm38FETS/SfVhBxQxkEdKD5Jt5QDpe4HgVo5iKoWxZ77DYkV 2A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sc3nv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:32:25 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BEP1He014711; Mon, 11 Jul 2022 14:32:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h704234hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:32:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rd1n3hE9SvUdc8TXpMvv3he7iwMx3ID6JOriIfjNeiVoWGcKahLTAQxBE1vRD7TalZ2h7EWSICdw1nPhn0Z4Yt2Z3kuerITbLOw1MkjCFClRMce34glhiLfCSt091WXRFBQGQSdrrznGe7pu5YZEfGciw9LKbq8PL2+iYQIal9Aa4FK4RrUaxi4SeDuEv0+KuN0Ie3VRjLms1hooEDgv8K2Nbwh2qMLD30PDJ5qoAwvMOqJAwm5Lagl84vHqSdRT7mK9Diyx2HCdN5nQeejJcdJRoPRAk4xSoYJ+TkVrgQYB8toXd4jGWHCSEQh+TmuCzKrX47LEur8dTzZcVY1sIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ0J+HLk0eqzO8wgLMbeSsg4hb0wcXlsUmDrn67kKSM=;
 b=YK41YWfFWaUsdoCT3dqypnt7xWn79EcQj4tAMDbr10bNj6vbmKUuaHqIEHGBuNTjk2omCnajDv1+1UeUl3szLFYnChrpQt7p6LMbY0JfwtBZp5ZQNn9Q9a91SM6sOM2irgnzNvdS5FbhbL5S+wFqoAMAx1V3MMELOFYsmUBeE9uTUJBzzJ4BQqEPF0panm7/UoIv1qYLFOlNjx1IwM5xNWgZBtU+zvHzIov605EI/gJvzsN/oisPgnkTkKE5nm1RhkiQ8t3GddUlsSPUXuwqd8WSfKb8V//QohQay19y8naA42U3BrR8XOPnvtgxOSEWXJ+S/d+bQGa0iev0aBGjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ0J+HLk0eqzO8wgLMbeSsg4hb0wcXlsUmDrn67kKSM=;
 b=uHQnC54xiuRbZP9bS/ysQL8bD/rkm/zTuLVPBRcMudz2jd47mOTXWPHUc6JAlKzpB3bEovcVALDL7JxtB5n32QR49PLhJRT1TLPoWcuYPdQX6NobHT/ranaX2B9phAYtInA0v60KeKi1145Kmf7P5OaUTpORgsS/ltPwq/xiiKA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM5PR10MB1723.namprd10.prod.outlook.com (2603:10b6:4:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 14:32:23 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 14:32:23 +0000
Message-ID: <aa969aff-3eae-0d63-925a-84e75bd5dd8e@oracle.com>
Date: Mon, 11 Jul 2022 15:32:16 +0100
Subject: Re: [PATCH v6 07/10] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
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
 <20220701161014.3850-8-joao.m.martins@oracle.com>
 <20220707150533.68892c2e@redhat.com>
 <b9ae2b09-4b25-34f7-e9ed-1aad3ebfadf5@oracle.com>
 <20220711145806.1d47f365@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220711145806.1d47f365@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::11) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bb6daca-1796-43c0-cb62-08da634a2b23
X-MS-TrafficTypeDiagnostic: DM5PR10MB1723:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JddrY5VuOFhIh2RBPF0sZ7Mt0PRkR4Y6cfm6ft7qEZWIUNQODWlWLOtQoQ26sMLfbzHFeVxFyWOarwK7KCi4JYM9WXQryJsIYbjj6P5O2c5qWMqieRxnab+AN6jJm0fjkJoN9uTXAB7vOGvZTqifrfL8E6So5NfzwZfT9XueP/F3OMorXV1DQyhBo8NU1HHc2XJnUwBmtPIEgj3lJ31dGjgUqMjQfRKgw2hfUaKOaZNfaWcJTMzNpaSr7G6CdLGmxDvqVUezWBsbaoJmglk6kIL6v2qoW2/B2R6nnRpL0XJ/j+0fAMzNrLwwgZ7VYGpVtRCS5z79090XNkDk0jW/JIfua4FNKe1TvKu9YpRXWPWOeLTRgmBnp3IP3Qg4Hx+yZRhWq10HLoXjtrE6bO2KFrXNrjzVeCECWUVu0g+yDl4CxSQ76dCPEHYrMcR7OBOpm1i+YdtbSEAuSSfKnHkh9PN93JVFHQ1WlTGmYUaaIjK9RItbdYjPlzAkoLltBdlRqkWiXt+tVIiSrC1dbhm9pWPMjg0dxQuS0oxatOWwyPJlKxGEggut/7j0Q+Fprl6bKicghn7gxsvVXHN/NSmuQB29B74bOGmh+Lt+59iqmqyeU1JHBHAfL9FYVxjq6wr9JFzfy5pIveFl+LfU+uWU4McTZZLuHlp6gxC66zfQ+jBjVNMnCz5mOrA8zsapDtuyHFHYSUDWVup7p0wSyE9of69stizEnTvGcbMVgcpyVNhd7cDFjo62tcGHYYSQ+wynL4vdZa9VcbedcUTH4BWQSP9UbYVtR6ZK84ZgtdvBV40Fwkt2zr649yEJtblw7Jc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(346002)(136003)(39860400002)(6916009)(8676002)(66556008)(4326008)(31686004)(36756003)(54906003)(38100700002)(316002)(66476007)(66946007)(53546011)(6486002)(31696002)(2616005)(478600001)(5660300002)(8936002)(86362001)(7416002)(26005)(2906002)(6512007)(186003)(41300700001)(6666004)(6506007)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVFFdTBmQytWN05XNHYwMXR3S2hIUGtLZHR3ZCtIZm05b0xGbWNjNHNwVWhm?=
 =?utf-8?B?d29GTzZ5ZkdMVW1mTm1abVU2NHBEaVBNS1lTN2pwQ1dPTUl1VmFEMGNTV1U2?=
 =?utf-8?B?L1cvV3E1bkIvaFQvNVlwWHptbmZNWk5OVzlDMVZWbEtrVlo0WkY0OVQxWXBE?=
 =?utf-8?B?SG9aU2Z3SmcxMHk0YWlWZSs1LzhaUmNuVkE0aENvTVZzeUs2K3prU3FxR09I?=
 =?utf-8?B?eHBDaVIvcjZsak9HVVNtMkx3b3BsNlFGTmQrMHFMWkh4MlFKTHV6dUlWNnQx?=
 =?utf-8?B?UkpBNDJiUXhFWTRJVEJpQkcyN2luUm1lbyt0WVVRdUYyWkFFUE9uNWxzc2lh?=
 =?utf-8?B?Q29HZHZLWFhWc1prWlgzUXp6RWdJUWwrTmdvWU5IUXB0dE54Y0EwNGR5ODE1?=
 =?utf-8?B?cDZ4bWQ4YmFnWTMwSFlZN3hGWEM0SVpwQTUwM0ZNZHZJVE9MSkovcS9YYTFI?=
 =?utf-8?B?TDJhdmlyczlzVjluc0lpZ3BMOFBHd0dtQzdMNGpnUWlJNS9ySjBWQ3Uwc0Z6?=
 =?utf-8?B?RlVGenRHVVZFN1NCMkRybHQ1ZGNtaWpBZDdGZnFMUlhiYVFscVRtVDN3TGhl?=
 =?utf-8?B?TzlUU3Nlb05heWZoMGNjaEMyV3dXVmlHRmhOVVk3eFNTU05pYmljSHNIM2Uw?=
 =?utf-8?B?d0RsK2ZGc1NLVG1mcXBiYXVhZ3FyMzlnZzJNZmR6VHUrZDQ0Y1RTYmdnbktU?=
 =?utf-8?B?ZUY0TEhOeVRmVDFHdXR2cFgrUVdRUThPZ2VnTm5sdlNFblJQcUdNV1JiY3oy?=
 =?utf-8?B?QjBJY3BWb2FGaEMzMUZ0cHFnUm9reDVPTlZLT003eE5Cd0krVkEwV1I3bzRp?=
 =?utf-8?B?NjBYN0o3Z3hCOG1pTTF1OFZqYlo4aTNSUE5pUElac2ExZkhKWUFIWHg2QTUr?=
 =?utf-8?B?YVEweUN2ZDZxM1preW94TnpoaXRaNk1TbXhGYzR5dFU3d2ZLdWlMNlk4L3RT?=
 =?utf-8?B?aVpvc3F4aWVVcHJCTjJ5RGdETkZQVzRndHRHRHIyMkc4bTRoZWVyMUszbUc5?=
 =?utf-8?B?OTdBRTVuSjRyakVEL0J6S1FFcWJzV1J0c2RobnpnNy8rM0JXd1M0bHY0dUNM?=
 =?utf-8?B?OWRSOW1tWlVnKzA3clhBcGc4MVRIeDdISDBWaDZ5QVkxRlBiVlhsOTJSUW8z?=
 =?utf-8?B?cHJYS3FXR20wRXVxUEJZU1hvN3dzZUhHRTE5a09ZTUxMSmZIN05FZVNrdnZy?=
 =?utf-8?B?Q2llYTBONUg5OXRRdjJ3d3k1aWhzMCtQOVNBa0JEc1VKWS9PeGFQR0dEN2Nv?=
 =?utf-8?B?MmRRQzFPeGM0UW10VS9ES2l4ek51RHRLVEFMNFo0L0VlZU1GYWFCVzQyU1dT?=
 =?utf-8?B?TjFCZW01eklQZWRRYWNYVTB4MmVTYUxEWkVhcUNjQjJzaDhuSnhyMUJTeERP?=
 =?utf-8?B?ZGdVRmFLODlvazlRNHV5ejU1NmxaM2htV2J4RTIydERiVjE5c25yeU01RzVq?=
 =?utf-8?B?VGlaZHpCTTRVRW1FMDUvN3VRNTNqUlJlYWpHZGo0QzJiZ2FZMkQ1OWp2TFhi?=
 =?utf-8?B?amthNlFyQ0hpd2FuT0h0UDRoY2oxcm5zWGlyeVlSbitEUnNxa21kbkExNmUv?=
 =?utf-8?B?WGRKTkxLNFJralJMQlhKbmVxSlVlRHdWRklOZUxLK1k1cFNyR2hvTWV0TmFx?=
 =?utf-8?B?cjBEbXQzL1I5bmhFSVVFa1dnclhHK3BXMnBCTXNUU1BrVFNkOS9YaWtpamNm?=
 =?utf-8?B?UHc4WlJub3NSMlluRTZZVWRJaTRnUHQ1K3FVVmtJZUZsZE9UOVJDQWFpUHd4?=
 =?utf-8?B?c2l3d2hkUW1NTWsvay9rS1NqdTZHWjVrY3pocGNkTmpFVW5FbW1SQ0dCQmM5?=
 =?utf-8?B?dDlDRTFpUWxWZE9TY3VXMml2TEN0MzMrYXVKSXVMT291TERvMGVkUGU1amNw?=
 =?utf-8?B?cTJ5elFIWUlsZDdQbzVyVVlzVmpOMnIrbWsra25hcmZsVGYva2xvaUdzZ1g4?=
 =?utf-8?B?c1VwV1VsLzFRUC82Y01mTzRyRzNMVjlGY0w5WmJZNHBWTFlteURGalJUS3hi?=
 =?utf-8?B?WE85N3hEVVZaK1VETmxLTGdYTjROZWRYNElGZWtUYU40cE04a0hZMFJTUVRU?=
 =?utf-8?B?bDJvU1Q2dnZ1YUwrR2JMNkEwempXTHYyY2FFbFhtV0ppa3piYTA2U05ITEI4?=
 =?utf-8?B?Ym83SDNLdThBRUhhZnlZYUh4L0hIRkhWb0xpdjFFTzFYQ21qQmR3eTkwQTdW?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb6daca-1796-43c0-cb62-08da634a2b23
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 14:32:23.4153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ialJ6OWf6iy1jHXGAQm3+4j73E20BgyJHBI7XZdDOnYWc8pIk5CYvVWY5hdbWageIvksGtDpLtqMif6rp9gdhfipMlV5Y0HZUDzaWbGR6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_19:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110061
X-Proofpoint-GUID: TTu4dN0zvC7-_R5gKbcw0q5sbvph_Ipe
X-Proofpoint-ORIG-GUID: TTu4dN0zvC7-_R5gKbcw0q5sbvph_Ipe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 7/11/22 13:58, Igor Mammedov wrote:
> On Thu, 7 Jul 2022 16:21:07 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 7/7/22 14:05, Igor Mammedov wrote:
>>> On Fri,  1 Jul 2022 17:10:11 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> This in preparation to allow pc_pci_hole64_start() to be called early
>>>> in pc_memory_init(), handle CXL memory region end when its underlying
>>>> memory region isn't yet initialized.
>>>>
>>>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>>> ---
>>>>  hw/i386/pc.c | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index 8655cc3b8894..d6dff71012ab 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -857,6 +857,19 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>>>                  start = fw->mr.addr + memory_region_size(&fw->mr);
>>>>              }
>>>>          }
>>>> +    } else {  
>>>
>>>   
>>>> +        hwaddr cxl_size = MiB;
>>>> +
>>>> +        start = pc_get_cxl_range_start(pcms);
>>>> +        if (pcms->cxl_devices_state.fixed_windows) {
>>>> +            GList *it;
>>>> +
>>>> +            start = ROUND_UP(start + cxl_size, 256 * MiB);
>>>> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
>>>> +                CXLFixedWindow *fw = it->data;
>>>> +                start += fw->size;
>>>> +            }
>>>> +        }  
>>>
>>> /me wondering if this can replace block above that supposedly does
>>> the same only using initialized cxl memory regions?
>>>   
>>
>> I was thinking about the same thing as of writing.
>>
>> If the calculation returns the same values might as well just replace it
>> as opposed to branching out similar logic.
> 
> Let's drop not needed code, so reader won't have to wonder why
> the same thing is done in 2 different ways.
> 
/me nods.

I've removed the old code in this patch and replace with the latter block for v7.

