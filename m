Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB50702CD3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:36:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXRD-0002o5-2Q; Mon, 15 May 2023 08:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyXRA-0002en-2b
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyXR6-0003yp-Su
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2uUBODiAVIkeBPehT+9dKNstPl56yllI0FEzR8WXB4=;
 b=LjMg8wFDEAQZ+jMN2mDtuUmSAVESIQujTy/Sc9eYzAbxbaIcWVtsLY+51s8ndlDG2TTxfr
 pKaxcEelRs4xotc7QWrQd4j4ELsdgBmvhF3+zAhGYMepc03krlvMj0ihSJol9LigbzPtq9
 jEbb29YIUFD95BUMLz+kGkkZdOpES0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-okmNUHwdNamyhuwtx7kNrQ-1; Mon, 15 May 2023 08:36:17 -0400
X-MC-Unique: okmNUHwdNamyhuwtx7kNrQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E51293C397CB;
 Mon, 15 May 2023 12:36:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADCC492B01;
 Mon, 15 May 2023 12:36:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CAE221E681C; Mon, 15 May 2023 14:36:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 1/2] docs/interop: Convert qmp-spec.txt to rST
References: <20230511121553.3356127-1-peter.maydell@linaro.org>
 <20230511121553.3356127-2-peter.maydell@linaro.org>
Date: Mon, 15 May 2023 14:36:15 +0200
In-Reply-To: <20230511121553.3356127-2-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 11 May 2023 13:15:52 +0100")
Message-ID: <87353xydog.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

Peter Maydell <peter.maydell@linaro.org> writes:

> Convert the qmp-spec.txt document to restructuredText.
> Notable points about the conversion:
>  * numbers at the start of section headings are removed, to match
>    the style of the rest of the manual
>  * cross-references to other sections or documents are hyperlinked

You also add new references to QMP and QGA reference manuals.
Thoughtful!

>  * various formatting tweaks (notably the examples, which need the
>    -> and <- prefixed so the QMP code-block lexer will accept them)

You could add

   * English prose fixed in a few places.

Appreciated!

> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: minor tweaks per Eric's review
>  * consistently use '.' at end of sentences in Where: lists
>  * s/the same of the/the same as for the/
> ---
>  docs/interop/index.rst                      |   1 +
>  docs/interop/{qmp-spec.txt => qmp-spec.rst} | 337 +++++++++++---------
>  2 files changed, 186 insertions(+), 152 deletions(-)
>  rename docs/interop/{qmp-spec.txt => qmp-spec.rst} (55%)

Leaves a few dangling references:

    $ git-grep -F qmp-spec.txt

    docs/devel/qapi-code-gen.rst:See qmp-spec.txt for out-of-band execution syntax and semantics.
    python/qemu/qmp/models.py:    Defined in qmp-spec.txt, section 2.2, "Server Greeting".
    python/qemu/qmp/models.py:    Defined in qmp-spec.txt, section 2.2, "Server Greeting".
    python/qemu/qmp/models.py:    Defined in qmp-spec.txt, section 2.4.2, "error".
    python/qemu/qmp/models.py:    Defined in qmp-spec.txt, section 2.4.2, "error".
    python/qemu/qmp/qmp_client.py:            # See "NOTE" in qmp-spec.txt, section 2.4.2
    python/qemu/qmp/qmp_client.py:        # qmp-spec.txt, section 2.4:
    qapi/control.json:#     docs/interop/qmp-spec.txt)
    qapi/control.json:#     qmp-spec.txt for more information on OOB)
    qapi/qapi-schema.json:# Please, refer to the QMP specification (docs/interop/qmp-spec.txt)
    qobject/json-lexer.c:         * state; see docs/interop/qmp-spec.txt.

Easy enough to fix up.

