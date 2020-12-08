Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB32D323C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:34:28 +0100 (CET)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhoh-0001Un-PL
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmhNx-0003ua-NP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmhNv-00072b-Mm
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607450806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DGQA/XCrhLPMH5obd4VdDARIFikccA8whnuQTKkhj9s=;
 b=XOA6WwRtI5/MKtp0SHpjGyNz/zP9JBn+98baPXdqorP2T9Q3ODEPCWLP17kBjeAWqltK/v
 7Qqpe9rIJTCfAiRJ/vaPNNmoaGWjG4mlcWvBCxPgGrOjXpBNQhD8V9j2s2cdKHZAdLH1ze
 OzDYsOEQL3vgONlyzILz49yB07DVyRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-jFbp2dlfOiWDXVRWiFl7iw-1; Tue, 08 Dec 2020 13:06:43 -0500
X-MC-Unique: jFbp2dlfOiWDXVRWiFl7iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DE6510A0F76;
 Tue,  8 Dec 2020 18:05:40 +0000 (UTC)
Received: from work-vm (ovpn-114-53.ams2.redhat.com [10.36.114.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D987E10016FF;
 Tue,  8 Dec 2020 18:05:39 +0000 (UTC)
Date: Tue, 8 Dec 2020 18:05:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hmp-commands.hx: List abbreviation after command for
 cont, quit, print
Message-ID: <20201208180537.GB31369@work-vm>
References: <20201121151711.20783-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201121151711.20783-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> We have four HMP commands which have a single-character abbreviated
> version: cont ('c'), quit ('q'), print ('p') and help ('h').  For
> cont, quit and print, we list the abbreviation first in the help
> documentation and the command name.  This has the odd effect that in
> the full 'help' command list these commands end up sorted out of
> alphabetical order (they end up after all the other commands that
> start with the same letter).  As it happens, the only place this
> currently changes the order is for 'cont'.
> 
> Abbreviation first is also not a very logical order, and it doesn't
> match what we use for 'help' (which is 'help|?').  Put the full
> command name first in both the help text and the .name field for
> cont, quit and print.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1614609
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Queued

> ---
>  hmp-commands.hx | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index ff2d7aa8f3e..15a14ed4c7f 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -40,7 +40,7 @@ SRST
>  ERST
>  
>      {
> -        .name       = "q|quit",
> +        .name       = "quit|q",
>          .args_type  = "",
>          .params     = "",
>          .help       = "quit the emulator",
> @@ -48,7 +48,7 @@ ERST
>      },
>  
>  SRST
> -``q`` or ``quit``
> +``quit`` or ``q``
>    Quit the emulator.
>  ERST
>  
> @@ -400,7 +400,7 @@ SRST
>  ERST
>  
>      {
> -        .name       = "c|cont",
> +        .name       = "cont|c",
>          .args_type  = "",
>          .params     = "",
>          .help       = "resume emulation",
> @@ -408,7 +408,7 @@ ERST
>      },
>  
>  SRST
> -``c`` or ``cont``
> +``cont`` or ``c``
>    Resume emulation.
>  ERST
>  
> @@ -553,7 +553,7 @@ SRST
>  ERST
>  
>      {
> -        .name       = "p|print",
> +        .name       = "print|p",
>          .args_type  = "fmt:/,val:l",
>          .params     = "/fmt expr",
>          .help       = "print expression value (use $reg for CPU register access)",
> @@ -561,7 +561,7 @@ ERST
>      },
>  
>  SRST
> -``p`` or ``print/``\ *fmt* *expr*
> +``print`` or ``p/``\ *fmt* *expr*
>    Print expression value. Only the *format* part of *fmt* is
>    used.
>  ERST
> -- 
> 2.20.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


