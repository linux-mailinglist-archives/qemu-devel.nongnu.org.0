Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA851DE48
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 19:19:38 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1c9-0006xG-05
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 13:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nn1aK-0004zW-Tb
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nn1aI-00056s-Hm
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651857461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wz6qnlFP0iR+FpKSAYtCXCAC4jQCB9gvMJkBbV5ug8o=;
 b=b0akpvVGHGRQlrpxurLYp3ShJq4BocsUE6eCXudHCRjM2fY2MbBa/dMi8L94xDjZjIRdno
 PUsvtWhSa702SRYeUbK6SwmcJey44fQBPx4z0DWtq1us8wE3+ODae3G2CAQlyyTaVvkof9
 GV7K///DQZsOzC+t489niKObGLLQvis=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-MQ7pJFZfNhe-QWoXKr4OBw-1; Fri, 06 May 2022 13:17:40 -0400
X-MC-Unique: MQ7pJFZfNhe-QWoXKr4OBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAE002999B55;
 Fri,  6 May 2022 17:17:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D78463ECE;
 Fri,  6 May 2022 17:17:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66F6321E6880; Fri,  6 May 2022 19:17:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH] docs/devel/writing-monitor-commands: Replace obsolete
 STEXI/ETEXI tags
References: <20220506150146.564244-1-thuth@redhat.com>
Date: Fri, 06 May 2022 19:17:38 +0200
In-Reply-To: <20220506150146.564244-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 6 May 2022 17:01:46 +0200")
Message-ID: <871qx6h971.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> STEXI and ETEXI is not used anymore since we switched to Sphinx.
> Replace them in the example with SRST and ERST, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
> index 1693822f8f..4aa2bb904d 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -331,13 +331,10 @@ we should add it to the hmp-commands.hx file::
>          .cmd        = hmp_hello_world,
>      },
>  
> -::
> -
> - STEXI
> - @item hello_world @var{message}
> - @findex hello_world
> - Print message to the standard output
> - ETEXI
> + SRST
> + ``hello_world`` *message*
> +   Print message to the standard output
> + ERST
>  
>  To test this you have to open a user monitor and issue the "hello-world"
>  command. It might be instructive to check the command's documentation with

Reviewed-by: Markus Armbruster <armbru@redhat.com>


