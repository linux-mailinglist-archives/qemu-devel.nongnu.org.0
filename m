Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD023A1546
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:17:16 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqy55-0005tX-Bk
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqy48-0004dn-4I
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqy45-0004MM-Ea
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623244572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BPTiaTVeu9de4cgcKvx2tThklRAc+Q4gE9ah2bMnm18=;
 b=KoUnEOwoODB2TrAGoR626gSQy5J81eaMK0a7gSXnvq0x+8m7h+jpKKkeHzsjKOk67HeoCz
 YrS4IFUggiHBFZmvTPEF3/0STSWTPOK1x2Mu7+82p8q65c57tVpf4+dETOewOhdU85oCoB
 5Rs1m3WItyuRdd7nNDj33JHWnXlqG8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-BizF2LwIN4yNt69Oh8tTSw-1; Wed, 09 Jun 2021 09:16:11 -0400
X-MC-Unique: BizF2LwIN4yNt69Oh8tTSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 322221850610
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 13:16:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 430EC5D9C6;
 Wed,  9 Jun 2021 13:16:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9D6D113865F; Wed,  9 Jun 2021 15:16:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
References: <20210609100240.1285032-1-thuth@redhat.com>
Date: Wed, 09 Jun 2021 15:16:01 +0200
In-Reply-To: <20210609100240.1285032-1-thuth@redhat.com> (Thomas Huth's
 message of "Wed, 9 Jun 2021 12:02:40 +0200")
Message-ID: <8735trmb5a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: libvir-list@redhat.com, smitterl@redhat.com, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> Libvirt's "domcapabilities" command has a way to state whether
> certain graphic frontends are available in QEMU or not. Originally,
> libvirt looked at the "--help" output of the QEMU binary to determine
> whether SDL was available or not (by looking for the "-sdl" parameter
> in the help text), but since libvirt stopped doing this analysis of
> the help text, the detection of SDL is currently broken, see:
>
>  https://bugzilla.redhat.com/show_bug.cgi?id=1790902
>
> QEMU should provide a way via the QMP interface instead. The simplest
> way, without introducing additional commands, is to make the DisplayType
> enum entries conditional, so that the enum only contains the entries if
> the corresponding CONFIG_xxx switches have been set. Unfortunately, this
> only works for sdl, cocoa and spice, since gtk, egl-headless and curses
> are hard-wired in the "data" section of the DisplayOptions, and thus
> unfortunately always have to be defined.

Here:

    { 'union'   : 'DisplayOptions',
      'base'    : { 'type'           : 'DisplayType',
                    '*full-screen'   : 'bool',
                    '*window-close'  : 'bool',
                    '*show-cursor'   : 'bool',
                    '*gl'            : 'DisplayGLMode' },
      'discriminator' : 'type',
      'data'    : { 'gtk'            : 'DisplayGTK',
                    'curses'         : 'DisplayCurses',
                    'egl-headless'   : 'DisplayEGLHeadless'} }

Flat union branches can be made conditional like so:

      'data'    : { 'gtk'            : { 'type': 'DisplayGTK',
                                         'if': 'defined(CONFIG_GTK)' },

Then you should be able to make the corresponding enum value
conditional, too.


