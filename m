Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5013FED32
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:53:33 +0200 (CEST)
Received: from localhost ([::1]:36784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlHg-0003Bf-2n
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vintagepc404@protonmail.com>)
 id 1mLkzA-0005IG-7D
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:34:24 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:55433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vintagepc404@protonmail.com>)
 id 1mLkz8-0004dW-3D
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:34:23 -0400
Date: Thu, 02 Sep 2021 11:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630582459;
 bh=OFc1ymYsnCTgd2mjj0F1vnvDTtpjwYNpZ8A49MKLgCI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=khzT9CSmag4Dfj7XT/M1XT8tiecUR5qDGNgMGCEfKJ/V10fK9pHJQlCO/rwAkOp6N
 veYkP6oXiS7PAQsd42NyBB/Z+NuUtFeI+wIr8UcX7QHYlqBDbKAbxAr9xTb57LBlV+
 Lj3jcjytdVcuB1zMXV2Mi9Fwpdpjp13MEY4TA+WE=
To: "kraxel@redhat.com" <kraxel@redhat.com>
From: VintagePC <vintagepc404@protonmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Subject: Re: USB-MSD non-functional after merging v5.1 to v6.x (seems to be
 internal USB stack issue?)
Message-ID: <vAlTpwWpoR91zKfyUom-_cFnqJA3-xN8UGC9BiCUBK3pVgcjE18OC6e_jfWca_POVxFm-kCa73O6g2Da5FLhDZXwOoY6aq8vZU31NRIAcYc=@protonmail.com>
In-Reply-To: <20210902062232.uau63uq53akr6snr@sirius.home.kraxel.org>
References: <HiU5xYXWuIPVg8tuVKzH1LTrKtKSBr01C6h_-uUbJ720IWY8SO1Bna1_-ak0HWraabqIa-hkGUoxeG2aQn6v7WAy1gnDxq9b_tklE0dGRYc=@protonmail.com>
 <20210902062232.uau63uq53akr6snr@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.19;
 envelope-from=vintagepc404@protonmail.com; helo=mail-4319.protonmail.ch
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: VintagePC <vintagepc404@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

Thanks for the reply!

> Is this reproducable on master branch somehow?

Interesting thought... I initially hadn't considered it very much because I=
've got a bit of tunnel vision with my fork  - but perhaps having a go with=
 the RPi2 which uses the DWC2 subsystem may manifest something similar sinc=
e I made some use of that as a comparison when first implementing the F4xx =
subsystem. I'll give it a try and report back.

> Try run qemu with valgrind to see if there is any memory corruption?

> Oh, that is easy, all usb devices have a pcap=3D<file> property to write
> out traces which you can then open in wireshark.

Thank you - I'll report any findings of interest. I'm hoping either of thes=
e may reveal something more specific about the nature of the issue.

~ VintagePC


Sent with ProtonMail Secure Email.



