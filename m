Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428235FB28A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:39:17 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEXT-00059w-VR
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiD3L-0006tH-QD; Tue, 11 Oct 2022 07:04:05 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiD3C-0003yG-Kw; Tue, 11 Oct 2022 07:04:03 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B8XHjo007972;
 Tue, 11 Oct 2022 11:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=fIuTPy+mVIFx+1OhEB7LM+YTPkr3UthFT/lUf3VA/ig=;
 b=wgDPP3EVRLixqeoPtR9IWFAsRpqUkDoxwhayHNx+kUeMwy+iSorhyHy65rid0cILRKOP
 MjH2hPUqpxGnL3mvaMZY5j+/80SdFqpc/vWqCS7A07fACLKcHvaHV5Om0P1YMM12SPUR
 zPREnMaHDfplSh1YMMvhYWOnYNDXPEtyozKGjecxjst+4nyw0qaxhLeJcqgTuX3M1iUC
 gpaoRP0qJN6dptBU9p8VTGRcigfKrO3ovUWRukJd6SwmW1wuBPKeJxlvxHrUF0xwIvkq
 rcH5R6Ow4egmQXJinz9mbz38xs5h6neSL3YcqEZyoqbixY9QtFeldVTmdH48sRi8fR+r 1g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k2ymcx6ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 11:03:49 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29BAebhq021901; Tue, 11 Oct 2022 11:03:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn4045c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 11:03:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZCK5z83cKPNHPnejWvxDDEScNE1B7aRmPdx1a0BluD2/X30flN1xdxU/ociyOb8iBbNxzg/hzNUc8eVDwIo9/K3Vb2RlJJe5CuOpgrXHkvcIRFc8Af5mSXH9vsC5zhuBmRpGBIMZ5dMEJNWa7E3xppiswT+ERm9O/iGLPJ/yz+vKPSjFueHED2jFJ5fLQKO8I2Ik7oh0lRsvcj46YlgirIAv4OpbRkE9MjgNjvYESbadmkkkRgesae9cmPGq/MO0uCg+l9AVdpjzrXulgEO71MvfoVMM+rD+pXMaokJ+e8kmQlvWrb7d23CV3w2cVDsa4u9GzKeBqIsjilwn0V/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIuTPy+mVIFx+1OhEB7LM+YTPkr3UthFT/lUf3VA/ig=;
 b=W2mEk4pXLfPI/H1UYu+ZShsPeVV3/I1d4lbgDH6zgn4qtqhK0Vku0OLeKh4REuw2QhWouSi0MgQvQIdyotk6XIemyCDHkE/9I4XLC2VZoSbqGugC2LH9+dPnutVq2QGOw/nDt0wWHOqBzstdP57YN9JROz/gNtsM/BWCmS72RUbRx8YgTAhGfegYtRzOf4DkvLwkbpu07eg6Bfchd/YXt+49taMFWSLH66In3JY0bh/I7WIqeC7PDsZoYR5zoACbnh+WeYZiC6FxmCTs6TvT1SBMLdMLUAIffS36MUW6GcAVTaw9n/LqRyl3JfOYkrX5QC1jCbKuDZs7/apKzmeC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIuTPy+mVIFx+1OhEB7LM+YTPkr3UthFT/lUf3VA/ig=;
 b=ZOMvRomkzfy/21L5Eo0gdGXLlBjL84KoArfFYGMl1g5IMrGX3oNUpN3DvqAaTDE5hSs23HueuSTIvCiOu3OX49TJotHfekLVtqL7G34hy+G2fMkSQlMf9askfTE+A36BaDcQnOWFYPk/JSO9dr5C2R8opk+AtsN1L7LrH1m7mMk=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS7PR10MB5165.namprd10.prod.outlook.com (2603:10b6:5:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 11:03:46 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882%6]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 11:03:46 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Ani Sinha <ani@anisinha.ca>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "shannon.zhaosl@gmail.com"
 <shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
