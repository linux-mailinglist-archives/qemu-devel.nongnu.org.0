Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F12CD2C7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:45:12 +0100 (CET)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklAl-0002n5-Pk
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkl9j-0002H2-Ux
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:44:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkl9i-0002CK-0m
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606988644;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rI7idaDTf6nwyZg+8GM6w2E741W9t+ow41acyzSlIn4=;
 b=TO00O7Xqz7Ty7zgAbO1zuRWHM7PFJKG6cYCrZ6HEfpkw7OAi5hTyTJGLBAhSqTYyy5m3Rx
 pmyqb/xiaTCpf+PySzQ8THV6srJ+FZXNfZZg62XCk8UOSWjytree/R8UoocyW6TRcoQwTK
 6A5l6Lb9qJAlBjDFW2rJmMSRLJsHJ+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Rfjl_KMsP6SxrGlvZMWrJg-1; Thu, 03 Dec 2020 04:44:02 -0500
X-MC-Unique: Rfjl_KMsP6SxrGlvZMWrJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EDE5108E1A1;
 Thu,  3 Dec 2020 09:44:01 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6068960854;
 Thu,  3 Dec 2020 09:43:54 +0000 (UTC)
Date: Thu, 3 Dec 2020 09:43:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
Message-ID: <20201203094351.GB2952498@redhat.com>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <20201202123418.GH2360260@redhat.com>
 <15934ps9-4so0-p464-s473-3sps7s652021@erqung.pbz>
MIME-Version: 1.0
In-Reply-To: <15934ps9-4so0-p464-s473-3sps7s652021@erqung.pbz>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:32:44AM +0530, P J P wrote:
> +-- On Wed, 2 Dec 2020, Daniel P. Berrangé wrote --+
> | > +    - If issue is found to be less severe, an upstream public bug (or an
> | > +      issue) will be created immediately.
> | 
> | No need to repeat "or an issue". I think it would read more clearly as
> | 
> |    - If the severity of the issue is sufficiently low, an upstream public bug
> |      may be created immediately.
> 
> * Let's settle on public GitLab issues, shall we? 
> 
> * Tomorrow after an issue triage if someone asks where should they create a 
>   public tracker, it's better to have one definite answer, instead of choose 
>   either LaunchPad or GitLab issues.
> 
> * OR is it better to have both? ie. file a public tracker anywhere as per ones 
>   convenience?
> 
> * One GitLab is good I think.

Just link to the page where QEMU documents its bug tracker. That is
current laucnhpad, but may change to Gitlab. The security docs don't
need to mention the specific host, if we just link to the bugs page.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


