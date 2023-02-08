Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740268FC9E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 02:25:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPvfM-00072o-9a; Wed, 08 Feb 2023 20:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhitingz@cs.utexas.edu>)
 id 1pPswD-00021H-7q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:29:18 -0500
Received: from newman.cs.utexas.edu ([128.83.139.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhitingz@cs.utexas.edu>)
 id 1pPsw7-0006OU-5F
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:29:08 -0500
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45]) (authenticated bits=0)
 by newman.cs.utexas.edu (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id
 318MSukf023806
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 8 Feb 2023 16:28:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.utexas.edu;
 s=default; t=1675895337;
 bh=XRKxOHs5s/9/lLHEg5JWBwVXbijH5Tus2qCHtS+18VA=;
 h=From:Date:Subject:To:From;
 b=RuKbRodyB8FxdNkgjyTlam/rlCwXpfghDPLB2FShAncYsr2UbNT/tjrCUkWx4han6
 qmbTnZVv7La2ng1ye7sy+sK5OHfbkLr6deulE7q7VGJyoiT+WIzMUK8G+qhV9NI3Kc
 aNeJmpaVnh2II8N65JtvK0y/F5Y9DNRi97GTRL+c=
Received: by mail-wr1-f45.google.com with SMTP id a2so31025wrd.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:28:57 -0800 (PST)
X-Gm-Message-State: AO0yUKVBZ3RHO3stchLxSYWIMH7eTsccUNAm5i4fxZcwPNSNBBcbZAL3
 T8vH7Ve6quTUZUvbDIaooC0v5ei6WQ5Avph6/Hs=
X-Google-Smtp-Source: AK7set8mbGoRXCwl1SgpskSAkK60+Qa11w0K1p8bMYiXiEydLXQZtmyIAC19GURKN1w3a8xjs4+g33vnI+RBdviFOpQ=
X-Received: by 2002:a05:6000:50a:b0:2c3:efe7:a19e with SMTP id
 a10-20020a056000050a00b002c3efe7a19emr229343wrf.201.1675895335827; Wed, 08
 Feb 2023 14:28:55 -0800 (PST)
MIME-Version: 1.0
From: zhiting zhu <zhitingz@cs.utexas.edu>
Date: Wed, 8 Feb 2023 16:28:44 -0600
X-Gmail-Original-Message-ID: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
Message-ID: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
Subject: CXL 2.0 memory pooling emulation
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002c3afc05f437cae2"
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9
 (newman.cs.utexas.edu [128.83.139.110]); Wed, 08 Feb 2023 16:28:57 -0600 (CST)
X-Virus-Scanned: clamav-milter 0.103.6 at newman
X-Virus-Status: Clean
Received-SPF: pass client-ip=128.83.139.110;
 envelope-from=zhitingz@cs.utexas.edu; helo=newman.cs.utexas.edu
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Feb 2023 20:23:58 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000002c3afc05f437cae2
Content-Type: text/plain; charset="UTF-8"

Hi,

I saw a PoC:
https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/T/ to
implement memory pooling and fabric manager on qemu. Is there any further
development on this? Can qemu emulate a memory pooling on a simple case
that two virtual machines connected to a CXL switch where some memory
devices are attached to?

Best,
Zhiting

--0000000000002c3afc05f437cae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I saw a PoC:=C2=A0<a href=3D"https:=
//lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/T/" target=
=3D"_blank">https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huaw=
ei.com/T/</a>=C2=A0to implement memory pooling and fabric manager on qemu. =
Is there any further development on this? Can qemu emulate a memory pooling=
 on a simple case that two virtual machines connected to a CXL switch where=
 some memory devices=C2=A0are attached to?=C2=A0</div><div><br></div><div>B=
est,</div><div>Zhiting</div></div>

--0000000000002c3afc05f437cae2--

