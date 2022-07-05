Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002145676C9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:47:55 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8naU-0007Yw-Hu
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nFV-0001DU-4Y
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:26:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nFT-0002J2-4k
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:26:12 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEVkJ009117;
 Tue, 5 Jul 2022 18:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=SUP32C+rZaJZ7YsimHSLeF1Hyc6eDcoJP7qJfU3ZgQo=;
 b=u3wSgAoT9/nz4RpSLBUgCKKEY48ZqOuQkUfKy119PRteCGHryUlh8OTY/AzboYgRFwTf
 MgxuRSlZyRmtLpuPBwVxfZ/klgpz3+Q7LHrn6AVCepV69K7eEGQI1oM+u+gJhTKjRwwl
 7R76ASb9Y+d0QO0ucM96RFBdtIArfvnZw5El5XLDvbtUKDgq3OOHUc8EWnVnlbKKc3jG
 1YE5LZTzGY8WFFk2fQA26pDYQ41IFeQo+CJ+x5f5d9aJ68ux3kzMeiExi4qtN85sNiSq
 ADZxTlsg+z+/JnY/83vpbqJ0aa6hagPAsdCWF0C1+XnG6n+XQ3KatOzMeYG6mEWT/Pxz cA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2cm0q2v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:25:56 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IBelH034853; Tue, 5 Jul 2022 18:25:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h2cf8pbmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:25:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTUlmpq5R8ByE3u8p+P71Zm+dEK79+0EZ/EUKc90fPKfngTgH+8rv5z1FmX85fItySzZYICKQrJWf3vq+HbirYiApCgJpMEerwI8y57StY/yBU3pDu7cTGoqDdFckxe4ZriQjgTiZSIAVWSaG55dFdhAMGwRpf5zushaovHhF4GFjZUkj9cI6+HoSmQaFYTEB8gcEhxr1pICSyjl+xwt5EYfLtddbi9dfYxMHkBraBqvPaBO30mfgEMx9Sz1XJao8nFE5YRMyQHUat+wlTmwhWHOdkDblpuvHSbn0+HghwV4AiXhY0K4RMJC7TNmXP9yXeEbdr90qf0ZvHEl8ohMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUP32C+rZaJZ7YsimHSLeF1Hyc6eDcoJP7qJfU3ZgQo=;
 b=QlGRUFeQ8CO8C1kp+qG8+kt7MUL6ds3WAE/GWD5Y2nb45TeZT6ItZdlvd5BBIz4V+PrU4QI1CtyY0Js0Y7HrVndtGGpZ2nwFLIVp7a27DiPH8ula9+1x9g6mWRNRvqyB3vG60rIa5lWOhqvao9+vsap1oxnrljavggLKgMEbzf5QNuHGuyVbqxt7t87K+2SptwvBmbn08j2DVoeOgk8FM3tU6SgtW4RZEVrXRyfbYpIVjqxzcCMn4kjWEAFejbEsIAclSHF6N9PmNOyk4GsCtqJpIVXAgfBknzj+f6QoiwUka11Mdss2S5gSBfCMPkTGne+FFmZmEhXg7oewmHIQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUP32C+rZaJZ7YsimHSLeF1Hyc6eDcoJP7qJfU3ZgQo=;
 b=jXB1ZXOj4rp+YSC02mOvs/eIbH0xMOTeR8j59GB2L0TDFmSN14kpb3D+ajwGQaO1Af57d3psajFros+g/EfZDUWkXEkQ3nBaqwBkCeETbuFU+jReuHQkIeNBlgyufvQW3DO3vyzDlTc8ylhoCaMYZxWVLOFkRCFDEewGaWtKrhY=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 18:25:50 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:25:50 +0000
Message-ID: <8c46b020-c8df-95df-cd67-1f6d56db886a@oracle.com>
Date: Tue, 5 Jul 2022 14:25:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V8 02/39] migration: qemu file wrappers
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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
 <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
 <YqtMQFqFR3+b26YO@redhat.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <YqtMQFqFR3+b26YO@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43198c7a-a61b-45d3-b431-08da5eb3c9c2
