Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B06785D7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 20:11:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK2CZ-0008EZ-NP; Mon, 23 Jan 2023 14:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pK2CX-0008EP-GM
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:09:53 -0500
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1]
 helo=ns12.inleed.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pK2CT-0005fJ-Tm
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j12jqvyo8xJ9y/A4vtwDP+l7hc8vScXsd1n5dvEGpKY=; b=YxE7l6czzzIFC5iqZXcTmYjj+T
 ojM7pv0iRJj0Dq6XkvIPjeJoYGn3N1KhFrV+UHRHX3ukwUtA4/8tPv0oZRymVOIEJB41BlJ8plJSr
 o9WQju0bEw0jM9CWfA8QrPl9pu9ild0NxTWWgSPvT4SSW+qlzVKK4lPuk2hzU81U20+J+pocKxIi+
 Pyt7VNm2IKgohQVz7tWRQS33OBMyCII4F8jWRMz4dopnnd4LbIMlwna8QEiZ1y9q8M4ghPP8IQPpF
 u0lOmAB9W2jSZlyTZsWz6BM1ZEWis6FBtmYVDNV5ITRaTTcO3MdravBkgAg81aIErr79O/jKo4nni
 77AwEbpg==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96)
 (envelope-from <hc981@poolhem.se>) id 1pK2CS-002rBK-2B;
 Mon, 23 Jan 2023 20:09:48 +0100
Date: Mon, 23 Jan 2023 20:09:37 +0100
From: Henrik Carlqvist <hc981@poolhem.se>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: hc1245@poolhem.se, qemu-devel@nongnu.org, atar4qemu@gmail.com
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-Id: <20230123200937.32eb19eb.hc981@poolhem.se>
In-Reply-To: <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
References: <167305907804.10652.2746409341903316717-1@git.sr.ht>
 <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc981@poolhem.se; helo=ns12.inleed.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 SPF_HELO_SOFTFAIL=0.732, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Sun, 22 Jan 2023 18:07:47 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> Did you see my comments re: OpenBIOS for the earlier version of this patch?

Thanks for your replies! Sorry, I missed that reply... To make sure that I
wouldn't miss any reply I subscribed to the mailing list, but that made many
mails to me drown in mails from the list...

On Tue, 10 Jan 2023 23:08:27 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> Thanks for the patch. I think what you're effectively doing here is
> equivalent to creating a qdev property that is used to set the keyboard
> layout, which is a nicer approach because it enables better control from the
> command line and also handles the default value.

I must admit that I am not very familiar with "qdev properties", to me it
seemed like a rather intuitive solution to use the existing -k switch for this
purpose as it is intended to use for keyboard layouts. Would you prefer some
other implementation?

> Does changing the keyboard layout work with other OSs?

To my knowledge only Solaris and the SUN sparc openboot bios cares about those
dip switch settings in the 32 bit SUN sparc machine keyboards.

This post on a forum makes me think that it doesn't work with NetBSD:
https://www.linuxquestions.org/questions/%2Absd-17/netbsd-sparc-non-us-keyboard-layout-issue-367601/

It does seem as if the Linux kernel supports those layout dip switches,
however I don't know if it is used in any Linux distribution. I have never run
any Linux distribution on sparc myself. From the Linux kernel source file
sunkbd.c:

-8<--------------------
	if (sunkbd->type == 4) {	/* Type 4 keyboard */
		sunkbd->layout = -2;
		serio_write(sunkbd->serio, SUNKBD_CMD_LAYOUT);
		wait_event_interruptible_timeout(sunkbd->wait,
						 sunkbd->layout >= 0, HZ / 4);
		if (sunkbd->layout < 0)
			return -1;
		if (sunkbd->layout & SUNKBD_LAYOUT_5_MASK)
			sunkbd->type = 5;
	}
-8<--------------------

> It may also be that OpenBIOS will be difficult to use if the layout
> defaults to anything other than en-us since I suspect it will be hardcoded
> there too.

Today qemu is hardcoded to emulate dip switch setting 0x21 (en-us layout). My
patch keeps 0x21 (en-us layout) as default value, but also makes it possible
to give other values with the -k option. From may experience it seems as if
OpenBIOS does not care about the settings of the dip switch and allways uses
en-us layout. Suns openboot bios (which is possible to find for download and
use with qemu) supports some, but not all layout dip switch settings which are
supported by Solaris.

regards Henrik

