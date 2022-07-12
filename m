Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02A5715CC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:33:00 +0200 (CEST)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCGJ-0002C6-4J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBCBO-0006vp-VS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:27:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBCBL-00050w-Vh
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:27:54 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C7tRpO027941;
 Tue, 12 Jul 2022 09:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Mokg9ysR0RIzLeRPa5lCiCUNxaARP6f13vZAXgyRn7Y=;
 b=ZowbTgfGKIPcPxasxUQgM8G4ARHSLkjuHrAAVNDrVLczwbkt5vafo/g/cDi39c9p3bAt
 nsIR2H7K4HIgBD+bD/1crVjFLLlHtWUi3WhZxZ1/58gBMUlNwg7eD7M/NPWsiwZNTlR3
 gBpuzFnbIgs4FlFeQok9IBHj3hGiQHy4bbr5uRrt7jYBLLnWUj6SOlLgr+un1DtKBFoU
 SqBgXfZOpuKMMqAI7WYDDaCp8UWSK+r3DsGNoFilRBfZwYFTmNmy7WJTU53nLeP66lHH
 tbAUPliWUZl4QjrL1sFoX0H7fFe7xLCusNKqdOny7CacL6Zb0FcO4qQF4+PVrsk7tNyH /Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71rfx50m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 09:27:40 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26C9Gax9028254; Tue, 12 Jul 2022 09:27:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7042q1qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 09:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/51WTnYyin4/AUxNX/QzpSRyba2j14UXVImOEt/ORGMwCxP6qMQ8406a6OSdRFELh0TYjaMLRjXoN+S5B67JkHXRRaIcgQBO/acghLPRTku3gapdkZ7bK2BXqa/8CchcyerYwSzBUKbAVUJEWINpW+BTRqmVN+M3VmSCaUbNsepD3NcHgpNBGczueCVi+9FX8BLrvBcbwN8HcfSivSQPdF0yY11EIgAbs7HFJRy81Or+rDlGbONbDK14fDYOq1QYI9a15HipUXCMNRu/fmrwKX53tD+iblH56FMyqRmMzt/ZQKjsvX2pGilQJFTliOEFCpZiC1VqHrCJ2MvtLP7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mokg9ysR0RIzLeRPa5lCiCUNxaARP6f13vZAXgyRn7Y=;
 b=RGlANHLLmEZ3Vz8Xqtgyb7ncuMbpSUMBK4aNsQGKK8zrxdalUyhqFyQIlNZC6pauAPIOhc9OVheBDFn7SkNhL5vSgF4D7wn0a8wFCmh6VRvA6krO0NS3YvoVXnFCPMarn6Yv+RaQSbU387QWWfWC8yRIOblM0KjG0VZtfPxlrx364u8jTQKpI+9ExAUgAsght3RNdVSliRKq/nOKH7hTew2/k4V5mK0K/jzDlvyNaZ4G+dnbos5qMx7YnRusqDO/rPHA5QrsIHNg5CajpOkq+KTSFkdMTy5zF9lRtR4xCr+yhJW6a2Qz6u0bnPxunqMz/cIOJxnHIhnQUBhrWOAOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mokg9ysR0RIzLeRPa5lCiCUNxaARP6f13vZAXgyRn7Y=;
 b=aWiqsnTXRAnONrvWO53XaO+B7OgkGrxr8kIgvHQXWwlqTVIpcJnNjVQK6a2p6t+Mx6AgRnncCr13WfYT8RKTk3gAH5C1XVMrIXPcII2QsNGwGB3TgsgmhzwTnE4I6LhgP8XR0UbAG/9PNECooMezZ1toCIQAb8FWVnt6DSymC4k=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH2PR10MB3752.namprd10.prod.outlook.com (2603:10b6:610:d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 09:27:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 09:27:37 +0000
Message-ID: <4a90535e-0381-e0fa-65d1-decdabb1f328@oracle.com>
Date: Tue, 12 Jul 2022 10:27:29 +0100
Subject: Re: [PATCH v6 03/10] i386/pc: pass pci_hole64_size to pc_memory_init()
Content-Language: en-US
To: B <shentey@gmail.com>, Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-4-joao.m.martins@oracle.com>
 <FA725D44-6D1C-4A6A-9D83-FF9482DB4593@gmail.com>
 <0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com>
 <2A6CE4BD-F846-4802-BADA-4983F5462343@gmail.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <2A6CE4BD-F846-4802-BADA-4983F5462343@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:207:5::16) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 732d6215-41a7-450b-b8b0-08da63e8c27e
