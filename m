Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67837C75C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:09:40 +0200 (CEST)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrQZ-0002KI-T7
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgrN5-0002UJ-GS
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgrN0-0003nG-5P
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620835556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2fbaGYvcFqQaRKMzfHyVH2D5h2tKbWfZ5dLGtcX6hM=;
 b=GzRrx8gRqBJPfm5fN0zIN266GcDzX9veEgKfuD5/yYkpOo8KNhrQncxEh7/8s96/Age7tq
 YtAbuqo8ZLC1wFZ0aWJS4wRo4gpvW/ZZlFaxbMo13V/UGMzzDUbvGgrK6WiBiGrg4IcY6B
 HAIbowjYEg99KwYmqY8K0oB10l3nVt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-0_RPP7CRPz-sGwWrRF8r8g-1; Wed, 12 May 2021 12:05:53 -0400
X-MC-Unique: 0_RPP7CRPz-sGwWrRF8r8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A977FC81;
 Wed, 12 May 2021 16:05:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 666206D8C2;
 Wed, 12 May 2021 16:05:43 +0000 (UTC)
Date: Wed, 12 May 2021 17:05:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] travis-ci: Use clang-10 for the [s390x] Clang
 (disable-tcg) job
Message-ID: <YJv81L/gJLHn42mf@redhat.com>
References: <20210512152231.3423265-1-philmd@redhat.com>
 <32b21c1c-0d55-d92a-390e-f7d6059d03a9@redhat.com>
 <d9eadf82-3fa6-8a52-7822-8da9a9114459@redhat.com>
 <YJv6aJZm2GHM4Gae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YJv6aJZm2GHM4Gae@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 04:55:20PM +0100, Daniel P. Berrangé wrote:
> On Wed, May 12, 2021 at 05:44:10PM +0200, Thomas Huth wrote:
> > 
> > I think the configure script uses the same compiler as --host-cc for --cc if
> > it is not specified. So depending on whether Daniel sets the minimum version
> > to 6.3 or 6.0, we either can use this patch or we don't need it at all.
> 
> I'm going to set min to 6.0.0, because I expect most users on ubuntu
> will install the default "clang" and not realize there are extra
> clang-NNN versions

Actually I messed up debian versions for clang in the same way, so I'll
set clang min to 3.8


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