> diff --git a/docs/interop/index.rst b/docs/interop/index.rst
> index 6351ff9ba6e..ed65395bfb2 100644
> --- a/docs/interop/index.rst
> +++ b/docs/interop/index.rst
> @@ -15,6 +15,7 @@ are useful for making QEMU interoperate with other software.
>     dbus-display
>     live-block-operations
>     pr-helper
> +   qmp-spec
>     qemu-ga
>     qemu-ga-ref
>     qemu-qmp-ref
> diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.rst
> similarity index 55%
> rename from docs/interop/qmp-spec.txt
> rename to docs/interop/qmp-spec.rst
> index b0e8351d5b2..bfad570a160 100644
> --- a/docs/interop/qmp-spec.txt
> +++ b/docs/interop/qmp-spec.rst
> @@ -1,24 +1,26 @@
> -                      QEMU Machine Protocol Specification
> +..
> +    Copyright (C) 2009-2016 Red Hat, Inc.
>  
> -0. About This Document
> -======================
> +    This work is licensed under the terms of the GNU GPL, version 2 or
> +    later. See the COPYING file in the top-level directory.
>  
> -Copyright (C) 2009-2016 Red Hat, Inc.
>  
> -This work is licensed under the terms of the GNU GPL, version 2 or
> -later. See the COPYING file in the top-level directory.
> +===================================
> +QEMU Machine Protocol Specification
> +===================================
>  
> -1. Introduction
> -===============
> -
> -This document specifies the QEMU Machine Protocol (QMP), a JSON-based
> +The QEMU Machine Protocol (QMP) is a JSON-based
>  protocol which is available for applications to operate QEMU at the
>  machine-level.  It is also in use by the QEMU Guest Agent (QGA), which
>  is available for host applications to interact with the guest
> -operating system.
> +operating system. This page specifies the general format of
> +the protocol; details of the commands and data structures can
> +be found in the :doc:`qemu-qmp-ref` and the :doc:`qemu-ga-ref`.
>  
> -2. Protocol Specification
> -=========================
> +.. contents::
> +
> +Protocol Specification
> +======================
>  
>  This section details the protocol format. For the purpose of this
>  document, "Server" is either QEMU or the QEMU Guest Agent, and
> @@ -30,9 +32,7 @@ following format:
>      json-DATA-STRUCTURE-NAME
>  
>  Where DATA-STRUCTURE-NAME is any valid JSON data structure, as defined
> -by the JSON standard:
> -
> -http://www.ietf.org/rfc/rfc8259.txt
> +by the `JSON standard <http://www.ietf.org/rfc/rfc8259.txt>`_.
>  
>  The server expects its input to be encoded in UTF-8, and sends its
>  output encoded in ASCII.
> @@ -45,83 +45,89 @@ important unless specifically documented otherwise.  Repeating a key
>  within a json-object gives unpredictable results.
>  
>  Also for convenience, the server will accept an extension of
> -'single-quoted' strings in place of the usual "double-quoted"
> +``'single-quoted'`` strings in place of the usual ``"double-quoted"``
>  json-string, and both input forms of strings understand an additional
> -escape sequence of "\'" for a single quote. The server will only use
> +escape sequence of ``\'`` for a single quote. The server will only use

Pre-patch plain text "\'" becomes just \' in HTML output, but rendered
as code, i.e. in a fixed-width font.  I'd prefer to retain the quotation
marks, like ``"\'"``, just like in JSON RFC 8259, but then plain text
output becomes ""\'"".

Likewise, ``'single-quoted'`` and ``"double-quoted"`` produce
"'single-quoted'" and ""double-quoted"" in plain text output.

Can't win.

git-grep '``"' docs/ shows preexisting instances.

More of the same below, not flagging again.  No use fighting the tool.

