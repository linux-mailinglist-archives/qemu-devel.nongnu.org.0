Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D362B3CC392
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 15:32:48 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4kQx-00052l-5n
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 09:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4kPR-0003me-Pa
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 09:31:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4kPQ-00052G-49
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 09:31:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id w13so7458764wmc.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q6S4PXb0KVuemwy7dqhOLXA7aV9yWSQDA8LFm2NyzwI=;
 b=ZvTJUqsXH484C8YTLsnazUl1ENnc8yY2cB+GQ2VdnShE6sUbgNuNiEVmgNMFfFp8cl
 /kRGiUl9MOA8m1h7CkKlT1bzqJvnOVFv7sX7QSqnfl8ITPgCKu9qdqCJ48NWbNVUYluU
 k8kbw1/Nt04qtR9ZTpS8nF47COsM0L3PTLZnXvi7W3Ibfd4jxy2Ai21/6s+ssfvB9r5J
 BPC1Zi1t9pcjZAzEZQSOC01vreQVcXKHiPsG3LtzNrWpHqv9Naay7hzkxS7R0VJzEopo
 +Do1K6Q/xlh2nqNtJfXo0eNFNoFyJt444OV2cHN1zoWzI8Ldr6fac5xPMLPhwGGsXQ/5
 2vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q6S4PXb0KVuemwy7dqhOLXA7aV9yWSQDA8LFm2NyzwI=;
 b=i4PbwNTUgF0bk+0HjD77IRrFXmCQn1WLXp2ajGiSntWDYF3+WwGzqEiRxD8V0bFSoZ
 YjqHZnYpzBv4bvSWOrVnmSSz0aqYPMIl7KrGaXmXvuEq0YTATLtwdXPUjj1Fcws1/its
 MbXkO/tfbrNLlGlvolO7rxB5sU9fIidygl5V4T7AIE04kvipsU1HgXHxL4S2zNTSrDFu
 WSEP2fUq7k37yOdOMEpr6pVkyGs3AQ6HoNhKD4uhxLBbJ6KqLHBV+YQgZCJr5VRhJnnV
 Iaf7x/ePIYYPEfbuP2Ngtgeus8FCJF7dHwrzMCTRrnlsX7eeWbiVui5PPFHfzR4OmyFi
 Xfrw==
X-Gm-Message-State: AOAM532O+t3sNjORyiaswvE2dNnVv40jXEbIiSwwuIcwjsdidM0cEbys
 vbtd5ZN56dRu4JdEriy6ePa9nA==
X-Google-Smtp-Source: ABdhPJwcmMVw9RUk4AOu3yn6+guqrAOU1doIzyJCsRxad0VCaXRRrsi6yOtDg2C92kE8VHauDkg8kA==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr22160975wmc.88.1626528664706; 
 Sat, 17 Jul 2021 06:31:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm153025wru.97.2021.07.17.06.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 06:31:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 509071FF7E;
 Sat, 17 Jul 2021 14:30:59 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 00/13] new plugin argument passing scheme
Date: Sat, 17 Jul 2021 14:29:03 +0100
In-reply-to: <20210717100920.240793-1-ma.mandourr@gmail.com>
Message-ID: <87o8b12hkc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Hello,
>
> This series removes passing arguments to plugins through "arg=3D" since
> it's redundant and reduces readability especially when the argument
> itself is composed of a name and a value.

When you re-roll a series it's useful to add a version tag. You can use
--subject-prefix in your git format-patch command to do this.

I'll have a look at this on Monday.

>
> Also, passing arguments through "arg=3D" still works but is marked as
> deprecated and will produce a deprecation warning.
>
> Right now, the code for parsing the argument before passing it to the
> plugin is unfortunately not so clean but that's mainly because "arg=3D" is
> still supported.
>
> At first, considering boolean parameters, those were not special to
> plugins and QEMU did not complain about passing them in the form
> "arg=3Dbool_arg" even though that's considered a short-form boolean, which
> is deprecated. As "arg" is removed, a deprecation warning is issued.
>
> This is mitigated by making plugins aware of boolean arguments and
> parses them through a newly exposed API, namely the `qapi_bool_parse`
> function through a plugin API function. Now plugins expect boolean
> parameters to be passed in the form that other parts of QEMU expect,
> i.e. "bool_arg=3D[on|true|yes|off|false|no]".
>
> Since we're still supporting "arg=3Darg_name", there are some assumptions
> that I made that I think are suitable:
>
>     1. "arg=3Darg_name" will be passed to the plugin as "arg_name=3Don".
>     2. "arg=3Don" and "arg" will not be assumed to be the old way of
>         passing args. Instead, it will assume that the argument name is
>         "arg" and it's a boolean parameter. (will be passed to plugin
>         as "arg=3Don")
>
> The docs are updated accordingly and a deprecation notice is put in the
> deprecated.rst file.
>
> v1 -> v2:
>     1. Added patches that handle test plugins as well
>     2. Handled unsupported arguements in howvec
>
> Based-on: <20210714172151.8494-1-ma.mandourr@gmail.com>
>
> However, the dependency is so light and it should only be in the patch
>
>     docs/tcg-plugins: new passing parameters scheme for cache docs
>
> where it depends on
>
>     docs/devel/tcg-plugins: added cores arg to cache plugin
>
> in the aforementioned series (conflict lies in the argument "cores=3DN" o=
nly.)
>
> Mahmoud Mandour (13):
>   plugins: allow plugin arguments to be passed directly
>   plugins/api: added a boolean parsing plugin api
>   plugins/hotpages: introduce sortby arg and parsed bool args correctly
>   plugins/hotblocks: Added correct boolean argument parsing
>   plugins/lockstep: make socket path not positional & parse bool arg
>   plugins/hwprofile: adapt to the new plugin arguments scheme
>   plugins/howvec: Adapting to the new argument passing scheme.
>   docs/tcg-plugins: new passing parameters scheme for cache docs
>   tests/plugins/bb: adapt to the new arg passing scheme
>   tests/plugins/insn: made arg inline not positional and parse it as
>     bool
>   tests/plugins/mem: introduce "track" arg and make args not positional
>   tests/plugins/syscalls: adhere to new arg-passing scheme
>   docs/deprecated: deprecate passing plugin args through `arg=3D`
>
>  contrib/plugins/hotblocks.c | 14 +++++++++--
>  contrib/plugins/hotpages.c  | 30 +++++++++++++++--------
>  contrib/plugins/howvec.c    | 27 ++++++++++++++-------
>  contrib/plugins/hwprofile.c | 39 ++++++++++++++++++++----------
>  contrib/plugins/lockstep.c  | 31 +++++++++++++++++-------
>  docs/devel/tcg-plugins.rst  | 38 +++++++++++++++---------------
>  docs/system/deprecated.rst  |  6 +++++
>  include/qemu/qemu-plugin.h  | 13 ++++++++++
>  linux-user/main.c           |  2 +-
>  plugins/api.c               |  5 ++++
>  plugins/loader.c            | 24 +++++++++++++++----
>  qemu-options.hx             |  9 ++++---
>  tests/plugin/bb.c           | 15 ++++++++----
>  tests/plugin/insn.c         | 14 +++++++++--
>  tests/plugin/mem.c          | 47 +++++++++++++++++++++++--------------
>  tests/plugin/syscall.c      | 23 ++++++++++++------
>  16 files changed, 236 insertions(+), 101 deletions(-)


--=20
Alex Benn=C3=A9e

