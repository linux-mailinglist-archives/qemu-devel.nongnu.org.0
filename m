Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CF2AD232
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:17:24 +0100 (CET)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPmF-0008BU-3t
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcPkO-0007UA-Un
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcPkJ-0005Jx-8e
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604999722;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IGDk6ydEz7ioGmRPkhe96shIANMCzQtDVRUfM2yTyEg=;
 b=Nj1he4RRu6UeHQOz6nxol2YzmQHi0IjXhbwNmYXcA3QtyvLPXstF4cgGdTr6YkAmzkXH1u
 1BNuAsXbJ2C/NMu+CzVs3+qZYK77Cv7rTE7OLGJMQ+o3Dq24olBU31uoxT/tudhdUISU5Y
 fBMagYi277GjUXHbmF0dmPOAi4iUCB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-zXVT5FuYPzKuZ4FxliTkjQ-1; Tue, 10 Nov 2020 04:15:18 -0500
X-MC-Unique: zXVT5FuYPzKuZ4FxliTkjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBDE5192CC4A
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:15:16 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB65710013DB;
 Tue, 10 Nov 2020 09:15:15 +0000 (UTC)
Date: Tue, 10 Nov 2020 09:15:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QMP and the 'id' parameter
Message-ID: <20201110091512.GA866671@redhat.com>
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
 <87361h20kd.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87361h20kd.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 07:22:26AM +0100, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> > The QMP specification states:
> >
> >> NOTE: Some errors can occur before the Server is able to read the "id"
> >> member, in these cases the "id" member will not be part of the error
> >> response, even if provided by the client.
> >
> > I am assuming this case ONLY occurs for Parse errors:
> >
> > {'class': 'GenericError', 'desc': 'JSON parse error, expecting value'}
> 
> There are more "desc" possible, actually.
> 
> The JSON parser gets fed chunks of input, and calls a callback for every
> full JSON value, and on parse error.
> 
> QMP's callback is handle_qmp_command().  Parameter @req is the parsed
> JSON value, parameter @err is the (parse) error object, and exactly one
> of them is non-null.
> 
> 1. Parse error
> 
> If @err, we send an error response for it.  It never has "id".  See
> qmp_error_response() caller monitor_qmp_dispatcher_co().  The possible
> @err are:
> 
>     $ grep error_setg qobject/json-*[ch]
>     qobject/json-parser.c:    error_setg(&ctxt->err, "JSON parse error, %s", message);
> 
> This is a syntax error.
> 
> Search for parse_error() to see the possible @message patterns.
> 
>     qobject/json-streamer.c:        error_setg(&err, "JSON parse error, stray '%s'", input->str);
> 
> This is a lexical error.
> 
>     qobject/json-streamer.c:        error_setg(&err, "JSON token size limit exceeded");
>     qobject/json-streamer.c:        error_setg(&err, "JSON token count limit exceeded");
>     qobject/json-streamer.c:        error_setg(&err, "JSON nesting depth limit exceeded");
> 
> These are (intentional) parser limits.
> 
> 2. Successful parse
> 
> If @req, it's a successful parse.
> 
> If @req is not a JSON object, there is no "id".  qmp_dispatch() reports
> 
>         error_setg(&err, "QMP input must be a JSON object");
> 
> If @req is a JSON object, it has "id" exactly when the client supplied
> one.  The response mirrors @req's "id".  See qmp_error_response() caller
> qmp_dispatch().
> 
> > And I am assuming, in the context of a client that /always/ sets an
> > 'id' for its execute statements, that this means that any error
> > response we receive without an 'id' field *must* be associated with
> > the most-recently-sent command.
> 
> Only if the client keeps no more than one command in flight.
> 
> Command responses get sent strictly in order (even parse errors), except
> for commands executed out-of-band.

With out of band commands, how much runs in the background ? Is the
JSON parsing still in the foreground, such that we can expect that
even for OOB commands, a error response without a "id" is still
received strictly in order.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


