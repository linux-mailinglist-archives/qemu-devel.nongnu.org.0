Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4949CC4D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:28:17 +0100 (CET)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjHV-0002dI-2k
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCjEK-0000vr-8B
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCjEH-00081d-9s
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643207096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wn/rbzco1KlTwJwyTDUSbVBa8fERopHCVMZJYHt3ta8=;
 b=UPX3nN7LzHfmHsqm/ji5xzl1Snis4O/6qgpUa1GR+GormP4lgpTLYJdFTduLdxXMIQ7Jra
 54F5JgkvZgStCTqgiLJeG4ehanHz/QYkUDUFJH5F+Tb71Ensg5Gr4IBSbMjQl57ZsPn0PP
 VhVwmgLjyBPo1l57L+uHtPiRGCg5TK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-4l75W19JNGiA-FbZroiovw-1; Wed, 26 Jan 2022 09:24:52 -0500
X-MC-Unique: 4l75W19JNGiA-FbZroiovw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5441091DA0;
 Wed, 26 Jan 2022 14:24:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9C67108F84F;
 Wed, 26 Jan 2022 14:24:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D8D8113864A; Wed, 26 Jan 2022 15:24:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 5/7] docs/qapi-code-gen: update to cover trace events
 code generation
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-6-vsementsov@virtuozzo.com>
Date: Wed, 26 Jan 2022 15:24:38 +0100
In-Reply-To: <20220125215655.3111881-6-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Jan 2022 22:56:53 +0100")
Message-ID: <877damtw0p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Previous commits enabled trace events generation for most of QAPI
> generated code (except for tests/ and qga/). Let's update documentation
> to illustrate it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/qapi-code-gen.rst | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index feafed79b5..a3430740bd 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -1619,7 +1619,10 @@ Code generated for commands
>  
>  These are the marshaling/dispatch functions for the commands defined
>  in the schema.  The generated code provides qmp_marshal_COMMAND(), and
> -declares qmp_COMMAND() that the user must implement.
> +declares qmp_COMMAND() that the user must implement.  The generated code
> +contains trace events code.  Corresponding .trace-events file with list
> +of trace events is generated too, and should be parsed by trace generator
> +later to generate trace event code, see `tracing <tracing.html>`.

I think references look like :ref:`tracing`.

The last sentence is kind of redundant with the text added in the next
hunk.  Drop both new sentences?

>  
>  The following files are generated:
>  
> @@ -1630,6 +1633,9 @@ The following files are generated:
>   ``$(prefix)qapi-commands.h``
>       Function prototypes for the QMP commands specified in the schema
>  
> + ``$(prefix)qapi-commands.trace-events``
> +     Trace events file for trace generator, see `tracing <tracing.html>`.

Suggest

        Trace event declarations, see :ref:`tracing`.

> +
>   ``$(prefix)qapi-init-commands.h``
>       Command initialization prototype
>  
> @@ -1689,14 +1695,27 @@ Example::
>              goto out;
>          }
>  
> +        if (trace_event_get_state_backends(TRACE_QMP_ENTER_MY_COMMAND)) {
> +            g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
> +
> +            trace_qmp_enter_my_command(req_json->str);
> +        }
> +
>          retval = qmp_my_command(arg.arg1, &err);
>          if (err) {
> +            trace_qmp_exit_my_command(error_get_pretty(err), false);
>              error_propagate(errp, err);
>              goto out;
>          }
>  
>          qmp_marshal_output_UserDefOne(retval, ret, errp);
>  
> +        if (trace_event_get_state_backends(TRACE_QMP_EXIT_MY_COMMAND)) {
> +            g_autoptr(GString) ret_json = qobject_to_json(*ret);
> +
> +            trace_qmp_exit_my_command(ret_json->str, true);
> +        }
> +
>      out:
>          visit_free(v);
>          v = qapi_dealloc_visitor_new();

Let's add

       $ cat qapi-generated/example-qapi-commands.trace-events
       # AUTOMATICALLY GENERATED, DO NOT MODIFY

       qmp_enter_my_command(const char *json) "%s"
       qmp_exit_my_command(const char *result, bool succeeded) "%s %d"

between .h and .c.


