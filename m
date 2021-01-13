Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF62F4858
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:11:53 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzd84-0002BA-Ed
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzd6J-0001Ay-NX
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzd6I-0004GQ-6o
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610532601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvbbk4Ye0S+PwhAT2yanG6iHCHN9gQAQwJZlpRHpueU=;
 b=J/+mD/AMXmK8TyUq0PTt9RPfDirkthX6R5Rnbizj4nDcuFxG1Dp0QBpH9NeuJTRwU154g+
 fEODL2QNgjOPHMg8z0a+lVLysXWU654QdofxP5ACIJ4OvV7GfncdN8231//YSxv+D0FK+x
 0dtxteh0Hj6Ygxb68K2JoISdp8OPhUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-i2P7qRL9NniyHnGyssdiaA-1; Wed, 13 Jan 2021 05:09:59 -0500
X-MC-Unique: i2P7qRL9NniyHnGyssdiaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D8CC107ACF7;
 Wed, 13 Jan 2021 10:09:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4235019C47;
 Wed, 13 Jan 2021 10:09:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB1431800628; Wed, 13 Jan 2021 11:09:56 +0100 (CET)
Date: Wed, 13 Jan 2021 11:09:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
Message-ID: <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
 <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I don't like Perl really, but there's a chicken-and-egg problem between
> detecting Python and using it to print the configure help script.  For
> configure-time tasks, Perl has the advantage that "#! /usr/bin/env perl"
> just works.

Assuming perl is actually installed, the world seems to shift to python.
On a minimal fedora install python is present but perl is not ...

On the other hand git depends on perl, so it is probably pretty hard to
find a developer workstation without perl installed, so maybe that
doesn't matter much for the time being.

take care,
  Gerd


