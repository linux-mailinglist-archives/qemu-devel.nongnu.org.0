Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02BD2FF236
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:43:33 +0100 (CET)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dzY-0001rC-Rq
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l2dw7-00007v-UT
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:40:00 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l2dw3-0000BX-Me
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:39:59 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10LHTd7f140977;
 Thu, 21 Jan 2021 17:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=lJa9mJmkpoV/QPfv7sBVnqDW30DevurpzUIwptusDSQ=;
 b=BBX2Slx/praAYbrmsgEqQBULVTe/ggJCqkajeWS0y7cz3fWwCKI1C3mEAwVpLleTn4TD
 ySa0Fkr8P/2HrfD0SZ4M5jswaCAeLqU1t/AAc2z4wbCtGYRcoqfxWq+8CzP6YtqOU8Ix
 elPl93cQX270GLzJiowN5ujevicX4y9ask0f23VbD+06B4Sd4jefsiwzpHDuLT8bXfsv
 +y+Yai8s3C/YNZAwVw4/nIWcdq4ypuv76gTD45zykduI+pnPcbAqDAXdu/mHNU9lTzJ6
 wgyqcEUhO77m/0WAk3MSIy2Btso/iwqEN5bV9MPCxuveV47UnEhjd1pzJaB4sFmE8BGW BQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 3668qaghn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 17:39:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10LHQqps021740;
 Thu, 21 Jan 2021 17:37:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by aserp3030.oracle.com with ESMTP id 3668qxde7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 17:37:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4OPP6RGikk/ZftL1eExGDGcWDJS3+A75f8GiFOuDnU5jPHmivrlummwsklm2FMx9KW2XA2kmI1E1yM4RbUku/oi+WjoWVOA4QGfmBY8pFRCDKeNuV9XupylHT0EGlvdrsPYi1q1msfvbSZXVTvlN5cV1qC7cvg/MdOb+00TWoXo0YosbPgczUmc2LEAYCfHFWY3sJpodwOSPQi7scFMtQIyuPaeh9jjiqt/DGFwZ/cRsCLMx9+7LZ7VmHz0JnDbQcRKlMUHOHtriKC2obHF0CIgIhCQmOQUOzOR5hbadqmjtoJaBTLdCNHkpWjmrbT9WhRlRN6/RFIjLcOQvWUptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJa9mJmkpoV/QPfv7sBVnqDW30DevurpzUIwptusDSQ=;
 b=H8Ycy+cebSY9X9MfDKOVa6bTgl0LcXBTX6mJaRxl98HF11dFNbWIAducJioGpx/O0y3Rm8BNy9Jflxp+D9cHEWqcElGXf242HrJ7DqLTph5dIYSxZHwRueiEPs+aBk3JeNC9fsLjHapfDY4CPEhjCfaXDIlr2dIt28pK8FbNcm7FHlIYVotwlGIOuXiAOnxSWzdrpD3opRq7sJo6RBx0qMrEPoyGnXq4kVYaD8zADvy3XtZv84USZqxCyazEV3AaoJVftA/PtpKS3f1uXFQubWJAeCa9sNHccTt5sFsE55QjxKx8RPxIrh67KJmdXYk8CzAesq8KT6ikYICodVxUIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJa9mJmkpoV/QPfv7sBVnqDW30DevurpzUIwptusDSQ=;
 b=mWC8hQdWUVMbo4XMO6vzVNyIWzzJFEMM4sHLDTLu6hMv8jQhfDCxnHMbrGaORMeNm3ZE8TVz9qAzs8iO/iqAX2ivgP3TbOgckw1op5olldkEe8bBNkbNOpDskMVQwf8Pv5r4KjZIW/UlYZoLdn89V9UEd+vIpydyKYchr/sCBaU=
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3735.namprd10.prod.outlook.com (2603:10b6:a03:11e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Thu, 21 Jan
 2021 17:37:35 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 17:37:35 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v20 00/20] Initial support for multi-process Qemu
Thread-Topic: [PATCH v20 00/20] Initial support for multi-process Qemu
Thread-Index: AQHW7p43yNPt8I3zYUmMdLe7GxkCM6oyUpgAgAAIXwA=
Date: Thu, 21 Jan 2021 17:37:34 +0000
Message-ID: <D7FB00AB-06C7-40AA-BF39-19F02A04C18E@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
 <20210121170736.GF59088@stefanha-x1.localdomain>
