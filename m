Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB474B9918
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:17:04 +0100 (CET)
Received: from localhost ([::1]:53272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKa6C-0003vQ-1u
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKa09-0007SQ-Ln
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:10:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:65464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKa07-00072t-3h
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:10:48 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4RBOI010826; 
 Thu, 17 Feb 2022 06:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=D0Fceh9LG80UGiA8RVrzWApvGx53BGErSEVQ5iAfvGE=;
 b=Psz0hm0WyjpsUzD+f3cGakrJyYeigcFIVGVulXFxyItJdGHtpYebG2pbt4BfBmxc8NnZ
 6umYKoTSIrYUpqESO1rv2DTPuXpOv5PzTwpckJUIeNPqX+jgULNhUXEKlYxUdPhXn6AQ
 PwyhWEhaJuIFVzJL2fhX5/FOxpQpx1mxZjjdVEUscFgdlxS/m7dIasI4qKpHCQYT6Qx4
 zF8nkhqhDUh44AwY+2WtjE+5agR+ufGe+74hnjB/7xBYkcXWOF6AJM6sZn92u6Mh1cFk
 tI1I4ZZG9aP5Q+N15C6SifySUF/pWJ6j3ZzOo76JykLYK55rtFBF53S2Mrndg7WonXb4 QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmgy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 06:10:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H66Vfp088965;
 Thu, 17 Feb 2022 06:10:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3020.oracle.com with ESMTP id 3e8n4vg1jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 06:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uuo62zgSP6gumGbOLBt/97i8HqoVz0eSCU2OW71L8Wer9KDteTH22jeTUAgmF8H3Y4zHWPH+Kv72h96n3DV9EKjtZqImzlwBai4HFvZEC72m5OPw8P386LIAc0WC68stUr5+ws0Fwac/nwvb0Dndql3+lkVL0lS6dAo1dtqLR9vBV6tAH0JUSwuPm5iMaVOdmfgJynpuOnsrU80KITUwPRRiqKxZU8U8vTlNDQ6GloqynaYhbuxOhZJvOIJNaO15xE1qh0UXNoEG3cwgmhR2B1rhPm4s0utGz1eGsl34zXni+8wwuOWg2mfI+1oaqH9OzhwTaxKXQXktri3VwA7k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0Fceh9LG80UGiA8RVrzWApvGx53BGErSEVQ5iAfvGE=;
 b=YT3+7jCgjy6/eo6gC9DABQ7OXmfWJ2MR0i9yCVaRQecyBY4qh8TFRy7GkGkcJ+v3MlcaLygZ+X+vQWTnZCae7eqVmQLkZKxV3XHENb1psTPn+JWLiegB6piMxrF2CUq71dEPy2+3Z+9sVOtgZrvo32whSypUmTbP2Ue/wZoAXrFvdar98R7UzWYoGvm5X1dwgGoLFHmyrsQneessLVUGBXfYGToH7JdOBlj8RHvcNXAYIQjLhy+Z042HTsm37J8WYxDVQnk7tlbtXMlLDWnqlGrx1UqMlGQ0lBW4x3TVI9Gxvq0SENS++AqvZ7WVwUGlZFrYiNJUh3GaT6ZM2XV+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0Fceh9LG80UGiA8RVrzWApvGx53BGErSEVQ5iAfvGE=;
 b=AfsoLjpC1HDzHPUjixholmp5+pjDbRIWDQilYpVRAzpC72guLpZwnRbv1JbYZ4d3SlCaewux8AhZgHNehUJoP39LJo6UH9gD2jjnOpMcqPfiTvQ6HrCA6g/MsGqy2uOUoVejOVO3UYrdpVtHmImn530lHhVbg0u6G0kR40o7egA=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3721.namprd10.prod.outlook.com (2603:10b6:5:156::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 06:10:26 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 06:10:26 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 01/18] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v5 01/18] configure, meson: override C compiler for cmake
Thread-Index: AQHYDX1v0+qjGUrncEWV1g3PsztlxKxr59MAgCuHTAA=
Date: Thu, 17 Feb 2022 06:10:26 +0000
Message-ID: <C842C1BD-6409-40A3-922B-2BCDB54456C7@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <139b14d9db775e4fc8755f9974c0b5d593a14d3b.1642626515.git.jag.raman@oracle.com>
 <6714a8f5-ce68-e081-4ae6-08bce0a12c95@redhat.com>
