Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251D372800
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:19:48 +0200 (CEST)
Received: from localhost ([::1]:59022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrDX-00017Y-Kq
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldrBQ-00086Z-Nk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldrBO-0002Hn-OB
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620119853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zn6glOY2K8K3nhBD/btaEtjHz7MH5Qif4bMII+WxK7c=;
 b=Dc64kiGNazay//5ATMunK3uOaRzMx/othy5ICpdyn3BUpeSB5EcR+s+UbW7sxPVVXd64Mc
 Gm4wE6MVj2HygJt8Rhe6Nosl4dEmVibmlmIyyBZ3G0a8bDIBwP3tPwZ0sndKdja4uIDyGa
 ElehbTiPqKLTJiP+cPTeWl3fJsEFw7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-jH7unpXlNLaK0JT7WEPXIA-1; Tue, 04 May 2021 05:17:31 -0400
X-MC-Unique: jH7unpXlNLaK0JT7WEPXIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6844D801F98;
 Tue,  4 May 2021 09:17:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25D3F1064146;
 Tue,  4 May 2021 09:17:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C87E1800383; Tue,  4 May 2021 11:17:28 +0200 (CEST)
Date: Tue, 4 May 2021 11:17:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rainer =?utf-8?Q?M=C3=BCller?= <raimue@codingfarm.de>
Subject: Re: [PATCH 2/2] input-linux: Allow to toggle grab from QMP
Message-ID: <20210504091728.hr76cl7ou4od3xbk@sirius.home.kraxel.org>
References: <20210501190622.153901-1-raimue@codingfarm.de>
 <20210501190622.153901-3-raimue@codingfarm.de>
MIME-Version: 1.0
In-Reply-To: <20210501190622.153901-3-raimue@codingfarm.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> @@ -488,6 +488,8 @@
>  #
>  # @repeat: enables auto-repeat events (default: false)
>  #
> +# @grab-active: if true, device is grabbed (default: true)
> +#
>  # @grab-toggle: the key or key combination that toggles device grab
>  #               (default: ctrl-ctrl)
>  #

Can grab-active be added at the end of the list please?

Also add a "(Since: 6.1)" note as this will most likely be available in
version 6.1 & newer.

Otherwise the patch looks sane.

thanks,
  Gerd


