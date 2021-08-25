Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C73F6EC9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:25:03 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlPK-000429-60
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1mIlOV-0003N3-0p
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 01:24:11 -0400
Received: from pv50p00im-ztdg10011901.me.com ([17.58.6.50]:55598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1mIlOQ-0001KR-Sz
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 01:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1629869044; bh=dKYDAjkrXkkptHVy+PazoFtIRG2jRg87vhLidYbh6w8=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=KIefU66HlNuKx/EZeaTWaaXFtAEw7SlgKQOWPSFs3yKJHxIaL/Jq5/hSPlOjtvMI6
 UBp22JU83RY0Y6zaSyXrWb1ZFkfQu18Euk7mMd2ym0FicgHa9bIuJUX/YzkxD0xtk2
 e8C8Lt1S9Ahh9cfAkuJ+pNA4OnprDSzIsV21aTGZ1YSuhk7IKwosV9bvzIebnDL1YH
 uCGkVUl7svvIwLLtf0FnvEJPqBwG7mMB27bdCfhtFcxSXhx35Zwe5JNawz/zi/ppI3
 wp6OZfZVo/i5lFPjpmHOKMkPFVa8j/kixWfjQxbA45BXkVBIKr3GrqRPjRRJzVc0dD
 C35Cd0+3wBxXg==
Received: from smtpclient.apple (unknown [117.10.132.216])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id 9EE738004D2;
 Wed, 25 Aug 2021 05:24:03 +0000 (UTC)
From: Chen Zhang <tgfbeta@me.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: edid support for a Mac OS 10.8 guest
Message-Id: <97B8E871-07B9-445E-8BC7-3A7BCE7F06CB@me.com>
Date: Wed, 25 Aug 2021 13:24:00 +0800
Cc: QEMU Developers <qemu-devel@nongnu.org>
To: kraxel@redhat.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_01:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=560 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108250032
Received-SPF: pass client-ip=17.58.6.50; envelope-from=tgfbeta@me.com;
 helo=pv50p00im-ztdg10011901.me.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FAKE_REPLY_B=0.985,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Tue, Aug 24, 2021 at 05:46:43PM -0400, Programmingkid wrote:
> > Hi, I recently tried using the edid feature in QEMU for my Mac OS =
10.8 guest=20
> > like this: -device VGA,edid=3Don,xres=3D1280,yres=3D800. When the =
guest operating=20
> > system loaded there were no additional options available in the =
Display=20
> > settings. Would you know what is wrong?
>=20
> Probably macos just doesn't read the edid block ...
>=20
> take care,
>   Gerd
Hi,=20
Probably it was due to the low default vbe size.
Adding a `vgamem_mb=3D64` to the option list would be suffice.

Best regards=

