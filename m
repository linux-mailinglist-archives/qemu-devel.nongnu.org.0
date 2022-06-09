Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB754462D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:43:34 +0200 (CEST)
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDlM-0007gs-SX
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzDjj-0006p2-Uc
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzDjh-0002B1-HG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654764108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Srwf7Wj8J3Dmk78DRzRu1TLL7tzcpeOCyRx7Lq40f2s=;
 b=S5xytE/L2kUlU99JCKT78EUoLwo8wOBP2UHImX1iZN/GyacEmRjOvflJJaMUbJGTwuGaXr
 84tyhhHh5TI0SonrHab/KyXQ6f3LuEFdh+W3TR4yHEum3E6BITkyV1RKldEQfgYkV6Hs/T
 A4EafBo/Xm3nVSpVSzU0I7nxmtyx3VI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-QeyJaua2NBOdEWJG13BdJw-1; Thu, 09 Jun 2022 04:41:45 -0400
X-MC-Unique: QeyJaua2NBOdEWJG13BdJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB024106655B;
 Thu,  9 Jun 2022 08:41:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C157492C3B;
 Thu,  9 Jun 2022 08:41:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB0671800094; Thu,  9 Jun 2022 10:41:42 +0200 (CEST)
Date: Thu, 9 Jun 2022 10:41:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Kevin Locke <kevin@kevinlocke.name>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC][PATCH] docs: note exception for PCIe IO port access
Message-ID: <20220609084142.zycmwcjumcekavtq@sirius.home.kraxel.org>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  Hi,

> I find this too general; a PCI Express device is supposed to work
> without IO resources. Graphics cards with legacy VGA compatibility are
> the exception AIUI (see again Alex's blog about VGA arbitration), so we
> should spell that out.

Yes, it's an exception specifically for VGA ports.  Can be turned on and
off here ...

    $ sudo lspci -vvs00:1b.0 | grep BridgeCtl
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
                                        ^^^^^^^^^^^

... and this is what vgaarb uses to route vga register access to devices
behind pci bridges.

take care,
  Gerd


