Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D8279D88
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 04:22:08 +0200 (CEST)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMMKE-00068r-TK
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 22:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.cournoyer@gmail.com>)
 id 1kMMJO-0005ex-BW
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 22:21:14 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:36945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.cournoyer@gmail.com>)
 id 1kMMJK-0002Nk-Mo
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 22:21:14 -0400
Received: by mail-qk1-x744.google.com with SMTP id 16so7076099qkf.4
 for <qemu-devel@nongnu.org>; Sat, 26 Sep 2020 19:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=orwuIxhcAzfxvrYdPq15IL46wXoZXSVTBAmQieB+P2I=;
 b=vc4XyksZHYo+IWDFs522eKIz6ybQGpCUHMi7NHKsZCZFiGUJdmSH2/iOqeQJBisr1y
 3Iwy+ufWMUDSyWoevQ/CUcle/JbDQgoKschKRg5lx2UXPJ0hAjkQdxaKyI0eh9F+3bvw
 W2Szjy8UEB5k+gYEYCFOAM//RZK+5qqDnN46sOYLUPDHmssCPddB7J1r43P9zsDo0UUq
 OuDBEtYiAA5I0VFsT1rrj05HU+S/sOx4SZ7x0AhhkkJeCQEKSbfXxCaakZthX47BPhgd
 d6u0q47IxscrGIFdqBXt2hc2GKG0JzDa3201jP6Q3goYG0lrBniHY8bZ5ZWzeRgbQrGn
 vc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=orwuIxhcAzfxvrYdPq15IL46wXoZXSVTBAmQieB+P2I=;
 b=ksJT3xqSCCmvRkIeg45DCrVNzgCvyHKUprqF6yIbAPKS75AkEqRRq5pxJcOH9l1hnW
 lK6IC7VZ8dIE/8mhgQcUr4EbtlT4dRcTVQPUZlEAPHiqL5sAnzBo20S+JWFW63ligYZA
 p0nVLQ/n6uc2WM4YapL4aHJv7qzs0fwevMUVR6doG+iIG6KmpJlMCa1TuNvnRHcwgxn+
 WTVfnRFYsD0HkrVxehREL07W4lRo4bC2Pxb9KcLWWW2OeC6mOqKw32X//QDmZ+PDcHES
 cbmIGXRV6xWdD0sSLzpDX/Dca7P2g9lFVha/h0t2pq19pHS/Qy/SKqMbLjSSdoB2Bbkq
 e1Fg==
X-Gm-Message-State: AOAM531t7QLEM52gr8l7eNICxqyQeII02K/m082B6xxXFnITphoPMGAO
 YhJu+eLEahVhLwIXkOZS9dmrTMUdTysC+A==
X-Google-Smtp-Source: ABdhPJw3TIbzxozScAe9Ke9i2CqM3yBEUt8XHXrX7lRnQicXBEjP+mFxotddlwLKmr9aEjJeuPsjMg==
X-Received: by 2002:ae9:c015:: with SMTP id u21mr6840325qkk.268.1601173269208; 
 Sat, 26 Sep 2020 19:21:09 -0700 (PDT)
Received: from hurd (dsl-10-132-92.b2b2c.ca. [72.10.132.92])
 by smtp.gmail.com with ESMTPSA id p28sm6076362qta.88.2020.09.26.19.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 19:21:08 -0700 (PDT)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] build: Build and install the info manual.
References: <20200925024143.26492-1-maxim.cournoyer@gmail.com>
 <CAFEAcA_wU73U6eaHU0mwccr-E0EHSKzFJ1yiR++YEKv=1LneJQ@mail.gmail.com>
 <87mu1dtao6.fsf@gmail.com>
 <CAFEAcA_4wXqGeOgsY2GbY1mk==DCz--j-jhs+OdGQnOHEf+D_A@mail.gmail.com>
