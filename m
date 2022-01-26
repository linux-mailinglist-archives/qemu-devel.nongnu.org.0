Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED049CE20
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:25:07 +0100 (CET)
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkAU-0003yo-8v
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:25:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCk6U-0001uQ-MW
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:21:13 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCk6N-0000xJ-KT
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:20:54 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QETC6c019615; 
 Wed, 26 Jan 2022 15:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=mxwlpCFtts/0fmAgjVzft/Q6VC/jXsA9td9cM1n6BBI=;
 b=YGGjYnjXb46stfBVL4RXSCicmw/qcujst8RiJkCNmuTdiAgJ0qa3jLZqS8M6twOsAdfk
 ylByQT3OVDKaWqie+W+ojHKV2SUMZXbFG3pOE/lJtZQlFx6Eb4Z+BDpF268vdHKY1I/+
 KsXuVDLmzGEplM3NuhXY9rmWFUDpkStPLi6BsrEI3r7JtrnonBg9/fTG4C5rF1TkXHky
 he5VeuZeq/FKkajUESEpWDY3OaNlbKvFdLUaxbLnFu8+wOvDd1AAndq+MH0mnbfP2Px9
 Cc96V4k24G/h5vPFibHU/hd4eXAz5mEbPHAM83jm3XscBxp0/NP/kv4CNMZVQ0K7zBY6 og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7axfuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:20:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QFGofu169887;
 Wed, 26 Jan 2022 15:20:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3020.oracle.com with ESMTP id 3dtax8kcgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:20:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QohrHVz7Ej3Ex/Eu8mv40LB4Mw3O1DjiU7xZupBYvOlSJqAk41jwPGgWPRi3MF4cpRInyOb+mqLssp83nol+pDtV6iM3a61vH3xhiU1pr1GRPTP/gqnO5Bs5aTUy8W1wE9iw+LcBhu/AgvfPHz3R9jDLrpbN+DewuxtHbeugwOxhrBgIzPjY12neb8/CghM9343/Jh3cR6bie0U4RrQPEQGblDjbFaQYKJfGIogyhncD7ppyFinQClAcjQ1hN5n5ezqLQCjwOPzFmlYqMFrEG3PP2LTnEiePyoFk4mzo0aH4SDeAHfaCxX1Y9UIUHeuW6ucPLORIBaZm0yeDUp7i2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxwlpCFtts/0fmAgjVzft/Q6VC/jXsA9td9cM1n6BBI=;
 b=UNi6PLscGU56OeJjACLkNaJ7zpIV8TPGeAIZvwK1aPud0UCuMpfO7d05ZhyGWVTG8pJs+V1+a8QUOtUX/xbp7xcJy4m5jbTb0RYJd/lBwvDu+jcUq4+j0KgMdN663j4ruNWJf388ow8g17evEE2fP1aeT0hZm04R15wekrSP3cQoo8FuFPZtSAQgW3eBIFRzc/QIU+SEi6FR5H0ONcr1lo2fJOJg7dASQknegrsu60yr6Fg7PXlcOM6Aq13u3wjBFqw5WyB7IBxXycRym280RU6LXIweq/TL1Sug96UFWgL1iLEgEvIjzk89s7SIKA+SunsHV2YPKwQxxgIu6SfuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxwlpCFtts/0fmAgjVzft/Q6VC/jXsA9td9cM1n6BBI=;
 b=Jb6BB2AhF1hzNspxBvG4OXxL+q6mWh5K7DSbwFAqk+GgixFZpLOFECqpzWwofZ2J2uC7QWtpDUhtyyJwSMg4Zv5nUHap39cN2SwG7SS+UBnxWiEDkUKuoVUywA4wqbA203ByLvc0DzVVUCQZAdx0JKsY0MyXxyL7+xc1FjTUyls=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BY5PR10MB4132.namprd10.prod.outlook.com (2603:10b6:a03:20b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 15:20:35 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 15:20:35 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Thread-Topic: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Thread-Index: AQHYDX16qjLDwrhDQUu+4szIN9Lq46xzks+AgACAhYCAAQG7AIAAYHwA
Date: Wed, 26 Jan 2022 15:20:35 +0000
Message-ID: <5447E2D7-5AAB-466B-9108-A903AEB51529@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
 <Ye/Rz1bHJN2m9vCo@stefanha-x1.localdomain>
 <A037BABE-9424-4EBF-A1E2-F712DC8A89CC@oracle.com>
 <YfEV0kh8uyy3MU8V@stefanha-x1.localdomain>
In-Reply-To: <YfEV0kh8uyy3MU8V@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7be3843-f6d7-4e4e-df1c-08d9e0df669c
x-ms-traffictypediagnostic: BY5PR10MB4132:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4132F0A8F200D638882786F490209@BY5PR10MB4132.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: siN2shB2gYnxpq/HSrqTddv2fRnF9m9ifh7gGNiDRFrTRtnWNmYSNZz5jvJC3TbZWiH0DKqEo4qe0l0jaN1sFp8tvE9DvTJ2HMRkltEBTgwUNVWQ7eOZW0g53wHH8c8EUVd56ZjA65zvPvR0pFDcTxhY+16qIZhtxkcJbjdPcaK+82P8oPmUNxNPc7KYuacVr/UO4KbDY2q7t+uZFS3ttxGEpcStlNeTMJFUXfWSfIUqjEXpBslnMj5cd2OsEaw25nZBUEeBk92uJsV+M5HQXKzVpFvA/zXOz7CbMtWL/gHlMqYLy8fcBjPddhDRchP/oRro05gLLwWBAyWbZT9zsRbe834p/H0KfpQJDq2ItuBSdYa67lvGqotMrLC0JHk92d82KM8OgkgUoxgddQX8BEyFboxdT1vyjSFG3agGdwUQIMSPCvSL8foJujNVtptqY2UCcFnRI7lfwBXZTEd1LQPi0TWCOqRFW+QMA+2WaqYaBzkCc952ZkxTOR25H9dxxd88pOC418n9ovIDWMy4Sj9PGd8n0fgYLUESKLInYV2mFvKs/BtCZ98uQht9McsIwW7XSHxy5oaYD49ohsivj9F5eiL+2kgslgfy+F3SZODiCJ9qeDx7dluTWTVIM+UmIzDXAEObPbJacdPmHEyxVvmuItr6teV77A8zt5vV72YDWTBljsQhNWc6/i1D36js9s4H7H55N+Psd3NB5fjsOuXqEC/JweFNMWS0QGAqo1HNV4c8f4JUR4peYaJuD9n7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(6506007)(6512007)(7416002)(38070700005)(53546011)(44832011)(86362001)(5660300002)(2906002)(107886003)(38100700002)(8676002)(4326008)(8936002)(6916009)(36756003)(83380400001)(91956017)(508600001)(54906003)(2616005)(76116006)(66946007)(66556008)(71200400001)(186003)(316002)(6486002)(33656002)(64756008)(66476007)(66446008)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWFZUzdqY1VXR3NkUlliaDhPaFJNWWYxejJCZkROeWhkenJ6OGVVR0hSTngy?=
 =?utf-8?B?SklxRGVJNHVBRHB3YlVxTDJ6REdyWlVWMkpRelFmSEtZeVU4b3NjM3h0N2lE?=
 =?utf-8?B?NzRKTEwyNEEwR2JLU0JCUmNTMHBvWGVibkVTcUZlWXVvOVdHOWVOZXFLY1Vy?=
 =?utf-8?B?S1pmdjRvQTlqamN6QjFPZWlqVlplQkdYbmpidzFsK3pUYkY1MWlWVEhpR3FL?=
 =?utf-8?B?a3BkY010MUt4UXlFRStvSW96RllMbkVRVTdld2M2OFBobzdodERvWXgwRktY?=
 =?utf-8?B?d2FzZS9JOG5MT1lhb1hIdC9IaWNpUDJYb0hPU1NRWjlrbkphVjkvOVUwVWd1?=
 =?utf-8?B?S2dOYjlHeHZyTFBiV1UvZm1JUEprT3Nla1cwVWtGU3ViWHp5Y0I0dXo2M0s4?=
 =?utf-8?B?dUZGYUFWQWhRdlZKT2FBNWs1ZXcwV1FWRHhCcE9iN3E0UXE1RUxhaVdlMlVS?=
 =?utf-8?B?WG1xWDIxRlVLTTBqMXQ0WWc1ZUFhT29LRFZGSzhPNnFoR3FpKzFIS21KTXhY?=
 =?utf-8?B?RndtcTVJdnVuQ01sZ1Y4WmdYUWpaV3BGam1KaklZNDVsZkhtd28vYVNNSmdJ?=
 =?utf-8?B?WEZKTk0rRkhSTWNGUjc3YjQ5Q2kvek9HZmJTbS9sYkp6TDdNMk83b2p0cjFE?=
 =?utf-8?B?eVgyTWhoYithaC9wUWRVeXVjcVhYVGFCMUM1QkFVM21BK2NEZkZDM2VoT3FX?=
 =?utf-8?B?QkZ5UGZXaUVRdktZVmtqZWJnZGxQT1pBZHIySk5SL0lEcjhwTktxUEtvbEVP?=
 =?utf-8?B?NlRQazVydSs4MG93TGFYYXFPd1d4ZE1MV2FQZzVnRGRSZThCR09ndEtxY0FV?=
 =?utf-8?B?aS9mYzVoV3dNK29kTjNQQ1NHSGdqWjFnZTZLejdUVjMzQjAzcHFLMmpyZnh5?=
 =?utf-8?B?elgwQWNFVGFRazZyRFBxTjd4UHNrQVVEMHFjWUU1NVlsdmZaUXFqYk9hSTJk?=
 =?utf-8?B?WGwwaW1rZzdLMUh3MEhIMWIrY2xXSys5SkoxTXArbEJhcnlXWk9OUHR1SkUw?=
 =?utf-8?B?ZTZtVE5NbEd1UGp6WkVQbDRNODhxa09mMHh4VHBUQ1ZTcXNDQlJ0cFpBd2M1?=
 =?utf-8?B?bURhZzFYY3VRYVVIblRYaDNRZ2lsVkVSWUVKYVNKNUpxSkVpREYrRUdFVlNF?=
 =?utf-8?B?UFJiOFRqS25SZ0NVdEV5UzNrU1haWVBLeEp6QVMrYnAzSXMwYkZFSUZQTk9u?=
 =?utf-8?B?ZnloV0RWdnVYa0RuNTJDR3E4YlVaL1FpQ3I1WlJhMTIxclM5UXV3YnlENUpQ?=
 =?utf-8?B?OGtHSWhWVWdtOFlCcVNUMEQzQU9NV0swQlVXRjl3NWV5b0oyS09UZmtuOU9m?=
 =?utf-8?B?UjgwRXlXRGhGNGdGMGMxd1pqSFRTb1dLMW5LSFA0MHdzdmorV3gxVCtzaDU3?=
 =?utf-8?B?V2VIeFAzTmpVSForTzVVMURNSzEwSWZVak1IYzBtVXlKN3hEUzBwVHF2UGR4?=
 =?utf-8?B?OEt4elBCSU5oUEhQODJCaXlPZGJ3cC9UYXNzbWdqQXcyb1BlTitIY3d5Yi9t?=
 =?utf-8?B?TUhxYlBZUW9hcXBGZW5GeDhObXNzK05oY0xZbGxSWEtvdGlhUmk4WlBoN3ha?=
 =?utf-8?B?czlUL2Y3VHBtL3NxYS9ObHRPQTJsTHJnRlp4cFRrSUdxZU5ldG56RU9RczI5?=
 =?utf-8?B?SW5yWUprZEhxQ1ljS1RHaG1qN0V1YWc0S0dnaDdKZ3ZCd3JDQVBCWVhYUmFO?=
 =?utf-8?B?b2QvSEVGYjkraHR4L3lqeGNqK2kza25XTmhLYjhMZSt5c3hHd3ExaDFrV29x?=
 =?utf-8?B?Z0dGUnNWQXFxUHN5UndJSTJNZ1lCQ2s2R1hhZnV0QW55U01BaGhjMjh1OWsz?=
 =?utf-8?B?VDRPbW5XdFcyMjlLMGRDcmRiaXhCaVl1ZUdCcFozSjNvOVBJaDh1bndSWmdB?=
 =?utf-8?B?MXZhdERuMVJzZUZWTEdic0tyWkVvdURrb0N6NVl5aGF3ZTF5eXRjL2hBaWww?=
 =?utf-8?B?M2MxWlpick5KNUN4V0l2dmJTUnF5YVdZV2pGdFJFS2kzYWVBdWpQUW1uTDJu?=
 =?utf-8?B?VjJiTnJzWWFTMmhsU2dPUDdPLzRJbU5nTUd4MEpjampBc3dBOVlESmhBSjVL?=
 =?utf-8?B?L0xrUzRFcVJFNm0wNjU0b0w0YWVuN2hrcnMvcXNseXFrV1hQc0xJcWlHNWN6?=
 =?utf-8?B?VTJvQlJMb2h3WE0yOUQ1eHhta3VvNW40bDU1VEpxRVF2eEZLZ05oVjlLZFhR?=
 =?utf-8?B?bW5qTkVGYVdUbjFQUFNSeCtreHEyQ3BreUdkSXBHYVUyWHEvc3lPaUwyQnVF?=
 =?utf-8?B?V25VTUxPYWJ3VENGcm9NUHkvbTZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42A616606BA18346870C7529E597E320@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7be3843-f6d7-4e4e-df1c-08d9e0df669c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 15:20:35.2740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EXJR7TL5BDpxVatFLrHmBxNrP11+w9aRQ2235ZLkNej4hmpJjxy+NWogea/ygcwpei/2lmDiu7K9UwW6/AjjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4132
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260095
X-Proofpoint-GUID: osTPfZwn-L5fbZk6bc6NzhxYUafJh8qk
X-Proofpoint-ORIG-GUID: osTPfZwn-L5fbZk6bc6NzhxYUafJh8qk
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gSmFuIDI2LCAyMDIyLCBhdCA0OjM1IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBKYW4gMjUsIDIwMjIgYXQgMDY6
MTI6NDhQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBKYW4gMjUs
IDIwMjIsIGF0IDU6MzIgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6NDE6NTVQTSAtMDUw
MCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+IEFsbG93IGhvdHBsdWdnaW5nIG9mIFBD
SShlKSBkZXZpY2VzIHRvIHJlbW90ZSBtYWNoaW5lDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29t
Pg0KPj4+PiAtLS0NCj4+Pj4gaHcvcmVtb3RlL21hY2hpbmUuYyB8IDI5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+
Pj4gDQo+Pj4gV2h5IGlzIHRoaXMgY29kZSBuZWNlc3Nhcnk/IEkgZXhwZWN0ZWQgdGhlIGRlZmF1
bHQgaG90cGx1ZyBiZWhhdmlvciB0bw0KPj4gDQo+PiBJIGp1c3QgZGlzY292ZXJlZCB0aGF0IFRZ
UEVfUkVNT1RFX01BQ0hJTkUgd2Fzbid0IHNldHRpbmcgdXAgYSBob3RwbHVnDQo+PiBoYW5kbGVy
IGZvciB0aGUgcm9vdCBQQ0kgYnVzLg0KPj4gDQo+PiBMb29rcyBsaWtlLCBzb21lIG9mIHRoZSBt
YWNoaW5lcyBkb27igJl0IHN1cHBvcnQgaG90cGx1Z2dpbmcgUENJIGRldmljZXMuIEkgc2VlDQo+
PiB0aGF0IHRoZSDigJhwY+KAmSBtYWNoaW5lIGRvZXMgc3VwcG9ydCBob3RwbHVnLCB3aGVyZWFz
IOKAmHEzNeKAmSBkb2VzIG5vdC4NCj4gDQo+IEhvdHBsdWcgaXMgZGVmaW5pdGVseSBwb3NzaWJs
ZSB3aXRoIHEzNS4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZQ0KPiBob3RwbHVnIGNvZGUgdGhv
dWdoIHNvIEkgZG9uJ3Qga25vdyBob3cgZXhhY3RseSB0aGF0IHdvcmtzIGZvciBxMzUuDQoNCkkg
d2FzIHJlZmVycmluZyB0byB0aGUgcm9vdCBQQ0kgYnVzLCBvdGhlciBidXNlcyBpbiBRMzUgcHJv
YmFibHkgc3VwcG9ydA0KaG90cGx1Zy4gUGxlYXNlIHNlZSBlcnJvciBtZXNzYWdlIGJlbG93Og0K
DQpRRU1VIDYuMi41MCBtb25pdG9yIC0gdHlwZSAnaGVscCcgZm9yIG1vcmUgaW5mb3JtYXRpb24N
CihxZW11KSBkZXZpY2VfYWRkIGxzaTUzYzg5NWEsaWQ9bHNpMg0KRXJyb3I6IEJ1cyAncGNpZS4w
JyBkb2VzIG5vdCBzdXBwb3J0IGhvdHBsdWdnaW5nDQoNCi0tDQpKYWcNCg0KPiANCj4+IFdlIGRp
ZG7igJl0IGNoZWNrIGhvdHBsdWcgaW4gbXVsdGlwcm9jZXNzLXFlbXUgcHJldmlvdXNseSBiZWNh
dXNlIGl0IHdhcyBsaW1pdGVkDQo+PiB0byBvbmUgZGV2aWNlIHBlciBwcm9jZXNzLCBhbmQgdGhl
IHVzZSBjYXNlcyBhdHRhY2hlZCB0aGUgZGV2aWNlcyB2aWENCj4+IGNvbW1hbmQgbGluZS4NCj4+
IA0KPj4+IHByZXR0eSBtdWNoIGhhbmRsZSB0aGlzIGNhc2UgLSBob3RwbHVnZ2luZyBkZXZpY2Ug
dHlwZXMgdGhhdCB0aGUgYnVzDQo+Pj4gZG9lc24ndCBzdXBwb3J0IHNob3VsZCBmYWlsIGFuZCB1
bnBsdWcgc2hvdWxkIGFscmVhZHkgdW5wYXJlbnQvdW5yZWFsaXplDQo+Pj4gdGhlIGRldmljZS4N
Cj4+IA0KPj4gT0ssIHRoYXQgbWFrZXMgc2Vuc2UuIFdlIGRvbuKAmXQgbmVlZCB0byB0ZXN0IHRo
ZSBkZXZpY2UgdHlwZSBkdXJpbmcNCj4+IHBsdWcgYW5kIHVucGx1Zy4NCj4+IA0KPj4gVGhlcmVm
b3JlLCBJIGRvbuKAmXQgdGhpbmsgd2UgbmVlZCBhIGNhbGxiYWNrIGZvciB0aGUgcGx1ZyBvcGVy
YXRpb24uIFdlDQo+PiBjb3VsZCBzZXQgSG90cGx1Z0hhbmRsZXJDbGFzcy0+dW5wbHVnIGNhbGxi
YWNrIHRvIHRoZSBkZWZhdWx0DQo+PiBxZGV2X3NpbXBsZV9kZXZpY2VfdW5wbHVnX2NiKCkgY2Fs
bGJhY2suDQo+IA0KPiBHcmVhdCENCj4gDQo+IFN0ZWZhbg0KDQo=

