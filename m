Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F832FCD26
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:11:03 +0100 (CET)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29W2-0006z7-VC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l29Ua-0006Qa-3B
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l29UY-0006uk-KM
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611133769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lf5sJC7ds55dJ4cYx1T7dpqScbmsNZtwLd/TuuF6QaQ=;
 b=NfPZmvPWhAMOgwKD8mwj4sGI5+V7UbUTprWylm0hVxR6Vowp5TNJthigG4zvt4Ay++wD9g
 HAyqTdcsqQxrjCVrgwRLuwudldsmsDs20jJbH/L1whQlecDKdfqlIEQJPhAaJVki4TsAtj
 64gCpBO53Ttk0sfeQ7IikIjdJ+kf1No=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-LQjzyGJ2NLi1SqF_Ls4CxA-1; Wed, 20 Jan 2021 04:09:27 -0500
X-MC-Unique: LQjzyGJ2NLi1SqF_Ls4CxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12F48015C4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:09:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A74B19CA8;
 Wed, 20 Jan 2021 09:09:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E675180039D; Wed, 20 Jan 2021 10:09:25 +0100 (CET)
Date: Wed, 20 Jan 2021 10:09:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 7/9] meson: Do not configure audio if system-mode is not
 selected
Message-ID: <20210120090925.qulsekntrjvbfp2d@sirius.home.kraxel.org>
References: <20210119185005.880322-1-philmd@redhat.com>
 <20210119185005.880322-8-philmd@redhat.com>
 <166ad408-aa3c-7050-d586-6893f80d3560@redhat.com>
MIME-Version: 1.0
In-Reply-To: <166ad408-aa3c-7050-d586-6893f80d3560@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +##########################################
> > +# Disable features only meaningful for system-mode emulation
> > +if test "$softmmu" = "no"; then
> > +    audio_drv_list=""
> > +fi
> > +

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> >  ##########################################
> >  # Some versions of Mac OS X incorrectly define SIZE_MAX
> >  cat > $TMPC << EOF
> > diff --git a/meson.build b/meson.build
> > index 575e34d88ac..e6c6d1518ef 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2425,7 +2425,9 @@
> >  # TODO: add back version
> >  summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
> >  summary_info += {'curl support':      curl.found()}
> > -summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
> > +if have_system
> > +  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
> > +endif

I guess there are alot more cfg options like that one.  virgl support
for starters ;)

So maybe group them in a block?

take care,
  Gerd


