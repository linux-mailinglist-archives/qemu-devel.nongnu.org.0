Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C910933A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 19:03:44 +0100 (CET)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZIi6-0007U4-Qv
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 13:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iZIfT-00063F-6b
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 13:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iZIUu-0004Br-6j
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 12:50:06 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:33449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iZIUu-0004BN-1h
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 12:50:04 -0500
Received: by mail-ot1-x334.google.com with SMTP id q23so7557849otn.0
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sjpCKWb2YyHD+YvN9OwVKBfWRw/ZaktC8V8A4+7ZBSM=;
 b=Nb7f5j46yVZpR52fbuq66cL5PX8pP282iuHuDD3GZLPpiKvtb4fettL885rRn5BzII
 w7azLhXGzrXFo/anPapzgxvsruBiAhp1XaEEcIA9kJTFtGKfzfdMAv0pSHJyo8SBrl3k
 RBXK7i4kpNbGXU/A/wjStcLLPYZdBQn0aU0RIv95Su+D7HabdqofeVWeVz40YCNQs4KW
 CCuEJjAwX0RiHPPn6JsanuQprIIpiqoaSy4T7ybmwK5BCcqXZw37KF+LcLRMs7JhZQva
 4Jk9LSJPoZdqkNKaJR+FaHePriS0kr8kSSCuX7EeULHXQwOXKHR48vn5+WaPraJ9yEry
 m+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sjpCKWb2YyHD+YvN9OwVKBfWRw/ZaktC8V8A4+7ZBSM=;
 b=lR54z34LfQbiu1r6TPFMO2x9JdH5TpaNyiXMvk0LXwkaOOhHPiuDDUwln4Qi9GLt/E
 ay+YQYLdrI+Ci5jVRvHPcW3TTE158Dyh4aatc4y5b9c8kf06ZkI/+lK+oCOxkvQcYUPd
 zwRCrGVUD6/hsgAc54TrXntYHMjubn+wnGS5VXa73gzLRsVxAYCVty8pmbsfHZsjddsn
 8lgxtHEx50Mf4g+FJ0F8875fiYfVPPdv+joRvnrZqvn+XKphqZcD0+pox9/c3XCsB5l7
 74b8GNLpXdguItpgrD2qcIleAEzFJEPMV4kHOjSn0JtLoz0S+eI6DSbN0aCjHbHnzVLz
 QINA==
X-Gm-Message-State: APjAAAUvi9BYyRunyT2C78iyWWxfj0nymB5f2w4VAARR3dqT6AKy6PvS
 eECg9mmSqdAPaswix53UxhuEQWzDMu+sKARvHgCs7IGW
X-Google-Smtp-Source: APXvYqx/xK+QmUJTBJJMLqzny0HD0xDu/fkjtF9VNpuz1lgNl2HpLO6Z83fLGTXmQTZZdIsUXBTGrm1H0NKG9ANvufk=
X-Received: by 2002:a05:6830:81:: with SMTP id
 a1mr20460453oto.64.1574704201869; 
 Mon, 25 Nov 2019 09:50:01 -0800 (PST)
MIME-Version: 1.0
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 25 Nov 2019 18:49:51 +0100
Message-ID: <CAL1e-=gmaimCBh5NBBYFp6Z1ci4ZheQtXpyjU9Uexqi4zSHh2A@mail.gmail.com>
Subject: [QUESTION] What is the best license option for new files introduced
 in QEMU?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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

I read LICENSE file, but I read also recent contributions, and it is
not clear to me what version of GPL is best/recommended for new file
just being introduced to QEMU:

* GPL 2.0
* GPL 2.0 (or later at your option)
* GPL 2.1
* GPL 2.1 (or later at your option)

or something else. (The rest od wording of license preamble is clear
to me.) Please somebody explsin snd clarify.

Thanks,
Aleksandar

