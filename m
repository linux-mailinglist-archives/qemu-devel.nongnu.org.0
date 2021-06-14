Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7273A6E01
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:11:12 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsr3F-0004HO-N9
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lsr1U-0003W2-2x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lsr1Q-0003Kt-Lx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623694155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8xR3OpXGAL/YonxI+ezY8WJ38yMD+MIuKt0I+EkLNU=;
 b=InbRjC/lMqlUT21eyTGSS+jFKFtlmvz6Ys7cX5xesYyKIJdlTw4LZ7cPioi43No7ku0CXc
 BwWMbupcQ9jxA2JSBA/RPsfHidZe/O/6uJaDwKT1L4uhRvTJDV5jozCnS4zs37u6u9lfTK
 s4ASKojw6kCvhqXcP9dUp7iBqvljk68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-NKnTUWH2MLKTwHtopvgLxQ-1; Mon, 14 Jun 2021 14:09:12 -0400
X-MC-Unique: NKnTUWH2MLKTwHtopvgLxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CCC1932480;
 Mon, 14 Jun 2021 18:09:11 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802CD5D720;
 Mon, 14 Jun 2021 18:09:09 +0000 (UTC)
Subject: Re: [PATCH 00/42] python: move qmp-shell into qemu.qmp package
To: qemu-devel@nongnu.org
References: <20210607200649.1840382-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <6eefe3de-7c13-fc8f-9615-0560ef34020b@redhat.com>
Date: Mon, 14 Jun 2021 14:09:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 4:06 PM, John Snow wrote:
> Based-on: <20210603003719.1321369-1-jsnow@redhat.com>
> Based-on: <20210604155532.1499282-1-jsnow@redhat.com>
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/316425665
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-qmp-shell
> 
> This series follows:
> 
> 1. [PATCH v3 00/19] Python: move /scripts/qmp/qom* to /python/qemu/qmp/qom*​
> 2. [PATCH 00/11] python: move /scripts/qmp/gemu-ga-client.py to qemu.qmp package
> 
> and finishes moving stuff in ./scripts/qmp/ into ./python/qemu/qmp/*.
> 
> The benefits of this are:
> 
> 1. Improved protection against accidental regression in qmp-using
> scripts as we refactor QMP to introduce Async QMP and OOB support
> 2. Availability of common qmp command-line tools as part of the qemu.qmp
> package
> 3. No more sys.path hacking for qemu.qmp-using utilities
> 4. Newly 100% clean linting baseline to use as an aid in reviewing
> future patches.
> 
> This series is largely minor refactors, linting and typing cleanups,
> followed by the move into the python packaging folder at the very end of
> the series.
> 
> John Snow (42):
>    scripts/qmp-shell: apply isort rules
>    scripts/qmp-shell: Apply flake8 rules
>    scripts/qmp-shell: fix show_banner signature
>    scripts/qmp-shell: fix exception handling
>    scripts/qmp-shell: fix connect method signature
>    scripts/qmp-shell: remove shadowed variable from _print()
>    scripts/qmp-shell: use @classmethod where appropriate
>    scripts/qmp-shell: Use python3-style super()
>    scripts/qmp-shell: declare verbose in __init__
>    scripts/qmp-shell: use triple-double-quote docstring style
>    scripts/qmp-shell: ignore visit_Name name
>    scripts/qmp-shell: make QMPCompleter returns explicit
>    scripts/qmp-shell: rename one and two-letter variables
>    scripts/qmp-shell: fix shell history exception handling
>    scripts/qmp-shell: remove if-raise-else patterns
>    scripts/qmp-shell: use isinstance() instead of type()
>    scripts/qmp-shell: use argparse
>    scripts/qmp-shell: Add pretty attribute to HMP shell
>    scripts/qmp-shell: Make verbose a public attribute
>    scripts/qmp-shell: move get_prompt() to prompt property
>    scripts/qmp-shell: remove prompt argument from read_exec_command
>    scripts/qmp-shell: move the REPL functionality into QMPShell
>    scripts/qmp-shell: Fix "FuzzyJSON" parser
>    scripts/qmp-shell: refactor QMPCompleter
>    scripts/qmp-shell: initialize completer early
>    python/qmp: add QMPObject type alias
>    scripts/qmp-shell: add mypy types
>    scripts/qmp-shell: Accept SocketAddrT instead of string
>    scripts/qmp-shell: unprivatize 'pretty' property
>    python/qmp: return generic type from context manager
>    scripts/qmp-shell: Use context manager instead of atexit
>    scripts/qmp-shell: use logging to show warnings
>    scripts/qmp-shell: remove TODO
>    scripts/qmp-shell: Fix empty-transaction invocation
>    scripts/qmp-shell: Remove too-broad-exception
>    scripts/qmp-shell: convert usage comment to docstring
>    scripts/qmp-shell: remove double-underscores
>    scripts/qmp-shell: make QMPShellError inherit QMPError
>    scripts/qmp-shell: add docstrings
>    scripts/qmp-shell: move to python/qemu/qmp/qmp_shell.py
>    python: add qmp-shell entry point
>    scripts/qmp-shell: add redirection shim
> 
>   python/qemu/qmp/__init__.py  |   8 +-
>   python/qemu/qmp/qmp_shell.py | 535 +++++++++++++++++++++++++++++++++++
>   python/setup.cfg             |   1 +
>   scripts/qmp/qmp-shell        | 437 +---------------------------
>   4 files changed, 546 insertions(+), 435 deletions(-)
>   create mode 100644 python/qemu/qmp/qmp_shell.py
> 

Preliminarily staged to my Python branch:
https://gitlab.com/jsnow/qemu/-/tree/python

CI: https://gitlab.com/jsnow/qemu/-/pipelines/320710762

I intend to send the PR collecting these 72 cleanup patches this Friday.

--js


