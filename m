Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D96A9550
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2jk-0005FI-EY; Fri, 03 Mar 2023 05:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY2jj-0005F3-11
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:34:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY2jh-00070x-CR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677839640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NAXBytp4nGfTbxc7XCY3VkzVFxs8Wn4fTzwvp+3wCCs=;
 b=BQaG6FtIGrtCJpvKqGRZfW6UC4/LFIePs3qhelHM6BaXlgwMuyGtwQuardDr0V3qieGYWF
 PQ6ai9BBhaffKWuTmNumFn/kwXkWF0YZFzpW96jhUS+bECNUJmmswXiaF42Tcdb7jGbR41
 CQ+9oALqtiCxO+u0L8LMCC0SbgHQLN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-O_KEQ5NqOUqqTXj1vwzWmg-1; Fri, 03 Mar 2023 05:33:58 -0500
X-MC-Unique: O_KEQ5NqOUqqTXj1vwzWmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A5C185A78B;
 Fri,  3 Mar 2023 10:33:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6425A40CF8EF;
 Fri,  3 Mar 2023 10:33:57 +0000 (UTC)
Date: Fri, 3 Mar 2023 10:33:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Haitao Shan <hshan@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] Adding the Android Emulator hypervisor driver
 accelerator
Message-ID: <ZAHNEtV0N+9JyZTk@redhat.com>
References: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 06:25:59PM -0800, Haitao Shan wrote:
> The Android Emulator hypervisor driver is a hypervisor for Windows (7
> or later), made by porting the KVM from the linux kernel 4.9-rc7. Its
> initial purpose was to support the Android Emulator on the AMD
> platforms as the old name "Android Emulator Hypervisor Driver for AMD
> Processors" suggested. Despite the name, Intel processors have been
> supported ever since its first release. Since Intel dropped HAXM support,
> the android emulator is switching from HAXM to AEHD.

When HAXM was proposed for deprecation & removal from QEMU, the suggestion
was that users should switch to Windows' native replacement WHPX, which
QEMU already has support for.

What is the rationale for wanting to introduce a 3rd party hypervisor
solution like AEHD, for the Android emulator, rather than just sticking
with the standard WHPX hypervisor available for Windows ? IIUC, the
Android emulator can already support WHPX according to these pages:

  https://developer.android.com/studio/run/emulator-acceleration
  https://learn.microsoft.com/en-us/dotnet/maui/android/emulator/hardware-acceleration?view=net-maui-7.0

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


