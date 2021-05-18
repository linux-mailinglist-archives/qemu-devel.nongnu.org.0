Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B5387679
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:27:53 +0200 (CEST)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwx6-0001YA-Fr
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwkO-0004lt-S4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwkN-0002az-0v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=So3bhKTdmsGKIKWwln5cfwnYjfU99Kdn0cwhQBXyD4k=;
 b=SgwbhDvOgx8Q7MaTZwnqGux3jJugtDHuUjn5a4wLO4weWV2bDvvT1zfkuIdp5zAMzNUP8z
 HEKUANh28ZcuqoO0FEXrYmn0T2By39z9hZy6INxtdhk88+3k+4k1HlUeBrerfLcWLokWX1
 l+PPghe7Z0G75giurF/2Lkx1dB8CZww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-iG73t3s2PSG803__oAbJLg-1; Tue, 18 May 2021 06:14:40 -0400
X-MC-Unique: iG73t3s2PSG803__oAbJLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4921936B71;
 Tue, 18 May 2021 10:14:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C84221001B2C;
 Tue, 18 May 2021 10:14:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 16DB4180079B; Tue, 18 May 2021 12:14:37 +0200 (CEST)
Date: Tue, 18 May 2021 12:14:37 +0200
From: 'Gerd Hoffmann ' <kraxel@redhat.com>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH v4 1/2] ui/cocoa: capture all keys and combos when mouse
 is grabbed
Message-ID: <20210518101437.oivump7vaamayr5i@sirius.home.kraxel.org>
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
 <20210511185538.29344-2-gustavo@noronha.eti.br>
MIME-Version: 1.0
In-Reply-To: <20210511185538.29344-2-gustavo@noronha.eti.br>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, qemu-devel@nongnu.org,
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 03:55:37PM -0300, gustavo@noronha.eti.br wrote:
> From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> 
> Applications such as Gnome may use Alt-Tab and Super-Tab for different
> purposes, some use Ctrl-arrows so we want to allow qemu to handle
> everything when it captures the mouse/keyboard.
> 
> However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
> at an earlier part of the event handling chain, not letting qemu see it.
> 
> We add a global Event Tap that allows qemu to see all events when the
> mouse is grabbed. Note that this requires additional permissions.
> 
> See:
> 
> https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
> https://support.apple.com/en-in/guide/mac-help/mh32356/mac

Ping.  Reviews from cocoa guys please?

thanks,
  Gerd


