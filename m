Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB254B07BF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 09:08:59 +0100 (CET)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI4Ve-0003oN-AM
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 03:08:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nI4C3-0002TT-3B
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 02:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nI4Bz-0004I9-6h
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 02:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644479317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzVNXgcFoaWKgVta98D/o/cw+AdsUJLlalCEQI7HgJU=;
 b=aU4zkOEnusJkowcffkMrV1AovrC79lYP8NMWruTEtVZm8+gcTarVjoFwBOC5c8c0zTzCr9
 v6+p3CX0TPOblyA7R9/8JR1XSHGqkPfdjcdHEK7oeGjHY7hzARdkDG8EYE3r5RjpfbHyc+
 rCC6fSMLUCx2iIUWRQPBDUR2Ua0zL38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-nH44138rPlyh0MyBV2b2kg-1; Thu, 10 Feb 2022 02:48:36 -0500
X-MC-Unique: nH44138rPlyh0MyBV2b2kg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0391927800;
 Thu, 10 Feb 2022 07:48:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60910709AA;
 Thu, 10 Feb 2022 07:48:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A935F21E6A00; Thu, 10 Feb 2022 08:48:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: downstream extensions
References: <5c95f20c-df30-9d24-0e1b-f82f4d5a798e@virtuozzo.com>
Date: Thu, 10 Feb 2022 08:48:23 +0100
In-Reply-To: <5c95f20c-df30-9d24-0e1b-f82f4d5a798e@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 9 Feb 2022 15:33:04 +0300")
Message-ID: <874k57duwo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Hi all!
>
> We declare a kind of __com.redhat_drive-mirror syntax for downstream extensions of QAPI.
>
> That's inconvenient:
>
> Assume I want to merge now my keep-dirty option for Qcow2 driver "[PATCH v2 0/2] qcow2: add keep-dirty open option" to our downstream. To avoid possible conflicts with upstream in future, I should now call it __com.virtuozzo_keep-dirty. Not saying about this being too awkward, there is a real problem:
>
> I want to support dot-object-notation syntax, i.e. something like
>
> qemu-img check --image-opts driver=qcow2,keep-dirty=true,file.filename=img.qcow2
>
> And this way, a period inside a name looks ambiguous, as it looks like subproperty of "__com" property.

The downstream extension prefix predates dotted keys.  Their combination
is less than ideal, as you point out, but it's not actually ambiguous:

Consider this grammar:

    key               = key-fragment { '.' key-fragment }
    key-fragment      = [ downstream_prefix ] / [^=,.]+ /
    downstream_prefix = '__' rfqdn '_'
    rfqdn             = / [A-Za-z0-9.-] /

When a key-fragment starts with '__', it has a downstream prefix, which
extends to the next '_'.

parse_qapi_name() implements this, and keyval.c uses it.

The grammar in keyval.c neglects to cover the downstream prefix.  I'll
fix it.

> I now tested, it still works somehow, and test from my series passes with
>
>  keep_dirty_opts="driver=qcow2,__com.virtuozzo_keep-dirty=true,file.filename=$TEST_IMG"

qemu-img --image-opts still uses QemuOpts.  I don't remember more about
how it parses dotted keys other than "it's complicated", but downstream
prefixes not working would be a bug.

> But anyway, it looks ambiguous, and I don't want to use it and share with my colleagues.
>
> In past, I used x-vz- prefix for downstream names (before I heard about __RFQDN_ notation declared in QAPI spec), that was more convenient. But still, that is not correct..
>
> I now think to use just __vz_ prefix. Such name will never appear upstream, and unlikely to be used by Rhel downstream which is our base. And I don't care about any other downstreams.
>
>
> Any thoughts? Should we change the recommendations somehow? I think allowing dots in names in the object model is a bad idea.

Maybe, but that boat sailed long ago.

QAPI's downstream prefix was designed this way to let organizations
extend the schema without having to worry about clashes regardless of
how things get rebased or remixed.  That's a feature.

It reuses an existing registry of organization names: domain names.  Not
needing our own registry is also a feature.

Of course, nothing can stop you from putting something other than RFQDN
between __ and _.  I'd recommend not to.

We could add a revised downstream prefix syntax, and deprecate the first
one.  To me, that feels like more trouble and complexity than it's
worth.  I could be wrong.  Happy to read proposals.


