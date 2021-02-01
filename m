Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B480730AE51
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:48:09 +0100 (CET)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dJ2-0000Qo-8S
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6dHd-0008FM-JA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6dHZ-0004wj-4m
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612201595;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bMSvKV68L51ZAbjJaBQkxdc51MxE+YpyYU0yZwvF+E8=;
 b=OY7qWjcHoWjRQfZH8KX4i/YdvPrJvUFjcpCxMJSnu/mDmnXAxy6xpwB/XH0zGP9wT80bJe
 JdkiPfiOXDtjO0HxAayDJvBl/VqRw+7puN93cyQXAv7BZwyTeWsKHzgh9cQDcevCxIl3Ij
 awzSJGP8f+B9hTYpQXpurl6/QLTxr8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-lzgLlbqNMey6yW4WVL1uaw-1; Mon, 01 Feb 2021 12:46:31 -0500
X-MC-Unique: lzgLlbqNMey6yW4WVL1uaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBEFFC297;
 Mon,  1 Feb 2021 17:46:30 +0000 (UTC)
Received: from redhat.com (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 018A210016DB;
 Mon,  1 Feb 2021 17:46:24 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:46:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210201174622.GQ4131462@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
 <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 06:25:33PM +0100, Paolo Bonzini wrote:
> On 01/02/21 17:54, Kevin Wolf wrote:
> > > How does this option parsing work? Would then multiple patterns separated by
> > > comma as in -trace pattern1,pattern2 also work?
> > This would be interpreted as an implied "enable" option with a value of
> > "pattern1,pattern2". I don't think anything splits that string at the
> > comma, so it would look for a trace event matching that string.
> 
> Even worse, it would be interpreted as "-trace enable=pattern1,pattern2=on"
> (and raise a warning since recently).

Maybe we're trying to solve the problem at the wrong level.

The pattern is currently matched using the GLib glob matching APIs.

If we switched to use the GLib regex matching APIs, then we don't need
to repeat the args at all. We could just use regex syntax:

  -trace 'enable=(kvm|virtio)*'

It is a little tedious to have to quote the args to avoid shell
expansion, but as a tradeoff you get much stronger ability todo
complex matches to filter out irrelevant cruft.

If we want to maintain back compat for glob syntax, then we should
support both in parallel and accept a different parameter name
for the regex style.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


