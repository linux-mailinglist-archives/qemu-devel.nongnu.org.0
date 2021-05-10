Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF7B3780AD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:57:54 +0200 (CEST)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2fh-0003bP-9i
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg2eZ-0002wO-UF
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg2eX-0006PV-8w
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620640600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wr7gEr49JgWcjy0kptHQ279uuy5uzf9FfRPOQWelO0o=;
 b=VDLj+fpQDu2A6Vwfrh9qezTqiXDq3P+kUx139NO1FwmSLnjmobUTzbdoOYqOiTgD0/JO2d
 YMlM5RoBuH8ItSX2EXJ4tdWwJ1flL0OraaTHOlVPYhZyHUWXyOmJDdWdxQKOUg2f5jNEir
 vimaGVNQooUwlZmPeQktQrRi2Wg+NQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-0yqqCkYzOuSZ7H558kOqqQ-1; Mon, 10 May 2021 05:56:36 -0400
X-MC-Unique: 0yqqCkYzOuSZ7H558kOqqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91C7C107ACF3;
 Mon, 10 May 2021 09:56:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D73F7059C;
 Mon, 10 May 2021 09:56:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48E2118000B9; Mon, 10 May 2021 11:56:33 +0200 (CEST)
Date: Mon, 10 May 2021 11:56:33 +0200
From: 'Gerd Hoffmann ' <kraxel@redhat.com>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH v3 1/2] ui/cocoa: capture all keys and combos when mouse
 is grabbed
Message-ID: <20210510095633.dtj4cqniiofhgzwv@sirius.home.kraxel.org>
References: <20210504233232.28423-1-gustavo@noronha.eti.br>
 <20210504233232.28423-2-gustavo@noronha.eti.br>
MIME-Version: 1.0
In-Reply-To: <20210504233232.28423-2-gustavo@noronha.eti.br>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 08:32:31PM -0300, gustavo@noronha.eti.br wrote:
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
> 
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>

Ping.  Any comment from the macos guys on this one?

thanks,
  Gerd


