Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507CF4EB3EA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 21:09:06 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZHDE-00077F-VB
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 15:09:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZHBF-0006KQ-AY
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:07:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZHBB-0002Mp-MO
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:07:00 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22THsDdh029587; 
 Tue, 29 Mar 2022 19:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=R1LoYeV9CaLYqZZjCd0Pf6/35jSrrlQgaoFeDqd+q98=;
 b=vK3pjuzw1WUq/JpC1gwXDOM76a5aPQYVV0C+JonBbfYB1mCC0bvxS7TYEqV7ej9Qrryw
 G34frv1TwDY+Rru5vQZbkeyndL609ZviM7L3f721ekiTjl6ecTdZUvjAo2788IJkBJGs
 S468s2XlsKk0oJ8EixHZrUjUTxKTgZg7Spwo+qrO4owPMJomzxKXJbZQIskT+5zt54zL
 +qVaYfb7NxaSrsQCxaQpn6zZG6xFtd+GAWQqqzcsW715skTKdXh2HtZkbYq5OCp/I+l8
 e1xsHrJpJ7QzrRcIvuJSheFtnnboOflIAVuWSACLuuVEDb7ZEFFuLOzy2+Wdhu0mf/xC jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1se0fj7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 19:06:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TJ5YgD127129;
 Tue, 29 Mar 2022 19:06:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by userp3020.oracle.com with ESMTP id 3f1v9fhqp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 19:06:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+BfipraLjz0qXbbJ4e3LM4091oyfadnSBFpGPvqIDxwXy3uOPhhNKFfWeO+xWAzpK1cHC+m5JMMJ9GaXK4y0f7aBI3voE1DVA6t2ZU/5swUOV42TzvdTaTBpsnIwITYNE0IHNvRmWS5y4vI4aPnrhFpoAhZFj5r59A0TxRP1/Kubf8n1TKMnYw/XRqHX4+pt4SuAOGc9SC3mo0jmJNFwjh1Pap7AI8sI/MuIMVGdEkvTeOdf1CeV6QoXTwkA2UT7RrlEh9hoTzHu2FzAGHZXoK4pQ2VFl8zGPZR4eAkR2RWPQ7nqKUlIxFT0JjIOC7L9dhmPvX8OsLFtyaYjg4zsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1LoYeV9CaLYqZZjCd0Pf6/35jSrrlQgaoFeDqd+q98=;
 b=jdVBmy1hrVEXBoxeaunpxDqAK+HxJuKyPCciuLSI3dyYeD7YtbLlS5spkoG1ZUyxcUp7X6Mx7AGAaXcMABDql+94cK6Dq2UFLPHXZG5yJQLHknjJMdHCHyx42zRrwqE4OPNaIv8UfVRWgQX/wceNnRQcYon/gx3fF3mz7+9FkPMmqSjEEb90vdElNkLpU0ICU8vv/NLCmcftYDcn7CkF6PXkqRysd1VPek86tJ17NWDx95chrmEAEKpGb/zbaRH6aZf227naRRxefn00vfH6FK0FpB3ONBWvmcCJi3Hfhar9xJ6pa68CTjUmV6PDHlzQ6YrnBxHiKlSG/w0vZWNJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1LoYeV9CaLYqZZjCd0Pf6/35jSrrlQgaoFeDqd+q98=;
 b=iDEplmHmhJC8kjz6Z1MiGL67bFa4C0Uck4agzwQ8MUA1nGTvaCRl/69wqBQqp+ir98EdRPFdg47qMLIn/gAwQdpf1OO1CC5MetUyupwKurgeBulE5ZDAKys8H5/71o0p6ccMjHIJflg9W9Akl5C8Qou+EypGxFszce2S8D0Yu3E=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BY5PR10MB4003.namprd10.prod.outlook.com (2603:10b6:a03:1fc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 19:06:46 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5123.016; Tue, 29 Mar 2022
 19:06:46 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 15/19] vfio-user: handle device interrupts
Thread-Topic: [PATCH v6 15/19] vfio-user: handle device interrupts
Thread-Index: AQHYI8rrch0yMf4HZ0uzMcxrO0jot6yz02qAgB68vICABBm2gIAATtGA
Date: Tue, 29 Mar 2022 19:06:46 +0000
Message-ID: <9B3B2C94-14B6-4415-9C15-E8738EB52013@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
 <YiXdUbz3r1xORJKD@stefanha-x1.localdomain>
 <67EFF59D-E1DB-4830-B5C2-B58CCA9A35E6@oracle.com>
 <YkMWp0lUJAHhivJA@stefanha-x1.localdomain>
