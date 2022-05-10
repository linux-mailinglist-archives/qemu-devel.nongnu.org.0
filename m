Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F3521417
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:43:48 +0200 (CEST)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noOHL-0004Vz-Tl
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noOCt-0002Jh-0f
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noOCq-0006yy-U7
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652182747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07SzcHX7SVwCX0Tv80u/e8Lx7J1KoQGdE3EhmI8KDh8=;
 b=TEV3q1magMJuND2KBHIWaCJJnpv37aql+dlzfA26q2eUFxH0mpkVRY02PdX8pZZdAiym6H
 EvhGT1cfqsCoQnkOmhYDn2c08hG7aqJDhGXf1VDfZrFhbHdEz9qmrEZV+zuaQuqY+si587
 1NRlkjbZObmG36UHsGEAKk2ZZ06Grz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-khJnI25sNGa4ZDmYUa8I6Q-1; Tue, 10 May 2022 07:39:05 -0400
X-MC-Unique: khJnI25sNGa4ZDmYUa8I6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8577D100BAAD
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:39:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1CA540CFD06;
 Tue, 10 May 2022 11:39:04 +0000 (UTC)
Date: Tue, 10 May 2022 12:39:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 1/8] qapi: golang: Generate qapi's enum types in Go
Message-ID: <YnpO1r2FgdMnbs6H@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-2-victortoso@redhat.com>
 <Yno5GC8Fs3ypv7MQ@redhat.com>
 <20220510111532.tm5cyljsxxnvk7l2@tapioca>
 <YnpKXf4fynWupiVC@redhat.com>
 <20220510112839.6cixyqovp2dciypv@tapioca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510112839.6cixyqovp2dciypv@tapioca>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 01:28:39PM +0200, Victor Toso wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 12:19:57PM +0100, Daniel P. Berrangé wrote:
> > > Marshalling does error if you try to convert an int that is not
> > > in the range of the enum type.
> > > 
> > > Unmarshalling should not error in this case, but the field ends
> > > up not being set which defaults to 0 (in this case,
> > > ShutdownCauseNone). That could mislead the *actual* reason but
> > > not without a warning which is expected in this case, imho.
> > > 
> > > (I know is not an actual warning, just a Println, but it'll be
> > > fixed in the next iteration)
> > 
> > I don't thinnk we should be emitting warnings/printlns at all
> > in this case though. The app should be able to consume the enum
> > without needing a warning.  If the app wants to validate
> > against a specific set of constants, it can decide to emit a
> > warning if there was a case it can't handle. We shouldn't emit
> > warnings/errors in the unmarshalling step though,as it isn't
> > the right place to decide on such policy.
> 
> I think it is useful to know that, a binary compiled to qapi-go
> 7.0 but running with qemu 7.1 would have some mismatches. It
> could help detect issues (e.g: Why my program doesn't know/show
> the reason for shutdown?).

If apps are actually looking at the shutdown reasons, it is
trivial for the app themselves to log any unexpected reasons.

They should in fact do that regardless, because if someone
re-compiles the app against a new version of the QEMU Go API,
there may be new ShutdownCause's defined that their codes does
not handle. There's no compile time check from Go side that
their code has handled all ShutdownCause values, since there's
no struct enum type in Go.  This again pushes me to towards
the view that the enums should just remain as strings, the use
of integers gives no functional benefit AFAICT, given the lack
of a real enum type in Go.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


