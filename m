Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA330514A53
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 15:18:11 +0200 (CEST)
Received: from localhost ([::1]:42656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQVd-0007ye-Hy
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 09:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkQTQ-0006Oe-Kn
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 09:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkQTM-0002Dh-76
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 09:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651238146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CctKeXb0HN6H9UlYTa93bLqC2ZedlJCSIrkZflLaaVw=;
 b=TK17zsIwQZPiV+r/nkXFG7sSDxbQvLKNUlgo/ez7FxFiBfKltg8IozXh6oWGbTzC/SSjdC
 U9IQNifgi1T1tjB47DDjzfE1IIfCtiteY/vFY80Vx9oswoKXhpc0ZQgP6ui0lD1uc0dYn1
 heHvJsIXPbZ8TRAuP6DhixQkqbXnXuw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ikILK6ZBPL-7WGFU5ASEcw-1; Fri, 29 Apr 2022 09:15:44 -0400
X-MC-Unique: ikILK6ZBPL-7WGFU5ASEcw-1
Received: by mail-yb1-f197.google.com with SMTP id
 b12-20020a056902030c00b0061d720e274aso7278452ybs.20
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 06:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=CctKeXb0HN6H9UlYTa93bLqC2ZedlJCSIrkZflLaaVw=;
 b=6x67Hov2OwkrtPJluWDB7GtWlJ3MjXZl2wyI0iPjpGBz+nqxPjYWRFbhvg41nAK8SN
 1MHSOU128EFz0ZZlUTkCaksOQpmtPwQgnfYFLbuni36nnaK8tHi7vUwWRBvRUnOKSeXm
 jEUxDNomwQ28Y7/HZxYgONeE1umXsOmZz9/n+/BPyLUMLq6/iluuc04E7B+Q/p+RJD0e
 JbtdHA3/TUDfZmPyUxvkWAOU3x+C0qr8HhbtuklF+AWX3Ny8rLzRFnWtuWhBaPVoug86
 M1SLcGzqVhqI9/f8iySr5ZzqtWWR9n3cow0wlcgKjs/m3C+iIEm6ykMV7kMx6ekFMrwU
 oo7A==
X-Gm-Message-State: AOAM530a4eTb0n1XpCrkAalbvxc717zD3lo7PO+9xP6V90O7GXaJKCRv
 yyifaauJHXD0HVb/y+K8KkFqRmX7RMq3/17LaC952P4P/YnP1MI8tyaDADuhQvZH0GFqTyr7B1c
 OLsLq6m31G3RGT2xBKuddLl5AAGuxoec=
X-Received: by 2002:a25:bb4a:0:b0:633:92a6:c35 with SMTP id
 b10-20020a25bb4a000000b0063392a60c35mr34541878ybk.121.1651238144097; 
 Fri, 29 Apr 2022 06:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyvzXWqgGk4CuzjIq89gJveIfSZKxx90Gi4Ie/YeZYzzXmgwpANFX1S+nnMZAF6bux9B6KIRmqun1MEz49y4k=
X-Received: by 2002:a25:bb4a:0:b0:633:92a6:c35 with SMTP id
 b10-20020a25bb4a000000b0063392a60c35mr34541849ybk.121.1651238143847; Fri, 29
 Apr 2022 06:15:43 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Apr 2022 06:15:43 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6c52u68.fsf@pond.sub.org>
Date: Fri, 29 Apr 2022 06:15:43 -0700
Message-ID: <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 03:50:55PM +0200, Markus Armbruster wrote:
> Andrea Bolognani <abologna@redhat.com> writes:
> > One concern that I have is about naming struct members: things like
> > SpiceInfo.MouseMode and most others are translated from the QAPI
> > schema exactly the way you'd expect them, but for example
> > ChardevCommon.Logappend doesn't look quite right.
>
> It doesn't look quite right in the QAPI schema, either: @logappend.  If
> it was @log-append, as it should, then it would get translated to
> LogAppend, I guess.
>
> Fixing up style isn't a code generator's job.

I agree that the generator shouldn't take too many liberties when
translating names, and specifically should never attempt to figure
out that @logappend should have been @log-append instead.

What I was thinking of was more along the lines of, can we change the
schema so that the proper name is available to the generator without
breaking the wire protocol? Maybe something like

  ##
  # ChardevCommon:
  #
  # @logappend (rename @log-append): ...
  ##

That way the generator would have access to both information, and
would thus be able to generate

  type ChardevCommon struct {
    LogAppend *bool `json:"logappend,omitempty"`
  }

The wire protocol would still retain the unappealing name, but at
least client libraries could hide the uglyness from users.

> > Same for the various
> > structs or members that have unexpectedly-capitalized "Tls" or "Vnc"
> > in them.
>
> Examples?

A perfect one is TlsCredsProperties, whose endpoint member is of type
QCryptoTLSCredsEndpoint.

On the VNC front, we have SetPasswordOptionsVnc but also
DisplayReloadOptionsVNC.

There's plenty more, but this should be illustrative enough already.
Capitalization of these acronyms is inconsistent across the schema,
with one of the two forms disagreeing with Go naming expectations.

In this case we might be able to just change the schema without
introducing backwards compatibility issues, though? Type names are
not actually transmitted on the wire IIUC.

> > but maybe
> > there's room for adding this kind of information in the form of
> > additional annotations or something like that?
>
> We did for enumeration types: 'prefix' overrides the TYPE_NAME prefix.
> I fear this was a mistake.

This might be an oversimplification, but I think we might be able to
solve all of these issues with a single annotation in the form

  namespace:word-MLA-other-words

So for example QCryptoTLSCredsEndpoint would be annotated with

  q:crypto-TLS-creds-endpoint

and each generator would have enough information to produce
identifiers that fit into the corresponding language, such as

  qcrypto_tls_creds_endpoint
  CryptoTlsCredsEndpoint

or whatever else.

Of course such annotations would only be necessary to deal with
identifiers that are not already following the expected naming
conventions and when MLAs are involved.

-- 
Andrea Bolognani / Red Hat / Virtualization


