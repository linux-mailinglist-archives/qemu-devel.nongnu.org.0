Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A9270393
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 19:57:08 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJKd9-0004Nc-5h
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 13:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJKbx-0003vC-DB
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 13:55:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45120
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJKbu-0001fd-Rp
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 13:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600451749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESpTp3a1Aq2CMNUNgj6g5HclnsSj+1L+EttG64aEWC0=;
 b=G9PDHU8H8+Dd+Lm0WnSJSSm71/wU0Q8Dp8gOYIf8wvcK+V+QHFdH020OAA87O3Y6uUXJhI
 bm3ch81cYUUMBfHaILCmr5N/9TfQe9UxWA1tzV88r7cFn8JItxZsGcIDukDWqy9Nzvq7iz
 EX8pB6e2c3yqp11b4bvbvfI61D2w4Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-2DZbZZApNY6WGZmOxVR1Yw-1; Fri, 18 Sep 2020 13:55:48 -0400
X-MC-Unique: 2DZbZZApNY6WGZmOxVR1Yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0432D10BBEE8;
 Fri, 18 Sep 2020 17:55:47 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DD8E1002D42;
 Fri, 18 Sep 2020 17:55:46 +0000 (UTC)
Date: Fri, 18 Sep 2020 13:55:45 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] docs: simplify and clarify the platform support rules
Message-ID: <20200918175545.GA7594@habkost.net>
References: <20200918090603.1640224-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200918090603.1640224-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 08:09:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 18, 2020 at 10:06:03AM +0100, Daniel P. Berrangé wrote:
> The distinction between short life and long life Linux distributions
> turned out to be redundant. They can both be covered in a simple way
> by noting support will target the current release, and the previous
> release for a period of two years or until its EOL. This rule can also
> apply to the other UNIX based distros, leaving only Windows needing a
> different set of rules.
> 
> This also clarifies that Debian LTS is out of scope, because the LTS
> support is provided by a separate group from the main Debian maintainer
> team.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


