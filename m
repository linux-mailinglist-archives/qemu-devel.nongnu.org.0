Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951C4EAF0F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:08:21 +0200 (CEST)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCWC-0002KV-GC
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:08:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZCS6-0008KY-CG
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:04:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZCS2-0001xL-1Y
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:04:04 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TCcRlq028587; 
 Tue, 29 Mar 2022 14:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=fEhiQ4k54rChKCxeonH0fwoRW3HKwmLVsFywXjjPiCk=;
 b=zL2Elxe/VIJQIp8JsNtqKNk7COv1mCGn3DWSHPrAmpo/HiDQ4ihxLqB3TKQnPfbXzibq
 babIvS1/N4OwZfUQFatHAN+L+SNUqijMQSas/hAtKqpBysVj0bWhIB6VMGqF1k6ol3iQ
 JnILjHCIaeA93J3NsOmmwNOd31NEvKCnCK0u9b7ed5pixI0LAvM2pm/PJ2OEGChlWodu
 a66OgARSTV6ynZ/1hWISdBTeN7FJqMz9A99AwifVHa43QuHOXEFSE8pWCa0xZ80BKV5Y
 NPmRmCidiP85fW+PKKu8RHb894bwBgcrFC/OEN5KT2FhPJu5ASa9vwPADDYDhhSB/cTY nw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqb6kj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 14:03:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TE0dWd085805;
 Tue, 29 Mar 2022 14:03:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by aserp3030.oracle.com with ESMTP id 3f1rv8cra6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 14:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4XF5yIkgoQyQgrLQ8SYqvZEyreWCV5BUG2Q8EhLXCEOlQ96rB8biMy7HNjFN2anqwDlOh48HY4DwZOWkSYzCSPBwz7VLaamfPIZElMi3yFQkGNQrbpRfcr3aUMJ/1T5hk4DRpbbN+KUBROuCCxqbtFxYVB80vRQqaHjg5ycDI4z9S1/1XXYaUA29ziu9q5JbTn1aXuw4pa/uvn14EuYPFbvUfneikLmuKJPEM/AmR1M3PMMHsohy7imnyhwFKiiYN877e8h4H+ETBqEsuFXdBU3myOHSrK13frO1YhF4OARK+yy5BnMUHQXTmhahIlBCn5NFZaCRJun/05dL3lvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEhiQ4k54rChKCxeonH0fwoRW3HKwmLVsFywXjjPiCk=;
 b=G1KlvZApBRaJKja2R1Vp970KH9CR3aN1/Hr1G5DEP3g5wXUWASjIO0nJonou45jPCPV0CqXIoGlMonUz6uhbVdQHFsMMNCgNYKKjPLFskv/IuWVSg6qf2AFJ0SW+3Kp18zq2G4ms3EL0SfCsIJfKVd4nuqCPEQYr/H9F58MGaac28eTZnQPxi2PsmssZIkRMjtUR8Kh7Z8Z4xnSQg4rpDLA1D/lS1u5SVUD1DjxMlbTgsE3BNENSiLZsPIlhHYTpe/xG9EPzYqgyM8fDEb0FXy9xg5Eknzsm3YsLYVcCWpbuUw4JqRxQJnSvPc4ynSlLu6p2oErQ9Q/qnAu4hEj5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEhiQ4k54rChKCxeonH0fwoRW3HKwmLVsFywXjjPiCk=;
 b=dUXXVIbDedOXugKzVhzj8qEWhHGJeZi1pYqUph4p2eYpn+P7RFQeF4Ldx6k+k7kJm25zwvrBEG8LG0IRZtWVHp8R0uoaDDVcDjLpToKh763D8ZHGpiI6gdVDag8lONbHkk+lZYOyry4Wx2CoZ2knubsT2LpaT4hz7IkeOSTzVUk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA2PR10MB4555.namprd10.prod.outlook.com (2603:10b6:806:115::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Tue, 29 Mar
 2022 14:03:50 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5123.016; Tue, 29 Mar 2022
 14:03:50 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 07/17] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v7 07/17] vfio-user: define vfio-user-server object
