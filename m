Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF36CCB5B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFjv-0002lp-5T; Tue, 28 Mar 2023 16:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1phFjt-0002le-FH
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:16:17 -0400
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1phFjr-0003vL-8v
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xf0pllxcOBZ6h0tB8x7BiTHhF42eNkXzdJaicnTV18A=; b=dTWGALlaWLE3w3gKdUdZ0lW94h
 mDR6H2svtBNaW/ihS0cmztgtMuln65As1l67Ff7KwlP0cD4F1y7TNPhhZiF3XesddhHpbelXlq2f7
 BVDnYwvbCE5SH0VYH/Kfavj1qB5zadY37VIMhz7J4gLvtIsNDOhsUeU6iirw/sl5HBttGSmvaqKzB
 gzr6KQx1Ma4x1FZ5r5q6jFSksR5QeARgMdl/ukjXIPfsVbCtAATxcPxOzPYRPH0v/K9v9bBdsbD6d
 waqqx9Iwc7Vx22FTOw+bbKB4S5G/BqKKi4GjvbMj38yMpolzkcfmRJuFOG6w/6f0wI8tqZOBfU4ci
 GbiV7bHA==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96-58-g4e9ed49f8)
 (envelope-from <hc981@poolhem.se>) id 1phFjq-008yzL-03;
 Tue, 28 Mar 2023 22:16:14 +0200
Date: Tue, 28 Mar 2023 22:16:08 +0200
From: Henrik Carlqvist <hc981@poolhem.se>
To: Daniel P. =?ISO-8859-1?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: mark.cave-ayland@ilande.co.uk, hc1245@poolhem.se, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-Id: <20230328221608.328ab80f.hc981@poolhem.se>
In-Reply-To: <ZCMq/imcAq0ApLQp@redhat.com>
References: <167305907804.10652.2746409341903316717-1@git.sr.ht>
 <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
 <20230123200937.32eb19eb.hc981@poolhem.se>
 <20230304220754.0c6ae562.hc981@poolhem.se>
 <ZCLzUyiDeKLfQqWT@redhat.com>
 <20230328191958.3e3eb5e4.hc981@poolhem.se>
 <ZCMq/imcAq0ApLQp@redhat.com>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc981@poolhem.se; helo=mailout12.inleed.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Mar 2023 18:59:26 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> I'm generally not in favour of creating many different ways to set
> the same thing, especially not multiple string based names, but if
> a single vocabulary for strings is insufficient, then having support
> for numbers feels reasonable.

If only a single way to set them would be allowed, I think that the
hexadecimal number would make most sense as we are emulating dip-switches.
However, it would be nice to also allow more easy to remember strings where
applicable.

> If you care about documentation then I think there ought to be docs
> added in QEMU for it, as out of the 33 currrent keymap names supported
> by QEMU, only 28 seem to be supported by this device.

Maybe it could be documented by printing some text if given

-global escc.sunkbd_layout=3Dhelp

or

-global escc.sunkbd_layout=3Dlist

Best regards Henrik

