Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305F47830F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:18:56 +0100 (CET)
Received: from localhost ([::1]:37558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my2pi-0005p9-U1
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1my2oF-00057k-9w
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:17:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1my2oC-00065C-OO
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:17:23 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLE5KR012919; 
 Fri, 17 Dec 2021 02:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Wkx6QHEjCHGfBH6I61YQ9mAWnToeHxyIhWd+0eplX9g=;
 b=rNF0uf8IDYDK4zvDbcGbaXof30npIINNPj9dAbI0Dc4YAeAx417z7cc5helsSNrDkZcb
 sNydYpxZXTxD3JXPfnfkHTR2MThKDElwJri0bUUlkmkNzLCzQ2t3/kzu1JrkTF7q1SWd
 UN7pQmNyWPgZb8S0scFYlpLND3f1gPucvNX839tXYvB/OnUc6WEg3gpgiVqN3E9xQXza
 5zm8PMNxyVccLfjYevmX7Ii6xo13JMgsyhozuvcsKLIANwNCQUnxZJbunMiGW3sTyoUd
 0zaSPlSnvPYuFAN8Fu4tTJLG8ATaGihGUrXqcHJUyoU5g4F5nLrO1WYhlV+7xpdFQn9T TA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrmgc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 02:17:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH2FrJG157147;
 Fri, 17 Dec 2021 02:17:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by userp3020.oracle.com with ESMTP id 3cvneuu2ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 02:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1Z+9x43yobE9I6ONwidzSmu/zP7xexeJrrKRH5/ucJ4ClDUGAyIirJ0fxsDqbs7cAFZHU1Dbh4adabJHJ+nkAr7dBbvmA537ZDED0x8B/azQCP9jwRq+pFWF1Hz6nrVRWj0Wj/T7osFaD+6Qx4rYZ4p0UxW1COIE7L7ZzxMaHVKs43zjdZHKjepYEP3o77rFd9GPurqpHl4Fyr3+myceDel+nG6ui598hTSPkLahOMVM2zvgnqDAbk6Jc8NdixbkC8UrwlX8WNZj6iJCJL+OysqL6g+O6XBpLtDvD8R8BPxX2oTwC67Epfwmr89yB+fLiiZQ43N2kjfYQFIa7Ovrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkx6QHEjCHGfBH6I61YQ9mAWnToeHxyIhWd+0eplX9g=;
 b=GQxXUPJK8g4m21XKs+1kGxCkl4MGcyJelqFxMbo3tVt2JC7CSN9sRm76mrpcVPL6nk+t1uqMIILmfp3BAI40cQCF1TDM1YFArAfJbia61I6KrDTRiXg+Wd9XVuI7V/7nCygF65oK7c7dUUFE9LKiM2wOWgPJQ0R6f8E7YoWmUc4ZSCjiIZc7w9UU2A8QXbX7weR9FNvsYx7ziwZLplhTrkOjRrKRM1jWQ6Yud0X409cWQAgbeeiQXpbLzcJHedr0hArCwm/n6jMMXK6d6FazQUn1B6vBp/4/5X4YjDhj2scK5hlK3KyR0MdRGmR4HXS6Vd+41Gmx9RX7hqEZ4zourg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkx6QHEjCHGfBH6I61YQ9mAWnToeHxyIhWd+0eplX9g=;
 b=R6caMiMwjN5k+tQgBurJ9Yr63267aceNJDdu2zffgwusc71JLiv1fNNLdUBPNqvrZs8nqjsoC2UmoLZgUpfASBVv+W1//Htu8/eyCJ7PFO9KqS0sD7fcXl8+wg3dVwFy0XRT4HPN0+Z8VOFBnYxqC33XfLa0kYY0bJlK0YvPdw8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4285.namprd10.prod.outlook.com (2603:10b6:208:198::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 02:17:12 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 02:17:12 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Thread-Index: AQHX8YAohLArQJeUR02z+A4gatAUZaw03PgAgAEYbAA=
Date: Fri, 17 Dec 2021 02:17:12 +0000
Message-ID: <DA8DDD51-311C-4259-BEB8-C4422BD0A1CE@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
 <YbsH6lrcL9RIrSxR@stefanha-x1.localdomain>
In-Reply-To: <YbsH6lrcL9RIrSxR@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 669d2266-65b1-43a6-a244-08d9c1035606
x-ms-traffictypediagnostic: MN2PR10MB4285:EE_
x-microsoft-antispam-prvs: <MN2PR10MB428539A1212554FC2527820490789@MN2PR10MB4285.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ho+kQKktwQ7jAgkdVixR2VlcwXSyLsMMjaLROinToYz+FBxDpbijY2HLzjd+2uo+zuOYYgsq7ZFOTCEZdxguVdvT+MgEBJhqFkytqu/b2WpiAEs82epzslUVaeAMIjOfC7lUhi0KxNUaZdo9QyUGPrZcV7Ms//bWgwbdReHGOvrpCo7N9mIzEpT4eU8gCr7/XFUFDUCt4laKHSvcT4AAwb9AUnF2ZcqMThdVEpjG+DIJGQp6VSLMY1WZjr+lhgzHF2pSePhRtPfX95EkVtkoWwTBrXlRXNZJpVKl4CS8cOwbk2wQ8YKbAooieHJc0FneBF+CADpn3i2Bmo53398qpMZlFhqzdRDoCCt4p683AEhtN+bS2SiCY7QPRI7ZwG+aQxqibZAIzOvK1Vb2b9ZIp1PoPBGFDmlWjSq4QfcFLxKDT/VvO71l4uHXzyj1EPcrRDgjgSJK8L2pqEPDJahVOVzuU8/SBCVe6W3cJP7eH4nPyySmxj4l4zLI/FTkxXlXMNKV91hTBdu61TzePmC93O5KvUWs1ZsEgbxCtf6tSLJyzzG5alnsenObupE1k6z3Gu1KLLJ102M9uDWgByLCp2yZV5BvALEfg02ffhuhA7cBmcYgNlGOjCXrc/n9lTdfkZIQL1fBp/YvM8OOFRRjC36ExP7/toeA+VGNrMkitXEd/fSlEoJwDUD0DF4Mm3Q8qFsx36SNHWk5/WOLYzjz1pJSskgzmz6U6RBmG+10lHtfPQ3wAbneVJ1/c4slowb9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(71200400001)(8676002)(4326008)(44832011)(8936002)(7416002)(36756003)(86362001)(6512007)(6506007)(508600001)(316002)(53546011)(2616005)(33656002)(122000001)(5660300002)(186003)(38070700005)(6916009)(38100700002)(66556008)(66946007)(91956017)(66476007)(54906003)(6486002)(76116006)(2906002)(64756008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?s6UbPZln819xwSfYmGUsLOOanyZPP4AN+w73RyUfs4PvWLb3Trx6Jzo3if?=
 =?iso-8859-1?Q?xwbQsJFOMnDMKDuelJJo8Jmz7YAYtm+Ss2v2oa3v7WLC8n+nCCqN6oBoM+?=
 =?iso-8859-1?Q?8VEJ7qZZuC3makZvJ8Kfczoz/f0do5XePxHuzWeyOaS1PYoQ2te8HszYbI?=
 =?iso-8859-1?Q?+QqFKef4CIy2efQoxKCXlbHpiS4doEqxOCWFP04fpWDi8PZ6kxC5aR57A4?=
 =?iso-8859-1?Q?RlJ2H41X3LRa+HEUU6ifhDaPhP12HGWiTZOl7d7SlQKfxFE4Id/edD5o2a?=
 =?iso-8859-1?Q?QF0ScOjxQHXvBcqjpqWyHvE1aQHrk3++/L9Yiwzxtc8xPLFH+GKTMi53Ao?=
 =?iso-8859-1?Q?uaHJMeB9QdBFhBRZQfcNIbUmrGM591CqpXWmc/OeB4RiCltqKoLrl7p2XQ?=
 =?iso-8859-1?Q?74K6JOgvbJeeBxVmWC/tPsuwQyV3ZM1sFfiFU8ZFJd3NDR7MhqF5IJNkuu?=
 =?iso-8859-1?Q?rhqDDEGKjY0yX6Ui7m0+R5gjA1b7Hha0CrcnCQas7IX6fgu7II8cIKVxJB?=
 =?iso-8859-1?Q?WFh+yz0MI1qzgdF1Yrhv8JbBBjte7sVT0IW2+u0J05Sd+Gwh9swNQods7L?=
 =?iso-8859-1?Q?1h9GOhtxjmQETW4vSdGJDI00kG/GU42Hj0gefUPs85JzTWrhY4qJp7QAqn?=
 =?iso-8859-1?Q?v9gZ+oDPz/jb4mX29Nofi9GXCvjPvtuXahPP6/AYKmiOtYioqkiudW9nbR?=
 =?iso-8859-1?Q?ItNs0klbHaM4JdeOiqbh2B9FctwjFM90PJVALaHem3wFAPxdV3ZVQDH6ve?=
 =?iso-8859-1?Q?fpTrxYN4Ey2w1ihhHJBoL+c6qfygWVrZFcV9XwAfv5qT6ZckEJW3PbYPt1?=
 =?iso-8859-1?Q?SoYlrutjxR4iB2HE7jUzHvEv46V/PJJobqqL4ihlLbCVj5RH7H7BA18+T5?=
 =?iso-8859-1?Q?uui052y79RlKEeMuxKLLLMfzN3mmGm51g4jafaD2JdAvmSpTyGSLjYXo9J?=
 =?iso-8859-1?Q?GJwLJvrMvBdaZ8kgQuXNQi/+1XCI1ryE6mZ+08YuF5Gj9/ZK3+fIq78d3j?=
 =?iso-8859-1?Q?agaGfdIrnSXp0ommUlwv0gJhZldP+pT8nhHL85WFOWZ9U9EBS+fJ3CsSV4?=
 =?iso-8859-1?Q?eFSY9Xf7Mgz+0VwhbQn5KIU6M75m/msU6uxWBU+sh1WKc/+KrlucQbGcx+?=
 =?iso-8859-1?Q?28VqvcnMdHvHY3QJW9UlE8p/nSJzQiGDLMTSSbgOcMbAalpLNTOUbllXir?=
 =?iso-8859-1?Q?XZxkCfkbpJ/fsdNg7s8C9D0T5xtHM1vdbcjS8oRfs3YiFagSrWx8VPirBV?=
 =?iso-8859-1?Q?NtKfTjpNMpHV4eoOdUgnbhGyc4ZHHWWEj+3uJCQd4hlgR/QxEh8C15Oa9I?=
 =?iso-8859-1?Q?gVUGqNdFAICmehVqmt3VKpyYZXo62kAHU7OsZk9Sntv4ZipOc6QfZkBLph?=
 =?iso-8859-1?Q?v+AidZjBsV3zTiyzTICGtUsVIeTRkjDiQfY4mqhhnjB0gyXQ+hy0d0yOG5?=
 =?iso-8859-1?Q?weKJJfjyGlCWzEnWQoD+U+XkLkN8pLw1KAAJFHLKsXa6EkoxzYoZE44ppg?=
 =?iso-8859-1?Q?p4+O1E+w4ENwqOcsDVxoT0urSYFONpombBA2FAQtGyea/qr7TA2tpkcFZd?=
 =?iso-8859-1?Q?gW2pzmujFnX+B+58AOmTFl8OGBehW/MjQQrtW21Ir1K5eeNzbgJMuNY3sV?=
 =?iso-8859-1?Q?9ZK7L0+wSeAGu24C+uVsw/l08uw15Z+nL09BfUNBz66bksm+egO6pMFO4I?=
 =?iso-8859-1?Q?e63uNpAns6sHUtxlta36J7H6fJdUY6yE1CBPkQj9dDWK/8SYpNX+N8dN80?=
 =?iso-8859-1?Q?fWlA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <79646DFA9D3FED4EBAD3C6B6AAEB9F96@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669d2266-65b1-43a6-a244-08d9c1035606
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 02:17:12.0880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8T9kqoHu80O4G/836RqdFaFrOOgCk0Af0xbXjwkRPGYPFPWBNKkUxK9ktZj4+1GTeen4dhfjnSkGSyAGLFFhOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4285
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170010
X-Proofpoint-ORIG-GUID: 1kt50R8RpU67hcBX_TkSuB1JMZfYFsQQ
X-Proofpoint-GUID: 1kt50R8RpU67hcBX_TkSuB1JMZfYFsQQ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 16, 2021, at 4:33 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Wed, Dec 15, 2021 at 10:35:28AM -0500, Jagannathan Raman wrote:
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index ccd1167808..6001a9b8f0 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -703,6 +703,20 @@
>> { 'struct': 'RemoteObjectProperties',
>>   'data': { 'fd': 'str', 'devid': 'str' } }
>>=20
>> +##
>> +# @VfioUserServerProperties:
>> +#
>> +# Properties for x-vfio-user-server objects.
>> +#
>> +# @socket: socket to be used by the libvfiouser library
>> +#
>> +# @device: the id of the device to be emulated at the server
>> +#
>> +# Since: 6.2
>=20
> 6.2 has been released so the version number needs to be incremented.

OK, thanks!

>=20
>> +struct VfuObjectClass {
>> +    ObjectClass parent_class;
>> +
>> +    unsigned int nr_devs;
>> +
>> +    bool daemon;
>=20
> I was wondering what this means. auto_shutdown might be a clearer name.

Sure, will do.=20

>=20
>> +static void vfu_object_set_socket(Object *obj, Visitor *v, const char *=
name,
>> +                                  void *opaque, Error **errp)
>> +{
>> +    VfuObject *o =3D VFU_OBJECT(obj);
>> +
>> +    qapi_free_SocketAddress(o->socket);
>> +
>> +    o->socket =3D NULL;
>> +
>> +    visit_type_SocketAddress(v, name, &o->socket, errp);
>> +
>> +    if (o->socket->type !=3D SOCKET_ADDRESS_TYPE_UNIX) {
>> +        qapi_free_SocketAddress(o->socket);
>> +        o->socket =3D NULL;
>> +        error_setg(errp, "vfu: Unsupported socket type - %s",
>> +                   o->socket->u.q_unix.path);
>=20
> s/o->socket->u.q_unix.path/SocketAddressType_str(o->socket->type)/

Ok, got it.

Thanks!
--
Jag


