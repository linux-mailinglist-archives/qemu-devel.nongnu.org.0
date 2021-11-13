Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8144F3F1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 16:25:49 +0100 (CET)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mluuZ-00073h-V8
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 10:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1mlusW-00054J-1o; Sat, 13 Nov 2021 10:23:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1mlusS-0001XV-SA; Sat, 13 Nov 2021 10:23:39 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ADEOciH015270; 
 Sat, 13 Nov 2021 15:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vA6AL5eicUhUAIZ0Pu33a0bWCvQ0nnjhQs9nw3cbFVk=;
 b=G9SPZqkDtCsU7m0Y1C6pB/PrcBrXXtHz/rDdIw+W2dT4nLPeEyzFO6MDm99TlT9CEvtO
 Ekc3Kr3yv3kTIVEcm5jtTkIWdA5dNDZLPjnXXCemgwyKPAguXFmzIhYYB24xbe0/Ffpu
 BaUtyM8S8hkzt2WXMGBvx2KdPG1GLQQwPth2nTA9MeVtXVZlOtNNp8jFWaHj//kdz9Uj
 BQf6Jhunva5V9GLuuMxucWFqA4Qp35tEmDkqK7m5/DKVNx3YKzfDLfEt/JhDIU/1SD0A
 Gdz8IE9JUr56SXx90MFg5dqaUcGvkMLadudAnhx1K7zQTXnhsEal2pngKFJ7Q2IuCW+X pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ca452sa5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Nov 2021 15:23:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ADF6SCN154166;
 Sat, 13 Nov 2021 15:23:30 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by aserp3020.oracle.com with ESMTP id 3ca5625cgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Nov 2021 15:23:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvIVBZpF6lKzD8NcozfRZOMv1Q2Bup/dCj22U1NuwwJuyDG9SckcYZ9yaDJiMM9Sa/2NnO8NQxUmV9SBbHptNq1nlrejMSDaPBIMAT26sdBPoCSRz6ecP9fB3Ku2y/0fmkA+niq24U4ogUa3GZ/ir/gV9PJKivCIIB1tP+Az1c5Xh/VDOtYg7QaKdozXiXMMu63xCyo6wNEdp8rAGx7JRhS4hsma2j2IHcgTCUnq5t0a9ANVuhW2nK8LrDK723YvWmZHhpoIPTuKIUV40euL8U2zoPkBhzAc5ZLaPnb2fgzMqp11cginxDs27j++pmcHrsVhrya2zRTLhbuZ3UPSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA6AL5eicUhUAIZ0Pu33a0bWCvQ0nnjhQs9nw3cbFVk=;
 b=ZL0FeZRUXIPbW+MG5xWorCa1Jj5zrqRrTxalzb5AQtpWAqm9h2b6jEotdmUQMkR+6rpk0oDcH/JB9GvuHT/L8PJid4McoVBEwtJW3CDHnV3ny0wFuSLULwwCQGIfq0mLWGbPFRNzCMUUIXxDiuYei+y662XeVNeHEIheHhMwRdX/PW3SXNBGxmVndTTfy4jTVJZUrkrqJha1iZG6xUbYhLuCyvasK+0lgQ4p0/iFZ9cnI+lrr8LTaEmwPOA7nAKWPft7eKEMk9xULey5ITERvnm2ezlzCunB3Ota7T9IRy5n1WWZI5BJEe52cgZ+kJIBHr1nHCOZibIaIcujcUB6mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA6AL5eicUhUAIZ0Pu33a0bWCvQ0nnjhQs9nw3cbFVk=;
 b=OhICc+0NY7ZgoglRGdniurgjnAIcRC+H35ZEUkZK+T+kKYbAqWotSrKGUUMUATkGfOpg5cVPH08V9I5jYcM5oTDBQaBjNaXWPb4mqs0kCNACuVETqLJ5a4kUq6UeYLn/pn3G3hUanWa84WOGW7JjCg/0xzl1Yx7uwKYSJcKiLE4=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by CH2PR10MB3928.namprd10.prod.outlook.com (2603:10b6:610:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Sat, 13 Nov
 2021 15:23:28 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::74b8:818d:18e5:e6c6]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::74b8:818d:18e5:e6c6%6]) with mapi id 15.20.4690.026; Sat, 13 Nov 2021
 15:23:28 +0000
