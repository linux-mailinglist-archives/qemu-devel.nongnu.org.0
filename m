Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5D30BA91
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:09:47 +0100 (CET)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6rgw-0005A5-BU
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1l6reV-0004Aj-1X
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:07:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1l6reR-0000Hv-SV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612256830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QflWUSgUerLPNc45qh+ebbfVUtyC3tq6L53RulXx0yc=;
 b=Vq0wvrLD6MpHMIKtzQP5D2V25qaquUj1cGSjFyHVyVi8DUjpnjxs7U7K6B6SlYuok/PkqO
 MWjx60EW/9DjStktkb6DjVxSduxhixM7b9FX++Wt/3sdv4N2OPdeK+FgsBgFvLILidNzln
 BqGpaN65DmNkox3WGeDAUreFOd1HF/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-ehDerYC9M0m0O810gVrDYA-1; Tue, 02 Feb 2021 04:07:04 -0500
X-MC-Unique: ehDerYC9M0m0O810gVrDYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FE68184214D;
 Tue,  2 Feb 2021 09:07:03 +0000 (UTC)
Received: from oldenburg.str.redhat.com (ovpn-112-116.ams2.redhat.com
 [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C64419717;
 Tue,  2 Feb 2021 09:06:58 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
 <CAFEAcA-yzX1ZSPayvy9u8GUbXpgLgQNA7=52qSnDMjakSU0B-Q@mail.gmail.com>
Date: Tue, 02 Feb 2021 10:06:59 +0100
In-Reply-To: <CAFEAcA-yzX1ZSPayvy9u8GUbXpgLgQNA7=52qSnDMjakSU0B-Q@mail.gmail.com>
 (Peter Maydell's message of "Mon, 1 Feb 2021 16:53:03 +0000")
Message-ID: <87lfc6zvm4.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell:

> Apart from the QEMU/KVM specific CPU models, why is this something
> we should be documenting rather than, say, the people specifying
> what the ABI compatiblity levels are ?

The psABI only cares about userspace, and the specification there
deliberately excludes CPU features used in cryptography blocks, and
features that seem unstable and likely to be disabled in firmware or
future microcode updates.  This seemed a good trade-off for the psABI
because in userspace, run-time detection is still available, to access
additional CPU features not available as part of the target x86-64 level
at build time.

This doesn't really work for virtualization, which also has to decide
what to do with CPU features not relevant to userspace.  And a decision
to exclude features is final in the sense that guests cannot use the
feature at all because run-time detection shows it is as unavailable.

This is why a 1:1 copy of the userspace levels to virtualized machine
models is not possible, I think.

Thanks,
Florian
-- 
Red Hat GmbH, https://de.redhat.com/ , Registered seat: Grasbrunn,
Commercial register: Amtsgericht Muenchen, HRB 153243,
Managing Directors: Charles Cachera, Brian Klemm, Laurie Krebs, Michael O'Neill