In-Reply-To: <YkMWp0lUJAHhivJA@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac5a382a-e08a-4f02-71e2-08da11b7457e
x-ms-traffictypediagnostic: BY5PR10MB4003:EE_
x-microsoft-antispam-prvs: <BY5PR10MB400329A252C9026FA9473125901E9@BY5PR10MB4003.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJ5YgDtPbkGdKI3aAOvHWCdIr9xIHTq6AcP7HdpPmLljmF5ZgX6T6iQO7xHrTtSogLhzokSq9CR4pw1Tyz5Z07bp2nFk0n3cALWg9SUepynhoIYhyUtljp3W4kubggES+pW8GGDZrz74lY2yQS/vFSR2UQfaCRs14D5kjVD2Gbbf80pMkY/7gVO4tVsWAdA01zZhM7kmsuAVj/sK3r6lLZGaQ5NO3o7+6Q62foTDf7YnrqXx73NAiYFfwDtb2rz0544TLKpq8jX+BH35WvfgfXMCjmMrTLxtlEZ0uvYrXn3OXeqeL++7hiiTIFS4ykTbgSg3toaZayu9prLIQys3V4GwjWfeI/KG6hpkhN6N5lKOws/6AuQ/1QR0wziMK5aty3HPZw545sKW6KjumFF/+PQgvxYd6sKy9Djb7Al5IcC5WMJlUT5q2734CUkGHWilgcc8BxmDhzBz8bXk1fVfTEv1S3CKFxD+cRXpqVp4pepHqhLsjmEOx2GJQ1+t+90kuXqdF+TbqW/O4rFdTU9Pp2Op1HlLS5NLbvISUxsAbRP0tErNfBgHDWeTY1ZNj3EGb0G5Ik+hm5B9KI/2VP2Rrdd9iIAXSJm8aJFxflP6+7+om+NrI/Pu6Mafl5oJhTNs2jtU4Acwwfqzh71/y8iaJ3lNcz1ibwz5yU4GHZjdBOcBd9LR4M5cZf/EIDk8+wA2TPqELt10G1gbkHMTE69dNmSgRBbC9t50nNpvl0WVNRc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(508600001)(6916009)(54906003)(86362001)(71200400001)(38100700002)(4326008)(122000001)(316002)(66446008)(2616005)(5660300002)(64756008)(36756003)(8936002)(7416002)(6486002)(186003)(6506007)(33656002)(44832011)(66556008)(66476007)(2906002)(76116006)(66946007)(91956017)(53546011)(38070700005)(83380400001)(6512007)(107886003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWRqbXBCaklIOGNYYS9weHpzazhQUWFaZVI2K0RHbm9YaUxBeTNWc29mbHBN?=
 =?utf-8?B?b2x5ZHUzMHdBdHNDTkkycEdvNkY0ZkxPNlpnWCtHQmZDaUJ0eDRXV09YaktK?=
 =?utf-8?B?aThPdWVvOGZTRTFxOEU1S1gxNzFwSEpEUTJiT1k3U3VHZFVOdXRYbmxoUWNl?=
 =?utf-8?B?dDVrVjRIUGlhZ0lmT0NqNTR6UWZRcHU2Z2NUdG01UHQrOWRJMGdCNkYwWGtS?=
 =?utf-8?B?THplb0ZhWnl4OHo2QXFtTi96S0NldWVDemdoUlBHSW5yOHFoMHAzTHloT3JO?=
 =?utf-8?B?K2JhUHl5TG9oRFRKa21hcm9RTFBncDFZa3UydUg1Tk0yakRySUE0Q3FBTFBS?=
 =?utf-8?B?TmN1aXlNcjI1bGlqTEp6b2ZhM3FCMDN5ZER1WkwvekdmMDhMRzY1WnR3Wkwr?=
 =?utf-8?B?ZndHSGVRZUdueGw2ZEM0QXljNERaZ09NeWpjbU55dHEvRzhSS2N6Ky9vYWJu?=
 =?utf-8?B?WFVNaW5vd3pkOG9FV056WTlkSW9iczRlN2l1Nm9sUkNWU2NVTzd2VFBtTldY?=
 =?utf-8?B?ZThOSlNrcUdyZXZTWlBzK3ljSEhHN1VmRmNSeS9CbllIbG9za1I5SkVMN1lZ?=
 =?utf-8?B?L0t2T1NUTDUzeXFIODd1MTVzeC9pRFAwUUFmZGhvU0lqdTRCaG8razBnVlcv?=
 =?utf-8?B?cVM0NTQwdENCdnJLaXZpNVdBdGNZTkJCVDk1eXlIWEhvSGxlTzU0TmVaK1VM?=
 =?utf-8?B?OUpPV2FBZ25MdGtGQ2x2Q0U3NXVvOVRnak5xbC92dHNrOThzbWNLUEVoSzlC?=
 =?utf-8?B?WEJ1VkF0RkU3anFqMXNYOGtTNFh5RmNyRGVWK1plYUdMTFl2QkRYbzJHUjNZ?=
 =?utf-8?B?UDF1cEpxb3Rsa3FqK3dNNXVUOFBsb2pidHhaeTlNT1lDS0wxM3U5ZVZnMWY5?=
 =?utf-8?B?VUNTRTk5amNieWh3RTZZa1UyWGZkYjY1NFFUdDY5RjdUWHdaWEtSSDdNRC9y?=
 =?utf-8?B?SnRPR2luWWd6c3hRenhCSlFqOVc0Yy9aUkVSa2VxcldoK0EveHVZVEtDQUFX?=
 =?utf-8?B?SDZUM1Q5clU5QXp5YWh4N2pNMlk0QjBBRW4xZlFoMDcwbHNMMzVWYnM1VUZP?=
 =?utf-8?B?SFJVZUhsWlJSVytSckxBVVZXK2RpdVhzdkduclJNUUFnN0RMc0xFaVZ2UFV3?=
 =?utf-8?B?T1dsVW1HWVVGeGcyZmdsbVdEd2JBVExqakRBd1RqcExLNk1vL3pVeGE5T0ds?=
 =?utf-8?B?ekk5OWF3RnVWdEJQaDEzNGJud2gyK2tia1NXWjhzajdNTlYyTVlpUVNKOEN5?=
 =?utf-8?B?UDhJOEdLS0MrY0paWGFEcmd4T0lOUWt2YkdjNE13YWVXVGxVSDg3NVowci8z?=
 =?utf-8?B?RUhCMHpVOTZSOWlPYzBCeHZJWlNZdTMzM1JLZk9BeHN4RTA3aDVNOS9ld0wv?=
 =?utf-8?B?VzA0RnhDNzJaUWxES3VaV1EvRzF0QWxPbWsreEhpZ3dwTXFGTGw1SW5CUGh6?=
 =?utf-8?B?L0NiSEx2UUZyOEN1WVZLNldRcDZZajdlSmoxd1EyNGJUQzFWK3dXbHZCa1J2?=
 =?utf-8?B?UXhOeUF0QUZwM0pza2RJR0ZMMHV3eGE2bVdVKzVYOWI5cEdRSjl6SEhvRzYy?=
 =?utf-8?B?MHhHTUExY0RkYWlrRVdTcmlaOHp0cHRna1R0RHMycG1vbEx5RkxaZGdSRitL?=
 =?utf-8?B?Q0w2RS84RnhMb2pJQmg2LzJweUlqNDV6QXdJSzM3MENXWWxoSzQ2R2IzdkhT?=
 =?utf-8?B?U3JIQkNiWVZFeGNlNDVmVUVNeWxqcGtOVGU4azVIaVV1WXI4aVdZT1FwMFB1?=
 =?utf-8?B?UkRXZ1dKRGRzU29SenIrdy82VmNDZG5nN3BuVWt3Qnlhb2lodU8zUGZXYnhE?=
 =?utf-8?B?YW05bDkrclBTNm00WkxpazNmc0xHQWZ5ZW5GV2ZORjMyYU5VK05iaHNaZ2hY?=
 =?utf-8?B?czV6SWpZN0lOeEVoVVEvTjBIRkFDcnJtYUJkUzE0eEtPQW93b0lZOEs4R1hU?=
 =?utf-8?B?NmVTc2dTbk5Xaks0L0Z0aFhzOWdHcVJkQWxWZTE5NWpYVTlHUy9Kc3pFRS94?=
 =?utf-8?B?Wk9zL3Y2cUptSUdPdDZHRWozMUlKTTlJclhkMXNjNWVzd2U4Z3c5R1ZZVCt2?=
 =?utf-8?B?OEJkSzVGZmhmSUtKcFlXeUVEeEl3WlJQTUhyYmRFMktXNktJajNib29VdWxF?=
 =?utf-8?B?Kyt4K1dWSFl2RUFaZWpxbHo3ejlKZTUxa0M2WXdKczQ2aTBiRnpVU0pVeFk0?=
 =?utf-8?B?M05icnQwWFpTQXJOaG9KN0pGbnA1bDBLMTJLcFlwUFoyeEI5ZW80aWpNaUtO?=
 =?utf-8?B?cXpDSVJoOWhRUFhSWWZIb1p1dmUzWjVIVmdiREdiamZNdzFUM3kzcS9JNitj?=
 =?utf-8?B?WUJPVVVnSDNIaUVVbVZDK2xtZVRGbDVqOEJpV1dCRmtiOE1JeEZ3RUJhTWRu?=
 =?utf-8?Q?hYzA42tfmeOq2VGFNl6aCakTMLLnvKF0yyaEi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D35CE10C90ECA48B2C38CD3BA21563A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5a382a-e08a-4f02-71e2-08da11b7457e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 19:06:46.7854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVrWmxy4RdL0IhMNiZSCkgZDdtsyEAkFyAXOr8FQUWMZN9a7UZMP71dRsyoTTQ+a4MGLARHZJOD+nH1zGUHSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4003
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290106
X-Proofpoint-ORIG-GUID: 4dreSMYEgZ3S0Yl2hWzGVOb5LbOWwKaw
X-Proofpoint-GUID: 4dreSMYEgZ3S0Yl2hWzGVOb5LbOWwKaw
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDI5LCAyMDIyLCBhdCAxMDoyNCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFNhdCwgTWFyIDI2LCAyMDIyIGF0IDEx
OjQ3OjM2UE0gKzAwMDAsIEphZyBSYW1hbiB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gTWFyIDcs
IDIwMjIsIGF0IDU6MjQgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMDI6NDk6MDJBTSAtMDUw
MCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+IEZvcndhcmQgcmVtb3RlIGRldmljZSdz
IGludGVycnVwdHMgdG8gdGhlIGd1ZXN0DQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGVu
YSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+
PiAtLS0NCj4+Pj4gaW5jbHVkZS9ody9wY2kvcGNpLmggICAgICAgICAgICAgIHwgICA2ICsrDQo+
Pj4+IGluY2x1ZGUvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouaCB8ICAgNiArKw0KPj4+PiBody9w
Y2kvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKysrLQ0KPj4+PiBody9wY2kvbXNp
eC5jICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKysrLQ0KPj4+PiBody9yZW1vdGUvbWFjaGlu
ZS5jICAgICAgICAgICAgICAgfCAgMTEgKy0tDQo+Pj4+IGh3L3JlbW90ZS92ZmlvLXVzZXItb2Jq
LmMgICAgICAgICB8IDEwNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gc3R1
YnMvdmZpby11c2VyLW9iai5jICAgICAgICAgICAgIHwgICA2ICsrDQo+Pj4+IE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+Pj4+IGh3L3JlbW90ZS90cmFjZS1ldmVu
dHMgICAgICAgICAgICB8ICAgMSArDQo+Pj4+IHN0dWJzL21lc29uLmJ1aWxkICAgICAgICAgICAg
ICAgICB8ICAgMSArDQo+Pj4+IDEwIGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9yZW1vdGUv
dmZpby11c2VyLW9iai5oDQo+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBzdHVicy92ZmlvLXVzZXIt
b2JqLmMNCj4+Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3BjaS9wY2kuaCBiL2lu
Y2x1ZGUvaHcvcGNpL3BjaS5oDQo+Pj4+IGluZGV4IGMzZjNjOTA0NzMuLmQ0MmQ1MjZhNDggMTAw
NjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUv
aHcvcGNpL3BjaS5oDQo+Pj4+IEBAIC0xMjksNiArMTI5LDggQEAgdHlwZWRlZiB1aW50MzJfdCBQ
Q0lDb25maWdSZWFkRnVuYyhQQ0lEZXZpY2UgKnBjaV9kZXYsDQo+Pj4+IHR5cGVkZWYgdm9pZCBQ
Q0lNYXBJT1JlZ2lvbkZ1bmMoUENJRGV2aWNlICpwY2lfZGV2LCBpbnQgcmVnaW9uX251bSwNCj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWJ1c190IGFkZHIsIHBjaWJ1c190
IHNpemUsIGludCB0eXBlKTsNCj4+Pj4gdHlwZWRlZiB2b2lkIFBDSVVucmVnaXN0ZXJGdW5jKFBD
SURldmljZSAqcGNpX2Rldik7DQo+Pj4+ICt0eXBlZGVmIHZvaWQgUENJTVNJTm90aWZ5KFBDSURl
dmljZSAqcGNpX2RldiwgdW5zaWduZWQgdmVjdG9yKTsNCj4+Pj4gK3R5cGVkZWYgdm9pZCBQQ0lN
U0l4Tm90aWZ5KFBDSURldmljZSAqcGNpX2RldiwgdW5zaWduZWQgdmVjdG9yKTsNCj4+Pj4gDQo+
Pj4+IHR5cGVkZWYgc3RydWN0IFBDSUlPUmVnaW9uIHsNCj4+Pj4gICAgcGNpYnVzX3QgYWRkcjsg
LyogY3VycmVudCBQQ0kgbWFwcGluZyBhZGRyZXNzLiAtMSBtZWFucyBub3QgbWFwcGVkICovDQo+
Pj4+IEBAIC0zMjMsNiArMzI1LDEwIEBAIHN0cnVjdCBQQ0lEZXZpY2Ugew0KPj4+PiAgICAvKiBT
cGFjZSB0byBzdG9yZSBNU0lYIHRhYmxlICYgcGVuZGluZyBiaXQgYXJyYXkgKi8NCj4+Pj4gICAg
dWludDhfdCAqbXNpeF90YWJsZTsNCj4+Pj4gICAgdWludDhfdCAqbXNpeF9wYmE7DQo+Pj4+ICsN
Cj4+Pj4gKyAgICBQQ0lNU0lOb3RpZnkgKm1zaV9ub3RpZnk7DQo+Pj4+ICsgICAgUENJTVNJeE5v
dGlmeSAqbXNpeF9ub3RpZnk7DQo+Pj4+ICsNCj4+Pj4gICAgLyogTWVtb3J5UmVnaW9uIGNvbnRh
aW5lciBmb3IgbXNpeCBleGNsdXNpdmUgQkFSIHNldHVwICovDQo+Pj4+ICAgIE1lbW9yeVJlZ2lv
biBtc2l4X2V4Y2x1c2l2ZV9iYXI7DQo+Pj4+ICAgIC8qIE1lbW9yeSBSZWdpb25zIGZvciBNU0lY
IHRhYmxlIGFuZCBwZW5kaW5nIGJpdCBlbnRyaWVzLiAqLw0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5oIGIvaW5jbHVkZS9ody9yZW1vdGUvdmZpby11
c2VyLW9iai5oDQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAw
MDAuLjg3YWI3OGI4NzUNCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9pbmNsdWRlL2h3
L3JlbW90ZS92ZmlvLXVzZXItb2JqLmgNCj4+Pj4gQEAgLTAsMCArMSw2IEBADQo+Pj4+ICsjaWZu
ZGVmIFZGSU9fVVNFUl9PQkpfSA0KPj4+PiArI2RlZmluZSBWRklPX1VTRVJfT0JKX0gNCj4+Pj4g
Kw0KPj4+PiArdm9pZCB2ZnVfb2JqZWN0X3NldF9idXNfaXJxKFBDSUJ1cyAqcGNpX2J1cyk7DQo+
Pj4+ICsNCj4+Pj4gKyNlbmRpZg0KPj4+PiBkaWZmIC0tZ2l0IGEvaHcvcGNpL21zaS5jIGIvaHcv
cGNpL21zaS5jDQo+Pj4+IGluZGV4IDQ3ZDJiMGYzM2MuLjkzZjVlNDAwY2MgMTAwNjQ0DQo+Pj4+
IC0tLSBhL2h3L3BjaS9tc2kuYw0KPj4+PiArKysgYi9ody9wY2kvbXNpLmMNCj4+Pj4gQEAgLTUx
LDYgKzUxLDggQEANCj4+Pj4gKi8NCj4+Pj4gYm9vbCBtc2lfbm9uYnJva2VuOw0KPj4+PiANCj4+
Pj4gK3N0YXRpYyB2b2lkIHBjaV9tc2lfbm90aWZ5KFBDSURldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgdmVjdG9yKTsNCj4+Pj4gKw0KPj4+PiAvKiBJZiB3ZSBnZXQgcmlkIG9mIGNhcCBhbGxvY2F0
b3IsIHdlIHdvbid0IG5lZWQgdGhpcy4gKi8NCj4+Pj4gc3RhdGljIGlubGluZSB1aW50OF90IG1z
aV9jYXBfc2l6ZW9mKHVpbnQxNl90IGZsYWdzKQ0KPj4+PiB7DQo+Pj4+IEBAIC0yMjUsNiArMjI3
LDggQEAgaW50IG1zaV9pbml0KHN0cnVjdCBQQ0lEZXZpY2UgKmRldiwgdWludDhfdCBvZmZzZXQs
DQo+Pj4+ICAgIGRldi0+bXNpX2NhcCA9IGNvbmZpZ19vZmZzZXQ7DQo+Pj4+ICAgIGRldi0+Y2Fw
X3ByZXNlbnQgfD0gUUVNVV9QQ0lfQ0FQX01TSTsNCj4+Pj4gDQo+Pj4+ICsgICAgZGV2LT5tc2lf
bm90aWZ5ID0gcGNpX21zaV9ub3RpZnk7DQo+Pj4gDQo+Pj4gQXJlIHlvdSBzdXJlIGl0J3MgY29y
cmVjdCB0byBza2lwIHRoZSBtc2lfaXNfbWFza2VkKCkgbG9naWM/IEkgdGhpbmsgdGhlDQo+Pj4g
Y2FsbGJhY2sgZnVuY3Rpb24gc2hvdWxkIG9ubHkgb3ZlcnJpZGUgdGhlIGJlaGF2aW9yIG9mDQo+
Pj4gbXNpX3NlbmRfbWVzc2FnZSgpLCBub3QgdGhlIGVudGlyZSBtc2lfbm90aWZ5KCkgZnVuY3Rp
b24uDQo+Pj4gDQo+Pj4gVGhlIHNhbWUgYXBwbGllcyB0byBNU0ktWC4NCj4+IA0KPj4gSGkgU3Rl
ZmFuLA0KPj4gDQo+PiBXZSBub3RpY2VkIHRoYXQgdGhlIGNsaWVudCBpcyBoYW5kbGluZyB0aGUg
bWFza2luZyBhbmQgdW5tYXNraW5nIG9mIE1TSXgNCj4+IGludGVycnVwdHMuDQo+PiANCj4+IENv
bmNlcm5pbmcgTVNJeCwgdmZpb19tc2l4X3ZlY3Rvcl91c2UoKSBoYW5kbGVzIHVubWFza2luZyBh
bmQNCj4+IHZmaW9fbXNpeF92ZWN0b3JfcmVsZWFzZSgpIGhhbmRsZXMgbWFza2luZyBvcGVyYXRp
b25zLiBUaGUgc2VydmVyIHRyaWdnZXJzDQo+PiBhbiBNU0l4IGludGVycnVwdCBieSBzaWduYWxp
bmcgdGhlIGV2ZW50ZmQgYXNzb2NpYXRlZCB3aXRoIHRoZSB2ZWN0b3IuIElmIHRoZSB2ZWN0b3IN
Cj4+IGlzIHVubWFza2VkLCB0aGUgaW50ZXJydXB0IGJ5cGFzc2VzIHRoZSBjbGllbnQvUUVNVSBh
bmQgdGFrZXMgdGhpcw0KPj4gcGF0aDog4oCcc2VydmVyIC0+IEtWTSAtPiBndWVzdOKAnS4gV2hl
cmVhcywgaWYgdGhlIHZlY3RvciBpcyBtYXNrZWQsIGl0IGxhbmRzIG9uIHRoZQ0KPj4gY2xpZW50
IHZpYTog4oCcc2VydmVyIC0+IHZmaW9fbXNpX2ludGVycnVwdCgp4oCdLiB2ZmlvX21zaV9pbnRl
cnJ1cHQoKSBzdXBwcmVzc2VzIHRoZQ0KPj4gaW50ZXJydXB0IGlmIHRoZSB2ZWN0b3IgaXMgbWFz
a2VkLiBUaGUgdXNlIGFuZCByZWxlYXNlIGZ1bmN0aW9ucyBzd2l0Y2ggdGhlIHNlcnZlcuKAmXMN
Cj4+IGV2ZW50ZmQgYmV0d2VlbiBWRklPUENJRGV2aWNlLT5WRklPTVNJVmVjdG9yW2ldLT5rdm1f
aW50ZXJydXB0IGFuZA0KPj4gVkZJT1BDSURldmljZS0+VkZJT01TSVZlY3RvcltpXS0+aW50ZXJy
dXB0IHVzaW5nIHRoZQ0KPj4gVkZJT19ERVZJQ0VfU0VUX0lSUVMgbWVzc2FnZS4NCj4+IA0KPj4g
Q29uY2VybmluZyBNU0ksIHRoZSBzZXJ2ZXIgc2hvdWxkIGNoZWNrIGlmIHRoZSB2ZWN0b3IgaXMg
dW5tYXNrZWQgYmVmb3JlDQo+PiB0cmlnZ2VyaW5nLiBUaGUgc2VydmVyIGlzIG5vdCBkb2luZyBp
dCBwcmVzZW50bHksIHdpbGwgdXBkYXRlIGl0LiBGb3Igc29tZSByZWFzb24sDQo+PiBJIGhhZCBh
c3N1bWVkIHRoYXQgTVNJIGhhbmRsaW5nIGlzIHNpbWlsYXIgdG8gTVNJeCBpbiB0ZXJtcyBvZiBt
YXNraW5nIC0gc29ycnkNCj4+IGFib3V0IHRoYXQuIFRoZSBtYXNraW5nIGFuZCB1bm1hc2tpbmcg
aW5mb3JtYXRpb24gZm9yIE1TSSBpcyBpbiB0aGUgY29uZmlnIHNwYWNlDQo+PiByZWdpc3RlcnMs
IHNvIHRoZSBzZXJ2ZXIgc2hvdWxkIGhhdmUgdGhpcyBpbmZvcm1hdGlvbi4NCj4+IA0KPj4gWW91
IGhhZCBwcmV2aW91c2x5IHN1Z2dlc3RlZCB1c2luZyBjYWxsYmFja3MgZm9yIG1zaV9nZXRfbWVz
c2FnZSAmDQo+PiBtc2lfc2VuZF9tZXNzYWdlLCBjb25zaWRlcmluZyB0aGUgbWFza2luZyBpc3N1
ZS4gR2l2ZW4gTVNJeCBtYXNraW5nDQo+PiAoaW5jbHVkaW5nIHRoZSBNU0l4IHRhYmxlIEJBUikg
aXMgaGFuZGxlZCBhdCB0aGUgY2xpZW50LCB0aGUgbWFza2luZyBpbmZvcm1hdGlvbg0KPj4gZG9l
c27igJl0IHJlYWNoIHRoZSBzZXJ2ZXIgLSBzbyBtc2l4X25vdGlmeSB3aWxsIG5ldmVyIGludm9r
ZSB0aGUNCj4+IG1zaV9zZW5kX21lc3NhZ2UgY2FsbGJhY2sgLSBhbGwgdGhlIHZlY3RvcnMgcmVt
YWluIG1hc2tlZCBhdCB0aGUgc2VydmVyDQo+PiBlbmQgKG1zaXhfaW5pdCgpIC0+IG1zaXhfbWFz
a19hbGwoKSkuDQo+IA0KPiBJIHdhcyBleHBlY3RpbmcgdmZpby11c2VyIGRldmljZXMgdG8gYmUg
aW52b2x2ZWQgaW4gTVNJLVggbWFza2luZyBzbw0KPiB0aGV5IGNhbiBpbXBsZW1lbnQgdGhlIFBl
bmRpbmcgYml0IHNlbWFudGljcyBkZXNjcmliZWQgaW4gdGhlIHNwZWM6DQo+IA0KPiAgSWYgYSBt
YXNrZWQgdmVjdG9yIGhhcyBpdHMgUGVuZGluZyBiaXQgU2V0LCBhbmQgdGhlIGFzc29jaWF0ZWQN
Cj4gIHVuZGVybHlpbmcgaW50ZXJydXB0IGV2ZW50cyBhcmUgc29tZWhvdyBzYXRpc2ZpZWQgKHVz
dWFsbHkgYnkgc29mdHdhcmUNCj4gIHRob3VnaCB0aGUgZXhhY3QgbWFubmVyIGlzIEZ1bmN0aW9u
LXNwZWNpZmljKSwgdGhlIEZ1bmN0aW9uIG11c3QgQ2xlYXINCj4gIHRoZSBQZW5kaW5nIGJpdCwg
dG8gYXZvaWQgc2VuZGluZyBhIHNwdXJpb3VzIGludGVycnVwdCBtZXNzYWdlIGxhdGVyDQo+ICB3
aGVuIHNvZnR3YXJlIHVubWFza3MgdGhlIHZlY3Rvci4NCj4gDQo+IERvZXMgUUVNVSBWRklPIHN1
cHBvcnQgdGhpcz8NCg0KUUVNVSBWRklPIGRvZXNu4oCZdCBzZWVtIHRvIHN1cHBvcnQgaXQgLSBJ
IGNvdWxkbuKAmXQgZmluZCBhIHBsYWNlIHdoZXJlDQphbiBhc3NpZ25lZC9wYXNzdGhydSBQQ0kg
ZGV2aWNlIGNsZWFycyB0aGUgcGVuZGluZyBiaXRzIGluIFFFTVUuDQoNCj4gDQo+IFdoYXQgaGFw
cGVucyB3aGVuIGEgaHcvbmV0L2UxMDAwZV9jb3JlLmMgdmZpby11c2VyIGRldmljZSB1c2VzDQo+
IG1zaXhfY2xyX3BlbmRpbmcoKSBhbmQgcmVsYXRlZCBBUElzPw0KPiANCj4gQWxzbywgaGF2aW5n
IHRoZSB2ZmlvLXVzZXIgZGFlbW9uIHdyaXRlIHRvIHRoZSBldmVudGZkIHdoaWxlIHRoZSB2ZWN0
b3INCj4gaXMgbWFza2VkIGlzIGEgd2FzdGUgb2YgQ1BVIGN5Y2xlcy4gVGhlIFBDSWUgc3BlYyBk
ZXNjcmliZXMgdXNpbmcgTVNJLVgNCj4gbWFza2luZyBmb3IgcG9sbCBtb2RlIG9wZXJhdGlvbiBh
bmQgZ29pbmcgdmlhIGV2ZW50ZmQgaXMgc3Vib3B0aW1hbDoNCj4gDQo+ICBTb2Z0d2FyZSBpcyBw
ZXJtaXR0ZWQgdG8gbWFzayBvbmUgb3IgbW9yZSB2ZWN0b3JzIGluZGVmaW5pdGVseSwgYW5kDQo+
ICBzZXJ2aWNlIHRoZWlyIGFzc29jaWF0ZWQgaW50ZXJydXB0IGV2ZW50cyBzdHJpY3RseSBiYXNl
ZCBvbiBwb2xsaW5nDQo+ICB0aGVpciBQZW5kaW5nIGJpdHMuIEEgRnVuY3Rpb24gbXVzdCBTZXQg
YW5kIENsZWFyIGl0cyBQZW5kaW5nIGJpdHMgYXMNCj4gIG5lY2Vzc2FyeSB0byBzdXBwb3J0IHRo
aXMg4oCccHVyZSBwb2xsaW5n4oCdIG1vZGUgb2Ygb3BlcmF0aW9uLg0KPiANCj4gTWF5YmUgdGhl
IGFuc3dlciBpcyB0aGVzZSBpc3N1ZXMgZG9uJ3QgbWF0dGVyIGluIHByYWN0aWNlIGJlY2F1c2Ug
TVNJLVgNCj4gbWFza2luZyBpcyBub3QgdXNlZCBtdWNoPw0KDQpGcm9tIHdoYXQgSSBjYW4gdGVs
bCwg4oCccHVyZSBwb2xsaW5n4oCdIGlzIHVzZWQgYnkgaXZzaG1lbSBhbmQgdmlydGlvLXBjaSBk
ZXZpY2VzIGluIFFFTVUuDQoNCmUxMDAwZSBkb2VzbuKAmXQgdXNlIOKAnHB1cmUgcG9sbGluZ+KA
nSwgYnV0IGl0IGRvZXMgY2xlYXIgcGVuZGluZyBpbnRlcnJ1cHRzLg0KDQpKb2huIEpvaG5zb24s
IEpvaG4gTGV2b24gJiBUaGFub3MsDQoNCiAgICBBbnkgdGhvdWdodHM/DQoNClRoYW5rIHlvdSEN
Ci0tDQpKYWcNCg0KPiANCj4gU3RlZmFuDQoNCg==

