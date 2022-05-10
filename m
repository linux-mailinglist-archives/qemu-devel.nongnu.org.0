Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9265213C7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:31:13 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noO5A-0003Jy-VC
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noO2x-0000yE-4R
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noO2s-0005TI-KA
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652182129;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjsxZ6yl2Vub92c5GxSuujBhzFID676aDf3FoGmdjd4=;
 b=Wf7mn326fdh1b0u1n39JuZXTSaWHZlKCuRaliHSBYVyYy42SEtoqXGFA3rDUzomcfknckr
 KP8Bl6Ok2LWusaPovjF8RPP0KiiSZbFpY3ye/SJ5uOUa2pmbHq+Wn+AYlw6JJUYLg7HAzv
 HalBIjig8FDg2F04taQ8U2d4OTkMZjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-EPh4MDzJOfeJXy9cu3QjNA-1; Tue, 10 May 2022 07:28:48 -0400
X-MC-Unique: EPh4MDzJOfeJXy9cu3QjNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AC9C1011637
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:28:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58AE0111E407;
 Tue, 10 May 2022 11:28:43 +0000 (UTC)
Date: Tue, 10 May 2022 12:28:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 2/8] qapi: golang: Generate qapi's alternate types
 in Go
Message-ID: <YnpMaE6r4Xt/Svx6@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-3-victortoso@redhat.com>
 <Yno6Jb1Y9GmgD5wr@redhat.com>
 <20220510112129.befwqkqtkdhyah5h@tapioca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510112129.befwqkqtkdhyah5h@tapioca>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, May 10, 2022 at 01:21:29PM +0200, Victor Toso wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 11:10:45AM +0100, Daniel P. Berrangé wrote:
> > On Sat, Apr 02, 2022 at 12:40:58AM +0200, Victor Toso wrote:
> > > This patch handles QAPI alternate types and generates data
> > > structures in Go that handles it.
> > > 
> > > At this moment, there are 5 alternates in qemu/qapi, they are:
> > >  * BlockDirtyBitmapMergeSource
> > >  * Qcow2OverlapChecks
> > >  * BlockdevRef
> > >  * BlockdevRefOrNull
> > >  * StrOrNull
> > > 
> > > Alternate types are similar to Union but without a
> > > discriminator that can be used to identify the underlying
> > > value on the wire. It is needed to infer it. That can't be
> > > easily mapped in Go.
> > 
> > I don't buy that. Given this example:
> > 
> >   type BlockdevRef struct {
> >         // Options are:
> >         // * definition (BlockdevOptions): defines a new block device inline
> >         // * reference (string): references the ID of an existing block device
> >         Value Any
> >   }
> > 
> > What is the problem with having this Go struct:
> > 
> >   type BlockdevRef struct {
> >         Definition *BlockdevOptions
> > 	      Reference  *string
> >   }
> 
> ... this is better.
> 
> > when deserializing from JSON, we know exactly which one of
> > these two fields to populate. The programmer consuming this can
> > look at which field is non-nil.
> > 
> > When serializing to JSON, we serialize which ever field is
> > non-nil.
> > 
> > If both fields are non-nil that's a programmer bug. Either
> > ignore it and only serialize the first non-nil field, or raise
> > an error.
> 
> It would be a programmer bug if they set a Value of a type not
> allowed by Type's spec, but it would be a *runtime* error. Your
> suggestion is more type safe.

Yep, essentially I'm saying I want the code to enable type
checking to be done at compile time instead of runtime,
whenever it is possible to achieve that from a technical POV.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


