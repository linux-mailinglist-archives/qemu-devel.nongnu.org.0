Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833753938D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 17:05:54 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3RR-00058Z-2f
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 11:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nw3On-0003na-06
 for qemu-devel@nongnu.org; Tue, 31 May 2022 11:03:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nw3Oh-0000zH-SH
 for qemu-devel@nongnu.org; Tue, 31 May 2022 11:03:08 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VEaH5a024906;
 Tue, 31 May 2022 15:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=gvV9WPa4EQwTyMWkHbk4+AV9ulwsbw+jSvttTra82ac=;
 b=hhntTZZkcyJGhktlJkQEICVq6rOSuZeFsgC81CNlXoIUtdBDwKd8SE6O04rAiHoj9fKl
 k5Z/5grL++K5f1hYNl0AK0CpLARYjWqmn0dTfXOrS5sR8xjSPkyRovoH0pjZDFKJ3Hb9
 o3V0molR5ek4DBlzgjMZ97yVyu/a2kz0cvvNrAb+6TTSCOqjA3LriI5BDJA/JrXJZy0N
 zjif/DW65mquzHT+c5yJRZ8zx3wb9vgliCWv7q7SDjl18itdI/O0lOtTxBfIGwGNe1dU
 /XAkpvZ+jWNYOB9g2SUXn7+P4JgT8iH3QuV2S/twsqOnfqppNcsrEjlnVH/JFlZFQPJQ bQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbgwm51ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 May 2022 15:02:42 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24VF2A1B033273; Tue, 31 May 2022 15:02:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gc8kheh7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 May 2022 15:02:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwxjPtC1j6BjplfzGKBNKEHualpUgYQdcTmtxE7wnRVBC8H+PGku2ePMqWZ1qujGUlABeEycE6SpILNXip6WqW9AKKBUxWBqyzMpzBLhJcy2nGjJ1qOLbtt/p7D91atpfHf0OWIqEpx5MPqbQfbCmXZtaZgUfuAIgNHQLyaBT1saRCbNGLGQepYjm+G2Fz8v1OSz/VY6cXcKIaee2tIUZW1W3M0UOojoiB3plENRS1mjT9MGXbXEAdiZJBFTMtt8KGUEu3y6DGsmA2nEA54iDGjfGF0dcouVzdcVQNyR/6mmLQlPOpWIHpgY+se18UyYt5Ujm9l33sBHAVaogCYZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvV9WPa4EQwTyMWkHbk4+AV9ulwsbw+jSvttTra82ac=;
 b=UIqOy5dQ4ALusXU24gUztEFdioROqvFkDowA1j32vqqra5rucEoEBJ4sq0/15qfy/NNvw3qpwXnjjjNBGcZpKhuUaUZ/xkit3vTbjYTZAQXKLQ9OCk+UdiEOmBnPRwY6DdXV2mShrst2XpPiLr/9u0kl80Tmpu7njk4q+pLKIaejP63/EBaIds8OvctBGFjWjWvCBmgLLy2iHUK42WhPbLTfypYCL+TKRpd8rUJwGRPDOdj7X8Yx1fJgqPXp/l3iRYB2e46PDu6iMFPN/gLHjTkrGwTbIBkxkuvQFdX5IqAOWZXlVboGS1uMQ6xfWDzRFCA+7UwF5K20VkAtK8k3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvV9WPa4EQwTyMWkHbk4+AV9ulwsbw+jSvttTra82ac=;
 b=z6WY9POBn6gFMKavL6Ckz1m5hNCvyPB1QoWufAzA5LQ+eNfcEQ45cWo18ctcRGm+2KnHGJMfb587nO5PFpI7VCVejKXsyRZKDbi+LP6AaLpyP26x50FXpBq3la9KWVRVOHR9NzdthQOCY4llIcbzhba3hUvcH5ggygmc/EdS2ts=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MW5PR10MB5828.namprd10.prod.outlook.com (2603:10b6:303:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:01:58 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 15:01:58 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Topic: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Index: AQHYb4NRI47IPGjvqEq+Oet+ENycma0vr36AgAlwOAA=
Date: Tue, 31 May 2022 15:01:57 +0000
Message-ID: <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
In-Reply-To: <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfac03ef-b134-4ea2-0b2d-08da4316823b
x-ms-traffictypediagnostic: MW5PR10MB5828:EE_
x-microsoft-antispam-prvs: <MW5PR10MB5828B0EC1F49EABB22F1BE6F90DC9@MW5PR10MB5828.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hsKK6a6Ds+VpF95dj8YCRzS8IunnlMtxLhrzzmImztQY9IsIxQXvYWnAkP3CvXHZNj3fCMUCVghen0VuqCuuO72h0eFLAajdZYrJUBqw4R/vAMbHQG0IquYqIY29gCYFuv5MEO1X50CdeAiDYM7qBeZ3JV4dcog89czSTg2x2nAPKTGNTxteWenUaDDbDRD6x4IVC97Vqus5Z6DsgeiIJp1ZKMwAKTbFO383KrxTOvQIYt2DUiAw/X18NX0WWqfIt6jWm/AiJppTTO1ClsCmBv59k9PzDgTcCoC1WtIzJsxtUWkcMdmsRcZ1jeq2UXaz9K9aZGl83YDMilE8Vl/0yuOENLVQtHiPKpz8fkEJWUvoPhr/DwdLDS62nucsczmF+6wJI10YBdnByEiDpdkUROKvo1ZAM5F/lWruv3lzfAzoT6X7G3YvxVYMevSGOAk5ewUUFCRVBJzGX6XKr7qnwndljRUt+OyvLPcGByGN9tF3MFMiL2CMUsGQnlqWl62qArs+XkQ7bkOzQUCMN0GgAHVFuhkoBu4b4oqD1e/lrIXzB+0UMwL6C/C/yXf+KxIluTIpx13htW9fCTPNCMC4aM8w5sXHkwibSeTpaNr+0/UCLHIk+fIkGosjY3YCLdkKwfPHf9twtQWzHYmrYlT0Qq7BSdzRxL8nPfNyHY0cOyLkThmX5JJCBUkEfv83r1YXb52Je4n1aGbr7x5Bg9L6ojT2C4EMFHYSWcYLRSnUFUg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(8676002)(38100700002)(66946007)(66556008)(4326008)(66476007)(91956017)(76116006)(66446008)(64756008)(54906003)(36756003)(316002)(122000001)(71200400001)(38070700005)(110136005)(6486002)(5660300002)(2616005)(86362001)(508600001)(107886003)(8936002)(6512007)(26005)(83380400001)(53546011)(2906002)(186003)(6506007)(7416002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?se2Gpvmm4ihwZY7evckM/H82D0vyHVNkNWD39gZ3q3OckIGmFjpdu24yaJ?=
 =?iso-8859-1?Q?D2Wi8Z20/exL6vbhJketG+ipFcnZK2mVtZeGlqrPwlwpELdTMjqFIOTkT3?=
 =?iso-8859-1?Q?HqufalwirriUhx6XJI6jLOAI4WnvC5JsXMABh1cBpFRzf9p8JjuRAqe5LP?=
 =?iso-8859-1?Q?llYVbAdfnbpAfVt5++dF/XpHMZ/U5IHkfztJxEGLsPdx2nCFci9xW9n9mK?=
 =?iso-8859-1?Q?yMFn2OZ5bT4vqRSB76vj5e04rtHLGdro1uIx9jA1ZSd1aCK1e98YphtoRe?=
 =?iso-8859-1?Q?+CP/T7PrQ+UJ0Wpw1NJ4wijiE8vSFeaBZPcKfuXYw8beBL2k2UHSQuksyA?=
 =?iso-8859-1?Q?2bUIwYGY5IHQNBXUrJ69i9XH9O7NqxsEMgNfF5d83/99GVAem55jA6gYIu?=
 =?iso-8859-1?Q?WrJSmwkMP37Yu1BIsjE23tbz7cxwUC2dCSVj5qp70EpmO8v0aEvIKY/1I8?=
 =?iso-8859-1?Q?VIRueF6DvcQw1nh4DsG5j/hBgxTmKSK3hcdBpsHYS+GHUtNux3eGb0bNFH?=
 =?iso-8859-1?Q?7fSx1f7VpKqL6Tfyfg0skm092VotdfHVjgy7S8ImedQpQiWbhdxOJm14m1?=
 =?iso-8859-1?Q?JQmYjFNcnGMs2Xwbq21K7FpGj4lzUwc0KIEqsEGtYcvPUAHBIP7AuBJnl/?=
 =?iso-8859-1?Q?+anjUS2/iEtjSQNDBXL6tm89m1usTNbjQr9N7PNLCi8dPldUiEj1Tp+ZwX?=
 =?iso-8859-1?Q?1RjlRYJgyXao0EKgs7zXU/2m22Aj1Pg+q4r3GlcBStCoF3B2Ubl5Vd2Uyq?=
 =?iso-8859-1?Q?I8m999JUx75TQh2411Z0uqG3S2PhK1ocLrCQXIF3M7U0waK1qXOtfvLYBL?=
 =?iso-8859-1?Q?kntByFv5LoTK+uFBqFVZEs4uWfIW3cBVloLrQuBLB82SqgUbAmmHm02kmR?=
 =?iso-8859-1?Q?z6zmF7S80EgUDpn9p3Zj/lqv3r1pFXfgmOmj205Uc1XlqY0mDRFpwR8DEX?=
 =?iso-8859-1?Q?P/A/7LaqDgS6CZqjw0q9QPAmwNBdOOzJotX2cmuqxNVLuCBn0+OMZUIAuY?=
 =?iso-8859-1?Q?CSj7CqfQD63c75uJn1qK6ThXo7UaI35YANtXLuWtRQH0LULYlcmQnyiQbT?=
 =?iso-8859-1?Q?RIkXZTQN9ktNxJIvKuzaBLVPZJ+WGxn3jP1miJBzjUv4/B9BvV2tuPgbS3?=
 =?iso-8859-1?Q?MWjN9Bzurx+orZ4wNBMIRqMUaZHsxzBu9mWtnP30c0u7vj8vOUFnH0//9I?=
 =?iso-8859-1?Q?GNzkaiqTqVnu6aBYSglvWMCoS1eF3u5z2zi12JAyEVSNf8FiD0XPvQGzwo?=
 =?iso-8859-1?Q?W5FXhrOhJswvJI0if8fCyUxrLQzM/reChRJCIvfybzb35dz3CACIXBJssh?=
 =?iso-8859-1?Q?WvJnXB3SVdXAyhgzs7CNxiqL4kbLREde3ASHrXiIGNCLpLRbd1AmkjXf0r?=
 =?iso-8859-1?Q?PHA/FWJvXqbSqdIB/3NqkRHbm0sv9vfnZj73BPbVBuG50FZNwNNFjojzey?=
 =?iso-8859-1?Q?RkDeemv88yCOtl5HMOZX3rrdZbpUMG2P5gx6q1fvySFWexuyowZ+0bqD0O?=
 =?iso-8859-1?Q?H9ruienFNo4AbB9c2tbBLztyPO1UKZqhj3Y1KPnQAPxr3louqu/J628cRa?=
 =?iso-8859-1?Q?By7dPWlFf9bQUnqfBllPTB62pTxI61mdPicVZPkPgyYdIjJE60DvcEu0gC?=
 =?iso-8859-1?Q?JIkXknTttvV03MOhsi4386G2VoAVkVTj/3ZMwEgXZFJh+xWTot0eZp1UDI?=
 =?iso-8859-1?Q?Z1oB21tcaWgR4wTcMLpK/lPXobmL9hp8u8TnnRXhbXOZ+I51nXp5WOY2xw?=
 =?iso-8859-1?Q?IsluP5OamSQWFALDJl7+Z55NnFYb5zr0v6hGnOFHRzDYzKl956dWkMc92V?=
 =?iso-8859-1?Q?1CvBPE40Ng=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C750707C74D17046A5EC7D3B815B2131@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfac03ef-b134-4ea2-0b2d-08da4316823b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 15:01:57.9126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ac6Ao2USZMRkyY5Jad9CzkWx8r9o0l+ClydhlRC8GveYh3fNc+5kSHmLWgVwQaEpzeMXDY0xMvDdkQg0DYrEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5828
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-05-31_06:2022-05-30,
 2022-05-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310076
X-Proofpoint-GUID: bRUgw7llWj6Vy778e2uKjHfvwAwfbvqh
X-Proofpoint-ORIG-GUID: bRUgw7llWj6Vy778e2uKjHfvwAwfbvqh
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



> On May 25, 2022, at 10:53 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> On Tue, May 24, 2022 at 11:30:32AM -0400, Jagannathan Raman wrote:
>> Forward remote device's interrupts to the guest
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>> include/hw/pci/pci.h              |  13 ++++
>> include/hw/remote/vfio-user-obj.h |   6 ++
>> hw/pci/msi.c                      |  16 ++--
>> hw/pci/msix.c                     |  10 ++-
>> hw/pci/pci.c                      |  13 ++++
>> hw/remote/machine.c               |  14 +++-
>> hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
>> stubs/vfio-user-obj.c             |   6 ++
>> MAINTAINERS                       |   1 +
>> hw/remote/trace-events            |   1 +
>> stubs/meson.build                 |   1 +
>> 11 files changed, 193 insertions(+), 11 deletions(-)
>> create mode 100644 include/hw/remote/vfio-user-obj.h
>> create mode 100644 stubs/vfio-user-obj.c
>=20
> It would be great if Michael Tsirkin and Alex Williamson would review
> this.

Hi Michael and Alex,

Do you have any thoughts on this patch?

Thank you!
--
Jag

>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


