Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C72FE7C4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:39:25 +0100 (CET)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XN6-0004Eu-Vo
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2XMM-0003mc-AU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2XMK-0001yM-NQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611225516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ddCQJcK2rVPOd6Dd1/msKCX03ubR5wAtUfY3xh+HQ1E=;
 b=CRdgunrsRGVDzH/+dGI92n5FZdKYjCL78dpO9N52iGP62MFXiiQeWPWfGKtDBSSwqjUxpN
 Fi09nZIxotYZ5gfl6x+Kzo6y3Lg5mwyYIlsjUAEPTNgivXTuM5o1zrMKkkuLevomsDZZvh
 eiXE8er+BYOwWFzpB9hsN+DkcC06xME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-NG8m6Ze_MjyfTWKEUWWU6A-1; Thu, 21 Jan 2021 05:38:34 -0500
X-MC-Unique: NG8m6Ze_MjyfTWKEUWWU6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D4D4801817
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:38:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC0619C46;
 Thu, 21 Jan 2021 10:38:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A8C6518000A0; Thu, 21 Jan 2021 11:38:31 +0100 (CET)
Date: Thu, 21 Jan 2021 11:38:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] vnc: remove "change vnc TARGET" and QMP change
 command, support "-vnc help"
Message-ID: <20210121103831.pb22ib52z5g5onjq@sirius.home.kraxel.org>
References: <20210120144235.345983-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120144235.345983-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 03:42:32PM +0100, Paolo Bonzini wrote:
> The real driver for these patches is to send all QemuOpts user input
> to qemu_opts_parse_noisily, for consistency in the command line
> parsing code and to effectively outlaw "help" and "?" QemuOpts
> suboptions.  vnc_parse is the only function that is still using
> qemu_opts_parse.

Should we maybe move vnc to qapi cmd line parsing instead?

> In order to remove the non-command-line callers of vnc_parse,
> I am removing the deprecated QMP change command but also its HMP
> veneer "change vnc TARGET", whose usecase is somewhat unclear to
> me.

Hmm.  It's been a few years ...

IIRC back when this was added the main use case was having a way to
enable/disable the vnc server.  Not sure this is still needed/useful.
These days you can effectively disable vnc access by expiring the
password (or not setting one in the first place) without re-configuring
the vnc server.  Also the race where qemu allowed passwordless connects
between start and password being set via monitor is long gone.

So, all in all I feel a bit uncomfortable dropping this without the
usual deprecation period.  No strong objections though.

take care,
  Gerd


