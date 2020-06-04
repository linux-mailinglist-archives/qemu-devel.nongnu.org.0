Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D261EE304
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 13:11:32 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgnmV-0003Dh-MG
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 07:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jgnlj-0002gS-PU
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 07:10:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35062
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jgnli-000614-1M
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 07:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591269040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHT70FwhHDLatJx7O3g6sHgcjxZvK8RJEyQ4DhaHjvU=;
 b=CTpGi+OJ3r88VO0TfRR93PrFsd5m8VjzlFGJiBCeqm8nD6W8QKzydkJT0/OxjQklWvNMmO
 Yhc9TOqmmEASL2PJnVN3kFrASRZQ88oHpnszYwmcOYVXfVSAx0yE7JQTDLdaI5FiFOPRTl
 X03OJbnRdEyTJ8xt2oQ3DcmmpU2+u04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-ruAjtrIVNxeazf_nhZp1lw-1; Thu, 04 Jun 2020 07:10:37 -0400
X-MC-Unique: ruAjtrIVNxeazf_nhZp1lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62CF41883616
 for <qemu-devel@nongnu.org>; Thu,  4 Jun 2020 11:10:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE2435D9CD;
 Thu,  4 Jun 2020 11:10:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F3DF116E16; Thu,  4 Jun 2020 13:10:28 +0200 (CEST)
Date: Thu, 4 Jun 2020 13:10:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/2] build qxl as module
Message-ID: <20200604111028.llioabphgpgjxgx4@sirius.home.kraxel.org>
References: <20200604075943.7001-1-kraxel@redhat.com>
 <20200604084820.GC3050580@redhat.com>
 <20200604091857.ibu36f7ynjk75eel@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200604091857.ibu36f7ynjk75eel@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:14:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Other candidates:
>   * virtio-gpu (libvirglrenderer.so).
>   * ccid-card-emulated (libcacard.so).

 * usb-redir (libusbredir.so)
 * usb-host (libusb.so)

usb-host also has a monitor command ("info usbhost").  This uses libusb
too so leaving that in core qemu would be pointless.  So for that one
we'll also need some way for modules to dynamically register monitor
commands.

cheers,
  Gerd


