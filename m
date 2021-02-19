Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A331FAF7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:36:05 +0100 (CET)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6t1-0003J6-OD
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lD6rx-0002mX-Sc
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lD6rJ-0006x1-BF
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613745253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9lRtb4GZBsaBb6qyCheAhQ6LJILooOThp3v+RkjG7LQ=;
 b=SB6UY92d5HnOhwStwvRjIL1UIRTfSZixIB2ZSTXELghw//W0hqxp0DhvgUPU0+8Q1FP18i
 9oWw6WKAnSYcS8DehPNPK5BYoBMMvfBgv1SgnOGb3GuBEy/mu+Iuy2biXXSbcubT6JHvMc
 M4zq0U/Tj++AbJWu9r+Ig7vw/TXAe4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-2I_U3I-MM0SeuISaQIZieA-1; Fri, 19 Feb 2021 09:34:11 -0500
X-MC-Unique: 2I_U3I-MM0SeuISaQIZieA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C0A801975;
 Fri, 19 Feb 2021 14:34:10 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-220.rdu2.redhat.com [10.10.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063B91971D;
 Fri, 19 Feb 2021 14:34:03 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 78BED22054F; Fri, 19 Feb 2021 09:34:03 -0500 (EST)
Date: Fri, 19 Feb 2021 09:34:03 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Luis Henriques <lhenriques@suse.de>
Subject: Re: [PATCH v2 0/3] virtiofsd: Add options to enable/disable posix acl
Message-ID: <20210219143403.GA3270@redhat.com>
References: <20210217233046.81418-1-vgoyal@redhat.com> <87pn0wgtsx.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87pn0wgtsx.fsf@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 11:50:54AM +0000, Luis Henriques wrote:
> Vivek Goyal <vgoyal@redhat.com> writes:
> 
> > Hi,
> >
> > This is V2 of the patches. Changes since v1 are.
> >
> > - Rebased on top of latest master.
> > - Took care of Miklos's comments to block acl xattrs if user
> >   explicitly disabled posix acl.
> >
> > Luis Henriques reported that fstest generic/099 fails with virtiofs.
> > Little debugging showed that we don't enable acl support. So this
> > patch series provides option to enable/disable posix acl support. By
> > default it is disabled.
> >
> > I have run blogbench and pjdfstests with posix acl enabled and
> > things work fine.
> >
> > Luis, can you please apply these patches, and run virtiofsd with
> > "-o posix_acl" and see if it fixes the failure you are seeing. I
> > ran the steps you provided manually and it fixes the issue for
> > me.
> 
> Sorry for the delay.  I've finally tested these patches and they indeed
> fix the problem I reported.  My only question about this fix is why is
> this option not enabled by default, since this is the documented behavior
> in acl(5) and umask(2)?  In fact, why is this an option at all? 

You mean why to not enable acl by default?

I am concerned about performance drop this can lead to because extra
GETXATTR(system.posix_acl_*) messages which will trigger if acls are enabled.
And not all users might require these. That's why I preferred to not enable
acl by default. Those who need it can enable it explicitly.

Another example is xattr support. Due to performance concerns, we don't
enable xattrs by default either.

Thanks
Vivek


