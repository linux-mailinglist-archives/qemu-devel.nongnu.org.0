Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225D3440D3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:24:13 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJbQ-0005kf-Ee
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOJSS-0001PY-2l
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOJSP-0000Ij-Ez
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616415292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0VAWSoXSKWJHU7LtdzdaW6lx+cf/p8inwrxROoKmb0=;
 b=gVWdHY/9/Jx2zkOiEYS/DBKtWvEfMBONXl6ZWwXMR7qByMkwoxHoTvR1zUq3VzMbuMWJ7l
 o7E1C0is2kNq3y5zkcney0ENXe3fuBlq/OvjGBEPFeVx2xH/iEQ4L265n8dv+aLB6UO5/v
 Oxbjv2cLhMcWiQFXat1LriD0jpiiGcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-rjau2_fENF6LmHeEsWZ24g-1; Mon, 22 Mar 2021 08:14:48 -0400
X-MC-Unique: rjau2_fENF6LmHeEsWZ24g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8DAE871377;
 Mon, 22 Mar 2021 12:14:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 609CF5D742;
 Mon, 22 Mar 2021 12:14:42 +0000 (UTC)
Date: Mon, 22 Mar 2021 12:14:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
Message-ID: <YFiKL6AwirjdgSWM@redhat.com>
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <CAMxuvaxZfpSS-5+_hbUjQ78u253FkEi+BiZAVn=YOV7RugzB0w@mail.gmail.com>
 <CAMxuvazgQ1HGt459VstXB90A3ODD0n1oCFr2oRw7BvspOYdcKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvazgQ1HGt459VstXB90A3ODD0n1oCFr2oRw7BvspOYdcKw@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 03:34:23PM +0400, Marc-André Lureau wrote:
> On Mon, Mar 22, 2021 at 2:59 PM Marc-André Lureau <
> marcandre.lureau@redhat.com> wrote:
> 
> > Hi
> >
> > On Mon, Mar 22, 2021 at 2:52 PM <marcandre.lureau@redhat.com> wrote:
> >
> >> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >>
> >> The default "alabaster" sphinx theme has a couple shortcomings:
> >> - the navbar moves along the page
> >> - the search bar is not always at the same place
> >> - it lacks some contrast and colours
> >>
> >> The "rtd" theme from readthedocs.org is a popular third party theme used
> >> notably by the kernel, with a custom style sheet. I like it better,
> >> perhaps others do too. It also simplify "Edit on Gitlab" links.
> >>
> >> Tweak a bit the custom theme to match qemu.org style, use the
> >> QEMU logo, and favicon etc.
> >>
> >> Screenshot:
> >>
> >> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-documentation-QEMU-documentation.png
> >
> >
> > Sorry, this link is outdated now. Here is a more stable one:
> >
> > https://elmarco.fedorapeople.org/Screenshot_2021-03-22%20Welcome%20to%20QEMU%e2%80%99s%20documentation%20%e2%80%94%20QEMU%20documentation.png
> >
> >
> What about simplifying the various section titles?
> https://elmarco.fedorapeople.org/Screenshot_2021-03-22%20Welcome%20to%20QEMU%e2%80%99s%20documentation%20%e2%80%94%20QEMU%20documentation(1).png

I think that makes sense, now that we have everything merged
into one doc, and certainly makes the nav look nicer.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