X-MS-TrafficTypeDiagnostic: CH2PR10MB3752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+1kHfp5xuVsEVYdLMklyIqx6wTKks6/BHsW+oc+jOejJlYIdMQucy7Xc4eoVJP1IY+MWbqTvH8yzgJ6c2Xe0t4v9rRaYk0eC9VFeO7SAaq70v6dquxi+A2hVqLwM4pxZXiaV3SZZ0E7QDD/qljkyXJXSxjM6k7YsPGxLcGG4e7NT2Q5mM09INEKfHIIK1VN/Irl95JBtWRvnZ8W2oUYtNxmvSLT12EwNg8npWQ360nmJlvoKsQUD5IM91YUpxye8ZZ+WPCf9eNsowghkiz9wyZvSuyJiDdS7vmvGtH08IgAjAkzdRUWFqTH1f0wdYz8w+4SX+W+tvYgVtzU6BjedsK+ghh2o6m6VEfnzY0+jqMX8kQwHR+0FxZ5yXPFPGLNeQ+9SiKyPTEqjcpyWQocMVnXGbLTrjYRV+V61QVxJAgkQQK8zDPHTgqjIEEdEYI+I+bsuregF4oiV7D3WzX5A41xogcC7oIXuGOj8REv4jKePiisCQz/KzEWYM9ldb/8LnKBXCvGVvbHt3pHv808rr92yjrBjbRF5JA/lHEmCpzfiERcxZ7EmfVjcpkm4KUcS8wj9vc+JGw5ee8U9maPyWarIk7YjuQEjR0mSca/99L83CsO6u+YE4B2vz4B4S1jWbD00xa9yriEoPqW7PKVRQl6zRoie5ROrxWoVvw6YS7Bi3Tid9YnfI3YBFIFbeHOEyLQRGT4DYyznKVzYCQSKb7FtC6JuCbjmkaGYkGuTOYZPMP86gsSq485xnpISj1BtXIvWdOzii9Xgh1kVX3TTClWwsNWVo8MjTHMry+UdTWz9XmSTmwcGxX9sCg1yWta
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(31696002)(38100700002)(6506007)(26005)(41300700001)(110136005)(2906002)(31686004)(54906003)(6512007)(5660300002)(36756003)(86362001)(7416002)(8936002)(186003)(8676002)(2616005)(66556008)(66476007)(66946007)(6486002)(6666004)(53546011)(4326008)(316002)(478600001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm1OZkE5Sm9BTzRmYkNLTG9zVTE5NTdpU1doVzZDdHNZVEVvb29QU0tCczM0?=
 =?utf-8?B?WGlXbkpTS2lvbzBSZXRqL0l1UldvOWlzREVSMUszNkVsQ1pmVTR6VWhZTGFs?=
 =?utf-8?B?VTFhZXFhNGlTL29zNzNrOXhlWkluL3BkUzhQemI1dGZ2ZmtxcmxqQllnRTNj?=
 =?utf-8?B?VTNuK05XTkFSWU9MamtiZ1RmUGg4NWY0VHVWT21kalM4bk1MbEU3b012TzR5?=
 =?utf-8?B?UnlsaTltRTJGMmJiNWFZZGw4b0tKeDlWTDR1dnIrS2FKNFhDTVEvY3Z5cDVm?=
 =?utf-8?B?cXNrc0NablQ2dWwxSjlZL1did1RFRHQ2S1ArUUtIZ01ES0d3MjZRVm9kckNj?=
 =?utf-8?B?QUVhTTg3OXAzck5mMWlSRndGdFZrQS9zMGZZdmk4Q2tUTDB2ZWI5VXRSWlZF?=
 =?utf-8?B?UHkyclYwazV0VUd2dGpIcXRpSG81SURVek1zdGpaNjZ5OGdPN0YwZWZJejJh?=
 =?utf-8?B?eVBudmNGMUNpZG1jZXdhSVIwSjZsUTFmZ0lMR3BpNUJ3SHhFSkFtWXhvWXlt?=
 =?utf-8?B?U3dpYTRIbmwvU25uWVVvc0JzM01RQzA0ZllaOUw3ZVVBYmxTZ0dha0RhdlRW?=
 =?utf-8?B?cGh0T05kRE94cllhdDc5elRaVXJLaThRMkJmWEU1RXMwNVB2Wi9zbVQzNnc2?=
 =?utf-8?B?RWh2R255QUplWGZZbGs4ZWh0cGJBVkxGQlhMMFg0NXZnRnB6c2MrNWs1OWpD?=
 =?utf-8?B?cWYyVkFZQXZxK01vSmlTT0praUw1dHJZNjNmYVZaT21ENFlFTWFnT0VncVNC?=
 =?utf-8?B?cFNuTk1TM1JFR2p5Y2hPSWxaMk5qcGlGUXR1ZUJSREJ2Y2V2SWE4U001ZStG?=
 =?utf-8?B?WHdXbFM1WXdmb0YwREZqUXErNnJadmxBL2o1ZVYvL2xheUVlN1dqR2Y1ejZL?=
 =?utf-8?B?WW12bXBvMjkzbmVhWWNzK1pQNnQxb3IzeU5ONW1zMW13eHlsaFZua3UxR2xa?=
 =?utf-8?B?d0M3T09rRVpQTVIremkxQi8yeEZJdi9PQ0xwVkdUVG9zaGlvSFZoM0FwVVFh?=
 =?utf-8?B?WEMzdGdSaUR4L3ZnR3V0cGh5MlZLZDR1cWJMak1jQm9NMzljVXBGWnJaWWpZ?=
 =?utf-8?B?cFlXRGdYbVhZN2F6WjhOakpTb2FnVHgxVlFpYmxmSDlLbktEMFNQcWg2eUNv?=
 =?utf-8?B?ZlRpN1VScVNPVjVTMFpxazFkR0NVY3BnVS9ydUJGb241OWpPVVZwdStEYXNp?=
 =?utf-8?B?Mk9aSnNkVGJpNFRoa1JEZ1FXOHQwTDIwcTI4WjRWNDlwQWVpZnoyZ01aM3lR?=
 =?utf-8?B?RDVMWkNwUmZyRnh3clNkQnNDQ0s1UEVzYm5ic2MzaU96REI0MXFiSVB3SUk2?=
 =?utf-8?B?S1k3RWdQWmFsVTBVbnZvL2FoN1pHeTV6Q3BiT0tZS0tRNy9qU1V0eWVvQTlF?=
 =?utf-8?B?TWd4RHB5akRzdEhmVEx1dTkwcTJad3kzOVpMYXA4elNKSkZHNzVrUXh6U3FM?=
 =?utf-8?B?QVRYckV5d0RUZUs1UnlxVWM1T3JzZkRSVEVxK0xwWjVpTmNPY0FLMW5mTEtM?=
 =?utf-8?B?aFZXWDhKbW9icFpjcFVWMkJjMmt4RTg3am4vT0FQS296WWdVOVBHeFdpUHBv?=
 =?utf-8?B?a1Q1V0laMHYxNWxIdldHbHNab0lHSVFvRTNxV1l4VnBHaFVmcThYZUVyelVw?=
 =?utf-8?B?alZlc3h3am5mRUloa0hSaCtacFFrTnBKYTFZNnZtaVpmcXA4TWVHcnpLZHo4?=
 =?utf-8?B?WlphNmtsZ3RXUU5BT2xzemVXR2J5cEE1VTR4Mnd1cmdrZDlWUEJFdE05R0g4?=
 =?utf-8?B?NWxORzRnRC9NbnFXZXV4bXl3amZKbEFyNmVzMUZKblpGby9aN1BKOVpONXQ4?=
 =?utf-8?B?S0cxQ0FkWGNwQmZEcVpGQmlLZGRqckhxK1FzcXMzUkFlWFNja1pQODcrc09E?=
 =?utf-8?B?ZXN5eWgzSnFrNC9aZ0xUc0cwclkzM0VqenV0dUc5QkxMYmVOUmkzMHBGeW4x?=
 =?utf-8?B?UlJWMmVIaWVSS0dROVVPV2pBZDNxVXV6bllnZG5IZElhbGNJVERONURMWStW?=
 =?utf-8?B?SmpNZ2tSR01XYWd5KzYzWWFLazhjTjI3ZVk2dVIyeU1vVU1IeFQzMFJFQXRv?=
 =?utf-8?B?cVZheWhDNDAzK2FiZHM4QWtPc2hzMlhIV1REdFlPdWdJaXNUUERKMGs3VDJ2?=
 =?utf-8?B?YkRnQks5MlFhOFZBbzYxaSs5UUpnNk1QSGdIVDUvcU1VaTFHOUNac3lHaTV0?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732d6215-41a7-450b-b8b0-08da63e8c27e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 09:27:37.5024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuOKfc30c9/TxcMwEfA2n4dECN2hOL7A8u2UH4l85BS7Q4okr4Gy+3lJ0PpFsD0DdLFuq/fwja8NraOTbIAbXFGI0RhL8xkE8A0wmJvSXJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3752
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-12_05:2022-07-08,
 2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120035
X-Proofpoint-GUID: 9YE1Yy2rLSN2ABI-rrjaag1bhy8YO1p6
X-Proofpoint-ORIG-GUID: 9YE1Yy2rLSN2ABI-rrjaag1bhy8YO1p6
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

On 7/11/22 23:17, B wrote:
> Am 11. Juli 2022 10:01:49 UTC schrieb Joao Martins <joao.m.martins@oracle.com>:
>> On 7/9/22 21:51, B wrote:
>>> Am 1. Juli 2022 16:10:07 UTC schrieb Joao Martins <joao.m.martins@oracle.com>:
>>>> Use the pre-initialized pci-host qdev and fetch the
>>>> pci-hole64-size into pc_memory_init() newly added argument.
>>>> piix needs a bit of care given all the !pci_enabled()
>>>> and that the pci_hole64_size is private to i440fx.
>>>
>>> It exposes this value as the property PCI_HOST_PROP_PCI_HOLE64_SIZE. 
>>
>> Indeed.
>>
>>> Reusing it allows for not touching i440fx in this patch at all.
>>>
>>> For code symmetry reasons the analogue property could be used for Q35 as well.
>>>
>> Presumably you want me to change into below while deleting i440fx_pci_hole64_size()
>>from this patch (see snip below).
> 
> Yes, exactly.
> 
>> IMHO, gotta say that in q35 the code symmetry
>> doesn't buy much readability here,
> 
> That's true. It communicates, though, that a value is used which was deliberately made public, IOW that the code isn't sneaky. (That's just my interpretation, not sure what the common understanding is) Feel free to do however you prefer.
> 
I think it's a good improvement, as avoids duplicating this new helper in i440fx pcihost
which also means less code for the same thing.

> Best regards,
> Bernhard
> 
>> albeit it does remove any need for that other
>> helper in i440fx.
>>
>> @Igor let me know if you agree with the change and whether I can keep the Reviewed-by.
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 504ddd0deece..cc0855066d06 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -167,7 +167,9 @@ static void pc_init1(MachineState *machine,
>>         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>>         rom_memory = pci_memory;
>>         i440fx_host = qdev_new(host_type);
>> -        hole64_size = i440fx_pci_hole64_size(i440fx_host);
>> +        hole64_size = object_property_get_uint(OBJECT(i440fx_host),
>> +                                               PCI_HOST_PROP_PCI_HOLE64_SIZE,
>> +                                               &error_abort);
>>     } else {
>>         pci_memory = NULL;
>>         rom_memory = system_memory;
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 4b747c59c19a..466f3ef3c918 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -208,7 +208,9 @@ static void pc_q35_init(MachineState *machine)
>>     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>
>>     if (pcmc->pci_enabled) {
>> -        pci_hole64_size = q35_host->mch.pci_hole64_size;
>> +        pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
>> +                                                   PCI_HOST_PROP_PCI_HOLE64_SIZE,
>> +                                                   &error_abort);
>>     }
>>
>>     /* allocate ram and load rom/bios */
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index 15680da7d709..d5426ef4a53c 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -237,13 +237,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>>     }
>> }
>>
>> -uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
>> -{
>> -        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
>> -
>> -        return i440fx->pci_hole64_size;
>> -}
>> -
>> PCIBus *i440fx_init(const char *pci_type,
>>                     DeviceState *dev,
>>                     MemoryRegion *address_space_mem,

