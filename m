Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E82ECD92
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:12:14 +0100 (CET)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSH6-0005y9-1X
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSFh-00051r-SC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSFe-0000g7-Ly
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610014239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RIxlvbseJE8KzsocFZe53q7bAlcA8tIDI2c/g5LzLk=;
 b=PVFsss9BzQs50r3oY9CQqfegpzVp5/D+dpjOteEmdPGPXZODz63llXsgoQrnR3WFxs8I7G
 QV4gP85P+i/pdpkFAmBzJcaxQf3LrW4xmqmTubiaWgFYvPazN9fUS6VVw9rTB4eg9UtEPw
 gpsy4sFfKtjRXZUS8ECpQoTXvjlVePk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-7udIUQDGOk2Dow2d4lmr_w-1; Thu, 07 Jan 2021 05:10:38 -0500
X-MC-Unique: 7udIUQDGOk2Dow2d4lmr_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34474801817;
 Thu,  7 Jan 2021 10:10:37 +0000 (UTC)
Received: from starship (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C4D36FA;
 Thu,  7 Jan 2021 10:10:35 +0000 (UTC)
Message-ID: <8dccd0f57799b3221c003c5ea1b0b4ab15091e6a.camel@redhat.com>
Subject: Re: [Bug 1873769] Re: SB16 audio playback freezes emulation in
 Windows 95 guest
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Bug 1873769 <1873769@bugs.launchpad.net>, qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 12:10:34 +0200
In-Reply-To: <160994823135.6821.194745914587589142.malone@chaenomeles.canonical.com>
References: <158737489336.27883.11672421823937229418.malonedeb@gac.canonical.com>
 <160994823135.6821.194745914587589142.malone@chaenomeles.canonical.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-01-06 at 15:50 +0000, Vladislav K. Valtchev wrote:
> P.S.: sorry for the terribly broken lines. I didn't expect launchpad to
> add additional line breaks that way :-(
> 
FYI, since I am into retro gaming with kvm on win98, I ended up using
-device AC97 with old realtek_3_41 win95 (I think) drivers. I didn't play
with win95 though.

I do notice the exact same issue with SB16.

Best regards,
	Maxim Levitsky


