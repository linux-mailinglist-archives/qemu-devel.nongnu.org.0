Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB958D5B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:52:58 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKyu-0000e4-Cm
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oLKwb-0006Wk-4t
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oLKwY-0002ig-4X
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660035029;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KEdFCfvctTSSpGeBMRCfYqFHNfSFJ/5MuwvP+VhkeX4=;
 b=PSBQlQvtE7PZPk2oYNh29heu8ySoVFyL3KfMNry0/e/jj68xkrvwEoOlcV7j/kfj9etopU
 CTnOj7085g8o1LBBUez1IZ8Ktke5hF6WP5AlQfB4rKpg0ae1fhmGWuiEsWInhaSG+JeAYb
 wSQCZzzcJMBXg/yTsmSu/+AxVSET9GQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-DBI9nt5dOvCV2k13_tvNQg-1; Tue, 09 Aug 2022 04:50:26 -0400
X-MC-Unique: DBI9nt5dOvCV2k13_tvNQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD9868115B1;
 Tue,  9 Aug 2022 08:50:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05972140EBE3;
 Tue,  9 Aug 2022 08:50:24 +0000 (UTC)
Date: Tue, 9 Aug 2022 09:50:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: how long do we need to retain gitlab CI job stdout logs?
Message-ID: <YvIfzm+GWSEY28mO@redhat.com>
References: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
 <536c6605-fd29-dbca-8633-944656e6dc8e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <536c6605-fd29-dbca-8633-944656e6dc8e@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Aug 08, 2022 at 08:42:28PM +0200, Thomas Huth wrote:
> On 08/08/2022 19.47, Peter Maydell wrote:
> > Hi; I just reduced QEMU's storage usage on gitlab by 130GB (no typo!)
> > using https://gitlab.com/eskultety/gitlab_cleaner, which Dan helpfully
> > pointed me at. This script removes old pipelines, which take up a
> > lot of storage space for QEMU because they include the stdout logs
> > for all the CI jobs in the pipeline. (Gitlab doesn't expire these,
> > either by default or configurably -- you have to either manually delete
> > the pipeline in the UI or else use the API, as this script does.)
> > 
> > I somewhat conservatively only blew away pipelines from before the
> > 1st January 2022. I feel like we don't really even need 6 months worth
> > of CI job logs, though -- any views on whether we should be pruning
> > them more aggressively ?
> 
> I'd say we should at least keep the logs of the last 4 to 5 months, i.e. the
> logs for one release cycle, so we can check these logs in case we introduced
> a new bug in the current release cycle.

Have we ever actually done this in practice ?  I don't think I've ever
looked at a pipeline older than 1-2 weeks in any project I've worked
with on gitlab.

Note that we currently use 165 GB, over an 8 month period (not sure on
the split between container registry and pipeline). I'd guess 4-5 months
might knock another 30-40 GB off our usage, still leaving it huge.

Personally I would suggest 1 month is sufficent for 99% of our needs.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


