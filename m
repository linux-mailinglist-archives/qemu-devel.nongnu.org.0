Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB5531AED7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 04:49:28 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB8PX-00031c-GO
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 22:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lB8OX-0002cv-LG
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 22:48:25 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:42921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lB8OV-0003w5-9g
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 22:48:25 -0500
Received: by mail-qv1-xf34.google.com with SMTP id f18so1733120qvm.9
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 19:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=f2CBLX8kk2/eQ4rzCt1ZF5UCewpBNHqJqTuDHRLmN60=;
 b=Orwo+wYSE3bZ3k61iGWEonJhrv+M9p7UUeWcsOrhXpZxchcrWNsywBqt73qOjTvPdz
 1rWsedyk8UlASxmJw5ImtN0tk3D14IV/ZrXjNCkq9AzVT0moQPs9JoVz5NJq9xcmOA4S
 COrj81a35JUWUjCC8eaqeCa8t5Icw5RT7n8E7F1TNTsYg4U9xfToQ+MzEMM8CQqjWJIk
 AL2r4IvDBhcpWeJZdbTv5gWHieQ7BGTb3lgAsTYLq8YypbtXGFGWpqXOcQZszc6hwygW
 ce5ztZyuAufuyvPuN8hDEYpY1sjlEqi6JG6GVqXayPoJowqw5a3Kq1HlRBJEloyk/GdU
 Rt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=f2CBLX8kk2/eQ4rzCt1ZF5UCewpBNHqJqTuDHRLmN60=;
 b=tPzrtzaLx1sgyffftJyjCyT8fyaWDq8jwNFsLqkt4xdDUq9yD9O9W4+SIGnpOUTSA3
 1iFpC9TGJDpzzLnqzAd3CCDtHkDyGjZccktd8KBXYo1vw3q8F2/mOz90jD3vTf9apIkm
 ypyEl+4RR36UIYOLY5a7MgFe/gmMk725dsDajADs4Tquo5Z9ice13G2z1ujPZO8HB0Mo
 OE0wZiySTV/YpTVVwBkaObLrsN1cYG1NS7ikbR+9CjuTU06+pFa1yqKczxERGZqivSxf
 lIsGXjPM02HJTFR+qyqY8nJ9lNDgxLh0wS7+pB4AL9nKDth69QKMArIlSoOYITqsTJfk
 GNsA==
X-Gm-Message-State: AOAM5313/6mbofCPLMy8fDlQ2Yym82jeJSRyP6Lc6GofGyOnL4Bosm+r
 5VrxSOxeRphbesPguhV6Jgjgg/IrHaQ=
X-Google-Smtp-Source: ABdhPJwdOTZ4zvXwepXJyS766VKVDgDpWsDsNLjvQOVsVTZxfHCZURw+nUqkWXluek75jTIQ8Pk7jA==
X-Received: by 2002:ad4:4791:: with SMTP id z17mr2710173qvy.4.1613274501762;
 Sat, 13 Feb 2021 19:48:21 -0800 (PST)
Received: from [192.168.0.4] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id c143sm2698358qkg.83.2021.02.13.19.48.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Feb 2021 19:48:21 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Guest network access not working on M1 Macs
Message-Id: <1789150C-1AE7-4347-A822-0B681061A45D@gmail.com>
Date: Sat, 13 Feb 2021 22:48:20 -0500
To: qemu Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Is guest networking working for users of M1 Macs? None of my VMs are =
able to connect to the internet. I'm using an M1 Mac with Mac OS 11.1. =
My QEMU is currently at commit f4ceebdec531243dd72e38f85f085287e6e63258.=

