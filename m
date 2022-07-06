Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79EB56911B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:52:25 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o99CK-0004kb-RH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o9979-00086z-WA
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:47:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o9977-00064r-7n
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:47:03 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266GOedh010495;
 Wed, 6 Jul 2022 17:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=MXda2dozGS5qddbaFGoe5uU2GHmYy0yYDD+r1AaqhOo=;
 b=chRkfPCOC4poVKbwb2toG4657jZJ3KNdsmAZ2WziYoLif/raIqQrocb9Ng/lHOQu/VBw
 fZBojvRrgmBfLftvzQQbfDOLV4nVtiU13OdNPugNmbrg7LPI7iTNvjrUfr0UvPIgUrrv
 jbFADphN6JITKuakBlajRFKQdkrr3eR9u0DRz5bL7gdEKyCLX9Mqop23nbnSQ1xE6YQr
 qkMpC5mFrzewTpbEVfr1J5yQlUVWvIGCJ2BdqFX4viFFK858rYXCLvhf99QNSdwgFI7f
 JL/TfVAbF3t2WMy9rdmlZBq3gLNpamFBGbhjsobPibJNViqX0NkDTSQ+lf4+a2IM4YjL +A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyaqt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:48 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266HfdS0006180; Wed, 6 Jul 2022 17:46:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud88wdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InuMQI43EdQXp4YoAQ/numgqzjVp1x0GA21eui67QfL1cpyx1e9AWfq6knSC5AVNHNxDxbj+HXN/wMBb28P/Dw7f+99OQGaBrJ3RgvciIcGSbYfp4Pgtu7FFTelnpfyUTnf5OZQcnkUsSesI+JTSe5HNsBQ5a7BVKg6e1EfJ3/IXUQ0A8ThVKl1amRRe2mZqSfQFZ6Sf34vM5yUCCmT1IKqEV4by7XPdJed87Gcl2dMC0+6zo7nSIG+QWJ231MOQNcOGoyhGnBjqE7FxQgur6/kOvHcZsCihfPqjyZRlk0bAkAh4dPf21Q+VAaNcIXg3bzoby5ZhzlLWilQoRQLD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXda2dozGS5qddbaFGoe5uU2GHmYy0yYDD+r1AaqhOo=;
 b=fanvEPknBMxGXHAToSaXKza0b3RuVbiBVrV8Q04Ue5ahI3cAXyL2mOaZfix+wJvV2CLwoKG1ty2aHag0u69UUhYyHMhieLN8mRhmct9BC7/1q4b11NMsP/Qofuhxu04C6E03lQXxODdALslbNUtCE2o33N3Ua/+cHN6MvhR3c95ZIfJSursznWDt7Vdg7fl1vTrODPxqUY745z3H4foj+ktJTYTKnxOBfRqMoebH7o8/qn/XlVfammBUJguxRVwGC0O/fadWGK+k7hJjVmy3h7rniSo/XECY7aT6tDN6b34ivHu8QbWOjPjphE4iwLsDyQmLNUStlYuAwzPkerVg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXda2dozGS5qddbaFGoe5uU2GHmYy0yYDD+r1AaqhOo=;
 b=IlAAGm1170koiK/JprauGtAWqeqbPrpxhBnsUEzVKHdBSUSEnaP+yfux13lUQiygbssPXwqHgtmUQP/AV0vxYnfgHDP0MsfvTnvdD2AeupvhWf7K/n5c+2w59s/y9MCdXxJNfLs57oa+sHiY3xfPSVwjRtuwl6FvqJyRYs0WNXw=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR10MB1476.namprd10.prod.outlook.com (2603:10b6:404:42::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 17:46:23 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 17:46:23 +0000
Message-ID: <3a355c21-6c40-ca06-f858-aecc58746a45@oracle.com>
Date: Wed, 6 Jul 2022 13:46:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 29/39] vfio-pci: cpr part 3 (intx)
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-30-git-send-email-steven.sistare@oracle.com>
 <20220629144316.60e6ea6c.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220629144316.60e6ea6c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:208:234::23) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0a9d71a-9c9a-4745-dcea-08da5f7770f6
