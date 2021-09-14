Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE240A917
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:23:39 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3j8-0003KP-8L
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ3hN-0001Rc-TO
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ3hL-0006rb-TZ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631607706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N7D69fSKTJxQi5XuFhWpDyIEjXn9LT9qPAky9dPqF4=;
 b=iI8x5CHBAr1g+eh8NAWdJyI3keDOwdrVKdAXozKJvl2wd31RJcwpGg7fwC4wx0+Y3EaLX6
 YrE5TdromWMoFpoCnYbKzx/wj1+6uKqktu259Oltlbg9qr2FGlYnBdSgNvd2g55HNiwHv4
 0F35NV5FQHvVLWcJeM8tp9YBNaGJZ+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Ez4HK6LNN1maRwrMLnPg6g-1; Tue, 14 Sep 2021 04:21:38 -0400
X-MC-Unique: Ez4HK6LNN1maRwrMLnPg6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8599B1084683
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:21:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B1F5D9CA;
 Tue, 14 Sep 2021 08:21:36 +0000 (UTC)
Date: Tue, 14 Sep 2021 09:21:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
Message-ID: <YUBbjbJwpcpxjDmt@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
 <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 07:17:11AM +0200, Thomas Huth wrote:
> On 13/09/2021 20.29, Philippe Mathieu-Daudé wrote:
> > Without the webrick bundle, jekyll fails to start:
> > 
> >    $ bundle exec jekyll serve
> >    Ignoring ffi-1.11.1 because its extensions are not built. Try: gem pristine ffi --version 1.11.1
> >    Configuration file: qemu-web/_config.yml
> >                Source: qemu-web
> >           Destination: qemu-web/_site
> >     Incremental build: disabled. Enable with --incremental
> >          Generating...
> >           Jekyll Feed: Generating feed for posts
> >                        done in 0.686 seconds.
> >     Auto-regeneration: enabled for 'qemu-web'
> >                        ------------------------------------------------
> >          Jekyll 4.0.1   Please append `--trace` to the `serve` command
> >                         for any additional information or backtrace.
> >                        ------------------------------------------------
> >    qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in `require': cannot load such file -- webrick (LoadError)
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in `<top (required)>'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in `require_relative'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in `setup'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:100:in `process'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `block in process_with_graceful_fail'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `each'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `process_with_graceful_fail'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:86:in `block (2 levels) in init_with_program'
> >            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `block in execute'
> >            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `each'
> >            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `execute'
> >            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/program.rb:42:in `go'
> >            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary.rb:19:in `program'
> >            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/exe/jekyll:15:in `<top (required)>'
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >   Gemfile | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/Gemfile b/Gemfile
> > index 6a7852e..dc35cb7 100644
> > --- a/Gemfile
> > +++ b/Gemfile
> > @@ -25,3 +25,5 @@ end
> >   # for https://github.com/sass/sassc-ruby/issues/146
> >   gem "sassc", ">= 2.2.1"
> > +
> > +gem "webrick", "~> 1.7"
> 
> Daniel, is this fixing the jekyll problem for you, too?
> 
> I'm still on ruby 2.5.9 where this does not occur yet... might be good to
> mention that this is a new problem with ruby 3.0 in the cover letter.

Yes, this is needed to fix Ruby 3.

I didn't propose it myself as I'm not sure if it in turn breaks people
with Ruby 2.x ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


