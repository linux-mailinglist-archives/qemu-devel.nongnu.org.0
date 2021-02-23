Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ECA322939
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:07:34 +0100 (CET)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVXR-0004g8-1x
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEVVJ-0003FG-FA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:05:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:60812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEVVG-0003HE-1f
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:05:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4392FAD29;
 Tue, 23 Feb 2021 11:05:16 +0000 (UTC)
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210223095931.16908-1-alex.bennee@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8d149371-56d2-9b91-5b2a-857237ae6823@suse.de>
Date: Tue, 23 Feb 2021 12:05:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210223095931.16908-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 10:59 AM, Alex Bennée wrote:
> There is no particular reason to keep this on it's own in the root of
> the tree. Move it into the rest of the fine developer manual and fixup
> any links to it. The only tweak I've made is to fix the code-block
> annotations to mention the language C.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Claudio Fontana <cfontana@suse.de>

Are there pointers in wiki.qemu.org that need updating?


> ---
>  docs/devel/index.rst                     | 1 +
>  CODING_STYLE.rst => docs/devel/style.rst | 6 +++---
>  README.rst                               | 4 +++-
>  scripts/fix-multiline-comments.sh        | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)
>  rename CODING_STYLE.rst => docs/devel/style.rst (99%)
> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 22854e334d..ae664da00c 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -14,6 +14,7 @@ Contents:
>     :maxdepth: 2
>  
>     build-system
> +   style
>     kconfig
>     testing
>     fuzzing
> diff --git a/CODING_STYLE.rst b/docs/devel/style.rst
> similarity index 99%
> rename from CODING_STYLE.rst
> rename to docs/devel/style.rst
> index 7bf4e39d48..8b0bdb3570 100644
> --- a/CODING_STYLE.rst
> +++ b/docs/devel/style.rst
> @@ -641,7 +641,7 @@ trace-events style
>  
>  In trace-events files, use a '0x' prefix to specify hex numbers, as in:
>  
> -.. code-block::
> +.. code-block:: c
>  
>      some_trace(unsigned x, uint64_t y) "x 0x%x y 0x" PRIx64
>  
> @@ -649,14 +649,14 @@ An exception is made for groups of numbers that are hexadecimal by
>  convention and separated by the symbols '.', '/', ':', or ' ' (such as
>  PCI bus id):
>  
> -.. code-block::
> +.. code-block:: c
>  
>      another_trace(int cssid, int ssid, int dev_num) "bus id: %x.%x.%04x"
>  
>  However, you can use '0x' for such groups if you want. Anyway, be sure that
>  it is obvious that numbers are in hex, ex.:
>  
> -.. code-block::
> +.. code-block:: c
>  
>      data_dump(uint8_t c1, uint8_t c2, uint8_t c3) "bytes (in hex): %02x %02x %02x"
>  
> diff --git a/README.rst b/README.rst
> index ce39d89077..f5d41e59b1 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to use 'git
>  format-patch' and/or 'git send-email' to format & send the mail to the
>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>  a 'Signed-off-by' line from the author. Patches should follow the
> -guidelines set out in the CODING_STYLE.rst file.
> +guidelines set out in the `style section
> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
> +the Developers Guide.
>  
>  Additional information on submitting patches can be found online via
>  the QEMU website
> diff --git a/scripts/fix-multiline-comments.sh b/scripts/fix-multiline-comments.sh
> index 93f9b10669..c15a041272 100755
> --- a/scripts/fix-multiline-comments.sh
> +++ b/scripts/fix-multiline-comments.sh
> @@ -1,6 +1,6 @@
>  #! /bin/sh
>  #
> -# Fix multiline comments to match CODING_STYLE
> +# Fix multiline comments to match docs/devel/style.rst
>  #
>  # Copyright (C) 2018 Red Hat, Inc.
>  #
> 