In-Reply-To: <6714a8f5-ce68-e081-4ae6-08bce0a12c95@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3f790c1-a5b2-48fb-27a4-08d9f1dc3105
x-ms-traffictypediagnostic: DM6PR10MB3721:EE_
x-microsoft-antispam-prvs: <DM6PR10MB37211250E2AAE54CC97F40F790369@DM6PR10MB3721.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3xSH7X15rktnpJyynycCObBpb0t642+D+AVAWrJegi1Xcllmea05dng3eyPmyjOpzfftjDTJv8Gr2XLieN5OOY3D3wXKeko4vqvmmyDuboJ6Ek2oTddIwSt16zJsmsOJAaBDymgv4JLeYs931c0rWIl6jG7T9O0+Cq8C51Xu2vSYuL3VXjjfJtQZdeeDStQwtd3oAFqcdxCJ0LAcD92H/jBpSQ4pL97TE28bTTPlB+LTUt7OBYg2hVWOCKFDV2rWNJdo1cxdkKQSll+CpDjVTFNL7ilxXEh5csOemXS5cgrgslEfA0oZ/KDym7SvlGZF3JJvh+TxdMHVMrHe3dfJNjadPXTWwW4CL4bXylp09oLZgihgJ5j7f5c++WpTTx2NldkagMFNi3VBMsPVm3t87a7bLtQYDXjA64Ty6jj2/ysJUwJhxHA9t6Eg4VHYPEJ60nT99dzPNePLP0qfyfr0weLQzFHq4ikLWztDOPdRHy4XM1XmuNrsscdhagzwrDaVNeefIUMZQd+BtTlFG5BFCDRAbjBMTkbtteExr9BAXMIepNRaD0aDus9hkeZYMyZ1JwavF9UKbYaQGOx102SrtSL9XQkkylYxWCleNMnI/09ukKG6wC+CoK8Em0o7PYSu7klG/3ur1dKnILzrmczhlyqvMOiCIbf4pVzPo9mO8ybRHpo5245bl0ttTEM1yZpY+qEMVicktzBBMJDuUHCs4wVMgifg4ZF68W++hJiiU/M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(38070700005)(38100700002)(5660300002)(33656002)(7416002)(36756003)(44832011)(2906002)(66476007)(6916009)(66946007)(76116006)(8676002)(8936002)(316002)(91956017)(64756008)(66556008)(508600001)(66446008)(6506007)(53546011)(186003)(6512007)(71200400001)(2616005)(122000001)(86362001)(6486002)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTQzNHI2TW1pc1ppbS9GRmU0ZDFGODRtbVg3VUdXNUw2YlFRcnpzVVFmTkk1?=
 =?utf-8?B?NlJFNzA4UUtoTUNFZEorM2FrUnBNL0JqdU83ODVJd1VDTTJibUxmWkJwUDkv?=
 =?utf-8?B?czlHcnp4UC9UVng2eVlXKzdMWkUycW5DSHBvVWVpVm5wNURpTHR4enc4L25M?=
 =?utf-8?B?L1lhNzhITmwybjZsbEdzcGFrMDRWN2dRNE5Lb0NESE9Hc2JaNldXNlVyRHNt?=
 =?utf-8?B?K3pxMm9LS21ucU82NjY5YXBHdkhmRTRvYmdyV2RKcGJ3VjlGM3p5UXVFM0dZ?=
 =?utf-8?B?U1BrNUVNdlR3ajc4TkUzMU1DZ0x0UlhlbEdmSGVnK0Q3ZmtScVdhRTZPUDBF?=
 =?utf-8?B?blhPeVF2clJVaTVsVlR4dVpKeUJjTzlWSUZTNjJDTXpnb3VjVkQ3Q1k2Z1Z6?=
 =?utf-8?B?dEN3eGNtdndsdHBJZUFaeEJVUFRWdk12WXNkVnVEZnpBMkpqWGwzdng0ODJ5?=
 =?utf-8?B?V21xR1FmenY2RmJ4WFlGdURaLzFXWUNLSzBBK1lrWlAwT3Y2OVZNMFd2YzVL?=
 =?utf-8?B?eG5EcHFlbWVRQlV5Rk93ZkpVVm9pRUR5L2V5TW0xZU5QKzhERTZOcENYZVpG?=
 =?utf-8?B?MG9kWVlWaGpyRDAzaWtPOHBQakI2YVJySkRneDhWS1pvYm94K2ZnWk9RVGgx?=
 =?utf-8?B?aUNneHVqaVZGQnlWeUN4WTdUb2JHYVF3YklaRVJzZGhWQS9zdEVxRk1UcXUy?=
 =?utf-8?B?Z1hVVGttc2pFYnJTbGRPNVpQTkh1Y2dDQXVWTU9jWkw0WEp3blpqVFVUSnRT?=
 =?utf-8?B?eEhEVWxnc2dwNnhMNWR4MWZPK0o3VTE1bm5SRkxsTGtPMzhCRGdVNE1LRjJL?=
 =?utf-8?B?NHZRUGdlUzcwNEJVRitHMng4M2tMQjZUUXNsVEhJR1ZFbzZzaVllNDU0bWMz?=
 =?utf-8?B?ejhVUEIzYWpLOW4zS0NtWmtPcnc1YkhrYTdsbTJZUDlpWTF5Mktra1hDcS9h?=
 =?utf-8?B?S0YxcEhqSm9sM0hzYW9HOVdnZHFlL2l5Vk1idzU1MFh6VkVqai9ZUnVuTjF1?=
 =?utf-8?B?SUFQS0srZC9rVlBWajQ3bzBGbmRhM1ExM05jallxVU80RXNKNE43SWFROUtu?=
 =?utf-8?B?TlVjSXFISFFlR3NMOWJFbjBPOTJJYXRJOTJkcXRzbTRtZ1F5Uk4zWVA2clFa?=
 =?utf-8?B?TnIyMFRmRjNhRk1kWDdXTFBCTktOQnRzQ2ZBOGZiSWNsTXpMU3JqMHpkR014?=
 =?utf-8?B?ZFlqNlJoMFpSeEkrMk9mc3ZwRllZb2YvcHYxc3hSSHVrNE80SEdpbUN1SFd3?=
 =?utf-8?B?eWVMQ09xNUNlcno4eVlBOXlHRVNkTHZOb09hMmZEd0pqdlpBa0ZoKzJCSEsx?=
 =?utf-8?B?cnY3Vm1LbGp2clROYUFuMWs1OWFjZUFpTEVmdGlKaHZGUURtVXVTWXVWdWxL?=
 =?utf-8?B?WDMrcTZ5cVFGd3cwbG9keTRyOTA4R045ZDNsOWhuaU1nakdGRTJyd0NITVFE?=
 =?utf-8?B?SGp5ZjJnUk5GYzJob0JJaGNFblFPcmtiVHBKSElEMkhXU1JGcm14elM3ZG5Q?=
 =?utf-8?B?S3JrK1FiSHlKMUJhUlh5VllSbnRHNnlFZzcwUnVHNUxwRTFqelkzS3ZETlp6?=
 =?utf-8?B?ZjA0SzdMR0V6cWZzb3lTNjg4L0daeEhtVkZRajRiMEpvS045cEI3NGpkSnJ0?=
 =?utf-8?B?RHUvVXVwNjUxNGRZZ1BpVnF1TXZ5WGM5ZmJjbEVuUk8zSzZKbXJhOXlMcVBh?=
 =?utf-8?B?OU1vc2JSVnBKMjhrMnRXcEptanpUWG85bEYxSnpQeW5GMnBBNGtFbXJGaVha?=
 =?utf-8?B?WVlZL3liaDB6cjhPM2txYlIwazk4ZEtVTnlla1BDVW13ZVJER2tkcHdhaWx5?=
 =?utf-8?B?STNVbVdwLytnbnFDbmFLdG5ONERkcXVwOUUvelNOMmJJUzNjKy9DNTVjTU5N?=
 =?utf-8?B?ZjZjNExBemwxekNCNFBwUW5WQUF2MlNUV25SaEk2bEtkTkZQaHZndjNIVnBi?=
 =?utf-8?B?LzdOVUthbk5uVWUvLzRUd1lqSG9RVXNSdzF1eDA4S1ZFcXQxTjRwMjUzS3JN?=
 =?utf-8?B?Z3MzOEtMclpKUE01c3JRV3ZuZE16WCt2NjBjb21qRUEwdWxzV2ttL05WZ3h1?=
 =?utf-8?B?YXJKbWdMTStlOHZjS1pzUWZ4NmxHQVdEUlVuUGhZZkJRZDcyakIramZ1dWxa?=
 =?utf-8?B?Qzk3VHg0NExYZkpXUURTS0FRTXJBQjZ4R0RzZnRlOHc0T3pyMEs3eEZMSXJM?=
 =?utf-8?B?aHZZeFlFNmFEbzgwNHQ2R010Zy9FeG9RZ0x5Z2pVQ3NYTnR2RHZZK3pYTEVB?=
 =?utf-8?B?NGlsWmwxTUx6TWhwYlZnbFd1a1pnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F63AF208D21EA4CB6100A7F2F3F9253@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f790c1-a5b2-48fb-27a4-08d9f1dc3105
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 06:10:26.2937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +uaVujZ3YkQpRITDe7v90ZBzs6kO6jZUkeoDn4nQn7bQvJNON9TMHzNfD8d4qGdkL1Wt8CnsNhgUUlBPEmHv/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3721
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170026
X-Proofpoint-ORIG-GUID: BimZA_17HmscqwIwqHnKtUIK3G7NELJX
X-Proofpoint-GUID: BimZA_17HmscqwIwqHnKtUIK3G7NELJX
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDIwLCAyMDIyLCBhdCA4OjI3IEFNLCBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEvMTkvMjIgMjI6NDEsIEphZ2FubmF0aGFu
IFJhbWFuIHdyb3RlOg0KPj4gVGhlIGNvbXBpbGVyIHBhdGggdGhhdCBjbWFrZSBnZXRzIGZyb20g
bWVzb24gaXMgY29ycnVwdGVkLiBJdCByZXN1bHRzIGluDQo+PiB0aGUgZm9sbG93aW5nIGVycm9y
Og0KPj4gfCAtLSBUaGUgQyBjb21waWxlciBpZGVudGlmaWNhdGlvbiBpcyB1bmtub3duDQo+PiB8
IENNYWtlIEVycm9yIGF0IENNYWtlTGlzdHMudHh0OjM1IChwcm9qZWN0KToNCj4+IHwgVGhlIENN
QUtFX0NfQ09NUElMRVI6DQo+PiB8IC9vcHQvcmgvZGV2dG9vbHNldC05L3Jvb3QvYmluL2NjOy1t
NjQ7LW1jeDE2DQo+PiB8IGlzIG5vdCBhIGZ1bGwgcGF0aCB0byBhbiBleGlzdGluZyBjb21waWxl
ciB0b29sLg0KPj4gRXhwbGljaXRseSBzcGVjaWZ5IHRoZSBDIGNvbXBpbGVyIGZvciBjbWFrZSB0
byBhdm9pZCB0aGlzIGVycm9yDQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8
amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiBBY2tlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4NCj4gDQo+IFRoaXMgc2hvdWxkIG5vdCBiZSBuZWVkZWQgYW55bW9yZSwg
YXMgdGhlIGJ1ZyBpbiBNZXNvbiBoYXMgYmVlbiBmaXhlZC4NCg0KSGkgUGFvbG8sDQoNCknigJlt
IGFibGUgdG8gc2VlIHRoZSBidWcgd2l0aCBsYXRlc3QgUUVNVS4gVGhlIGZpeCBkb2VzbuKAmXQg
YXBwZWFyIHRvIGJlDQphdmFpbGFibGUgd2l0aCBtZXNvbiB2ZXJzaW9uIDAuNTkuMywgd2hpY2gg
aXMgd2hhdCBRRU1VIGlzDQpwcmVzZW50bHkgdXNpbmcuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcN
Cg0KPiANCj4gUGFvbG8NCj4gDQo+PiAgY29uZmlndXJlIHwgMiArKw0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCj4+IGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1
cmUNCj4+IGluZGV4IGUxYTMxZmIzMzIuLjZhODY1Zjg3MTMgMTAwNzU1DQo+PiAtLS0gYS9jb25m
aWd1cmUNCj4+ICsrKyBiL2NvbmZpZ3VyZQ0KPj4gQEAgLTM3NDcsNiArMzc0Nyw4IEBAIGlmIHRl
c3QgIiRza2lwX21lc29uIiA9IG5vOyB0aGVuDQo+PiAgICBlY2hvICJjcHBfYXJncyA9IFskKG1l
c29uX3F1b3RlICRDWFhGTEFHUyAkRVhUUkFfQ1hYRkxBR1MpXSIgPj4gJGNyb3NzDQo+PiAgICBl
Y2hvICJjX2xpbmtfYXJncyA9IFskKG1lc29uX3F1b3RlICRDRkxBR1MgJExERkxBR1MgJEVYVFJB
X0NGTEFHUyAkRVhUUkFfTERGTEFHUyldIiA+PiAkY3Jvc3MNCj4+ICAgIGVjaG8gImNwcF9saW5r
X2FyZ3MgPSBbJChtZXNvbl9xdW90ZSAkQ1hYRkxBR1MgJExERkxBR1MgJEVYVFJBX0NYWEZMQUdT
ICRFWFRSQV9MREZMQUdTKV0iID4+ICRjcm9zcw0KPj4gKyAgZWNobyAiW2NtYWtlXSIgPj4gJGNy
b3NzDQo+PiArICBlY2hvICJDTUFLRV9DX0NPTVBJTEVSID0gWyQobWVzb25fcXVvdGUgJGNjICRD
UFVfQ0ZMQUdTKV0iID4+ICRjcm9zcw0KPj4gICAgZWNobyAiW2JpbmFyaWVzXSIgPj4gJGNyb3Nz
DQo+PiAgICBlY2hvICJjID0gWyQobWVzb25fcXVvdGUgJGNjICRDUFVfQ0ZMQUdTKV0iID4+ICRj
cm9zcw0KPj4gICAgdGVzdCAtbiAiJGN4eCIgJiYgZWNobyAiY3BwID0gWyQobWVzb25fcXVvdGUg
JGN4eCAkQ1BVX0NGTEFHUyldIiA+PiAkY3Jvc3MNCj4gDQoNCg==

