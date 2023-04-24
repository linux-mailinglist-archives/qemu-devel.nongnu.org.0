Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE46EC9CB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 12:07:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqt5R-0005oU-QQ; Mon, 24 Apr 2023 06:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqt5P-0005oK-Pc
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:06:19 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqt5O-0005x0-1n
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:06:19 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-506bf4cbecbso6086476a12.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682330775; x=1684922775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o+MbnKPyRhG6SO5R20HhiCg6PN0n/kMA6v0f2lhYFXw=;
 b=vqalYHWuiIVRLaDpN4XqyNejhOoUcvzLL5GaPN/gfBZJJqJW6uQ1NV0ZZMc0ZH5ltV
 wsTFrnlfAMl72g0Jz1kKk5YSM1RITCTCJgr9epYlwRt3j6jHIRF9AiFqzViOB6vTR7y0
 6nmZrrKMFNsnK7wIK3XTyTyq45EHNPGRJSx+pa9E1PiJsgH1o/ecvM+TiiGT9jLjBLr8
 8E1rMRLSPSsFi/4K+b1KSoIh57NYh9TYYFPw39ZIITfgYTfMsi4NNCpW9opiy1v+ew2/
 CjKRoNaJKznUIEQxaRnJezxWQbxNVu5zDsVSI4T3jQ1cwbkEBc7Qjr/Ww5yi2zQt6uHv
 zrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682330775; x=1684922775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+MbnKPyRhG6SO5R20HhiCg6PN0n/kMA6v0f2lhYFXw=;
 b=iSiBSI/8YGfKl7ty1PbxBfNFNkvCA1rGXXFyxSjGCwKEWvHaYn0xaqk8ANTHBeGbUX
 CL+vXY0zRomF3sRD1bdJ2NonKMVR4TRqApAfqxXHTde71YeZ3PUOo/8GoyaRGchv4bmH
 U6FoaMF9vPcEF54GKKep5XjoJaeaRN+rVNhwY6QQJzzoApgDUJf2fPvELPhbh/t/Xc0O
 Ci205PPWXXr4YiCH8sXI419A3Ngxdyey+5UkEXYVpmJTkVH/prtkpxvQbZDZurR/xZu6
 TD2UaYUEDkLSvWI0c9USlu2rga6YsQWvdK/QW6c3PGAerbXaP1M92SfEVYDl+GPLTS3A
 /fww==
X-Gm-Message-State: AAQBX9cXsvxGnmZPMljriLCK+bfCJn/q9YFP6/FEOuT+PR1Wh7+u/kW/
 u9ZlFY15wWgDH+lE3WzKTEmfMFjy7ZQ28YLmXQm+Zw==
X-Google-Smtp-Source: AKy350Ye1EXeln5621svChAejr8/IXpgai2Z1x3r/hUhWETDY8B/JTGTgmN1O6UHZJdJRt1nudwzrqEvCCpAP1SmeN4=
X-Received: by 2002:aa7:c592:0:b0:508:3f08:ea0f with SMTP id
 g18-20020aa7c592000000b005083f08ea0fmr11562828edq.28.1682330774929; Mon, 24
 Apr 2023 03:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-11-peter.maydell@linaro.org>
In-Reply-To: <20230417164041.684562-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2023 11:06:03 +0100
Message-ID: <CAFEAcA_hskariW7ZbzUgNcDpOLpqR1p+-37Li0zfGyNXPK-4wg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
To: Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, libvir-list@redhat.com, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus -- could I trouble you for a quick review of this patch?
It's the only one in the series that touches QMP. Everything
else has been reviewed so otherwise this series is ready to go in.

thanks
-- PMM

On Mon, 17 Apr 2023 at 17:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The 'singlestep' member of StatusInfo has never done what the QMP
> documentation claims it does.  What it actually reports is whether
> TCG is working in "one guest instruction per translation block" mode.
>
> We no longer need this field for the HMP 'info status' command, as
> we've moved that information to 'info jit'.  It seems unlikely that
> anybody is monitoring the state of this obscure TCG setting via QMP,
> especially since QMP provides no means for changing the setting.  So
> simply deprecate the field, without providing any replacement.
>
> Until we do eventually delete the member, correct the misstatements
> in the QAPI documentation about it.
>
> If we do find that there are users for this, then the most likely way
> we would provide replacement access to the information would be to
> put the accelerator QOM object at a well-known path such as
> /machine/accel, which could then be used with the existing qom-set
> and qom-get commands.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> For v3: because we're only deprecating the existing member,
> not trying to provide a replacement with a new name, we don't
> need to update the iotests that use the command. (We will when
> we eventually drop the deprecated member.)
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  qapi/run-state.json       | 14 +++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6f5e689aa45..d5eda0f566c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -199,6 +199,20 @@ accepted incorrect commands will return an error. Users should make sure that
>  all arguments passed to ``device_add`` are consistent with the documented
>  property types.
>
> +``StatusInfo`` member ``singlestep`` (since 8.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``singlestep`` member of the ``StatusInfo`` returned from the
> +``query-status`` command is deprecated. This member has a confusing
> +name and it never did what the documentation claimed or what its name
> +suggests. We do not believe that anybody is actually using the
> +information provided in this member.
> +
> +The information it reports is whether the TCG JIT is in "one
> +instruction per translated block" mode (which can be set on the
> +command line or via the HMP, but not via QMP). The information remains
> +available via the HMP 'info jit' command.
> +
>  Human Monitor Protocol (HMP) commands
>  -------------------------------------
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 9d34afa39e0..daf03a6fe9c 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -104,16 +104,24 @@
>  #
>  # @running: true if all VCPUs are runnable, false if not runnable
>  #
> -# @singlestep: true if VCPUs are in single-step mode
> +# @singlestep: true if using TCG with one guest instruction
> +#              per translation block
>  #
>  # @status: the virtual machine @RunState
>  #
> +# Features:
> +# @deprecated: Member 'singlestep' is deprecated (with no replacement).
> +#
>  # Since: 0.14
>  #
> -# Notes: @singlestep is enabled through the GDB stub
> +# Notes: @singlestep is enabled on the command line with
> +#        '-accel tcg,one-insn-per-tb=on', or with the HMP
> +#        'one-insn-per-tb' command.
>  ##
>  { 'struct': 'StatusInfo',
> -  'data': {'running': 'bool', 'singlestep': 'bool', 'status': 'RunState'} }
> +  'data': {'running': 'bool',
> +           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' ]},
> +           'status': 'RunState'} }
>
>  ##
>  # @query-status:
> --
> 2.34.1

