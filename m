Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E62CDFDA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 21:46:28 +0100 (CET)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkvUg-0006Pi-Sf
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 15:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkvT9-0005sG-V7
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:44:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkvT7-0005h9-40
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:44:51 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3KhaI1024478;
 Thu, 3 Dec 2020 20:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 content-transfer-encoding : from : mime-version : subject : message-id :
 date : cc : to; s=corp-2020-01-29;
 bh=yNfqjGVmiIq4bu1p2+U+inkTr7ZWCPm3JT4AQ4k4Zho=;
 b=yFsWXfB8FFt+ftEIH8ORtoJYvqyprsvabGuFJ1IDqTgpewbobunYlRAS86KZsNfBVIiG
 IO7IwnZBfP7lCcNYpQaNRbMrKiTQG005ZPn+dSxd7dWoAMoOq1SF/dLBZUN+nrv+sy53
 v34r6Qm+QMrb6H1/SIRDRgGPKAUxZV8ngTDFHBVMv7iG1rMVhbgJ/l49WjMoGS6+3X/L
 ZCmymUG3yQaIpCHwqF6gN6UR2CwO7ruVpNQUYxs5Po2ZwmU9kG3ach8cWAmFmyY1pSoW
 Q38CoO69TpCnp/3GcOplwF3Rs0T7GMB/WhIRBG7Vb3U1oSpgsbnn+xRGZDOc6gcPx2de ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 353dyr06gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 20:44:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3KdT4r029638;
 Thu, 3 Dec 2020 20:44:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 3540g2drm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 20:44:30 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B3KiRSw004295;
 Thu, 3 Dec 2020 20:44:28 GMT
Received: from [192.168.0.6] (/24.147.50.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 12:44:27 -0800
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jagannathan Raman <jag.raman@oracle.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
Message-Id: <18E1F3DA-C2E0-4368-A75D-5A571ED76FE5@oracle.com>
Date: Thu, 3 Dec 2020 15:44:25 -0500
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: iPhone Mail (18B92)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030121
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=EF=BB=BF

> On Dec 3, 2020, at 4:53 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> =EF=BB=BFOn Tue, Dec 01, 2020 at 03:22:35PM -0500, Jagannathan Raman wrote=
:
>> This is the v12 of the patchset. Thank you very much for the
>> review of the v11 of the series.
>=20
> I'm in favor of merging this for QEMU 6.0. The command-line interface
> has the x- prefix so QEMU is not committing to a stable interface.
> Changes needed to support additional device types or to switch to the
> vfio-user protocol can be made later.

Hi Stefan,

Thank you for much for reviewing the patches! :)

=E2=80=94
Jag

>=20
> Jag, Elena, JJ: I suggest getting your GPG key to Peter Maydell so you
> can send multi-process QEMU pull requests.
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


