Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740F3A13B6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:04:53 +0200 (CEST)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwx2-0002jU-L5
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqwwA-0001vS-Ox
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqww8-0008Hk-QQ
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240236;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+CE1NFTAjMwuhV1GY+eHloTH/M+NdNvVRFfcdGAtL00=;
 b=XbNk/BEVQJ6zUx+3XSajJUPAvq73j1bhuyCX43F5VtqwjmBceCOQR59/Hx12UwPiThsEft
 OthKj1iSLqvf5bo6DgMCYg7UIjZPxx85Fs7VxzENDdIRDH3Ij5p9Hj58Ne2ZyUftAHtOWk
 bg3SLDXZ60UBbUoAxLcANKEZk852iFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-2KtjAa3COQuKuIkTVLDOow-1; Wed, 09 Jun 2021 08:03:51 -0400
X-MC-Unique: 2KtjAa3COQuKuIkTVLDOow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 865808042AA;
 Wed,  9 Jun 2021 12:03:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 793A55B689;
 Wed,  9 Jun 2021 12:03:48 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:03:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: GSoC Intro - TUI interface for QMP
Message-ID: <YMCuIf/p3IovHgg2@redhat.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
 <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
 <87czswxuwn.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czswxuwn.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, "Niteesh G. S." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 05:01:28PM +0200, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> [...]
> 
> > A challenge will be where to pull the help text from. The QEMU server
> > is not capable (today) of sending help information over the QMP socket
> > itself.
> >
> > We will need to implement a QMP command inside of QEMU directly that
> > is capable of delivering this information to the client so that it can 
> > render it.
> >
> > Since not all versions of QEMU will have this feature, the qmp-shell
> > will need to be able to gracefully deal with the lack of help text, 
> > displaying an error indicating that this version of QEMU does not have
> > help information compiled into it.
> 
> The doc text is bulky: my bld/docs/manual/interop/qemu-qmp-ref.html is
> 1.7 MiB and growing.  Less lavish markup results in smaller data.  We
> may want to store it compressed, or load it on demand.  We might even
> have to make it compile-time optional for some use cases.

From the POV of a TUI, I wouldn't think they necessarily need/want the
HTML format at all, because that means they now need an HTML -> text
conversion step.

IOW, an 'query-help' command might be better just sending back the
original raw docs from the .json files, and let the client then
decide how to format that. That ought to keep the data size down
as no formatting info would be included.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


