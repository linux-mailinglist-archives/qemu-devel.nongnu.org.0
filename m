Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C74477FBA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:00:47 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxynu-0007j6-4z
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:00:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxyIn-0000HX-6q
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:28:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxyIj-0002Qj-Mh
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:28:36 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLE6qR012926; 
 Thu, 16 Dec 2021 21:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=e2AXieCbFyLg8XCMsq/uUmaVxowPf/r/3dCQxuVobrs=;
 b=WfDrCzaaQCa+K1PIh2ffZ83LACmGQkcyrgac8Yd0y9PN0pbZ2SH8ktUv8/zBODsJ3BFA
 zEF5mGQSq0Cjp6BYod7MQA7LQr7b0zK1ioYr7wNGqUweMfksAy3gTzjuzYXzxN1feFgI
 QVhTxnWu9ZGEHOMaIXXayItlEeX7mjuY5j/prSTbIvPkiGpo1Nabu5r1N9mJNudChUsd
 Z7S43hiarS3O6B0prFvHyg9gAffu5VqbUnh9AmBGEJHHa1JY5AcGz8D0FbnVIcW44kSZ
 oPufSULn1hZQUNfVhRIZPMGskAZULKldu7FP4wi+dkyLgLW8EO1iCmnmxjWab2yhfIzm ug== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrm1ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 21:28:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLGEA2120834;
 Thu, 16 Dec 2021 21:28:12 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3030.oracle.com with ESMTP id 3cyjuagc66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 21:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkZpOe1NmrwLJ/HdZk/NTWXUeQlRG1Sw4eDHBQ4Fc1qTxiz/4MIOksGBsqKvKAdcQv5GMJV21l//C1Xgeitke5r6FPgvzK/9PNHBKx5NZgiAI6KSmNKE9K50sMQhtx+0cZh6Wc1IdOEZREpddAawTgl522jTH36sXMPRqMxtrImkPenIBydaufL6cfhIuj2/Ob0d7piZ0J+Xzte+DIOPw/4xAqozx/NiwXRNrCRhUmntrOEOpKTLoxzzk6ebQQSH28WPEJ2Sf3bzjl1Wee9aA3a+C+8Bc0ti56EJMNvN3bi6bjFe08vv4tYFEiEYRcuuIdPGb4H1raUOb+yl26gOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2AXieCbFyLg8XCMsq/uUmaVxowPf/r/3dCQxuVobrs=;
 b=C0+OVsAdTvOm5lJMgicGLN2BbPX3iDSFwf3O713lYsYTHbnFer7Xo62JYzEstW9rZs650Np7Cc/Uakcg9pnYeLx16/KDXWruvjEp4KF35zY3Bym/Wfr6r6KJPD3JjR0JaKRkN3+N6hup0AcEQqxo5lMjPjDB2bRqsgK4Lt5j5CRbCX+OuEsaV3j37iLPaCxF/lTXVMRpllIzI6JbeG2ZlZQNEsz1jxB0DOhi2Mv8Ny36oZIMYE2djgON/j47/i/LUr3k/RBnawvVkSLH5jgLz0Jt7oWXn8Ze83ne1LpM3MwdDpIV0cIahOETu8i/7xZb9+lyZzvBRhQJL/DkQevZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2AXieCbFyLg8XCMsq/uUmaVxowPf/r/3dCQxuVobrs=;
 b=t+tTMKTUIRGDXWN0svZIvpJr92iJ6pBIFLShoyPGn9TsBFP1rCmyzyPebKhb6zLPbt5xFsAUuhnPY6gE3oiEatoTWsjdxe7+UIJrPUTVXd3h+SuX8NReT9UJ9DmSH8+qZVATgSV4DwhPKzKK9bKM3YDT5KVWDC9zR34eLmn0VsI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4851.namprd10.prod.outlook.com (2603:10b6:208:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 16 Dec
 2021 21:28:10 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 21:28:10 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v4 02/14] tests/avocado: Specify target VM argument to
 helper routines
Thread-Topic: [PATCH v4 02/14] tests/avocado: Specify target VM argument to
 helper routines
Thread-Index: AQHX8YAnMX4ZXEjjd0u8haQ/0lntrKw0HHiAgAGIKgA=
Date: Thu, 16 Dec 2021 21:28:10 +0000
Message-ID: <DD75FE82-5541-4612-9F8C-1BD04EE804A7@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <31a4b3bb6a48f291890641ab348e7749c70a2d06.1639549843.git.jag.raman@oracle.com>
 <20211215220431.ggp5fjccaunj55mf@laptop.redhat>
