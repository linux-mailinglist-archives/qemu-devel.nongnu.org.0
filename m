Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565F69F238
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlnH-0005zn-No; Wed, 22 Feb 2023 04:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUlnG-0005zc-4t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:52:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUlnE-0004GY-2f
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677059527;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fl9JzPfl65mLMKbclXhOrNg4Mp332faxUErjf6Huiko=;
 b=i2cYr00UrBM8vqwW6erwl2/vLyPqstEsazFQivj8oQb0bevImf82whAuBvfzbdkhWIXdAP
 zc8w8qkhKvQf/6yQm4QBzKII6oABeqsAyWSUdy9I3tddIvPdECW9GJ59wHbJPQeOZTcWlc
 +TmVjcbFyv7Bzg017hmO+CPUREMLsbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-gLnyaZcSMWGK-4RwPY-uGQ-1; Wed, 22 Feb 2023 04:52:03 -0500
X-MC-Unique: gLnyaZcSMWGK-4RwPY-uGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90356100F907;
 Wed, 22 Feb 2023 09:52:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE60C15BA0;
 Wed, 22 Feb 2023 09:52:00 +0000 (UTC)
Date: Wed, 22 Feb 2023 09:51:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y/Xlve3HWhh4QD+u@redhat.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <45EE5F9E-B9B8-4DA4-809E-A95FC618E7BE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45EE5F9E-B9B8-4DA4-809E-A95FC618E7BE@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Feb 22, 2023 at 09:11:13AM +0000, Bernhard Beschow wrote:
> 
> 
> Am 30. Januar 2023 20:45:47 UTC schrieb "Alex Bennée" <alex.bennee@linaro.org>:
> >
> >Daniel P. Berrangé <berrange@redhat.com> writes:
> >
> >> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
> >>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
> >>> >
> >>> > Testing 32-bit host OS support takes a lot of precious time during the QEMU
> >>> > contiguous integration tests, and considering that many OS vendors stopped
> >>> > shipping 32-bit variants of their OS distributions and most hardware from
> >>> > the past >10 years is capable of 64-bit
> >>> 
> >>> True for x86, not necessarily true for other architectures.
> >>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
> >>> I'm not entirely sure about whether we're yet at a point where
> >>> I'd want to deprecate-and-drop 32-bit arm host support.
> >>
> >> Do we have a feeling on which aspects of 32-bit cause us the support
> >> burden ? The boring stuff like compiler errors from mismatched integer
> >> sizes is mostly quick & easy to detect simply through a cross compile.
> >>
> >> I vaguely recall someone mentioned problems with atomic ops in the past,
> >> or was it 128-bit ints, caused implications for the codebase ?
> >
> >Atomic operations on > TARGET_BIT_SIZE and cputlb when
> >TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
> >backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
> >throughout.
> 
> Are there any plans or ideas to support 128 bit architectures
> such as CHERI in the future? There is already a QEMU fork
> implementing CHERI for RISC V [1]. Also ARM has developed an
> experimental hardware implementation of CHERI within the Morello
> project where Linaro is involved as well, although the QEMU
> implementation is performed by the University of Cambridge [2].

If 128 bit hardware exists and has real world non-toy usage,
then a request to support it in QEMU is essentially inevitable.

> I'm asking because once we deeply bake in the assumption that
> host size >= guest size then adding such architectures will
> become much harder.

Yep, that is a risk.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


