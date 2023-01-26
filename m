Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675A67CD82
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL35M-0008IM-9z; Thu, 26 Jan 2023 09:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL35J-0008I6-Iz
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:18:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL35E-00074F-35
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674742710;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=icAu4YmiyuUnaLN7Q7+q8Bxabp6PA+VW4FcVFLSQipE=;
 b=A3kWMGtkTZqepJoO+2DVxfypqkD6+5f9cbdPcbB4NYjn22E02uFRpWlnFfK2GIkqSF3SDY
 NQ4UU8shGoxuxSy/lX4q6cQ3ahWiyHp+Unr8tsbJRPc/7TzDhzqsuW4sRTqaOUZgI7eizT
 ya46Zf/AvuMfzKp7/g/ZDLWLcRpewZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-CSBzuzgCMjWZz_XLGPM1LQ-1; Thu, 26 Jan 2023 09:18:27 -0500
X-MC-Unique: CSBzuzgCMjWZz_XLGPM1LQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C61C33C16E8D;
 Thu, 26 Jan 2023 14:18:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAD82166B26;
 Thu, 26 Jan 2023 14:18:25 +0000 (UTC)
Date: Thu, 26 Jan 2023 14:18:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9KLr691LwO8WUgI@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9KFp06pp/qohgV1@invalid>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 01:52:39PM +0000, Eldon Stegall wrote:
> On Thu, Jan 26, 2023 at 01:22:32PM +0000, Peter Maydell wrote:
> > Hi; we've run out of gitlab CI pipeline minutes for this month.
> > This leaves us the choice of:
> >  (a) don't process any more pullreqs til we get more minutes in Feb
> >  (b) merge pullreqs blindly without CI testing
> >  (c) buy more minutes
> > 
> > For the moment I propose to take option (a). My mail filter will
> > continue to track pullreqs that get sent to the list, but I won't
> > do anything with them.
> > 
> > If anybody has a better suggestion feel free :-)
> 
> Would it be possible if (d) were to run self-hosted instances of the
> runner? I am not sure how gitlab pricing works, but I believe on github
> self-hosted runners are free.
> 
> I have several baremetal machines colocated that I could dedicate to
> execute these runs, dual processor xeons with a couple hundred gigs of
> RAM. I would need approx 48 hours notice to initially provision the
> machines. I would be happy to provide root credentials and work out IPMI
> access if that becomes necessary.

We do currently have some private runners registered against the
/qemu-project namespace, so we can do some non-x86 native testing.

The challenge is the integration and configuration. The GitLab CI
YAML config rules need to be written such that specific jobs  get
targetted for the right private runners, instead of the shared
runners, by including the 'tags' element in the job config, and
some 'rules' logic.

Any job we switch to work against private runners though, now become
inaccessible to our contributors who are running pipelines in their
forks, because the tags we add won't match against public shared
runners. So we'd be putting a burden on our contributors to run
private runners two, which is not desirable.

The alternative is to duplicate all our jobs, once for private
runners and once for shared runners. It is a bit repetative but
with job inheritance it isn't a 100% copy+paste job, just about
20-30% tedious boilerplate perhaps.

eg


avocado-system-debian:
  extends: .avocado_test_job_template
  needs:
    - job: build-system-debian
      artifacts: true
  variables:
    IMAGE: debian-amd64
    MAKE_CHECK_ARGS: check-avocado

would have to be replaced with


.avocado-system-debian_base:
  extends: .avocado_test_job_template
  needs:
    - job: build-system-debian
      artifacts: true
  variables:
    IMAGE: debian-amd64
    MAKE_CHECK_ARGS: check-avocado

avocado-system-debian-shared:
  extends: .avocado-system-debian_base
  rules:
    - if '$CI_PROJECT_NAMESPACE == "qemu-project"'
      when: never
    - if '$CI_PROJECT_NAMESPACE != "qemu-project"'
      when: on_success

avocado-system-debian-private:
  extends: .avocado-system-debian_base
  tags:
    - qemu-private-runner-x86
  rules:
    - if '$CI_PROJECT_NAMESPACE == "qemu-project"'
      when: on_success
    - if '$CI_PROJECT_NAMESPACE != "qemu-project"'
      when: never


there's many variations, that's just a crude example off top of my head.
This example wouldn't work if the base project incldues 'rules' as the
parent rules don't get merged. So actually we would need to play some
further games to get this to work in most cases.

Anyway, private runners are potentially useful, especially if this becomes
a long term problems for QEMU. They just aren't a quickly insertable
solution we can deploy in a matter of days, as we need much YML config
work first AFAICT.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