Thread-Index: AQHYQH1XoBblwNTlPECmiZq77O/nxKzWLGqAgAA+OgA=
Date: Tue, 29 Mar 2022 14:03:50 +0000
Message-ID: <10128CB7-26CB-4DBD-BCFE-FDA0F176ADB6@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <35c1c4121dab88dc66548b8d47b27db275ac08d8.1648234157.git.jag.raman@oracle.com>
 <YkLdkdDsX4UhFCK3@stefanha-x1.localdomain>
In-Reply-To: <YkLdkdDsX4UhFCK3@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 341703a0-2669-4bd6-2e94-08da118cf3bd
x-ms-traffictypediagnostic: SA2PR10MB4555:EE_
x-microsoft-antispam-prvs: <SA2PR10MB45550D1A69CB479A4514427A901E9@SA2PR10MB4555.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCoKY1RmOEpYjG7EqnCzwByA0Ni0nMlcKAzFS+dGlvsULFltVAO8yKw3aDyiNtiMhXmbnSqWpYAl47niAVf0S6CRK7MNdU7X8/qNOPllGv2omRyhWL66Lzwp28n1ganZg8EeZFOg26w4uPFMYEYKPuZnTs88AgOzBvL+FccV2JMdKuwLf6OAmE5DcgOu84J8yS4qP+QSGYARVp6/7yMhtzY4270+mzpc1GKjE5GRV9nVV9V/B/U55T2KRAstGpsZJYh8kVCn4gEg2VRt5uHd4JI971shxB5aM7QdlTw3An3ro2Ijg3HxJCsKu0H2uOKT+KA7xajdsQfxbyTQzKKZdWYbrIYMOcDxwnUY49B2CM1+4x4lZMIsU0NToDyJtsYrKDrXJlUl8c0/tC3Id5u9yE3XAKPZ9gZwXAPEE0rsSuW49gfNa3uOTm/4d/L8DFIq64u9w7xZPNYpHuUNGjD0LSLoeFg5BwUqNzLAtebYFdrnTBx5VdEAzoIozSgZdHp1/ZNt8MlgIgf+XT9ggCbwO7bFFDXJmzhg+pBZM31kk1MY+/UcYAOJg/nIp4ePrQY3k/vY6Limu507X3NorZ5yOPIiEyJsibVRzuRmB23AVkjTCOjdQm4cd5+j1kEuxu1LM+ibORK9rmMvRhXMd4gdrYN2CtZz1L79Ep9zThAD/YIUimeMTSlUzNz99AV3CGLvub2jGCxq+D6DVln3InzpG7aCN3j09oK8i/Tn8IEgqMg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(122000001)(44832011)(508600001)(186003)(2616005)(8936002)(38070700005)(7416002)(71200400001)(2906002)(107886003)(53546011)(316002)(33656002)(36756003)(86362001)(4326008)(8676002)(38100700002)(91956017)(5660300002)(64756008)(6512007)(54906003)(83380400001)(6506007)(6916009)(66946007)(66476007)(66446008)(66556008)(76116006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUgrdVVUUzdRMDNKZ3VvcGlTUCtsTUo4S24rY0lGdGN0d294OWFGY05PYkJ5?=
 =?utf-8?B?ejA2aHlBRUdFTENrMGNKQkNWYmtZeDkwbWl2Q29mK0FGM2hmS2JFUnJEMjZT?=
 =?utf-8?B?cXpPRTN4VnBhTEdickxaTkJXUysvajQ1cVRZSitHbVA5aHZEL3ZWNVRkckRn?=
 =?utf-8?B?N3JCdjhTUHlPZ3BLWm5DaGZ3eDJLTHZ1S1RkRW9UZ1poZkQ5OENVV0h6bkx3?=
 =?utf-8?B?Q1I2SjJDUXBOUTNkejZ4YmYvc2gyRGc2UHpNamxUelZlcnJWK0dDc29HUk9N?=
 =?utf-8?B?dnI2cGFEN2NTbEhySkc1VGRESWl4VXQ1Y2FEclFwbDQyL0NEd21MM0ZPR1V3?=
 =?utf-8?B?OU1CLzIzempNdzdsZC8rSkNGNzZpSCtKaUlheThteGFldEVPL0ozeUZlTFJR?=
 =?utf-8?B?VjZxL3RITC85NThSdWpuSUhBazM1NHh2Syt3WVM1dXJ3OTFFVGd4dHZXZVF6?=
 =?utf-8?B?ZXNjMVgvSFJnN3NtY0xpVkVKa09rVGFhSStHRlRrc3kwWGU1Q2YwWThLYmxN?=
 =?utf-8?B?U2ZmbHk4emVVQk4wcyszc2ZSVDA0RVZMRzR5TndQUVlIQjhNTldZS1JhY2xH?=
 =?utf-8?B?ZFNpYWV0Z1BJSFhQcGxmbFp0Y05WNEtISjhES3FiYitSekNsK2s5cTM5U0VD?=
 =?utf-8?B?Nkc4VlU1TkpFcEFBNTZpU3BjcmZwU0t2Y3FxYi9EakhxdEJGNVkrSHJCb1Jz?=
 =?utf-8?B?UmJvQ3R6SHBVQnNHNnUwSklXeHVzS0pNcVZLTVFWQUVEZHo2czBGNkNNZ3M5?=
 =?utf-8?B?dW11N1R3dEVrZGtvQWhMdkI5ZXRTY3N6bEtZUW5ITWFlOXRlOVhScUpCSkV6?=
 =?utf-8?B?RUMwb2JFSFRNbmUzbVg0cUZiZmZXc1hLQ1hqRmFrTnFlNXdldHRZSytEVHRU?=
 =?utf-8?B?VWRHbVhLQ2J0NFBGazdQM1o4d295M0puYitGQkNjRVVCdEh1QVl5TUc3dW14?=
 =?utf-8?B?aktFOVNQU091Vml5eTh1b2pkN0FrVW9YcU1oa2daVlFYd056dWVnbENVZngx?=
 =?utf-8?B?MkFUdXNQVHF4RHNXbFVUa0dwRUVuTXZ1Y0pnUmhEa2craXozdmhxenQ3Z3Ir?=
 =?utf-8?B?ZHg2RmhPZ0g0ZkxKV3dSOFk3ZUhvbHVFaVNaeHgxdnM5elFFRUp5UElhYjVN?=
 =?utf-8?B?d2g1VVg3TmRMNXlMZlp4bk1IUmZJcDljdkVoMWxWWlppcUVyS253bU52eWtE?=
 =?utf-8?B?Qk15c1VKWkZ4cXJJamJKU1dIdU5RYldCQWI0SlVoUy91Z0c0TjFUcTFKR3g0?=
 =?utf-8?B?NlpqbHFTZXNCaDBQNFV2b2JXTUV1dk9TOFhhdjl0YzdKMjNlRTNyaW5jdW5L?=
 =?utf-8?B?V29MRDJWZGF5a1Z6cmwzemtKODVoczJOK092ZUk4TUdjVUlXVWRoZnY1Vm5X?=
 =?utf-8?B?Y3cvUlV0VDRZZGdQQ0xCcUh0bmJicWdjalRrais1WUxsKzhoclNWSGYwNlUv?=
 =?utf-8?B?ZFBsSnVwbk1xdU5RQXZ2d3hnN0VzNTAzTE1LK0h5bUU2bUNwUEcwM1h5eFFo?=
 =?utf-8?B?eGJXcHlOMm82OXdmbXFyWVZEQnBUc2xRSWxrblVBNnBWTVVLaW80WEpPb2s3?=
 =?utf-8?B?SGFjN3V5SFhDMDlINDlvTWZWOVFmUGM0eEdyWVJzUDYzTVA0VW9hQnd1Z1Z1?=
 =?utf-8?B?eEkzWjZVS1RoZW4za1U1WmMyQmNFdW8vQnk0a0JMbUZvVjlWT1ZsRGQ3bEIx?=
 =?utf-8?B?SUt3OU9vaVFrN2laOUUvbGRPVld5bjZRQmpuZ3VCeDdaTE85Qmc4YjFndjlG?=
 =?utf-8?B?cE02VzlWOWE3ZEdwdlRwNHFnaFhoRFRqMitkV3ZsSnViZ3kzdGZIdU9FVGU5?=
 =?utf-8?B?ZmM4NEFKdXZUaERpT3lvQkJtaU10WGFNa3JmNG5GSkJKeStCQ2ZrYXdwdmhV?=
 =?utf-8?B?bm1hTzJJUml0Q0F3Z3lwSUNzUGc1UkJ3RlR0KzM3SGF1c1h2aVI1elFWV2NQ?=
 =?utf-8?B?RWxGNUhnY1lXWkE0OUxHSCtUTXZiMmZ4WkhSNnJoMWNNZFJCcitkN2g0NkVY?=
 =?utf-8?B?Z2tnZkZCRW04aThmMW5KSHA4WEdibFRwM2VxU3h5SDBKZU1tKzU2Y2N5b1I5?=
 =?utf-8?B?SDFIZ3ZOV1hMMUdhbjRyZGp4alZoaUk4SERnTEFTQy8yRG11UlljNWFnL1cx?=
 =?utf-8?B?TFJHTnJ4b2VpR1hKanA5aVVsTDdYWHlHTWJLTmpqZVZXTlJSNkNLVktiNUhO?=
 =?utf-8?B?R2xuRk94RnFDZ0RBVFFHNXpIR1NCdjd2U3FBLzFNMER4cWdGQ0tYU05OUWo0?=
 =?utf-8?B?RE5Rb0lyU1Rzb0VJMjV5SHhKWlU3QjRzOFJWaXIxaGR0ZzNqM3QvY3hIc0E5?=
 =?utf-8?B?WG5KcXlBNGV2SnpXN2dka29tdjIrYnl4b3E1eFdUeUx0eGY3MnFOdWtoc0N0?=
 =?utf-8?Q?E5qrPGmGJTtSopa08unFm8f8m6vM2hVIz+kk1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1015610B90B57B4084B0D639D7AFD1FC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341703a0-2669-4bd6-2e94-08da118cf3bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 14:03:50.4639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bD4QOmwUu03Z3Yef3RIMExvPnV1AWxkcVNfO8lsKMqpiy/Xx4mEGZGYf/6rYXdKOFqa0G2VyAZq/rdRnIU4sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4555
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203290086
X-Proofpoint-GUID: RV4vYuoxF34uc5MfzneDQ1-Qm1Rq3ecY
X-Proofpoint-ORIG-GUID: RV4vYuoxF34uc5MfzneDQ1-Qm1Rq3ecY
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDI5LCAyMDIyLCBhdCA2OjIxIEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBNYXIgMjUsIDIwMjIgYXQgMDM6
MTk6MzZQTSAtMDQwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+ICAjIw0KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcvcmVtb3RlL21hY2hpbmUuaCBiL2luY2x1ZGUvaHcvcmVtb3RlL21h
Y2hpbmUuaA0KPj4gaW5kZXggOGQwZmE5OGQzMy4uMmZjYjlkYWRhNSAxMDA2NDQNCj4+IC0tLSBh
L2luY2x1ZGUvaHcvcmVtb3RlL21hY2hpbmUuaA0KPj4gKysrIGIvaW5jbHVkZS9ody9yZW1vdGUv
bWFjaGluZS5oDQo+PiBAQCAtMjYsNiArMjYsMTIgQEAgc3RydWN0IFJlbW90ZU1hY2hpbmVTdGF0
ZSB7DQo+PiAgICAgYm9vbCB2ZmlvX3VzZXI7DQo+PiB9Ow0KPj4gDQo+PiArc3RydWN0IFJlbW90
ZU1hY2hpbmVDbGFzcyB7DQo+PiArICAgIE1hY2hpbmVDbGFzcyBwYXJlbnRfY2xhc3M7DQo+PiAr
DQo+PiArICAgIGJvb2wgYXV0b19zaHV0ZG93bjsNCj4+ICt9Ow0KPj4gKw0KPj4gLyogVXNlZCB0
byBwYXNzIHRvIGNvLXJvdXRpbmUgZGV2aWNlIGFuZCBpb2MuICovDQo+PiB0eXBlZGVmIHN0cnVj
dCBSZW1vdGVDb21tRGV2IHsNCj4+ICAgICBQQ0lEZXZpY2UgKmRldjsNCj4+IEBAIC0zMyw3ICsz
OSw3IEBAIHR5cGVkZWYgc3RydWN0IFJlbW90ZUNvbW1EZXYgew0KPj4gfSBSZW1vdGVDb21tRGV2
Ow0KPj4gDQo+PiAjZGVmaW5lIFRZUEVfUkVNT1RFX01BQ0hJTkUgIngtcmVtb3RlLW1hY2hpbmUi
DQo+PiAtT0JKRUNUX0RFQ0xBUkVfU0lNUExFX1RZUEUoUmVtb3RlTWFjaGluZVN0YXRlLCBSRU1P
VEVfTUFDSElORSkNCj4+ICtPQkpFQ1RfREVDTEFSRV9UWVBFKFJlbW90ZU1hY2hpbmVTdGF0ZSwg
UmVtb3RlTWFjaGluZUNsYXNzLCBSRU1PVEVfTUFDSElORSkNCj4+IA0KPj4gdm9pZCBjb3JvdXRp
bmVfZm4gbXBxZW11X3JlbW90ZV9tc2dfbG9vcF9jbyh2b2lkICpkYXRhKTsNCj4+IA0KPj4gZGlm
ZiAtLWdpdCBhL2h3L3JlbW90ZS9tYWNoaW5lLmMgYi9ody9yZW1vdGUvbWFjaGluZS5jDQo+PiBp
bmRleCBhOWE3NWUxNzBmLi43MDE3OGIyMjJjIDEwMDY0NA0KPj4gLS0tIGEvaHcvcmVtb3RlL21h
Y2hpbmUuYw0KPj4gKysrIGIvaHcvcmVtb3RlL21hY2hpbmUuYw0KPj4gQEAgLTc4LDI1ICs3OCw0
OCBAQCBzdGF0aWMgdm9pZCByZW1vdGVfbWFjaGluZV9zZXRfdmZpb191c2VyKE9iamVjdCAqb2Jq
LCBib29sIHZhbHVlLCBFcnJvciAqKmVycnApDQo+PiAgICAgcy0+dmZpb191c2VyID0gdmFsdWU7
DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgYm9vbCByZW1vdGVfbWFjaGluZV9nZXRfYXV0b19zaHV0
ZG93bihPYmplY3QgKm9iaiwgRXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+ICsgICAgUmVtb3RlTWFj
aGluZUNsYXNzICpybWMgPSBSRU1PVEVfTUFDSElORV9HRVRfQ0xBU1Mob2JqKTsNCj4+ICsNCj4+
ICsgICAgcmV0dXJuIHJtYy0+YXV0b19zaHV0ZG93bjsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGlj
IHZvaWQgcmVtb3RlX21hY2hpbmVfc2V0X2F1dG9fc2h1dGRvd24oT2JqZWN0ICpvYmosIGJvb2wg
dmFsdWUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+ICsgICAgUmVtb3RlTWFjaGluZUNsYXNzICpybWMgPSBS
RU1PVEVfTUFDSElORV9HRVRfQ0xBU1Mob2JqKTsNCj4+ICsNCj4+ICsgICAgcm1jLT5hdXRvX3No
dXRkb3duID0gdmFsdWU7DQo+PiArfQ0KPj4gKw0KPj4gc3RhdGljIHZvaWQgcmVtb3RlX21hY2hp
bmVfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+PiB7DQo+PiAgICAg
TWFjaGluZUNsYXNzICptYyA9IE1BQ0hJTkVfQ0xBU1Mob2MpOw0KPj4gKyAgICBSZW1vdGVNYWNo
aW5lQ2xhc3MgKnJtYyA9IFJFTU9URV9NQUNISU5FX0NMQVNTKG9jKTsNCj4+ICAgICBIb3RwbHVn
SGFuZGxlckNsYXNzICpoYyA9IEhPVFBMVUdfSEFORExFUl9DTEFTUyhvYyk7DQo+PiANCj4+ICAg
ICBtYy0+aW5pdCA9IHJlbW90ZV9tYWNoaW5lX2luaXQ7DQo+PiAgICAgbWMtPmRlc2MgPSAiRXhw
ZXJpbWVudGFsIHJlbW90ZSBtYWNoaW5lIjsNCj4+IA0KPj4gKyAgICBybWMtPmF1dG9fc2h1dGRv
d24gPSB0cnVlOw0KPj4gKw0KPj4gICAgIGhjLT51bnBsdWcgPSBxZGV2X3NpbXBsZV9kZXZpY2Vf
dW5wbHVnX2NiOw0KPj4gDQo+PiAgICAgb2JqZWN0X2NsYXNzX3Byb3BlcnR5X2FkZF9ib29sKG9j
LCAidmZpby11c2VyIiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVt
b3RlX21hY2hpbmVfZ2V0X3ZmaW9fdXNlciwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVtb3RlX21hY2hpbmVfc2V0X3ZmaW9fdXNlcik7DQo+PiArDQo+PiArICAgIG9i
amVjdF9jbGFzc19wcm9wZXJ0eV9hZGRfYm9vbChvYywgImF1dG8tc2h1dGRvd24iLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlX21hY2hpbmVfZ2V0X2F1dG9f
c2h1dGRvd24sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGVf
bWFjaGluZV9zZXRfYXV0b19zaHV0ZG93bik7DQo+PiB9DQo+PiANCj4+IHN0YXRpYyBjb25zdCBU
eXBlSW5mbyByZW1vdGVfbWFjaGluZSA9IHsNCj4+ICAgICAubmFtZSA9IFRZUEVfUkVNT1RFX01B
Q0hJTkUsDQo+PiAgICAgLnBhcmVudCA9IFRZUEVfTUFDSElORSwNCj4+ICAgICAuaW5zdGFuY2Vf
c2l6ZSA9IHNpemVvZihSZW1vdGVNYWNoaW5lU3RhdGUpLA0KPj4gKyAgICAuY2xhc3Nfc2l6ZSA9
IHNpemVvZihSZW1vdGVNYWNoaW5lQ2xhc3MpLA0KPiANCj4gV2h5IGlzIC0+YXV0b19zaHV0ZG93
biBhIGdsb2JhbCBSZW1vdGVNYWNoaW5lQ2xhc3MgZmllbGQgaW5zdGVhZCBvZiBhDQo+IFJlbW90
ZU1hY2hpbmVTdGF0ZSBpbnN0YW5jZSBmaWVsZD8NCj4gDQo+IFRoZSBnZXR0ZXIvc2V0dGVyIGZ1
bmN0aW9ucyByZWNlaXZlIGFuIG9iamVjdCBpbnN0YW5jZSBzbyB0aGV5IGNvdWxkDQo+IGFjY2Vz
cyB0aGUgdmFsdWUgaW4gUmVtb3RlTWFjaGluZVN0YXRlIGluc3RlYWQgb2YgUmVtb3RlTWFjaGlu
ZUNsYXNzLg0KPiBNb3ZpbmcgdGhlIGZpZWxkIHRvIFJlbW90ZU1hY2hpbmVTdGF0ZSB3b3VsZCBh
bGxvdyBtdWx0aXBsZQ0KPiBSZW1vdGVNYWNoaW5lU3RhdGUgaW5zdGFuY2VzIHdpdGggZGlmZmVy
ZW50IC0+YXV0b19zaHV0ZG93biB2YWx1ZXMgaW4NCj4gY2FzZSBRRU1VIGV2ZXIgc3VwcG9ydHMg
cnVubmluZyBtdWx0aXBsZSBtYWNoaW5lcyB3aXRoaW4gYSBzaW5nbGUNCj4gcHJvY2Vzcy4NCg0K
SGkgU3RlZmFuLA0KDQpQcmVzZW50bHksIHFlbXVfc3lzdGVtX3NodXRkb3duX3JlcXVlc3QoKSBz
aHV0cyBkb3duIHRoZSBlbnRpcmUNCnN5c3RlbS4gVGhlcmVmb3JlLCBldmVuIGlmIGEgc2luZ2xl
IG1hY2hpbmUgcmVxdWVzdHMgc2h1dGRvd24sDQp0aGUgd2hvbGUgc3lzdGVtIHdvdWxkIGJlIHNo
dXRkb3duLg0KDQpZb3XigJlyZSBzdWdnZXN0aW5nIGEgZnV0dXJlIGVuaGFuY2VtZW50IHRvIFFF
TVUgd2hlcmUgbXVsdGlwbGUgbWFjaGluZXMNCmNvdWxkIHJ1biBpbiB0aGUgc2FtZSBwcm9jZXNz
LCBhbmQgdGhlIHNodXRkb3duIEFQSSBjb3VsZCBwcmVzdW1hYmx5DQp0YXJnZXQgYSBzZWxlY3Rl
ZCBtYWNoaW5lLg0KDQpTb3VuZHMgZ29vZCB0byBtZSwgd2lsbCBtYWtlIGl0IGEgUmVtb3RlTWFj
aGluZVN0YXRlIGluc3RhbmNlIGZpZWxkLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCg==

