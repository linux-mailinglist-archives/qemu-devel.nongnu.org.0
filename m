Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B95212BF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:51:18 +0200 (CEST)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNSX-0000mw-DI
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noNOw-0008EA-Ai
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noNOp-0006jQ-Ox
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652179647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=B6wXPLjDuAsYJgjgWKbreSV//au1vonmH8R/4T8jlSw=;
 b=a2FC3m6YTMMUPl9dILhqOZ5v+t0vx7uYZ1hQEB8w9RexM43aIqinNeep9WlCP85hfsaTgg
 s6T1mqFoetWDPJDPwa3i9UIhXpAp5PrPli1vt2QVXc//WpbA3+9Crih6ktflrVryIcOztu
 t/oY96KkJtba+D1Fv2l5CEBth8soEg4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-fR2huLKGOq-QEpeBNaEd9w-1; Tue, 10 May 2022 06:47:23 -0400
X-MC-Unique: fR2huLKGOq-QEpeBNaEd9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C1085A5BE
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:47:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67E5E40317B;
 Tue, 10 May 2022 10:47:22 +0000 (UTC)
Date: Tue, 10 May 2022 11:47:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnpCt214vmMaS2uH@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220401224104.145961-1-victortoso@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Sat, Apr 02, 2022 at 12:40:56AM +0200, Victor Toso wrote:
> * Status
> 
> There are a few rough edges to work on but this is usable. The major
> thing I forgot to add is handling Error from Commands. It'll be the
> first thing I'll work on next week.
> 
> If you want to start using this Today you can fetch it in at
> 
>     https://gitlab.com/victortoso/qapi-go/

Looking at this my main concern is that there is way too much use
of the 'Any' type. The valid Golang types that can be used with
any of the 'Any' fields are merely expresssed as comments in the
code. I think this needs changing so that the Golang types are
directly expressed in code. 

I think there are perhaps only 2-3 cases where the 'Any' type
is genuinely neccessary due to the QAPI schema having an unbounded
set of possible types - SchemaInfoObjectMember, ObjectPropertyInfo
and QomSetCommand


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


