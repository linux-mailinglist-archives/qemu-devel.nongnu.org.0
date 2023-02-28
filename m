Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454E6A529B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 06:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWsO8-0007yR-Ov; Tue, 28 Feb 2023 00:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pWsO6-0007y4-0y
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 00:18:54 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pWsO3-0006yj-IB
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 00:18:53 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RIiTws019023; Tue, 28 Feb 2023 05:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=OOz91N958JC6aCP9jS5Z6vw2X0p99WcuT/1PMuQ79+k=;
 b=e+bWyT12M36yX/pSLwiz/t+VcVmqsejg21+s0SLVrtVOTQsRxMK2OBiQFq8XlmZ8qezl
 Yr+Nxp+vBQVjjsDtbydR712iWXYYIcpeaFfI6QKTF09PAG2RfngcuU816LaHhHxSpNfQ
 QpcbdgHUTYAOIDNSP4A+V5Wl6Eb6wWeJofmTJX7oicLuWZtC8unH5kcGrcm9M1BnAPqa
 bAZzmu5R7rd+ccjIg3X9PrYGteXZIsOfsCnR2X38ASyv77GY1gThKRJBVdC03P5CVZtg
 YQcwqqDpicnNxvHmsYXm2p9J70SwCzanS8meiHL2ASM1ze3wX9R5aawO4hHYKU/RBiBT 3A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba7d7fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 05:18:42 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31S4Ufur029323; Tue, 28 Feb 2023 05:18:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8scb1g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 05:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QipN5eKzuCTf/01AuCSPsOH1umP/bk6yZJDCodaNFZawXlU3ypmMIArr805flwfuElqfMqT1O11fL7p9sVtlRlI7HksCmN8wNQGdyzAuDqSW7vR7Ych7JpwH3m2wQ6Fs2uemFUPXt5MxG/Xuw8pOQFY46Ll84cRjoB3ECKsmhUpArlGoIPgixAhEXCqqFcth+5UOpHeOYSIMIn5ZWbUkYvs3HdEEWy1ego5xRfMTPyu9OQj203D6Z/tXwODwQ7dou1mEto9dxw7Ypm1MgsWRJcqfkIThm3YaHNVGtwl747pd+VAY448kFea87tFSdZhn1FC7MRphL0Ggcyay28oq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOz91N958JC6aCP9jS5Z6vw2X0p99WcuT/1PMuQ79+k=;
 b=RvFO2i1Aa7sH9xoF7w+ChQXCZH+0mkFkuPTvPFhYWM966+eUH26U4yAhBB8SkTSUMipLFDWWJCBqPMJJfICcIxNWEdRxK6rQaqdxGE4AYPTK5hdLiYBy3lseBAgeFj1Xsk/0qvdMltO0AzZSLi5Q7maf9nb0ZFScNLsKhmPjUJt728CLcp3uLOCxk8ITUsO+q4uoJnhbHM3IKK5O3R9K+75PmkHqTwf+yfSzMoYALSqVaFtIujzFGJoqLuJZzEkRBMNqY+kXizz675Td4NE9YOEsCWOVs0tIMMV79JaVNInTv5+XHJXI3ciB0Gllsn1ArSLlilrW3Xjj2UO9/j9Wug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOz91N958JC6aCP9jS5Z6vw2X0p99WcuT/1PMuQ79+k=;
 b=GG/mDp9NCbQ5Z6p06p7vnNAqxQW3LNhV04yYydpM4UTab/JN+/s7L76g5Mv9auAzIVBYpHQUhzI7NHp8LbWzm2MwWxep/DoCdqot5I7y9HyPsAkISCto7fUxaPsxoifIUXGmm1fZ9Wrs5d/8uecZWDzg1ZhWCHlz2AJcwnLFJGY=
