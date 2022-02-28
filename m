Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15F4C78A5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:19:17 +0100 (CET)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlYC-0007Cg-Jo
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:19:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlVS-00057E-9Y
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:16:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlVP-0000V6-Hl
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:16:25 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJ8SD009568; 
 Mon, 28 Feb 2022 19:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=F58VdpYnZQpUQYBvZrWZTas0C/Q9tqERHiYg76tcAJA=;
 b=ADy/O0Dwv4tYtvrXIntGqPliQWU/4xvUkhO3YTVfLVe4EW4rPHI+36g1stBnnU1+6lS6
 7XEONvMjzaFAvTgWtcwNprzYSQH61X5JWqJczSk64Gw3LfSdsxS6WAFOgV+777fUj6h+
 YXVtrJeHP0wm4i5/7qH9lQJ7HC7rFr/bRW2cgX3UDWOrblI/paCeSyTWlxGiDLXTGCMr
 Arp38EcNIZJoP9dPaIh4KRpMZWGvb8qhM6EMIcHL1eHn6ZsEVWqqiUArtSyTKOz3WMqc
 mAGQ5le6glycwMgkHoBeXQViRRJbYDfT39WjCvPQLrH+ZGmD74g3EjAKrWSa/QAf8cDq Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efamcd7t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:16:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SJFQPM015743;
 Mon, 28 Feb 2022 19:16:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3030.oracle.com with ESMTP id 3efa8cwych-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:16:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHvohI8JfA4fmywgN9fmZ74TORfSa68ure2mc+wuwFpaDMjmXR98M5T94Rd5HgY2U7/ufYfLzKVEjTcs0Xxa5Moss5E0OuYjsh45YLlfJV49tcZ7S9h5NFfxXltHjLJWkIKvBR2WleQHwtzJQzQPD0XSqjhuqHT4Qohk12url98KvQ+wuKCb8lau3vCA+38A5bNdVu1vaKNELohiEioOolATMh4Tb0Pa/gTA2zi90V51AqlXxPPbc6RjLluqdGRZS7rddBSQA75cMcWKuHVQJgkxuDvpVVLb1lrSyjvmY4q1igzlfNyo9WnyRXBiASkcgWX8NXdRu6hCR38XEGz0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F58VdpYnZQpUQYBvZrWZTas0C/Q9tqERHiYg76tcAJA=;
 b=Ny8l9ym/WaEac3/8vLInvJeGGTMZNILc7wrFLUFuQRtBnZ53kwynnJsjl70Y1fA6mAdPUQ4/tRDF46SIoYAdU5nectUC6fepY5aRmZ73dSZMXggmJ07B9kO/CKI9tBEJyci+PNP/lSvKuexijJB2an4kCLKDto/jDU2L9X0Kfc5TAkg9Vg8aOzEo/pAE+OlWkZxEsyVBisBXh7EAXFSzNeWXklgypg6u/9yaLBzCR2x+ALO00k+jsWPnc1stvv4UnmuZ3rJ9MetfRunPjjjF7a9gl6G6bkAklTTiBUbMXeAzmwoHU4t1eXeHZA46I2GGwGLsY3eIuzYd+eRGMKXN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F58VdpYnZQpUQYBvZrWZTas0C/Q9tqERHiYg76tcAJA=;
 b=HGJwNHMyTtYK0hEKo9dYiTBSZMs9EVMEg9k7ArldmWAsvJhLTH9GNiOq4TS2M5x6SOYXRg0dB8cd7j4VMeYAW8uQ0brV7X+BNQtiLSW9FGRMGWgUorOWj2JskG1f+5CsMesYHXACJQq/H/QVQNKjQylt3t44hy16fgmXLX6cnfE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SN6PR10MB2941.namprd10.prod.outlook.com (2603:10b6:805:dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:16:18 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:16:18 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 08/19] vfio-user: instantiate vfio-user context
Thread-Topic: [PATCH v6 08/19] vfio-user: instantiate vfio-user context
Thread-Index: AQHYI8rnpHJCGSW55U6Ajqn17PERYqyeK7MAgAs8CIA=
Date: Mon, 28 Feb 2022 19:16:18 +0000
Message-ID: <34CDE5E0-4578-4605-B6F3-32AA0C22D550@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f299f4ceb5b3c49ee95176a7206bc1e63e190bc1.1645079934.git.jag.raman@oracle.com>
 <YhOy6l1mJf1HwwIG@stefanha-x1.localdomain>
