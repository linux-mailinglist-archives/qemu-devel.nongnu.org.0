Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9740322F7F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:21:36 +0100 (CET)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbNQ-0000Ic-0P
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbHH-0005YW-RO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:15:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbHG-0001qm-28
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIkI8O31tRPy7fPWOA6AHWO9gADYuRYxZr8llEq1aOM=;
 b=NCo1I9CURZ827GFEEfcZUi0dLcyf7Oaqwz+hvAMwR5+MnBuj2WZOeqsgJFXjiux1gj3kPk
 QYJWYx9TDb5mAWz8ZtcoE2x5f4JgOtqfwN1WxJx14aXtdoNsGuxfzO59QuZJoqtc0bLf6r
 H2CiRCKtf3PRGj6GYg8w6sl4udovIkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-Bv-WmsSfMF2Cc5IexZ1XLQ-1; Tue, 23 Feb 2021 12:13:52 -0500
X-MC-Unique: Bv-WmsSfMF2Cc5IexZ1XLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC2A107ACF8;
 Tue, 23 Feb 2021 17:13:51 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C52045D6A1;
 Tue, 23 Feb 2021 17:13:46 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:13:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 3/4] utils: Deprecate hex-with-suffix sizes
Message-ID: <YDU3xxD6p4YjCkob@redhat.com>
References: <20210211204438.1184395-1-eblake@redhat.com>
 <20210211204438.1184395-4-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211204438.1184395-4-eblake@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 02:44:37PM -0600, Eric Blake wrote:
> Supporting '0x20M' looks odd, particularly since we have a 'B' suffix
> that is ambiguous for bytes, as well as a less-frequently-used 'E'
> suffix for extremely large exibytes.  In practice, people using hex
> inputs are specifying values in bytes (and would have written
> 0x2000000, or possibly relied on default_suffix in the case of
> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
> sense for inputs in decimal (where the user would write 32M).  But
> rather than outright dropping support for hex-with-suffix, let's
> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
> have an Err** parameter, and plumbing that in would be a much larger
> task, we instead go with just directly emitting the deprecation
> warning to stderr.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/system/deprecated.rst |  8 ++++++++
>  util/cutils.c              | 10 +++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


