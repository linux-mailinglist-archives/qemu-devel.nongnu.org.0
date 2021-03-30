Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E434E84C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:04:27 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRE2j-0005a4-Mu
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRE1C-0004kO-Ki
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRE11-0007ln-1A
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617109356;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yK6KBXlZW8dgDeoovng5may0JUPLQq6FTiSFum1c6I0=;
 b=AC6JJf+abkY3+MO3fZK/ATl7zeFT4E8eL1jaVIXFA7dPLUtWVIO4dVbfqJYy/gDBiV2kYY
 Z85Ea4izFezOvmUIEs0u1COKe6NUnnUE0qVLadk8ffMXS+vbPMo9r5HyjcMneXa4gzuroA
 olLfKUbkpAesnTi+XGp5FtlTFk8rUfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-LbHaMnIJP1W2FC_y5eAHsA-1; Tue, 30 Mar 2021 09:02:20 -0400
X-MC-Unique: LbHaMnIJP1W2FC_y5eAHsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A5188127C;
 Tue, 30 Mar 2021 13:02:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8F71B5FE;
 Tue, 30 Mar 2021 13:02:12 +0000 (UTC)
Date: Tue, 30 Mar 2021 14:02:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
Message-ID: <YGMhUTUXJBM3BcW5@redhat.com>
References: <20210330090806.2802667-1-thuth@redhat.com>
 <c8cc80d5-51f8-9c35-ad98-1eac0d164be6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c8cc80d5-51f8-9c35-ad98-1eac0d164be6@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 12:53:04PM +0200, Paolo Bonzini wrote:
> On 30/03/21 11:08, Thomas Huth wrote:
> >   I've picked the Django Code of Conduct as a base, since it sounds rather
> >   friendly and still welcoming to me, but I'm open for other suggestions, too
> >   (but we should maybe pick one where the conflict resolution policy is
> >   separated from the CoC itself so that it can be better taylored to the
> >   requirements of the QEMU project)
> 
> It turns out that the Django CoC is ultimately based on the Fedora CoC,
> so I tried using https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> as an inspiration for what can be cut. Here is the outcome:
> 
> -----
> The QEMU community is made up of a mixture of professionals and
> volunteers from all over the world. Diversity is one of our strengths,
> but it can also lead to communication issues and unhappiness.
> To that end, we have a few ground rules that we ask people to adhere to.
> 
> * Be welcoming. We are committed to making participation in this project
>   a harassment-free experience for everyone, regardless of level of
>   experience, gender, gender identity and expression, sexual orientation,
>   disability, personal appearance, body size, race, ethnicity, age, religion,
>   or nationality.
> 
> * Be respectful. Not all of us will agree all the time.  Disagreements, both
>   social and technical, happen all the time and the QEMU community is no
>   exception. When we disagree, we try to understand why.  It is important that
>   we resolve disagreements and differing views constructively.  Members of the
>   QEMU community should be respectful when dealing with other contributors as
>   well as with people outside the QEMU community and with users of QEMU.
> 
> Harassment and other exclusionary behavior are not acceptable. A community
> where people feel uncomfortable or threatened is neither welcoming nor
> respectful.  Examples of unacceptable behavior by participants include:
> 
> * The use of sexualized language or imagery
> 
> * Personal attacks
> 
> * Trolling or insulting/derogatory comments
> 
> * Public or private harassment
> 
> * Publishing other's private information, such as physical or electronic
> addresses, without explicit permission
> 
> This isn't an exhaustive list of things that you can't do. Rather, take
> it in the spirit in which it's intended—a guide to make it easier to
> be excellent to each other.
> 
> This code of conduct applies to all spaces managed by the QEMU project.
> This includes IRC, the mailing lists, the issue tracker, community
> events, and any other forums created by the project team which the
> community uses for communication. This code of conduct also applies
> outside these spaces, when an individual acts as a representative or a
> member of the project or its community.

I really don't like this last sentance. The qualifier

  ', when an individual acts as a representative or member...'

is opening up a clear loophole to escape consequences under the
QEMU CoC.

Consider someone is kicked out from another project for violation
of that project's CoC, that would also be considered a violation
under QEMU's CoC. This qualifier is explicitly stating that the CoC
violation in the other project has no bearing on whether that
person can now start participating in QEMU. I think that's a bad
mixed message we're sending there. It is especially poor if the
victim from the other project is also a QEMU contributor.

The wording Thomas' draft has

  In addition, violations of this code outside these spaces may
  affect a person's ability to participate within them.

doesn't require QEMU to take action. It just set a statement
of intent that gives QEMU the freedom to evaluate whether it is
reasonable to take action to protect its contributors, should a
contributor wish to raise an issue that occurred outside QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


