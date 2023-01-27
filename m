Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0CE67E5B8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:49:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLO8w-0005Ph-Qv; Fri, 27 Jan 2023 07:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pLO8p-0005LX-O7
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:47:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pLO8n-0003FY-Rv
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674823656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ecE0R25oKoHuFJ943xyXf74QARuf5L2yVylSj9ySQ98=;
 b=N1C4u3XsW9uoliP8tfUw3ZamITm1oj3XQYSE0+uSx5Hjcp3UlhVktNBZvEE6+aFjJ2mWD+
 S0OWL42sJWS10jHFly8Qb9aZtj6GTjUpTIUkNM0RMMn3kc8tmq6nL11xW/opfZhs++TJ+t
 QLthYYXwPDTBlDq78J6r9RihXDTwRQY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-zqiXd18IN-C5-sw709oMJw-1; Fri, 27 Jan 2023 07:47:33 -0500
X-MC-Unique: zqiXd18IN-C5-sw709oMJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0BE9281DE79;
 Fri, 27 Jan 2023 12:47:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFBD2166B26;
 Fri, 27 Jan 2023 12:47:31 +0000 (UTC)
Date: Fri, 27 Jan 2023 12:47:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9PH4cGpzlYF9TkK@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
 <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
 <Y9PF7C29TNSuvz9o@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9PF7C29TNSuvz9o@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 27, 2023 at 01:39:08PM +0100, Kevin Wolf wrote:
> Am 26.01.2023 um 15:28 hat Peter Maydell geschrieben:
> > On Thu, 26 Jan 2023 at 14:25, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > Are you batching pull requests? I used that approach last release
> > > cycle. CI takes so long to run that I didn't want to run it for every
> > > pull request. Batching worked well overall.
> > 
> > No, I just do one test per pullreq. IME the CI is flaky
> > enough that I don't really want to batch it up, and it
> > isn't so slow that I build up a backlog of unprocessed
> > requests.
> 
> But obviously so slow that we've run out of minutes. It would be good if
> this didn't happen every month in the future.

Note that January has been an outlier because there was no pullreq
processing for 2 weeks due to holidays, so we were merging at a
somewhat higher rate than in previous months.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


