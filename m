Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B519571741
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:24:47 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD4Q-0001TZ-6M
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBD1R-000579-BF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:21:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBD1M-0001sD-Cp
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:21:39 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C8GiSb030514;
 Tue, 12 Jul 2022 10:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1fH5e4VcwofSxGdIA7OArw0v3HV1pR2WVMBi8vBbf+k=;
 b=Ue7gOw6xilrQluKVqFSHUKeB9LuNlyHLPQZ6Y+llR1GTaoV9xhgpjW73GEerP7G5JaD6
 /VPrCOIu2MbzCMFyrfstgWeCa0vNGuSxyAySmbEozuMiOZlJdd+2Lo197FupdQIaVXfJ
 /fgMCffBsE1QYxv4kn3jqtyIRlyIE0Q7EJn/lXR+qmltRq5Fx/2fpxZZVYiNgpbZGmKM
 R7LTH0XalWyneVlEUaFEQ8OIHs7gIZOo980uF2MWdkaAIhW0o9EjFAAW2DQAYTPQ9Rfr
 GniEvrvapOpkFOQfkzXtzf5PBm5LMVDJNp/zvecbKGNMIRg2h8o6wyDomANzKtkJ/bO5 5g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgp33p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 10:21:27 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26CAFJWT016777; Tue, 12 Jul 2022 10:21:25 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7043hcs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 10:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLqNQ0SymiNltEkk8mDeFWnXoCA0EFOaGc9O5PdL5Np4SsyBkJnYX3WPM8hqVLKudAp1eay+W2hDmTAhCnsB0JzWnoyVC1zCidA5marrW+XS4LdjvFLS+Z1I38jylccoHaQ3RxhQt99xI3OphYN5jiblV9jGtqFV3DxUP4V1iovOSNEbYfntz1E+ZiypEI57cDgDdCn/KhqY/avyvxGsQS5N/i7HZWJR5BwpXYpjMNLgB68mIrU+fcC7DAxNL/Da9Elp4ikPXQ22bTUR4zW7ie3+Hvbc0pHpv4Z5q3ijMjE8Nq72TJoDJIRBv3F+KUvB5f0LGUSK0DYp+vdycpGiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fH5e4VcwofSxGdIA7OArw0v3HV1pR2WVMBi8vBbf+k=;
 b=HVgd95fai5j2SZr1A9W6B6ktAr8hx6SVq+OPF4GwPTo42VYaOFUrxQkJJ8w7x6SPX7ZSt+Jxz40OpRJxiz+6yz1ocgH1srk+vSW8G5DSOjZSHP1LhbV2SAQtUg8p/IsJpl03yoY7nhZerJPRb9XGImR1uo1QZL0XTuX5gHfuTFbMU4u9VnVi/sVFGWdLu+OO9uAM3M5D71/uzBBW0isggQiEU2DFcOa16D2/lJILMufXjNRT1s3Y+NUTykuYnkM5U12dhe4FQJj1x2HaRp2qJB9+kq5fda0pWuLziWefN8G5xyWKQu5XqwipxTBG2CyVZ2t8oUTNGCm91zqKaCmPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fH5e4VcwofSxGdIA7OArw0v3HV1pR2WVMBi8vBbf+k=;
 b=HDjl4By6FROOcA/DfUY6phl/qtPNL5LItjzN1/+FeoSbyvVhEp/HvXXs4di5GdgFV+f7PQNk48yU51iJWlvDs0oGKtmjd/vrS4Ka+L3CWleZeGbQGrtR7Di7JefSZ8iOpxJmilNytWv4DRZwli0BP5vIXxzZjZiR6zQhoxiRXQE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BYAPR10MB3701.namprd10.prod.outlook.com (2603:10b6:a03:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 10:21:23 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:21:23 +0000
Message-ID: <38228ce6-ace8-491d-95b4-dcb4a05d9c80@oracle.com>
Date: Tue, 12 Jul 2022 11:21:17 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
In-Reply-To: <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 788d6698-964b-41b8-f016-08da63f04592
X-MS-TrafficTypeDiagnostic: BYAPR10MB3701:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhyrTm9PrWilN8JRvxeq8qjVReuc4D7o4ky4KQ4dNK5nz2PHQGJfJkMTMKSRL7CJmmkp6GpAp7u95PJEwJ5U94CLDhEiTLDS8obkYK/X8Tn8MEmUtMtLKv7ZFr6eQD6BVk35bydRhQ75XjIhelAKMKXOPjtYq/Q7xIVKgXL5e64IKXst5uPuHEfD74nqqN/YP7+dtBp/Pmw/yBUMcIDGmhYgWvI0u51QcmOFNTVq9fnDYxwgVGH7X5oiXwuSpM7DFwdoqqg7XPJx4BB51qnLYoTmDiSMCOh3WRAtgEEi454Ut64lWsLbMxoPCmCD5LEXvvaHpDCBINBhtu8Y2LuV0twqWWYXBVWQnmUtGZy9zZnZAIXTsTEQVk5hJq+WUywKWGED+qrnNcvJMUxg9FwEIWAaiLhPkouT5TnfhYWLA6ux6LET1gUdIwbfITwwqBvDuHAdw/Kp35I6BSZUi4U4uNIQyG3BnE9/LjZEb/RDK3X59lCvIfaR+lE1jiGGllw55S0ScbL2voJt90JHoKbKk2SpFx8HMfwImg2LENIFX/dO8Qii5Rnz0hO7PYONh+G7BVFgNhd0aK3zh3uys951+I+m7wLroeDXxEUyQtqUKnCIiAgeBZTJOyj3Yit/eKu8DT8WhWnd4p/WaM5gtiazgPXuhV+/m+g1d+blg8wSCTYzgAHaWoeMVQtpJTWf4eKPdbhAq8doVmEybwMd+Pfuv5443K/8cJt6uf5f/EGvZMFV0Dy5BAg/kYDhVQx+jzTr2gqQ1yM05Bzix8R2dDNh3t4FNCbski6GD/p9wx1Vxdiym9Di71ta8Fyjx6eyGvuu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(366004)(346002)(376002)(136003)(6666004)(41300700001)(26005)(186003)(6506007)(478600001)(2616005)(6512007)(31696002)(66476007)(83380400001)(38100700002)(53546011)(4326008)(5660300002)(31686004)(2906002)(7416002)(36756003)(54906003)(6916009)(8676002)(66556008)(66946007)(86362001)(8936002)(316002)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGw0NlpmUTh3TjZKNCtlVklhbDhib1dkNnZPMTBxcDFHZUlqWlJPdUFnTk9K?=
 =?utf-8?B?dHhveVhwbkI4L0NYbVdoYTBGenFiaHdabGh4bUpqME1tMlJ3allzU3JacnVI?=
 =?utf-8?B?R09Od3Vkcnc5TzNMUC9QTHVNWkNwY3N4WHRhTWtjMTE1MHlKTDFJMlBVeGdC?=
 =?utf-8?B?d0EzTllOQkdQV1htMHpyQzIrSzBCR0tPTityWXZpazNnWGVkSmY5Sm9jRWZH?=
 =?utf-8?B?dFE2TEticFNYcnNpVHk3N0xFM2tMbUtQeWZHTWVwVCtRRWFsTTVJeHBzdVpv?=
 =?utf-8?B?RHYvQytuSytRa3NsV0h1alh3SWpNb2tXVEE2aFQyZEFFQ1BaczRTYUxsMEVH?=
 =?utf-8?B?Y1hoV1VsNzJsT3NpWENvWEUyOXgwdTNJWVk0M2gvcnhrVHFYV3cyUEZwWGtw?=
 =?utf-8?B?M1pLdzRGdGpvY0pHOERzLzZkZzlQeEVHbi9tOGxiMEdyMTRXbUNBamtGVXdk?=
 =?utf-8?B?b05LZE9UMStQWEdPS2NWMnVRR3dqb3M5TlNSb0t1cUJLV2dIUjlYY1JpSFN3?=
 =?utf-8?B?UUUwSjA1ekIva0RMTFdYREVOdHFZZFp2SWtUTWdCSmMwbXZwOEdjVno0NDlG?=
 =?utf-8?B?S0JCR3VuT2wxYmY0T1ZmdVBOTUlTbWM3anFTM21QQ09QcXdxdmpBUTJNVnJG?=
 =?utf-8?B?VjdVZnAweElMNnIzN2hvbTNvQmp4K1pMQXVLaHZPSkc5OEs2U2dzOHhzQWNt?=
 =?utf-8?B?czRpajFTTmtoeWN3Umc3Q2Q2dDRpVjNpSEl0aTY1WitOZUJocnpHTkh6Yk5I?=
 =?utf-8?B?UnFYWXJwL3BqdWk5TDJuN1ZLZlN1VEdvU0VLZU9RRzVCZDhKZ0Zrc0pjOUJ0?=
 =?utf-8?B?SGdzTmRRRTRBR3QzYllCbmJjTkdQWWtaVFM3Mkc1b1lUbEpCTW9sMjJ6U2lz?=
 =?utf-8?B?N0VJMEpMQjRQSm5ReG9BQUtHU1o0cGNhT0tIQUcySmR5YUM5RzJybzdpNFhX?=
 =?utf-8?B?OUZjZHhpNWkrSHJCRElCMVVGeDNEWVVYcFUrb01ScUVieTB2RldyYVJWM2pl?=
 =?utf-8?B?dUV1YUNocFo4YWRlUG9nWW5iMTE4ZmpKeWZqeGdqL3VjWDhnOTdiWmVaL0RC?=
 =?utf-8?B?RkJyRHF5eDlsUGI4VnZ6STRuM21sWlZwaTl6R3ZLUEJsdnZTY28vdTNUTEtK?=
 =?utf-8?B?MWVDWVBTU0NjaWQwNVJVK1VEVmZveHZkWGIvM2RMVisyK0IrNFV3d2RpcnFa?=
 =?utf-8?B?MHZtMjNnb1d5dEJrQitJNkd0ZVVtdk1xMk1WUCtPSGxKZE1VKytHNFNWTjVh?=
 =?utf-8?B?aEpWem94dktnY2wyc3VXZnNMQUpsNndiTnRIYUc0U3duRnFVNjdOdkxDM1hY?=
 =?utf-8?B?TmNnWEZDVzIzUklHWERmTFloL1p0N1ZJMXJ5UmoraTdOMmdDZExYV1JjVEtK?=
 =?utf-8?B?dVdKcnJRb3VmV0FnczJkVzBGZFJTYk01b0dhV1c0cUJnQXI4RVNIbEloaU05?=
 =?utf-8?B?Si9lRE54eml6MWp0MDM1S0d3TndqWGw1L1IrTExRVEhsVFN4NXVpMnlpOWVr?=
 =?utf-8?B?OEY5RVBJOUpYei8xenAwWlQvVHFzNlFvb01MM1Z6dnRXdFFIMXIrTzh0S2NV?=
 =?utf-8?B?bmtuN2c1V1pGK05wS2VURTNEeWZFUHJPWS9WZ01SVU1qZHpxNy9tM096ZmFy?=
 =?utf-8?B?dlVaYUtldDZESEFkNDBVVlprbGpLZkZ4bnYrZTlRaXhtRWxyZ2R3UWQrNHlM?=
 =?utf-8?B?M0ZDZzBXU1J2c2laV2d5czBicGVmWVJEelJQRHQ4K2pZWnAvYkhWd0tiZVJE?=
 =?utf-8?B?dUprSkN5QmJPMzVTSmtucVJSYjg3Zjd6ZHcwZXFKQk5QdUpJL2swMU05WlFB?=
 =?utf-8?B?NFhrMFJQMk5nckp6UStrSVVENDVNWU41L0I4SkRtM01YeDVXN2MyZWVrbGt4?=
 =?utf-8?B?Vk12dEJYK1BXRC8xZkRabFJ1ZDBQcGVPVnVWQW90OUVWcXBrY3d5dERZWWZH?=
 =?utf-8?B?Wjd2cndMRDJRbm14c0JCdDlIVnpyU1gzakRyMnhOcm5YUjBTUG1Pd2NmTkQ5?=
 =?utf-8?B?bWVDcWVwYUNwT1ptYTJQYjFSRFQrbUlFVm91OTB3TG9HbGpkZldJajFQSStx?=
 =?utf-8?B?MTNuanpuSEVpUzlzV1pOQ2tWVTgwZHd0WGxLMit3TnpEdVBTT0xWQUM2bXJn?=
 =?utf-8?B?NjlQZkxFcEtXbExQUTFvbys4QWVSSlQrZFo4VmNyaytmRjhTWjhBWmo1dnNR?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788d6698-964b-41b8-f016-08da63f04592
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:21:23.8311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EPB+csSjwMMDoehGwGALpZvWeNC4eNa3w9ja1XQtuYnR50M3hS+fZOF2qZdIv61y4fquVNhBjIxMajXgTZP8bSdoaoBhCP1EszopS9rsFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3701
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-12_05:2022-07-12,
 2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=870 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120039
X-Proofpoint-GUID: fNw-FpOEJectvshludChZ01-KzuD_t40
X-Proofpoint-ORIG-GUID: fNw-FpOEJectvshludChZ01-KzuD_t40
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

On 7/12/22 11:01, Joao Martins wrote:
> On 7/12/22 10:06, Igor Mammedov wrote:
>> On Mon, 11 Jul 2022 21:03:28 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> On 7/11/22 16:31, Joao Martins wrote:
>>>> On 7/11/22 15:52, Joao Martins wrote:  
>>>>> On 7/11/22 13:56, Igor Mammedov wrote:  
>>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>>>      linux_boot = (machine->kernel_filename != NULL);
>>>
>>>      /*
>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>> +     * to above 1T to AMD vCPUs only.
>>> +     */
>>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
>>
>> it has the same issue as pc_max_used_gpa(), i.e.
>>   x86ms->above_4g_mem_size != 0
>> doesn't mean that there isn't any memory above 4Gb nor that there aren't
>> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
>> max_used_gpa
>>
> Argh yes, you are right. I see it now.
> 
>> I'd prefer to keep pc_max_used_gpa(),
>> idea but make it work for above cases and be more generic (i.e. not to be
>> tied to AMD only) since 'pc_max_used_gpa() < physbits'
> 
> Are you also indirectly suggesting here that the check inside
> pc_set_amd_above_4g_mem_start() should be moved into pc_memory_init()
> given that it's orthogonal to this issue. ISTR that you suggested this
> at some point. If so, then there's probably very little reason to keep
> pc_set_amd_above_4g_mem_start() around.
> 

Hold on, I take that back as the check is AMD specific. And I just noticed a
mistake on v6 (other versions didn't had it) specifically on this phys-bits
boundaries. Given how pc_pci_hole64_start() uses x86ms::above_4g_mem_start the
point of the pc_max_used_gpa() < physbits check inside pc_set_amd_above_4g_mem_start() was
to test the boundaries with AMD_HT_START, not with the typical 4GiB. And
reusing pc_pci_hole64_start() introduced that problem.

So either I'll have to temporarily set x86ms::above_4g_mem_start inside
pc_max_used_gpa() based on passed @above_4g_start value.

