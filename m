Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C09650C4B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:00:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Fk4-0002bW-9l; Mon, 19 Dec 2022 07:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p7Fk1-0002Z7-0L
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:59:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p7Fjx-0006Gl-Dr
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:59:36 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ8RDVG024043; Mon, 19 Dec 2022 12:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=qeiuxJ3HQLnXuqChybRVR0mHTotWORuDUraHEvK84q4=;
 b=MZvqLKn9frgkGQsYf3BMNQF6h86YuOca8jdhGxbG/6u8AfI478vV5/K8KPieyuaMJb5c
 EhdEnfDRN/M8xebZBgbhoZqYR5s+8pPO5hyizLFEhWYF3UG7gCKjX45FszOHE+qPrq9k
 L4KfXsmXIBfkGcCSBsmf98O7IVwBnxAdU/Cfsl5XyIJsDFTL2QVld82g5szN5o1xFknv
 M3EIFJQ4V4x4sVk1qJY7gT2Z5FalKNuydH/kkXaX1xoxsGYdqMZ8Kk0OK1pkzpLRI2lL
 FD55rZx14LBkpgKuva9ODYmwk5oz1lyAO9G02h/nTniw2MpTQKmwvGmceHt+xxqZTFAu JA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mh6tp2saq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 12:59:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BJB4D27022375; Mon, 19 Dec 2022 12:59:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3mh473f8fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 12:59:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOuhaJbk+kj7YNIFGXJLpyW0g0PJewLv+LQJpRF/GYXLXPLirF9bmj+d40mwzTrDnoBcyC8HhFdBBka0LfuRpkGZdhxxuQ/NeygbyeQ0bIvwtsPTCIMI6jFcv9w+RTo2MdSXDsnFpPQE4xXg2zi5gpNFqRwmFVCliIiZ5QF0VMopFCTpBAGF/myCGeWWhjSdrQ8ZFnJnp1XTnvuwJ4wt4eITT++vNNu96FEGO+MdSn180gKSYBgNKrk/MRFUoAyO59ksDdUPDJTdgN15ooyB3v1QOp7DEKEPA8VknlFvRAOqYhdam6h7mjfUOmDE8KWJgpCH3pA3lKnx2/sZ9xlU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeiuxJ3HQLnXuqChybRVR0mHTotWORuDUraHEvK84q4=;
 b=EGyEPk0qVgStu1aTSyuWYKWxw+Hx5q6+X436mS5xuyYkPn0SQOJuPzlhXbWoyqriONNxkIpemT7cRaz4+5BzHHeqq3cAmRq0An8HfxjJ0+3y6StHxBTBcQ7KSDF2S0LTa9I5Wl6JRMg2PLdxurUaEsZKRxx2brQMXbg/f4kJ2D2JMFAFhgEWsJkfGnlEAhAThTSz+AJCz9WIxDhSbNXwiQ9xHjW4eKdlAjboSfVyiVGLU7Ox5g5l8abKiaFBxC2rf1NWasM5yW2X+n+f+tDkmYYfWEup9P0/Toc15cvl7gCMYvMLSD1PLE24eCIFcePgwEfRIHKt+J/TzK8v9n4qxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeiuxJ3HQLnXuqChybRVR0mHTotWORuDUraHEvK84q4=;
 b=ECKY/V81VVfpTpz1/trhJiTi0vBN3LaKAqbjX+hIGVkJ3A7A3hK0lw6ez6+u38j9WHM6QCAZYkkaxRtuJolxBmgRmnBs2/qhPVtxl8gMgXeS7NNSK2isnWMRraUx9R/zVVXpIqS18mQApRcKLa2tVjGCuTDbPkf5rKM4vWHxOds=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BLAPR10MB4851.namprd10.prod.outlook.com (2603:10b6:208:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 12:59:23 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c449:15e4:b116:e06b]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c449:15e4:b116:e06b%8]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 12:59:23 +0000
Content-Type: multipart/alternative;
 boundary="------------RB06xfmRIR0Vq44BgSUt8gXx"
Message-ID: <35f8e9c6-b71e-12b8-ace4-699757ad3539@oracle.com>
Date: Mon, 19 Dec 2022 07:59:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH-for-8.0 v2 3/6] hw/virtio: Guard and restrict scope of
 qmp_virtio_feature_map_t[]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221213111707.34921-1-philmd@linaro.org>
 <20221213111707.34921-4-philmd@linaro.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <20221213111707.34921-4-philmd@linaro.org>
