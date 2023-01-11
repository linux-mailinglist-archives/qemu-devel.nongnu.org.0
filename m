Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09462665B08
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 13:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFZuS-00089I-GI; Wed, 11 Jan 2023 07:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFZuH-00088q-4i
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 07:08:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFZuD-00058J-6f
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 07:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673438911;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nzLwETBPhSqvPdxgc+Pwpr3f2RivzLnwQpu9FFhdEwc=;
 b=E1DylWIqw7UBjNR3hPRNzIPUeAnPJPqQ+GIndhRW/1lvBsXVgvkh4RLMLPhdOL6GJwO1hb
 5OgJF5A9aV6kVGDpMuFdZhmffLFX4xXIF0G+Dzd2Ld0fXSDJEN5i3i2HmwBBVvmugEVB4K
 DlulTeBkLZqs/ZtVP1nOSh6kTbHXJgc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-cMrPbEOjNAiAZe4u4eXhVw-1; Wed, 11 Jan 2023 07:08:30 -0500
X-MC-Unique: cMrPbEOjNAiAZe4u4eXhVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 117571C0A586;
 Wed, 11 Jan 2023 12:08:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5856FC15BA0;
 Wed, 11 Jan 2023 12:08:29 +0000 (UTC)
Date: Wed, 11 Jan 2023 12:08:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] util: import GTree as QTree
Message-ID: <Y76mumSsUDY/hVWu@redhat.com>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-2-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230111035536.309885-2-cota@braap.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 10:55:35PM -0500, Emilio Cota wrote:
> The only reason to add this tree is to control the memory allocator
> used. Some users (e.g. TCG) cannot work reliably in multi-threaded
> environments (e.g. forking in user-mode) with GTree's allocator, GSlice.
> See https://gitlab.com/qemu-project/qemu/-/issues/285 for details.
> 
> Importing GTree is a temporary workaround until GTree migrates away
> from GSlice.
> 
> This implementation is identical to that in glib v2.75.0.
> I've imported tests from glib and added a benchmark just to
> make sure that performance is similar (Note: it cannot be identical
> because we are not using GSlice).
> 
> $ taskset -c 2 tests/bench/qtree-bench
> 
> - With libc's allocator:
> 
>  Tree         Op      32            1024            4096          131072         1048576
> ------------------------------------------------------------------------------------------------
> GTree     Lookup   14.01           15.17           24.93           18.99           15.28
> QTree     Lookup   22.50 (1.61x)   32.49 (2.14x)   29.84 (1.20x)   16.77 (0.88x)   12.21 (0.80x)
> GTree     Insert   19.24           15.72           25.24           17.87           16.55
> QTree     Insert   15.07 (0.78x)   26.70 (1.70x)   25.68 (1.02x)   17.20 (0.96x)   12.49 (0.75x)
> GTree     Remove   11.57           31.44           29.77           20.88           16.60
> QTree     Remove   14.01 (1.21x)   34.54 (1.10x)   33.52 (1.13x)   26.64 (1.28x)   14.95 (0.90x)
> GTree  RemoveAll   57.97          119.13          118.16          112.82           61.63
> QTree  RemoveAll   46.31 (0.80x)  108.04 (0.91x)  113.85 (0.96x)   77.88 (0.69x)   41.69 (0.68x)
> GTree   Traverse   72.56          232.83          243.20          254.22           97.44
> QTree   Traverse   66.53 (0.92x)  394.76 (1.70x)  357.07 (1.47x)  289.09 (1.14x)   45.64 (0.47x)
> ------------------------------------------------------------------------------------------------

Well this is rather strange, as it doesn't really match what I
see when running your test benchmark !

First, I find the test to be a little unreliable the first few
times it is ran. I ran it in a loop 20 times and it got more
stable results. Looking at just the QTree lines I get something
typically like:

QTree     Lookup   21.43 (1.33x)   17.99 (1.03x)   16.71 (1.07x)   10.01 (0.75x)    4.51 (0.40x) 
QTree     Insert   12.65 (0.81x)   12.65 (0.76x)   11.94 (0.76x)    7.71 (0.59x)    4.30 (0.39x) 
QTree     Remove   12.77 (1.09x)   18.34 (1.09x)   17.68 (1.07x)   13.65 (1.00x)    8.65 (0.76x) 
QTree  RemoveAll   35.05 (1.01x)   40.17 (1.10x)   30.70 (0.88x)   42.06 (1.25x)   27.13 (1.14x) 
QTree   Traverse   72.40 (1.12x)  180.95 (1.24x)  138.17 (1.09x)  146.29 (1.21x)   51.62 (1.29x) 

So it is slower on small Lookup, and slower on Traverse. On large Lookup
and Insert malloc is massively faster.

One thing to bear in mind is that if setting G_SLICE=always-malloc, we
should in theory see the exact same results for GTree and QTree. So for
a sanity check, I tried the test with that env set and get:

QTree     Lookup   21.72 (1.31x)   19.04 (1.05x)   16.65 (1.01x)    9.94 (1.06x)    7.19 (1.06x) 
QTree     Insert   14.71 (1.25x)   12.59 (1.07x)   11.83 (1.04x)    7.48 (0.99x)    5.72 (0.96x) 
QTree     Remove   12.48 (1.02x)   18.58 (1.01x)   17.89 (1.01x)   11.68 (0.97x)    8.96 (1.11x) 
QTree  RemoveAll   31.47 (1.04x)   39.71 (1.16x)   37.84 (1.13x)   37.11 (1.15x)   24.56 (1.04x) 
QTree   Traverse   74.77 (1.47x)  179.21 (1.28x)  164.88 (1.15x)  126.17 (1.07x)   42.18 (1.00x) 

That's odd - all values ought to be 1.00 or very close.

This tells me that the nelements=32 data is not to be trusted.

There's also something wierd going on with Traverse - it is
always slower in QTree, even when both QTree and GTree are
using malloc. There must be some wierd cache effects from
the locally linked vs .so lib executed calls IMHO.

So overall if I ignore the unreliable results, my take away is
that malloc is pretty much always a win over gslice, sometimes
massively so, but at least shouldn't be worse.

NB, I'm using Fedora 37 with glibc.  Mileage may vary with different
libc impls.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


