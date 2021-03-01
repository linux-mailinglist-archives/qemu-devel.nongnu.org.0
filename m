Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2386C327B97
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:09:03 +0100 (CET)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfU5-0004DC-KA
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGfRv-0003df-0y
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:06:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGfRr-0001Vk-7q
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614593201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wVaIAs82zf9yJYAeXhg3+fN87AS9Uu0K4J6LIfULdsY=;
 b=YE9TuQzM7O5sFx4/5LrtXmWoP7owR0mQfJB5V/bA+dZs+uI/7Xq0NYcFbG3jZKz8dSW/DA
 qO3jAWqwPTA8UJZE1CFt2fruKJ/kbMBYehVVnx9Y+GpCwYzRgvNXd8vqeh28dZYAUZWQqO
 797QUHadhs0zETfz7MpKR/viWHTWSvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-KLhb0liEOKG_Qoh7gD0hLw-1; Mon, 01 Mar 2021 05:06:39 -0500
X-MC-Unique: KLhb0liEOKG_Qoh7gD0hLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782A280196C;
 Mon,  1 Mar 2021 10:06:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677465D9E2;
 Mon,  1 Mar 2021 10:06:37 +0000 (UTC)
Date: Mon, 1 Mar 2021 10:06:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Message-ID: <YDy8qsRRR3FmWr1D@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 26, 2021 at 10:21:06AM -0500, Daniele Buono wrote:
> Build jobs are on the longer side (about 2h and 20m), but I thought it
> would be better to just have 6 large jobs than tens of smaller ones.

IMHO that is a not viable.

Our longest job today is approx 60 minutes, and that is already
painfully long when developers are repeatedly testing their
patch series to find and fix bugs before posting them for review.
I can perhaps get through 5-6 test cycles in a day. If we have a
2 hour 20 min job, then I'll get 2-3 test cycles a day.

I don't want to see any new jobs added which increase the longest
job execution time. We want to reduce our max job time if anything.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