From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
To: Roman Kagan <rvkagan@yandex-team.ru>
References: <20211106134155.582312-1-philmd@redhat.com>
 <54b75db4-8867-d1ee-e32c-bc3e4c23ec28@virtuozzo.com>
 <YY7Q62ltAyfAUYJp@rvkaganb.lan>
Message-ID: <8caa5fb3-df36-d763-e07b-8fe1667ed7c9@oracle.com>
Date: Sat, 13 Nov 2021 16:23:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YY7Q62ltAyfAUYJp@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0038.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::26) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
Received: from [172.20.10.2] (37.248.222.61) by
 AM6PR08CA0038.eurprd08.prod.outlook.com (2603:10a6:20b:c0::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Sat, 13 Nov 2021 15:23:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6ade59-c7be-45a8-efec-08d9a6b98b34
X-MS-TrafficTypeDiagnostic: CH2PR10MB3928:
X-Microsoft-Antispam-PRVS: <CH2PR10MB39288C2BF95BD88C4AC85770FF969@CH2PR10MB3928.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1kOIr0ncLKRtA889szP3mJet3BjenCKGnE6twnz2itNtiEq/lYDk7YLHtuRGkXEq9MMmTdQHQQPzvJZI0Q5Bmw0IXtJW2tKomMZbaYL3h8KwNgtGag9HUWQeTCsO68H2+pLGb1gHqOcmdP7pRXt7IziUFTKDsZWlh7CUXZv1o5jSmJn9++2sKn/TZjWQQQ5ny2NQFbOsTvQ6+guWcsbNjRBviB+vW5PjDFAgeINxyUhMPoPWzYyg4Klj+frg+lm1EzAzggKMW2yF3a02EGW4UJwQ2J/Dy8jkVMeBdZg+zCDGK7GrE/Yb2q5E2bAT34v0CwWtRUzl5zRc00PH4zykmHmpF8cJqsVkXJiuZiiWwPlcnDTNVP8ahZ1njW1lZDREtsBb5SF9UzSCmXhhHrMleMbZ2yXvCqnXMLxS/I6x1zbAzH/rd1b55zl3QvmlotYOixiqjiernCn/TdlDxvy03DGl13EQQ2t8/ICo2AqlgrXasS2/q0jwo7HXeh2ino0k3XPLeOf+3MdMZ3WhZ3R070VbjQu5fBhGFAmwMDHHQE7y0CWM9HlyCa87gB1HeKW0wdDzdNysJvMzbfk3+VeVgWP0PH+gAehOXlIDOZDboK0hkOqjdiMNYdqcevADIVwTZnQgo0jk5o4NRdEzB/t8YUgiswR1MhgcOfdgVB0tLrslYUkEsMM2wlKbu/hvpf7Rl+O+RRcqYvMP7wSzgvnvZXhRRw20AnBk1leplmUn3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(5660300002)(31696002)(8676002)(6486002)(4326008)(66476007)(66556008)(86362001)(2906002)(66946007)(956004)(8936002)(26005)(36756003)(2616005)(186003)(16576012)(316002)(54906003)(6916009)(508600001)(6666004)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNtQ25uMm00N1Z1dlEyY09OaUpRVGE1YjNKb014VTRKMTNPZkxMNTVEemV1?=
 =?utf-8?B?TzBOeUtoNHR0c1cyTVo0blErR1dsZjNURWJnVEpWMlllUytLY3F5YUM1ZnE2?=
 =?utf-8?B?QmFDdEU4RVlHWFE0RWN3L3hxT2NaQlZFaW1nS1BTMWJnV3h4UC9TaGtFaHd5?=
 =?utf-8?B?aGtMQWZPb2NvYWlaeWczRStLcStVZWxGdTNkcXhGNXB6SWZwTHVLZjh2b0pN?=
 =?utf-8?B?STYybzRqc0V4WkJMTlZDVDRFeEZ6blUxdy9BaTNKV0QzYXFmOTBObDgvWmU4?=
 =?utf-8?B?MkZjcFFJSEl5SGQvcDJvYVB4V1pIV3RzWEtsSVNuYUdURGo0eDdKdklJZ3NQ?=
 =?utf-8?B?L1h4UmhEeUM2WDA2eW5CU2wwYzZCSVRPOTBPTjFqNU9obHNCV3lUelIrUUFC?=
 =?utf-8?B?aUQyUUgrTXY0blk2YklzWVArUExDQmJ4dmVxK2NlRjd6YzlGM2lpdFdzanE0?=
 =?utf-8?B?aU11L2xRSDhSUWRCY0FhUUFSSUU3d1NrNVVPcHFUVC9TVjVrY3JNMEdSVlRz?=
 =?utf-8?B?UnhjRlNzaXlSZWhIenlDeVIzOUpiT3pxNkxwc0dpc05MUFU1Ky9oRXdGU05l?=
 =?utf-8?B?OExacTJ3WjYzK3ZvR0hFU3V6bktuYm1JL3ZUYXFBbENHQy9JVkQzTzkrQmlv?=
 =?utf-8?B?R2czTlgyb0NEWEZFV0haNjFvbFlzeWZCekJTMWZJZ2FpVlJ6aTFNM3lEelVz?=
 =?utf-8?B?UnF0RDZpOCtpWDhjZkRqejdTL1NPaUJrL21wejdGVW9aZGpORzdwT3NIVTRN?=
 =?utf-8?B?SkYvQkJUbXVOSlpIQkN0d3VjMUJpNzdDQ2F5NnJGK1hJb1lXZDV1UEsyQWhF?=
 =?utf-8?B?QzFzMWltYU1McVd3Zm9GTDlaNUE0b3hwQ1ZNaTZUYXZ3cmFGclpCWDNVUkFD?=
 =?utf-8?B?VlQ3RHA4STJEeFVPajVsOW55d3NvOUpTZjBzaTk4OW9FRldtV2JBMEtja1dV?=
 =?utf-8?B?QXFEQnRJN3JTN1NzQVJ6TFAxbThOQW8wNEpQN1JNQ00rV3BRUDVtVklqeDhs?=
 =?utf-8?B?azAvME1pVTZJQk5JSnhOMTVzSk5WbmJ1YldGd3dkY013UVdQRmx3WWJNZzR6?=
 =?utf-8?B?dklHVU81TStQVXNscDVxL28wNnByL3VaY2tjNzdtTjdOdUp1N2xvZDlzWHNr?=
 =?utf-8?B?S1dpUUp4ZDBLanRVY2ZVOUl4UFlYVEx4azAybTJWVDN0c1hldDNrenhLcmlF?=
 =?utf-8?B?S2RHeFAvczZ2N1k1NjIyRzQ2UXJNeXZYSWtYeXhJdVNnTkNEa3JJWnYyd0J6?=
 =?utf-8?B?VlVIemxYOEIwdTliVDY3RHhXR0hFblVqdnFENEpkREY0a1hmUjVsS1AydU04?=
 =?utf-8?B?eFhRUURDY0JSa1c0MFNuQWdrTGlUaWx2dGU4TDZRaGZBTWlFN1NzTHYzenF0?=
 =?utf-8?B?U3daRGxWK1FYVkx3cHJwcStGdzgvT2pCSmVOVXJMWS80VWdBNmQ5V3Y0Nm9r?=
 =?utf-8?B?M3Z0czhJUTZwcHlEUTVobkxacVdQTyt5cVdBUnVoNXhROFFEWjhvaWhQeXJ5?=
 =?utf-8?B?NGQrTU5zL3hWWUtvY2svdWoycm42NFFSNjRhMkVYNzQ1a2RlK3kycjEvb2dL?=
 =?utf-8?B?KzVGSWkrd3NocDEvUHlkcEN5ZTI1NFE0VzcvS291ajI4RlcySnhhK25nZ25K?=
 =?utf-8?B?K2ZicUp1SmJ0V2FmbUl4OENqM0h4U2VXVWxTQVNlYVk5ei9GeVlNaXhHUEg0?=
 =?utf-8?B?WFkxQ0xHeVZ3Q1NMNGlwK3BvMC9HeGNZOGUrYm00b250a3Zwa3JkUDJ1enUv?=
 =?utf-8?B?eGRkemJXeVUrenVyWjR3dTNMNmxwN2VUL3IyOExESXRISmVoNW9yOStTQzhw?=
 =?utf-8?B?UWVSZmJSRjE1YTk4b3dOVkdPVGwxKzNMdmxEUWNSQXhUTUFiZE0xak4zMmJn?=
 =?utf-8?B?QnJBSG5CYWNPQmMrOXA1T2FhQU1maHdKZXM4dVRrQm90b3JmMmd0dVJabGpR?=
 =?utf-8?B?RnB0cjF3ZkVGMVlWUHVodGp1NlBvK2M1K1JQZ2NjR3NSQXlkdlNZaFFIUDRl?=
 =?utf-8?B?QzVEU0dxZXdzS0QzbEZ2cE4xMjJOc21vM3gwZHFwekdiemd3WWorNUkzbGU5?=
 =?utf-8?B?UnZBS0F2V2RxL1JBRERJYmxZTWdyMFg4ZnFWa1BPNFZERTEwOU5FVWl6Smlr?=
 =?utf-8?B?b2Fvb1dzRkFkaDQ0Q04vbnNRcElSK2VrSld1NktMVVM3N2JlYzVpS0dJUVQ1?=
 =?utf-8?B?RnJYUUlvNkxDdEFHanVpU1dVb1ZZcU12dnp3NDNlRDlmMDlHTjd6WU8raFJz?=
 =?utf-8?B?STNKYjBaU2V6enZ6bVFIaGk1OGhnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6ade59-c7be-45a8-efec-08d9a6b98b34
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 15:23:28.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSaPTYHkSkL3h3uPKUz5GZQcELcwX/ZCstnBo8BF/vxMsJ73R2ZVLFf6G95CDOpuUANS6XRFxgEgYSdPq0X5fhWZFWALfa5P8hFWxS6nwm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3928
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10166
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=996
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111130088
X-Proofpoint-GUID: MUBD_gfUijvV3NOdHBaNa7pSx-oDp9vn
X-Proofpoint-ORIG-GUID: MUBD_gfUijvV3NOdHBaNa7pSx-oDp9vn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=maciej.szmigiero@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.852, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.11.2021 21:39, Roman Kagan wrote:
> On Fri, Nov 12, 2021 at 09:32:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Add Den and Roman (his new address)
> 
> Thanks, I missed it on the list indeed.
> 
>> 06.11.2021 16:41, Philippe Mathieu-Daudé wrote:
>>> This is the 4th time I send this patch. Is the VMBus infrastructure
>>> used / maintained? Should we deprecate & remove?
> 
> I think it's fair to say it's not maintained.  The whole
> hw/hyperv/vmbus.c was submitted as a part of the work by Jon to enable
> some obscure windows debugging feature which only worked in presence of
> VMBus.  It was mostly taken from the respective branch of the (now
> effectively abandoned) downstream tree with an implementation of the
> core VMBus infrastructure and the devices using it; however, none of the
> actual VMBus devices ever made it into the mainline tree.
> 

The VMBus code works fine, is mostly self-contained and by being a part
of the upstream QEMU it does benefit from any improvements done there and
so it is much less likely to bit-rot with time.

I am still committed to upstreaming a Hyper-V Dynamic Memory Protocol
driver (which uses VMBus), however had been preempted by higher-priority
work for now.

Thanks,
Maciej