In-Reply-To: <20210121170736.GF59088@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:44cb:a5d5:bdfc:3b13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f9a68f5-049c-412d-0c4a-08d8be333d27
x-ms-traffictypediagnostic: BYAPR10MB3735:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR10MB3735DC172E624446C1536D3190A10@BYAPR10MB3735.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PxROqOM2nlAya9oakEXopSPSHCTwsCzAzY1Ijb2n6+wZ1WAQWXlD11O8r2PruncRZDVAJPeFZkQx2kce7OSBuQLNy4zgtCInsIWKB/Hku1mNilF5PKwAqjaOtmkl8k1JnASVoclHZuLg40UaEEawSGcCQT8fhYtesewBBkZ9UigLNB+BIxET67PdT6P0iEx4sCDs1CdfEyUmN1j+pSAwrri8DD9/BdTPqLbn66tCNH3S8m8TWc6VuNvZrj2gEkbzQDnKeTejcjKe6ODqPDjFbSbEbCSk9uKbBqowwE1tCFAJC/5+sRZ4KL85GKp5U5yQu10naBdTJbXBVCRxseASKsJsh0Nl3OkPk206GP/m6MJcMI3IBqAVmgFVawZpxvqwlYJNWbKm76h3v4+P+qsTGQtpv/zwXQZL27WirTx+euclzVUGVT1BKctqpGIqW+Zykaa59fe6qaAUhtPWUYpHyGt1b4fXsfan6xT8x2QGAaVxoW+qXjKpUbV+/xaU81tMKWKQYljId4qyDRzDwHCINA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(64756008)(76116006)(2906002)(66446008)(508600001)(33656002)(83380400001)(91956017)(316002)(66476007)(966005)(6506007)(5660300002)(71200400001)(4326008)(6916009)(66556008)(6486002)(7416002)(86362001)(36756003)(44832011)(2616005)(6512007)(53546011)(8936002)(54906003)(186003)(66946007)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZROeYDN+rrwUHyzyfBfKUwJZoRVJ/Pjk53Tn//Q4XTP9bycH4sbeo9wgTWUG?=
 =?us-ascii?Q?NzBE9nLwobvQIamVxEZ8rJtSmjobflNwSIsdCY5dyro4v2ElT/SnP14xJOVO?=
 =?us-ascii?Q?jSYD6VJtm9QO5jK0WKCnEL8vZM7rzuD6Qma+0xnK6xkZVXtEJLlOAEw2j4lP?=
 =?us-ascii?Q?3HYYY1B5ETUofN+urz1ac9eMVCJxY1J6SStpioTbvgkyITqSbrDMgUwIhB6K?=
 =?us-ascii?Q?jw/hrD9ib4ozpgGZ7TjyZFkIQHnJvnXbhCuvKQH95aPHYWUzsp8iRv33mj1u?=
 =?us-ascii?Q?JmDot2kdj8ygvTJNJN933tPWbtre0M8KzG1w2gUoJ4nwgigPXJZ83mW7g9PQ?=
 =?us-ascii?Q?FBS/QJv79emTFkdWu/+66FaAv3Nw6JwBuwlJHPQCsPwp3f2vDjDSTP8+JxA1?=
 =?us-ascii?Q?nkp9Qvlz/kdfFDTCZoaPplGPiYwvgXVotGcFSt7HbQO4MnGihWoIKRChNfbh?=
 =?us-ascii?Q?1QAkIOkcEvCMgIqh369AMqyFZGdhEzaleAmZqK7t4izco46MIfOTb/XgaSQB?=
 =?us-ascii?Q?/rEOWHldNZWZa0//qSCSYs23OvHUgEr9vMNMvln65lYSFsLO3RpW8cV7DAK0?=
 =?us-ascii?Q?vOZB8sRkonquP3U/C9NX3s7/ezHKf8Gbj62MVNKnQjtRu75FTQkLjOAmKJ01?=
 =?us-ascii?Q?R4WQmIe7jCNo5E0+yDJKkkOWhYgoRN3MOUGvQm69QhDd7NgKN/T/Kru7LGUt?=
 =?us-ascii?Q?lr1YCTg3sSjtXqlh1I69a3CVNQYrJC2baCSbgyISqHF0OjV6bg/74Y/z8KX5?=
 =?us-ascii?Q?c7YQrIm3ylyxV2RAmlCFwzvODHDc6r/QXu7HRaBgULtjrsm4kffIU9Hjj/FF?=
 =?us-ascii?Q?lTvp7NjqzqKvPgGGuAWINqtwTH7khN8i+9LogdVrVT2ZIQkgIeuCjdo/MZGN?=
 =?us-ascii?Q?E4DktrzpU1TW59en4Ebqlmfjkw/vmApOJAqX14M6ZbVxoFKbBpx6pYg97EuH?=
 =?us-ascii?Q?6a+/rHAHN2bkCVIEHfPf4TBgtnQhbb0faH+DIiL2A0IdwjWhLD5Iy/Q7IqPY?=
 =?us-ascii?Q?kHxMJQpL9hoOthkHAYPKIDWwBEiWCoNvmBybGpy2vCRhOeW+QpZgHHlgIedr?=
 =?us-ascii?Q?2HVFITLS?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC87AEB88DD52C4B8875D5F265C77700@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9a68f5-049c-412d-0c4a-08d8be333d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 17:37:35.0164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gWS16WzIA7r7j0QvBEloyFpbp/vbIWmJZdH8VWhiTr0tIyMp8f2+Mv6TLM51W+SXfuBplc6RqLoS8NfzfQ90zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3735
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210091
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>, qemu-level <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 21, 2021, at 12:07 PM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> On Tue, Jan 19, 2021 at 03:28:17PM -0500, Jagannathan Raman wrote:
>> Hi,
>>=20
>> This is the v20 of the patchset. This version has the following changes:
>>=20
>> [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
>>               qio_channel_readv_full_all helpers
>> - Considers fds as part of the "data" for both
>>   qio_channel_readv_full_all_eof() &
>>   qio_channel_readv_full_all().
>> - Addresses some of the error scenarios
>>   which were not addressed in the previous revisions
>>=20
>> To touch upon the history of this project, we posted the Proof Of Concep=
t
>> patches before the BoF session in 2018. Subsequently, we have posted 19
>> versions on the qemu-devel mailing list. You can find them by following
>> the links below ([1] - [19]). Following people contributed to the design=
 and
>> implementation of this project:
>> Jagannathan Raman <jag.raman@oracle.com>
>> Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> John G Johnson <john.g.johnson@oracle.com>
>> Stefan Hajnoczi <stefanha@redhat.com>
>> Konrad Wilk <konrad.wilk@oracle.com>
>> Kanth Ghatraju <kanth.ghatraju@oracle.com>
>>=20
>> We would like to thank you for your feedback in the
>> design and implementation of this project. Qemu wiki page:
>> https://wiki.qemu.org/Features/MultiProcessQEMU
>>=20
>> For the full concept writeup about QEMU multi-process, please
>> refer to docs/devel/qemu-multiprocess.rst. Also, see
>> docs/qemu-multiprocess.txt for usage information.
>>=20
>> Thank you for reviewing this series!
>>=20
>> [POC]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
>> [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
>> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
>> [4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
>> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
>> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
>> [7]: https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracl=
e.com/
>> [8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
>> [9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
>> [10]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
>> [11]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
>> [12]: https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com=
/
>> [13]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html
>> [14]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html
>> [15]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html
>> [16]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg771455.html
>> [17]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772512.html
>> [18]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772602.html
>> [19]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772980.html
>>=20
>> Elena Ufimtseva (8):
>> multi-process: add configure and usage information
>> io: add qio_channel_writev_full_all helper
>> io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all
>>   helpers
>> multi-process: define MPQemuMsg format and transmission functions
>> multi-process: introduce proxy object
>> multi-process: add proxy communication functions
>> multi-process: Forward PCI config space acceses to the remote process
>> multi-process: perform device reset in the remote process
>>=20
>> Jagannathan Raman (11):
>> memory: alloc RAM from file at offset
>> multi-process: Add config option for multi-process QEMU
>> multi-process: setup PCI host bridge for remote device
>> multi-process: setup a machine object for remote device process
>> multi-process: Initialize message handler in remote device
>> multi-process: Associate fd of a PCIDevice with its object
>> multi-process: setup memory manager for remote device
>> multi-process: PCI BAR read/write handling for proxy & remote
>>   endpoints
>> multi-process: Synchronize remote memory
>> multi-process: create IOHUB object to handle irq
>> multi-process: Retrieve PCI info from remote process
>>=20
>> John G Johnson (1):
>> multi-process: add the concept description to
>>   docs/devel/qemu-multiprocess
>>=20
>> docs/devel/index.rst                      |   1 +
>> docs/devel/multi-process.rst              | 966 ++++++++++++++++++++++++=
++++++
>> docs/multi-process.rst                    |  64 ++
>> configure                                 |  10 +
>> meson.build                               |   5 +-
>> hw/remote/trace.h                         |   1 +
>> include/exec/memory.h                     |   2 +
>> include/exec/ram_addr.h                   |   2 +-
>> include/hw/pci-host/remote.h              |  30 +
>> include/hw/pci/pci_ids.h                  |   3 +
>> include/hw/remote/iohub.h                 |  42 ++
>> include/hw/remote/machine.h               |  38 ++
>> include/hw/remote/memory.h                |  19 +
>> include/hw/remote/mpqemu-link.h           |  99 +++
>> include/hw/remote/proxy-memory-listener.h |  28 +
>> include/hw/remote/proxy.h                 |  48 ++
>> include/io/channel.h                      |  78 +++
>> include/qemu/mmap-alloc.h                 |   4 +-
>> include/sysemu/iothread.h                 |   6 +
>> backends/hostmem-memfd.c                  |   2 +-
>> hw/misc/ivshmem.c                         |   3 +-
>> hw/pci-host/remote.c                      |  75 +++
>> hw/remote/iohub.c                         | 119 ++++
>> hw/remote/machine.c                       |  80 +++
>> hw/remote/memory.c                        |  65 ++
>> hw/remote/message.c                       | 230 +++++++
>> hw/remote/mpqemu-link.c                   | 267 +++++++++
>> hw/remote/proxy-memory-listener.c         | 227 +++++++
>> hw/remote/proxy.c                         | 379 ++++++++++++
>> hw/remote/remote-obj.c                    | 203 +++++++
>> io/channel.c                              | 121 +++-
>> iothread.c                                |   6 +
>> softmmu/memory.c                          |   3 +-
>> softmmu/physmem.c                         |  11 +-
>> util/mmap-alloc.c                         |   7 +-
>> util/oslib-posix.c                        |   2 +-
>> Kconfig.host                              |   4 +
>> MAINTAINERS                               |  24 +
>> hw/Kconfig                                |   1 +
>> hw/meson.build                            |   1 +
>> hw/pci-host/Kconfig                       |   3 +
>> hw/pci-host/meson.build                   |   1 +
>> hw/remote/Kconfig                         |   4 +
>> hw/remote/meson.build                     |  13 +
>> hw/remote/trace-events                    |   4 +
>> 45 files changed, 3265 insertions(+), 36 deletions(-)
>> create mode 100644 docs/devel/multi-process.rst
>> create mode 100644 docs/multi-process.rst
>> create mode 100644 hw/remote/trace.h
>> create mode 100644 include/hw/pci-host/remote.h
>> create mode 100644 include/hw/remote/iohub.h
>> create mode 100644 include/hw/remote/machine.h
>> create mode 100644 include/hw/remote/memory.h
>> create mode 100644 include/hw/remote/mpqemu-link.h
>> create mode 100644 include/hw/remote/proxy-memory-listener.h
>> create mode 100644 include/hw/remote/proxy.h
>> create mode 100644 hw/pci-host/remote.c
>> create mode 100644 hw/remote/iohub.c
>> create mode 100644 hw/remote/machine.c
>> create mode 100644 hw/remote/memory.c
>> create mode 100644 hw/remote/message.c
>> create mode 100644 hw/remote/mpqemu-link.c
>> create mode 100644 hw/remote/proxy-memory-listener.c
>> create mode 100644 hw/remote/proxy.c
>> create mode 100644 hw/remote/remote-obj.c
>> create mode 100644 hw/remote/Kconfig
>> create mode 100644 hw/remote/meson.build
>> create mode 100644 hw/remote/trace-events
>>=20
>> --=20
>> 1.8.3.1
>>=20
>=20
> I will merge this when Daniel Berrange has reviewed it.
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thank you for confirming, Stefan!


