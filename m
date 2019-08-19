Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F092578
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 15:47:21 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzi0G-0003U1-Kb
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 09:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hzhxk-00022B-Pg
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 09:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hzhxj-00035C-Cz
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 09:44:44 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37457)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hzhxf-00033k-LS
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 09:44:41 -0400
Received: by mail-ot1-x342.google.com with SMTP id f17so1686856otq.4
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6uJF5gDNNu5c9ZJah7h0FveRrT0hnvbRq5dEZGNIb8Q=;
 b=Sg6eK/IzWHIVlF2TPlyrqJ2Qac2cktnmxaK1C7SNLA/TvpMnj4FwPyi8iwLByySmTs
 K9gnvyFl51t4NaQuvI16q7vrn9LMmLr5dm9/GUXpRzSO0H9ncnRE6VF/3a80HgMNgvJO
 vqcWRkT7JurNtjWX3A44dCXKWoQfedW/4rDk/QqFpV7MIxlq8CdNn6UcyPGdN86M8gdM
 cmzcnfCRE7h1Zubhk5rbo8MO4Mm0dFSXFw61n0NWZVQo/2/ML7O4B393mpOvfpnwc9Xk
 yRJUIUCD0DL3alnSomfsMl+KkImcAJbAnOAUeJBefSUNTGzjnXY5adanJErQbKvLFV1v
 jSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6uJF5gDNNu5c9ZJah7h0FveRrT0hnvbRq5dEZGNIb8Q=;
 b=JJx5eMc6iF76JkUNKETWFva6VOtrxAMtYGPVMpakW4dwWXOzFcgLUkDwg9fHPhr0aX
 +ywnckQNYD43KDLTgrc4FTYaiLTHuwpO29FWl3a9Ctcuw1CFSMUPhkoXHjWvc0vilYWz
 0oDl/zh2lTQaEcZrig17t1ScCN8I1opEgtw+C9Q7StIv+sktnLCrfrbSR3GG6k/YqPl3
 oakcU5BrOqubEDgAPo9f7qGCdWDixKnwLJN5wV36dZ1mJF78IEipMIA7NPrTSz+THwn4
 JMHUsBg5KdLcToi7OaTzeNke/pb31rMzaait/mVyOHB4inCugGr54QL7JJj/sAQiToef
 nnxg==
X-Gm-Message-State: APjAAAX94YHmNG/RxBtwOFB5oQA/hwJYl/lXV9hfG5v7Ch1mBz/TVlwl
 e0Nvk1GDgt0bLjOPslMMiMr03vbyMoF4iaZ4nINl1A==
X-Google-Smtp-Source: APXvYqz/eRxkWgkEfytQXXb/ohJMOYdZIMCxeASwGzop9xwlkbLDxyjK49nVN1GhOSA+kBSuswajA9oCp+KAdeF0Xoo=
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr18706475otc.135.1566222278343; 
 Mon, 19 Aug 2019 06:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <8fb538f3-dfdd-b427-727a-2e7c2120da09@gmail.com>
 <20e800e8-846b-a9c3-f840-826238b0818f@redhat.com>
 <CAFEAcA9xbPGSezS60cg6WzqpDR1u38aE0bXL_6pLs+H1TK3Ddw@mail.gmail.com>
 <dff44ac1-10e7-285e-467d-8dfe8c7a469b@redhat.com>
 <CAL1e-=hD03RDSHhaBK1BVScKSRsrkXy-dJCvUFzfpJCbYSVe9w@mail.gmail.com>
In-Reply-To: <CAL1e-=hD03RDSHhaBK1BVScKSRsrkXy-dJCvUFzfpJCbYSVe9w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Aug 2019 14:44:26 +0100
Message-ID: <CAFEAcA-VShQT+CKNX6Ox=YVMBrNomY6xAzwVdxgNduJy-9jp7g@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [qemu-s390x] linux-user: s390x issue on Fedora 30
 (dynamic library loader?)
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
Cc: Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 14:34, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> I can't repro the problem either, but I do have a patch authored by an en=
gineer that left the company a while ago that seems to be at least related =
to your scenario. May I ask you to test it (just apply it to QEMU ToT and r=
erun the scenario to see if it changes the outcome) (feel free to experimen=
t and modify the changes)? I never managed to understand the purpose of tha=
t patch (I lost the contact with the former engineer, and the patch is with=
out any comment), so I never dared to send it to the list, but I hope your =
scenario may actually explain the purpose and the origin of the patch.

It's basically a more complete implementation of the
suggestion from https://bugs.launchpad.net/qemu/+bug/1701798
comment #9 (it covers more syscalls and returns a valid
guest errno rather than a host one). The intention, as
you've guessed, is to paper over this guest-ld.so bug by
preventing it from being able to open /etc/ld.so.cache at
all (which will make it fall back to working without a cache).

My feelings about it are the same as they were when I wrote
comment #10 in reply: that patch would prevent us from picking up
a legitimate ld.so.cache for the guest (in a chroot, for instance.
I'm also not a fan of trying to work around specific guest code
issues: I'd much rather this was just fixed in ld.so where it ought
to be.

You should be able to repro this bug on real hardware by
copying an x86-64 ld.so.cache onto a big-endian machine :-)

thanks
-- PMM

