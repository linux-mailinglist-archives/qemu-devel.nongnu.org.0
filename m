Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8722559DC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 14:13:43 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBdGI-0002j7-96
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 08:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBdFU-0001vj-Ls
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 08:12:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51243
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBdFR-0008JF-Tt
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 08:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598616768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h5caQ6mUFMZIR6yPXUO1B+BFnqsBds86KLoX/jGg1Go=;
 b=V2FHEW/e7NSsafM4nr/q61my8VDVD7nhS3eUlCwl9F02K0IkmUM+yuObBARcACg7Bet0no
 S8yzKNKuRkL1gzuSyEpPVxY5EOFQMStM3cOx9siIS8xD6WRXMNKw5QH8B8Yyp8R3x2/LvW
 d8no6hCJxrijBCiTrvPFh9xnXVMkabA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-NT7fNU73OBC_elFQjeMyTw-1; Fri, 28 Aug 2020 08:12:46 -0400
X-MC-Unique: NT7fNU73OBC_elFQjeMyTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D07F1DDE2;
 Fri, 28 Aug 2020 12:12:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8150060BA7;
 Fri, 28 Aug 2020 12:12:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8ECB89C87; Fri, 28 Aug 2020 14:12:38 +0200 (CEST)
Date: Fri, 28 Aug 2020 14:12:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v6 03/20] seabios: add bios-microvm.bin binary
Message-ID: <20200828121238.rf2zbph23rv4gp4v@sirius.home.kraxel.org>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-4-kraxel@redhat.com>
 <20200827144854.vz7yhakvks5xoh63@mhamilton>
 <20200828050232.jykyjztkwaplkhsu@sirius.home.kraxel.org>
 <20200828105719.tax5x5youqm3laki@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20200828105719.tax5x5youqm3laki@mhamilton>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 07:07:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > We have roms/Makefile for firmware builds.  "make -C roms bios" will
> > build seabios binaries (you need the seabios submodule initialized for
> > this).
> > 
> > And, yes, seabios builds are reproducible.  If you build with the same
> > compiler (rhel-7 gcc 4.8.5) you should end up with the same binary.
> 
> Which version exactly? I'm still getting a different binary with this
> one:
> 
> gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39)

Exactly this one.

Hmm, when rebuilding now I see the binaries change too.  A few days ago
when I've rebuilt the microvm binary git didn't flag the other two
seabios binaries as changed even though they have been rebuilt.  So this
apparently was just luck.

take care,
  Gerd


