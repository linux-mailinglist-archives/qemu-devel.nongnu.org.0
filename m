Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A9484B27
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:27:50 +0100 (CET)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4tDY-0007nW-Va
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4tBo-0006vT-LP
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:26:03 -0500
Received: from [2a00:1450:4864:20::32a] (port=42955
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4tBn-00054J-1R
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:26:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso2278219wme.1
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QhD4S1EvEXJ03dJ9SvagkeD1VsXfrtXt0pIQoT+YSG0=;
 b=PUzAhMP98Dy9FtW2aNLySoAFT1R282KKUd9ud50SQiefRd0GExlXtU0GpF5n1Rz4gW
 oBfBgM5mRmtPMBGCUIKFKDBiU1NjCSHi+08KlHc6C+tbCY+Uxm5P3oHAGUpO5HxL+ed3
 FFR5rvz9TLJqneHP7YM6oO2d6uv75AnW8DOxGLA96TjTrvLiJ0ygFxEMuZOM++/1sT8I
 MmRHUdtoJzmgWFEKbBEAoPmg37/iZENd2Ex8WJsA4xwxtIGTl/OYMxK1zL9+DvX7k8Of
 6QzxJTjl2RU+7igf80/sAbaShHli9ghf2YpA/QSPsom8r5UijSLdJc2j2JZpfwnXabf/
 J0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QhD4S1EvEXJ03dJ9SvagkeD1VsXfrtXt0pIQoT+YSG0=;
 b=rY12xHAueEuTs69TSOQnTvnRReNq//5L9hVmXS2EUIEa7dXoilhH8SFdiLY3jOoeJG
 vrqqy45EWiwHDfWkfO5qgs1jFbz+cajTU9WOAxjzexPISLn6MviyTj2+85OMQtmFMSSz
 Ag1GTeA1jrke/tREhfPAoSha3jWe4rUaKX90gnmrXk04dgKh3D2Xw/x5F9ZpzT7EXNaO
 738Y+6RMnaFaDHVJGQcOC5azh4F6xpCvdBOoYB/VAyF/uaw6dVfCOQyS6Xz4GnfCLjnd
 qiWmydDZeYhMiz5eqZFI8E17RPardycA0a/gFTo0q4LRDymEQgVE+UHc0Vytdn9DLRBE
 Y47A==
X-Gm-Message-State: AOAM532jjQ67pKi071wx42IFiWGf1MuP3jBVbEiSHha6IrpFhOyN0Jld
 W3zd7k0vvfVCBearbpJxg5g=
X-Google-Smtp-Source: ABdhPJz8fuu6InNiI9aMHL7jtMOFugt/wcZTPRw/MXBOVpwSFA9qcRzhab4rMVrvEhY1vQw0iHNFsQ==
X-Received: by 2002:a05:600c:3b12:: with SMTP id
 m18mr494776wms.54.1641338757580; 
 Tue, 04 Jan 2022 15:25:57 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id m12sm43127521wrp.49.2022.01.04.15.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:25:57 -0800 (PST)
Message-ID: <2c5b2200-372b-000b-e7c8-95cc7c12b552@amsat.org>
Date: Wed, 5 Jan 2022 00:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH for 7.0 5/5] bsd-user-smoke: Add to build
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211127201846.64187-1-imp@bsdimp.com>
 <20211127201846.64187-6-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211127201846.64187-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kevans@freebsd.org, def@freebsd.org, richard.henderson@linaro.org,
 arrowd@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Paolo for meson

On 11/27/21 21:18, Warner Losh wrote:
> Add a simple bsd-user smoke test for ensuring bsd-user is minimally
> functional. This runs only when bsd-user has been configured. It adds a
> simple execution of 'hello world' type binaries for bsd-user. At the
> present these are tiny, hand-crafted binaries that are statically linked
> and do not depend on any host libraries being present (they also take
> advantage of the fact that on FreeBSD all system call numbers are
> uniform on all architectures). This was done both for building and
> testing simplicity, as well as recognizing the current state of bsd-user
> in qemu upstream is extremely basic.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  tests/bsd-user-smoke/meson.build | 31 +++++++++++++++++++++++++++++++
>  tests/meson.build                |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 tests/bsd-user-smoke/meson.build
> 
> diff --git a/tests/bsd-user-smoke/meson.build b/tests/bsd-user-smoke/meson.build
> new file mode 100644
> index 00000000000..586697ab3b6
> --- /dev/null
> +++ b/tests/bsd-user-smoke/meson.build
> @@ -0,0 +1,31 @@
> +if not have_bsd_user
> +   subdir_done()
> +endif
> +
> +smoke_bsd_user = find_program('smoke-bsd-user')
> +
> +bsd_user_archs = [ 'armv7', 'amd64', 'i386' ]
> +targs = []
> +foreach i : bsd_user_archs
> +    h = 'h.' + i
> +    targs += custom_target('bsd-user h.' + i,
> +        output : h,
> +	input : h + '.S',
> +	command : ['clang',

Do we want a find_program(clang) somewhere?

> +	    '-target',
> +	    i + '-unknown-freebsd14.0',

Also, I wonder if this trailer shouldn´t be populated by meson.

> +	    '-o',
> +	    '@OUTPUT@',
> +	    '@INPUT@',
> +	    '-nostdlib',
> +	    '-Wl,-e',
> +	    '-Wl,qemu_start',
> +	    '-static'],
> +	install : false)
> +endforeach
> +
> +test('bsd-user-smoke', smoke_bsd_user,
> +    args: [meson.project_build_root(), meson.current_build_dir()],
> +    suite: 'smoke',
> +    depends: targs
> +)
> diff --git a/tests/meson.build b/tests/meson.build
> index 3f3882748ae..3b95efe8896 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,6 +1,7 @@
>  py3 = import('python').find_installation()
>  
>  subdir('bench')
> +subdir('bsd-user-smoke')
>  
>  test_qapi_outputs = [
>    'qapi-builtin-types.c',

