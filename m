Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193751C6CA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:12:32 +0200 (CEST)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfxn-00078A-1M
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmfMG-0005AL-4k
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:33:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmfMD-0006AH-WB
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:33:43 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245F4QUC026132;
 Thu, 5 May 2022 17:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=tqgCxHSGBDTFKCu9T1Zaq1UfRPSOFPKLIAcUowNdOmc=;
 b=pMY8xIhR3I0RdJf7GuMvYTvVk3SylXmGoGhYbdEc2mlzT5RqgnMcIxwbrQc6tuUoYjv+
 Mxy4zyzfVubWTbGuS2q8r9ji+St8EF+s0JE8yYZGjx7movkOEz9tDx6Sf/Dfxyf5BhnO
 ebKCakZnpFXDuLelkZbRciqvv2UuGJNppxuVm1mCkgc1r9FafgNOM0YFc6zcm6XWOUcU
 DGc03ZnsH5YUBKPByd81sYFbjv0Qw8ucIG8oJF7hWiv1c0jDlz8ReSFXqoMVl+0mszYb
 GMTIiTuM1rLftsz7MIsjAyFxNEb3ZHvt6M6LNjNMRnBM87X1JpnT63PG5vyT4U037/UH 5w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbtwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 17:33:32 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245HKZ9a028721; Thu, 5 May 2022 17:33:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ychxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 17:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWahaes9Io3zhj8wBfSd6PvYTkkSywFWdQyf0/pEiUfY1jV973V45BxddHLvH12hJlUpia81xlodMHCUQ917DdQH4hTXYo4Opln2dEmK+mdMVPC4AM4dSa6/twK6cANg+ka6Q+QTnTomwkKIuXNaB/uDjV/w5r7B6vzEPZ1RtJ3+W1jBLXxUcFGNWxQg4bQYOOwKs2+7w59B6u30wk8AcziGvFFBeyz9gNi+IVgyq23jRVEQB50M+IOURpqQoGoLPuoF8/yM+nXsy5rwv6XtMQRaWSfvluyzAi//fUe6BeAvN3wd1Y6rxmeR/uPbHpewYbobb00E63NfEasq+LgSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqgCxHSGBDTFKCu9T1Zaq1UfRPSOFPKLIAcUowNdOmc=;
 b=CEm1ETOZ6PuoMGbM+DtrM9cEqbxZKJJZpnwsPBbiVKCo3mH2d6cAn+z0JpmN3CwdrHex6WkHBv71a1oWgUGMv7YF9nunS6P2lqXsRZfp98F5tM5fMgfi1SwFZVuYhZFdl1Zij9Yu+9AERmyIH16p/aTLkuttWzk5vdzjpWEp5boNAQkTFvy1XsazRLtSaj+ZtiYA4/e1MoFHqVrgsbqWfVnR8/wpNE4XSq1ZvuUBYHBCFNkbGp0I0FtTk1xrryjPa3MnmhD/P43ICqhI4sdOFMaub7Zp0Mf6PGf2INufPqaqQEBUykkvh04F2ovuE6d6rv0Qg1dzO0dX4HU6uGUrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqgCxHSGBDTFKCu9T1Zaq1UfRPSOFPKLIAcUowNdOmc=;
 b=jk45h3TKzY2npkNZmDaEnLQK7dg6Et4nIOXAEpAfguFJ7irHM3JVoZGoLMp1lmttvJejxaRHw2ScANfVG9W4amaF2bKFJNCLIog4I9LCjhxAjQO8IktF4fYd48+QqOwj5lDbsBfKvSuWjcMvxfqUuTbU9twZ0XZ2kznnaLkaiqg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY5PR10MB6264.namprd10.prod.outlook.com (2603:10b6:930:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:33:29 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:33:29 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 17/17] vfio-user: avocado tests for vfio-user
Thread-Topic: [PATCH v9 17/17] vfio-user: avocado tests for vfio-user
Thread-Index: AQHYXviRr3VnsEo+m0WuXiAkjDBaH60QdYeAgAAY/IA=
Date: Thu, 5 May 2022 17:33:29 +0000
Message-ID: <C669A8B9-3A92-4308-A912-E7ACD51EC634@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <fed0fbe8ee48383f6a018bf9eacd8a7258e2201d.1651586203.git.jag.raman@oracle.com>
 <YnP1cZZZ35EZF2sw@stefanha-x1.localdomain>
