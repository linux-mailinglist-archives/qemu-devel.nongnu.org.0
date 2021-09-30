Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8741D80C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:47:58 +0200 (CEST)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVtbY-0001UX-ML
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVtZp-0000OF-LT
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVtZj-00031C-6K
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632998761;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IGxM50wwKLvsFEfOXo4OdS1uLTFIr3aqTK8eB+GEpwA=;
 b=JYd1Y4UE8tm3JJncbpjC61FpTSEnUqPrKvduVrSnIwuhoFiN6zwNPvegOMyDHeVYnWPGOt
 GMM3d4lbE5JnnRF7aICM+dZr3su/xeagdyBS2p6oEePiHTy7qOQxb7UWwoNbKA7BnAivTE
 GOGXETEaohds8vez0hFtc2BkRVeF8rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-ZrxODbb0P7irZxEcTdTcvA-1; Thu, 30 Sep 2021 06:45:59 -0400
X-MC-Unique: ZrxODbb0P7irZxEcTdTcvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 490161808324;
 Thu, 30 Sep 2021 10:45:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3646660BE5;
 Thu, 30 Sep 2021 10:45:14 +0000 (UTC)
Date: Thu, 30 Sep 2021 11:45:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Rust in Qemu BoF followup 2: Rust toolchain availability
Message-ID: <YVWVNxKQVEQflD0d@redhat.com>
References: <YVUaDrf5BXPkZu5r@yekko>
MIME-Version: 1.0
In-Reply-To: <YVUaDrf5BXPkZu5r@yekko>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: peter.maydell@linaro.org, emaste@freebsd.org, slp@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, sgarzare@redhat.com, alex.bennee@linaro.org,
 imp@bsdimp.com, brad@comstyle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 11:59:42AM +1000, David Gibson wrote:
> Hi again all,
> 
> I've now done.. or at least started... the second part of my followup
> from the KVM Forum BoF on Rust in Qemu.
> 
> I've extended the page at https://wiki.qemu.org/RustInQemu with
> information on Rust toolchain availability.  However, I found I had a
> lot more open questions on this one, so there are quite a lot of gaps.
> 
> In particular:
>  * I haven't so far figured out how to definitively check package
>    information for RHEL & SLES (they're not covered by repology, and
>    RHEL module structure confuses me, even as a RedHatter)

Don't worry about RHEL/SLES directly wrt repology.

For RHEL, just use corresponding CentOS as a proxy

For SLES, just use corresponding openSUSE version as a proxy

>  * I'm not at all sure what criteria to use to consider something as
>    having "good enough" rustup support, so that information is all
>    blank so far
>  * I've taken a bit of a stab in the dark about what Rust version is
>    recent enough for our purposes (1.31.0).  I strongly suspect we're
>    going to want to move that to something more recent, but I don't
>    know what, which will mean revising a bunch of stuff

Our platform support matrix defines what distros we target.

IOW we would have a strong preference for a rust version that is present
in those distros. Essentially tests/docker/dockerfiles/*.Dockerfile
need to be able to pull in the rust packages from the distro, if
we are to make it mandatory.

If rust is to be strictly optional, then we have way more flexibility
in choosing the version. We do not need to cover all distros in the
support matrixk *provided* the rust is only used for new functionality
and we're not introducing it as a dependancy for existing functionality.

ie existing features previously released must keep working across all
distros in the matrix. new features from a release can set a higher
bar, since by definition it can't regress existing usage.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


