Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EB587EFC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:31:58 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItsC-0000Iu-Kd
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oItph-0006fo-9K; Tue, 02 Aug 2022 11:29:24 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:42428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oItpe-0000Ik-Mm; Tue, 02 Aug 2022 11:29:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0B2460B3E;
 Tue,  2 Aug 2022 15:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED07C433D7;
 Tue,  2 Aug 2022 15:29:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="MmMmR58x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659454151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N/2tMceguGIAR004afhd46yu1cDvjrJFQFXFX/4DEns=;
 b=MmMmR58xNl8ugSls8EMPZLeR7X+/xlnvqjMdTxYWaAZ9HoZiulZ48KPNegNrXL8LeQLcJ0
 G+uOJMILTzNht4Ql4vJZGxgSlajRNZZg16BXmi9oA/09P/mGsfSL1suUAIYhrcUgs4qZ3B
 jeHL0j3R03p4FLMNrj2MaYIpM2q6COY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 15fb9f55
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 2 Aug 2022 15:29:10 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id y127so24123213yby.8;
 Tue, 02 Aug 2022 08:29:10 -0700 (PDT)
X-Gm-Message-State: ACgBeo1O/hD2cWsU6JtiFHl8nDrUa9tn+hJ+jpXjMOW9VBt+Eg7X7h6q
 DlTRNvFath7sydOGRVDrJ+G+pnMcD7O5qnf0cKk=
X-Google-Smtp-Source: AA6agR7k4fAL4/Mitol+dMbgN/2q8irI8SbeHXwiMKc93SBkJnrkCKKiVfyG592gVgqESQhASs/df/mLxoh1mPkRsZ4=
X-Received: by 2002:a25:41cb:0:b0:671:80ac:bb4c with SMTP id
 o194-20020a2541cb000000b0067180acbb4cmr14595640yba.24.1659454149860; Tue, 02
 Aug 2022 08:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <ef161533-0123-28f0-db1f-5257e82f6340@linux.ibm.com>
 <1afd34c3-0aa6-541c-07e9-b0eef7e0f0d7@redhat.com>
 <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
 <71b1b0f6-95b9-0249-e996-b8348470693f@redhat.com>
 <834c1a76-d972-a1b2-2c28-d0482335d3ba@linux.ibm.com>
 <5835cfa9-841f-ab6c-6684-2ae3bddeacf3@redhat.com>
In-Reply-To: <5835cfa9-841f-ab6c-6684-2ae3bddeacf3@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 Aug 2022 17:28:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9pT+ifm4SbKMCxdXLDOtmEn99ssf54Bz8SWsiRLWfOvGA@mail.gmail.com>
Message-ID: <CAHmME9pT+ifm4SbKMCxdXLDOtmEn99ssf54Bz8SWsiRLWfOvGA@mail.gmail.com>
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
To: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David, Christian,

While this thread has your attention, I thought I'd reiterate my offer in:
https://lore.kernel.org/qemu-devel/YuEoUwzDzBqFFpxe@zx2c4.com/

Do either of you want to "take ownership" of this patch to bring it
past the finish line, and I can provide whatever additional crypto
code you need for that?

Jason

