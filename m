Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909826A25F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 11:37:59 +0200 (CEST)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI7PS-0002Ml-4p
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 05:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kI7Mn-0000ml-9e
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 05:35:13 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50763
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kI7Ml-0003wv-6D
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 05:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600162509;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHsJZItKMAbKIDTNwQ5YORNCSCxCsxabdzrqsFe5Zi8=;
 b=ZpQlacNAC4BKMkevMA4dLltbWdR85Nb9goFiyoaSxxTTwkiQovubwKjpfW/i83/fBAHRkW
 FYOjp4A9Wj+tthBE4Pp6SWsbkwADTSYLW1jljQaPl897EyEmvc2ZZPwarBU9smb5Qk7dzv
 SCCO4RTI/va+RfJgK6B3DjPtcKyBcU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-5QtdpOHvMgK1DxHbo4XouQ-1; Tue, 15 Sep 2020 05:35:01 -0400
X-MC-Unique: 5QtdpOHvMgK1DxHbo4XouQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 283BA100746A
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 09:35:00 +0000 (UTC)
Received: from redhat.com (ovpn-113-234.ams2.redhat.com [10.36.113.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9ED1002D5E;
 Tue, 15 Sep 2020 09:34:58 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:34:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/qtest/qmp-cmd-test: Use inclusive language
Message-ID: <20200915093455.GC1502912@redhat.com>
References: <20200914163755.42618-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200914163755.42618-1-thuth@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 05:35:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 14, 2020 at 06:37:55PM +0200, Thomas Huth wrote:
> We simply want to ignore certain queries here, so let's rather
> use the term 'ignore' to express this intention.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Changed naming according to suggestions
> 
>  tests/qtest/qmp-cmd-test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


