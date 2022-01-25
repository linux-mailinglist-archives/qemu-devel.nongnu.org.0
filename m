Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B83249B810
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:58:04 +0100 (CET)
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOCn-0007Th-7s
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCN2t-000669-04
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:43:44 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCN2q-0001Fb-Ej
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:43:42 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PAxB1Z022699; 
 Tue, 25 Jan 2022 14:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hS/zqs3H0nqeF+PWS2u8/UnllW94OMoAxuC4CRjWzno=;
 b=aoNGuYvHwJK4/kVJrkCmQQDcmacEokL1CsyB/Vdbcmes0OT1KKb6hPh2x1uAUs7ZcTr8
 VYGqeI1z7JWSzyHeP8cUtAO1f5slJ2UzCNcWFZvu6mLsHDPO1OKlZAWt1YbX7HEdgzMg
 NqFyNg4KELsOPMLFESyopMJ++hwOJx700+gIqKQgMOOQsOYa561/wVrNQ39kC/00huvA
 jT8qaC5jgDLHtHVgdTNfdLU4AajOEBQ7fn87/eP3LcOD6GZcf79FKnU4NomvfmZRDXWK
 Kf/IEXiBu08AMVktFGdV3WyctfFWrUAvj12fW2bN6qfcXn3j775+HZQUwDNgBGvfOpNh pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaabag9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 14:43:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PEfGNC149682;
 Tue, 25 Jan 2022 14:43:36 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by aserp3030.oracle.com with ESMTP id 3dr7yfysje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 14:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0X5L1dN6vAJN4mFkaF4O/BL6oL0Th7rczcIQchn+OIx0RTljRnogx8KhfdNpVCRuOEYXxuc0dicEsPayKo95sr3V8ucAzf18KYLoLCT+yZYfVrSq/ECEmkfda/ud/n7s3rDgi1OxoWBL4KsVUuV+IIaYA9IRboIG51iTZK12aBljQWsjaZEVAxyGGm8yEHP3BpCPI0lTozfoHKWMY68AIz1k4xsFUsSbHo+vV7ikDBbMQpHaYhy8vuFmpYwG0TEnbw8u8AA1cTztg7qdZZv7Qu2qUQYvN/owg57dyQ8b9c6aWk8Wnsas0srIsBjhm3YRWRa/zPZ8ZbVFyV0xmeFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS/zqs3H0nqeF+PWS2u8/UnllW94OMoAxuC4CRjWzno=;
 b=hfyFTyxrEMb8hH1CBGcERRIfKnlqKVPqgnrYmceihLX3xApwY0woXalprnWZMzQ9QNBhoHx/AbzToO2w1jQ1Qf90cSsSULQP3dL3SnagBqfP6vheK8/bxOs7LBFnpPur2WvX45DH7YmaqFRFo8Anb6jmxV91/sAtyR30Te1ynD6E3EmdELrZ6+dvOqhFI5NvapQ9fSuGys1VoqJF3xH0VAC5O6y4nkstevSIWHjCfkcvvx6iiFXkVfkImGZvVoPb/GS9s5s0Ylb1cFgDo/48rUBcBPMG114lelwpTnUNAf0H70kaZejqrM9NPNHU9ST7STcqOvFddDxdWPsn3LLQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS/zqs3H0nqeF+PWS2u8/UnllW94OMoAxuC4CRjWzno=;
 b=EQm1QqEjosnMQcwkRgeCYdJCJ81Geok3Zz9XbkN41Pi0/xeeTxKCn4hBoc7UYjZIlHDNu3MlyV01LRuJG5Wb2XMgthZoffsshZrtEQ2RzRYwBHZX160Q25os36eJNuhJ2X+ytAKXQCeuhi51hgRm9vhzVJ6RqFJuypSbfl1u3Ks=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Tue, 25 Jan
 2022 14:43:33 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 14:43:33 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 05/18] qdev: unplug blocker for devices
