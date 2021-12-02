Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C304A466212
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 12:08:45 +0100 (CET)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjxE-0001VN-1o
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 06:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1msjvP-00088S-EG
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1msjvH-0001mA-IB
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638443202;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8yCvZDhikKKiQhNQ6CiTgaPn0vhiyTDC3QGvn6y0nk=;
 b=AKhhFLyonSYxQKHvBxo1qPz2zUJihnAw6v3cVymJ21MNpIlycM7aNN36Yn0AK9I4nCwxSN
 /iFk3gBnHsOYNSmoLwKRQ+Q1DoLEJPTSFsS1GHNGEDTKLxeUebf9hC1VWoMtDoWT4sfqTM
 u1TDb/FdK/T5T+vv4jmJ9jmCP36tWFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-MfFzpppgOCeU8jPXmZIkTw-1; Thu, 02 Dec 2021 06:06:35 -0500
X-MC-Unique: MfFzpppgOCeU8jPXmZIkTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 854B31014B4E;
 Thu,  2 Dec 2021 11:06:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C953A5F4E7;
 Thu,  2 Dec 2021 11:06:22 +0000 (UTC)
Date: Thu, 2 Dec 2021 11:06:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] edid: set default resolution to 1280x800 (WXGA)
Message-ID: <YaiorC0d/6FwYf0Y@redhat.com>
References: <20211129140508.1745130-1-berrange@redhat.com>
 <CAFEAcA9VG8d3AnCSDEGjBaMwrk1yAbtCAUa9wTEURX22rNag9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9VG8d3AnCSDEGjBaMwrk1yAbtCAUa9wTEURX22rNag9g@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 11:00:53AM +0000, Peter Maydell wrote:
> On Mon, 29 Nov 2021 at 14:13, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > This patch thus suggests a modest change to 1280x800 (WXGA).
> 
> Does this change need to be versioned so as to not change
> behaviour for older machine types ?

I don't think the EDID defaults change needs it. It just means that
VM will get a updated res next time it queries EDID, which should
be OK.

The virtio-gpu change I'm not so sure about - it feeds into the
EDID code, but not sure if it has other consequences that matter
from a guest ABI pov.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


