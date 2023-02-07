Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320F68DEFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRpP-0007Xg-Hb; Tue, 07 Feb 2023 12:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pPRpD-0007RL-8L
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:32:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pPRpA-0002vD-Nu
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:32:10 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Gmf5Z023986; Tue, 7 Feb 2023 17:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=yACYhC+jjWpquk+787oMiaEkKm9lEqG9BSPPqYsjRD8=;
 b=h8aIAaA4lW4jNBZck5t7xF6tqrSIqpsGVwVE/8lDLhcj0r/TTce6PhOTMoLvr5bc08mQ
 IGbvujdsXRSQ1EBBcAkTTGqEufSRjAo5pOeuFy+puA1hle0aaSoQxjKKm2VF6/5l7HPg
 Hfv3l1quI4DvX9ZRds1KQCnuX+seF5jXxorCbHXElBzo6HcZk80pfTzP6q+P67kASXXl
 DaCeq11MNEgY0K6svKEqN5ssk+1RgfNCUWQU24b+mWTcLzmiaxxnaUsw9I+bssq59Ej7
 +SmXNVIOfnR/OYmFGQeDTu+M+eCEqyut4WzrV+jWZaVVZNu6h23hO/hQReaZ75A13Fp8 SQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdsdp72c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 17:32:06 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317GWT3N024944; Tue, 7 Feb 2023 17:32:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrbag7cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 17:32:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoWZc7BdbOU5lyvIZ9mB05PA7Mq62Zz7uwbuSQyvCjruF5yHNAVPXLAAf+BmKc2RWPsC6jrSBQuRQGSCSyO1F1ZD0up6qM+RLY01oB+gReUcfBw3Bh6HKwcktNWw5Dy7yXe6Rp0r7Lv3DGb5dsezywk+416pN1pvraZbxlgVJuueSfYOsCaS+VGe1vHcrvBxtYQ7KPoz/1/SeydxDeIYcFeCZCsWMIzaoNcmNVPWJuMAI/jfvQE+orIJe+ytKylt1lGBahGY2179fbQ+lPM2V3ME7AYx9v/LCjpBsZXPU3vQbnAaHPFrCuidgn7XDAj3sqGZfC3CzWWVfMbRv9h+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yACYhC+jjWpquk+787oMiaEkKm9lEqG9BSPPqYsjRD8=;
 b=bZhxc9XR3geXh/ldcip2u3fJEHcaioHqjWwr2YhEZReiRa4S0zKbWLw2B3svi0g7QjI81mGi6DOPVv0SiiWPRqf5JKsPD2bDTKIGzq4QoTwftPoW26276iBh863skzS7X9GH1TRwajgk+1Tw6FbEGxcAB7BEGY4BfUOdpagb/WzDqmGct4KVlDprzAMbgM3+WPhTzZcDCWjgVSB0V1KLylKPmHwnBjI8XjH6NwzGfW7ffSsiaQ5fSZQdz7ZZReyEM8sSSJVWWg2LDfW4UIBmMpyCx3VePcb1PKBMGyz+migjQ58igp9jqBgVEkUkaV8XfjIJI0z4WuVo4CGnorL08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yACYhC+jjWpquk+787oMiaEkKm9lEqG9BSPPqYsjRD8=;
 b=sgIq61dHCoWuVGOesEyRGHF4BMFRlC2IIJJWJuoGXagAm99zfiweYsPe0HA3moqbytlNqvK+7YmJ+X+vEJBZGopckiHW6LQ/tjnwKpCJOgSAase5T/3jYClM5FINEGH48uxtKKp0ErwbLCgUOxRMQCE2/KNwNjj1Slw2ag31kDo=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by DM4PR10MB5920.namprd10.prod.outlook.com (2603:10b6:8:af::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.14; Tue, 7 Feb 2023 17:32:02 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe%4]) with mapi id 15.20.6086.009; Tue, 7 Feb 2023
 17:32:02 +0000
