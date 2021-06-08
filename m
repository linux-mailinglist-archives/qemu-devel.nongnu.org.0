Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208D439F31A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:58:26 +0200 (CEST)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYV7-00053b-6s
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqYUI-0004MO-B5
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqYUC-00044K-O2
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623146247;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w9OWg7u6+lyxojj90R9pQCFBEgzqLlceP/aa3ih+OCs=;
 b=CMqpnX9khtCKsU24UWy2h0uVzKf63uRKuRv3Dz6jAuoEoKro+yeAz0CwZcN+4XKHZzLlMt
 zMqqpnAvnI/L21DqBdSxxlrTYSp32FhuF32ifaYBEU9tIEMiEup6+Tls/wwXSq+xpqsBYG
 HQE7TRFXNlZyJDutRdAoiq9Ws0ToK3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-GcEeUWbDPk2HqtyoCGWo0g-1; Tue, 08 Jun 2021 05:57:23 -0400
X-MC-Unique: GcEeUWbDPk2HqtyoCGWo0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 899591009446
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 09:57:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B0E5D6D3;
 Tue,  8 Jun 2021 09:57:21 +0000 (UTC)
Date: Tue, 8 Jun 2021 10:57:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 00/12] Machine and OS X changes for 2021-06-08
Message-ID: <YL8+/iTU/VrJ7oFE@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 11:40:05AM +0200, Paolo Bonzini wrote:
> The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d166:
> 
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210604' into staging (2021-06-05 11:25:52 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 8f9f729185e3ac8d3c5a65d81eb9e74e229901ea:
> 
>   vnc: avoid deprecation warnings for SASL on OS X (2021-06-07 10:20:23 -0400)
> 
> ----------------------------------------------------------------
> * introduce "-M smp" (myself)
> * avoid deprecation warnings for SASL on macOS 10.11 or newer.
> 
> ----------------------------------------------------------------
> Paolo Bonzini (12):
>       qom: export more functions for use with non-UserCreatable objects
>       keyval: introduce keyval_merge
>       keyval: introduce keyval_parse_into
>       vl: switch -M parsing to keyval
>       qemu-option: remove now-dead code
>       machine: move dies from X86MachineState to CpuTopology
>       machine: move common smp_parse code to caller
>       machine: add error propagation to mc->smp_parse
>       machine: pass QAPI struct to mc->smp_parse
>       machine: reject -smp dies!=1 for non-PC machines
>       machine: add smp compound property
>       vnc: avoid deprecation warnings for SASL on OS X

None of these changes have any reviewed-by tags. Was this really meant
to be sent as a PULL before getting reviews ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