>  double quoting on output.
>  
> -2.1 General Definitions
> ------------------------
> -
> -2.1.1 All interactions transmitted by the Server are json-objects, always
> -      terminating with CRLF
> -
> -2.1.2 All json-objects members are mandatory when not specified otherwise
> -
> -2.2 Server Greeting
> +General Definitions
>  -------------------
>  
> +All interactions transmitted by the Server are json-objects, always
> +terminating with CRLF.
> +
> +All json-objects members are mandatory when not specified otherwise.
> +
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
>
> -  is the same of the query-version command)
> -- The "capabilities" member specify the availability of features beyond the
> +Where:
> +
> +- The ``version`` member contains the Server's version information (the format
> +  is the same as for the query-version command).
> +- The ``capabilities`` member specifies the availability of features beyond the
>    baseline specification; the order of elements in this array has no
>    particular significance.
>  
> -2.2.1 Capabilities
> -------------------
> +Capabilities
> +------------
>  
>  Currently supported capabilities are:
>  
> -- "oob": the QMP server supports "out-of-band" (OOB) command
> -  execution, as described in section "2.3.1 Out-of-band execution".
> +``oob``
> +  the QMP server supports "out-of-band" (OOB) command
> +  execution, as described in section `Out-of-band execution`_.
>  
> -2.3 Issuing Commands
> ---------------------
> +Issuing Commands
> +----------------
>  
>  The format for command execution is:
>  
> -{ "execute": json-string, "arguments": json-object, "id": json-value }
> +.. code-block::
> +
> +  { "execute": json-string, "arguments": json-object, "id": json-value }
>  
>  or
>  
> -{ "exec-oob": json-string, "arguments": json-object, "id": json-value }
> +.. code-block::
>  
> - Where,
> +  { "exec-oob": json-string, "arguments": json-object, "id": json-value }
>  
> -- The "execute" or "exec-oob" member identifies the command to be
> +Where:
> +
> +- The ``execute`` or ``exec-oob`` member identifies the command to be
>    executed by the server.  The latter requests out-of-band execution.
> -- The "arguments" member is used to pass any arguments required for the
> +- The ``arguments`` member is used to pass any arguments required for the
>    execution of the command, it is optional when no arguments are
>    required. Each command documents what contents will be considered
> -  valid when handling the json-argument
> -- The "id" member is a transaction identification associated with the
> +  valid when handling the json-argument.
> +- The ``id`` member is a transaction identification associated with the
>    command execution, it is optional and will be part of the response
> -  if provided.  The "id" member can be any json-value.  A json-number
> +  if provided.  The ``id`` member can be any json-value.  A json-number
>    incremented for each successive command works fine.
>  
> -The actual commands are documented in the QEMU QMP reference manual
> -docs/interop/qemu-qmp-ref.{7,html,info,pdf,txt}.
> +The actual commands are documented in the :doc:`qemu-qmp-ref`.
>  
> -2.3.1 Out-of-band execution
> ----------------------------
> +Out-of-band execution
> +---------------------
>  
>  The server normally reads, executes and responds to one command after
>  the other.  The client therefore receives command responses in issue
>  order.
>  
> -With out-of-band execution enabled via capability negotiation (section
> -4.), the server reads and queues commands as they arrive.  It executes
> +With out-of-band execution enabled via `capabilities negotiation`_,
> +the server reads and queues commands as they arrive.  It executes
>  commands from the queue one after the other.  Commands executed
>  out-of-band jump the queue: the command get executed right away,
>  possibly overtaking prior in-band commands.  The client may therefore
> @@ -129,8 +135,8 @@ receive such a command's response before responses from prior in-band
>  commands.
>  
>  To be able to match responses back to their commands, the client needs
> -to pass "id" with out-of-band commands.  Passing it with all commands
> -is recommended for clients that accept capability "oob".
> +to pass ``id`` with out-of-band commands.  Passing it with all commands
> +is recommended for clients that accept capability ``oob``.
>  
>  If the client sends in-band commands faster than the server can
>  execute them, the server will stop reading requests until the request
> @@ -140,57 +146,61 @@ To ensure commands to be executed out-of-band get read and executed,
>  the client should have at most eight in-band commands in flight.
>  
>  Only a few commands support out-of-band execution.  The ones that do
> -have "allow-oob": true in output of query-qmp-schema.
> +have ``"allow-oob": true`` in the output of ``query-qmp-schema``.
>  
> -2.4 Commands Responses
> -----------------------
> +Commands Responses
> +------------------
>  
>  There are two possible responses which the Server will issue as the result
>  of a command execution: success or error.
>  
> -As long as the commands were issued with a proper "id" field, then the
> -same "id" field will be attached in the corresponding response message
> +As long as the commands were issued with a proper ``id`` field, then the
> +same ``id`` field will be attached in the corresponding response message
>  so that requests and responses can match.  Clients should drop all the
> -responses that have an unknown "id" field.
> +responses that have an unknown ``id`` field.
>  
> -2.4.1 success
> --------------
> +Success
> +-------
>  
>  The format of a success response is:
>  
> -{ "return": json-value, "id": json-value }
> +.. code-block::
>  
> - Where,
> +  { "return": json-value, "id": json-value }
>  
> -- The "return" member contains the data returned by the command, which
> +Where:
> +
> +- The ``return`` member contains the data returned by the command, which
>    is defined on a per-command basis (usually a json-object or
>    json-array of json-objects, but sometimes a json-number, json-string,
>    or json-array of json-strings); it is an empty json-object if the
> -  command does not return data
> -- The "id" member contains the transaction identification associated
> -  with the command execution if issued by the Client
> +  command does not return data.
> +- The ``id`` member contains the transaction identification associated
> +  with the command execution if issued by the Client.
>  
> -2.4.2 error
> ------------
> +Error
> +-----
>  
>  The format of an error response is:
>  
> -{ "error": { "class": json-string, "desc": json-string }, "id": json-value }
> +.. code-block::
>  
> - Where,
> +  { "error": { "class": json-string, "desc": json-string }, "id": json-value }
>  
> -- The "class" member contains the error class name (eg. "GenericError")
> -- The "desc" member is a human-readable error message. Clients should
> +Where:
> +
> +- The ``class`` member contains the error class name (eg. ``"GenericError"``).
> +- The ``desc`` member is a human-readable error message. Clients should
>    not attempt to parse this message.
> -- The "id" member contains the transaction identification associated with
> -  the command execution if issued by the Client
> +- The ``id`` member contains the transaction identification associated with
> +  the command execution if issued by the Client.
>  
> -NOTE: Some errors can occur before the Server is able to read the "id" member,
> -in these cases the "id" member will not be part of the error response, even
> +NOTE: Some errors can occur before the Server is able to read the ``id`` member;
> +in these cases the ``id`` member will not be part of the error response, even
>  if provided by the client.
>  
> -2.5 Asynchronous events
> ------------------------
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
> +- The ``event`` member contains the event's name.
> +- The ``data`` member contains event specific data, which is defined in a
> +  per-event basis. It is optional.
> +- The ``timestamp`` member contains the exact time of when the event
>    occurred in the Server. It is a fixed json-object with time in
>    seconds and microseconds relative to the Unix Epoch (1 Jan 1970); if
>    there is a failure to retrieve host time, both members of the
>    timestamp will be set to -1.
>  
> -The actual asynchronous events are documented in the QEMU QMP
> -reference manual docs/interop/qemu-qmp-ref.{7,html,info,pdf,txt}.
> +The actual asynchronous events are documented in the :doc:`qemu-qmp-ref`.
>  
>  Some events are rate-limited to at most one per second.  If additional
>  "similar" events arrive within one second, all but the last one are
>  dropped, and the last one is delayed.  "Similar" normally means same
>  event type.
>  
> -2.6 Forcing the JSON parser into known-good state
> --------------------------------------------------
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
>  
> -2.7 QGA Synchronization
> ------------------------
> +QGA Synchronization
> +-------------------
>  
>  When a client connects to QGA over a transport lacking proper
>  connection semantics such as virtio-serial, QGA may have read partial
> @@ -243,86 +254,106 @@ input from a previous client.  The client needs to force QGA's parser
>  into known-good state using the previous section's technique.
>  Moreover, the client may receive output a previous client didn't read.
>  To help with skipping that output, QGA provides the
> -'guest-sync-delimited' command.  Refer to its documentation for
> +``guest-sync-delimited`` command.  Refer to its documentation for
>  details.
>  
>  
> -3. QMP Examples
> -===============
> +QMP Examples
> +============
>  
>  This section provides some examples of real QMP usage, in all of them
> -"C" stands for "Client" and "S" stands for "Server".
> +``->`` marks text sent by the Client and ``<-`` marks replies by the Server.
>  
> -3.1 Server greeting
> --------------------
> +.. admonition:: Example
>  
> -S: { "QMP": {"version": {"qemu": {"micro": 0, "minor": 0, "major": 3},
> -     "package": "v3.0.0"}, "capabilities": ["oob"] } }
> +  Server greeting
>  
> -3.2 Capabilities negotiation
> -----------------------------
> +  .. code-block:: QMP
>  
> -C: { "execute": "qmp_capabilities", "arguments": { "enable": ["oob"] } }
> -S: { "return": {}}
> +    <- { "QMP": {"version": {"qemu": {"micro": 0, "minor": 0, "major": 3},
> +         "package": "v3.0.0"}, "capabilities": ["oob"] } }

