Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A504166FE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:56:24 +0200 (CEST)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVlX-0002gR-EQ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mTVkc-0001iW-D3
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:55:26 -0400
Received: from relay68.bu.edu ([128.197.228.73]:47838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mTVkW-0003lb-BE
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:55:23 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 18NKsDSd001217
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 23 Sep 2021 16:54:16 -0400
Date: Thu, 23 Sep 2021 16:54:13 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] docs: remove non-reference uses of single backticks
Message-ID: <20210923205413.lqlmrqkollrzbhbp@mozz.bu.edu>
References: <20210923191323.59726-1-jsnow@redhat.com>
 <20210923191323.59726-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923191323.59726-2-jsnow@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.628,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210923 1513, John Snow wrote:
> The single backtick markup in ReST is the "default role". Currently,
> Sphinx's default role is called "content". Sphinx suggests you can use
> the "Any" role instead to turn any single-backtick enclosed item into a
> cross-reference.
> 
> This is useful for things like autodoc for Python docstrings, where it's
> often nicer to reference other types with `foo` instead of the more
> laborious :py:meth:`foo`. It's also useful in multi-domain cases to
> easily reference definitions from other Sphinx domains, such as
> referencing C code definitions from outside of kerneldoc comments.
> 
> Before we do that, though, we'll need to turn all existing usages of the
> "content" role to inline verbatim markup wherever it does not correctly
> resolve into a cross-refernece by using double backticks instead.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks!

> ---
>  docs/devel/fuzzing.rst                 | 9 +++++----
>  docs/devel/tcg-plugins.rst             | 2 +-
>  docs/interop/live-block-operations.rst | 2 +-
>  docs/system/guest-loader.rst           | 2 +-
>  qapi/block-core.json                   | 4 ++--
>  include/qemu/module.h                  | 6 +++---
>  qemu-options.hx                        | 4 ++--
>  7 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 2749bb9bed3..784ecb99e66 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -182,10 +182,11 @@ The output should contain a complete list of matched MemoryRegions.
>  
>  OSS-Fuzz
>  --------
> -QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
> -By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
> -generic-fuzz target requires additional information provided in environment
> -variables, we pre-define some generic-fuzz configs in
> +QEMU is continuously fuzzed on `OSS-Fuzz
> +<https://github.com/google/oss-fuzz>`_.  By default, the OSS-Fuzz build
> +will try to fuzz every fuzz-target. Since the generic-fuzz target
> +requires additional information provided in environment variables, we
> +pre-define some generic-fuzz configs in
>  ``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
>  
>  - ``.name``: To identify the fuzzer config
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index dac5101a3c9..8bffff187f8 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -212,7 +212,7 @@ The hotpages plugin can be configured using the following arguments:
>  
>  This is an instruction classifier so can be used to count different
>  types of instructions. It has a number of options to refine which get
> -counted. You can give a value to the `count` argument for a class of
> +counted. You can give a value to the ``count`` argument for a class of
>  instructions to break it down fully, so for example to see all the system
>  registers accesses::
>  
> diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
> index 9e3635b2338..814c29bbe1d 100644
> --- a/docs/interop/live-block-operations.rst
> +++ b/docs/interop/live-block-operations.rst
> @@ -640,7 +640,7 @@ at this point:
>          (QEMU) block-job-complete device=job0
>  
>  In either of the above cases, if you once again run the
> -`query-block-jobs` command, there should not be any active block
> +``query-block-jobs`` command, there should not be any active block
>  operation.
>  
>  Comparing 'commit' and 'mirror': In both then cases, the overlay images
> diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
> index 4320d1183f7..9ef9776bf07 100644
> --- a/docs/system/guest-loader.rst
> +++ b/docs/system/guest-loader.rst
> @@ -51,4 +51,4 @@ The full syntax of the guest-loader is::
>  
>  ``bootargs=<args>``
>    This is an optional field for kernel blobs which will pass command
> -  like via the `/chosen/module@<addr>/bootargs` node.
> +  like via the ``/chosen/module@<addr>/bootargs`` node.
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c8ce1d9d5d8..0c64470edb2 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -446,11 +446,11 @@
>  # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
>  #
>  # @recording: true if the bitmap is recording new writes from the guest.
> -#             Replaces `active` and `disabled` statuses. (since 4.0)
> +#             Replaces ``active`` and ``disabled`` statuses. (since 4.0)
>  #
>  # @busy: true if the bitmap is in-use by some operation (NBD or jobs)
>  #        and cannot be modified via QMP or used by another operation.
> -#        Replaces `locked` and `frozen` statuses. (since 4.0)
> +#        Replaces ``locked`` and ``frozen`` statuses. (since 4.0)
>  #
>  # @persistent: true if the bitmap was stored on disk, is scheduled to be stored
>  #              on disk, or both. (since 4.0)
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 3deac0078b9..5fcc323b2a7 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -77,14 +77,14 @@ void module_allow_arch(const char *arch);
>  /**
>   * DOC: module info annotation macros
>   *
> - * `scripts/modinfo-collect.py` will collect module info,
> + * ``scripts/modinfo-collect.py`` will collect module info,
>   * using the preprocessor and -DQEMU_MODINFO.
>   *
> - * `scripts/modinfo-generate.py` will create a module meta-data database
> + * ``scripts/modinfo-generate.py`` will create a module meta-data database
>   * from the collected information so qemu knows about module
>   * dependencies and QOM objects implemented by modules.
>   *
> - * See `*.modinfo` and `modinfo.c` in the build directory to check the
> + * See ``*.modinfo`` and ``modinfo.c`` in the build directory to check the
>   * script results.
>   */
>  #ifdef QEMU_MODINFO
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8f603cc7e65..757ac6f2037 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1881,8 +1881,8 @@ SRST
>          Valid parameters are:
>  
>          ``grab-mod=<mods>`` : Used to select the modifier keys for toggling
> -        the mouse grabbing in conjunction with the "g" key. `<mods>` can be
> -        either `lshift-lctrl-lalt` or `rctrl`.
> +        the mouse grabbing in conjunction with the "g" key. ``<mods>`` can be
> +        either ``lshift-lctrl-lalt`` or ``rctrl``.
>  
>          ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing.
>          This parameter is deprecated - use ``grab-mod`` instead.
> -- 
> 2.31.1
> 