X-MS-TrafficTypeDiagnostic: MW4PR10MB5809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzKxzf8PKjgCQ8o89/24VZpDYcapRzbzgOCHKW7AmE1m63WwYs/DQzeW3p41X4XwcDF/xQxFR498zMWSOmubL5IP2IEASvjd5ljlhXeVAp6eEECJ2QZWMgfW97zJ0vWP4GbswK4bGY1BMIEoT+xK8KqdUTIHeIKvLc2waigwf589jkzpOOEu/hMTrQ9fakk7SzR/EhjADbGK8ajJxD2BSynWzX1oXGy8DGy7KfR6R1oudFIcmr6n0PyU8fOtJAYNorzcR2/upBhicBJhbVe46sHU4QEnhvV4eB3MOq234eu2DJJcJJEQB2vJte65jQBhdmPK0Oej75PLR7q1d+HbQgSRFO5GNsuweHcCKd6SATIQC5Hkv3TfkoNHowAeNiCs18lZpvskcSoS3/jiefi39PkTxI63fHrIkxdBOoHM4urKntRDJC7LN/eEKH2nUpthY3DenSIe19nC7skpzqBku1aEpuQA1VHfqg+P0Dnmq4fe76IEQ3AXjC0Q+fgn2X95aJ0vV3cJlqw4t4sUUCj6KmwSBpkj1qERBBeLKf9rSJ9HFPfi2r+HMBwgEMsGVuK1QyO+7nSsPa0wj3Mhk5wlopGksEk3flEWcEK2siGN1hSqSlYqyCB0rtsCuOP+taglh0oOc1aq1HUadIej6YQeaWCzfWaL68F02Ns6iP6gvypYAEsybvSUi6DnscZUi++rIooy58d10moHzykyoA3EFA8TN6U+rMPKtdf3fERXegvtxruW9TE6LTwlkbhrz+qvf7K3cuQjI2Iolm8YG7HDOEU1rAN4/EEkFIBbC6JN4YwQ4Jsp+bMVZKVHZvwY/FqycC367akTunGCKjAwX7b5aQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(366004)(376002)(396003)(38100700002)(66556008)(8676002)(66476007)(4326008)(54906003)(66946007)(316002)(86362001)(31696002)(2616005)(6916009)(31686004)(6486002)(41300700001)(6666004)(2906002)(478600001)(36916002)(8936002)(6506007)(44832011)(186003)(53546011)(26005)(5660300002)(6512007)(36756003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFV1VmlBeVZTVUhTT3dSY2Yya1pqaEhzbmN2RDNXZnRGYTNZRFJkdEtPS3Fr?=
 =?utf-8?B?NXprZGt6Q3Zzck9ybWtCSVcyTy9vMEhnaDNCTGlPVEQ2UFpUb3EzR2tNQys0?=
 =?utf-8?B?b3BzRUxqaHRjd0E4VlpOSDVNblNjMk9Wb1VxNGNRZUtObmhSMTRUVjlSRlZZ?=
 =?utf-8?B?OGl5NWM1UXp3T1dLY2N0VjN5MjVYazJCU2xPaDd2Tmp0MzZVald6Yy9xRHhH?=
 =?utf-8?B?eVoyOWJkUi9hdmsrTEFsUDhYcEpUWG1KQzM4MElNRVZTVGh2ekFjbTZMaFFx?=
 =?utf-8?B?UGluN1JURzBXeTUzR2ZndWxXbEFkWnhaemttajNBK05uR2VyY0YyQjFOZzMw?=
 =?utf-8?B?Y3JFTzVtbjFQVGoyWk1GeFo2RHl4bk5nSHpmdHpjemlBNUgvWklXMWRkMmIr?=
 =?utf-8?B?WlZDMnphRzhtZDBsMTZQeHNqQ1JPd2NaUUg2T0c1VmgwQW8vWFVRTzVmRGUy?=
 =?utf-8?B?SmpaR2xITmZYVERBNzV3RnJuR0pHMmtlajF2cEp4M3c3UjNsVXJlRG90UXo3?=
 =?utf-8?B?Z0FJaUt5VGFBbzFySmE4M1hySDRCQUJMdVRBY1dyWjBjenVwTHVBcytVWklz?=
 =?utf-8?B?TlFuMW9vS0h2SFk4TDdrbWlrMHBoTkNZSDlrNUtaZG9LSmhRMWVTKzZwa1E3?=
 =?utf-8?B?Mk5CZTJBRGlBcE9BUHZHNFIrMnBVSkY4cFRpRGhGWDRyTFliUkY1TkVlS3BT?=
 =?utf-8?B?YWozTmFrcXNjZytiT0p6MGU1TEh3K2xqd2QrZU5TdjhDQmdlemo2YnF3SVFN?=
 =?utf-8?B?SGo0bXRhVThLZEJwV1EzWFlIaEN1U0VsN25LVVEyL3RsNnFvMS9hSmp5L3pp?=
 =?utf-8?B?azFhL3JpTkE5RjI3K3FYSVk2bENtWHlqMHBCeXNmOFUxUzNrQmdlRlVhZHFE?=
 =?utf-8?B?Mmo4d0ZKMDhweWdwckw5V1VtMkRwd1d2T0JHcklobndHQzBpYXk5TmVYakJn?=
 =?utf-8?B?WWd2bVBjYmdacDQ3dFRFalBBSlRTZkRWOXpubU12TmZla1BDRUpsWDdOVWx3?=
 =?utf-8?B?THFnSDJocEVNcWRtVW1NeXRhRW1xdzBUWnQzdndsM1pheS85WVJNZW1lOWIr?=
 =?utf-8?B?cUQ3WUNsb1RhUkN3a0JLODd5YVF1eDFoQkFGUVFWeEVYU2t5a3A2VkFrL3FY?=
 =?utf-8?B?a3ZHZVRiMUFkMTU5ekVPT3VRRVcxRGJ1S2V2U2cwaDhqekM2MzBTN1F6RE1L?=
 =?utf-8?B?ZkoraDNJa2RlSHJ0aXRmOUpWMlJlQmlyUDZrYjd0TnppSWlrbUVoOVRQVklG?=
 =?utf-8?B?RnhHN1A1Vkprbm05MFU2SUQzNllxcXpUM3VTQk1MRE81eDF3dDhxdGJKUVls?=
 =?utf-8?B?Z09pTElRZnExbisvV1hwWTBjUFc2aHdURTQ4eUkrajNOTlE1TlJheGhla050?=
 =?utf-8?B?QlQrcGZSRGxRaE1sUHVmSzBpZnlhRnFaQmdvR0k2dXBXQWVSV3dwMU9lazZI?=
 =?utf-8?B?a1JHeitPbjZPN2ZMdythTzhnazdzVGtXdlNBUDZnVkgrOXhOZDJudjVVOURR?=
 =?utf-8?B?ME5IeTJYUys0bWtoYjRaT0RHQWZsM0lnQ3EwZDdJL1RyME16c3ZJM0NIS1Js?=
 =?utf-8?B?OHMzcTRNYjA4cGhROEYwUTlINys3SFIxMXliVlZSakdkWStNZllqdGxxTUpL?=
 =?utf-8?B?dG9XUVRkcll0c2VjaW95TGlsTXRVRUdYdTBqTCtpOUhyUGlSQ3V4OWlIUVE0?=
 =?utf-8?B?aVYzYUE3TTlKV0I5UE02VjdJVTFtdTk0WUVHekhtR0k1TCswcGdBNHhVcjI5?=
 =?utf-8?B?eW1ZaFlXbG9SZlg2SmpJQ0NsU2lkNVl5UlZSUERXZUJKZTFxZnRXTVliK1cr?=
 =?utf-8?B?QTRWZmp6QVBKc2RKbzR2czljcFVqYm5FZ0R4V3hFckNUcFVWZ2lSTHJaY09C?=
 =?utf-8?B?MnVnSW9ralh3d3FOU3ZvbjBpTnJHZEpLQkl5NG52Y3lWVFNUdk5VTHRQUXdB?=
 =?utf-8?B?ZSsrVWpyWmppR0o1SUwxZ2hZTGNTVHBkMEZrSnVoWkxaQUZZdTFFMmdrL05H?=
 =?utf-8?B?U3kxR3h1RXJpak1wVGxGeFhoT3E1Z3lETFpaTHcvRGIzbytQTDNUcjdpZEVX?=
 =?utf-8?B?b0Nqc293dVQ1MjhUTU5Cd1ZTSG0rNXRwMDZpZGI4MGRpaEx3TUplQTRhM1Uw?=
 =?utf-8?B?VTN4M0VhM3RlQ2RvUWdUT3g5cHRJNFp3dHNzNk9mbUdNamM3cmdxRG9RdnFK?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43198c7a-a61b-45d3-b431-08da5eb3c9c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:25:50.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfEwU325aQij0Luovu5BSs6K0N04AtTr8Rb1Pk7vOF+5RoD3golowgt2jHKRTxXSe1+K7PQwuk5R56MCdVkWf+rq+IXi1HzQ2P5azZtEiUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: r_ZAc7Ihe84RZ3J8RqM1s2bWHGEDdWhI
X-Proofpoint-ORIG-GUID: r_ZAc7Ihe84RZ3J8RqM1s2bWHGEDdWhI
Received-SPF: pass client-ip=205.220.165.32;
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

On 6/16/2022 11:29 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 15, 2022 at 07:51:49AM -0700, Steve Sistare wrote:
>> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
>> files and file descriptors.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>>  migration/qemu-file-channel.h |  6 ++++++
>>  2 files changed, 42 insertions(+)
>>
>> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
>> index bb5a575..cc5aebc 100644
>> --- a/migration/qemu-file-channel.c
>> +++ b/migration/qemu-file-channel.c
>> @@ -27,8 +27,10 @@
>>  #include "qemu-file.h"
>>  #include "io/channel-socket.h"
>>  #include "io/channel-tls.h"
>> +#include "io/channel-file.h"
>>  #include "qemu/iov.h"
>>  #include "qemu/yank.h"
>> +#include "qapi/error.h"
>>  #include "yank_functions.h"
>>  
>>  
>> @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>>      object_ref(OBJECT(ioc));
>>      return qemu_fopen_ops(ioc, &channel_output_ops, true);
>>  }
>> +
>> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
>> +                          const char *name, Error **errp)
>> +{
>> +    g_autoptr(QIOChannelFile) fioc = NULL;
>> +    QIOChannel *ioc;
>> +    QEMUFile *f;
>> +
>> +    if (flags & O_RDWR) {
> 
> IIRC, O_RDWR may expand to more than 1 bit, so needs a strict
> equality test
> 
>    if ((flags & O_RDWR) == O_RDWR)

Hmm, on what OS?  No harm if I just do it, but the next reviewer will tell 
me to remove the unnecessary equality test :)

>> +        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported", path);
>> +        return NULL;
>> +    }
>> +
>> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
>> +    if (!fioc) {
>> +        return NULL;
>> +    }
>> +
>> +    ioc = QIO_CHANNEL(fioc);
>> +    qio_channel_set_name(ioc, name);
>> +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
>> +                             qemu_fopen_channel_input(ioc);
>> +    return f;
>> +}
>> +
>> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
>> +{
>> +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
>> +    QIOChannel *ioc = QIO_CHANNEL(fioc);
>> +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
>> +                             qemu_fopen_channel_input(ioc);
>> +    qio_channel_set_name(ioc, name);
>> +    return f;
>> +}
>> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
>> index 0028a09..75fd0ad 100644
>> --- a/migration/qemu-file-channel.h
>> +++ b/migration/qemu-file-channel.h
>> @@ -29,4 +29,10 @@
>>  
>>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
>> +
>> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
>> +                         const char *name, Error **errp);
>> +
>> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);
> 
> Note we used the explicit names "_input" and "_output" in
> the existing methods as they're more readable in the calling
> sides than "true" / "false".
> 
> Similarly we had qemu_open vs qemu_create, so that we don't
> have the ambiguity of whuether 'mode' is needed or not. IOW,
> I'd suggest we have 
> 
>  QEMUFile *qemu_fopen_file_output(const char *path, int mode,
>                                   const char *name, Error **errp);
>  QEMUFile *qemu_fopen_file_input(const char *path,
>                                   const char *name, Error **errp);
> 
>  QEMUFile *qemu_fopen_fd_input(int fd, const char *name);
>  QEMUFile *qemu_fopen_fd_output(int fd, const char *name);

Will do.  I do need the flags argument in the fopen_file calls, though.

- Steve