X-ClientProxiedBy: MN2PR01CA0044.prod.exchangelabs.com (2603:10b6:208:23f::13)
 To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:EE_|BLAPR10MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b31832-162b-49cb-ed68-08dae1c0da1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfvteuBr4mNwL+s/w/JhjXII/ySy0bQH5f3oI+IkfmYQfhrvODa4YokLFzn3t4S4iI/3AvLW0uBfzbBQzuRpmCjGwraMtmwrfPpUGB50BL4xwv0NkCLsYh0GTBtI0Gii4R2ITveeR2f41XETwppw6J5ki45Ujiv4j12GMJXIGEBAzTOZ8uDlOr9H7Hs4z4mMNe+I7Tn/liNPlQVatqAg/ec+FTFEwIX1nf0R9yY/1yKdpEypUjqyRRdLfp0bTOmR2HVzh/2LWCBpYZl4ByEBQ76CYB/pO0JSTxmJqT98TwPl+GrNHYsRL4wRadx0dRvHosxW3jRmVrFDHbu7fxux+5pVqsymcYlEJxWorfAVGPIqu6qwx3Tky+DzZtHfZS462zJqUvJYv+A3/ar6TCXt9YRH5+R9vw2JN0w8qQqoHTcS1rV7B6RgwYGpwnp0wkqomAAINOaNvf8lf3tXV0l6SV/0to0zpOJCX2Fs0F0GSock/Q45L3OssdacUKUL2o3GwpjSW9EGUt6TS5aXRAuNCxfjqh387RRkbLgMX7tDFCUit+eFRruwZoPD/NNiS57B81xP3Z/ZFEsWKs/pcE/zRhx+sudMJOt6XhxsIYwEj6aHROXC1N+enSEY1FlcI8MpGMEGPhm2dw4dtki9uqtKpmOcGGPNTp3DZ2jpxbdHszS1T8FFoto0xbtxVorI4ZrpFN5oUJYrcSP2iGGkB6Xo+eh0hLSqTmygeHBzS/N6JG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(30864003)(44832011)(5660300002)(8936002)(2906002)(31686004)(316002)(54906003)(6486002)(478600001)(66556008)(66946007)(41300700001)(66476007)(8676002)(4326008)(31696002)(2616005)(36756003)(86362001)(110136005)(6512007)(83380400001)(6506007)(186003)(26005)(33964004)(53546011)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFweGtLY2lFY3g0NExOdFVkNHJ5U2pmaXZ1ekxoZDV6ZGJKR2gwa01SNXRG?=
 =?utf-8?B?OG14VTN2V0xvVkh6ZXB2QWRJYjNNMElDY0FJOVphLzc2ZjR4ZDJLNWdSM0sr?=
 =?utf-8?B?MFNlTEZraWpQK2J3dE44VGtLYzY2TFhLOWpMblA0Q1M3WFB4MGQrRHlpdzkz?=
 =?utf-8?B?ZWxJbm9TZDRkdmxOb0hhRUtCVHZPU2puSFREQ3dMZGgybGlSczMwMThyYkQr?=
 =?utf-8?B?Q0NaMm5YUjFVVUpvQkxQL252UWVrcldUQktzTGlmM1Jtc21nL0hldkhlY2I0?=
 =?utf-8?B?eDF1dmN6QW1IREx6R0NSeHZ5S2VjQnNFNVUyREp4ME9mU2ZxMUl1UkdrVFRN?=
 =?utf-8?B?VXdWVUZkenVualJZeEd1Ui9xQ242bFhTQWJVaGhrRWJWYU9QTENpaVo1eGdo?=
 =?utf-8?B?VE95aGdWNWtpYjNIMlRCSzZHTWZ4OHZyVEJQd1ViV1B6bTNWemkrTS9MQlJ3?=
 =?utf-8?B?dEFPYXhNQm1ta2xiVk9HMVc0czNYcHRwbkhqVDZLVzE5NEFFOW9jc0ZqV2xC?=
 =?utf-8?B?SzRqQUFDdHhqKzVwdEkyVkVSdExKWjkvbDhmUVhtQkpiUWZkM2Iyejl3N29z?=
 =?utf-8?B?bmVYMVpSTVhvZzRNZENWNHp5SHdpUDhUOGwzVXZDVTVBckM3UVdOemlBamZK?=
 =?utf-8?B?S0pxQWpHN0RFQ3JSQWtyVE00YVExZTBZWHpPcmR2UVJSRjJkamNiL0hoTFdT?=
 =?utf-8?B?ZmFMU05yNHlXQW5hUExlUXpiVVIxU3FhV2ZOS2FESTBwZk9DODlYVWsyeXYz?=
 =?utf-8?B?S3BOZjJlbEZETUI0K3JoS1hnbEFQcEZSdXBIYUdrYzhxT3FnZDJWcHJRZGt5?=
 =?utf-8?B?cmdUNTBIOWYyNnJSL0ZzL1RhZ1ppMzNiSEcwakd0SHYzOTlSK21ucmNzNGhN?=
 =?utf-8?B?VHJyUStudFJYT25KOXBCeEpLVVFFQXhEdG0rUzRlVEp6U3RyNk9xOTFudDJu?=
 =?utf-8?B?M0NzclJ5cFNHRlF1UXlUWDZWbXVyVEFQWlNMVHlCcnI5UnFKNTQreVV3RUIz?=
 =?utf-8?B?VG5Fc0RqSm5IOEVmK0E5clgyR2xmSHluSDIwdGlXbE9YcWNBcHEyTmd6RERt?=
 =?utf-8?B?Q2wvWXRRZ0JudStMbFNteUUrT0N2U05mekQzeVI3ODdVNWQ1ak5HWS93Wk9W?=
 =?utf-8?B?UlYvdVRweUN0MzFqeDJCQW9tbGI2a0xZOGFrREloVlBIZFNxTXBRVmR5WXJG?=
 =?utf-8?B?aEVscFkrRHp4Sm1zRmhVMVFGazF6L0prTEk5TEtpMXd3M2dONDIwcXJ4YSto?=
 =?utf-8?B?N2F2ZzFzampwTHlYNENPLy9LQzdldWNXL1l1aTIrd2ZpZmtmVmZibjVSUUFY?=
 =?utf-8?B?WjQvc1l0T2wvRkg1Zi9mZGM1UWQwRXQrR24xMmI4WkU4T2ovSjJBdlJ5eWYx?=
 =?utf-8?B?Z0dZdXJCSDFiSk5wL2pTQXNBWGo1dm5GNHFkb2oxU0NLUUNlWDhreTJacDI1?=
 =?utf-8?B?NS83ZDhYUjFzK1ZNQmJnVEFpNXFuTDRvRmxhVHVYOXVKeFVCNzRFQUpyQjlT?=
 =?utf-8?B?ZnFyWG1VNitydlV2bEorNVVrNWZjaWZYRUErYkJLdnJEcGQ0WmU5TlNGZE5a?=
 =?utf-8?B?ZEZKN25pYXlOUzJSWDhFZVVteWJRTE84elpGc1RlbDhKNStTd0c3TFljZUlH?=
 =?utf-8?B?UkEwZ3BhOC94UWJxQm01TURXaU51MFMyRjZVaU5LTmdHakdlN25TVTVhYXB2?=
 =?utf-8?B?aEpvQjNjMEIxTFBhNHhheGo1UWRXOFFvZmdTVk11ZVNsNHU4ejZFWUNJTkhV?=
 =?utf-8?B?QnZUc000YkRPYy9jN2VIcE42aGk5U2w4bFBjUDhPbU04dStpekw1bkNFa0wv?=
 =?utf-8?B?SkpPRFJaaHpGamtYRG1pQllheGVLVzF1MGRDelcvd2xzL1NqQ3FqQ3QzcXVk?=
 =?utf-8?B?ZE9GZGxVOFE4T3VHUmVweis3cnRiYllOc1dyQ1ErRUZINm11ZitsOE4rV2Fj?=
 =?utf-8?B?ZG5DcWY4aVVpTEdsMkt0aW5nbGhQcElkUnNSYUFoc2ZPbmpxam8rbTIyMkxv?=
 =?utf-8?B?dUkrOWZoaW90bFdRQkJ5MTlwajFLRnJSZis5VmlIRDBRSCsyelk1aWQremhN?=
 =?utf-8?B?QSswbDNLLzJieElZbHlVd1BpcjFFKzhHeHBGQ1ZPWTNrREVmZjJoTVBrWXpB?=
 =?utf-8?Q?7Zs3tirfz0HxS592XKNBFP1Pw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b31832-162b-49cb-ed68-08dae1c0da1d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 12:59:23.6805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llylZpGnKLlWG22QXVtgfySbetlWAsi0+t0KfQUjs9+9AeftMwgvL7pyHRf+CDqm4EsJr2KRHeMvvB7mqPR/Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4851
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190115
X-Proofpoint-GUID: TrMKcHGYMYridSdoTvBgqR40JMY-74UQ
X-Proofpoint-ORIG-GUID: TrMKcHGYMYridSdoTvBgqR40JMY-74UQ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------RB06xfmRIR0Vq44BgSUt8gXx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/22 06:17, Philippe Mathieu-Daudé wrote:
> Commit f3034ad71f ("qmp: decode feature & status bits in
> virtio-status") did not guard all qmp_virtio_feature_map_t
> arrays with the corresponding #ifdef'ry used in
> qmp_decode_features(). Fix that and reduce the arrays scope
> by declaring them static.
>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/virtio/virtio.c | 56 ++++++++++++++++++++++++++++++++++------------
>   1 file changed, 42 insertions(+), 14 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5817f4cbc9..b35480be8f 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -179,7 +179,8 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
>   };
>   
>   /* virtio-blk features mapping */
> -qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_BLK
> +static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
>               "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
>       FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
> @@ -216,9 +217,11 @@ qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-serial features mapping */
> -qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_SERIAL
> +static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
>               "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
>       FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
> @@ -227,9 +230,11 @@ qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
>               "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-gpu features mapping */
> -qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_GPU
> +static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
>               "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
>       FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
> @@ -248,9 +253,11 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-input features mapping */
> -qmp_virtio_feature_map_t virtio_input_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_INPUT
> +static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> @@ -258,9 +265,11 @@ qmp_virtio_feature_map_t virtio_input_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-net features mapping */
> -qmp_virtio_feature_map_t virtio_net_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_NET
> +static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
>               "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
>               "supported"),
> @@ -336,9 +345,11 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-scsi features mapping */
> -qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_SCSI
> +static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
>               "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
>               "buffers suppoted"),
> @@ -357,9 +368,11 @@ qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio/vhost-user-fs features mapping */
> -qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
> +#ifdef CONFIG_VHOST_USER_FS
> +static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> @@ -367,9 +380,11 @@ qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio/vhost-user-i2c features mapping */
> -qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_I2C_ADAPTER
> +static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
>               "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> @@ -379,9 +394,11 @@ qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio/vhost-vsock features mapping */
> -qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
> +#ifdef CONFIG_VHOST_VSOCK
> +static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
>               "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> @@ -391,9 +408,11 @@ qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-balloon features mapping */
> -qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_BALLOON
> +static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
>               "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
>               "pages"),
> @@ -409,16 +428,20 @@ qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
>               "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-crypto features mapping */
> -qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_CRYPTO
> +static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-iommu features mapping */
> -qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_IOMMU
> +static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
>               "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
>               "available"),
> @@ -439,9 +462,11 @@ qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
>               "available"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-mem features mapping */
> -qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_MEM
> +static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
>   #ifndef CONFIG_ACPI
>       FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
>               "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
> @@ -451,9 +476,11 @@ qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
>               "accessed"),
>       { -1, "" }
>   };
> +#endif
>   
>   /* virtio-rng features mapping */
> -qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
> +#ifdef CONFIG_VIRTIO_RNG
> +static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> @@ -461,6 +488,7 @@ qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
>               "negotiation supported"),
>       { -1, "" }
>   };
> +#endif
>   
>   /*
>    * The alignment to use between consumer and producer parts of vring.

Good catch. For some reason I only defined static for the "general" virtio
features (e.g. transport & vhost-user protocol features and device config
status mappings), this should've been done for all virtio device-specific
feature mappings as well, and this patch does exactly that.

I also missed guarding the entire feature map arrays. Thank you for adding
these in.

Reviewed-by: Jonah Palmer<jonah.palmer@oracle.com>

--------------RB06xfmRIR0Vq44BgSUt8gXx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 12/13/22 06:17, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221213111707.34921-4-philmd@linaro.org">
      <pre class="moz-quote-pre" wrap="">Commit f3034ad71f (&quot;qmp: decode feature &amp; status bits in
virtio-status&quot;) did not guard all qmp_virtio_feature_map_t
arrays with the corresponding #ifdef'ry used in
qmp_decode_features(). Fix that and reduce the arrays scope
by declaring them static.

Suggested-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
---
 hw/virtio/virtio.c | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5817f4cbc9..b35480be8f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -179,7 +179,8 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
 };
 
 /* virtio-blk features mapping */
-qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+#ifdef CONFIG_VIRTIO_BLK
+static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
             &quot;VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max&quot;),
     FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
@@ -216,9 +217,11 @@ qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-serial features mapping */
-qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+#ifdef CONFIG_VIRTIO_SERIAL
+static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
             &quot;VIRTIO_CONSOLE_F_SIZE: Host providing console size&quot;),
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
@@ -227,9 +230,11 @@ qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
             &quot;VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-gpu features mapping */
-qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+#ifdef CONFIG_VIRTIO_GPU
+static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
             &quot;VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported&quot;),
     FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
@@ -248,9 +253,11 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-input features mapping */
-qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+#ifdef CONFIG_VIRTIO_INPUT
+static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -258,9 +265,11 @@ qmp_virtio_feature_map_t virtio_input_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-net features mapping */
-qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+#ifdef CONFIG_VIRTIO_NET
+static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
             &quot;VIRTIO_NET_F_CSUM: Device handling packets with partial checksum &quot;
             &quot;supported&quot;),
@@ -336,9 +345,11 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-scsi features mapping */
-qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+#ifdef CONFIG_VIRTIO_SCSI
+static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             &quot;VIRTIO_SCSI_F_INOUT: Requests including read and writable data &quot;
             &quot;buffers suppoted&quot;),
