Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD856CC9DF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 20:00:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDbh-0004T6-1U; Tue, 28 Mar 2023 13:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phDbf-0004Sv-3d
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phDbd-0007Pt-6S
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680026375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FNsC5gelqnlEXfJznEKLIJX+wxr4nSvrOBPztbeb64=;
 b=dGRC9e924SgZce1RaS5i1BsgTI/PW5x3lubFQMWA4uoNxO+8XWjLOYxdKCQZnJqxQyDcBn
 /QPpcVq6axsPQpv9NxKWNlRL/jsvvNGkAs/M4Q6UzIhGIEVR1f/KhWtkjC0xrKX4JZW2vU
 gfFqyJ/t+OA+q+dTeV+AT4nHi0NuiQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-bjBqZhO7M9mcodYylTAvpg-1; Tue, 28 Mar 2023 13:59:32 -0400
X-MC-Unique: bjBqZhO7M9mcodYylTAvpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D18C101A54F;
 Tue, 28 Mar 2023 17:59:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7051414171BB;
 Tue, 28 Mar 2023 17:59:29 +0000 (UTC)
Date: Tue, 28 Mar 2023 18:59:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henrik Carlqvist <hc981@poolhem.se>
Cc: mark.cave-ayland@ilande.co.uk, hc1245@poolhem.se, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-ID: <ZCMq/imcAq0ApLQp@redhat.com>
References: <167305907804.10652.2746409341903316717-1@git.sr.ht>
 <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
 <20230123200937.32eb19eb.hc981@poolhem.se>
 <20230304220754.0c6ae562.hc981@poolhem.se>
 <ZCLzUyiDeKLfQqWT@redhat.com>
 <20230328191958.3e3eb5e4.hc981@poolhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328191958.3e3eb5e4.hc981@poolhem.se>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Mar 28, 2023 at 07:19:58PM +0200, Henrik Carlqvist wrote:
> Thanks for your feedback!
> 
> On Tue, 28 Mar 2023 15:01:55 +0100
> Daniel P. BerrangÃ© <berrange@redhat.com> wrote:
> 
> > This is another reason why use of the '-k' switch is a bad idea. Its
> > range of permissible values / vocabulary does not match the range of
> > values / vocabulary needed for this hardware device.
> > 
> > In https://docs.oracle.com/cd/E19683-01/806-6642/new-43/index.html
> > the keyboard layouts have distinct names
> > 
> > "Norway4" vs "Norway5" and "US4" vs  "US5" vs "US_UNIX5"
> 
> Those distinct names are names of files in the OS filesystem. This is a link
> to a description of a patch which gives those keyboard layouts support for
> the euro sign:
> 
> http://download.nust.na/pub3/solaris/patches/106839.readme
> 
> > I'd suggest a property to the escc device should take the names
> > given by that reference page above. eg
> > 
> >   -global escc.sunkbd_layout=Norway4
> 
> Would you mind if such an assignment could also be given in multiple ways,
> that is:
> 
> -global escc.sunkbd_layout=33
> -global escc.sunkbd_layout=0x21
> -global escc.sunkbd_layout=US5
> -global escc.sunkbd_layout=en_us
> 
> would all result in the same dip switch setting 0x21?

I'm generally not in favour of creating many different ways to set
the same thing, especially not multiple string based names, but if
a single vocabulary for strings is insufficient, then having support
for numbers feels reasonable.

> The nice thing with being able to assign keyboard layouts with a string like
> "en_us" is that it does not require the user to read reference documentation
> from Oracle to see which odd named layouts to choose from.
> 
> The nice thing to also being able to give numerical values like 33 or 0x21 is
> that some possible dip switch settings (like 0x20) are not mentioned in the
> Oracle reference documentation, but of course they would be possible to set
> with physical dip switches even though they might not be supported by the OS.

If you care about documentation then I think there ought to be docs
added in QEMU for it, as out of the 33 currrent keymap names supported
by QEMU, only 28 seem to be supported by this device.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


