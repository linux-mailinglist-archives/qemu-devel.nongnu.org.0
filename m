Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57ED39B516
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:44:27 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5RK-0002QH-PB
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lp5Qc-0001gd-UV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lp5QR-0004lW-9E
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622796210;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bqUxY00nsR15pI8fAD3wucuWcrinilgJqZLzg+Uz4w=;
 b=Ra/+gskLKuBrADN21te3J3BAv3Paxi2r/ADVbjkD7QLMF0AgUj+yEwnFuGlmCkmzYbMMoh
 dSTTeFI8o88Tjs0O0bLqfTYVrGNK7vd+n7xnLPEKt9oDzm4a3A/XRdlerGeJNb+yaZP1Vo
 FJVJ9AtCRlyqfgslSBeZWsuvLKLf01o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-Jf_MoOP2PWmhz6F6i0eciQ-1; Fri, 04 Jun 2021 04:43:26 -0400
X-MC-Unique: Jf_MoOP2PWmhz6F6i0eciQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578EE107ACE3
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 08:43:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-239.ams2.redhat.com [10.36.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB6A5D9CC
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 08:43:24 +0000 (UTC)
Date: Fri, 4 Jun 2021 09:43:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] docs: add user facing docs for secret passing and
 authorization controls
Message-ID: <YLnnqWIyNnO7V5+C@redhat.com>
References: <20210514173110.1397741-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514173110.1397741-1-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for any reviewers for docs

On Fri, May 14, 2021 at 06:31:06PM +0100, Daniel P. Berrangé wrote:
> These are an important of the overall QEMU network backend security
> controls but never previously documented aside from in blog posts.
> 
> Daniel P. Berrangé (4):
>   docs: document how to pass secret data to QEMU
>   docs: document usage of the authorization framework
>   docs: recommend SCRAM-SHA-256 SASL mech instead of SHA-1 variant
>   sasl: remove comment about obsolete kerberos versions
> 
>  docs/system/authz.rst        | 263 +++++++++++++++++++++++++++++++++++
>  docs/system/index.rst        |   2 +
>  docs/system/secrets.rst      | 162 +++++++++++++++++++++
>  docs/system/vnc-security.rst |   7 +-
>  qemu.sasl                    |  15 +-
>  5 files changed, 437 insertions(+), 12 deletions(-)
>  create mode 100644 docs/system/authz.rst
>  create mode 100644 docs/system/secrets.rst
> 
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