Opportunity to adjust the spacing to match what the server actually
sends:

       <- {"QMP": {"version": {"qemu": {"micro": 0, "minor": 0, "major": 3},
           "package": "v3.0.0"}, "capabilities": ["oob"]}}

May want to adjust spacing in input as well for a more consistent look.

Suggestion, not demand.

>  
> -3.3 Simple 'stop' execution
> ----------------------------
> +.. admonition:: Example
>  
> -C: { "execute": "stop" }
> -S: { "return": {} }
> +  Capabilities negotiation
>  
> -3.4 KVM information
> --------------------
> +  .. code-block:: QMP
>  
> -C: { "execute": "query-kvm", "id": "example" }
> -S: { "return": { "enabled": true, "present": true }, "id": "example"}
> +    -> { "execute": "qmp_capabilities", "arguments": { "enable": ["oob"] } }
> +    <- { "return": {}}

Actual response is

          {"return": {}}

>  
> -3.5 Parsing error
> -------------------
> +.. admonition:: Example
>  
> -C: { "execute": }
> -S: { "error": { "class": "GenericError", "desc": "Invalid JSON syntax" } }
> +  Simple 'stop' execution
>  
> -3.6 Powerdown event
> --------------------
> +  .. code-block:: QMP
>  
> -S: { "timestamp": { "seconds": 1258551470, "microseconds": 802384 },
> -    "event": "POWERDOWN" }
> +    -> { "execute": "stop" }
> +    <- { "return": {} }

