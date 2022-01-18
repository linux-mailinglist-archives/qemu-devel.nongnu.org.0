Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B347492233
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:08:21 +0100 (CET)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kTT-0003tM-L9
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:08:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9kOR-0001Uo-8N
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9kOO-0002m6-Gv
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642496583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QYCbRBHaCGSIJN6aqCH/4jLLAbsllkmWYPxDgtPXzyA=;
 b=O+fNsbDSARhzJ8Bsj9V6Jxd9Epd5bpza2OShy/1onRuvazthefGp6c1CMen88A2Y71sWKx
 +h0kCt9W5LystndYsp2hrfBwskA65sqJnYOidjXHYY2qIOd6tOAXCkfUFyTIaftzKcyIMv
 ahx6gF1lNeMZ9qh85JnlztJORbWKboo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-j_FlwECoMUycfeXFpD0kfg-1; Tue, 18 Jan 2022 04:02:49 -0500
X-MC-Unique: j_FlwECoMUycfeXFpD0kfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFD1C1018720
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:02:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3CF7A23A;
 Tue, 18 Jan 2022 09:02:37 +0000 (UTC)
Date: Tue, 18 Jan 2022 09:02:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: tracing.rst neglects to document syntax of trace-events files
Message-ID: <YeaCFxnGltxc5uFR@redhat.com>
References: <87zgntpi3t.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zgntpi3t.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 09:23:50AM +0100, Markus Armbruster wrote:
> Almost[*] all trace-events files start with this line:
> 
>     # See docs/devel/tracing.rst for syntax documentation.
> 
> But I can't find syntax documentation there.

In that doc, under the heading "Declaring trace events", is a wordy
paragraph that looks like it was attempting to fill this need,
especially the last part.

[quote]
Each event declaration will start with the event name, then its arguments,
finally a format string for pretty-printing. For example::

    qemu_vmalloc(size_t size, void *ptr) "size %zu ptr %p"
    qemu_vfree(void *ptr) "ptr %p"
[/quote]

It certainly has plenty of scope for improvement though !

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


