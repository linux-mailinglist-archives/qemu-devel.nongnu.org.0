Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DEF1FC0AA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 23:09:44 +0200 (CEST)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlIpz-0007od-Oj
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 17:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlIox-0007NV-Q3
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 17:08:39 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlIow-0004vJ-17
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 17:08:39 -0400
Received: by mail-oi1-x22a.google.com with SMTP id c194so20599155oig.5
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ug01rDSoT/ZOOoEXvcLUeSh5UrKRZBD5sGKoWsgMMe0=;
 b=ChEb6PZRdodfMeHGD2mFK+hDuXIDJkCT9CBuzHlT8T20/Zpjw5qYNBTcPcjMHdZS+y
 djstLsmdlrhub63nM4aQ1n3g8r1mE1r+lHdkeKX7LCPTaG1cq37NDNvNFBPeGvBDH3fk
 RjoWUGajbj9KENDtZ+JlQ5JyXHjUiSyGcX3028KL4V+auMkXyo9v0NWnP9a5NtCTTIgj
 3QIdAP/8JjvBFIPlmoURCIG2eRQFGQ20uIcfOoGdZjsUmJGcLC6tFwVia2dGXtsvC+8T
 aR7EpObRSRdjzriC5ZXVcmAKQ5QgPKg2r37zjLxq2aiRz88Xc8ns7tPGSeheg30rPFTe
 IKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ug01rDSoT/ZOOoEXvcLUeSh5UrKRZBD5sGKoWsgMMe0=;
 b=JevBDk4qeOkigeher53uagPNmbGns82gw/ziMDIshUJrLBOleX8Ygiy7yR1jsdZ5sR
 Ck163+/Es6FuufY8gJkQ0nZNo8cxMvus72igscOOMrFqRC4nRPkf9GB2Kok0QxJEWQum
 jGE++QMluIqgHHRvzpCN+VFgyNQCI+e6ONPqnYxnxcnp79k3aDWXbF8Y7EjwSPX4J5/W
 Sb9Y73IpjpzuOE5kK1ESLFWV1+z6OBISS0lCrJ3y2efrVQdroGoRkIhds+hRUQurqkgZ
 +Owbjl0PR9xYNuDB2x+rswvbJ+NbcXGvKmHZkngbyhFL8rd6ks/+zcEpUCZba7THxbxy
 B5Hg==
X-Gm-Message-State: AOAM531ze5zXiaVX7ry1UlLDZ5IqxoeGmenMXPhmkx9wvSvEmE86MpQv
 xcUNKiEYrw6cjy+zcgJjhycUni56H5Cui+BIbgfnrQ==
X-Google-Smtp-Source: ABdhPJz3Qkw8WZjRehZyaWi3lSUrUn955XR82hdNO7bq/rEzdCu49Tx3EgsyB/78VGOu5xF7TFq0n2zyfUPRV9nIBBY=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr4951488oia.163.1592341716662; 
 Tue, 16 Jun 2020 14:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <74a0626c-182c-2a55-2528-9fbcd3085950@trystan.org>
In-Reply-To: <74a0626c-182c-2a55-2528-9fbcd3085950@trystan.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 22:08:25 +0100
Message-ID: <CAFEAcA8MXR9wY5MDxxkk62jHVUR8MXeGUMBDB2hwWgo5bs0MfQ@mail.gmail.com>
Subject: Re: Accessing the Metal graphics API with OSX as VM client
To: Trystan Larey-Williams <trystan@trystan.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 at 21:26, Trystan Larey-Williams
<trystan@trystan.org> wrote:
> I'm trying to get a sense of where QEMU headed in terms of supporting
> Apple's Metal API. Apple will likely be removing OpenGL support entirely
> from OSX, perhaps as early as the next major release of OSX in Sep/Oct.

QEMU on OSX hosts has somewhere between few and no active developers
(almost everybody in the upstream community is on a Linux host) so
the default answer is that we're not headed anywhere. I think that
this is not going to be a loss of functionality because right now we
don't support GL acceleration on OSX hosts either (because there's
no virglrenderer there).

Gerd might know what would be the best approach to virtio-gpu on
an OSX host if there were developers interested in working on it.

> Information on support for graphics acceleration on an OSX client using

[side note: not sure what you mean by "client": host, or guest ?]

> Metal instead of OpenGL seems non-existent. From the QEMU documentation
> I gather there are a few ways to 'pass through' a device natively to the
> VM. Would this be the only way to currently access Metal on OSX? Has
> anyone actually tried this?

Does PCI passthrough work on OSX hosts? My default assumption would be
"no, it doesn't" -- the way we do passthrough on Linux hosts
depends on Linux-specific APIs (VFIO). If you meant "device
passthrough from a Linux host to an OSX guest" there's no reason
in theory why that shouldn't work, if OSX has drivers for whatever
the passed-through hardware is. Equally, if there were a
hypothetical OSX Metal driver for virtio-gpu you could use that.

thanks
-- PMM