X-MS-TrafficTypeDiagnostic: BN6PR10MB1476:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqqcPQ0nyGS+CHkhMWrJFE0Z574wPgP01B6f1Woq/aZqSbS+8IDzk64SOCSWmwhdYfHa/ftuDT+2WK83pmzPnMGJiAIn6tXLZDPQ004O/nGsN7IHix/hyE9B5K4GI4aw6PezurW60JcfykGtKXMQE7Vi896rcEGp5eFjPbSgcn7ob2BRJwBAeOyVkCO+BBpDXj/XLACaJRn3BgoL7+TTAjHip55XxybE6eFGDDK48tjrWdgTHpGMoo/OTsbyuGvi+88XNFQHKGJ2LiiDCf5zwm+QFewTD69ldbIr5b7weH/sMI5kofgoBZ77J5rRWoSgEv/7g5ke/1Ym7vayS5b4QAwNXL81oANjyEsVWKgdMSgsP2mhCAcuPLe8kv/V4VPIK804vsSTeKBHQlCzKkpD2WB7TYYo39WUYosbdwqXuiV8TI8AYyqHAW/CHq6bz9v3kWFz4caj6/Up9EOTAYMGu7n41wVuV8c1hXy1e2sZIgM0XWys/PhlJoCN9USfBMQku5wtaTWGbP08F2xX/jw2Sh/DNRZwqdW22x54BrXqAm/dDXuOIxk81HOs/GK0ftonPibF7gTLuKEuLsInAHoEmeA2f1XxOzU+rvFmuHpYHT2jF3hcx1UPWzNfWUBPM6gZtUVDZ100H7CDNCldydNu9Zg9pA66rVfrRMdVbWmotkl0bsjGlzFB5pR1AYGF4AG27xgdxy4K5Te83aU/6E57wJORplp+/4rtPbTwjT2Sivjy7dnkanpnHUZA4xXu22dkK7iUAr28DHXGYmitst97hL4wA24QrgmOpEbm3bniodiyoYJXqIxVyer01L0N22WV2vj3xYqIPhCRKhl++wPNNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(39860400002)(376002)(136003)(83380400001)(26005)(8676002)(4326008)(186003)(66556008)(66476007)(86362001)(478600001)(31696002)(6486002)(44832011)(66946007)(5660300002)(8936002)(7416002)(38100700002)(41300700001)(2906002)(2616005)(6666004)(36916002)(53546011)(54906003)(6506007)(6916009)(316002)(6512007)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1pQR0pxVXRrZ3F6RlI4K0JJVUUySDhqc3lxeGdVUU1pUytBUGJSakRpMnRx?=
 =?utf-8?B?MTF4MzlINXorVlNPUUVubXhrUC9OeG9PNWQxRDBMWFNobThLSmtiN2Z4OGFI?=
 =?utf-8?B?b3V5V0UwajBFL3I0VzFIZ0IrOGFFSlNDK3ZrNEY5MXoyaEJiUDUyc1pQNzZE?=
 =?utf-8?B?TlBsZEQ2S3V6WElHblFWQWNzKzQzbFI2Z01ZSUM2RXphOHg5N3hkUU9GWG84?=
 =?utf-8?B?R01Ya3dEd0ZkNExyaVk5bkx4eFRHMVdXdENrcnVqL3VtcWloV1J5blp1OUk0?=
 =?utf-8?B?ZDIvYVkxcVI3dTh1U1NvL1UvVFVOVkR3NzZ3cVpTMGtUbVlsY0kxbEFPdXpR?=
 =?utf-8?B?bHhiZVcvWkNOOGFOVk5RTEs4VFRZZjJleUtsWjRTbVBaOWpQSS9NZW5rOUd3?=
 =?utf-8?B?VlFqa1g5SGZxb0VUdzczWXdwbFFMK2ZMOTBLTVluaWx0a0pLNHlud21GR1p6?=
 =?utf-8?B?U1AyLzdCVC9CcnFYY1dUUWt6RW5mT2JQRWZNTklDS1NCV0cyeVdtUDNiM043?=
 =?utf-8?B?OXVsUjNDeDA0Nk5JVytFQzgrRG1IT2k1S2FRVllvdEdTcGFDV2dsTWgwUWJQ?=
 =?utf-8?B?eThUaXNsbVF0Z1ZOZGFkenArQTJkQTlEUE5lcWZ0Q054dUlNNHNmZTlFbktC?=
 =?utf-8?B?VXBSaEhWWm1GYkVBTmZxRit4SXVvZ1I3dXBJbk44cXZIQnhJZGFmZ3I0K0R4?=
 =?utf-8?B?cFdFZ2o2TnFJb0FOUENnLzVHaDRoN2R0aFlZOGx2VVBhcDU0WkRFSS9ZNjlk?=
 =?utf-8?B?clBXTlpYa2wvT09PWm9qMWMvL1RHNVJLeWpBdUhONm9XWWlOVlZNT2pDbkZW?=
 =?utf-8?B?d0hIN1RsQmlPRCtab3FuSlFmc2FVWXZiSkxCaHlOd2dOeFpzQjUyTlNPaVpk?=
 =?utf-8?B?U3N3clc2WWRlYXFiTWNrdmN6QitkR25ZVWdPQ0MxRWorUTJlTWhyU0FGUXVR?=
 =?utf-8?B?V2llM1hHdTVjT1VCY0xyMlpJWU1XdDZZeStYdFB1M29oaUdKN1JsalFNdGt3?=
 =?utf-8?B?STdiWjR1K2FZdEdUSlNFUDlTeUxtcUVXU3B4WEtrdHpqQzk1Ykl0UVZ0cGpX?=
 =?utf-8?B?UjhUT0xaSFFYV1o4UjZqMS9XL3ZrMUlGYTB1NGQ2eG5YUkpNNnk5d2tUejAw?=
 =?utf-8?B?TUg3WXdvUW5PSGpBMm9IMUFySEdBRDNxOWJpSmVYRWlFcWl5WlV1dTdPcGJO?=
 =?utf-8?B?dkNRU3BCTzI2S0I4bzV6WU1iSmZId3p3KzBYZDVUODNmdk9xMEIxSG9UUWNQ?=
 =?utf-8?B?RDJtSExOYjdWV3VOYzRMS2tVSEpzNGZIK05uUytKT2NhUlBjZXBCK2EyOHRq?=
 =?utf-8?B?ZXA3ZUVBRXM3SnVXVENsVkF5QkIycFJ2eGxrSmZIM3JVZ3BubjQvNjloVzVq?=
 =?utf-8?B?ZnFJR2xaVFp3LzFHdlFPWnByWHlkUTFIcFFSR2lyNldPVXFIS2lVT3M3ZEY0?=
 =?utf-8?B?SDYrdlN2VmdVcmhKMWV2OGlxMHR6czVaZXZ6S1JzMnNZYU1laUYzUUJobktp?=
 =?utf-8?B?SVhBNjNYUUl5TEtEd3ZLOVF4emRFRzhtc2lQcmgzV1dNcXE1WjBPZllnWEEx?=
 =?utf-8?B?UlNlcVdZTjM3dHBjc0dCV2Q2UVkzdTNlcjRsbnpHWXNKdFNmWXowRVBha0pY?=
 =?utf-8?B?ZVp3ZE1VMkJTUkNwM0pFUVlpNlRTOWJCSng5U0hPNXFuUnUvV0RIZzNNZjFi?=
 =?utf-8?B?TzdUQ2J5Q3VheWwydlJ6aThMZ0llempLSEx6cVVuaVcxclorbU0xV09qZXVR?=
 =?utf-8?B?cmNidnNmd1pWazkyWm5Wb1NPbTc0WW1OTDNBODV5a2NWQkdKWnlWb0c2RDc2?=
 =?utf-8?B?M1oxZ081Z0xsV24vTWREODMxVU5aS3p2Y0ZmTDRva0d2MTdQM3d3THJueFZ1?=
 =?utf-8?B?OFBpREx0TmVTVjBadmRROGVFTTJXd0REOFk1b2R4dktTQ2FBeUxGbGNNNXYx?=
 =?utf-8?B?eUpHd01xNFRVV1hWc3R5MmJadFJKemVGeWZpYU5XZnJvVGZhWW8wYXlmZUpU?=
 =?utf-8?B?TUMwd29ac1NKODlWSVZ1YkRoOTlBTlVIc1VNcHJSbjdUZVZDVXZvNzJrckRZ?=
 =?utf-8?B?djk5L1d6VTEzVXZEVUxoWGc0a3U5bGpuU0c2b1FJNFJaV3hCWnE0UHRvNVBV?=
 =?utf-8?B?WWFNUnlLNW9ua2RtSk1XNTE0a21ndkNVVWd0ZGFua21Oa0xHdW9wWnVXR3hL?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a9d71a-9c9a-4745-dcea-08da5f7770f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:46:23.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy6WMsCyt4H5pT+Ci7FQy3D0WYE4mgTceFnLtcHpDLkRXn0UAwhgWFlkb3OP1oI1FM/Qf7ILIIi54ZLhq7xYwVGIfwqzuieMocgz//zl7/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1476
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_09:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060071
X-Proofpoint-GUID: jfqwvwC_YGy43hOzzcgExcilwi7X5juo
X-Proofpoint-ORIG-GUID: jfqwvwC_YGy43hOzzcgExcilwi7X5juo
Received-SPF: permerror client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/29/2022 4:43 PM, Alex Williamson wrote:
> On Wed, 15 Jun 2022 07:52:16 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
>> follows:
>>   pin : Recover this from the vfio config in kernel space
>>   interrupt : Preserve its eventfd descriptor across exec.
>>   unmask : Ditto
>>   route.irq : This could perhaps be recovered in vfio_pci_post_load by
>>     calling pci_device_route_intx_to_irq(pin), whose implementation reads
>>     config space for a bridge device such as ich9.  However, there is no
>>     guarantee that the bridge vmstate is read before vfio vmstate.  Rather
>>     than fiddling with MigrationPriority for vmstate handlers, explicitly
>>     save route.irq in vfio vmstate.
>>   pending : save in vfio vmstate.
>>   mmap_timeout, mmap_timer : Re-initialize
>>   bool kvm_accel : Re-initialize
>>
>> In vfio_realize, defer calling vfio_intx_enable until the vmstate
>> is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
>> vfio_intx_kvm_enable to skip vfio initialization, but still perform
>> kvm initialization.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/vfio/pci.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
>>  1 file changed, 83 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 2fd7121..b8aee91 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -173,14 +173,45 @@ static void vfio_intx_eoi(VFIODevice *vbasedev)
>>      vfio_unmask_single_irqindex(vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
>>  }
>>  
>> +#ifdef CONFIG_KVM
>> +static bool vfio_no_kvm_intx(VFIOPCIDevice *vdev)
>> +{
>> +    return vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
>> +           vdev->intx.route.mode != PCI_INTX_ENABLED ||
>> +           !kvm_resamplefds_enabled();
>> +}
>> +#endif
>> +
>> +static void vfio_intx_reenable_kvm(VFIOPCIDevice *vdev, Error **errp)
>> +{
>> +#ifdef CONFIG_KVM
>> +    if (vfio_no_kvm_intx(vdev)) {
>> +        return;
>> +    }
>> +
>> +    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
>> +        error_setg(errp, "vfio_notifier_init intx-unmask failed");
>> +        return;
>> +    }
>> +
>> +    if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
>> +                                           &vdev->intx.interrupt,
>> +                                           &vdev->intx.unmask,
>> +                                           vdev->intx.route.irq)) {
>> +        error_setg_errno(errp, errno, "failed to setup resample irqfd");
> 
> 
> Does not unwind with vfio_notifier_cleanup().  This also exactly
> duplicates code in vfio_intx_enable_kvm(), which suggests it needs
> further refactoring to a common helper.

I will delete vfio_intx_reenable_kvm and add conditionals to vfio_intx_enable_kvm.
That looks better.

>> +        return;
>> +    }
>> +
>> +    vdev->intx.kvm_accel = true;
>> +#endif
>> +}
>> +
>>  static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
>>  {
>>  #ifdef CONFIG_KVM
>>      int irq_fd = event_notifier_get_fd(&vdev->intx.interrupt);
>>  
>> -    if (vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
>> -        vdev->intx.route.mode != PCI_INTX_ENABLED ||
>> -        !kvm_resamplefds_enabled()) {
>> +    if (vfio_no_kvm_intx(vdev)) {
>>          return;
>>      }
>>  
>> @@ -328,7 +359,13 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>>          return 0;
>>      }
>>  
>> -    vfio_disable_interrupts(vdev);
>> +    /*
>> +     * Do not alter interrupt state during vfio_realize and cpr-load.  The
>> +     * reused flag is cleared thereafter.
>> +     */
>> +    if (!vdev->vbasedev.reused) {
>> +        vfio_disable_interrupts(vdev);
>> +    }
>>  
>>      vdev->intx.pin = pin - 1; /* Pin A (1) -> irq[0] */
>>      pci_config_set_interrupt_pin(vdev->pdev.config, pin);
>> @@ -353,6 +390,11 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>>      fd = event_notifier_get_fd(&vdev->intx.interrupt);
>>      qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
>>  
>> +    if (vdev->vbasedev.reused) {
>> +        vfio_intx_reenable_kvm(vdev, &err);
>> +        goto finish;
>> +    }
>> +
> 
> This only jumps over the vfio_set_irq_signaling() and
> vfio_intx_enable_kvm(), largely replacing the latter with chunks of
> code taken from it.  Doesn't seem like the right factoring.
Cleaned up in the next version.

>>      if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
>>                                 VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
>>          qemu_set_fd_handler(fd, NULL, NULL, vdev);
>> @@ -365,6 +407,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>>          warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>>      }
>>  
>> +finish:
>>      vdev->interrupt = VFIO_INT_INTx;
>>  
>>      trace_vfio_intx_enable(vdev->vbasedev.name);
>> @@ -3195,9 +3238,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>                                               vfio_intx_routing_notifier);
>>          vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
>>          kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
>> -        ret = vfio_intx_enable(vdev, errp);
>> -        if (ret) {
>> -            goto out_deregister;
>> +
>> +        /* Wait until cpr-load reads intx routing data to enable */
>> +        if (!vdev->vbasedev.reused) {
>> +            ret = vfio_intx_enable(vdev, errp);
>> +            if (ret) {
>> +                goto out_deregister;
>> +            }
>>          }
>>      }
>>  
>> @@ -3474,6 +3521,7 @@ static int vfio_pci_post_load(void *opaque, int version_id)
>>      VFIOPCIDevice *vdev = opaque;
>>      PCIDevice *pdev = &vdev->pdev;
>>      int nr_vectors;
>> +    int ret = 0;
>>  
>>      if (msix_enabled(pdev)) {
>>          msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
>> @@ -3486,10 +3534,35 @@ static int vfio_pci_post_load(void *opaque, int version_id)
>>          vfio_claim_vectors(vdev, nr_vectors, false);
>>  
>>      } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>> -        assert(0);      /* completed in a subsequent patch */
>> +        Error *err = 0;
>> +        ret = vfio_intx_enable(vdev, &err);
>> +        if (ret) {
>> +            error_report_err(err);
>> +        }
>>      }
>>  
>> -    return 0;
>> +    return ret;
>> +}
>> +
>> +static const VMStateDescription vfio_intx_vmstate = {
>> +    .name = "vfio-intx",
>> +    .unmigratable = 1,
> 
> 
> unmigratable-vmstates-to-interfere-with-migration+
A bug, will delete.

- Steve
 
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_BOOL(pending, VFIOINTx),
>> +        VMSTATE_UINT32(route.mode, VFIOINTx),
>> +        VMSTATE_INT32(route.irq, VFIOINTx),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +#define VMSTATE_VFIO_INTX(_field, _state) {                         \
>> +    .name       = (stringify(_field)),                              \
>> +    .size       = sizeof(VFIOINTx),                                 \
>> +    .vmsd       = &vfio_intx_vmstate,                               \
>> +    .flags      = VMS_STRUCT,                                       \
>> +    .offset     = vmstate_offset_value(_state, _field, VFIOINTx),   \
>>  }
>>  
>>  static bool vfio_pci_needed(void *opaque)
>> @@ -3509,6 +3582,7 @@ static const VMStateDescription vfio_pci_vmstate = {
>>      .fields = (VMStateField[]) {
>>          VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
>>          VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
>> +        VMSTATE_VFIO_INTX(intx, VFIOPCIDevice),
>>          VMSTATE_END_OF_LIST()
>>      }
>>  };
> 

