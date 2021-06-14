Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793F3A702A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:21:26 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lst5J-0002Uo-GR
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lst3M-0000Xb-C6; Mon, 14 Jun 2021 16:19:24 -0400
Received: from mout.gmx.net ([212.227.17.22]:39903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lst3K-0008Me-5O; Mon, 14 Jun 2021 16:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623701953;
 bh=LPLWS+bOik/fTWKkiDmp/qtDFJM30lie49dPcLbpRpQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=h1dqllJnxr3eMjDtcu6lt5QV7xT2whHaOVftX4Czo79IUGWNHpENtsFDsWDpgHPbH
 IpmH5pFRYyryKoUF8u7CWnN0PEvIq5T6re0ZJx+sXfzcMeprLhNjnlvVsRuNLttOnk
 ePHuPETZ4MBoZ4stMrgaeQZmVArk/bdXcAlzzoxs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mr9G2-1lV3VH1ODu-00oDuy; Mon, 14
 Jun 2021 22:19:13 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>
Subject: [PATCH v3 0/2] hw/nvme: namespace parameter for EUI-64
Date: Mon, 14 Jun 2021 22:18:59 +0200
Message-Id: <20210614201901.17871-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mpmAgnfQ33OKunG68u7amM6aq5VappOlxGa+RK/lw49Zt5PZwiV
 C1GCiKrkZmMQsR6vUoZ/gDJxgdEd+Ir2UQr2Q6MZVqgdRy8FwUNiEbBngaKc/5SmIeUq1lQ
 YXRMv1qXBrQsLym8EzSXdWmCbXKsj8kSD2ZIMqROqy3iFoPLtHrl4+Ym3k4AFCoB3rh8ffR
 IbwRGQasdCgVVZF9mfUWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x/SS+42A3n4=:Jyrj1v87AbAp6cFYFVqLRY
 EHtF9Azu0U56KOIMHgbzICXghyPl25sN0j9w9K2IXdYo+eYTDl+CNQZWcsZG7vnws2ttI60lE
 KRbNU1EwrZoxl5ZESWM/XvhuyLrhVGc2Z3TPbyDNxTAQz7OOOlWEKy0G8FsOx7Vm2aOTLeEQ+
 eosqn7kePO0T2etnIp8E7EP5kLHG6ogJz6rsK3RE5oN28ArAksmE5mNFxeZl9Il7aZDCy8sSS
 XpCjecb7pj3bQhTfV4HlUo6Ao6keLrLeQNRFS4QH8kGZ6mPKZaitBSPsIPzVSGPsyYcs9uXTi
 m6NQzrJLtu31bfNWSHnNxGZhaN/WbeMJw5fzcsdfoWqNyMACXWa+SIT9ZaG57ySGfK7RiYKVO
 rM7Pk+lu4056NpBWfrE58vL5bKTmHQgQkNfbwKGS9/IAEBHdzuH57avxNDCQHfBzyBlMM3qDk
 vuXoc6Em5ay7AfWlddc6LXr97jeCf9yHP572ULBBDkdVuif3hoh8nbLtQy5kuyqyq0EEDLS6X
 h/RWb0OUkUxI5hYFJhUJp/nL3exeuouaX4WcdV7Mhijbt1c2Yh++B9JqzPODWc5fOqGliVooK
 W4oE+0Y1DfY5f5sjgEG5TO1bKYkpFdt8GAFU0C1FRGJEaUfjE93KShXEcjVl29m17STD9l+IY
 e+rR1dlnO+4p6ZMt1n88bDRufUK48EGVKX5nwIQDwQIO5g3AS1m0C9VU964QPOGilDP2Mctei
 Y6isSA3fUQ+sIhE7k1RJ6uqiO7kVro20VJJ0wbd1BJsXPybmK49gq0/FwJTv59NfcxPpj0c+i
 x1zuAA5Wd2H/pUSYQ588kAA8oHbJMHx1CVQnZxAYryjrocQdwMyQ4puIomitiWzwcHAkRXpO2
 MSBPRrD2i23rq3pc1QB7JBwYdQCxyu0IhxzBHHs1E6fynx+ioId8bf1cJfuIeRHsxbxSU09ep
 XfLcmKLfDriBAAk986X2HczbXAdEVWyT0jGJatF7hRjtMx89gMrjMAml8KD6THK0X8kLOitwD
 KWIEfM56BbnJeS9PeDJAUEoMwBYi44pCXM4B3mcIviO7DzTgMyPOtoproQG98KyOjmaInovOk
 hCqoFP959Rc1MqnEWozG04INoz9p7JTQsAB
Received-SPF: pass client-ip=212.227.17.22; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
paths. Add a new namespace property "eui64", that provides the user the
option to specify the EUI-64.

v3:
	use 52-54-00-00-00-00-00-00 as starting values for generating
	EUI-64s

Heinrich Schuchardt (2):
  hw/nvme: namespace parameter for EUI-64
  hw/nvme: default for namespace EUI-64

 docs/system/nvme.rst |  6 +++++
 hw/core/machine.c    |  1 +
 hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
 hw/nvme/ns.c         | 11 +++++++++
 hw/nvme/nvme.h       |  3 +++
 5 files changed, 56 insertions(+), 23 deletions(-)

=2D-
2.30.2


