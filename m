Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655154EBB29
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:53:11 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZSCc-0004NA-ER
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:53:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtl-0007Xv-2C
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRti-0005NQ-BH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:40 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U3Mg4E001205; 
 Wed, 30 Mar 2022 06:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=g6CCMKEhY4A9XctA35s5iChBffq+Mq8CfEB26NtciaA=;
 b=pEGLmJdSC1sFrll3dHfVquZblNhirX5rVDfDyOMcv7W9eQxG0c6rTK1Ym8O0XYkqOx8k
 d0/QK2jySxoeYw2ba7udLQXp+70a7RpuhMGKNewcDYier533+2miJRTa7NahVCSXa6Cg
 Svg7QgormwxEI9vblH+FH97PwO1G/WLBSjxu80DLaM8Eo8tRXPBqn+1nu7dWL4LsAnvY
 j54Gic+KkuBUePLy2GemVXwUAoCiyFrvrejb7790oaxliqCAPUpTEIjUM9DduE5Lfoa+
 tH5HSUIAlG5/fQF4DeG/9E4xxyXKeQ+tdhc2FqS69BeIM+HeaJ7c1+Q9W7KGP/3NLxkp CA== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8crcnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6IT3o114576;
 Wed, 30 Mar 2022 06:33:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3030.oracle.com with ESMTP id 3f1rv8egk8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQnoCVh1Y08lO62Yj5EMZAUvlmQxGhOimgG5dA8mPbXSkab1jFRgXNnNpLOhigrcWo+oHzxpLmhr6cGPRjnjJnEhoA9lqNNNRUscoJ/JAJf1ifT5INuN4l0x6yFWa9yErPYLoXwXxzOXcyUXYzKVgrq0DkfTffP/NwbvFggUDy6Td0Kog2GuD6yEMj3pDLf7BAHZ/36DbVp1Oo1AMrlv310jloT4GMkpJ/htBXMmljU5SW0YRdUiepGbEe8kNfEi3ppL2xoMjQG9/TNFiGQJqhn2c53ZjLBPYCsylGVGb/v7U8iqn+PWyBd4z/TEyQSJz5Hy4mP0LWyXcX20S8+2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6CCMKEhY4A9XctA35s5iChBffq+Mq8CfEB26NtciaA=;
 b=CcmvJlKh79AdLzucYroobNhSRHjkcG54G3MB41d2/gVs1Jg4RaUYJh0NMI4HeHjMJuG/VaBAVwoqa9vccR2plM93PqvsYrRElVSu8nDmmo6t66/UvBVZT9A9TnzElluqyo1uZ5ppk+pKgS8E0QYHTMvm+C61Y8yQVhntQnrkSFbYJ/aW0nLUwB2dJLxsa4/Jo3YLGguLTQpJgKnANgRKmjRI09OYOT232sx38bsCArROfhw3itFjgQgcb+sbyF5AYuqf9p+OdyEHNjS58Ve0XnWV971q9LbpKTzXfUwG06ilTrtlVicOMFnoZipDJWVVnHuqhYBR21hg7YBf9rtzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6CCMKEhY4A9XctA35s5iChBffq+Mq8CfEB26NtciaA=;
 b=c6NgcHhU885Tg7TCV3Gdve4QwCulcm1uC5kXcL3XF4TGOeGmsaxf00wDneNOyzgtFQiwje62azUyg3/F3930hZyWyFNDVMvxiwFGV+eeOSylLblj8EAEp1bazAoxogNvaUDd2pS8vXwGDMzM+2ynjjd4GhU4H8XXk6iocACABW8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3130.namprd10.prod.outlook.com (2603:10b6:5:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:31 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:31 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] virtio-net: Only enable userland vq if using tap backend
