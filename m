Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84A4321E99
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:57:54 +0100 (CET)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFSz-0001Tk-Rl
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEFQN-0007MG-FX
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEFQL-0002rY-GL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016508;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06ocIJYingTe08czhNxdk81G+KYrQyIhvOHB3pyXNQg=;
 b=L/AFi9Rhm0K8j/grasR20PSLcCOX9J37pg0zd22lwn4Hjaqk6GVPk+vCFk/XYEajZ8M+lh
 87Iqtbbovf5vj865W1a4Xvn2m4lFAQNyE5Y6FK8cQNMH1jRJjApgNNE6PqiaFqKZb4HTcu
 jCmVhCcRSz6k+cLetEIr+lBRBP98bCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-weCI84jWO4ykedT7YswcEw-1; Mon, 22 Feb 2021 12:55:02 -0500
X-MC-Unique: weCI84jWO4ykedT7YswcEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 459A780402E;
 Mon, 22 Feb 2021 17:55:01 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FC45C260;
 Mon, 22 Feb 2021 17:54:54 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:54:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <YDPv7Bk6/DNq/lCn@redhat.com>
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 06:47:30PM +0100, Paolo Bonzini wrote:
> On 22/02/21 16:24, Daniel P. Berrangé wrote:
> > This problem isn't unique to QEMU. Any app using JSON from the
> > shell will have the tedium of quote escaping. JSON is incredibly
> > widespread and no other apps felt it neccessary to introduce single
> > quoting support, because the benefit doesn't outweigh the interop
> > problem it introduces.
> 
> The quotes were introduced for C code (and especially qtest), not for the
> shell.  We have something like
> 
>     response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
>                    "'property': 'temperature' } }", id);
> 
> These are sent to QEMU as double-quoted strings (the single-quoted JSON is
> parsed to get interpolation and printed back; commit 563890c7c7, "libqtest:
> escape strings in QMP commands, fix leak", 2014-07-01). However, doing the
> interpolation requires a parser that recognizes the single-quoted strings.

IMHO this is the wrong solution to the problem.  Consider the equivalent
libvirt code that uses a standard JSON library underneath and has a high
level API to serialize args into the command

      qemuMonitorJSONMakeCommand("qom-get",
                                 "s:path", id,
				 "s:property", "temperature");

Of course this example is reasonably easy since it is a flat set of
arguments. Nested args get slightly more complicated, but still always
preferrable to doing string interpolation IMHO.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


