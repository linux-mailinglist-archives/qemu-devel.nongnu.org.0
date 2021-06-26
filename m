Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5DB3B4D46
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:57:16 +0200 (CEST)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx2Ff-0005pa-OY
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lx2Dd-0003Yr-0c
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lx2DW-0005SC-5X
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624690500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32EbtmTVBMc/z2jBwmYvGxdOcXt3Emit/wu7b5AhzSM=;
 b=DtUTqAKt1bq8LYlm1IbQXvVnTsvXVj3Ac/h0V6+J1AKHwDJwnrPMoB608ccGowTlpAvRE7
 zjmdHdr1d1yor7ywOl/HbQJF90PgojoiMh3BEakXHbcQGU3H7DB082VP+t1hb5Sk9/0JjF
 P0tQsqTFd3HKrKJyAhHYgVNB+SVGKQ0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-Tctc2mWvObGIwwMsvLStnw-1; Sat, 26 Jun 2021 02:54:57 -0400
X-MC-Unique: Tctc2mWvObGIwwMsvLStnw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso6310655edb.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32EbtmTVBMc/z2jBwmYvGxdOcXt3Emit/wu7b5AhzSM=;
 b=WWG5u0Yzn2Li9iOMXClk+LVwdQH3gFpI0r+yfvKJjQz18sBQ5T0bxg90GODQQZQetv
 IAOMq+1Zc7iDmvdPaF0Mb7motFIxWUr1IC6PU65Vyv1Cwtq0iCWVd2vSj5UrJMRZa9Sn
 DHHbm8ShYkRPN7L0eJkR8CKpf7trCuBO6mChIg3JIIlg8xcNvc46h4GvQVAGYRFDgun8
 79eSFe09KT0RMiWLQVQLlPdI0LBpTMMLHiMZw8Hoa0szd7Z9gg/CKf0L65Da54yiHAN8
 i1nAKwK2jZ3mo+jmPNq4QeuKCZ4uv8TvvC2dTMrGvge45iUBlZOLI98wgxMJfNx2hec1
 WjAA==
X-Gm-Message-State: AOAM530b7Yvi7cDwn5t/4d5QCFO/z4uC23kCKD+uQ1lSa/qg+vu/4CQz
 Qj253FOsJjZTXl/bC50T9IwptxEo9w4YzdNXMo0sa2ebHYc5SH5cC3cZeqvgF4s+6mJtTj+QR14
 CAwSPr1XJGf/hz88=
X-Received: by 2002:a17:906:d8af:: with SMTP id
 qc15mr14936458ejb.488.1624690496301; 
 Fri, 25 Jun 2021 23:54:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybc2aAXc5VqFHhYNtuRgg/i/Juw3Xg1qIsurBlHtlA2QnMrbQRPJfagCQkX1/G4MZmR8c8Mw==
X-Received: by 2002:a17:906:d8af:: with SMTP id
 qc15mr14936438ejb.488.1624690496074; 
 Fri, 25 Jun 2021 23:54:56 -0700 (PDT)
Received: from thuth.remote.csb (pd957520b.dip0.t-ipconnect.de. [217.87.82.11])
 by smtp.gmail.com with ESMTPSA id f14sm5149980edd.69.2021.06.25.23.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 23:54:55 -0700 (PDT)
Subject: Re: [RFC PATCH] tcg/plugins: enable by default for TCG builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210625112741.12566-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b12598b2-e479-cacb-5335-51cc4105d481@redhat.com>
Date: Sat, 26 Jun 2021 08:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625112741.12566-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: minyihh@uci.edu, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 13.27, Alex Bennée wrote:
> Aside from a minor bloat to file size the ability to have TCG plugins
> has no real impact on performance unless a plugin is actively loaded.
> Even then the libempty.so plugin shows only a minor degradation in
> performance caused by the extra book keeping the TCG has to do to keep
> track of instructions. As it's a useful feature lets just enable it by
> default and reduce our testing matrix a little.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/tcg-plugins.rst |  3 ++-
>   configure                  |  2 +-
>   .gitlab-ci.d/buildtest.yml | 23 -----------------------
>   3 files changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 18c6581d85..0cd77c77d2 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -71,7 +71,8 @@ API
>   Usage
>   =====
>   
> -The QEMU binary needs to be compiled for plugin support::
> +Any QEMU binary with TCG support has plugins enabled by default.
> +Earlier releases needed to be explicitly enabled with::
>   
>     configure --enable-plugins
>   
> diff --git a/configure b/configure
> index 38704b4e11..9f7161e26c 100755
> --- a/configure
> +++ b/configure
> @@ -432,7 +432,7 @@ libxml2="$default_feature"
>   debug_mutex="no"
>   libpmem="$default_feature"
>   default_devices="true"
> -plugins="no"
> +plugins="$default_feature"
>   fuzzing="no"
>   rng_none="no"
>   secret_keyring="$default_feature"
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index d9b834c848..89df51517c 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -354,29 +354,6 @@ build-some-softmmu:
>       TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
>       MAKE_CHECK_ARGS: check-tcg
>   
> -# Run check-tcg against linux-user (with plugins)
> -# we skip sparc64-linux-user until it has been fixed somewhat
> -# we skip cris-linux-user as it doesn't use the common run loop
> -build-user-plugins:
> -  extends: .native_build_job_template
> -  needs:
> -    job: amd64-debian-user-cross-container
> -  variables:
> -    IMAGE: debian-all-test-cross
> -    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
> -    MAKE_CHECK_ARGS: check-tcg
> -  timeout: 1h 30m
> -
> -build-some-softmmu-plugins:
> -  extends: .native_build_job_template
> -  needs:
> -    job: amd64-debian-user-cross-container
> -  variables:
> -    IMAGE: debian-all-test-cross
> -    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
> -    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
> -    MAKE_CHECK_ARGS: check-tcg
> -
>   clang-system:
>     extends: .native_build_job_template
>     needs:
> 

Seems to be a good idea!

Reviewed-by: Thomas Huth <thuth@redhat.com>