Thread-Topic: [RFC PATCH v2 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
Thread-Index: AQHY3KuDqruvVDWBSEG1ZtpPrpFGf64IpAkAgABk4QA=
Date: Tue, 11 Oct 2022 11:03:46 +0000
Message-ID: <6D761DCF-3713-4A16-8253-F2F1212B45C5@oracle.com>
References: <20221010132300.96935-1-miguel.luis@oracle.com>
 <20221010132300.96935-3-miguel.luis@oracle.com>
 <CAARzgwxOxPqAGe76LS-ETpReGrCHvLQjHKvJUJ6AZCmCGMy6tg@mail.gmail.com>
In-Reply-To: <CAARzgwxOxPqAGe76LS-ETpReGrCHvLQjHKvJUJ6AZCmCGMy6tg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|DS7PR10MB5165:EE_
x-ms-office365-filtering-correlation-id: ec30fa61-90f8-4476-baab-08daab784492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +H86xkZZRlWDD5nPRfEx5IzGHM5MwCoBEst79ldZsbVESjFkGieIZjqBwEQht2pKfYK4TlQCyOpKOmWay7lwQ/l8zcQm0vaXibZnRHZ7MTVyYRl9Ued9/48ROAcxatmupR2j7Gq5Dfrk8U4RtEVhorzH/UdgdIK+M3HOiX7nHczGnqIhqmK26FnFi9xnVeDxP8Nlij5hifNE8EV/N8p6mQVRNuIsczAVhZOYhYkSw5GAN5OSjSzDK5LHozA5fPS5pJ9MvDRtTD09YVTARfR4p67JWXSrL2PJSvH1xufH0aLbEHNq0FqPS/TwLdykz9nDD6GgPqArR2/6YtLt09cJPo548Qm951jxbyULwCV2vOSwrTYZ7IgW3xKTE2taOO/TsZjitbL9xUrNSZxw6jNytkOAqedB1UWYg49m1Nb9tWZjSw5hPNMCPP1EVnireZKd12054oDSz9HeEAMRb4UECaNoHfAyhD/jerGalgKcstlatRY+rQXM56xsfodk8mQVFaQDCMCCqzVrvetzr+1N8iyQnNMFdCO6HLKcnZMOKchhJoWAMVEjmjls0C1Bb9jVJR1ske+C+aD4VY6ykFUhFewGain6fyfNhDZqWUcdyYecKCmqVpksovjpFilcbtOpS5bW4Gnj16V0i0+boLon1c4GwIvxbKTXF6+ZAqBOekqoq3rOaLsCCEAczPh37/K2YlrYPsVqJKIhOd603vB2Lkq3MumBDseD+5nkhu0n/jjHtSejsDSqunk6Pr1Jo4DrAiItWoT55Iii2gVdYpwt3lND6V/RCMWwtZ33Eea9fss6rcKPUOf4/OWxnZBK2gAS45kDxH8OFwzAAM8uZcJaEE+Jyr0h/fqPCJeE/8Y5CIY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(36756003)(33656002)(86362001)(83380400001)(5660300002)(38100700002)(122000001)(2616005)(186003)(38070700005)(6512007)(53546011)(6506007)(6486002)(966005)(478600001)(91956017)(54906003)(6916009)(71200400001)(8676002)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8936002)(44832011)(2906002)(41300700001)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmZxYXdVQjJPNDZiRk5MV3ZpMWxWZFFSLzNSUjdZNklDK3NQTGZhOW1OMGQr?=
 =?utf-8?B?bnNVZWQ3d2Q0MzFkaGdHVlJtVzVzaWtaa3lETG9tU09oWWx5RW9qUGp1R0dt?=
 =?utf-8?B?enZkcEJZaWUxNWNpdUFXcVdEZkZaVllRMnJNaXl6OVh4bVJMOFFPaU1Jdkgr?=
 =?utf-8?B?OVlnbHZ1bGM5N2dPV0N0OXQ5MlJPNS9lbENMVUFjMW1raEx2T1M2UVRlK3lP?=
 =?utf-8?B?akdhMlFKRDJJTkV2aTdPdjJjWmM4TTNicUNybkRUempkdVljaGlKRFo2VXJQ?=
 =?utf-8?B?MFNHaHZkNGI1TzhjT0tFb3NkdWQ3bWFLZ1AwVUliTWJIUUdQRjdwcEczMkJZ?=
 =?utf-8?B?UmdQVzhLdytlM2pkejhKYWh4U2VoSnh1WTF1dWQxL1ZWbEc3Titzak9CWEVy?=
 =?utf-8?B?ckVDeFZxY1EzN2hDRmU1YW9DK1RvNmdPUzJzbSt1QnMzV3haQ1B4dWVVL0hN?=
 =?utf-8?B?YWkwUE1jNGtzMVRoamlUenF4STU2S1lWMHlyc1B6bDZuQUIvdDdtR1NLQUR2?=
 =?utf-8?B?QU02bDV6VDlnMDRSN2JNQmg4SzZlTGcxSytaamxrVVFObngwMlZOUXREWnZI?=
 =?utf-8?B?LzQySm5oQ01tK1Z6VXBYeVRabjdhQTNrb0UxRnFUb0JoSzl3WjNCMmprdkFn?=
 =?utf-8?B?N3dMMk54SEVMam81cmFCN3V1VjN3MXNvaFdiNERrSVNTaGpZRTV0SlRuUzVR?=
 =?utf-8?B?dnNqSmNFWVFzUlVRbDU1a3V0TVFYbFRNTUt6WC82SXU2M21sdVpGa1lsSTVv?=
 =?utf-8?B?dUw3VTU4N3pXZS9DTFBtMUFCdXExakRiNE1UYkxHUXVmN2FtdzFKVEpHcEpR?=
 =?utf-8?B?U3VtS0YrREQ4bzZXYkR6NlNweTdHMTVKNHlzcE1RMWxaYkpVRWxnb2g5SlZW?=
 =?utf-8?B?RFpBWkxlY2pDeCtwZ091N01nczlqclBXVnFUT1ZZWEpvMGRZbytiL0JEejYy?=
 =?utf-8?B?a3FNMXh1akloWkpjWFJySkxIRHZiS2NTdnNtSzZTcHpEUGZjYU1NZWJ3NFN6?=
 =?utf-8?B?M1JaNFY3UnJQL2R6L0VTZnhUbVNDTkg2QTFWRmtNdnJpbU9mYjdJYzlPS2d5?=
 =?utf-8?B?ZHhNOWFqSFZWNHVTZXFtb1hxVXN5K2Z0Q2dhSTlWR0o0c0dSbC9UUlRnQjBR?=
 =?utf-8?B?NER5b1hIRU83YVZsOHFJdVk1QStBdjRmMXZGU1NrSDVJbVcyaGhjWmx6ZkhB?=
 =?utf-8?B?R1lqT0NRMEhHQkd4ZFlPc0x6cFlRRHEzYnZuSTdUYXkxVXQvT0o1VlF4WmdC?=
 =?utf-8?B?aWlhaC94dlRiMUhqT2dlNTM5dkpGUWlIZmxyKzdmQmg4bGcxZ0oyRWkvOHZL?=
 =?utf-8?B?TGxxYVR4QkZpaVBWUkpvODYyVjcyNUUzelZVeXBxVEt3WFpkSDNhMlFlcDZC?=
 =?utf-8?B?aFVac3JBTUZzTmIzZUpISzZUM3k1c3RqU2dwVVExbFlBUUJhK0FZYnFnbkdJ?=
 =?utf-8?B?R1I1R0lzTjlSR0xhUUxZU2dVOHFHL3dOVDhaR05pOFpTaldWUlhTbjFuTzR1?=
 =?utf-8?B?RDIxL0R5TGdOL1lKNTJPMlBBOTdGczBWYzRoM01wZW9waGQ0eEo4UlJhRzBi?=
 =?utf-8?B?ckNyL0MxV2lWaFVON1U1RU9IM20rOXMvMVc2YTVCRW40YkswWm0yZE9LcjRp?=
 =?utf-8?B?RVVRcGcvTnZ2VCtCclRreUMwWWthT2llRTZhdTRGN0RHN1p6dmFWZzMwTGdW?=
 =?utf-8?B?SEFkT0x5ZituWGd0VUIvTWx1b0JFVVNjSUVSdnRDMUFONER4TVdBSVVFcWhM?=
 =?utf-8?B?U3E3d3M1WkpaeEs2a2hCbjhRN3ZQZDlKejNmL3Y3M3BtVDlPYWNmV3ZtYjI2?=
 =?utf-8?B?Z0lLWVFvazRMOVFNdTZMd21DNm5wWktsVzArZWI0S0toWW5ZYXl0QmNWMThX?=
 =?utf-8?B?K053TzMxazhvNFFFY3lzY3BXS0dhRVZ1bDYvdUhsQ0FDQTh2UWplYkYySERZ?=
 =?utf-8?B?SkF2ZGkxZi9LYmJrd0pvVkgrK055MDk2NXd2SHM2V0Y4amdDaFVOOVNDVE1l?=
 =?utf-8?B?Z0czb3NncEVQTUk3bXdkN2VidThKL2ZvMkZWWEtmUlhPQjVZRXVZSG40UEZK?=
 =?utf-8?B?RTgrSEFIZjEzSzBIOUhDS0plTUtpOE0yU21BQjdueG4vMU8yeVZnOWE2SFMv?=
 =?utf-8?B?dEFGU2NGOUhTUG1iTG8rN1RzYU4zbExRMlkvUGVaS1hab0tnNHIzK3YwNHpX?=
 =?utf-8?Q?1Y+0bSe5cEl7Ps4JrPy/KFc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D20148755C371F4194CED2FC74347AC8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec30fa61-90f8-4476-baab-08daab784492
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 11:03:46.0613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Xhk6fPwqUpk0iSWzUtFOLA8Vr0UJLXtyyBM0o0Mskz5pwDOJeA/RBtZl+uWeD0/kWbuEFrNTMyG9hIl/Z6wqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5165
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_07,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110063
X-Proofpoint-GUID: 8EkqxVqERU8CD2AHH38ZSo4eDbngKB14
X-Proofpoint-ORIG-GUID: 8EkqxVqERU8CD2AHH38ZSo4eDbngKB14
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IE9uIDExIE9jdCAyMDIyLCBhdCAwNTowMiwgQW5pIFNpbmhhIDxhbmlAYW5pc2luaGEuY2E+
IHdyb3RlOg0KPiANCj4gT24gTW9uLCBPY3QgMTAsIDIwMjIgYXQgNjo1MyBQTSBNaWd1ZWwgTHVp
cyA8bWlndWVsLmx1aXNAb3JhY2xlLmNvbT4gd3JvdGU6DQo+PiANCj4+IFVwZGF0ZSB0aGUgRml4
ZWQgQUNQSSBEZXNjcmlwdGlvbiBUYWJsZSAoRkFEVCkgdG8gcmV2aXNpb24gNi4wIG9mIHRoZSBB
Q1BJDQo+PiBzcGVjaWZpY2F0aW9uIGFkZGluZyB0aGUgZmllbGQgIkh5cGVydmlzb3IgVmVuZG9y
IElkZW50aXR5IiB0aGF0IHdhcyBtaXNzaW5nLg0KPj4gDQo+PiBUaGlzIGZpZWxkJ3MgZGVzY3Jp
cHRpb24gc3RhdGVzIHRoZSBmb2xsb3dpbmc6ICI2NC1iaXQgaWRlbnRpZmllciBvZiBoeXBlcnZp
c29yDQo+PiB2ZW5kb3IuIEFsbCBieXRlcyBpbiB0aGlzIGZpZWxkIGFyZSBjb25zaWRlcmVkIHBh
cnQgb2YgdGhlIHZlbmRvciBpZGVudGl0eS4NCj4+IFRoZXNlIGlkZW50aWZpZXJzIGFyZSBkZWZp
bmVkIGluZGVwZW5kZW50bHkgYnkgdGhlIHZlbmRvcnMgdGhlbXNlbHZlcywNCj4+IHVzdWFsbHkg
Zm9sbG93aW5nIHRoZSBuYW1lIG9mIHRoZSBoeXBlcnZpc29yIHByb2R1Y3QuIFZlcnNpb24gaW5m
b3JtYXRpb24NCj4+IHNob3VsZCBOT1QgYmUgaW5jbHVkZWQgaW4gdGhpcyBmaWVsZCAtIHRoaXMg
c2hhbGwgc2ltcGx5IGRlbm90ZSB0aGUgdmVuZG9yJ3MNCj4+IG5hbWUgb3IgaWRlbnRpZmllci4g
VmVyc2lvbiBpbmZvcm1hdGlvbiBjYW4gYmUgY29tbXVuaWNhdGVkIHRocm91Z2ggYQ0KPj4gc3Vw
cGxlbWVudGFsIHZlbmRvci1zcGVjaWZpYyBoeXBlcnZpc29yIEFQSS4gRmlybXdhcmUgaW1wbGVt
ZW50ZXJzIHdvdWxkDQo+PiBwbGFjZSB6ZXJvIGJ5dGVzIGludG8gdGhpcyBmaWVsZCwgZGVub3Rp
bmcgdGhhdCBubyBoeXBlcnZpc29yIGlzIHByZXNlbnQgaW4NCj4+IHRoZSBhY3R1YWwgZmlybXdh
cmUuIg0KPj4gDQo+PiBIZXJldXBvbiwgd2hhdCBzaG91bGQgYSB2YWxpZCBpZGVudGlmaWVyIG9m
IGFuIEh5cGVydmlzb3IgVmVuZG9yIElEIGJlIGFuZA0KPj4gd2hlcmUgc2hvdWxkIFFFTVUgcHJv
dmlkZSB0aGF0IGluZm9ybWF0aW9uPw0KPj4gDQo+PiBPbiB0aGUgdjEgWzFdIG9mIHRoaXMgUkZD
IHRoZXJlJ3MgdGhlIHN1Z2dlc3Rpb24gb2YgaGF2aW5nIHRoaXMgaW5mb3JtYXRpb24NCj4+IGlu
IHN5bmMgYnkgdGhlIGN1cnJlbnQgYWNjZWxlcmF0aW9uIG5hbWUuIFRoaXMgYWxzbyBzZWVtcyB0
byBpbXBseSB0aGF0IFFFTVUsDQo+PiB3aGljaCBnZW5lcmF0ZXMgdGhlIEZBRFQgdGFibGUsIGFu
ZCB0aGUgRkFEVCBjb25zdW1lciBuZWVkIHRvIGJlIGluIHN5bmMgd2l0aA0KPj4gdGhlIHZhbHVl
cyBvZiB0aGlzIGZpZWxkLg0KPj4gDQo+PiBUaGlzIHZlcnNpb24gZm9sbG93cyBBbmkgU2luaGEn
cyBzdWdnZXN0aW9uIFsyXSBvZiB1c2luZyAiUUVNVSIgZm9yIHRoZQ0KPj4gaHlwZXJ2aXNvciB2
ZW5kb3IgSUQuDQo+PiANCj4+IFsxXTogaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUv
aHRtbC9xZW11LWRldmVsLzIwMjItMTAvbXNnMDA5MTEuaHRtbA0KPj4gWzJdOiBodHRwczovL2xp
c3RzLm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMi0xMC9tc2cwMDk4OS5o
dG1sDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFj
bGUuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuaSBTaW5oYSA8YW5pQGFuaXNpbmhhLmNhPg0K
PiANCg0KVGhhbmsgeW91IEFuaS4gSW4gdGhlIG1lYW53aGlsZSwgdGFraW5nIHRoZSBkZXNjcmlw
dGlvbiBwYXJ0IG9mOiDigJxGaXJtd2FyZQ0KaW1wbGVtZW50ZXJzIHdvdWxkIHBsYWNlIHplcm8g
Ynl0ZXMgaW50byB0aGlzIGZpZWxkLCBkZW5vdGluZyB0aGF0IG5vDQpoeXBlcnZpc29yIGlzIHBy
ZXNlbnQgaW4gdGhlIGFjdHVhbCBmaXJtd2FyZS4iLCBJIHJlYWNoZWQgdG8gc29tZXRoaW5nIGFs
b25nDQp0aGUgbGluZXMgYmVsb3c6DQoNCmRpZmYgLS1naXQgYS9ody9hY3BpL2FtbC1idWlsZC5j
IGIvaHcvYWNwaS9hbWwtYnVpbGQuYw0KaW5kZXggNDJmZWI0ZDRkNy4uZTcxOWFmZTBjYiAxMDA2
NDQNCi0tLSBhL2h3L2FjcGkvYW1sLWJ1aWxkLmMNCisrKyBiL2h3L2FjcGkvYW1sLWJ1aWxkLmMN
CkBAIC0yMTk4LDcgKzIxOTgsMTEgQEAgdm9pZCBidWlsZF9mYWR0KEdBcnJheSAqdGJsLCBCSU9T
TGlua2VyICpsaW5rZXIsIGNvbnN0IEFjcGlGYWR0RGF0YSAqZiwNCiAgICAgfQ0KIA0KICAgICAv
KiBIeXBlcnZpc29yIFZlbmRvciBJZGVudGl0eSAqLw0KLSAgICBidWlsZF9hcHBlbmRfcGFkZGVk
X3N0cih0YmwsICJRRU1VIiwgOCwgJ1wwJyk7DQorICAgIGlmIChmLT5oeXBfaXNfcHJlc2VudCkg
ew0KKyAgICAgICAgYnVpbGRfYXBwZW5kX3BhZGRlZF9zdHIodGJsLCAiUUVNVSIsIDgsICdcMCcp
Ow0KKyAgICB9IGVsc2Ugew0KKyAgICAgICAgYnVpbGRfYXBwZW5kX2ludF9ub3ByZWZpeCh0Ymws
IDAsIDgpOw0KKyAgICB9DQogDQogICAgIC8qIFRPRE86IGV4dHJhIGZpZWxkcyBuZWVkIHRvIGJl
IGFkZGVkIHRvIHN1cHBvcnQgcmV2aXNpb25zIGFib3ZlIHJldjYgKi8NCiAgICAgYXNzZXJ0KGYt
PnJldiA9PSA2KTsNCmRpZmYgLS1naXQgYS9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMgYi9ody9h
cm0vdmlydC1hY3BpLWJ1aWxkLmMNCmluZGV4IDcyYmI2ZjYxYTUuLmQyMzhjZTJiODggMTAwNjQ0
DQotLS0gYS9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMNCisrKyBiL2h3L2FybS92aXJ0LWFjcGkt
YnVpbGQuYw0KQEAgLTgxOCw2ICs4MTgsNyBAQCBzdGF0aWMgdm9pZCBidWlsZF9mYWR0X3JldjYo
R0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsDQogICAgICAgICAubWlub3Jf
dmVyID0gMCwNCiAgICAgICAgIC5mbGFncyA9IDEgPDwgQUNQSV9GQURUX0ZfSFdfUkVEVUNFRF9B
Q1BJLA0KICAgICAgICAgLnhkc2R0X3RibF9vZmZzZXQgPSAmZHNkdF90Ymxfb2Zmc2V0LA0KKyAg
ICAgICAgLmh5cF9pc19wcmVzZW50ID0gdm1zLT52aXJ0ICYmIChrdm1fZW5hYmxlZCgpIHx8IGh2
Zl9lbmFibGVkKCkpLA0KICAgICB9Ow0KIA0KICAgICBzd2l0Y2ggKHZtcy0+cHNjaV9jb25kdWl0
KSB7DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9hY3BpL2FjcGktZGVmcy5oIGIvaW5jbHVkZS9o
dy9hY3BpL2FjcGktZGVmcy5oDQppbmRleCAyYjQyZTQxOTJiLi4yYWZmNTMwNGFmIDEwMDY0NA0K
LS0tIGEvaW5jbHVkZS9ody9hY3BpL2FjcGktZGVmcy5oDQorKysgYi9pbmNsdWRlL2h3L2FjcGkv
YWNwaS1kZWZzLmgNCkBAIC03OSw3ICs3OSw3IEBAIHR5cGVkZWYgc3RydWN0IEFjcGlGYWR0RGF0
YSB7DQogICAgIHVpbnQxNl90IGFybV9ib290X2FyY2g7ICAgIC8qIEFSTV9CT09UX0FSQ0ggKi8N
CiAgICAgdWludDE2X3QgaWFwY19ib290X2FyY2g7ICAgLyogSUFQQ19CT09UX0FSQ0ggKi8NCiAg
ICAgdWludDhfdCBtaW5vcl92ZXI7ICAgICAgICAgLyogRkFEVCBNaW5vciBWZXJzaW9uICovDQot
DQorICAgIGJvb2wgaHlwX2lzX3ByZXNlbnQ7DQogICAgIC8qDQogICAgICAqIHJlc3BlY3RpdmUg
dGFibGVzIG9mZnNldHMgd2l0aGluIEFDUElfQlVJTERfVEFCTEVfRklMRSwNCiAgICAgICogTlVM
TCBpZiB0YWJsZSBkb2Vzbid0IGV4aXN0IChpbiB0aGF0IGNhc2UgZmllbGQncyB2YWx1ZQ0KDQpB
bnkgdGhvdWdodHMgb24gdGhpcz8NCg0KVGhhbmtzDQpNaWd1ZWwNCg0KPj4gLS0tDQo+PiBody9h
Y3BpL2FtbC1idWlsZC5jICAgICAgfCAxMyArKysrKysrKysrLS0tDQo+PiBody9hcm0vdmlydC1h
Y3BpLWJ1aWxkLmMgfCAxMCArKysrKy0tLS0tDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9ody9hY3BpL2Ft
bC1idWlsZC5jIGIvaHcvYWNwaS9hbWwtYnVpbGQuYw0KPj4gaW5kZXggZTZiZmFjOTVjNy4uNDJm
ZWI0ZDRkNyAxMDA2NDQNCj4+IC0tLSBhL2h3L2FjcGkvYW1sLWJ1aWxkLmMNCj4+ICsrKyBiL2h3
L2FjcGkvYW1sLWJ1aWxkLmMNCj4+IEBAIC0yMDcwLDcgKzIwNzAsNyBAQCB2b2lkIGJ1aWxkX3Bw
dHQoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsIE1hY2hpbmVTdGF0ZSAq
bXMsDQo+PiAgICAgYWNwaV90YWJsZV9lbmQobGlua2VyLCAmdGFibGUpOw0KPj4gfQ0KPj4gDQo+
PiAtLyogYnVpbGQgcmV2MS9yZXYzL3JldjUuMSBGQURUICovDQo+PiArLyogYnVpbGQgcmV2MS9y
ZXYzL3JldjUuMS9yZXY2LjAgRkFEVCAqLw0KPj4gdm9pZCBidWlsZF9mYWR0KEdBcnJheSAqdGJs
LCBCSU9TTGlua2VyICpsaW5rZXIsIGNvbnN0IEFjcGlGYWR0RGF0YSAqZiwNCj4+ICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpvZW1faWQsIGNvbnN0IGNoYXIgKm9lbV90YWJsZV9pZCkNCj4+
IHsNCj4+IEBAIC0yMTkzLDggKzIxOTMsMTUgQEAgdm9pZCBidWlsZF9mYWR0KEdBcnJheSAqdGJs
LCBCSU9TTGlua2VyICpsaW5rZXIsIGNvbnN0IEFjcGlGYWR0RGF0YSAqZiwNCj4+ICAgICAvKiBT
TEVFUF9TVEFUVVNfUkVHICovDQo+PiAgICAgYnVpbGRfYXBwZW5kX2dhc19mcm9tX3N0cnVjdCh0
YmwsICZmLT5zbGVlcF9zdHMpOw0KPj4gDQo+PiAtICAgIC8qIFRPRE86IGV4dHJhIGZpZWxkcyBu
ZWVkIHRvIGJlIGFkZGVkIHRvIHN1cHBvcnQgcmV2aXNpb25zIGFib3ZlIHJldjUgKi8NCj4+IC0g
ICAgYXNzZXJ0KGYtPnJldiA9PSA1KTsNCj4+ICsgICAgaWYgKGYtPnJldiA9PSA1KSB7DQo+PiAr
ICAgICAgICBnb3RvIGRvbmU7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgLyogSHlwZXJ2aXNv
ciBWZW5kb3IgSWRlbnRpdHkgKi8NCj4+ICsgICAgYnVpbGRfYXBwZW5kX3BhZGRlZF9zdHIodGJs
LCAiUUVNVSIsIDgsICdcMCcpOw0KPj4gKw0KPj4gKyAgICAvKiBUT0RPOiBleHRyYSBmaWVsZHMg
bmVlZCB0byBiZSBhZGRlZCB0byBzdXBwb3J0IHJldmlzaW9ucyBhYm92ZSByZXY2ICovDQo+PiAr
ICAgIGFzc2VydChmLT5yZXYgPT0gNik7DQo+PiANCj4+IGRvbmU6DQo+PiAgICAgYWNwaV90YWJs
ZV9lbmQobGlua2VyLCAmdGFibGUpOw0KPj4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LWFjcGkt
YnVpbGQuYyBiL2h3L2FybS92aXJ0LWFjcGktYnVpbGQuYw0KPj4gaW5kZXggOWIzYWVlMDFiZi4u
NzJiYjZmNjFhNSAxMDA2NDQNCj4+IC0tLSBhL2h3L2FybS92aXJ0LWFjcGktYnVpbGQuYw0KPj4g
KysrIGIvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jDQo+PiBAQCAtODA5LDEzICs4MDksMTMgQEAg
YnVpbGRfbWFkdChHQXJyYXkgKnRhYmxlX2RhdGEsIEJJT1NMaW5rZXIgKmxpbmtlciwgVmlydE1h
Y2hpbmVTdGF0ZSAqdm1zKQ0KPj4gfQ0KPj4gDQo+PiAvKiBGQURUICovDQo+PiAtc3RhdGljIHZv
aWQgYnVpbGRfZmFkdF9yZXY1KEdBcnJheSAqdGFibGVfZGF0YSwgQklPU0xpbmtlciAqbGlua2Vy
LA0KPj4gK3N0YXRpYyB2b2lkIGJ1aWxkX2ZhZHRfcmV2NihHQXJyYXkgKnRhYmxlX2RhdGEsIEJJ
T1NMaW5rZXIgKmxpbmtlciwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWaXJ0TWFj
aGluZVN0YXRlICp2bXMsIHVuc2lnbmVkIGRzZHRfdGJsX29mZnNldCkNCj4+IHsNCj4+IC0gICAg
LyogQUNQSSB2NS4xICovDQo+PiArICAgIC8qIEFDUEkgdjYuMCAqLw0KPj4gICAgIEFjcGlGYWR0
RGF0YSBmYWR0ID0gew0KPj4gLSAgICAgICAgLnJldiA9IDUsDQo+PiAtICAgICAgICAubWlub3Jf
dmVyID0gMSwNCj4+ICsgICAgICAgIC5yZXYgPSA2LA0KPj4gKyAgICAgICAgLm1pbm9yX3ZlciA9
IDAsDQo+PiAgICAgICAgIC5mbGFncyA9IDEgPDwgQUNQSV9GQURUX0ZfSFdfUkVEVUNFRF9BQ1BJ
LA0KPj4gICAgICAgICAueGRzZHRfdGJsX29mZnNldCA9ICZkc2R0X3RibF9vZmZzZXQsDQo+PiAg
ICAgfTsNCj4+IEBAIC05NDUsNyArOTQ1LDcgQEAgdm9pZCB2aXJ0X2FjcGlfYnVpbGQoVmlydE1h
Y2hpbmVTdGF0ZSAqdm1zLCBBY3BpQnVpbGRUYWJsZXMgKnRhYmxlcykNCj4+IA0KPj4gICAgIC8q
IEZBRFQgTUFEVCBQUFRUIEdURFQgTUNGRyBTUENSIERCRzIgcG9pbnRlZCB0byBieSBSU0RUICov
DQo+PiAgICAgYWNwaV9hZGRfdGFibGUodGFibGVfb2Zmc2V0cywgdGFibGVzX2Jsb2IpOw0KPj4g
LSAgICBidWlsZF9mYWR0X3JldjUodGFibGVzX2Jsb2IsIHRhYmxlcy0+bGlua2VyLCB2bXMsIGRz
ZHQpOw0KPj4gKyAgICBidWlsZF9mYWR0X3JldjYodGFibGVzX2Jsb2IsIHRhYmxlcy0+bGlua2Vy
LCB2bXMsIGRzZHQpOw0KPj4gDQo+PiAgICAgYWNwaV9hZGRfdGFibGUodGFibGVfb2Zmc2V0cywg
dGFibGVzX2Jsb2IpOw0KPj4gICAgIGJ1aWxkX21hZHQodGFibGVzX2Jsb2IsIHRhYmxlcy0+bGlu
a2VyLCB2bXMpOw0KPj4gLS0NCj4+IDIuMzcuMw0KPj4gDQoNCg==

