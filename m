Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F931F96F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:34:46 +0100 (CET)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4zd-0006ak-Em
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4aW-0003tQ-2G
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4aQ-0003h0-2i
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736521;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vAHRuEORLHM61rIEufPvRi9wdhiNzNf3OtSyb0CRUk=;
 b=Fiiun66YYFWrnCfLCPg3VF7HrJBuemJds1ey9YnRdWiDiBzM90CJBCntxsVomFGK7QbFmm
 xeojt/H8WKufEMRzyiAHv4cPuISbGoDVzNWOvDzH5sQZsfZkPA2GEMDNIO+7p0oAHXaoA3
 dolmkkurSlP3HASfZnyP9VwJa6v2S3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-YLATs4G5OMKxSpvU4NyTtg-1; Fri, 19 Feb 2021 07:08:37 -0500
X-MC-Unique: YLATs4G5OMKxSpvU4NyTtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D481801965;
 Fri, 19 Feb 2021 12:08:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C69E76085D;
 Fri, 19 Feb 2021 12:08:34 +0000 (UTC)
Date: Fri, 19 Feb 2021 12:08:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
Message-ID: <YC+qPxXExZgXS/qO@redhat.com>
References: <20210219110950.2308025-1-thuth@redhat.com>
 <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
MIME-Version: 1.0
In-Reply-To: <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 01:00:21PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/19/21 12:09 PM, Thomas Huth wrote:
> > We're building a lot of containers in the gitlab-CI that we never use.
> > This takes away network bandwidth and CPU time from other jobs for no
> > use, so let's remove them for now. The individual containers could be
> > re-added later when we really need them.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  .gitlab-ci.d/containers.yml | 92 -------------------------------------
> >  1 file changed, 92 deletions(-)
> 
> I'm not enthusiast with this patch because I use various in this list
> from time to time for testing or cross build/disas binaries. Not having
> these containers used mainstream probably show the failure of the
> project to add good testing coverage on these targets. Most of them are
> for hobbyist with little time. Removing them will make it even harder
> to add tests. Can't we keep them disabled? Or put them in manual mode?
> 
> Why is the CI rebuilding them, shouldn't them be cached or pulled from
> the registry?

Even using the cache still takes a few minutes of execution time.

> Maybe this show having all them in the same containers.yml file is not
> good enough? Any suggestion for splitting it, so lowly used containers
> don't get rebuild every time another often used one change the YAML
> file?

IMHO they just need to be marked as manual triggered jobs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