Received: from MN2PR10MB3200.namprd10.prod.outlook.com (2603:10b6:208:124::21)
 by SN7PR10MB6955.namprd10.prod.outlook.com (2603:10b6:806:329::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.14; Tue, 28 Feb
 2023 05:18:39 +0000
Received: from MN2PR10MB3200.namprd10.prod.outlook.com
 ([fe80::7cfc:3b6c:998d:b2a0]) by MN2PR10MB3200.namprd10.prod.outlook.com
 ([fe80::7cfc:3b6c:998d:b2a0%5]) with mapi id 15.20.6156.012; Tue, 28 Feb 2023
 05:18:39 +0000
From: Siddhi Katage <siddhi.katage@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joe Jin <joe.jin@oracle.com>, Dongli Zhang <dongli.zhang@oracle.com>,
 "christian.ehrhardt@canonical.com" <christian.ehrhardt@canonical.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>
Subject: RE: [External] : Re: [PATCH 1/1] modules: load modules from
 /var/run/qemu/<version> directory firstly
Thread-Topic: [External] : Re: [PATCH 1/1] modules: load modules from
 /var/run/qemu/<version> directory firstly
Thread-Index: AQHZMCNAS0vmLu1Eu0+9zNYnSizRBK6uRckAgDW9JEA=
Date: Tue, 28 Feb 2023 05:18:39 +0000
Message-ID: <MN2PR10MB32006866DB754AC8CEA9FFB48BAC9@MN2PR10MB3200.namprd10.prod.outlook.com>
References: <1674585590-13888-1-git-send-email-siddhi.katage@oracle.com>
 <3982a6f6-9c36-52c4-f512-f3ad31a59584@linaro.org>
In-Reply-To: <3982a6f6-9c36-52c4-f512-f3ad31a59584@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR10MB3200:EE_|SN7PR10MB6955:EE_
x-ms-office365-filtering-correlation-id: fe27bc63-ae82-4cc6-1d3f-08db194b4018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJTa0btcghvtuMoD8PJEFRf+S5nHOADoKUGkCfm90SBTCRal8OjFkKGJt+KJ8M1gC8fogtTpiUjJeDAVhBIQjmMMv9LEJicO84ESuVDiNWm3WnLZ8uU9QzsPIbZg6vHUABAOzWkwJzBqura00lfskCy7Z0h1pEMGzzKs85RffTs6I3i0prMZ7eHP7QA1B+JIPJ2q+X9VQi9OmyWOghEwwJ2KMJIKbhS9EuMUJOAwgcOO5NIoZvtgvewT5Epw0zVw6MK0wPPD+Ow9tzNvGp4EMFdU/1jG2v5BK2hkxUXF9ZMipo6U+T76Zc3LSqsQNm6IxAdD/qofoi9YwLhAxXsP/Bu+lBtSlZ07aRBQFOTuL0S2aVksnzZAzo5qa592Y99No2kB8PDrzZY+T5N6gfB+7+3YHloJZ2Q1BbQ8Ok4GqSQMtIqDQEhG3QG92ijCKQg/FTpo6ttEHlLNnRl5ePimCcPW+TFColv/YIyoUHGjYPSDy7aLWtUNc/RzkACn14QhcMGbPq8Ur9YSCRBkvdGguLDC6aUW9dLw88a5Y5fAujRgZXfXTYPeHHMjH7XpcF/y/YdKReoHuneHUPeCre6dheyxycq2Mt47pGMr+RiejfyPUuwoRS5BuwVSrtuj00ZVmE5SJGz4xtJPdHf1KhpXYrx7/1pKXWjd6EgKWInQ9rT9qxZjWYE71coKwmB89x9jLD0jzvNMDrr+2j7W64HX5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3200.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199018)(83380400001)(316002)(54906003)(110136005)(33656002)(4326008)(122000001)(8676002)(55016003)(64756008)(38100700002)(76116006)(53546011)(6506007)(9686003)(186003)(26005)(71200400001)(7696005)(478600001)(5660300002)(66556008)(66446008)(66946007)(66476007)(44832011)(52536014)(8936002)(2906002)(41300700001)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R254R2VYRy9zVHc3MklVRFh3L0trU1ZzNFduT21CbGl3WEoxdTdBQU5PbjBE?=
 =?utf-8?B?TzBRbHlFTkFPQkpWSjZNYVhVMU51ZXlDdnNMbjl6TDMzQ2REK1QwaDI4MU9P?=
 =?utf-8?B?aWhnZ3VoNFNpZHBKTmRHOEJXZnBFdy85b3JtNndCS21KUHVMRk1WeUxycGRr?=
 =?utf-8?B?RzIzOE5LYmplSTV2YkpvSUVoRE9VWVV6ZFJOSGtwWDdhOFBac3VhSmQ0MHFT?=
 =?utf-8?B?L1JzMjFUcE1qOUxpVkR4N0pxeE1weDRoR09oZU0vZWE1NWJJUGdlaFVlVFl6?=
 =?utf-8?B?VUFHSUNjZWFHalRHUFVRL2NxcmVPaFpYdWlJZWRlbmFKaGtCUGhDVVNZVU1B?=
 =?utf-8?B?dnN5Zm13ZVNOM3FhUFU4dC8vOGttZlhHYlFoQzNkY1VtSWZ4YUJscTZMbzdV?=
 =?utf-8?B?RGI5V1FEb2JDbDhvOUw4bnV3akE4cTRyNlJrandzdGMyUlQ0ajcwdUlaT2Ir?=
 =?utf-8?B?dm1qNS9yN0lLRmhFWi9HQ1pJdlVMQzRLUzFEekptejRjMXpDVVZYZGNicU9K?=
 =?utf-8?B?SXViR3N4OVREMVJHVWEvR3BSMkR5WEszMlBXMk9iTFJNaFp5VW5FQkFBakxx?=
 =?utf-8?B?NUhwUXpKNEtjVXpwY0x4VVF1NXV0UHVhWWtyNklTVzZxZnNoNHZmaXgramdZ?=
 =?utf-8?B?RjY2MlcyMllxWWV0OWNTSVpCY0JYejJQNlQxTHAyUTk3N2VIOTVPdlhtV2ZK?=
 =?utf-8?B?TFd5SjhOSHpWZEZmUzlmbUc2b1c2QTY0T1NzMUdKb0gxUEtiY28rSWo1eVhh?=
 =?utf-8?B?OFlFa2pBWGI0R3pYNHdleEFHMVJRT2I4MnRrRmw3amJLMTRGSGFUak5OWWVM?=
 =?utf-8?B?Q3FrVk9YR0h4Mms4RlloMXdBMXQyRG44Z0djWFFMU3VUeTFxdW9TRTFNb0M3?=
 =?utf-8?B?dTd1MDF3TjVvQ2ltSE13dlNZZGx6MVpYQlB0VXVxWGhsTnhkV2JtbVJjbldr?=
 =?utf-8?B?T2hUejBVS09VUitjZXd1VXdFQXZuNVV4SWkvcFRCaEVkTDhwREZqdjFvZ1BF?=
 =?utf-8?B?ZE0ySVpyN0dqeE5KNUZydkJ3d040Qm83YnpuODFOYXFFQUlHRnd1Y1BZTWts?=
 =?utf-8?B?SDVaa2hwN1ArRVNrdDNBKzZVeTB0dlF0bE9KREVzbnhFVDM0WUJQeW9vMjVG?=
 =?utf-8?B?aDEwWGRLVzYrSXJiVEswcjhCSGhxdTZ0SXlhOWtua2VpZk51NldReGxyQXJs?=
 =?utf-8?B?MXRlWVJJTnZpQ1FrU2tMTzZkcTlqZFpwaCtId1drSlNoTVQrdVNicStkMHdk?=
 =?utf-8?B?MDh5M0FYcDQvQzZHRjBPcFM0VEE4SkNtaXVNQjh4NGFpUVNoS2MrMUVRaDl4?=
 =?utf-8?B?bUJ1RlcwRW9QaW1mbXJlT0hFYzFmbmRXR1lIb2kvU1hyVTFuT1JPb2lTaUlu?=
 =?utf-8?B?VE56Y0hMZFJORGJkQndVZk9rQUFobzc3TmcvdVJYWlk0SmthMTNweHUvL2Ur?=
 =?utf-8?B?bXpiRXFVUDBxNUtiWkExOU9BdTBhN1NWOTZybFNSQXI4Vmt4alRHbG1idmt6?=
 =?utf-8?B?ZTRjMXgyRXkybVpYZEJiS1pQaDJrbzdoV3ZMNHhqWjg5RzJGUHY3ejV5dW9V?=
 =?utf-8?B?ZWFpMHNTZVd6RXd6M2xNS0NldmdzdStkclUzSyt2NWF3QS9zQXhjQUw1dllu?=
 =?utf-8?B?TW5kMGpRNFZaVXFJVUJUSlNZcjVFS1F6LzVvRE1jUkZneFhZS1dLU09sbSt0?=
 =?utf-8?B?Y3lYNGp3bFJDTXUzY2NxMGdoNnVrVGQ0M3ZWbjhTUWloellZR1JCYTVOM2pL?=
 =?utf-8?B?UDhZN0ZhZmd2RHFrV001RStoR2t2d3ZYT3lvU0NEOFZsKzdtR2xCUFIrb1lO?=
 =?utf-8?B?TUNWcGlFWUl6U2wyRjNHSXRDRUFWaWtIdnBpOTJnNmZvcHhDYzllOHo2SXor?=
 =?utf-8?B?ejI2RGdDZEcwaXBMQmJaUmFhYSswMGZRaUJOWDQxK2U1QUN5T2paNG1TR3B2?=
 =?utf-8?B?TUdrWEhWNVlqSXJmUFZRS1h2M3BLTlQxMytianBFQjI0WWlrb0MvMmpEUzM4?=
 =?utf-8?B?UkRLcVpUVUxheEdNZEpyUzcvcVJPZHNUdkdId2REMXUvMkI0bDJ1cVZjTkZM?=
 =?utf-8?B?TlVvOTFBa285MjFVZXViZjJCSnZrTHE3NCt4bTM3elNOZDRKZHo5NTU2U051?=
 =?utf-8?B?ZWhIR2xEakRDVHhVZHY0dHN1WCtING5aSHI1THdZZnNlTXp3SDY5Q1RYUGpZ?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: StbCRmAuydef/jxab2UE+80S0tSZL5M/96ricmz4iL2mXQmwpL/LClxYI7TmjJ6nTuKeoAA8JL6GI+Nx3Rb4srvcSMQ/pvqRFlNcnuEjNSEp6fSmlL96xoPH9vCRF/hHeJheE6BuDb1KF6rW7xsM8KIxEHOoChjYqRZ6LnhxQP48g742P0PuAhTWbJcdeWpKeQOU3FksqZemQrCMs1wcZBXieyLlUOpHC2xRBeRka4XvsB61Txaw58klO9pUuSnQ/Wcf+MDBYXz15cV7C4T4q8dBQg4bu59GxwT0HmTPDtufnw14PFRdTfUh3nBX83vrvjb5UUjj4lVKPKUyCMIH0zG6bmUKHJWYGZtWMuWG2mTVXw0mUM5gpsaVNA4LpCt5CG4H7v0mPuqstcr4O5Uog+tUixUTQl9IlNDdZ0IqoIEuMH6Mnqfq8HhAi8v7bLj1CJcLSC5jILomg4yEC5uu08UdVsFU6//l8Z4Yem2wr9a5zi5mpiO8OC6TzUV0CAjQ0oN3djV2WFA7PkYxC71FwaWWGcaDLgtV9xoeZFDLKyv3Z0n8WmNnatm0fuYepQM35UBeqNyXnjl/bO9enk2Y0oSdSRdLxW+A2v/A707eSJC8NQ3GmO9m2Kg1+a34ohHBGdhiORERdx4H8VV0FNU5QZuHGnoxoy/JTDOZt0wVTW4AVxwbTkCYWhMUCVbotNCJeRDrgb4sBwdvquOSLYBCkTCCNkvVw7X9AU8NBMUVeH5F9U4yXY2n4J5Y/AUEXz4mKtApZzrV1RKqZ3wxC5uunzC1rOa7cS4Q26Yic3evPZYnDDs6v4tfM+3T+to3GKMV/q0AmnJXRmb05Qw4PdVFSw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3200.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe27bc63-ae82-4cc6-1d3f-08db194b4018
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 05:18:39.1308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DKWAoUKOk9sct/XLFwJpgqRPmVikKsO+sEcBrbKEWt+orzDdl76/EwXT4dcziQROs+5B+bM2VUifdQql2Ytp9BoBjYqoES4fNo9LU3Q9mNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_02,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280037
X-Proofpoint-ORIG-GUID: PoRaAxdQP31j50Aq--QKTuTgtAw3NgXS
X-Proofpoint-GUID: PoRaAxdQP31j50Aq--QKTuTgtAw3NgXS
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=siddhi.katage@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgLA0KQ2FuIEkga25vdyB3aGVuIHRoaXMgcGF0Y2ggd2lsbCBiZSBpbnRlZ3JhdGVkIHRvIHVw
c3RyZWFtPw0KDQpUaGFuayB5b3UsDQpTaWRkaGkgS2F0YWdlDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5v
cmc+IA0KU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI1LCAyMDIzIDU6NTIgQU0NClRvOiBTaWRk
aGkgS2F0YWdlIDxzaWRkaGkua2F0YWdlQG9yYWNsZS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5v
cmcNCkNjOiBKb2UgSmluIDxqb2UuamluQG9yYWNsZS5jb20+OyBEb25nbGkgWmhhbmcgPGRvbmds
aS56aGFuZ0BvcmFjbGUuY29tPjsgY2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5jb207IGJl
cnJhbmdlQHJlZGhhdC5jb207IHBib256aW5pQHJlZGhhdC5jb20NClN1YmplY3Q6IFtFeHRlcm5h
bF0gOiBSZTogW1BBVENIIDEvMV0gbW9kdWxlczogbG9hZCBtb2R1bGVzIGZyb20gL3Zhci9ydW4v
cWVtdS88dmVyc2lvbj4gZGlyZWN0b3J5IGZpcnN0bHkNCg0KT24gMjQvMS8yMyAxOTozOSwgU2lk
ZGhpIEthdGFnZSB3cm90ZToNCj4gRnJvbTogU2lkZGhpIEthdGFnZSA8c2lkZGhpLmthdGFnZUBv
cmFjbGUuY29tPg0KPiANCj4gQW4gb2xkIHJ1bm5pbmcgUUVNVSB3aWxsIHRyeSB0byBsb2FkIG1v
ZHVsZXMgd2l0aCBuZXcgYnVpbGQtaWQgZmlyc3QsIA0KPiB0aGlzIHdpbGwgZmFpbCBhcyBleHBl
Y3RlZCwgdGhlbiBRRU1VIHdpbGwgZmFsbGJhY2sgdG8gbG9hZCB0aGUgb2xkIA0KPiBtb2R1bGVz
IHRoYXQNCg0KWW91IGNvcnJlY3RlZCB0aGUgY29tbWEvc3BhY2UgdHlwbyA6KQ0KDQo+IG1hdGNo
ZXMgaXRzIGJ1aWxkLWlkIGZyb20gL3Zhci9ydW4vcWVtdS88dmVyc2lvbj4gZGlyZWN0b3J5Lg0K
PiBNYWtlIC92YXIvcnVuL3FlbXUvPHZlcnNpb24+IGRpcmVjdG9yeSBhcyBmaXJzdCBzZWFyY2gg
cGF0aCB0byBsb2FkIG1vZHVsZXMuDQo+IA0KPiBGaXhlczogYmQ4M2M4NjFjMCAoIm1vZHVsZXM6
IGxvYWQgbW9kdWxlcyBmcm9tIHZlcnNpb25lZCAvdmFyL3J1biANCj4gZGlyIikNCj4gU2lnbmVk
LW9mZi1ieTogU2lkZGhpIEthdGFnZSA8c2lkZGhpLmthdGFnZUBvcmFjbGUuY29tPg0KPiAtLS0N
Cj4gICB1dGlsL21vZHVsZS5jIHwgMTAgKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNClJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQoNCg==

