Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76E6E9C9A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:44:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppaBu-0004cb-HR; Thu, 20 Apr 2023 15:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppaBs-0004cH-Pp
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppaBr-0002KU-2X
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682019813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J891wpmRp0nVQ30x5YKp417FE7sU0yQM1ImIHUcWxkA=;
 b=UGqMpoCVOhlZWRjc6A9Wbd+GP3M2Os5WGONRaAJ3HwO2ESy8oZVyDB7Cg4GFAG4uWol0Ho
 LN0jmmzOz9sbMsZIQjLWb4ilb3rsTpeyol+0by3PQ03iCbasrotjzFWTRCRYDlnxTW9PyH
 E+EtTloAQNHizpCl59G3BV8l+JRs6tY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-ROdsshCiMIqNzgMB36Jo1A-1; Thu, 20 Apr 2023 15:43:30 -0400
X-MC-Unique: ROdsshCiMIqNzgMB36Jo1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB88D38237C4;
 Thu, 20 Apr 2023 19:43:29 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61F702166B33;
 Thu, 20 Apr 2023 19:43:29 +0000 (UTC)
Date: Thu, 20 Apr 2023 14:43:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] docs/interop: Delete qmp-intro.txt
Message-ID: <7dx7hhd5pk5xazhvuadweiirtdhygxapz66kdnoisn67xnycqu@mh7uwlip3er2>
References: <20230420150352.1039408-1-peter.maydell@linaro.org>
 <20230420150352.1039408-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420150352.1039408-3-peter.maydell@linaro.org>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 20, 2023 at 04:03:52PM +0100, Peter Maydell wrote:
> qmp-intro.txt is quite small and provides very little information
> that isn't already in the documentation elsewhere.  Fold the example
> command lines into qemu-options.hx, and delete the now-unneeded plain
> text document.
> 
> While we're touching the qemu-options.hx documentation text,
> wordsmith it a little bit and improve the rST formatting.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/interop/qmp-intro.txt | 88 --------------------------------------
>  qemu-options.hx            | 26 ++++++++---
>  2 files changed, 21 insertions(+), 93 deletions(-)
>  delete mode 100644 docs/interop/qmp-intro.txt

Reviewed-by: Eric Blake <eblake@redhat.com>

>  DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
>      "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
>  SRST
>  ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
> -    Setup monitor on chardev name. ``mode=control`` configures 
> -    a QMP monitor (a JSON RPC-style protocol) and it is not the
> -    same as HMP, the human monitor that has a "(qemu)" prompt.
> +    Set up a monitor connected to the chardev ``name``.
> +    QEMU supports two monitors: the Human Monitor Protocol
> +    (HMP; for human interaction), and the QEMU Monitor Protocol
> +    (QMP; a JSON RPC-style protocol).
> +    The default is HMP; ``mode=control`` selects QMP instead.
>      ``pretty`` is only valid when ``mode=control``, 

Is the pre-existing trailing space on this line important to rST?

>      turning on JSON pretty printing to ease
>      human reading and debugging.
> +
> +    For example::
> +
> +      -chardev socket,id=mon1,host=localhost,port=4444,server=on,wait=off \
> +      -mon chardev=mon1,mode=control,pretty=on
> +
> +    enables the QMP monitor on localhost port 4444 with pretty-printing.
>  ERST
>  
>  DEF("debugcon", HAS_ARG, QEMU_OPTION_debugcon, \
> -- 
> 2.34.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


