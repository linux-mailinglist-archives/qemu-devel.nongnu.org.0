Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B41E338AF6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:05:41 +0100 (CET)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfbw-000795-L7
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKfaJ-0006N9-OW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKfaG-0007f1-Jl
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615547035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WwrSiQgssTQnUB9/SUeJoVfQGJ/51nbihmH+EfIezpg=;
 b=QrxURUdkxhAHSsrT+jQRcQfJwZ4AeqMwx9rUzRYZ/IqerFt8IoAtsk6EdPKTWLrvt2oPHc
 9Vyzoo4ItXlK5GWtgNAsM1mQ4j50mQJmAgYYC41ioKoCzC5lkno/eDOe6Qa8cL3maK538i
 5KetDpkS301SQ8yhRRRzGsqHk3ZS9+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-BIGNtdMWMPOddS8mGHcyzw-1; Fri, 12 Mar 2021 06:03:52 -0500
X-MC-Unique: BIGNtdMWMPOddS8mGHcyzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B9A78015BD
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 11:03:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 478405C255;
 Fri, 12 Mar 2021 11:03:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 459C718000B4; Fri, 12 Mar 2021 12:03:44 +0100 (CET)
Date: Fri, 12 Mar 2021 12:03:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 14/27] ui: add a D-Bus display backend
Message-ID: <20210312110344.7ssrivw5i72ac6xg@sirius.home.kraxel.org>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312100108.2706195-15-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210312100108.2706195-15-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The "dbus" ui/display backend exports the QEMU consoles over a currently
> unstable D-Bus protocol defined in ui/dbus-display1.xml (it is subject
> to changes at each releases, so only client shipped with the same QEMU
> release will be fully compatible).

Hmm, so we get a new protocol here.

A different idea which crossed my mind after reading the pipewire
article of last weeks lwn.net edition:  pipewire has video support.
It also has audio support.  gnome uses it for remote desktop support,
so support for cursors and mouse/keyboard backchannel should be there
too.

In other words: pipewire should have all the pieces needed to build a
qemu UI with it.

I haven't found the time yet to investigate more, but integrating qemu
with pipewire looks much more attractive to me than inventing a new
protocol ...

take care,
  Gerd


