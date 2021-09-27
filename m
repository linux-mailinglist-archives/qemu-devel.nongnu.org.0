Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A64190AF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 10:23:31 +0200 (CEST)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUlv8-00043R-Dh
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 04:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUltX-00037b-1g
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUltU-00041p-8U
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632730906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/R8kqlYhlu82PRSBgTOTW3K3jcrhkoHOaEEzxufjklY=;
 b=dNdDsFwGjgKQzPWrWheRrUYUh0QHaeKSN6KI+9yg8l8PhXOd0L6vwpD8nh12g4KMp24DvG
 w7dqSIQIY9lhvAXyr2Dp4Xz4wZ28yzTi8trEA1z2uSTQdELZYYUi3bdR8Dnm6+/LqdhufM
 L5hdqf3U851/bHR3OO5huY2eWaoLID8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-fsvRGpDfO76XoEgOsXu9Cw-1; Mon, 27 Sep 2021 04:21:41 -0400
X-MC-Unique: fsvRGpDfO76XoEgOsXu9Cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2604824FA7;
 Mon, 27 Sep 2021 08:21:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7077760C13;
 Mon, 27 Sep 2021 08:21:36 +0000 (UTC)
Date: Mon, 27 Sep 2021 09:21:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Message-ID: <YVF/DThb+Yq8/dd1@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
 <e2d47803-87ab-f48b-0947-70d99f3996be@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e2d47803-87ab-f48b-0947-70d99f3996be@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 10:15:43AM +0200, Paolo Bonzini wrote:
> On 24/09/21 11:04, Kevin Wolf wrote:
> > We want to switch both from QemuOpts to the keyval parser in the future,
> > which results in some incompatibilities, mainly around list handling.
> > Mark the non-JSON version of both as unstable syntax so that management
> > tools switch to JSON and we can later make the change without breaking
> > things.
> 
> Maybe we need a different section for unstable syntaxes, rather than
> overloading deprecated.rst?

This case feels like it hits two scenarios - we want to declare it
unstable, which is something we should document in qemu-options.hx.
We want to also to warn of specific breakage when the impl changes
which is something suitable for deprecations.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