In-Reply-To: <YnP1cZZZ35EZF2sw@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0af0d84a-d04b-496c-2d99-08da2ebd5e5d
x-ms-traffictypediagnostic: CY5PR10MB6264:EE_
x-microsoft-antispam-prvs: <CY5PR10MB6264396F748A44E677D1F8A290C29@CY5PR10MB6264.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J5AETtQxxeIaPAC0q5qMx66V5av0EIR086F7ZVAA7l+9Qz9aviNKzW5ZlM/hKULXz4wmaNeAFKRBo5Rvi9HAw4mZdN5ofUGmaHJUR8xNeROb6j9rzHcG2KfrUBDxCNHEKEY6DbGvK4rlAP4IeDxGq1LpYflN1OqsHyzkwXHhXabIe54lGXucAOwA+AplSyoCJmer0PMDlBtiUQJSouic/Sq+DEULTCOAEf2ouRtBTy8tX7rZ+XSIOLBaiG8gjsy9n+5VLak0YTIjTjmh21HAOUv9fkgTU+1N/iyZ6xcwkhnz39m1v95j0OfG5nffXzEchyFJfWJ6o5UV6+q3X4ahjdrf0EhPzL6+lAtCec/gJ9P29aAvDGVN1vMbZLTaOWeuc8+vDQjNIpq53ti5getys2jlZ3byRh2sCwgIOIFOLoksEGnPM/1KjXdc5ax0q3hr2B1FrLI9VggTNixH8NAGip3rpZaqiNjXjBzF787wap9k4WRuG59nuNKvLg4TY3Ytuc0O1QmB1JPuot/Lz/jwE0Bf+UBTQ8rwhQv7aWiCKFMiADpUC+I6V4ivri9SxuyZ1HO6dBj6C8FgtpOXRklVNq+imXVZ7nqhFvzVl/q5xkAnX2brmfMT2FtIcp4j+pVAdmDTy+GTOs/yXTzHPmIepIaZwBUoCGndh2rUuja1G3Nk3tpcDvPN+a5x124WXzKOKu8KJoq9eGdWMvbxaYseBLapkR1JsV86yR9Lf0ts9/c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(38070700005)(107886003)(44832011)(36756003)(54906003)(6916009)(7416002)(5660300002)(86362001)(6486002)(8936002)(122000001)(508600001)(316002)(186003)(6506007)(53546011)(66946007)(76116006)(33656002)(2906002)(6512007)(66476007)(66446008)(64756008)(66556008)(91956017)(4326008)(8676002)(2616005)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SXLBpsrfPz9eFeZCLQb3as1o5ThPcGenQM5oFMuz6WmmZQMNNArXAFvWVu?=
 =?iso-8859-1?Q?2TTuDTyTfGt/N688kWRuZzMAjLdiNpuV6rBzbG69C8kwJCs8cSUQJ7ywVN?=
 =?iso-8859-1?Q?q8A08CtllsK71LwkDSMTglcUx3m6ljMbRzwT8iUuAG1O97A4HTG0IVVUXn?=
 =?iso-8859-1?Q?eSRpFBy+JAGVhv51TDiqy0aZvjq4i8SCr4AVuJr0wAqTK55lIc5tVB+K8r?=
 =?iso-8859-1?Q?0OZtf7Bcxlzn31qXcZeAZFfuOGddz7N9nV0rN0ocQRPBHvEAjwwC48Np9b?=
 =?iso-8859-1?Q?OD1epTOXABWALF0Vns3+MMI/mjs2s5aaWgpi/OQRtoqLjJ3lcd7SccWjvs?=
 =?iso-8859-1?Q?S6nl3URkG6+Hx6pGGg+tEHwAHJg+0ZZpvzfXnrc1LowJJce+3wn1JSysrS?=
 =?iso-8859-1?Q?wlRMUD6Us3vkNlSQZ31W1uLTd2/N4ihP4RT82N6yQWTjLjJNknxDgFr8ds?=
 =?iso-8859-1?Q?KuJvf48aP/Z7XQL2wa9uSr//3RQoJ90Cmcl8m317IKvVsemVujzfFA1QGN?=
 =?iso-8859-1?Q?fsThVC6lHxNW/y9AlnjA+CfnLHhANr0vx6HIUZvmdtH70wY6WN5vOO4cBM?=
 =?iso-8859-1?Q?667tbWoM+OdZ/WvP5AhWVt+ySWEb5YeHlJcITBvoM1Mqj2eVj5CC8tjup1?=
 =?iso-8859-1?Q?lujHW1HPFDtcnsaR38cu+bIZC5d0QeK2ExLY98SRdP3TYrnA+ySxMY3Efx?=
 =?iso-8859-1?Q?vxe5nXvQbhEj7pkONND7+NhRkcwtzvPjd6LnazcVWdViM5iw29nfw9d43W?=
 =?iso-8859-1?Q?BoH7P2LIkoJkKQ8RG5FgxxiLKKzL6IUv/QmXnMt/KLzwxoCGWDGTP8hnf0?=
 =?iso-8859-1?Q?CsSwX8T+n6CFoNu7jn2sj6nKyYQG1MG1uX/46/QTZqb+lpksf95db/5RmX?=
 =?iso-8859-1?Q?50n5I18NaO5oJTk8PZNU/etUz11iUIYieyysNWrdJLE/mRAWkZgX3NW0V4?=
 =?iso-8859-1?Q?g1Q+YTyOfY3n51uXW6tPBLpjXt1JH7m6BBzowEaNWIoUdFLTlceIMPsLPV?=
 =?iso-8859-1?Q?l7DDi4tpRmhUTEkx07+1R8pqL+vTqazaqqK9ThK0qeHqssn1PVX+VXiHiW?=
 =?iso-8859-1?Q?7GEYwt8XuWSr3pE+wPLC7k+HtjJgG67yBM5knrSGSeNK0NFzvPM/iEnopC?=
 =?iso-8859-1?Q?etNuyimh6ER3X23z+GNuAxXH8nQAYvQmsyJ/ODnF/eRJbuqpxlOuxzIPEG?=
 =?iso-8859-1?Q?16TbqE6sXF9Y8iEoVtjB4fG+LnP05k4cZjZoUxW2Err0iuilsq0kUZZYc1?=
 =?iso-8859-1?Q?WOljyDJL0thk4/V60ovg2O7qWzV8gYvzK6Ca3YTulUXt/YeHL07+pQWGm3?=
 =?iso-8859-1?Q?0uv1USk13qnelBxy+RmHddFMMJEPiFThWgrFzZOq2IOQCGslyH8+eGbK2K?=
 =?iso-8859-1?Q?dUhxVDXQ5Mubb3rz0THbnWqw5STGc8fGd1V4YIrAI7Id/udIW9U4YP1gOo?=
 =?iso-8859-1?Q?2ftptv+L1oTIR/lDceoAhOgIGU6Ob0hCjayi3ztb+oSw6NXmiZjayXoPLe?=
 =?iso-8859-1?Q?zqG/SO7SfcWYP2Hu+8jbmc3aweXEV2xHEpiXbqIYc8nxcAgdcE8Y56nDu+?=
 =?iso-8859-1?Q?wTFmfXtenyBDRyNhfTb2v6HmC5f5JP7qrDnhoheK9hxA84aJg7VGb5uw30?=
 =?iso-8859-1?Q?e0IqKnf1D89f0fHroOjdJh2pODeIr0vryvg9+urbYqhPENRRCN2kKYGGbd?=
 =?iso-8859-1?Q?CpFp8E0CfDjB+9qou+P/oMylgHCFwt5xYKPbBEzXkYVmyXwuzwZs5ogFQh?=
 =?iso-8859-1?Q?2rMEksTE0Rmxrw7Y5WFURf5FtWos2AJjE2Tcap35SqSvVhRdZM3I5zlv43?=
 =?iso-8859-1?Q?9XkPJpr1A2pCfaYmwcZRCoU1vaI98PyVdgtsuTisT84dfQ41zMWd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EEBF3385931FB54BB7915F518B178EA7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af0d84a-d04b-496c-2d99-08da2ebd5e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 17:33:29.2583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3VTvdNI6rXOA9uJqzhJqASfH5KkmycFqM2deBaYZBbcac7WdZN/eK0w6Ddtkh4uLDK1Q7PQu0t4ulGG+gd71sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6264
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050119
X-Proofpoint-GUID: dj5-yyVjkoA5DnexvovOQHX793XEFlET
X-Proofpoint-ORIG-GUID: dj5-yyVjkoA5DnexvovOQHX793XEFlET
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 5, 2022, at 12:04 PM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Tue, May 03, 2022 at 10:16:58AM -0400, Jagannathan Raman wrote:
>> +    def launch_client(self, kernel_path, initrd_path, kernel_command_li=
ne,
>> +                      machine_type, socket, *opts):
>> +        client_vm =3D self.get_vm()
>> +        client_vm.set_console()
>> +        client_vm.add_args('-machine', machine_type)
>> +        client_vm.add_args('-accel', 'kvm')
>> +        client_vm.add_args('-cpu', 'host')
>> +        client_vm.add_args('-object',
>> +                           'memory-backend-memfd,id=3Dsysmem-file,size=
=3D2G')
>> +        client_vm.add_args('--numa', 'node,memdev=3Dsysmem-file')
>> +        client_vm.add_args('-m', '2048')
>> +        client_vm.add_args('-kernel', kernel_path,
>> +                           '-initrd', initrd_path,
>> +                           '-append', kernel_command_line)
>> +        client_vm.add_args('-device',
>> +                           'vfio-user-pci,socket=3D'+socket)
>=20
> This patch series is just the server. Does this test case work yet?
>=20
> If not, please defer it to the client series.

It needs the client to work - will defer this till the client series.

--
Jag

>=20
> Stefan