Likewise.

>  
> -3.7 Out-of-band execution
> --------------------------
> +.. admonition:: Example
>  
> -C: { "exec-oob": "migrate-pause", "id": 42 }
> -S: { "id": 42,
> -     "error": { "class": "GenericError",
> -      "desc": "migrate-pause is currently only supported during postcopy-active state" } }
> +  KVM information
> +
> +  .. code-block:: QMP
> +
> +    -> { "execute": "query-kvm", "id": "example" }
> +    <- { "return": { "enabled": true, "present": true }, "id": "example"}

Actual response is

          {"return": {"enabled": true, "present": true}, "id": "example"}

> +
> +.. admonition:: Example
> +
> +  Parsing error
> +
> +  .. code-block:: QMP
> +
> +    -> { "execute": }
> +    <- { "error": { "class": "GenericError", "desc": "Invalid JSON syntax" } }

This error changed long ago (I believe).  Actual response is

          {"error": {"class": "GenericError", "desc": "JSON parse error, expecting value"}}

Please update this one even if you decide to leave the spacing as is.

> +
> +.. admonition:: Example
> +
> +  Powerdown event
> +
> +  .. code-block:: QMP
> +
> +    <- { "timestamp": { "seconds": 1258551470, "microseconds": 802384 },
> +        "event": "POWERDOWN" }

Actual event looks like

          {"timestamp": {"seconds": 1258551470, "microseconds": 802384}, "event": "POWERDOWN"}


> +
> +.. admonition:: Example
> +
> +  Out-of-band execution
> +
> +  .. code-block:: QMP
> +
> +    -> { "exec-oob": "migrate-pause", "id": 42 }
> +    <- { "id": 42,
> +         "error": { "class": "GenericError",
> +          "desc": "migrate-pause is currently only supported during postcopy-active state" } }

Actual response is

          {"id": 42, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}

[...]


