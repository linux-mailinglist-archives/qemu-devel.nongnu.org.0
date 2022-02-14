Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1B4B5A82
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:21:50 +0100 (CET)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJguz-0006KP-2U
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:21:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nJgSc-0003Ky-8e
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:52:31 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nJgSY-0005Xn-VD
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:52:29 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EIMxO0016394; 
 Mon, 14 Feb 2022 18:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=SCfpAUV3uWqi2kqu39oqav/9HEtA5Mdwd9h7jtlk7rQ=;
 b=w5NW0202udAWdsGx7HpGRZn4CDcKAVc71zN8WUL/uFSBD2/qehTTLv25hm4A6bFX0ux4
 9nJb6WR4ACCQEvYozYrHzromscJm2/1QRmljRFZqUCMsHszTT4YzepxUlstprOsKZg8I
 vZgXjQLQhNlVld0gZLrkQAxBNm6gApuW+ztVPiW/Li+DPjOAxsOkdOayrahfiVizZa9M
 kcV3BjJxluA+LqAfuoiwDX9tb0ozcA/p0ZkhE2H+kpSUjo3AJd22AV1nFwf59lfbuC+P
 JSu38wU3OoeFvQFe+73V332k73KE+lxxiQGz13RsQFLigG6SEiRinz+VML+FZe+PiqYo jA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e64gt5g08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 18:51:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EIjHZ9016764;
 Mon, 14 Feb 2022 18:51:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3020.oracle.com with ESMTP id 3e66bmht28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 18:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/KPScEDpfoTAPM/hxeZj57lF/zPEu+6Ctw8NeJDbzPYZD7CLENgX4vPUqkDMUbXsC70NDzn8eFG42wyVCS9YhVZy9ZikfgDEsDlUAoMVb27q8O1Y8wRLItH8ZPbdrduqSvBvTGeWfxokCZjb9ZrOFKl8be/QKIRbNgZbWnBNKMEzJuO+ZSdPSXaP1Inv1EXKHx7RcZGUNOwEOtoiUrP3Nf+suRZq4d6lpTSSn6huFk1ussQ1PoIW5hUez43ElUgkicJR44B2YTGq7ELm2jaW92GCgotRJ0GiXoYxnXP6h4Tut0YK5VO6BA9OIakYtvzBvMENPdUKQTMXmtaq7mrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCfpAUV3uWqi2kqu39oqav/9HEtA5Mdwd9h7jtlk7rQ=;
 b=O2hkGx0YnGCAvqx7//o7Z+XMAv9iToVTKy2YbYtLJOCpW8n9cK6zO1u00DFVVPdsjEujC7RzvrxmcHAW1L+op0u8ZWvlCfVsHfX6JIXYW6Ch1joQOGFKFer5ZUuYQq1kmXsVrukyoBylI5c0UstJ0/jTCVazTXvC8MzhH6pMbd9l5wTlN6nYv8QdbmejHrcVUaE2I1FJgkHjhvGmew1Vat+6MOlzbSYItChm3NXBbVvqLPhvsXqTUYnFATURoOrKEqdTIX3Sv20vCGsNTa0SwQgMMiEOQrccJ5wLfAF4Co5Z2rBQ7nYhVl8447YfAY90Mwb3Uzm/jT1NoVwEH66KmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCfpAUV3uWqi2kqu39oqav/9HEtA5Mdwd9h7jtlk7rQ=;
 b=BnysGQ5EfA7cq9sZOI61dBI6PdiaR2M9aHasF0PrRMcHG4/kEbumcrYbDtf3698cDOhLskPgyaZNp3Zzdb31wd20g34cWYlAmtyShGc/CaCpExRjfkU3LdaerFv9UBsFOyyLF5f9IgoYacwCxPT9diohz+q3DDZ/JjPytS/79xM=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by PH0PR10MB4533.namprd10.prod.outlook.com (2603:10b6:510:39::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 18:51:16 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::8c4f:1ada:aaf9:312]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::8c4f:1ada:aaf9:312%6]) with mapi id 15.20.4951.021; Mon, 14 Feb 2022
 18:50:26 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [RFC v4 20/21] vfio-user: migration support
