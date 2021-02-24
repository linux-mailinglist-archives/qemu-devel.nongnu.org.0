Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD3B323C80
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:59:09 +0100 (CET)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtky-0004ZU-GF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEtdT-0005DE-1x
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEtdQ-00041G-Pf
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614171080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYS60p6WuZp8mc0bTv7AXVgQqI0CAfMemDNce8k3cFk=;
 b=UXNHaOQlMkxdXZfTTMTSCAMHw/xFm3gtRuwaqgj7kRY1tS6NSgLIZfezRvStKST/nZYeJk
 NwRkKfr79lO3eCDV+4YJHOicY0RE4siB/oCrwP+fiC/hdutYLNruC6gSJ+tPaHxJb0OR7r
 /5Xgc2FVB6PkcLg9Vdtaf+dQ5KNryyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-3kID2EEBMSG8NKSQkt0clA-1; Wed, 24 Feb 2021 07:51:17 -0500
X-MC-Unique: 3kID2EEBMSG8NKSQkt0clA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C43801977;
 Wed, 24 Feb 2021 12:51:16 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E34F60CE6;
 Wed, 24 Feb 2021 12:51:08 +0000 (UTC)
Subject: Re: [RFC PATCH] docs/devel: re-organise the developers guide into
 sections
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210223105146.6695-1-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a03c1d90-d30b-e805-8466-4d6aa9bfb015@redhat.com>
Date: Wed, 24 Feb 2021 09:51:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223105146.6695-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, f4bug@amsat.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/23/21 7:51 AM, Alex Bennée wrote:
> The list of sub-sections was getting a bit long and sporadically
> organised. Let's try and impose some order on this hairball of
> documentation.
>
> [AJB: RFC because I wonder if we should make a more concerted effort
> to move bits of the wiki into a canonical maintained document. There
> is also probably a need for a quickbuild or tldr section of the
> build-system for users who just want to build something.]
>
> Based-on: 20210223095931.16908-1-alex.bennee@linaro.org
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/index.rst                 | 32 ++++++----------------------
>   docs/devel/multi-thread-tcg.rst      |  5 +++--
>   docs/devel/section-apis.rst          | 16 ++++++++++++++
>   docs/devel/section-building.rst      | 13 +++++++++++
>   docs/devel/section-concepts.rst      | 21 ++++++++++++++++++
>   docs/devel/section-process.rst       | 11 ++++++++++
>   docs/devel/section-tcg-emulation.rst | 19 +++++++++++++++++
>   docs/devel/section-testing.rst       | 20 +++++++++++++++++
>   docs/devel/tcg-icount.rst            |  6 +++---
>   docs/devel/testing.rst               |  6 +++---
>   10 files changed, 115 insertions(+), 34 deletions(-)
>   create mode 100644 docs/devel/section-apis.rst
>   create mode 100644 docs/devel/section-building.rst
>   create mode 100644 docs/devel/section-concepts.rst
>   create mode 100644 docs/devel/section-process.rst
>   create mode 100644 docs/devel/section-tcg-emulation.rst
>   create mode 100644 docs/devel/section-testing.rst
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index ae664da00c..2af7bf8736 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -13,29 +13,9 @@ Contents:
>   .. toctree::
>      :maxdepth: 2
>   
> -   build-system
> -   style
> -   kconfig
> -   testing
> -   fuzzing
> -   control-flow-integrity
> -   loads-stores
> -   memory
> -   migration
> -   atomics
> -   stable-process
> -   qtest
> -   decodetree
> -   secure-coding-practices
> -   tcg
> -   tcg-icount
> -   tracing
> -   multi-thread-tcg
> -   tcg-plugins
> -   bitops
> -   reset
> -   s390-dasd-ipl
> -   clocks
> -   qom
> -   block-coroutine-wrapper
> -   multi-process
> +   section-building
> +   section-testing
> +   section-concepts
> +   section-apis
> +   section-tcg-emulation
> +   section-process

Just a fyi... yesterday I realized that the (current) TOC is not getting 
rendered on my Firefox (or chrome) browser:

https://gitlab.com/qemu-project/qemu/-/tree/master/docs/devel

- Wainer

> diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
> index 92a9eba13c..5b446ee08b 100644
> --- a/docs/devel/multi-thread-tcg.rst
> +++ b/docs/devel/multi-thread-tcg.rst
> @@ -4,8 +4,9 @@
>     This work is licensed under the terms of the GNU GPL, version 2 or
>     later. See the COPYING file in the top-level directory.
>   
> -Introduction
> -============
> +==================
> +Multi-threaded TCG
> +==================
>   
>   This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
>   system-mode emulation. user-mode emulation has always mirrored the
> diff --git a/docs/devel/section-apis.rst b/docs/devel/section-apis.rst
> new file mode 100644
> index 0000000000..ab1f6bed60
> --- /dev/null
> +++ b/docs/devel/section-apis.rst
> @@ -0,0 +1,16 @@
> +*********
> +QEMU APIs
> +*********
> +
> +There are a number of APIs in QEMU and the following sections document
> +some of the most important ones. For tose that aren't documented here
> +you can also find notes on usage in the header definitions.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   atomics
> +   bitops
> +   loads-stores
> +   memory
> +   tracing
> diff --git a/docs/devel/section-building.rst b/docs/devel/section-building.rst
> new file mode 100644
> index 0000000000..e6e9fa1d6a
> --- /dev/null
> +++ b/docs/devel/section-building.rst
> @@ -0,0 +1,13 @@
> +*************
> +Building QEMU
> +*************
> +
> +The following sections deal with how the build system works, how it is
> +configured and some basic guidance on how code should be written.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   build-system
> +   kconfig
> +   style
> diff --git a/docs/devel/section-concepts.rst b/docs/devel/section-concepts.rst
> new file mode 100644
> index 0000000000..566c52e90a
> --- /dev/null
> +++ b/docs/devel/section-concepts.rst
> @@ -0,0 +1,21 @@
> +*************
> +QEMU Concepts
> +*************
> +
> +There are a number of high level concepts that are useful to
> +understand when working with the code base. Perhaps the most pervasive
> +is the QEMU Object Model (QOM) which underpins much of the flexibility
> +and configurable of the project. The following sections document that
> +as well as diving into other concepts that are useful to know if
> +working on some areas of the code.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   qom
> +   clocks
> +   reset
> +   block-coroutine-wrapper
> +   migration
> +   multi-process
> +   s390-dasd-ipl
> diff --git a/docs/devel/section-process.rst b/docs/devel/section-process.rst
> new file mode 100644
> index 0000000000..3b0ae4f19b
> --- /dev/null
> +++ b/docs/devel/section-process.rst
> @@ -0,0 +1,11 @@
> +===================
> +Development Process
> +===================
> +
> +The following sections detail aspects of the development process.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   secure-coding-practices
> +   stable-process
> diff --git a/docs/devel/section-tcg-emulation.rst b/docs/devel/section-tcg-emulation.rst
> new file mode 100644
> index 0000000000..81fa131de7
> --- /dev/null
> +++ b/docs/devel/section-tcg-emulation.rst
> @@ -0,0 +1,19 @@
> +*************
> +TCG Emulation
> +*************
> +
> +QEMU was originally built as an emulator capable of running binaries
> +for one architecture on another. The following sections describe the
> +internals of how the Just In Time (JIT) Tiny Code Generator (TCG)
> +works. You only really need to read this if you are interested in
> +adding new architectures or fixing existing architecture emulation.
> +
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   tcg
> +   multi-thread-tcg
> +   tcg-icount
> +   decodetree
> +   tcg-plugins
> diff --git a/docs/devel/section-testing.rst b/docs/devel/section-testing.rst
> new file mode 100644
> index 0000000000..c93ff4c4dd
> --- /dev/null
> +++ b/docs/devel/section-testing.rst
> @@ -0,0 +1,20 @@
> +***************
> +Testing in QEMU
> +***************
> +
> +QEMU is a large and complex project which can be configured in a
> +multitude of ways. As it's impossible for an individual developer to
> +manually test all of these we rely on a whole suite of automated
> +testing approaches to ensure regressions are kept to a minimum.
> +
> +The following sections give a broad overview of the testing
> +infrastructure as well as some detailed introductions into more
> +advanced testing topics.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   testing
> +   fuzzing
> +   control-flow-integrity
> +   qtest
> diff --git a/docs/devel/tcg-icount.rst b/docs/devel/tcg-icount.rst
> index 8d67b6c076..eb990b0976 100644
> --- a/docs/devel/tcg-icount.rst
> +++ b/docs/devel/tcg-icount.rst
> @@ -3,9 +3,9 @@
>      Written by Alex Bennée
>   
>   
> -========================
> -TCG Instruction Counting
> -========================
> +=================================
> +TCG Instruction Counting (icount)
> +=================================
>   
>   TCG has long supported a feature known as icount which allows for
>   instruction counting during execution. This should not be confused
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 3124ee2470..a69db8ab93 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -1,6 +1,6 @@
> -===============
> -Testing in QEMU
> -===============
> +=======
> +Testing
> +=======
>   
>   This document describes the testing infrastructure in QEMU.
>   