Date: Sat, 26 Sep 2020 22:22:33 -0400
In-Reply-To: <CAFEAcA_4wXqGeOgsY2GbY1mk==DCz--j-jhs+OdGQnOHEf+D_A@mail.gmail.com>
 (Peter Maydell's message of "Sat, 26 Sep 2020 22:34:22 +0100")
Message-ID: <87wo0grmae.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=maxim.cournoyer@gmail.com; helo=mail-qk1-x744.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 26 Sep 2020 at 05:36, Maxim Cournoyer <maxim.cournoyer@gmail.com> wrote:
>> > This isn't the right thing. You should be pointing sphinx-build
>> > at each of the individual manuals (system, interop, etc) and
>> > generating one info file for each. This is because we generate
>> > manuals for each of these including the 'devel' manual, but
>> > we don't want to install 'devel', because it's developer-facing
>> > and not needed by end-users of QEMU.
>>
>> Is this the only reason individual manuals are being generated?  It
>> makes sense for the manpages (which have their own macros), but
>> otherwise (for HTML and info) introduces a lot of complexity for not
>> much gain, in my opinion.  Users not wanting to know about devel
>> internals can simply skip that section; no harm done.
>
> It is the best way we found for getting Sphinx to do what we wanted.
> I agree that it would be nicer to have one manual with all the user
> facing parts in it, but it is apparently not possible to do that without
> shipping the devel docs to users, which we didn't want to do.

I personally don't understand the rationale of hiding the devel section
from users, especially given the kind of users QEMU is likely to attract
(e.g, teksavvy people, perhaps themselves developers that could be
curious peeking into that section to deepen their understanding of
QEMU's architecture and internals).

But if you feel strongly about it, I'd suggest the following, which
excludes the devel section from being built when calling Sphinx from the
top level:

--8<---------------cut here---------------start------------->8---
7 files changed, 13 insertions(+), 4 deletions(-)
docs/conf.py                 | 5 ++++-
docs/cpu-hotplug.rst         | 2 ++
docs/index.rst               | 3 ---
docs/microvm.rst             | 2 ++
docs/pr-manager.rst          | 2 ++
docs/virtio-net-failover.rst | 2 ++
docs/virtio-pmem.rst         | 1 +

modified   docs/conf.py
@@ -116,7 +116,10 @@ language = None
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
 # This patterns also effect to html_static_path and html_extra_path
-exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']
+exclude_patterns = ['_build',
+                    'Thumbs.db',
+                    '.DS_Store',
+                    'devel/*']

 # The name of the Pygments (syntax highlighting) style to use.
 pygments_style = 'sphinx'
modified   docs/cpu-hotplug.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ===================
 Virtual CPU hotplug
 ===================
modified   docs/index.rst
@@ -9,12 +9,9 @@ Welcome to QEMU's documentation!
 .. toctree::
    :maxdepth: 2
    :caption: Contents:
-   :glob:

    system/index
    user/index
    tools/index
    interop/index
    specs/index
-   devel/index
-   *
modified   docs/microvm.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ====================
 microvm Machine Type
 ====================
modified   docs/pr-manager.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ======================================
 Persistent reservation managers
 ======================================
modified   docs/virtio-net-failover.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ======================================
 QEMU virtio-net standby (net_failover)
 ======================================
modified   docs/virtio-pmem.rst
@@ -1,3 +1,4 @@
+:orphan:

 ========================
 QEMU virtio pmem
--8<---------------cut here---------------end--------------->8---

With this change, the top level node of "info qemu" reads as:

--8<---------------cut here---------------start------------->8---
QEMU Documentation
******************

     QEMU , Sep 26, 2020

     The QEMU Project Developers

     Copyright (C) 2020, The QEMU Project Developers

* Menu:

* QEMU System Emulation User's Guide::
* QEMU User Mode Emulation User's Guide::
* QEMU Tools Guide::
* QEMU System Emulation Management and Interoperability Guide::
* QEMU System Emulation Guest Hardware Specifications::
* Index::
--8<---------------cut here---------------end--------------->8---

I'd still prefer to include the developer's manual as the last section
of the info manual, if you don't mind, for the reason explained above.

The scheme used above to exclude the devel section could also be used to
simplify building the HTML manual (e.g., build it by calling sphinx on
the top level with a correctly defined index.rst instead of individually
for each of its constituting sections before stitching them back
together with a custom index.html).

What do you think?

Thanks again,

Maxim

