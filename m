Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F62B8393
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:04:25 +0100 (CET)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRod-00030q-My
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1kfRhm-00010H-Ac
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:57:18 -0500
Received: from pv50p00im-hyfv10011601.me.com ([17.58.6.43]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1kfRhf-0007QS-JT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1605722230;
 bh=yxE1WgBJWz5FE/H9pCCWCdHfoW3SGKj+KnCSj90fxJc=;
 h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To;
 b=ZN3ixbJl9o0pK73/CnpNexIfvYohZEa8ng6atHkc2n8bmSjqbsCFgFOHp95O03fPd
 WWQCYH1TXTDJZEEgRFKRJw2652bejBmF8NPocfzghDQX1Ka72l5qrBoeEIQnacXQv1
 4BHAnLvmJhheN5quZd3xICDq7c7oVqMxoPQ6MbXIgR0o51lGKKc7Ik1gQFWeRJGCyC
 ZjfwOV8BiBAuA7YHH/+2J7Rrrd+bTRinL+GltVgB7AW+S9g0yLNKCXvqFmDRQbBe5B
 wPn5w19vxEqAkElvkLDlk8ZBFQOumcmNQf7Alp8TYNT+DfMtRFrIkn0dX2a18YWZ6d
 0Pqpyj8y6LdpQ==
Received: from [192.168.50.83] (unknown [223.167.5.82])
 by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id 7EFB7380668;
 Wed, 18 Nov 2020 17:57:09 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: How to copy data between guest memory and host
Date: Thu, 19 Nov 2020 01:57:06 +0800
Message-Id: <300A9993-BB43-48CC-8AC2-2FAB29B8D266@icloud.com>
References: <831379F2-6346-41E8-A019-39EB596086BA@icloud.com>
In-Reply-To: <831379F2-6346-41E8-A019-39EB596086BA@icloud.com>
To: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: iPhone Mail (17H35)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_06:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2011180126
Received-SPF: pass client-ip=17.58.6.43;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-hyfv10011601.me.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 12:57:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



By the way, I=E2=80=99m using TCG mode.

Thanks

> =E5=9C=A8 2020=E5=B9=B411=E6=9C=8818=E6=97=A5=EF=BC=8C=E4=B8=8B=E5=8D=883:=
44=EF=BC=8C=E6=B2=88=E6=A2=A6=E5=A7=A3 <shen.mengjiao3@icloud.com> =E5=86=99=
=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFHi,
> I=E2=80=99m adding device for one platform(e.g. mps2), and also writing dr=
iver for that device on guest os. There is a buffer allocated in qemu where s=
ome data will be cooked, and driver will update buffer address located in gu=
est memory space to qemu device. So the question is how to copy data between=
 the two different memory space?
>=20
> Thanks a lot!
>=20
>=20

