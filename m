Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E94B6E37
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:59:12 +0100 (CET)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyMJ-0003iw-8b
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJyF7-0001vA-2o
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJyF4-0001EJ-27
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644933100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoHVAL53C7cx571uxEVQqJhMVRCNVZmBnl8H7pvuEsE=;
 b=GUIhkwzWPGZvvy6xMRc+EX9PTKxNVAeqMIj/mRNUxDP8wNJzpMytjKJogOShNWjEycI6RC
 kfkwjIuSyFTvIdXd6Ib5d21WyshVcs1bLuVNMfjyCejkr3IE9u8PIEmoMb7PIEoPCgJ5hf
 MJ79fOLIIZd+1Q/ES6yhQ65/+2yUoX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-W57TuOEjO02gQgbwcrjYWQ-1; Tue, 15 Feb 2022 08:51:34 -0500
X-MC-Unique: W57TuOEjO02gQgbwcrjYWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF1E100CCC0;
 Tue, 15 Feb 2022 13:51:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.196.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B70C74D73D;
 Tue, 15 Feb 2022 13:51:31 +0000 (UTC)
Date: Tue, 15 Feb 2022 13:51:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
Message-ID: <Yguv4PfwuoUE/Kio@redhat.com>
References: <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
 <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
 <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
 <20220211161410.sbxfy7tf7patm25i@redhat.com>
 <e5d38a7d-93a2-beb9-c621-838c8ed43231@redhat.com>
 <804188e2-6426-6fe2-f8c3-70316e5c7c44@redhat.com>
MIME-Version: 1.0
In-Reply-To: <804188e2-6426-6fe2-f8c3-70316e5c7c44@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 02:28:24PM +0100, Thomas Huth wrote:
> On 11/02/2022 17.48, Thomas Huth wrote:
> > On 11/02/2022 17.14, Eric Blake wrote:
> > > On Tue, Feb 08, 2022 at 03:52:19PM +0100, Thomas Huth wrote:
> > > > > > The current code with $SED has been introduced almost three years
> > > > > > ago already...
> > > > > > 
> > > > > > >    Can’t we just do `alias sed=gsed`?
> > > > > > 
> > > > > > Maybe ... but let's ask Philippe and Kevin first, who Signed-off
> > > > > > commit bde36af1ab4f476 that introduced the current way with $SED:
> > > > > > What's your opinion about this?
> > > > > 
> > > > > This commit was to have check-block working on the OpenBSD VM image.
> > > > 
> > > > Sure. The question was whether using an alias as suggested by Hanna would be
> > > > nicer instead of using $SED ?
> > > 
> > > Scripting with aliases becomes a nightmare to debug, since it is
> > > relatively uncommon.  In particular, in bash, you have to explicitly
> > > opt in to using aliases (contrary to POSIX sh where aliases are
> > > available to scripts at startup).
> > 
> > shopt -s expand_aliases
> > ... as I just learnt the hard way ;-)
> > 
> > > Using $SED everywhere may require
> > > more hunting, but it is more obvious when reading a test that "oh
> > > yeah, I might be using extensions that the default 'sed' can't
> > > support" than a script that blindly uses 'sed' and depends on it
> > > aliasing to a more-capable sed at a distance.
> > > 
> > > The other question is how many GNU sed features are we actually
> > > depending on?  Which tests break if we have BSD sed or busybox sed?
> > > Can we rewrite those sed scripts to avoid GNU extensions?  But
> > > auditing for s/sed/$SED/ seems easier than auditing for which
> > > non-portable sed extensions we depend on.
> > 
> > The most obvious part are the filter functions in common.filter - we're
> > using "-r" here that is not part of the POSIX sed as far as I can see.
> 
> Now that I stepped through the list, the other major part that is failing on
> non-GNU seds are the statements that use "\r" or "\n" or "\e" to replace
> special characters. That seems to be a non-POSIX extension, too.
> 
> But for running with Alpine, there is also the additional problems that the
> libc uses slightly different error strings, e.g. "I/O error" instead of
> "Input/output error", see e.g.:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/2094869856
> 
> Maybe it could be fixed with some extensions to the filters, but I'm not
> sure whether we really want to go down that road...?

AFAIK, errno strings are not standardized by POSIX, so I presume this
problem will apply to running I/O tests on any non-Linux system too.

With this in mind I think we should consider what a portable solution
looks like. We can't simply match the Alpine strings and turn them
into GLibC strings, as that does nothing to help portability on *BSD,
macOS, Windows, etc. We would need to figure out how to blank out
arbitrary input error message strings.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