In-Reply-To: <20211215220431.ggp5fjccaunj55mf@laptop.redhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bcaf8a7-d61a-4387-3ff2-08d9c0daf5c5
x-ms-traffictypediagnostic: BLAPR10MB4851:EE_
x-microsoft-antispam-prvs: <BLAPR10MB4851D9EF2D4359E4DA307AC390779@BLAPR10MB4851.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: emuURBjc9Dw+0MYyxddXF3scMZK6lABeKXEa/8D3ECEB7LDSstxnlHvU+tEisRx4uIh5+HDJE3BBhx9Ob9cgkD52n07unPFABse2T39ZSKe3L8by2RzjS/SIudR7knM/37NeJhulOQSKHIs+/1gechmRfnlfWTAmP+nfcUkoCYBM9Z2eobCTwYUT+wPynZCTNKogh48N7qM47EiPfG4ZHY58p8xIEu3AeRCPnnUDG9nGP3mQ+omhFvtxRc1Mms1s5GeIKkgsip+T9K+pWlLaduuLVrtbedza6eZM+dXEvyieLvT4xqY4JWz/cVDKf2hzzmXiO9LKG0ozVpAjXiS/E3FbtBy/T29GcVdu/y7YMTjGQtLwIWOv1Y13mZ/8OfeMYPPfXabjvd/szQYBImtYEjHIZ407l1khBGbk3HeJryAlcH6ErbLuPv1nbfq/KzVweHaV/UsZUUh/iBUV4JMX1bNbaQ62/+jKwJ1jrfEmcXd4C4ruzJQtsGQyFhpfD2BV/rsTgBG/tgpH3tHp0fkjs5hBqDsjMt6aAtgIKEVwAmD+Taf8qBBAyUILo5igvLATIGbeFM0NV2KvTSl4Snf36nqUXL/OsGVQ32NNgFoiC/HbsqgUCvJ0E/sag0xVxAT/0Rt/4lzXLJY9li4r3iXFBF9bXbCPEOOo5HSaxCn/fJskH3895No5QZcH0SRp1gIf6e41vk6CFWUflJiSLuTuuQ8ia0XYwKqOmyGsbKVsQsxPcMsXLkuP+5LCcXOhhkxD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(76116006)(2906002)(6486002)(66946007)(36756003)(71200400001)(44832011)(66556008)(5660300002)(33656002)(186003)(38100700002)(6512007)(122000001)(64756008)(8936002)(38070700005)(86362001)(91956017)(8676002)(66476007)(4326008)(54906003)(7416002)(66446008)(6506007)(316002)(83380400001)(53546011)(508600001)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SvdNbaDm/j3M/DNTTycrBY1r7TFQRVsk2ooitPnuAaQiusEjDL+nPUAJCRbY?=
 =?us-ascii?Q?QsyrgWRyAVkkOvn3k58mof4y3GN+QeBHfZNCwEVGxEFJlXT+VNybxXf9t1PX?=
 =?us-ascii?Q?ZDni6V/YcJnn7igmxNmz2JsvyTwH8ASXnl3LL6LZTTQKyX3CKlGcK8qwa1/u?=
 =?us-ascii?Q?2qxlHRSZKjjZziqzLiBPP3sC6FLMrlS7joxHSLw8cio14Tw05kmGXtE9GWTM?=
 =?us-ascii?Q?F4wItt8l4QWPPpnz7aWcwCfMWk+jqmU9jzjyOwpSJxbMD48r5Jt6Eo0I3URp?=
 =?us-ascii?Q?h3HIGTTEvrg17UqAVpm3QrDoBhzKHLBXbWmmpmtFfp0+TG54X4jchnKuiMad?=
 =?us-ascii?Q?dOA+ngbdHM6ZNHOUdgCReTaYGZ0hYNYTjGFk+bexPdamhyeAoiGshOVSQ7nk?=
 =?us-ascii?Q?9WwkD/knsABjoI4wUs/pbG+fCV2R24QkgiF5bTzdausEWP32cMHBYNkdNOg2?=
 =?us-ascii?Q?PltUk9ey964+t2IqbRC+BxoNyOzLD4A/UN7uZlZa90MMxu1tH+1eQB0gthsX?=
 =?us-ascii?Q?KBNuskc9F8xH+Vt9JrYvYc0EzL43cL9RuXbBt1283W3SX71/5uPAPi+fXxiA?=
 =?us-ascii?Q?MizfuDvYcvQoYBmBKqPAzbj+m6v0SvsCGAJlmsOeKxYQZb0XHfYtk30hc7A2?=
 =?us-ascii?Q?wOugrFDv+PE5zteP5w8iHIVWaTrn0fbV0NNZeZCC74kdX0BKLhh17nNvWJoX?=
 =?us-ascii?Q?WtnADCp3QdqPgdhUqXKZd4Rrx1Goqj7OYL1hxCwCMn1wVDw1JlsszBVbusrN?=
 =?us-ascii?Q?6j3QODZ7zKMHHlftNqpA7oBsLNFKk+fxWK8JWyDIpyBzJXM7BqxeePe8dhXT?=
 =?us-ascii?Q?S30hiDsa4GAC7pFcKXeee0KYFetYX1SM74amMG6JfGJ2ED31VeaoRkhtHtui?=
 =?us-ascii?Q?quUMKwIRciGoaz/chbQiXgMbf0T6GjVbM/7eRY+NEepprerG6LvwWGAXo/RV?=
 =?us-ascii?Q?XqIzyR7s27Cd04ryTHuY05a4hFWPDM/sxuBGY59G3P0Gyzx4tHkb13ivInsY?=
 =?us-ascii?Q?AQKyUNio63gGuAmhs6/We4IwQdwKiaKLR18rZG/1mp2M3/kGh1xnp/u0QHXG?=
 =?us-ascii?Q?s9xPccZM1qhjWyC7bghMMDkqrhlS4Xn0YSK6nXGEtGIipIqsG6GFGDjx1C7p?=
 =?us-ascii?Q?8/bTdWn/1/IA49qGRw4BsGeDLut1KOSX7gHdry3s6/E4+PjAGslEkA+fCAqH?=
 =?us-ascii?Q?Ih58AWI9UjSNhnqHYIHFAea044Zi3/sm1uGFS4Qr+FbtjvAyBvJt3hV/4Jfm?=
 =?us-ascii?Q?R0oywfJWAajHT5LVd2IVkNgXgW3mOUAwIznNLlMmx4zv8nQIk0QSxzRb7BcH?=
 =?us-ascii?Q?/WawIYPneJYetNpTks9Wfj0m+zro4L3lw7xYQIhUVOVV/+kMp8QfSbZjUFqn?=
 =?us-ascii?Q?SfVBdrrxgBO/xso4fL3dGisG4xOSXBf8fioAd4E9UwV3P9knqVKDlCE5ADhV?=
 =?us-ascii?Q?Ab39NJusa7XPmf//yU8U0Ew4wCbapmgm9UFaV/9S4G3cU/wW3b/jbhZBCTF5?=
 =?us-ascii?Q?kKnPY777K1PlZxuZIF7Uzo0NN56YPZcRiKHz1sOFfkkb62Wjhb8zhr8QoaYl?=
 =?us-ascii?Q?U/pd1vabgjjs6w04v3495BAtrSkScf1WaFAjraN53USyqdxjultANvWjvMPi?=
 =?us-ascii?Q?3GJNqNMcGzTxf8OdrCX/XjFJqMUiNg+VgeNt2DM7e18X8KXqSrFR08l02zqu?=
 =?us-ascii?Q?dBjxjQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9D4BE87790FBDB44B56FE57B65F7A976@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcaf8a7-d61a-4387-3ff2-08d9c0daf5c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 21:28:10.7134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0NomlW2HVmvT22OEVN3Ko5JOnShn8gAei18x5ZCRDrUngG1bu8gzdY9v+Hf56DfDKH0WxmRUtkeoTWQq9D+0Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4851
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160114
X-Proofpoint-ORIG-GUID: _FnojmC7clV61dZbin7LjAQesTkN2v-J
X-Proofpoint-GUID: _FnojmC7clV61dZbin7LjAQesTkN2v-J
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
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 15, 2021, at 5:04 PM, Beraldo Leal <bleal@redhat.com> wrote:
>=20
> On Wed, Dec 15, 2021 at 10:35:26AM -0500, Jagannathan Raman wrote:
>> Specify target VM for exec_command and
>> exec_command_and_wait_for_pattern routines
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>> tests/avocado/avocado_qemu/__init__.py | 10 ++++++----
>> 1 file changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avoc=
ado_qemu/__init__.py
>> index 75063c0c30..26ac782f53 100644
>> --- a/tests/avocado/avocado_qemu/__init__.py
>> +++ b/tests/avocado/avocado_qemu/__init__.py
>> @@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, =
failure_message=3DNone,
>>     """
>>     _console_interaction(test, success_message, failure_message, None, v=
m=3Dvm)
>>=20
>> -def exec_command(test, command):
>> +def exec_command(test, command, vm=3DNone):
>=20
> nitpick: if possible, it would be nice to update the docstring, by
> adding this new argument.
>=20
>>     """
>>     Send a command to a console (appending CRLF characters), while loggi=
ng
>>     the content.
>> @@ -208,10 +208,11 @@ def exec_command(test, command):
>>     :param command: the command to send
>>     :type command: str
>>     """
>> -    _console_interaction(test, None, None, command + '\r')
>> +    _console_interaction(test, None, None, command + '\r', vm=3Dvm)
>>=20
>> def exec_command_and_wait_for_pattern(test, command,
>> -                                      success_message, failure_message=
=3DNone):
>> +                                      success_message, failure_message=
=3DNone,
>> +                                      vm=3DNone):
>=20
> Same here.

OK sure, will do. Thank you!
--
Jag

>=20
> Other than that, lgtm.
>=20
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
>=20
> --
> Beraldo
>=20