Thread-Topic: [RFC v4 20/21] vfio-user: migration support
Thread-Index: AQHYA/14qd8G/WvJwUOVlAyagyKUkqyOj0aAgAUQNAA=
Date: Mon, 14 Feb 2022 18:50:26 +0000
Message-ID: <A837B04D-911A-4E62-86FF-760DBCE4462B@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <27b636c6c861e0a05278e2d1cbf07d3adec2d505.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB800573717D16BE0BDD1DBB8D8B309@DM8PR02MB8005.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB800573717D16BE0BDD1DBB8D8B309@DM8PR02MB8005.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1655fd34-47b8-4288-cbb5-08d9efeadd65
x-ms-traffictypediagnostic: PH0PR10MB4533:EE_
x-microsoft-antispam-prvs: <PH0PR10MB45335DCE1BF9FA0783F8919BB6339@PH0PR10MB4533.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S142aWnVRci7Y8eN1jFyw7rZ0juxAGjutt37ViVMBR6b6BlJEc4rTgrNfb4NDhE8u2PO0eDkSFVeFvt6IXJZ2jJNOfIEz5JWoITllqPXReI8C8+FDTujxi7xEymX9DzUyn9YTvCdhfjs6e9Yqd097eK04A+YL5WdRyhw42Q091JSCDsawyUPoefVXFXQJZ8b3QzwL24H6OB1Ddc/McVBjZ3pZk6E+u5Nji6rjINGvqrCftMKCnJRiXv39tpou1PusFA4TO7KFWYu7Rtgyj7buhQZMRca2VzsiLrEMMIs9eDHbHNpubwsPsSx5m4XWxOP1w6bsL5nwLZHaE8HYYNiGr8kdrNetA9UR6CZt/26IxvpNOfxqR8vcSP8dJwaHyWo8ScajgV6ieT9bTst7iNE86jDbSVo3dHFzHr0y2anH+YfHJbgS8DrAfrDyfvnCOkJe39zERvukbs2JdsdHshxG3cUqGIJMemOo9ccvRFsPkVOgqzhcVk2HxPp0ah52AidO7x6lOCPifluYtQlOvtBb4dYGF1JTnPwfVeWLkeSaIeB8WUyo37nmBEGv6KO7qNnV0MAeLGbVCf1PCU8R/nlVTQgZR7FlcS8hPkyNbLHbJfn4vIKPiTjjoDKiA6JEOxBJL+Zz5ZCIseigWG/3/sV+cR/5Xr55CXEufG4jJTjd/+RvVSC+/BeMYBVkLCViwS1mrPk4FJxFruut8n5pdLcLln7y4NblaXrr9sf8UyUtfMUN90R+I1qK6boUTIK/OpU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(5660300002)(36756003)(86362001)(26005)(186003)(2616005)(38100700002)(38070700005)(71200400001)(76116006)(8936002)(66446008)(316002)(4326008)(66476007)(64756008)(66556008)(66946007)(8676002)(83380400001)(296002)(508600001)(6486002)(6512007)(122000001)(53546011)(33656002)(6506007)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm5NT3lleTh2elVja1FpZ1RzRURLUmsycUZscEtYUXdyL0VjRnFSY2JVR3Nx?=
 =?utf-8?B?NThpUk9KWnZ6YnJma0cvbXB1TzNmT2RVUVdUeG92aXNteHRtcjBpSExlbG1J?=
 =?utf-8?B?QlUrVm1oOVd6L3U1NFJxRkhtUEV5MExoWDNQK0dBS1NLQTYwQVlFbzU0d0pK?=
 =?utf-8?B?NE1QdVFuV1JEc1V5OHp0NVVEaldxbHE5YVY2M25GU3IxcHRFVWF4K3MxamZN?=
 =?utf-8?B?OXlaWVVWdkFkSlcvRTJsSWZMclB3VGs2eU9MbFNsWUU2dHlKLy9vdjNBK1pQ?=
 =?utf-8?B?ZzdzWkJxRzQ0bXNOOFVwNUhjeEJSTTdmS3FUbXpGYUR2NlZxRTA2U2ttT1RJ?=
 =?utf-8?B?K0xsYnU2NFhkNFU0VTVyc0hHRDR4OTEwdTdpaGJCZ0YvblVMR01zL21jS21h?=
 =?utf-8?B?MDVFMUdDMjBoUm5yUERleGNyTzJhL1hmS3dqKzEySUc1cXZraWRCRmpPSk15?=
 =?utf-8?B?L3JPdjljOU94VUtxUHdEc0tsM1dnUHNGWXJKK0hFSTNxbFFwMTl2b0tFMWtr?=
 =?utf-8?B?aisyRG1kMFJyM1RMTXhjMHQ0NFRFdjhXWVVnMVdJblFGSUo2OXV3UFArMnJX?=
 =?utf-8?B?MkxOUW91NUdMUHFqMWpJaGhjN0t1RVl0UmNRL1BCMS9XQ1VyaUVXMU9ZN2Vk?=
 =?utf-8?B?ZWtPUXVhcDl4K0Q0QkFXakl6YUVjeXkxZjkxWmJvbkZTWlA5TW1GSTE0aGU4?=
 =?utf-8?B?SEQ4WXRrVlJkdDZ3VjJ3bzVYazVLeEd4aGVvSENuVmNPRDJsMzFJMTJJWUxo?=
 =?utf-8?B?ejI5THYrQkEzcllPODVHWGVoYnRjT2NVOUF2RjBUbXQ3ZGRkbjJ5a0I3c0xF?=
 =?utf-8?B?ZGpXT3I1TDUzczZYMDIybXJ1NE1Nc0tSQ3pxeWprMlBjUTJMdW1jR3ZFU1JS?=
 =?utf-8?B?T3N4RTIrdWpDR1prTHlzd2tyWnFXSmtJcjV2R0NyUnFRcitXdENEZHRTNUdZ?=
 =?utf-8?B?OFNRWXkxRWVCV0lsSHV6Tzd5OUFaL2VheXpEK1FnK3hmSkhjY0k5eWt1RlNL?=
 =?utf-8?B?enFlREt6Tk1ZUDVBT3RvbmsvOURaN0tvSHVQTGlRbk9PQm10ZFlHeVFHckpt?=
 =?utf-8?B?Y0U2S1R0U0FrYlM2b2NOWHpUTTh0ZnQ0VDVkUm9BNjNOSDA5dnBPZ09kMDlr?=
 =?utf-8?B?dm9KZTlWS3c1c29lL1dxeVJDZkd3Uk84eHZFTmNwakFUOVltMnBJbFdNMFUy?=
 =?utf-8?B?TERJZy8vZlE5ZjR6Q2RRZ0VTVVFWdWJpSVBrbG9vZGV0VU16dGM5NjJhMzFN?=
 =?utf-8?B?ZFNvVkRRNFpPbTZEY2F0SWczd29RVlp5aWJyZFhqVysyczJza3NHaklRT0ZW?=
 =?utf-8?B?THVjaUNNNUcvNDdibXMrMkRyVUlpWjhoN2JzY210N25GTmZRMUhJWEN5SUds?=
 =?utf-8?B?QXUzQThRS2lnVHl2ekFkTy91dTBPaFdyWXVidHN2aWJiK01pbXJYQ3BCcVV5?=
 =?utf-8?B?cVM3cGFzZmliRURrMWNSdUFVbkVGOVBOZHlnN215YVNQUTA1Q2ZDYy9oaHJC?=
 =?utf-8?B?enhvdzJ3Ym5RdXdDazc1QmptSlZJTFBIQ1kzTlBJZS9hS0JLNktUbGZWTnpQ?=
 =?utf-8?B?ZmdoY0Q1QXBXQ05MRVdrNnI1TGxPNllzTEVrZjQxYitGWW01ZStTcmhSYkNq?=
 =?utf-8?B?LzQ0ZG56QW0yYndvVWhsMkc3akpWK3hJNjRGRm5zNjNTYm5LQW0rcGpuZFBN?=
 =?utf-8?B?WFJNZW96NGNNRU9NMU93Tmp5a21ncHdabCtJQXpDdFk3WFIwbmNzbXdybXh6?=
 =?utf-8?B?enJCa3pzWEZQQkpEdzJnUUxYL0RNOFBKMnVhYmgwU1creVR5YVg3QWwwYlY4?=
 =?utf-8?B?Zll3NTMxNmZYempJUjQ4UGtETUU0SFRXMmVMK2FHVVZ0M0VnTmpaWnJxOHZz?=
 =?utf-8?B?TXFQUEg0ZnFwRVhDRmxjaUMxd2VXK3V1Y3VucElEWUlJcHZKaGtKUC9Xa3lN?=
 =?utf-8?B?MWhZdW5iOVhqNktuNUp1UEkrR0YxTi8yZG40djhtMEdBb3U5VU9ISUFESHdm?=
 =?utf-8?B?UVl1aTFvcHZydWZFUi9qcVpaalZETlhVOFpTMFNVNXJDZ2NuTGUvU2pWdktH?=
 =?utf-8?B?Wk5mWWRCSktBNDJhQkFvblpVOW1YTDQwMW1vdlJwSVJ1SVVGZHdvZy9wQmhX?=
 =?utf-8?B?dEVpaVJkaG9QTTlCRnhYR3lzZnA0N1F1cTRJNWNFQVlERXc4a2lhSGkwMlNU?=
 =?utf-8?B?MXBZWEdnTm95TFN6L3gzb2tKZ2xGaHBqVnVpOUp5K3c3cTR2WmQrQkU4UmxP?=
 =?utf-8?Q?mDX06tBeXdpuKQKeauB4L4okgsSt+aL9ijmBSSwCD8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D550400199F1C548AEFF3103E5E9186C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1655fd34-47b8-4288-cbb5-08d9efeadd65
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 18:50:26.4051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTTd+iCNQ4P+ZmBsWo3yJWl179BiR83np8dMB3+ACPGiGe6f4D8uMUyvjGN/g2Lwkmgv0uABz8RZpXIkwkPdSLqS8vHPjZ5e09yyvwC5hvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4533
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140110
X-Proofpoint-GUID: RFMeJS-0HJgm0iXJSy8vjSND4U9qYg3k
X-Proofpoint-ORIG-GUID: RFMeJS-0HJgm0iXJSy8vjSND4U9qYg3k
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDExLCAyMDIyLCBhdCA1OjMxIEFNLCBUaGFub3MgTWFrYXRvcyA8dGhhbm9z
Lm1ha2F0b3NAbnV0YW5peC5jb20+IHdyb3RlOg0KPiANCj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPj4gRnJvbTogUWVtdS1kZXZlbCA8cWVtdS1kZXZlbC0NCj4+IGJvdW5jZXMr
dGhhbm9zLm1ha2F0b3M9bnV0YW5peC5jb21Abm9uZ251Lm9yZz4gT24gQmVoYWxmIE9mIEpvaG4N
Cj4+IEpvaG5zb24NCj4+IFNlbnQ6IDEyIEphbnVhcnkgMjAyMiAwMDo0NA0KPj4gVG86IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KPj4gU3ViamVjdDogW1JGQyB2NCAyMC8yMV0gdmZpby11c2VyOiBt
aWdyYXRpb24gc3VwcG9ydA0KPj4gDQo+PiANCj4+ICtzdGF0aWMgaW50IHZmaW9fdXNlcl9kaXJ0
eV9iaXRtYXAoVkZJT1Byb3h5ICpwcm94eSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHZmaW9faW9tbXVfdHlwZTFfZGlydHlfYml0bWFwICpjbWQsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2ZmlvX2lvbW11X3R5cGUx
X2RpcnR5X2JpdG1hcF9nZXQNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KmRiaXRtYXApDQo+PiArew0KPj4gKyAgICBnX2F1dG9mcmVlIHN0cnVjdCB7DQo+PiArICAgICAg
ICBWRklPVXNlckRpcnR5UGFnZXMgbXNnOw0KPj4gKyAgICAgICAgVkZJT1VzZXJCaXRtYXBSYW5n
ZSByYW5nZTsNCj4+ICsgICAgfSAqbXNncCA9IE5VTEw7DQo+PiArICAgIGludCBtc2l6ZSwgcnNp
emU7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIElmIGp1c3QgdGhlIGNvbW1hbmQgaXMg
c2VudCwgdGhlIHJldHVybmVkIGJpdG1hcCBpc24ndCBuZWVkZWQuDQo+PiArICAgICAqIFRoZSBi
aXRtYXAgc3RydWN0cyBhcmUgZGlmZmVyZW50IGZyb20gdGhlIGlvY3RsKCkgdmVyc2lvbnMsDQo+
PiArICAgICAqIGlvY3RsKCkgcmV0dXJucyB0aGUgYml0bWFwIGluIGEgbG9jYWwgVkENCj4+ICsg
ICAgICovDQo+PiArICAgIGlmIChkYml0bWFwICE9IE5VTEwpIHsNCj4+ICsgICAgICAgIG1zaXpl
ID0gc2l6ZW9mKCptc2dwKTsNCj4+ICsgICAgICAgIHJzaXplID0gbXNpemUgKyBkYml0bWFwLT5i
aXRtYXAuc2l6ZTsNCj4+ICsgICAgICAgIG1zZ3AgPSBnX21hbGxvYzAocnNpemUpOw0KPj4gKyAg
ICAgICAgbXNncC0+cmFuZ2UuaW92YSA9IGRiaXRtYXAtPmlvdmE7DQo+PiArICAgICAgICBtc2dw
LT5yYW5nZS5zaXplID0gZGJpdG1hcC0+c2l6ZTsNCj4+ICsgICAgICAgIG1zZ3AtPnJhbmdlLmJp
dG1hcC5wZ3NpemUgPSBkYml0bWFwLT5iaXRtYXAucGdzaXplOw0KPj4gKyAgICAgICAgbXNncC0+
cmFuZ2UuYml0bWFwLnNpemUgPSBkYml0bWFwLT5iaXRtYXAuc2l6ZTsNCj4+ICsgICAgfSBlbHNl
IHsNCj4+ICsgICAgICAgIG1zaXplID0gcnNpemUgPSBzaXplb2YoVkZJT1VzZXJEaXJ0eVBhZ2Vz
KTsNCj4+ICsgICAgICAgIG1zZ3AgPSBnX21hbGxvYzAocnNpemUpOw0KPj4gKyAgICB9DQo+PiAr
DQo+PiArICAgIHZmaW9fdXNlcl9yZXF1ZXN0X21zZygmbXNncC0+bXNnLmhkciwgVkZJT19VU0VS
X0RJUlRZX1BBR0VTLCBtc2l6ZSwNCj4+IDApOw0KPj4gKyAgICBtc2dwLT5tc2cuYXJnc3ogPSBy
c2l6ZSAtIHNpemVvZihWRklPVXNlckhkcik7DQo+PiArICAgIG1zZ3AtPm1zZy5mbGFncyA9IGNt
ZC0+ZmxhZ3M7DQo+PiArDQo+PiArICAgIHZmaW9fdXNlcl9zZW5kX3dhaXQocHJveHksICZtc2dw
LT5tc2cuaGRyLCBOVUxMLCByc2l6ZSwgZmFsc2UpOw0KPj4gKyAgICBpZiAobXNncC0+bXNnLmhk
ci5mbGFncyAmIFZGSU9fVVNFUl9FUlJPUikgew0KPj4gKyAgICAgICAgcmV0dXJuIC1tc2dwLT5t
c2cuaGRyLmVycm9yX3JlcGx5Ow0KPj4gKyAgICB9DQo+IA0KPiBXZSBuZWVkIHRvIGNoZWNrIGFy
Z3N6IGluIHRoZSByZXNwb25zZSwgaW4gd2hpY2ggY2FzZSB0aGUgY2xpZW50IG5lZWRzIHRvIHJl
dHJ5IHdpdGggYSBsYXJnZXIgYXJnc3ouDQo+IA0KDQoJVGhlIGNsaWVudCBuZWVkcyB0byByZXRy
eSBpZiB0aGUgc2VydmVyIHJlcGx5IGNhbiBiZSBsYXJnZXIgdGhhbiB0aGUgY2xpZW50DQpleHBl
Y3RzLCBzdWNoIGFzIEdFVF9SRUdJT05fSU5GTywgd2hlcmUgdGhlIGNsaWVudCBkb2VzbuKAmXQg
a25vdyBob3cgbWFueSBjYXBhYmlsaXRpZXMNCndpbGwgYmUgcmV0dXJuZWQgYSBwcmlvcmkuDQoN
CglJbiB0aGlzIGNhc2UsIGFyZ3N6IGlzIGRlcml2ZWQgZnJvbSBkYml0bWFwLT5iaXRtYXAuc2l6
ZSwgd2hpY2ggd2FzIHNldCBpbg0KdmZpb19nZXRfZGlydHlfYml0bWFwKCkgdG8gYmUgbGFyZ2Ug
ZW5vdWdoIHRvIGNvdmVyIHRoZSBlbnRpcmUgcmFuZ2U6DQoNCnBhZ2VzID0gUkVBTF9IT1NUX1BB
R0VfQUxJR04ocmFuZ2UtPnNpemUpIC8gcWVtdV9yZWFsX2hvc3RfcGFnZV9zaXplOw0KcmFuZ2Ut
PmJpdG1hcC5zaXplID0gUk9VTkRfVVAocGFnZXMsIHNpemVvZihfX3U2NCkgKiBCSVRTX1BFUl9C
WVRFKSAvDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVFNfUEVS
X0JZVEU7DQoNCnNvIEnigJltIG5vdCBzdXJlIHdl4oCZZCBldmVyIHNlZSBhIGNhc2Ugd2hlcmUg
dGhlIHJlcGx5IGlzIGxhcmdlciB0aGFuIGV4cGVjdGVkLg0KDQoJCQkJCQkJCQkJSkoNCg0KDQoN
Cj4+ICsNCj4+ICsgICAgaWYgKGRiaXRtYXAgIT0gTlVMTCkgew0KPj4gKyAgICAgICAgbWVtY3B5
KGRiaXRtYXAtPmJpdG1hcC5kYXRhLCAmbXNncC0+cmFuZ2UuYml0bWFwLmRhdGEsDQo+PiArICAg
ICAgICAgICAgICAgZGJpdG1hcC0+Yml0bWFwLnNpemUpOw0KPj4gKyAgICB9DQo+PiArDQo+PiAr
ICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+IA0KDQo=