Date: Tue, 29 Mar 2022 23:33:13 -0700
Message-Id: <1648621997-22416-4-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ad5ada-bfba-4ffa-f966-08da1217355b
X-MS-TrafficTypeDiagnostic: DM6PR10MB3130:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3130522A804FC6C8D99DF9BBB11F9@DM6PR10MB3130.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bysm83TLcooahr+rRaDDeujzHSXlu6ns5iKneWEoscjh8v/xdrXBdS1H3gGYaZxfnYzAF757eo3cxutMcqzYLHtUzLqhQiuq2a8ElagBYp7QASo+YQn8TTN+xMMWozqyAlt5nhQC+8tvNML/nOioRhmlYZomb5A1SYLzHK36IMIwYgkJ3wfcKhwO8AE/TQwSyQI/bOay7f+gGeeLryejYwP+KwcnulEtaQaXYMfwkOSLzaFbVREO+rFB6/6ASVNqBL9SyyX8++2sv4SBVL+/gx0iTlhvebr+QVPi/Ut88Zr3X7i3T60i7w5uinPZKqG6oXvcugbPtRG5zBJcAabyxSoXsKqbVMixlYiLGXijQbtqnRFzowhuSS7X12/UORdzqofyNZ4npD3SdChdwYByAoakHNmCgj9Nr2vgatV53iDE1KISbyFNI4C42gMFInI68g3x40mWWNbikU/ge8ReHyeuQhmEPsR3CNp4eeLYJGkU8N0bhQqIYo5oPxr51bN/5WI08aZU6FTJy6xkIZ9tuufHkv1/oAnXMdJazpzaHBdc566Q0dW8DKqgpThZ+Slm2E2w3gZNZUBcuUkBYtMx3oNWZ31WhtZVeeIgYfeYnscr3grMysyHhELyTi+ORHPgsC2c4uuP7laXKP2M2eRbL4Anb/jkXKEDQThqqCnuIecS9/aqIoTJWErfnLf3k00tKUXlNRantyrC/D7L9hR06g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(2906002)(66946007)(66556008)(508600001)(8676002)(6486002)(6666004)(6512007)(4326008)(38350700002)(66476007)(52116002)(38100700002)(26005)(186003)(2616005)(316002)(6916009)(107886003)(86362001)(5660300002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVrbjNzcHpJZkcyOGtYRit3aDJlNGpDYW51UTlsbEN0V0ROZWU2aUtKalBZ?=
 =?utf-8?B?NStOWWwwZ2hSbm82Q2g0U3BibHovQmtqMU8yWlV4M1dOTkxmaThXQUVOb0Iw?=
 =?utf-8?B?ZmF2ZkhTc1RqMlR5b25ieVBIUGx1OElDSk1kdkxEMkc1NHNUdzZjREpWdk4w?=
 =?utf-8?B?ZTVvM1NZSlNTeGdSRFJ2SldJMWpTMTBJeUZoaXVrWGMrZ1g3Vm84eVF6UnFF?=
 =?utf-8?B?T28za3lGSFoxcDhxenRXS0diRnRxT1orWEZaYllUalJMMUJSTTN0WHlDQXBO?=
 =?utf-8?B?UHpYcFVGK3p1bThlZEh3amltdjdzTDl1L20veDFKZ0JUK241Yis2WXAzek56?=
 =?utf-8?B?NHhURm1DKzk4NFRWVWpKS3gvVnVsV3M3blpnRGQxYi9LWG8wTk1rVnJIeGl0?=
 =?utf-8?B?S0drajhXQWRCOTZLQm1VWjN3L28wbHg0UmpteDQ4bXdac01vNEp1MDFGOEJw?=
 =?utf-8?B?RGlVd0l6Y2w5SlN4VkJUS2ROempDZEVJcjRuY1MybWhXdzlKK0lJRWE0RVZR?=
 =?utf-8?B?RlVQY2JQSFBWeHhXQ2dpMXp4WEhBaFRHdE9pQm4rR0s5OCszcFZxMU8remd2?=
 =?utf-8?B?SnFhb1hpV0tnN1o3WkpOUWNuSHF6a0gwNTdzR0d4eFU4cXluTXN1TEpJOUc2?=
 =?utf-8?B?ZStiMHhnMnZIcnM2Q1JZZmtUZHJ1V0NDY01tb1BwK0NXSi9PQ24vOGpNTkdP?=
 =?utf-8?B?ZkxJSEhqMWxzbHhaQUE5NU9nN2Z2M3FDN3JWd3YrKzFkMTJuZDNUamREMERj?=
 =?utf-8?B?SzBBbzVkMnJwOEYvZHF0QURKeGZWcjV1S2JHMUF6dWlnYXhEU0JkdnU2Yk8z?=
 =?utf-8?B?ZzQ4NnM3ZWFLcnEvY1VnNDZVT1Q0TDFQY2ZMS0QxTk5NOXF5VTBvZ0d5WUQz?=
 =?utf-8?B?S2NVMklGTUxWaDRzdmJnd3JNbDNqVnlMQitWcVFwa21JbTY2cHI4bDJxc2Jx?=
 =?utf-8?B?TnJ5VWdMdmhzQk5CNkdXVE9NMzMvZURtY1MxU3RubVpkbHRVTUNkZEsrZHpI?=
 =?utf-8?B?bUFyTHQvZ0pJd0RDZS9WcDlGR2hUVVVKNGFyTWd2UHhCVHRaR0dHNWhMR2hH?=
 =?utf-8?B?M1FERzYyaCs3WHk0YU9PK28yU2tPTGNablVCLzMvd0xDU0lqUUlPUmpMQ0RN?=
 =?utf-8?B?cysrSXZLR1BoVjYyaU5WenA2OE92MDVmc1ZJNklBdVc3aGlSc1ZleGZMRXNq?=
 =?utf-8?B?akw5aThDbzJ6elBBZkZKUFhmaU5yS0JiN2VheFY2aVRTQzA4cmlUeXB6NWVk?=
 =?utf-8?B?OHlHN1djd2lGNjBCZllsdjUxZXU4NDZrS2dUaW94SlNKTEJ1K1VkamVmd0sw?=
 =?utf-8?B?Z2tlR0lGRVF6UHRtUHMvMkdsR2crMUJKV0xYWGMzaXdmWS9xbVdReng5MTFh?=
 =?utf-8?B?Zldpb28xbUVjTG9PaVdnQ2hORWR4cFlER2xsOGhWWXR6SnNUTGxrTE9YNk1r?=
 =?utf-8?B?MjhISXZ6RnlqQWd1b2dtaFFYTUtLZUVZZnhGWWxyODRQOGVQOUVTdUhzbURP?=
 =?utf-8?B?QkJlTDdGOUVmWWRua2xiZ2FBZlh4bEd2VGR1S2U3VHozU3hDU1ZWWFA1N2R1?=
 =?utf-8?B?Rldib0ZWK0dGdTNSVWVUQlBIVnVxa3pWYlJNOStuT0NxeVQ0eFYzdXAyRXdZ?=
 =?utf-8?B?Nmg4cmpoRG9iOHJROC83OS9wOVNYTTNuN1Q3eGIydmFhN2Rhc25DYjJRZVQv?=
 =?utf-8?B?SDdVSTlsZXZSN3JleVIvNjcwL25JcW1tczE2TUtIN3c5SldaU0VGbnFQRi9t?=
 =?utf-8?B?VUo3QkxZQWtRc1BkNGIrZDdpb1NNdXJWNFhmWG9FQTdzaDlrQThMc2tqbXJo?=
 =?utf-8?B?cTRmYzZ2QnV0Ujh4SmJzbFRpMVV2cVlpeWYxNHNjc0JYUGhwTVdyYWJ3WUZR?=
 =?utf-8?B?OGhiVkpaY0tlUEhiTTBpMzZzVmtYWW5lYmVuZnlUSmFMNWd0VkRrNVZVTENH?=
 =?utf-8?B?RlJ5eXlxeWVKYWJ5ZFd5Z1l0RUluQ2lPRERSZmk4emE0Y3BEMHB4MGRlbkMy?=
 =?utf-8?B?RWdxV044M3c5RWFCZ3dVMlVucHorQWNlNnkxT2ZOQUsySG5NL3JlMlRjVjlT?=
 =?utf-8?B?QWNReTJuUG9OVTh5bXJnMjB1dFFxT1MyMko1N21ySW4vWEZTNUJYbUtQZmhD?=
 =?utf-8?B?Q1grMFBUS1dZSGpoT2kvMmlHdFplQXBpY0tXQXM3ZXRUT1N3TGJaMG42RHpS?=
 =?utf-8?B?cThaZVVMZUNRNy9RZFpuaHFsMmZjcXF2R0dqYjVQTmsyMm81aFQvcnRqdUhs?=
 =?utf-8?B?Q0lKNmlxeW1sY1JTN2U1Z0NhR2pRY1ZhRXc0a01DZ1phYmxFUVBNK2NIaTJs?=
 =?utf-8?B?TDI0S0NRa3Y2WkVPQUd3eWlNR29VTEptd3lDa1RtcDBCelZYemtzMzFtTjZu?=
 =?utf-8?Q?z4hqJtiDeQtEAj5A=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ad5ada-bfba-4ffa-f966-08da1217355b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:31.7145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ruuqP7xC7s+jPZzaZ8q02UrSOh6DOoPy2de9EhWAwQyzetaH1ne8GJ1fw+iVFvy73AzUDSaKC/vc4AXeCKQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300030
X-Proofpoint-GUID: oxqy04K2sKdrn6tNzVMKaB5thiWxiv6L
X-Proofpoint-ORIG-GUID: oxqy04K2sKdrn6tNzVMKaB5thiWxiv6L
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
cases. These assumes a tap device can handle the packets.

If a vdpa device fail to start, it can trigger a sigsegv because of
that. Do not resort on them unless actually possible.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c        |  4 ++++
 hw/virtio/virtio.c         | 21 +++++++++++++--------
 include/hw/virtio/virtio.h |  2 ++
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ffaf481..9cdf777 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3523,6 +3523,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     nc = qemu_get_queue(n->nic);
     nc->rxfilter_notify_enabled = 1;
 
+    if (!nc->peer || nc->peer->info->type != NET_CLIENT_DRIVER_TAP) {
+        /* Only tap can use userspace networking */
+        vdev->disable_ioeventfd_handler = true;
+    }
     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
         struct virtio_net_config netcfg = {};
         memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9d637e0..806603b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3708,17 +3708,22 @@ static int virtio_device_start_ioeventfd_impl(VirtIODevice *vdev)
             err = r;
             goto assign_error;
         }
-        event_notifier_set_handler(&vq->host_notifier,
-                                   virtio_queue_host_notifier_read);
+
+        if (!vdev->disable_ioeventfd_handler) {
+            event_notifier_set_handler(&vq->host_notifier,
+                                       virtio_queue_host_notifier_read);
+        }
     }
 
-    for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
-        /* Kick right away to begin processing requests already in vring */
-        VirtQueue *vq = &vdev->vq[n];
-        if (!vq->vring.num) {
-            continue;
+    if (!vdev->disable_ioeventfd_handler) {
+        for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
+            /* Kick right away to begin processing requests already in vring */
+            VirtQueue *vq = &vdev->vq[n];
+            if (!vq->vring.num) {
+                continue;
+            }
+            event_notifier_set(&vq->host_notifier);
         }
-        event_notifier_set(&vq->host_notifier);
     }
     memory_region_transaction_commit();
     return 0;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b31c450..b6ce5f0 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -105,6 +105,8 @@ struct VirtIODevice
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
+    /* backend does not support userspace handler */
+    bool disable_ioeventfd_handler;
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
-- 
1.8.3.1


