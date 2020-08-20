Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDC24C4EC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 19:58:36 +0200 (CEST)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8opf-0000tp-Iz
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 13:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k8oos-0008Tq-8c
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:57:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29721
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k8ooq-0005rI-Lk
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597946263;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+tC9aSjIDg/uD4EHAAGEAJIyAvbDYQts/gl9cmGil+I=;
 b=fbOnAwhIwQVYGmBpvvfdfTgm6Kw1X/UXGu2Kz18yEeT5o1+v8DRxbw4auZOTsbr7hFJQiE
 PRRxGbItcKvghMdsMmqCOR6KCTeJPfE0Z1tyLDMWvxhKwNWYDwXSUQUHo6MDz4oOovKOn8
 qYRQjJ7hrAQUdaRSuOcxQK7h1RqxvrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-WvhofM1HM0CO9NWu6Hoidw-1; Thu, 20 Aug 2020 13:57:41 -0400
X-MC-Unique: WvhofM1HM0CO9NWu6Hoidw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4D06186A585
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 17:57:40 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6F719936;
 Thu, 20 Aug 2020 17:57:36 +0000 (UTC)
Date: Thu, 20 Aug 2020 18:57:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 44/58] qom: provide convenient macros for declaring
 and defining types
Message-ID: <20200820175733.GC244434@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-45-ehabkost@redhat.com>
 <20200820174506.GE642093@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20200820174506.GE642093@habkost.net>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 03:03:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 01:45:06PM -0400, Eduardo Habkost wrote:
> (CCing Eric Blake, who reviewed the original patch.  Sorry for
> not CCing you previously, Eric)
> 
> On Wed, Aug 19, 2020 at 08:12:22PM -0400, Eduardo Habkost wrote:
> [...]
> > +/**
> > + * OBJECT_DECLARE_TYPE:
> > + * @ModuleObjName: the object name with initial capitalization
> > + * @module_obj_name: the object name in lowercase with underscore separators
> > + * @MODULE_OBJ_NAME: the object name in uppercase with underscore separators
> 
> We need to decide what to do with TYPE_SWIM:
> 
>   #define TYPE_SWIM "swim"
>   typedef struct SWIM SWIM;
>   #define SWIM(obj) OBJECT_CHECK(SWIM, (obj), TYPE_SWIM)
> 
> Both the typedef and type checking macros are called "SWIM".
> This makes usage of OBJECT_DECLARE_TYPE impossible (because the
> type checking function can't have the same as the typedef).  What
> should be the recommended style here?  Rename the struct to
> "Swim"?

This would be the gobject style approach to the problem - structs
always have initial-caps-only even if they are abbreviations.

If that's unappealing we could add a suffix  "struct SWIMInst" 

> We have similar issues with RXCPU and ARMSSE, but these type
> checking macros can be easily renamed to RX_CPU and ARM_SSE. so
> they won't be an issue.

Or  RSCPUInst  and ARMSSEInst  ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


