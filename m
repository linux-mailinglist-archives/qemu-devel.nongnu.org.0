Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D393644ACB7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:34:25 +0100 (CET)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkPOT-000623-0s
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:34:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkPMw-00057b-Jj
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:32:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkPMp-0000mp-7r
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636457561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ge2PtQVlAm1XKA9SXqXCXUwBbTDzU+OE4bAinbPdGOU=;
 b=PSIq4sc3CegdRiMIkBpRdhTaOd2IFOV+GEEn2hNsqDumOMr8sfl5Afs6acovtoNr4h6SYP
 IItaG6L8eCukwLTikiGOkc3O5GsiaeLxzg7tgzCqKXNvJAT5QGl8WZsmEZEFdAXuMC1bNB
 IiOmGklWIe5yL+E7/W0Ttp0d2SZ6vQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-LzAodWOvPIu2DosxTzXBaA-1; Tue, 09 Nov 2021 06:32:38 -0500
X-MC-Unique: LzAodWOvPIu2DosxTzXBaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19F021030C20;
 Tue,  9 Nov 2021 11:32:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B17F5DA61;
 Tue,  9 Nov 2021 11:32:33 +0000 (UTC)
Date: Tue, 9 Nov 2021 11:32:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Cirrus-CI all red
Message-ID: <YYpcR/SBHNlqj5CV@redhat.com>
References: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
 <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
 <YYpF4coXvnStffD5@redhat.com> <87fss5k1lv.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87fss5k1lv.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>, Yonggang Luo <luoyonggang@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 11:27:42AM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Nov 09, 2021 at 10:45:18AM +0100, Thomas Huth wrote:
> >> On 09/11/2021 10.39, Philippe Mathieu-Daudé wrote:
> >> > FYI, as of today, the latest merge history is red (last 10 days):
> >> > https://cirrus-ci.com/github/qemu/qemu
> >> > 
> >> > If we want to keep using this, we should somehow plug it to
> >> > GitLab-CI (i.e. Travis-CI is run as an external job there) so
> >> > the project maintainer can notice job failures.
> >> 
> >> Well, considering that all the cirrus-run based jobs are currently failing
> >> due to the non-working API token, that does not seem to work very well
> >> either.
> >
> > Who owns the API token ? For other projects, this was addressed a while
> > ago by refreshing the token. I would have tried this myself for QEMU
> > but I don't have privileges on the QEMU projects in github/gitlab.
> 
> OK I've updated the token (after I figured out the path to it):
> 
>   - top right, Settings
>   - scroll to bottom "Your GitHub Organizations"
>   - click gear icon
>   - scroll to API settings, click Generate New Token
> 
> It seems to be triggering the builds now although GitLab still reports
> failures for some other reason now.

The cirrus-run image we're using is lockde to version 0.3.0. I'm
testing an update to version 0.5.0 which has various reliability
fixes, essentially around making it retry on transient errors.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


