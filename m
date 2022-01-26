Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92449CEF2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:54:07 +0100 (CET)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkcY-0003A7-H4
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCkaz-0002Ia-RW
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:52:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCkat-0005x4-Ej
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:52:25 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFodJd024356; 
 Wed, 26 Jan 2022 15:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=nf7Unl16OeU3MnTkbQNyM4WRQ2hZUcsUfbHSIs7qsXA=;
 b=oReb2oEQ1vI/V1m0RoCKSi906tQp96jc4SRXg36Ds7mLZ2vMtftVdAruYqmsWcJYPiq7
 ZFfwkn+RJwK2rI4Z2mQhFTGyVK9f7IUL85tD7JPnreRsgs2ysf/odNW/HLzdlfMeU1Hd
 n1aFtyaIys0Oq8ab5V21QexhZMc0af+8tIPeOFMGkmZYuYqGZH7CwrhhNZ4QtT9aKTRW
 8MKlekhVL394NiWJeIeHjg2BsEtNmNu9ve9SQKlZtbe9C9dZgVeR1jC0BAxxSb+Hb05/
 e/IlBVduoIqLKlJM+cO8uu8WHeAlzwo6rt8BIObuKFDrXFvlObcnpmJLlmkRLXk7a/0Z mg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s6cbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:52:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QFkVxn060521;
 Wed, 26 Jan 2022 15:51:48 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by userp3020.oracle.com with ESMTP id 3drbcrcp5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:51:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDurVAixUCxaCYWjlxdTgXha7uL3ljErgQgJtt1ya8oh4OLIDmWQaiZje4CHW6C8PePu09+/PO063FZ67Z+EbNwCbabRN2NXxmK4jCKsATPGT833ZOSFew13ul5FS+ABmyQUOfF5BN5yBvTKKg761QxEyS6cVYDDN4+nruJQXsPurRHHJLGC5sWejxIpcnvUiFYKqC+dIPF+qgrdas41y+c8KLE8ZfftS5sQ0d/DU2nFrQbK/2cIS30YahBSmxbocQPXuGTQUp46bYPZgs/+dg5PvlsSEaR8xhBz7b2rYarfYqaOQkltfRpFcRn/v2SUl5IN3AurQBf4W3bpxvs4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf7Unl16OeU3MnTkbQNyM4WRQ2hZUcsUfbHSIs7qsXA=;
 b=Xqi5EzFX6gz0m0e50w2uFcWp80RT9NsFsuUgeaH6f0rHDbjo58HzcM/Ki+S7XTh8SbvituRUPimOWB2GYHPaxmMfi2fBOLzv1wf4B69g0MLc27tIM/TPoB417xIDbgQSgXCYTBdPdH0c6d+7iJ3vwDWITJb/Mkxc4HVcPmiC2IRrtDU1h3RPr/cawRta4D/F2BP0idU73+NK5bgAxMKKk6bhhohUL8kmRNaqNAU9vcgtWSvtTWwGjPmqOuKb9Aj++dcVhdttf4z24KdZQqY+RI7T5v/UX31m2gcQD1FtueGXx7c65Kizn7MLkqcio6sCORSsvoNdP5BBxJN0AvYstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf7Unl16OeU3MnTkbQNyM4WRQ2hZUcsUfbHSIs7qsXA=;
 b=YkRCaEKNJW3zSj9ARgjseKe2PgdHQ+t8gI9yNijGc+JDA7BNZWJp+p4EacrMKe1sUVo1/EHv9mBW2e7pC17zoSTSvT98rgbtO1r8lmjqIcAldmo1400v/gdR65zsIf3OVWRJGvOxKUA+0Tjo6mDubkUIbNSzc8gAJsByJgrniW4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY4PR10MB1333.namprd10.prod.outlook.com (2603:10b6:903:2a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 15:51:45 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 15:51:45 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote
 machine
Thread-Topic: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote
 machine
Thread-Index: AQHYDX18Inv/ubc/mUqScvbK4VQgOqxzljYAgACvUACAANBEgIAAaHYA
Date: Wed, 26 Jan 2022 15:51:45 +0000
Message-ID: <EB10EBC5-2C46-4754-8D6F-37E42C1BDDB7@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <1dee463f227f7a865877cd98f78e4ce48ce8ab32.1642626515.git.jag.raman@oracle.com>
 <Ye/UqqSippA8LTHK@stefanha-x1.localdomain>
 <5C83E65E-33B6-4282-9276-D651B2E56592@oracle.com>
 <YfEWb/hA68r3oVrt@stefanha-x1.localdomain>
In-Reply-To: <YfEWb/hA68r3oVrt@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc21eebc-0f8b-4cc8-a5d8-08d9e0e3c157
x-ms-traffictypediagnostic: CY4PR10MB1333:EE_
x-microsoft-antispam-prvs: <CY4PR10MB1333C10A72A9803455475D9B90209@CY4PR10MB1333.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Z0gwgzWkXovUkrQGKEJ2lVIZCpBKw0MHqQdNox6EsJMu1YJJ5tMOXzoh9KBBhW09MNSbInNskrKKc6XcHRHwOzh4xaadyeGazjosinUkX7JfS3L6GKvKY7zMBozu071hvNd/PjSUnJB4X9vv15cc31mW8ZpkYzwCrmJzGJpcLOA52UFeC0hXMtlAq+3NqONd1MRzyX5Vl/SN4LaCpiy9bRS1BIuGW2VVnvLl+hKB35Iot+kwpqhTzxY4eGJxyBuw91MsMwQUdA1Zl5t4QuRpPXNiBEVJe+Lp5iHC3IzbbT9ocF063JP4xfvcDostgojGFtR/auWhAe58KnVwbbV9mTHhqkRkmbWefzdXlwHZ5KiKLULdK6oo2CNps2QCFvbrYEvoJkeUMmWVadKRfqbMaVedCqbJgIkbrglrsDevRdy35h437CEevjt4fDslhaOOkjlmEBVRk2trEpdd0fLU+XUlnaQHiy9i6Waj2J44+jFg5KYCiYwsl7m05Ck35TyE7Jn9lhlOM27dObttpKZ03EqGDb0dAKvkYdgUEgPggkJOwmQ+yEde7KkaRd6xkZWDooF3oeyMRb/sS/dcyXghOf02tX7ysCP90aPp6hfi8YWobJwJHfdirvLbZL1qq+ELGrqfht5EyvmM1oyvb0if/PWfXoVoGGbexoJTs9HnnVDS4/kz0ElGTM51BuftvsNgRw6gtXEodgeL9f9dJbnVqitu3EGRXSaZ3rbRMNAGPMs27nKHY7zc+P72n4wM/+f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(71200400001)(44832011)(6506007)(7416002)(5660300002)(86362001)(91956017)(122000001)(6486002)(76116006)(66946007)(53546011)(4326008)(66446008)(83380400001)(66476007)(64756008)(508600001)(66556008)(8936002)(8676002)(38070700005)(33656002)(54906003)(6916009)(36756003)(316002)(2906002)(38100700002)(2616005)(107886003)(186003)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDF4L2IrMm1yUTE4SWUwcENFdmxFYmtJN3VJL0NwbUh3NzNCdld2RVZiWHlk?=
 =?utf-8?B?WXJNS1lSdWc4SXkvbmVIOXgrNHA5Ri8ybWNJVXRjd1liRVdYK0UyYnhwNGha?=
 =?utf-8?B?N1FSMVY3UFNXVnd3eWpVaTNWQ0QyeGdmUmN4c1pReC9lV0ZTTkxaalNrMUdF?=
 =?utf-8?B?U0tYcnloWGlqS3p2VS9XNG0weWVNcW8zVmQ2R3ZZc0RjL1o3VmU1Qk9XV2t2?=
 =?utf-8?B?QnJvWGtUeUNtMjBJSEQxbGdVOEtoc3VNdG14ZjFGdnFoTXV3MkozUFoyT1dv?=
 =?utf-8?B?d09zelZYdFZlMnp1SlZINk16Y0hrL0dyRHNHdGFwWXdvY0p1aHNscFFDcXRm?=
 =?utf-8?B?NnFLMHQxMUVFZVcyRXNza3FDaUZWRnpJeHd1V2dyay85TVgrekI2RnNHQUxG?=
 =?utf-8?B?UFROM3k0QitLd3hKWHMwUVByR09tL0hRQW1peTlVdjBmOXhRZFdNU1I0WkhY?=
 =?utf-8?B?bzVtMmtxeUF0ZHFEM1BKOWYyNC96dXRtM3V0b01iMDBWMzlxNzgxcVN5ZEJr?=
 =?utf-8?B?ZzJoRit1ZDhMWVA0alpDOGtQTWtGeDNlaTNCRS83SHpVR3ZkcFZScENoTFZz?=
 =?utf-8?B?Mm9VY0pnbW5BU1pWb0VzV0tQS3JTOGZHbG1HMDZ0MHZTQnhuUndqallCV0hp?=
 =?utf-8?B?Y0E4cHhENXR0VHIzaThvMlArUjRFZUJybTVpRW1GcWNQVVUrcmRnQ2lPQUZm?=
 =?utf-8?B?Y2lmd3FaYVZNV2dpS1BJSE9kcXA3RnBrTlh0dEJkMWxaQTBJcEZ3ZERMbnNw?=
 =?utf-8?B?ajV6cFhGODZPaE9HVzY1S3ZRVTRMcCtwRUxHTTlrRTZkZjRSaGxHTDdwMFNh?=
 =?utf-8?B?Rzh4NVA1UlNxc1A5NkQzbWhpN1NlZVV1VEY1c1RnUEVHY0dZNW5pR2tycnhY?=
 =?utf-8?B?VGFhSG5OZXl6NysrSlFvYXBQNUo2RHpydCtWNStZNzhGUzhiMnE4TGIycEhm?=
 =?utf-8?B?UnlockVWSERlYTF2MUZuMUhPT01Dbi9JMDhZSkEvc1ZTMHh2WkwxcWF4Ty9h?=
 =?utf-8?B?T2dtYk1hMUFIZU1pU3BERGpXVWlETGhmc01UbWkzTVlGMHl6Yzgza3Erajl1?=
 =?utf-8?B?VE40QVJBQVJjMEd3S3RNOUpPVFBTUzZkS2IzNzY5bDVCQnJGVmk0MStXVFFR?=
 =?utf-8?B?QzNTV0NaY3BsUHRUam1Rd0sxNmpwMnMwc0RTbzBZZ211QkxMTFZMR1hDVkRm?=
 =?utf-8?B?OTFnNXpCWThqaGJRN0I1Wm1NTzFXR3EvVHZoZW1mcm4rUGM0VDlmZ01HS2Ev?=
 =?utf-8?B?MVZ6V3BQbFlJY1dMYXdvNXZRc2l4ZS9CRFJXNFNVcWZOOTUrR1ljb2FybkM0?=
 =?utf-8?B?VjhMSmtBOTJOT3h0OUxRdTBoTHM4QWhnUkZyNjBObHkwbUxZcit5ZllKY3la?=
 =?utf-8?B?czlIdGZ1djN4YzFIT3padHcyTGQ4RFJtU0VBZlJYNmRxVDhJUFpkaVFnaVBV?=
 =?utf-8?B?ditBTUlhRTcxbnJncXhXV3UvRUswSGRjcnloNGFqSDNMTEVQSldDdFFEZnFz?=
 =?utf-8?B?SStSdnNyejFDdzI0UG5HaUV5RndYZDd5enRaTTh4ZW5PK2pwYi9Memd0WUY3?=
 =?utf-8?B?L2hGVm15V0s0Y0lDdVN4aEgrT2pkNnhWOU5zMjJZNEw5SlFsQi9IdDRQZjRC?=
 =?utf-8?B?QThRckxCOGVxUUwrV2lMc2ZhUEJzVWE1V1JScVlPcWkya2NXUWZacndIN1pN?=
 =?utf-8?B?MTR5NE5jeTZBaXdMdGRHMERrYXJwa2wvanZiRVl6bHk5aTFuSWFBOWxlVkJO?=
 =?utf-8?B?eXh6NHBHaWRxaU11NHVhendrV0RWam9BaFdWQzRFcmw0T09YVi9tNE9qL1NC?=
 =?utf-8?B?MzhWZTdtcUhHWmhadDUwekU4NExZMThpbXUzK1JDRmVsSjNWTHAvV2dOTHFz?=
 =?utf-8?B?WHQ0UUM0U01jMkg2ckE1TElUSm1zN00zYTd4VHZWTkhvbHRySThoNVRRdVdp?=
 =?utf-8?B?ZXg2SkRXWkVkVDJYT1M4WllYZDgxVUU4Unp0ajZLd0pzci9BUzBZUjFrdWN6?=
 =?utf-8?B?R3pYTmJ1Vk55K0lkaHNmZzRMNmFVZ1hNWlQ5OE14ekR3QUt0eFNxRUZqNWxh?=
 =?utf-8?B?cldhSmxWTmp2eTFUUTBkRG5pQ2tST2ZoRkMxRWw4enJOTS94R09mTDQ3SWNq?=
 =?utf-8?B?OXBsZWxsM2FEanhNM1lKc3QzeXpxQ09PalBxclFYL1hDcVAvT0xQSENBaE9I?=
 =?utf-8?B?c2Y0VHQxSGxna0JLQkZBN2tJRWM4R20rT2lNMlh6UEIyekNwL1cyWnN4NHBZ?=
 =?utf-8?B?dThRc0p6dFI1bW1nbzRYbEJTTFZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D270CCFF57BD9E498EC7907DB9A30892@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc21eebc-0f8b-4cc8-a5d8-08d9e0e3c157
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 15:51:45.4643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9LpoaBu7KQ9t3jpIDZrPZJR3Vq7WuQugqSloFvXzNtUMu31TK3Y5B1IWz8Kz7x/TfiEa1fxwlvR9QuCy+45cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1333
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260099
X-Proofpoint-GUID: VeK5b8XhXv7llyov0YSiBScRMaDyV-us
X-Proofpoint-ORIG-GUID: VeK5b8XhXv7llyov0YSiBScRMaDyV-us
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
 "berrange@redhat.com" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
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

DQoNCj4gT24gSmFuIDI2LCAyMDIyLCBhdCA0OjM3IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBKYW4gMjUsIDIwMjIgYXQgMDk6
MTI6MjhQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBKYW4gMjUs
IDIwMjIsIGF0IDU6NDQgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6NDE6NTZQTSAtMDUw
MCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVm
aW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+Pj4+IC0t
LQ0KPj4+PiBody9yZW1vdGUvbWFjaGluZS5jIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25z
KCspDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL21hY2hpbmUuYyBiL2h3L3Jl
bW90ZS9tYWNoaW5lLmMNCj4+Pj4gaW5kZXggMjIwZmYwMWFhOS4uMjIxYTg0MzBjMSAxMDA2NDQN
Cj4+Pj4gLS0tIGEvaHcvcmVtb3RlL21hY2hpbmUuYw0KPj4+PiArKysgYi9ody9yZW1vdGUvbWFj
aGluZS5jDQo+Pj4+IEBAIC0yMiw2ICsyMiw2MCBAQA0KPj4+PiAjaW5jbHVkZSAiaHcvcGNpL3Bj
aV9ob3N0LmgiDQo+Pj4+ICNpbmNsdWRlICJody9yZW1vdGUvaW9odWIuaCINCj4+Pj4gDQo+Pj4+
ICtzdGF0aWMgYm9vbCByZW1vdGVfbWFjaGluZV9nZXRfYnVzKGNvbnN0IGNoYXIgKnR5cGUsIEJ1
c1N0YXRlICoqYnVzLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBF
cnJvciAqKmVycnApDQo+Pj4+ICt7DQo+Pj4+ICsgICAgRVJSUF9HVUFSRCgpOw0KPj4+PiArICAg
IFJlbW90ZU1hY2hpbmVTdGF0ZSAqcyA9IFJFTU9URV9NQUNISU5FKGN1cnJlbnRfbWFjaGluZSk7
DQo+Pj4+ICsgICAgQnVzU3RhdGUgKnJvb3RfYnVzID0gTlVMTDsNCj4+Pj4gKyAgICBQQ0lCdXMg
Km5ld19wY2lfYnVzID0gTlVMTDsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICghYnVzKSB7DQo+Pj4+
ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgIkludmFsaWQgYXJndW1lbnQiKTsNCj4+Pj4gKyAg
ICAgICAgcmV0dXJuIGZhbHNlOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIGlmIChz
dHJjbXAodHlwZSwgVFlQRV9QQ0lfQlVTKSAmJiBzdHJjbXAodHlwZSwgVFlQRV9QQ0lfQlVTKSkg
ew0KPj4+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4g
KyAgICByb290X2J1cyA9IHFidXNfZmluZF9yZWN1cnNpdmUoc3lzYnVzX2dldF9kZWZhdWx0KCks
IE5VTEwsIFRZUEVfUENJRV9CVVMpOw0KPj4+PiArICAgIGlmICghcm9vdF9idXMpIHsNCj4+Pj4g
KyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiVW5hYmxlIHRvIGZpbmQgcm9vdCBQQ0kgZGV2aWNl
Iik7DQo+Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+
Pj4gKyAgICBuZXdfcGNpX2J1cyA9IHBjaV9pc29sX2J1c19uZXcocm9vdF9idXMsIHR5cGUsIGVy
cnApOw0KPj4+PiArICAgIGlmICghbmV3X3BjaV9idXMpIHsNCj4+Pj4gKyAgICAgICAgcmV0dXJu
IGZhbHNlOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgICpidXMgPSBCVVMobmV3X3Bj
aV9idXMpOw0KPj4+PiArDQo+Pj4+ICsgICAgcGNpX2J1c19pcnFzKG5ld19wY2lfYnVzLCByZW1v
dGVfaW9odWJfc2V0X2lycSwgcmVtb3RlX2lvaHViX21hcF9pcnEsDQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICZzLT5pb2h1YiwgUkVNT1RFX0lPSFVCX05CX1BJUlFTKTsNCj4+Pj4gKw0KPj4+PiAr
ICAgIHJldHVybiB0cnVlOw0KPj4+PiArfQ0KPj4+IA0KPj4+IENhbiB0aGUgdXNlciBjcmVhdGUg
dGhlIHNhbWUgUENJIGJ1cyB2aWEgUU1QIGNvbW1hbmRzPyBJZiBzbywgdGhlbiB0aGlzDQo+PiAN
Cj4+IEkgdGhpbmsgdGhlcmUgaXMgYSB3YXkgd2UgY291bGQgYWNoaWV2ZSBpdC4NCj4+IA0KPj4g
V2hlbiBJIGxvb2tlZCBhcm91bmQsIGJvdGggdGhlIGNvbW1hbmQgbGluZSBhbmQgdGhlIFFNUCBk
aWRu4oCZdCBoYXZlIGEgZGlyZWN0DQo+PiB3YXkgdG8gY3JlYXRlIGEgYnVzLiBIb3dldmVyLCB0
aGVyZSBhcmUgc29tZSBpbmRpcmVjdCB3YXlzLiBGb3IgZXhhbXBsZSwgdGhlDQo+PiBUWVBFX0xT
STUzQzg5NUEgZGV2aWNlIGNyZWF0ZXMgYSBTQ1NJIGJ1cyB0byBhdHRhY2ggU0NTSSBkZXZpY2Vz
LiBTaW1pbGFybHksDQo+PiB0aGVyZSBhcmUgc29tZSBzcGVjaWFsIFBDSSBkZXZpY2VzIGxpa2Ug
VFlQRV9QQ0lfQlJJREdFIHdoaWNoIGNyZWF0ZSBhDQo+PiBzZWNvbmRhcnkgUENJIGJ1cy4NCj4+
IA0KPj4gU2ltaWxhcmx5LCB3ZSBjb3VsZCBpbXBsZW1lbnQgYSBQQ0kgZGV2aWNlIHRoYXQgY3Jl
YXRlcyBhIFBDSSBidXMgd2l0aA0KPj4gaXNvbGF0ZWQgYWRkcmVzcyBzcGFjZXMuDQo+IA0KPiBF
eGFjdGx5LiBkZXZpY2VfYWRkIGluc3RhbnRpYXRlcyBEZXZpY2VTdGF0ZXMsIG5vdCBidXNzZXMs
IHNvIHRoZXJlDQo+IG5lZWRzIHRvIGJlIGEgcGFyZW50IGRldmljZSBsaWtlIGEgU0NTSSBjb250
cm9sbGVyLCBhIFBDSSBicmlkZ2UsIGV0Yw0KPiB0aGF0IG93bnMgYW5kIGNyZWF0ZXMgdGhlIGJ1
cy4NCj4gDQo+Pj4gaXMganVzdCBhIGNvbnZlbmllbmNlIHRoYXQgc2F2ZXMgdGhlIGV4dHJhIHN0
ZXAuIE9yIGlzIHRoZXJlIHNvbWUgbWFnaWMNCj4+PiB0aGF0IGNhbm5vdCBiZSBkb25lIHZpYSBR
TVAgZGV2aWNlX2FkZD8NCj4+PiANCj4+PiBJJ20gYXNraW5nIGJlY2F1c2UgdGhlcmUgYXJlIDMg
b2JqZWN0cyBpbnZvbHZlZCBhbmQgSSdkIGxpa2UgdG8NCj4+PiB1bmRlcnN0YW5kIHRoZSBsaWZl
Y3ljbGUvZGVwZW5kZW5jaWVzOg0KPj4+IDEuIFRoZSBQQ0lEZXZpY2Ugd2Ugd2lzaCB0byBleHBv
cnQuDQo+Pj4gMi4gVGhlIFBDSUJ1cyB3aXRoIGlzb2xhdGVkIGFkZHJlc3Mgc3BhY2VzIHRoYXQg
Y29udGFpbnMgdGhlIFBDSURldmljZS4NCj4+PiAzLiBUaGUgdmZpby11c2VyIHNlcnZlciB0aGF0
IGV4cG9ydHMgYSBnaXZlbiBQQ0lEZXZpY2UuDQo+Pj4gDQo+Pj4gVXNlcnMgY2FuIGFscmVhZHkg
Y3JlYXRlIHRoZSBQQ0lEZXZpY2UgdmlhIGhvdHBsdWcgYW5kIHRoZSB2ZmlvLXVzZXINCj4+PiBz
ZXJ2ZXIgdmlhIG9iamVjdC1hZGQuIFNvIGlmIHRoZXJlJ3Mgbm8gbWFnaWMgdGhleSBjb3VsZCBh
bHNvIGNyZWF0ZSB0aGUNCj4+PiBQQ0kgYnVzOg0KPj4+IDEuIGRldmljZV9hZGQgLi4uc29tZSBQ
Q0kgYnVzIHN0dWZmIGhlcmUuLi4saWQ9aXNvbC1wY2ktYnVzMA0KPj4+IDIuIGRldmljZV9hZGQg
Li4udGhlIFBDSURldmljZS4uLixidXM9aXNvbC1wY2ktYnVzMCxpZD1teWRldg0KPj4+IDMuIG9i
amVjdC1hZGQgeC12ZmlvLXVzZXItc2VydmVyLGRldmljZT1teWRldg0KPj4gDQo+PiBXZSBhcmUg
YWJsZSB0byBkbyAyICYgMyBhbHJlYWR5LiBXZSBjb3VsZCBpbnRyb2R1Y2UgYSBQQ0kgZGV2aWNl
IHRoYXQNCj4+IGNyZWF0ZXMgYW4gaXNvbGF0ZWQgUENJIGJ1cy4gVGhhdCB3b3VsZCBjb3ZlciBz
dGVwIDEgb3V0bGluZWQgYWJvdmUuDQo+IA0KPiBJIHdvbmRlciBpZiBhIG5ldyBkZXZpY2UgaXMg
bmVlZGVkIG9yIHdoZXRoZXIgaXQncyBwb3NzaWJsZSB0byBhZGQgYW4NCj4gaXNvbF9hcz1vbnxv
ZmYgKGRlZmF1bHQ6IG9mZikgb3B0aW9uIHRvIGFuIGV4aXN0aW5nIFBDSSBicmlkZ2UvZXhwYW5k
ZXI/DQo+IEhvcGVmdWxseSBtb3N0IG9mIHRoZSBjb2RlIGlzIGFscmVhZHkgdGhlcmUuDQoNCk9L
LCBpdCBtYWtlcyBzZW5zZSB0byBhZGQgaXNvbF9hcz1vbnxvZmYgKGRlZmF1bHQ6IG9mZikgb3B0
aW9uIHRvIGFuIGV4aXN0aW5nDQpQQ0kgYnJpZGdlL2V4cGFuZGVyLiBXaWxsIHNob3J0bHkgY29u
ZmlybSB3aXRoIHlvdSB0aGUgZGV2aWNlIHRoYXQgc2VlbXMNCmludGVyZXN0aW5nLg0KDQotLQ0K
SmFnDQoNCj4gDQo+IFN0ZWZhbg0KDQo=

