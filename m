Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA292DAA7A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 10:58:50 +0100 (CET)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp76X-0007VG-FH
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 04:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp74U-0006oD-M0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 04:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp74S-00043c-5Z
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 04:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608026197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkrprsCBuEmm75YL/fZmCnXDI56Qbx+8zlez7dV6tFI=;
 b=KsxfcI/4/cNkDRj307MTX2JC0qsN01nuD9134ExgNXsXyC273J9q3JZUE7t/w4NLpeiKg5
 2JKwPeXY0iLetJ9Lus3mHn42Sx7WWmQKqAp9oodQEu+gPwu4fUWpFlKr6P183RBb1BozF0
 WYjuZerORZAvOxfWsKZRAZBsfJ3emHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-dxbz6J7IPBubHI9XbQ7nJw-1; Tue, 15 Dec 2020 04:56:35 -0500
X-MC-Unique: dxbz6J7IPBubHI9XbQ7nJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E88E758;
 Tue, 15 Dec 2020 09:56:33 +0000 (UTC)
Received: from redhat.com (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 823FD57;
 Tue, 15 Dec 2020 09:56:30 +0000 (UTC)
Date: Tue, 15 Dec 2020 09:56:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
Message-ID: <20201215095627.GD121272@redhat.com>
References: <20201118140739.18377-1-alex.bennee@linaro.org>
 <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
 <CAAdtpL6E1wbT_qrzARjR8M2b1s=jpVuT0y5iTA5wxh+559DQQA@mail.gmail.com>
 <CAE2XoE938Ut+5NAB+4qgWMK4O4rGz8ORwWMsUC90J9NwF0Fs2A@mail.gmail.com>
 <87h7oovivo.fsf@linaro.org>
 <caaa48db-95b4-0765-2b96-e7f7298457fb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <caaa48db-95b4-0765-2b96-e7f7298457fb@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 luoyonggang@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 10:33:09AM +0100, Thomas Huth wrote:
> On 14/12/2020 10.24, Alex Bennée wrote:
> > 
> > 罗勇刚(Yonggang Luo) <luoyonggang@gmail.com> writes:
> > 
> >> On Mon, Dec 14, 2020 at 2:36 AM Philippe Mathieu-Daudé <f4bug@amsat.org>
> >> wrote:
> >>>
> >>> On Wed, Nov 18, 2020 at 4:11 PM Thomas Huth <thuth@redhat.com> wrote:
> >>>> On 18/11/2020 15.07, Alex Bennée wrote:
> >>>>> These seem to trigger timeouts with some regularity.
> >>>>>
> >>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >>>>> ---
> >>>>>  .cirrus.yml | 2 ++
> >>>>>  1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/.cirrus.yml b/.cirrus.yml
> >>>>> index f0209b7a3e..08db7c419f 100644
> >>>>> --- a/.cirrus.yml
> >>>>> +++ b/.cirrus.yml
> >>>>> @@ -18,6 +18,7 @@ freebsd_12_task:
> >>>>>      - gmake -j$(sysctl -n hw.ncpu) check V=1
> >>>>>
> >>>>>  macos_task:
> >>>>> +  timeout_in: 90m
> >>>>>    osx_instance:
> >>>>>      image: catalina-base
> >>>>>    install_script:
> >>>>> @@ -32,6 +33,7 @@ macos_task:
> >>>>>      - gmake check V=1
> >>>>>
> >>>>>  macos_xcode_task:
> >>>>> +  timeout_in: 90m
> >>>>>    osx_instance:
> >>>>>      # this is an alias for the latest Xcode
> >>>>>      image: catalina-xcode
> >>>>>
> >>>>
> >>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>>>
> >>>> ... we could maybe also split the --target-list between the two jobs if
> >> they
> >>>> take too long...
> >>>
> >>> Maybe it's time, 90min reached:
> >>> https://cirrus-ci.com/task/5774549872541696
> >>>
> >> Even two hour doesn't working, don't know why
> > 
> > It seems to have jumped up quite considerably over a short period which
> > makes me think the underlying cause is something is getting stuck on
> > MacOS. Unfortunately it's hard to debug with just the logs because
> > whatever is taking the time might not be the last thing in the logs.
> > 
> > Having a time-per-test metric would be useful here.
> 
> Didn't Daniel post such a patch some weeks ago?

I posted a nasty hack for it, but Paolo has integrated nice support for
it into Meson git master

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