Message-ID: <8f490130-4d01-a38f-e263-127977e0051a@oracle.com>
Date: Tue, 7 Feb 2023 09:32:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com,
 joe.jin@oracle.com
References: <20230206234220.8414-1-dongli.zhang@oracle.com>
 <71f8e94b-f66c-099f-cc3d-2cd431ced9ba@linaro.org>
Content-Language: en-US
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <71f8e94b-f66c-099f-cc3d-2cd431ced9ba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB2663:EE_|DM4PR10MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cbd37c-5c5d-4c8a-1195-08db09313937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K46afeAjuqkqjqit4boRJzAfX1m4w0VFvWRsDntkKjn5m3dkA4crPeV2jcHsdaixEKmJyxbtWV184J62gL8NZUJS8SHjw4ltE4TbBBILDTZ04X2BkWQLf9AR5X7aFlAJ9VCLvtDMISWsXEkrb0HyeuAj9xmKMBB62ECOxyl5VD70Req2GjFKa/OG6YXHtoKCh7A4deYKBAC1pLWelbVrHn8oTb4E9qJO/xOR9cSVes4MMjQU6u9A0GlCPq+cF28eDySu9NWu5brmeGDSzgxYuNfSdKVSkChOk7ZWwWgbDRSaZZm83PdtKa4WIBhLj9mvRYUNMhWRMaMPtfCU6WkiUM6+/G7Rn/WcSNhJNBk8jtfkt2DZcR/+lV70UuDNyPOJJdb1bi6DqFj6+CMiHbQmIt5bPqbatWOeBYqYApiq+wzc47Cm8PXRhK16GjT6r36cqA5Gh4l6e6mMwtTYMkOWEtR678FW90mEGoGvZHCCkn8whMAGZu7ed2EbcHp3wjt3LKZ197axcOOPeReY+MCGpibOmmjaw1BQYe6DZKOWxNfrePEstn/C0e2ZiLMHh/ZCPaxEPJarXSpSejXOrl97kjUdiQdfQ69ob9r0wZt0/y5x5fg1mRt4k6VDFGpdbzU1CwBleWCVjklFObh/3wOSggFTbJr1cUwgGAQ7R9McgGZtBomAG1HZIAKV+enhrRPgj6paIffmFUHXoPBmL2hq5hrHY9w5IHAYVLR7sR8Pjl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(66556008)(44832011)(86362001)(8936002)(31696002)(66946007)(36756003)(5660300002)(2616005)(41300700001)(316002)(8676002)(4326008)(66476007)(38100700002)(6506007)(31686004)(83380400001)(107886003)(2906002)(6512007)(478600001)(53546011)(186003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDU4NWZ0MWh6V1QxeitFSklOY09LdEgzUTFzUEh0bnVpditVOTZQTHJBbUtJ?=
 =?utf-8?B?Q01QdjFmWFROQmZzWnZrZU5URnhzWS84NFhiNDRCbDZsaEZQamFSdHJNa2cx?=
 =?utf-8?B?ZXpkSHMzT2F3RTNpVHFEbEk3KysvbUkzVE9CaTJiUnZqQ3RBSitiL3h4SEtr?=
 =?utf-8?B?MWdOU01DQ0tDeDRMd0duVE1kWVM2bzdnNXVOcWlxMHBIU1JyZ2FNUWlEeEpR?=
 =?utf-8?B?RVkyNDU3b0xmT3Z2UXRlUTZ1cUtNa25IQ0ZzVXZXRmtsb3ZXWU8yaEs1ZGhH?=
 =?utf-8?B?OXlRS0JlaUJNY2I4R0RucEsyd0tvVXJLVW9iMXkwc3U5OUZEZnJjMnFxbWJH?=
 =?utf-8?B?VFA2WFBic2tEWEFOS2srcXpDM2FIVnRlV1MrRDc3NlUyNFF2ZGNLMmZLbkNZ?=
 =?utf-8?B?c0lqREo3aS9VWDNJU2ZDc1N5UWNDb3hqNE1FTEtWckdFNUdrbjdFYUhOSFRX?=
 =?utf-8?B?TnpqRTVHanhlc0RPdFlvNGQvTzhva28rUFVYTmtndjhrMjVBcUkzMzRhVEVl?=
 =?utf-8?B?STYvOWZtejBZRUx1cDd4RFFCSSszUnZ4L1VrNGFUdzFvWVhpVEx2R2JyWmdt?=
 =?utf-8?B?NWswclh0aFpnOTBBU3hQbGp3Y1NsUVNnY0RTWFdWWEV5K0krK2hGQ05oeU8x?=
 =?utf-8?B?Q2E2WXFud3J3MTh3M2xUZldrWngvYmRULzRDVG9vR0I0aCs5Y2wvUnBJbUxM?=
 =?utf-8?B?QzhFbmdpTzYzZDl5VzdxV1dYVDBXRGpqODd6YWxrSytOUm51UUUydWJ0cFVH?=
 =?utf-8?B?dnZ6RVV5OG5INEZySVhOQWFqaWFETXF6dklVN29sQWhZSVZ3ZStyRksrd1VX?=
 =?utf-8?B?L0w3QW1zSDhRaGRmYmhNbXVQNVRNZmVCWkplWURXVnJDUEk4TFFHb0dEeDVl?=
 =?utf-8?B?V2pIbUNabVhKZnFXZ3BEbVRuTjBDelV4RHBBUlJLZXlKdnJFRTlEdmpSZjds?=
 =?utf-8?B?QmdwNUpUNEZDS3dENm1FNUpMekZvRitXN2laM0ZhUTJRR0RBbkhXUXZnRU5J?=
 =?utf-8?B?VTBuZWxJSng0OWtZNW1GblgyOWNUZWQrUVNCUis0Q2NhMlg3cXRMeTlYOENQ?=
 =?utf-8?B?SXBuZVFaS2ZxSVNHWitGYWRvblBPY0pPUDVncTN6eFVUWk5tVFZxaStqWkxV?=
 =?utf-8?B?SksxbEF5YjdOek83bmNsUUJ5dEx3RWhWMzZSajdJNEYzYytuVFdab05IM2Zi?=
 =?utf-8?B?VDJraTdLT0RuRi9NdGtZR2drREJYY0orMVNoc3N1Sjd1NmlUblBydmw0OXhm?=
 =?utf-8?B?RVgrbndJblpjcTNzY2ZkOEJkQjJhTC9HRTNaQjl0MlZ2WHJ4dU8rc1VMZWo0?=
 =?utf-8?B?SXROQmp4bWIwYUNwL1pLUGhqTG5yelJYWTlkSm5GTjRKSzFTU24yb2hQOUpL?=
 =?utf-8?B?bktuSElpRzFia2VjRHlORzQ2UW1kU1h5a1l1RWNMT0dvZ0pxWjdFbW1WL0Y4?=
 =?utf-8?B?TFFYQVZoNW44ZVRtSTk2U3grVThBME56TDFBOU16VldvcGg1VGJrY0pTWFpC?=
 =?utf-8?B?ei85d2xpV2pyb3cxNkpoMHptK0NMVUMwa2QzNllSZ3A5dWgwRkxFcHFNQjJJ?=
 =?utf-8?B?UzZpZ3ZEMmJUWisxc01ueFRIMU9kMThkM0pnVEVmRWJRc3EydzYrMWZYUWVr?=
 =?utf-8?B?M2gxZ2luYjVRSFFCeWlQUzJFMWFGV1pzaTBPTUgxQVFsU1VvK3dtakhpSkU3?=
 =?utf-8?B?TkplMm1Nei9SRGRXelZ5S0ViZkNlaHc5VnpaSmFDTlpJdUlpNTRlUDR2WGQ5?=
 =?utf-8?B?WTdIdWUvcllNL3c0bXRxTnArdVNRTzVUSmdpODdLV2Jock1sNU51dTNDUlZQ?=
 =?utf-8?B?Nm9QVGozSklJOHV5SURtcGhzS21uNUN0Um45UHdmS3BVQWlxaE1lZjFDTDhy?=
 =?utf-8?B?VHRZWUFBOXlHZC8rbm54VFZnUW9Bdkhkb3Vzd3JuQ1NvVExsNDI2Ny9UVGdk?=
 =?utf-8?B?dWx5dkczN3liNTA0ai9IL1NoZmd0OE05dFcrUXlkd2tvbW9OZzA2djQyQVJB?=
 =?utf-8?B?RGpnVlpUOWdERFZaS3poSTM3ZjArZm85T09IUjlSZzFOZXhZd3BtZy9Fc3hC?=
 =?utf-8?B?UytIUU9hNWxFOUxSQ0tPWkxxU2lRaWdYd2xvWG9iTDQvVzM1QU9ES0R0WVBQ?=
 =?utf-8?B?TzVZWVJ0SmRxWDh1bkhWa2dESDVnMUt1OHR6ZFdIU0N5VEJxT0dqOW9INjNs?=
 =?utf-8?Q?yIuZXm5b6ArMKwl9461cyMM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ryq+SjZcwPmlXv2wj8RJbcWSaGmpkUbFtY+zb7Pm6I1XblsaoO0Px68BwNy79lzX032g4OyDpwAGSbgLaVgV7a6+j+vFbKqiDeG4ytivQorGt90XcikBBkHynTqRjzIUyU1YFc7Vy4ztl3dSouS/zyvpzyWZyjTcIfSN2Tm52NEMyjAVIKD2PlpTMS0TZ1Mel9LXukMDJMqDQYSKyulTQ1+UUnjEGajPGYAQTpt1XI7deshaQLCR6CI6h5eXFebWDADzmOjDDUpSJS2XRTx9/NChag4W6a6hza06rNR2Jyex5kD32gxnRlbNPCPz4JRjG9gdc5qakpDOEorqZjX+//NxOZmZZMmUgL98G1HbYyWifV8sbClKto1gBYnNOkcDJUynUFaJHmXN7IbiFTVsZIB8tX2jpfFQmIptOAS+8Vqu0DfYAHJrJsCm3aACHkD5O1KLghDy86Dq2txI5EmcB3Y9T+VdM+4x05UHFd2Mzidh+SNf34BtK/TNEXiGPmzE6R5b2DgME7+Z5z5kFMPLBLwSAPaKc/vFzJVJXziK/uusiurNYDZTIwdtrWqLkLbLxVGFYAQ29QB8bHzCUJBAkLM1zNsfR3tpqVIoK7g4Vprd1SUd4L/lSy38i1IuyuIRFPdHrru17EcHoIYVvM/oLpCSjVbRD2IwQxTyxlazFvFY/YnrZwJoyy5La3aqin0nHpyBPhYwfd79nAg/KpvamUpAEczF0FwP7/ETL4+gMVZqdsgcttgfHq188wPO6kVWntjrsPj2nG1TA6F/+yvrJ6RASOGgzUzyuA+QrEji1WDGUY4oEtim9zfEYSsRThvW
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cbd37c-5c5d-4c8a-1195-08db09313937
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 17:32:02.2733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDPJAyrtnJvmEi8reqV/c7vWdKqEiKMY5GQzYQ40St/aDknlwmtskezfjZ1RZbB2kvL7DFBaBazWVTAkOZbsfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_09,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070156
X-Proofpoint-ORIG-GUID: 6_hHi-MNrWVroyV2mMEO_J17LCwFGdp7
X-Proofpoint-GUID: 6_hHi-MNrWVroyV2mMEO_J17LCwFGdp7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe,

On 2/6/23 23:16, Philippe Mathieu-Daudé wrote:
> On 7/2/23 00:42, Dongli Zhang wrote:
>> The cpu_dump_state() does not print the cpu index. When the
>> cpu_dump_state() is invoked due to the KVM failure, we are not able to tell
>> from which CPU the state is. The below is an example.
>>
>> KVM internal error. Suberror: 764064
>> RAX=0000000000000002 RBX=ffff8a9e57c38400 RCX=00000000ffffffff
>> RDX=ffff8a9cc00ba8a0
>> RSI=0000000000000003 RDI=ffff8a9e57c38400 RBP=ffffb6120c5b3c50
>> RSP=ffffb6120c5b3c40
>> R8 =0000000000000000 R9 =ffff8a9cc00ba8a0 R10=ffffffff8e467350
>> R11=0000000000000007
>> R12=000000000000000a R13=ffffffff8f987e25 R14=ffffffff8f988a01
>> R15=0000000000000000
>> RIP=ffffffff8e51bb04 RFL=00010046 [---Z-P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
>> ES =0000 0000000000000000 ffffffff 00c00000
>> CS =0010 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
>> SS =0000 0000000000000000 ffffffff 00c00000
>> DS =0000 0000000000000000 ffffffff 00c00000
>> FS =0000 0000000000000000 ffffffff 00c00000
>> GS =0000 ffff8ac27fcc0000 ffffffff 00c00000
>> LDT=0000 0000000000000000 ffffffff 00c00000
>> TR =0040 fffffe0000096000 0000206f 00008b00 DPL=0 TSS64-busy
>> GDT=     fffffe0000094000 0000007f
>> IDT=     fffffe0000000000 00000fff
>> CR0=80050033 CR2=0000000000000000 CR3=00000010ca40a001 CR4=003606e0
>> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
>> DR3=0000000000000000
>> DR6=00000000fffe0ff0 DR7=0000000000000400
>> EFER=0000000000000d01
>> Code=0f 1f ... ...
>>
>> Print the cpu->cpu_index in cpu_dump_state() and remove it from the caller.
>>
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>>   hw/core/cpu-common.c      | 1 +
>>   monitor/hmp-cmds-target.c | 2 --
>>   softmmu/cpus.c            | 1 -
>>   3 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>> index 5ccc3837b6..d2503f2d09 100644
>> --- a/hw/core/cpu-common.c
>> +++ b/hw/core/cpu-common.c
>> @@ -105,6 +105,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>>         if (cc->dump_state) {
>>           cpu_synchronize_state(cpu);
> 
> Should we check for:
> 
>           if (cpu->cpu_index != -1) {
> 
>> +        qemu_fprintf(f, "\nCPU#%d\n", cpu->cpu_index);
> 
>           }

I think you meant if (cpu->cpu_index != UNASSIGNED_CPU_INDEX).

I do not see this case may happen within my knowledge. The cpu_index is always
expected to be assigned if cpu_exec_realizefn()-->cpu_list_add() is called.

 83 void cpu_list_add(CPUState *cpu)
 84 {
 85     QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
 86     if (cpu->cpu_index == UNASSIGNED_CPU_INDEX) {
 87         cpu->cpu_index = cpu_get_free_index();
 88         assert(cpu->cpu_index != UNASSIGNED_CPU_INDEX);
 89     } else {
 90         assert(!cpu_index_auto_assigned);
 91     }
 92     QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
 93     cpu_list_generation_id++;
 94 }


In addition, the cc->dump_state() is always invoked by cpu_dump_state(). As a
result, e.g., arm_cpu_dump_state() or x86_cpu_dump_state() may always print the
cpu state unconditionally (same for mips, s390 or riscv). I do not see a reason
to hide the cpu_index.

Would you please let me know if the above is wrong? I do not think it is
required to filter the cpu_index with UNASSIGNED_CPU_INDEX.

Thank you very much!

Dongli Zhang

> 
> ?
> 
>>           cc->dump_state(cpu, f, flags);
>>       }
>>   }
>> diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
>> index 0d3e84d960..f7dd354d2a 100644
>> --- a/monitor/hmp-cmds-target.c
>> +++ b/monitor/hmp-cmds-target.c
>> @@ -99,7 +99,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
>>         if (all_cpus) {
>>           CPU_FOREACH(cs) {
>> -            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>>               cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>>           }
> 

