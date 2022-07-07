Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3356A6C4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:16:54 +0200 (CEST)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TFN-00016s-EN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TDQ-0000PM-GU
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:14:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TDN-0005SO-5J
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:14:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267EvmIE003283;
 Thu, 7 Jul 2022 15:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8KC/OWP/XPpkZ+2Zu/AcAdbYZ4SvLkDbmMT2/6Sok/I=;
 b=wANzHfWqJwVAP0ph2ILpf1CicS3YLnw9xA+OEFfuLSk8e97i4D7VrxVom0bqvJWLF29F
 EJAgHKzrTTvp9wh2uw4irsy5LBfPSmruJs7Vx1S2SB3OscrhUleoF8zAzNp8cHbIC/xv
 Y04j7iaoybXcrbRKyHPBw8ZRUjPIB3I4Kj/8O8vEBHbVGNE0qcq4JMUAqnL8codZScjQ
 imX5ztU1qpl3D9XmZt5o8yuO+ZNKFHG05QsIlY/doKUGTn5Zr1KxBTB4svvSggH4zgLc
 Iausd0KaPZ3S3vT0geB3JdtBhqt18R12akvOKJsDcjTYDN2gCcRM50bH4jm/gX1HC6xQ lg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyd8mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:14:37 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267F5Kma029462; Thu, 7 Jul 2022 15:14:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud5vccs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2Kbbx+Dmgp+amRtnvDdC8AEK78AeZRN/uLcyfhNAygA1em2vp9Dff+y3xi7eLR0flNPrhDwcu6pokDKmf8CSAFg9Odx1I5pJ0HuWMn5gyCc4I7zt/yabzskMzJ2CABpK9d9kLxsKvdN8GZ11qPtue4tz6g7jynaqD01o7eiEnss/z8DX9Qp2U5uyUfUOA+K7ttd/p4v2ZuAXu+ZTpTaMg0ji+S0gU8rEInrPHyqdZ7WR/WuW+FN91IrVvJrj8JJNY1MuUaLhOkBvb/LCZDX4vAQjvoON81vwF4LY8dlLkEiyDNBj/Kec+ZH6O0/C5SscdespHNlA6pxUKpk77RIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KC/OWP/XPpkZ+2Zu/AcAdbYZ4SvLkDbmMT2/6Sok/I=;
 b=klj2HUUgIa18rJcbQupZDT02O9DKIyonvJyUF2cLQoD/pjIVic5Ked0FELG3QmlWBpWa8IV0DD4YeiVu7jZerlsej2Py3YjxbKxuKcrqI8rbWYVdvfzW7Sh49yhwi6grUwH7FIivpdmp4+wawQFxgATyxgLSC9OjyVwd1zM4zxdgeTmwpBq8jro4fNrKB07miBCeYoAwif4RKxPCX85O/08UFRhXxffPAFuSXsewKwvJP8ySI7+pv1VTQtO9+WZD7xfzPVRDki76tPeryI+QncM/Qr46aRwqWvRI2KyhO/pzIK9iicK/CMJ21xZ1oeJ7IJEQaXdDJf/kNyQ1wESH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KC/OWP/XPpkZ+2Zu/AcAdbYZ4SvLkDbmMT2/6Sok/I=;
 b=NEaM/xKfzv9UdbW/LhQ7utDNdEa87stxMGMD5g4zwW5vuOQrvUYAvzNw1uzIFiq83MGBKSEbod0Si4wcU3w05coRdE5CCroDUGPCUgnM2bmH4pAkuKPY134VF38AMd9JuIfl/zUw27qj+D2CbCE46XDVpDs1Lc5B9Ig581vEFnA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SN6PR10MB2813.namprd10.prod.outlook.com (2603:10b6:805:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 15:14:24 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:14:24 +0000
Message-ID: <91032244-3e55-1ad7-f425-5af9fc412485@oracle.com>
Date: Thu, 7 Jul 2022 16:14:12 +0100
Subject: Re: [PATCH v6 04/10] i386/pc: factor out above-4g end to an helper
Content-Language: en-US
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
 <20220701161014.3850-5-joao.m.martins@oracle.com>
 <20220707144202.6a7c3f9c@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220707144202.6a7c3f9c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4931db5-18b0-45fe-022a-08da602b6041
X-MS-TrafficTypeDiagnostic: SN6PR10MB2813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpKHrT0uMwR+FVonSPM2DqEWDUEEwE391LErkX5T3YLAv+MSFRj6XrDj6NqlqPTd0aL9lMOtFN2DNTHjrcvZpe4+evLg8yNEX72YJnBQh9qJg+BKqMgW1UehxjlVHocOLMWQ18CzarQ4Bwi1BoKTmFsZcIGlerk2Dy7BZFwfUpV3q51Dqu3JB/sAs+e7SpHg2wqlN0cKhgWtkh/FgL86YW2b652MSZjGsjKFfBqrsbz0yUiDtT9XoiQor8ijv3jImhhzNfHDLbyEexVM583r5Pd+3qUo+2R/wxiNuqTpATxhKsgxBqjJ3wZBka7UyhRACbd0EOhIUKSnbuQGyrT5kNQzt8ZMmavI1Hw7/YMZOE33Qoe69ceAcAZVh+K/uapfiYA6QBz0AC+/AuF6d3Tqo9GODFvegfQl9O/aT13ChqVZsjfQiHjkR3Kh7E3+J36DHUf7P9arzeQzid1zO5y9DgsI5QBBbja73H7CjgnDnlIEqMrYRRF/1BMG4R0nElZ5ZcadRsoXDd19RBW6aRxiyHdRO0ZcP5r0SJkIBQ45mc2E/FD5/EjMrmHuCIV1zKzAHm0qbbKzH+kv6VC80hidA2oY6q9EoySd1v1psiq1rZrlVWYD1YzE37WenTDFXnpnLN5lb33toxInyIXFWt+DzRC+1H3JUKiHMajJBj6im/cNFRi5osB77Z+LQr+qT02G1nn73eWU8TKGBaCjsYGiXbC9RN0XaDa1P8DBiDMxT5qZg9I2Zj32jzGV3CYz9tmkkJCV9S8iSvR/zTgbzYRuFzUPvS2MYbbi5/l68L6EzNrSk9fbUziLbTKsB0FAfitf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(39860400002)(346002)(136003)(396003)(7416002)(316002)(38100700002)(6512007)(8936002)(5660300002)(66476007)(86362001)(53546011)(26005)(2616005)(6486002)(6506007)(41300700001)(6666004)(4744005)(2906002)(31696002)(478600001)(31686004)(36756003)(186003)(6916009)(8676002)(54906003)(66556008)(66946007)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1k1SFZueVlLNTQ5eGRyeGp4VlpKZ1l6elowSWdCenRXdnBwcGoyMXl1WTkz?=
 =?utf-8?B?dlo5UFlhVzhEcHorYVZ0RFI1Qi9uOG1sWmhQU2kvbmZFQmFCWncyOTZkZnhB?=
 =?utf-8?B?eTRvL1JVYkx6Z0Z0U1FLZ0pwRnpBekRrMDJrVkFrL0pjaWI0SmRDK2pDb1ZQ?=
 =?utf-8?B?Nk5zd0F0WVZKUmtrek5VYUliMDJkeURWU0p1SEljSVlDQzMvYlhJc0pJUXda?=
 =?utf-8?B?M2QrU2NkeHFyd3ltWjFhNXhhZ3ltNnFsdEFHSVVLb2ZtSGZtWWE4dkxmRWJC?=
 =?utf-8?B?WTJ2R2xjK1NXUWtNTEFpQjB0MVpJNkhpeGlzYUFIYTNISmtIWUs5OGE1M3lr?=
 =?utf-8?B?MWkyaUYzU0dvaUpic1VkVVRJYjhjeW0rclhxcm92MkRPL3V1WjU3bFFlM1VL?=
 =?utf-8?B?MkpGTml2V3VXNmhoTDJ4dDZmV2ZjenRDS1FZcGJ2ZjhtN2JCWXBrU1NkcHZF?=
 =?utf-8?B?bmEvUzBhSE1iczBrNVliZ2o4UzBlMDFmUGVjTFgycG1xSi93Ym1QZndVVldw?=
 =?utf-8?B?ZTJuUjZKYkhtWUs4R2VFZnp4TFNkVWtnZ3JiNXRFOFcvWjFCbGpjTnlOT0J5?=
 =?utf-8?B?WmJNT2xnMHE1NFBvSTZ3dUpzY0N2MG82OXQ4K2VTUEF0VWpXVXRWSDNyMDBt?=
 =?utf-8?B?VHZaVXdad1BJejdmRytsRmVLSzVDSmN5a09tbDdQbUFmM3FQc3FKY252Zzlm?=
 =?utf-8?B?azBjTyszc055TmxtVXlTeHlSSDFpc1pzeUhzS2NhM0g2MDhVdGl2OWlmV3NT?=
 =?utf-8?B?blo0bFBRdWVwblNRL0lHdWNYV3hYcTBpNDV0YUQ0SEtyTUIxc3VWTkRjVElh?=
 =?utf-8?B?enJZZzdRV3JFR0JmcGZTTnpzdW1tTVZPUFI4NEcwblNFODE4L3BKbmIzSVAv?=
 =?utf-8?B?akYzS0RCbjVjamlsbVNFUyt6bG1xOStJQm5OcnAzcm0rY1VLZ255MEtaSzVm?=
 =?utf-8?B?YnZOOC9XV1MvdWlLMkUydmE3VDhFclNhUVVoVjZRMTF4cm9OQWdLL2tWQ25t?=
 =?utf-8?B?VjZkY241aGhNZVpXSElKTkFxV29FanBiQ2RXTVRDeWlkeEhDUlZaTkdaK1NV?=
 =?utf-8?B?d1ByYkZXV24zNVIwQ2lUQlRwWlZuOFBFZlcwN2VHUkRhOW5RNXRSYTN5SDRo?=
 =?utf-8?B?SmQ2ZUIxOFV1VGRUVUpBcy9QeU9SS0V5cUxqSENaTFpuUEtvZHBxeitvSzN0?=
 =?utf-8?B?T25iaWRoT1ZjNkRDSU0yakRwWXE3ektndXVENFF3NnBndDZTdXFsSFdNU2JC?=
 =?utf-8?B?NmtKOGRoY2JydEpTd2VEWFVqM0FKNEJNSlFHRVZkaXJGbzF1b1pkdjJTOHVM?=
 =?utf-8?B?QjFJbklwWHZ1dDZTdjBQZExYWmp0L1QrR1h6WlBveHJUVzJQV2xJRFluUTRv?=
 =?utf-8?B?SFJOZmVnQ1ZvQUhpK0xUU2xRaksrWUZyY2c1cUNmOFZ5cFFGNW4reWtYTktY?=
 =?utf-8?B?bnpzeHhSL3BPcWRNR20zMk5BTzhBZjRHSzlIRFc4enlBcFJtd2ticFFtM3Bh?=
 =?utf-8?B?YzhFZkNsQVNYdkJrQjZRYmZVY3RVSDExU3NCZnlmVm14RFpxYmhWNHZpbk5t?=
 =?utf-8?B?K2g2QzRvUG1FVm14Q1lNYTFoK0xVQWsvY29GY0tJWnVkUDB4K0NkQ1hValpC?=
 =?utf-8?B?L01ZdFA5TTFVSE82Vkd5aGpKUXYwVVRuN0pJZHhzZW0rYVhHNHNQVFFOV0ds?=
 =?utf-8?B?cE81SEFjN2EyVzA0MlNGRUpZZHg2Y1RLTXpodHN1a09NbjUySXRVYk44WGI4?=
 =?utf-8?B?K0pIZWNWR21GMEwvalpHcG5LV2hEOXlzZ1hFZ21USk40Snl1ZHZyOWZZYm4w?=
 =?utf-8?B?M1VoYlhRei8vdDFaZDhCN0JHTWphWTUwc3phUTFOQWxKT3J1d1JWK0ZqYlhY?=
 =?utf-8?B?ODEzZytHNFlGbEVIN2Z5QllsZTBrT3ZRVEc0VVliaWlJV3J1RTEzVHFWMldB?=
 =?utf-8?B?eGVzUFlJSS91QXdBV3FGMEczUFJWZytZWUlqTXJMYWZzSzI2V1BDM3ZjeHMx?=
 =?utf-8?B?TlN6alRvSEhkclByemR5QnhjaW1SWWxNUFdXbnMzR2lYcElwSHY1eWZjNFEv?=
 =?utf-8?B?MnVsczBWd0R3ci91SXRibjBsSkJLUTlvWDJzVERiOFRpdXVHbDhyaDFYMFNz?=
 =?utf-8?B?aUUyMkdUbzZ0SWM0OHQ3V1o3dGdsUndiNDE5K3dtTXRWNXA5ZWVWUHl4OGFw?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4931db5-18b0-45fe-022a-08da602b6041
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:14:24.3423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fsqF0EVV7pjb2XbLGC92grximVud/yJJYBsY5ET3fHSsclV3Jll+cakETqoclmUCPsOuGUJR73LiQPpyRolD7Eu+BXJo5H8np5ZV9ek0+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2813
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_12:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=936 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070060
X-Proofpoint-GUID: vMDQhIuRxJ3rpXYCHLSkRW7CvqI7Iu6j
X-Proofpoint-ORIG-GUID: vMDQhIuRxJ3rpXYCHLSkRW7CvqI7Iu6j
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



On 7/7/22 13:42, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:08 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> There's a couple of places that seem to duplicate this calculation
>> of RAM size above the 4G boundary. Move all those to a helper function.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
Thanks!