@@ -357,9 +368,11 @@ qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio/vhost-user-fs features mapping */
-qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+#ifdef CONFIG_VHOST_USER_FS
+static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -367,9 +380,11 @@ qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio/vhost-user-i2c features mapping */
-qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
             &quot;VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported&quot;),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -379,9 +394,11 @@ qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio/vhost-vsock features mapping */
-qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+#ifdef CONFIG_VHOST_VSOCK
+static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
             &quot;VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported&quot;),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -391,9 +408,11 @@ qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-balloon features mapping */
-qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+#ifdef CONFIG_VIRTIO_BALLOON
+static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
             &quot;VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming &quot;
             &quot;pages&quot;),
@@ -409,16 +428,20 @@ qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
             &quot;VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-crypto features mapping */
-qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+#ifdef CONFIG_VIRTIO_CRYPTO
+static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-iommu features mapping */
-qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+#ifdef CONFIG_VIRTIO_IOMMU
+static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
             &quot;VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. &quot;
             &quot;available&quot;),
@@ -439,9 +462,11 @@ qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
             &quot;available&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-mem features mapping */
-qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifdef CONFIG_VIRTIO_MEM
+static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 #ifndef CONFIG_ACPI
     FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
             &quot;VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid&quot;),
@@ -451,9 +476,11 @@ qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
             &quot;accessed&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /* virtio-rng features mapping */
-qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+#ifdef CONFIG_VIRTIO_RNG
+static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -461,6 +488,7 @@ qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
             &quot;negotiation supported&quot;),
     { -1, &quot;&quot; }
 };
+#endif
 
 /*
  * The alignment to use between consumer and producer parts of vring.
</pre>
    </blockquote>
    <pre>Good catch. For some reason I only defined static for the &quot;general&quot; virtio
features (e.g. transport &amp; vhost-user protocol features and device config
status mappings), this should've been done for all virtio device-specific
feature mappings as well, and this patch does exactly that.

I also missed guarding the entire feature map arrays. Thank you for adding
these in.

Reviewed-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
  </body>
</html>

--------------RB06xfmRIR0Vq44BgSUt8gXx--

