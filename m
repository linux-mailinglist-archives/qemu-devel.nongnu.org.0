Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624A44D87E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:44:12 +0100 (CET)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBJD-0000q1-5m
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:44:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlBDC-0000Qx-SF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlBD8-0001k9-QL
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrAEdFTO/8z067i/xFYKgnPcpvkpSH2jh2lLYBjX2MM=;
 b=IWh6OR5QPRP0fMXyp/X2ulgfRETWXwyCDIGhhmf34/r67Jj0B7eqjDaQR3dveqj2/LoGwl
 Mlz/7NSeI0TeRI+lOr8d9rRXgHIV6XPdZt6AX79Q4Opn0hGTnmn2bgTuFxeCxRdWsD5lou
 9ElWOIybHJCsFxElKDRtal0hf9TAOQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62--MEtDeHdNWiNEb5wjfH10g-1; Thu, 11 Nov 2021 09:37:49 -0500
X-MC-Unique: -MEtDeHdNWiNEb5wjfH10g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C07019057A1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:37:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A2A75D6B1;
 Thu, 11 Nov 2021 14:37:40 +0000 (UTC)
Date: Thu, 11 Nov 2021 14:37:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-6.2] docs: Deprecate incorrectly typed device_add
 arguments
Message-ID: <YY0qsR74RKliUaMn@redhat.com>
References: <20211111143530.18985-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111143530.18985-1-kwolf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 03:35:30PM +0100, Kevin Wolf wrote:
> While introducing a non-QemuOpts code path for device creation for JSON
> -device, we noticed that QMP device_add doesn't check its input
> correctly (accepting arguments that should have been rejected), and that
> users may be relying on this behaviour (libvirt did until it was fixed
> recently).
> 
> Let's use a deprecation period before we fix this bug in QEMU to avoid
> nasty surprises for users.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


