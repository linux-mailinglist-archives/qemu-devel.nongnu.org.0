Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90B46A49A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 19:29:09 +0100 (CET)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muIjc-0008G6-3j
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 13:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1muIgC-0004yo-Bv; Mon, 06 Dec 2021 13:25:36 -0500
Received: from mail.nh2.me ([116.202.188.98]:45349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1muIgA-0001xz-2g; Mon, 06 Dec 2021 13:25:36 -0500
Subject: Re: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nh2.me; s=mail;
 t=1638815124; bh=ZtJkgB5hgOROt1fJy4fLWCSPHw4p5O5ftub0AVlMufE=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To;
 b=HxTeA1bAecZjquUPkew50/zGATXU/t2Afq60c8xvCgV1cOshqSacsxJRxfu89BTBB
 kwOia51vi/ONuj/5oyRqm3qFOG1abq36YveCg5pM6s2m4bZ0+3ExIFur4ARI5Z7Lic
 vfWGXIcMTxzirASsqjHkWpahpmCie9jfWyjgtCR+9yO2KIz7mwNIIebo4WIRpXHbV/
 lH7e0Ue2fnl4HBwN9FA576yIGreEHvzg9WmXMqKiTOZwAztfsKnsmt4FFh3I3wngGl
 IJeLug5LI8SUcWgZBgVr4iG4rOQ+SZsBl29YLmw39N6fqLO5GitNwVieMDV8y5T2sB
 oPrka/QUgCtDQ==
From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
To: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
 <CAFEAcA-TxOys5d=SAqwqU749j3-UoBf+WsWpMYZW_35w1r2ypQ@mail.gmail.com>
 <55c9d253-8f4c-cd06-77b4-fbbb26cda619@nh2.me>
Message-ID: <c1c454bb-bf22-c985-5aba-0c7ffb3cb759@nh2.me>
Date: Mon, 6 Dec 2021 19:25:23 +0100
MIME-Version: 1.0
In-Reply-To: <55c9d253-8f4c-cd06-77b4-fbbb26cda619@nh2.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=116.202.188.98; envelope-from=mail@nh2.me;
 helo=mail.nh2.me
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey all,

just checking on an update. It would be great if this could be included in the coming/next QEMU release.

Cheers!
Niklas