In-Reply-To: <YhOy6l1mJf1HwwIG@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3869980-6016-4005-ccfc-08d9faeecc2b
x-ms-traffictypediagnostic: SN6PR10MB2941:EE_
x-microsoft-antispam-prvs: <SN6PR10MB2941C2E936DA63979D719D5F90019@SN6PR10MB2941.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DbjjKKJfR8wrsXLcz4YlKqXtsUxsLwHatbEy/3m5+p8lU8U47HovX9vS1JQbgq7GjyiLdaRil90Tmg2mAnMh9/1rGlPNmpml2DsKai09p5Ki1e4q4LWEghJNlPNY8GAjyD5xf8mUxght3KYtIVOvnsktw86uU6WMm0vcEv8Pc0nkrV0yj3Zc7b97JLbNph9dv02uk02O33dIXWUDaQdB1r9OnX5ud8S0W+SczNJnp3u5gGBitFHiABKNLwGGiiK7T03WVErMRqj1RTLisclKE9aC4nJ/XG4bCj6SEMxHx7bYkwjKRRWpoqyqbdGo8qA6Sbs+kvxZZ1K5r4d7WlFSbKCVKnr7+peDOmZc8tqKpxUUwkUTeMlPPZ5Rjn4kAfg3QSu3PaSP5ggNOiu4jsZX9uqmHAQs+KrP5/1G/F8Mv11ZqAl+t4vNFPL3q1ppTc2oIrxHmuVZsfkVGX1NmdFhgvP5FJf1J9gvZNbFi8yesJ21Ep6rjenj7ptRuDUUQ7A0yEh8aBl7vuwMfTkql3h416HmrHwKWQBScRAazBIaG5TJb7goQDh6XmnW72FK3CSyTXKAyiq8Ha0ikbgExzRf6Lc1HEAXxf3Zh/ZwCCiuAE8JCU5PyumBwnMxDeze/AG8sWPPEIA7sdr6m8DZ9YrYcuAsFAUXrERkaCyimn9Itl+nNdPKBxewT/rBh8ArME8+9YWLERjRlHXy7WlBgSOsU3hlm+wnl63QAqQ1i5PWulIL94YoMd418/xKsBtioj/3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(83380400001)(7416002)(66946007)(66556008)(6916009)(33656002)(6512007)(2906002)(53546011)(6506007)(6486002)(186003)(86362001)(91956017)(2616005)(107886003)(508600001)(38100700002)(76116006)(4744005)(122000001)(36756003)(64756008)(38070700005)(71200400001)(8676002)(66446008)(5660300002)(44832011)(8936002)(316002)(66476007)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gWx7GQZZCunai31ft1I0jloSVppKxE7TYFJe7ByaT/gm2msI05pquW56R+?=
 =?iso-8859-1?Q?RD1xYXHOkpX0T4BKRxMX5oiVw1DkYuB7CPvTUarrbBAwWddpCn3Qsj/JFg?=
 =?iso-8859-1?Q?Z9mxgfPapxi6dGVq4wajonkjEmxA+7aaBG3SMU06GkkQy5xjaj6dmYgu+Z?=
 =?iso-8859-1?Q?mtNjDgukuQ73yTuAz1mEQhlFuHZabFbD6iwkJBjV83H0uQb4w28ACWQ9Of?=
 =?iso-8859-1?Q?CYQxoQylYKaU7j/igD89bEyywOWwgAcqzE2eSgyspY1NZuRoduEzfuqbZJ?=
 =?iso-8859-1?Q?fhd9ok00o+xQ6qSNCVtuwDFDmUkiinMsNnuVIP2FbVX8yZ/L7ziOKO3BP9?=
 =?iso-8859-1?Q?iUdCvr+5CqtoJMSNE+zYjymN/2jv6vaBa03W/Hx5d7lOIk3AQ2VTVUwTYl?=
 =?iso-8859-1?Q?o+ct1J84pYU2GW+diwOqsXnh8tEXR6qd8ZSWORl2Pm9xy8i5kCTmPu98xU?=
 =?iso-8859-1?Q?JCBUf7xnsOi+ocv5Awdtv9dqxudm1G/f4FQkICl5lsbvPSrIl8sBaUnT9d?=
 =?iso-8859-1?Q?W92WERpN0/yF8PFRCjpQxS5oELLZFHcQTXCG0uABDqytoPQ8JZbb7N/SIw?=
 =?iso-8859-1?Q?0uk1GwZNPDV/rWkxnLmz+UFOkpac1N62rs+i6+d02RbFqCTRTmODxzpOfT?=
 =?iso-8859-1?Q?mkMZRUQnHj3yJhD76V1/uqosI8MABIYBa3WH1zwDVl8R8EJD0aFoQ7LFCH?=
 =?iso-8859-1?Q?eWflsZXd0JJMBG/aoMEWw94QfqUfo1adRVQw3CCxH3it+eScXZ5RLyF71k?=
 =?iso-8859-1?Q?Z8qdk7RBHo7XAQd+4stoOAHA3MaJZyp7jyqQmOISyCLx9p+A8mjFT1SKyu?=
 =?iso-8859-1?Q?fpNa4UOlN7C7ctpfbnTR3JfzoED4568lR6xw6rw920ALHXel5ezTqBQRyp?=
 =?iso-8859-1?Q?GGczgPxmofd3WmBphSu6tRGJIwOvTS6cswAqdU6VQMZPCVP1Vg6rB/WCdi?=
 =?iso-8859-1?Q?IhMUCYYWC0QvnRUQxTjGESQaa4l5KUPpXjxh0E8xhnEJrwnBysjQPij6VQ?=
 =?iso-8859-1?Q?iV6LKNc6OOJtAaiCVO76vtsaeeMHr+2tCgIIyAUTo+HTqmZPmmy+idhkeH?=
 =?iso-8859-1?Q?O7XjGhXMLtoG1GopesNS3vtQCcBphXVD9PlLICA1vDnBu/W+0nuEL8vUJ2?=
 =?iso-8859-1?Q?wkJErd1mB4KMUrIfhcO9d3iIsSdzHfckvPpypVskdV0d4O7/+2SzIgWl9h?=
 =?iso-8859-1?Q?Jz2tDHdolJViFQczVF98WM1uUT13qcnVZiHA8cXIsQLbw2VNvhytQi6ivN?=
 =?iso-8859-1?Q?MgYbEEv6uRW5TWajtt1sylOsqGzdi0UdneVxnJf/7LICmvp8m1el9tLtQw?=
 =?iso-8859-1?Q?J60xLaTXdQTuWUiD9Vga4vFgXbaXtyPpw7ybw/Kl7rHH20xcWHn9gfxwsa?=
 =?iso-8859-1?Q?q3ji8f1xgI3KAyVCHzhdbt15RNdjQdbnFAZzJNI9+5TBDE8XuvWbqoQCr+?=
 =?iso-8859-1?Q?kIrzuNE/kr5eru9ZQXG1OGoVl16opMdlOmrA7TGR4rtNV2kNjjmtW4bEQL?=
 =?iso-8859-1?Q?wXooBvA1mx7k/+LZ2iPQ30JGQhsdMoDwI0rxgEdtMrw2fQgqtoGfy3+d98?=
 =?iso-8859-1?Q?BUsaLwUrPyTg6A+2SbPa2KV9xXgJlNlrV+k+0BMQqEl453Jz+Gvt5gMcw7?=
 =?iso-8859-1?Q?bY5jiyJfk8EGFOZBewsfOj3RlegzEl9+kf0/CCGyHv1cvyh7SFgu9wQYXl?=
 =?iso-8859-1?Q?YmCBS+vIFhwzjnlUmz8ci18NeuBt+OBIJU80QTjVCNHwPaxESPjSrIF7JR?=
 =?iso-8859-1?Q?JI8A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F6A0A98CA7E3994E910097CB9ADDF7FD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3869980-6016-4005-ccfc-08d9faeecc2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:16:18.3125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6T5pKsCYb4WqtqD+tMjN9OVs9a3ifdDSdOoAyz9aywn/vU+OM0M2C6mhUVXtqZVf+FXgxIW3ibF27ZLGX4Cmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2941
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280095
X-Proofpoint-ORIG-GUID: Qr_w424IR50dkejn__qa3HilrJRSPa8t
X-Proofpoint-GUID: Qr_w424IR50dkejn__qa3HilrJRSPa8t
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 21, 2022, at 10:42 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> On Thu, Feb 17, 2022 at 02:48:55AM -0500, Jagannathan Raman wrote:
>> @@ -124,6 +190,11 @@ static void vfu_object_init(Object *obj)
>>=20
>>     k->nr_devs++;
>>=20
>> +    if (!phase_check(PHASE_MACHINE_READY)) {
>> +        o->machine_done.notify =3D vfu_object_machine_done;
>> +        qemu_add_machine_init_done_notifier(&o->machine_done);
>=20
> This probably has to happen after the next if statement since
> qemu_add_machine_init_done_notifier() can immediately call ->notify()
> and we'd try to initialize on a non-remote machine type.

OK, got it.

Thank you!
--
Jag


