Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96096E9BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:44:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZEt-0002WW-M8; Thu, 20 Apr 2023 14:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppZEh-0002U6-CD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 14:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppZEe-0000WR-8z
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 14:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682016142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0k9LIK9fWvvrWeId5ukFc8EBaRuA/8KOyHUiyNL8ogw=;
 b=ENCvXWuzPl1bFE/YjUwr9OX4oXbb18GmztH89c53k9IOgY1aVHLfVknirxMjfs15J4M/Km
 XjuTwrxGTeBLg/L6r9bIsJbanrD8VTmwe5TxogFgqQwLULVgjfk8OuX13OkYSHDBghDLE1
 WA91/7vmENGv/eziTtxRlTe4awymSn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-mEz9N04QOlShFYNgUI4iEg-1; Thu, 20 Apr 2023 14:42:21 -0400
X-MC-Unique: mEz9N04QOlShFYNgUI4iEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B05185A79C;
 Thu, 20 Apr 2023 18:42:20 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 841C02026D16;
 Thu, 20 Apr 2023 18:42:20 +0000 (UTC)
Date: Thu, 20 Apr 2023 13:42:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] docs/interop: Convert qmp-spec.txt to rST
Message-ID: <a3wgpgu4hmbelttpvyj7ssqe7uluosfarqdejm7xct5vsvphy7@3pgifycirzaq>
References: <20230420150352.1039408-1-peter.maydell@linaro.org>
 <20230420150352.1039408-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420150352.1039408-2-peter.maydell@linaro.org>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Apr 20, 2023 at 04:03:51PM +0100, Peter Maydell wrote:
> Convert the qmp-spec.txt document to restructuredText.
> Notable points about the conversion:
>  * numbers at the start of section headings are removed, to match
>    the style of the rest of the manual
>  * cross-references to other sections or documents are hyperlinked
>  * various formatting tweaks (notably the examples, which need the
>    -> and <- prefixed so the QMP code-block lexer will accept them)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

> +Server Greeting
> +---------------
> +
>  Right when connected the Server will issue a greeting message, which signals
>  that the connection has been successfully established and that the Server is
>  ready for capabilities negotiation (for more information refer to section
> -'4. Capabilities Negotiation').
> +`Capabilities Negotiation`_).
>  
>  The greeting message format is:
>  
> -{ "QMP": { "version": json-object, "capabilities": json-array } }
> +.. code-block::
>  
> - Where,
> +  { "QMP": { "version": json-object, "capabilities": json-array } }
>  
> -- The "version" member contains the Server's version information (the format
> +Where:
> +
> +- The ``version`` member contains the Server's version information (the format
>    is the same of the query-version command)

As long as we're touching this, I think s/the same of the/the same as
for the/ sounds better.
> +Issuing Commands
> +----------------

> +Where:
> +
> +- The ``execute`` or ``exec-oob`` member identifies the command to be
>    executed by the server.  The latter requests out-of-band execution.

Ends in '.'

> -- The "arguments" member is used to pass any arguments required for the
> +- The ``arguments`` member is used to pass any arguments required for the
>    execution of the command, it is optional when no arguments are
>    required. Each command documents what contents will be considered
>    valid when handling the json-argument

does not end in '.' (pre-existing)

> -- The "id" member is a transaction identification associated with the
> +- The ``id`` member is a transaction identification associated with the
>    command execution, it is optional and will be part of the response
> -  if provided.  The "id" member can be any json-value.  A json-number
> +  if provided.  The ``id`` member can be any json-value.  A json-number
>    incremented for each successive command works fine.

ends in '.'.  While here, it might be nice to consistently end in '.'

> +Asynchronous events
> +-------------------
>  
>  As a result of state changes, the Server may send messages unilaterally
>  to the Client at any time, when not in the middle of any other
> @@ -198,44 +208,45 @@ response. They are called "asynchronous events".
>  
>  The format of asynchronous events is:
>  
> -{ "event": json-string, "data": json-object,
> -  "timestamp": { "seconds": json-number, "microseconds": json-number } }
> +.. code-block::
>  
> - Where,
> +  { "event": json-string, "data": json-object,
> +    "timestamp": { "seconds": json-number, "microseconds": json-number } }
>  
> -- The "event" member contains the event's name
> -- The "data" member contains event specific data, which is defined in a
> -  per-event basis, it is optional
> -- The "timestamp" member contains the exact time of when the event
> +Where:
> +
> +- The ``event`` member contains the event's name
> +- The ``data`` member contains event specific data, which is defined in a
> +  per-event basis. It is optional

Pre-patch this was one sentence, not ending in '.'. Post-patch it is
two sentences, but the second still lacks '.';

> +- The ``timestamp`` member contains the exact time of when the event
>    occurred in the Server. It is a fixed json-object with time in
>    seconds and microseconds relative to the Unix Epoch (1 Jan 1970); if
>    there is a failure to retrieve host time, both members of the
>    timestamp will be set to -1.

while this one ends in '.'. Another place where consistency would be nice.

> +Forcing the JSON parser into known-good state
> +---------------------------------------------
>  
>  Incomplete or invalid input can leave the server's JSON parser in a
>  state where it can't parse additional commands.  To get it back into
>  known-good state, the client should provoke a lexical error.
>  
>  The cleanest way to do that is sending an ASCII control character
> -other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
> -line).
> +other than ``\t`` (horizontal tab), ``\r`` (carriage return), or
> +``\n`` (new line).
>  
>  Sadly, older versions of QEMU can fail to flag this as an error.  If a
>  client needs to deal with them, it should send a 0xFF byte.

Do we still care about these older versions of QEMU, or has it been
long enough that we can start trimming this text?  (But that would be
a separate patch).

Overall, this is a nice patch; it looked fairly mechanical (and
produced a hard-to-read diff, but that's not your fault).  Separating
mechanics from content change is good, so I'm fine with:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


