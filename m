Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8B3CD67E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:23:11 +0200 (CEST)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UAo-0005xk-QD
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5U9i-0004ad-EQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:22:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5U9f-0004TI-Po
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:22:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k4so22245332wrc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NfSCEb+KbVhaa0cQIQO0UyiLSvOzHI9HhLS64PO0YdA=;
 b=mBXTzntQC/ogckwyIbkpA49jtxPa8OnnM10Sbra3rF/diwSulKt7xCApyI/vFR2sqT
 QV7GKYlKr7fnvHWeNC5l7iWis3zXjzJIkx12bT5LrdWa4+rEUEbGCcD8zjQ9+RHTGwjh
 vf6gZ3JWgsOasa+sOE9SH3pc9ZsyRrNeIxwTFIEIHzu1lVgfq/fWAlFhTKN0dZZZ8Ehf
 WIctXkevCHJaGMouPhXHwiWOgIWoJ8BRWyx5cB0Vm29aXHSvmuLHjQXrmjBIIjzMKOnq
 dTiax89TZTrgSXvmPOOH/DcgFgFO3isjRhJBojAfzjhfUWFwBSYWMHLOhXTCRQlDQabb
 FdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NfSCEb+KbVhaa0cQIQO0UyiLSvOzHI9HhLS64PO0YdA=;
 b=tagIFJcjYmKe+lSw/Syx8MMwZbCKqmUVl0rrgiymXV9KHxe4DpV2vygwSV222kRSO5
 Ot1sy/qPuTUNEPzW1jOB5mkcq/e4nT1wlEmmiSlS8a74UMiNWAQrustPbBSp4hp/yApf
 js2NJDQNq4F5vqch2C5i+iqMJ6YIsuOyajUw2LHX+NU7dIa1PUA7TAFbGiJgzD0sy1nl
 mP2mE9AZnJU/wvd1PjXl4X2YpUZpZZgwM+TOgLPQAe0UsdbkldEvFJ8cDTgJky0kLpvO
 8CqH5zx8uxnPOo8x9ow1ygzlTZ50ZEaL82xMjQQeHgYvF4UaZj3EtDU+WW2amAIC2kOM
 fyGw==
X-Gm-Message-State: AOAM531MRgTits1XI9A4FjTYqtU7V7ljFFYvqHxsKkLqcjEOJt/x8HTJ
 KwKi4GtPLAjo/cGMmuQ0tSIEuw==
X-Google-Smtp-Source: ABdhPJxHX9Yh//PaqPQROySY6hgdhX+iObsz2OdFfA3YTqhKHYdVAU4CCO+sdgdklvU65D+tFBLqrw==
X-Received: by 2002:a5d:46cc:: with SMTP id g12mr29037751wrs.136.1626704517822; 
 Mon, 19 Jul 2021 07:21:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm20226772wrw.7.2021.07.19.07.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:21:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F0BB1FF7E;
 Mon, 19 Jul 2021 15:21:56 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-3-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 02/13] plugins/api: added a boolean parsing plugin api
Date: Mon, 19 Jul 2021 15:11:34 +0100
In-reply-to: <20210717100920.240793-3-ma.mandourr@gmail.com>
Message-ID: <87fswapenv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

> This call will help boolean argument parsing since arguments are now
> passed to plugins as a name and value.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  include/qemu/qemu-plugin.h | 13 +++++++++++++
>  plugins/api.c              |  5 +++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index dc3496f36c..7d0b23c659 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -564,4 +564,17 @@ int qemu_plugin_n_max_vcpus(void);
>   */
>  void qemu_plugin_outs(const char *string);
>=20=20
> +/**
> + * qemu_plugin_bool_parse() - parses a boolean argument in the form of
> + * "<argname>=3D[on|yes|true|off|no|false]"
> + *
> + * @name: argument name, the part before the equals sign
> + * @val: argument value, what's after the equals sign
> + * @ret: output return value
> + *
> + * returns true if the combination @name=3D@val parses correctly to a bo=
olean
> + * argument, and false otherwise
> + */
> +bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret=
);
> +
>  #endif /* QEMU_PLUGIN_API_H */
> diff --git a/plugins/api.c b/plugins/api.c
> index 332e2c60e2..43e239f377 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -383,3 +383,8 @@ void qemu_plugin_outs(const char *string)
>  {
>      qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
>  }
> +
> +bool qemu_plugin_bool_parse(const char *name, const char *value, bool *r=
et)
> +{
> +    return qapi_bool_parse(name, value, ret, NULL);
> +}

I'm not sure we want to have such a naive pass through of
qapi_bool_parse here. For one thing I think all the current call sites
guarantee value will be set to something. I think that's still the case
for args we supply to plugin_init because of our pre-processing but the
plugin user could at any point decide to parse a random string pair with
it.

We should check for name/value being non-NULL before the pass through I
think.

--=20
Alex Benn=C3=A9e

