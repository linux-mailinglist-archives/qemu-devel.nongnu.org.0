Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4536F5237B2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 17:51:41 +0200 (CEST)
Received: from localhost ([::1]:38496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noocl-0001OC-Vy
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 11:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noobt-0000er-5N
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noobp-0002zu-SK
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652284240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Do+9lqKqBqYlNnxhc9h3LIvn9xPbIvssIixLGSkUkBo=;
 b=FFCVr3ROTiShCh51A/qTqvoIq871bFRkSwlUMwldK9CRHWesTu/D7D6p2j3xlSH4Fv2ywA
 lZMUbo+0jYsayRy7WCLEw7cnws2HLxBF2uB0DRlO3JwGxoI1ViwFahL0FEDjmuHng67PE3
 Sfn0AbL8Y7EzQCpxA8O6OR7y7Bf2dVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-_UtWpUcIPAO9SJ4103pZbA-1; Wed, 11 May 2022 11:50:39 -0400
X-MC-Unique: _UtWpUcIPAO9SJ4103pZbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FC41801210
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 15:50:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1DF140C1421;
 Wed, 11 May 2022 15:50:37 +0000 (UTC)
Date: Wed, 11 May 2022 16:50:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Victor Toso <victortoso@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnvbS7psaEjkrN65@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
 <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 08:38:04AM -0700, Andrea Bolognani wrote:
> On Tue, May 10, 2022 at 01:51:05PM +0100, Daniel P. Berrangé wrote:
> > In 7.0.0 we can now generate
> >
> >    type BlockResizeArguments struct {
> >        V500 *BlockResizeArgumentsV500
> >        V520 *BlockResizeArgumentsV520
> >        V700 *BlockResizeArgumentsV700
> >    }
> >
> >    type BlockResizeArgumentsV500 struct {
> >        Device string
> >        Size int
> >    }
> >
> >    type BlockResizeArgumentsV520 struct {
> >        Device *string
> >        NodeName *string
> >        Size int
> >    }
> >
> >    type BlockResizeArgumentsV700 struct {
> >        NodeName string
> >        Size int
> >    }
> >
> > App can use the same as before, or switch to
> >
> >     node := "nodedev0"
> >     cmd := BlockResizeArguments{
> >         V700: &BlockResizeArguments700{
> >             NodeName: node,
> >             Size: 1 * GiB
> >         }
> >     }
> 
> This honestly looks pretty unwieldy.

It isn't all that more verbose than without the versions - just
a single struct wrapper.

> 
> If the application already knows it's targeting a specific version of
> the QEMU API, which for the above code to make any sense it will have
> to, couldn't it do something like
> 
>   import qemu .../qemu/v700
> 
> at the beginning of the file and then use regular old
> 
>   cmd := qemu.BlockResizeArguments{
>       NodeName: nodeName,
>       Size: size,
>   }
> 
> instead?

This would lead to a situation where every struct is duplicated
for every version, even though 90% of the time they'll be identical
across multiple versions. This is not very ammenable to the desire
to be able to dynamically choose per-command which version you
want based on which version of QEMU you're connected to.

ie 


     var cmd Command
     if qmp.HasVersion(qemu.Version(7, 0, 0)) {
        cmd = BlockResizeArguments{
           V700: &BlockResizeArguments700{
             NodeName: node,
             Size: 1 * GiB
	   }
         }
     } else {
        cmd = BlockResizeArguments{
           V520: &BlockResizeArguments520{
             Device: dev,
             Size: 1 * GiB
	   }
         }
     }

And of course the HasVersion check is going to be different
for each command that matters.

Having said that, this perhaps shows the nested structs are
overkill. We could have 


     var cmd Command
     if qmp.HasVersion(qemu.Version(7, 0, 0)) {
         cmd = &BlockResizeArguments700{
             NodeName: node,
             Size: 1 * GiB
         }
     } else {
        cmd = &BlockResizeArguments520{
             Device: dev,
             Size: 1 * GiB
         }
     }
 
If there was some need for common handling of the different versioned
variants, we could still have a 'BlockResizeArguments' that has a field
per version, as an optional thing. Or have a BlockResizeArguments
interface, implemented by each version </hand-wavey>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


