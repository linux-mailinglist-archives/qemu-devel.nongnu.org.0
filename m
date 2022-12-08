Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C3646978
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:55:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3AoU-0002zZ-EE; Thu, 08 Dec 2022 01:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1p3AoO-0002zJ-RZ
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:55:18 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1p3AoK-00063y-Vy
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:55:16 -0500
Received: from [192.168.178.59] (pd9ec324f.dip0.t-ipconnect.de [217.236.50.79])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id B26DCDA0BEB;
 Thu,  8 Dec 2022 07:55:10 +0100 (CET)
Message-ID: <f418a280-a0c1-0df6-0a8e-b8f8a9eeab49@weilnetz.de>
Date: Thu, 8 Dec 2022 07:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-12-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 11/21] docs: Build and install all the docs in a single
 manual
In-Reply-To: <20210112165750.30475-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.262,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.01.21 um 17:57 schrieb Peter Maydell:
[...]
> diff --git a/docs/meson.build b/docs/meson.build
> index fae9849b79b..bb14eaebd3b 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -46,19 +46,11 @@ if build_docs
>                             meson.source_root() / 'docs/sphinx/qmp_lexer.py',
>                             qapi_gen_depends ]
>   
> -  configure_file(output: 'index.html',
> -                 input: files('index.html.in'),
> -                 configuration: {'VERSION': meson.project_version()},
> -                 install_dir: qemu_docdir)
> -  manuals = [ 'devel', 'interop', 'tools', 'specs', 'system', 'user' ]
>     man_pages = {
> -    'interop' : {
>           'qemu-ga.8': (have_tools ? 'man8' : ''),
>           'qemu-ga-ref.7': 'man7',
>           'qemu-qmp-ref.7': 'man7',
>           'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
> -    },
> -    'tools': {
>           'qemu-img.1': (have_tools ? 'man1' : ''),
>           'qemu-nbd.8': (have_tools ? 'man8' : ''),
>           'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
> @@ -66,53 +58,47 @@ if build_docs
>           'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
>           'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
>           'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
> -    },
> -    'system': {
>           'qemu.1': 'man1',
>           'qemu-block-drivers.7': 'man7',
>           'qemu-cpu-models.7': 'man7'
> -    },
>     }
>   
>     sphinxdocs = []
>     sphinxmans = []
> -  foreach manual : manuals
> -    private_dir = meson.current_build_dir() / (manual + '.p')
> -    output_dir = meson.current_build_dir() / manual
> -    input_dir = meson.current_source_dir() / manual
>   
> -    this_manual = custom_target(manual + ' manual',
> +  private_dir = meson.current_build_dir() / 'manual.p'
> +  output_dir = meson.current_build_dir() / 'manual'
> +  input_dir = meson.current_source_dir()
> +
> +  this_manual = custom_target('QEMU manual',
>                   build_by_default: build_docs,
> -                output: [manual + '.stamp'],
> -                input: [files('conf.py'), files(manual / 'conf.py')],
> -                depfile: manual + '.d',
> +                output: 'docs.stamp',
> +                input: files('conf.py'),
> +                depfile: 'docs.d',
>                   depend_files: sphinx_extn_depends,
>                   command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
>                             '-Ddepfile_stamp=@OUTPUT0@',
>                             '-b', 'html', '-d', private_dir,
>                             input_dir, output_dir])
> -    sphinxdocs += this_manual
> -    if build_docs and manual != 'devel'
> -      install_subdir(output_dir, install_dir: qemu_docdir)
> -    endif
> +  sphinxdocs += this_manual
> +  install_subdir(output_dir, install_dir: qemu_docdir, strip_directory: true)

This line causes a build warning with the latest code:

../../../docs/meson.build:74: WARNING: Project targets '>=0.61.3' but 
uses feature deprecated since '0.60.0': install_subdir with empty 
directory. It worked by accident and is buggy. Use install_emptydir instead.

It looks like `qemu_docdir` is no longer defined anywhere.

I still did not find out whether this is an issue which needs a fix for 7.2.

Stefan

>   
> -    these_man_pages = []
> -    install_dirs = []
[...]