Thread-Topic: [PATCH v5 05/18] qdev: unplug blocker for devices
Thread-Index: AQHYDX14Pl84DrvNRkGSqpb/pIT4EaxzkTmAgABHpQA=
Date: Tue, 25 Jan 2022 14:43:33 +0000
Message-ID: <4B7C4ECE-8A8B-486B-A66A-983FDD2D6223@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <5ad3f47f9ed507211fa8db5b8c36b9d32413bbbb.1642626515.git.jag.raman@oracle.com>
 <Ye/Qe86YifZB/AiD@stefanha-x1.localdomain>
In-Reply-To: <Ye/Qe86YifZB/AiD@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c2a5f28-d1e6-42d1-0acf-08d9e0110ff2
x-ms-traffictypediagnostic: DS7PR10MB4926:EE_
x-microsoft-antispam-prvs: <DS7PR10MB4926271DEA39E5E6585C2C88905F9@DS7PR10MB4926.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WgB8NQvKaIdWQWMBNsBOiHZrzLkUEFpUBeV/aE7++iJZnP0rr/E3diroKrG7vwmKGDk+h5zQxorXJI6cWgRMO/qD0vqEdOVy2XbLBitRuyfJcpCjU9iPghqP7uFnkoZQlivNEsC8TukdZ1gdC0w2pNxZY2+Jpkr2wYk+8bifuX+OsKqEKfFns7DP2Y3Uh5h3ELQjRF2ybrM7vOhQkj4cAdAiH2rFzcU7Ayc4O/92gQkcYdgHksFfWJKGFKBTMBNr9amavzZasuvx3cBWeDlO0K5mV+g44kqsVzZLFUo1X0x/yccjKfYBLzb1SBNSLaVAMQMywdfWexo5ogYuYHDQ1NjRJ5l8j03Wv6h0izC63mPFhftOE7ZJWjNzXEwxJfOwdt1QvsFioAulBYRB2XwB2pflBPHvmW3OLh2HjPVWdeVd3DQEIV3upGlanUqoyQGTXAcapWwsxtWBJXUAIhqROT0KgJQpJeG2fCtRdGsx6f5NeDE/JiV9OS/7LOLJc0OBmWEZdih8GzJB6UL5Kl691EqxV0of5lr/1FwWp4JFHZ2b1b2ofSlu8ocWFKmj9ZrpTUICKlQdNfjFnCKfsiJkPJfOLaxlUX96Qar5yefBTK27aDEv1tEHc3rXDwjNQ9GfxABQAjZ8XWxYLphYZZo/2jGtVI43RhAoLQo2oshB/9e/kSdHpU5EgbsWIHWYt3t1CwXnPxtNbcbgVNkvkONvf9SSFiB47In532ttFc0weztg3rGveVyf4QwENsx91xfU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(91956017)(6512007)(76116006)(8676002)(508600001)(83380400001)(5660300002)(2906002)(6486002)(4326008)(6916009)(71200400001)(36756003)(186003)(38070700005)(107886003)(66946007)(66556008)(64756008)(44832011)(8936002)(38100700002)(7416002)(122000001)(86362001)(2616005)(316002)(6506007)(33656002)(53546011)(66446008)(54906003)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUJOdHRDR2xXbEhXL3F6UXAycVloeFhVQTFFU3VrRVlIcHUwQWpab1JSdUsy?=
 =?utf-8?B?N2htM2F0Q29zcW5xZGJsWGlxZ3VkZGRsN1MrTjNod1FaRkZzUzR1eFVMVFV0?=
 =?utf-8?B?ZFV5SXUrY3FiMUNtanRCV05WVVRXdnNlYVVjT1ZiWTBVc3JJenBFWGxpYXR5?=
 =?utf-8?B?dHVYSUttK2xHWE5xMm1iNDBpTkVWallCQlZST0RNdGcxNWZ1U1d4ZklXZHlo?=
 =?utf-8?B?eFdKNXY2YjYxVXBaWkxIZXpSL3VlakhCZUxQMXlFRmk3WEhLU003NU1sVk0y?=
 =?utf-8?B?NzFoK1J6MWNJRnl2WGNRU2R2cG5sR0xaRENXOVgrd3dRTVNNUlEwNkFMYXN3?=
 =?utf-8?B?aWVJOEJHT1puSVc2a1ZmTkVsemZ3UkxZTHVBYUZQMG51WnZGbm5GZHNDbVR6?=
 =?utf-8?B?b1FjRGtGQkJEa0NHM0pwTnJRM29hODBib1FGbXN6RHVuOENJOFNUZjEvNlFi?=
 =?utf-8?B?ZkMrVzRSa3JKeUlhcjZ5OW05RjNmR21oUEJKMmV0aHo1WDhyM1Y2QXlEajJo?=
 =?utf-8?B?TUpKa1JPZm5sUFZjVDFlTko2N05aM0NxMG5KYkxEcm9ZUFhSdjBvYmNmeU1x?=
 =?utf-8?B?TkhteG03eUJNRmZscTJjVmd2TW9xaUg3VE9odGtaNkNRNG5HQ3VQWlV5Qllp?=
 =?utf-8?B?UXNXQjFyU0J1Y3VDd2FGejFHcWFGK3duOXZtcE94aWg1Z3hRK212YlJFY0tt?=
 =?utf-8?B?ZUJ1ck1vYUozMWx3VkxOeHZEVkwxRGdmdVRpZ0ZUS3c5QUNVMkVPcGcxTVRM?=
 =?utf-8?B?aVVBd0dsc2xQSGhuMDFJSWVld3haNS9oYnptR0xnOXg1NEM3N1piSUFwdEp4?=
 =?utf-8?B?WlBGWWFtcUtOZDZ1REw0WnFydmQzOHY5RjVsbERONkhmNGRhcWk2NFFoVzVo?=
 =?utf-8?B?VlhVUE1sTGhvRC9qQ00yd0FHWExpbUI1eUNxcmY3R2pSME5DRE9wVGtjaHdZ?=
 =?utf-8?B?Sjl2YUgrZEE1RHgycm5OSVNhV2w0SGpjUHIvOUhxSGhrQW9vTjNuSUdQVGpw?=
 =?utf-8?B?K1JZN1RucG5lNUN0bFBFK2E1cEliSmJCOG9GVU15ZVdXeVJtVFBNeUZld1Jk?=
 =?utf-8?B?RTIwT1JxUmtYQUlDOEZheXFYZDhFY3pDWTc4Y2JYY081YVRPQ0xOd1pGSWdi?=
 =?utf-8?B?S0JkUVEvYnFQWkJEZW13aVJXTEVIVlQvNnJQd2dGV1R6UEZER283Syt4b0NR?=
 =?utf-8?B?enNvL2lNMmNjSnpycXczWVFFOERtdmhFTE1iUUlOMm0xRktrbkdNc1B1ZUhC?=
 =?utf-8?B?UlZJR09qYml1K3prT0NMMCtoUC9kcCs0M0VPMUd2aHFyRk1USFFkdzJYd2tP?=
 =?utf-8?B?NnhmVUV4blhrc05Sb1RDR1JSR2pHamJkWk13MndTU3c1UGw0RWY1THI4U2RQ?=
 =?utf-8?B?WG1HS2NiMU1wVitqZjBDODJkclpVeloxTmlmNlFqMlQza1R6TkhGZzlnMllz?=
 =?utf-8?B?eTZaNEpLbXI3allhNm16TXBtTkUzNThPSm55c0lHUlZTQ1o2aTh4UzAxKzRm?=
 =?utf-8?B?VE54aFRmWkxXdGFqNlFjczVTTnVKTm9wN0NsTDNNVzBEZFF4TGJyL2Jxb2Zi?=
 =?utf-8?B?enllTE5wOU1HWjM1SzVhN2dQd09Hbm5TVFhobUxTUi9BYzJkRlJDL0Jmbm52?=
 =?utf-8?B?L0F0TEYvRlFVUDRzeWRBTy9ybTlSdGpISlQvcWIyYWdrZ1FlV2FGRW90OEJ5?=
 =?utf-8?B?S3BTcCtkRXhCVjJGQmFtQkVQc2xrRExZUCt5MGUvUk81Ym1Cdis5Y0ZPMHJQ?=
 =?utf-8?B?aUxMQWk3eEU1aUJnUzI0bmVrWnpwQm5FbS9LbGIrSGJYa0RKT3UvV3RDZm1N?=
 =?utf-8?B?bGRlWWRYU0lIcHJQNUdkNlVwS2xzcTBYOTJmWU5OS3pXVDVtRnI1Tm1TblRs?=
 =?utf-8?B?RjJUVlRmR1YzMkVlVWt0L0x6bldtKzhyNExjYWtxZ3liUEJvRC9FNExqY3hD?=
 =?utf-8?B?QzhucnpQR25LSFpvbG5RRVBRQ3V0QytQVXRXV3duWFBjMGpRb1lBRzFibXZu?=
 =?utf-8?B?NmpTd2lQaXhpUnhxSW5qTzFzUWJOU0NxcUFLS2ZIZkdXbXhMOWwvTGpTNHJC?=
 =?utf-8?B?Q2QwUGhLMGZVTE0yWlpRampBbWdVbFBzbWsyYjdFWFNxYmNjZFJxU0pZQVZy?=
 =?utf-8?B?bzZFWXhFMjdnUVBrT1c0UDZGUkRha3NZMS9Wa3V3NVROUlFKRSt4cE5aSEtI?=
 =?utf-8?B?WGhaSzZHUDZURFdleDk2MkVkNmhxZTI0cDYrZ0JOUHJWNWRPTVBpTWVDUElV?=
 =?utf-8?B?UUtYSTdSS2lUWk5MeWpLMlhQMEdRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B6C2F791A52A34C8B05AFAF72CAF373@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2a5f28-d1e6-42d1-0acf-08d9e0110ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 14:43:33.5284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKhddTaJv6us+LVPmaqx6qqK8+sbKZAmn4EvUlcsb/7fY/wYHRrLbpOwGnoWJrPt4rn/jpGDgoOxir0dNwrOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4926
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250095
X-Proofpoint-GUID: 81_Bg9Rxjx2DUYDfe4R5tHYsfWE6xge7
X-Proofpoint-ORIG-GUID: 81_Bg9Rxjx2DUYDfe4R5tHYsfWE6xge7
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCA1OjI3IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6
NDE6NTRQTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5
OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+
PiAtLS0NCj4+IGluY2x1ZGUvaHcvcWRldi1jb3JlLmggfCAgNSArKysrKw0KPj4gc29mdG1tdS9x
ZGV2LW1vbml0b3IuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
PiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvaHcvcWRldi1jb3JlLmggYi9pbmNsdWRlL2h3L3FkZXYtY29yZS5oDQo+PiBpbmRl
eCBlZWQyOTgzMDcyLi42N2RmNWUwMDgxIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody9xZGV2
LWNvcmUuaA0KPj4gKysrIGIvaW5jbHVkZS9ody9xZGV2LWNvcmUuaA0KPj4gQEAgLTE5Myw2ICsx
OTMsNyBAQCBzdHJ1Y3QgRGV2aWNlU3RhdGUgew0KPj4gICAgIGludCBpbnN0YW5jZV9pZF9hbGlh
czsNCj4+ICAgICBpbnQgYWxpYXNfcmVxdWlyZWRfZm9yX3ZlcnNpb247DQo+PiAgICAgUmVzZXR0
YWJsZVN0YXRlIHJlc2V0Ow0KPj4gKyAgICBHU0xpc3QgKnVucGx1Z19ibG9ja2VyczsNCj4+IH07
DQo+PiANCj4+IHN0cnVjdCBEZXZpY2VMaXN0ZW5lciB7DQo+PiBAQCAtNDMzLDYgKzQzNCwxMCBA
QCB0eXBlZGVmIGJvb2wgKFFEZXZQdXRCdXNGdW5jKShCdXNTdGF0ZSAqYnVzLCBFcnJvciAqKmVy
cnApOw0KPj4gYm9vbCBxZGV2X3NldF9idXNfY2JzKFFEZXZHZXRCdXNGdW5jICpnZXRfYnVzLCBR
RGV2UHV0QnVzRnVuYyAqcHV0X2J1cywNCj4+ICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAq
KmVycnApOw0KPj4gDQo+PiAraW50IHFkZXZfYWRkX3VucGx1Z19ibG9ja2VyKERldmljZVN0YXRl
ICpkZXYsIEVycm9yICpyZWFzb24sIEVycm9yICoqZXJycCk7DQo+PiArdm9pZCBxZGV2X2RlbF91
bnBsdWdfYmxvY2tlcihEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqcmVhc29uKTsNCj4+ICtib29s
IHFkZXZfdW5wbHVnX2Jsb2NrZWQoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKTsNCj4+
ICsNCj4+IC8qKg0KPj4gICogR3Bpb1BvbGFyaXR5OiBQb2xhcml0eSBvZiBhIEdQSU8gbGluZQ0K
Pj4gICoNCj4+IGRpZmYgLS1naXQgYS9zb2Z0bW11L3FkZXYtbW9uaXRvci5jIGIvc29mdG1tdS9x
ZGV2LW1vbml0b3IuYw0KPj4gaW5kZXggNzMwNjA3NDAxOS4uMWExNjlmODlhMiAxMDA2NDQNCj4+
IC0tLSBhL3NvZnRtbXUvcWRldi1tb25pdG9yLmMNCj4+ICsrKyBiL3NvZnRtbXUvcWRldi1tb25p
dG9yLmMNCj4+IEBAIC05NzgsMTAgKzk3OCw0NSBAQCB2b2lkIHFtcF9kZXZpY2VfZGVsKGNvbnN0
IGNoYXIgKmlkLCBFcnJvciAqKmVycnApDQo+PiAgICAgICAgICAgICByZXR1cm47DQo+PiAgICAg
ICAgIH0NCj4+IA0KPj4gKyAgICAgICAgaWYgKHFkZXZfdW5wbHVnX2Jsb2NrZWQoZGV2LCBlcnJw
KSkgew0KPj4gKyAgICAgICAgICAgIHJldHVybjsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICAg
ICAgICAgcWRldl91bnBsdWcoZGV2LCBlcnJwKTsNCj4+ICAgICB9DQo+PiB9DQo+PiANCj4+ICtp
bnQgcWRldl9hZGRfdW5wbHVnX2Jsb2NrZXIoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKnJlYXNv
biwgRXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+ICsgICAgRVJSUF9HVUFSRCgpOw0KPj4gKw0KPj4g
KyAgICBpZiAoIW1pZ3JhdGlvbl9pc19pZGxlKCkpIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGco
ZXJycCwgIm1pZ3JhdGlvbiBpcyBpbiBwcm9ncmVzcyIpOw0KPj4gKyAgICAgICAgcmV0dXJuIC1F
QlVTWTsNCj4+ICsgICAgfQ0KPiANCj4gV2h5IGNhbiB0aGlzIGZ1bmN0aW9uIG5vdCBiZSBjYWxs
ZWQgZHVyaW5nIG1pZ3JhdGlvbj8NCg0KU2luY2Ug4oCYdW5wbHVnX2Jsb2NrZXJzJyBpcyBhIG1l
bWJlciBvZiB0aGUgZGV2aWNlLCBJIHRob3VnaHQgaXQgd291bGRu4oCZdCBiZSBjb3JyZWN0IHRv
DQphbGxvdyBjaGFuZ2VzIHRvIHRoZSBkZXZpY2UncyBzdGF0ZSBkdXJpbmcgbWlncmF0aW9uLg0K
DQpJIGRpZCB3ZWlnaCB0aGUgZm9sbG93aW5nIHJlYXNvbnMgYWdhaW5zdCBhZGRpbmcgdGhpcyBj
aGVjazoNCiAgLSB1bnBsdWdfYmxvY2tlcnMgaXMgbm90IG1pZ3JhdGVkIHRvIHRoZSBkZXN0aW5h
dGlvbiBhbnl3YXksIHNvIGl0IGRvZXNu4oCZdCBtYXR0ZXIgaWYNCiAgICBpdCBjaGFuZ2VzIGFm
dGVyIG1pZ3JhdGlvbiBzdGFydHMNCiAgLSB3aGljaGV2ZXIgY29kZS9vYmplY3QgdGhhdCBuZWVk
cyB0byBhZGQgdGhlIGJsb2NrZXIgY291bGQgYWRkIGl0IGF0IHRoZSBkZXN0aW5hdGlvbg0KICAg
IGlmIG5lZWRlZA0KDQpIb3dldmVyLCB1bmxpa2UgcW1wX2RldmljZV9hZGQoKSwgcW1wX29iamVj
dF9hZGQoKSBkb2VzbuKAmXQgcmVqZWN0IGR1cmluZw0KbWlncmF0aW9uLiBBcyBzdWNoLCBhbiBv
YmplY3QgY291bGQgYWRkIGEgYmxvY2tlciBmb3IgdGhlIGRldmljZSB3aGVuIG1pZ3JhdGlvbiBp
cw0KaW4gcHJvZ3Jlc3MuDQoNCldvdWxkIHlvdSBwcmVmZXIgdG8gdGhyb3cgYSB3YXJuaW5nLCBv
ciBmdWxseSByZW1vdmUgdGhpcyB0ZXN0Pw0KDQotLQ0KSmFnIA0KDQo+IA0KPj4gKw0KPj4gKyAg
ICBkZXYtPnVucGx1Z19ibG9ja2VycyA9IGdfc2xpc3RfcHJlcGVuZChkZXYtPnVucGx1Z19ibG9j
a2VycywgcmVhc29uKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4g
K3ZvaWQgcWRldl9kZWxfdW5wbHVnX2Jsb2NrZXIoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKnJl
YXNvbikNCj4+ICt7DQo+PiArICAgIGRldi0+dW5wbHVnX2Jsb2NrZXJzID0gZ19zbGlzdF9yZW1v
dmUoZGV2LT51bnBsdWdfYmxvY2tlcnMsIHJlYXNvbik7DQo+PiArfQ0KPj4gKw0KPj4gK2Jvb2wg
cWRldl91bnBsdWdfYmxvY2tlZChEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+PiAr
ew0KPj4gKyAgICBFUlJQX0dVQVJEKCk7DQo+PiArDQo+PiArICAgIGlmIChkZXYtPnVucGx1Z19i
bG9ja2Vycykgew0KPj4gKyAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGVycm9yX2NvcHko
ZGV2LT51bnBsdWdfYmxvY2tlcnMtPmRhdGEpKTsNCj4+ICsgICAgICAgIHJldHVybiB0cnVlOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiBmYWxzZTsNCj4+ICt9DQo+PiArDQo+PiB2
b2lkIGhtcF9kZXZpY2VfYWRkKE1vbml0b3IgKm1vbiwgY29uc3QgUURpY3QgKnFkaWN0KQ0KPj4g
ew0KPj4gICAgIEVycm9yICplcnIgPSBOVUxMOw0KPj4gLS0gDQo+PiAyLjIwLjENCj4+IA0KDQo=

