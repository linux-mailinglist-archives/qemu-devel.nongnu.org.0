Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A2396CB1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:11:57 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnwh2-00036d-9P
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lnwgH-0002Hg-2a
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lnwgA-00085X-SH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622524260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XN4zQl2j+2AFxyvOGHKMSewWMfDMaTV7vNrfGfLuZI0=;
 b=c2xLB7vLAWq+gaM+RlKnJgCKRFZSKNWnPmJZbc+3tsI/4kZKPQcbzCuAC0wouQtRtWwTQc
 tFUZG0GUZpMb9+QuSju+XyOyrgxvJpO6c+08ABRanKEDCfe5faPezccWFFQNUYK3CdQjdz
 TBRHUXSYqvaGPBx5KWLl59wiQCtU3UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-cJoYj1MmMU6WX-RO--GnSQ-1; Tue, 01 Jun 2021 01:10:58 -0400
X-MC-Unique: cJoYj1MmMU6WX-RO--GnSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C237801B13;
 Tue,  1 Jun 2021 05:10:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D98E690EF;
 Tue,  1 Jun 2021 05:10:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A5A5818000A0; Tue,  1 Jun 2021 07:10:55 +0200 (CEST)
Date: Tue, 1 Jun 2021 07:10:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: email@aabouzied.com
Subject: Re: [PATCH] Add display suboptions to man pages
Message-ID: <20210601051055.xbqfoaz2kot4p4bi@sirius.home.kraxel.org>
References: <20210601014312.17981-1-email@aabouzied.com>
MIME-Version: 1.0
In-Reply-To: <20210601014312.17981-1-email@aabouzied.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

>  SRST
>  ``-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=initiator]``
> -  \ 
> +  \

Seems some unrelated (whitespace?) changes sneaked in.

> @@ -1819,11 +1819,22 @@ SRST
>      old style -sdl/-curses/... options. Use ``-display help`` to list
>      the available display types. Valid values for type are
>  
> -    ``sdl``
> +    ``spice-app[,gl=on|off]``
> +        Start QEMU as a Spice server and launch the default Spice client
> +        application. The Spice server will redirect the serial consoles
> +        and QEMU monitors. (Since 4.0)
> +
> +    ``sdl[,alt_grab=on|off][,ctrl_grab=on|off][,window_close=on|off][,gl=on|core|es|off]``
> +
>          Display video output via SDL (usually in a separate graphics
>          window; see the SDL documentation for other possibilities).

alt-grab and ctrl-grab are deprecated and should not be added here.
please use dash not underscore (i.e. "window-close") here and elsewhere.

> +    ``vnc=<display>[,<optarges>]``
> +        Start a VNC server on display <arg>

No.  Works for compatibility reasons, but vnc has its own "-vnc" switch
which should be used instead.

> -ERST
> +    ERST

I think indenting this breaks the scripts processing the file ...

>  ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
> -    Setup monitor on chardev name. ``mode=control`` configures 
> +    Setup monitor on chardev name. ``mode=control`` configures

More unrelated changes ...

take care,
  Gerd


