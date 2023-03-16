Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B56BD11E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 14:42:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcnqh-0007pV-Al; Thu, 16 Mar 2023 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcnqe-0007oh-Ms; Thu, 16 Mar 2023 09:40:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcnqc-0002Lq-6c; Thu, 16 Mar 2023 09:40:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLQl3-1pteH926Pj-00IT0E; Thu, 16 Mar 2023 14:40:45 +0100
Message-ID: <8f048b8a-55f0-d124-3cb7-9a34e863149f@vivier.eu>
Date: Thu, 16 Mar 2023 14:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20230314114431.1096972-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230314114431.1096972-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:as4uXfrmyqrFWdQ6ZmQiwokWrpepZKqt+PF8LdvlHMJlLrC0jLW
 wq7TUx/U656VgXDnSElub0mPWo1L8rLK+YU/FD6pcZy/v2PRE6wNcmlPgr/XnS2v54EIuIV
 +HVpIDxtyZE3WIgG+tls1oRP0cpcjKSeVVmicBoh/2gbCX3gHgG8c4wN6XCzFHJz7+p/EEx
 oazY+Vp50bnrcniEEzIVA==
UI-OutboundReport: notjunk:1;M01:P0:CpzenYNVGo4=;flUSVhnkFc/OqMR7fN5AUoPolx2
 zYCHfcM5MKPS1rhAYup2fIV5GZi0/S75hZBrFKfCTgZCicHEXJ8UWHfHoK51+yOFbJ9Vw4NAk
 ZUr64uZRKppf5wSjB2lHJLiKFlYbqvq17xGI8D/e2OhRZt1+7IzUZ1hNA2UKQuBOlJeNAfPmi
 aZIOwZCjy8GKnPT6lJ6sDDTT3VZI9sdlm2Pb00Lq4os7BOfEwlKh8mAYsfrxYc4zn7UQ75GYk
 dw+TRMFzDcEbS7DAKEAub3r2po89pX5me1tvd+0opK6fQ7ZJf7JslJJlIfIaGIr1a1nri8kuf
 lRXNQ7Q9AoIUB6PQJZdhVaFHB3ItI8CNNx1ZvTk1FkNh1e2FekE/7Hip7y/z+jrOqrmdZEBnc
 YDDVOg70aTNUVZR61dJrWVK/5dbQqPMb4OrHY0VBpfrNZ7JTDc+h9oa3Hk7byO2H+UYI0GFI9
 Eout72BFs9+QDlmfr8MRha4GLwyRM7riIBMt3YAgaF4uE17Sl0ZHQ2VtlLMSlHrC1WYX1+evV
 HXx+uh0HPQ2VTQFhrmNfm32rhyPfZoWdN3/y2s8KcugvEpDMZb2K1JF4mH/8Ax5YK4ZHkshcu
 6M8VKZ5XjIZuEB0IFuPHt+fSvPLh56U1NeUTGCiEeGHgnsPGFwYOP1j+ift0hg+jHWVn/+OiY
 0AYruExB5csAoRj1x8CTt0zH2DYZyuchJBsEDac6HA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 14/03/2023 à 12:44, Peter Maydell a écrit :
> Currently, the kerneldoc Sphinx plugin doesn't honour the
> --enable-werror configure option, so its warnings are never fatal.
> This is because although we do pass sphinx-build the -W switch, the
> warnings from kerneldoc are produced by the scripts/kernel-doc script
> directly and don't go through Sphinx's "emit a warning" function.
> 
> When --enable-werror is in effect, pass sphinx-build an extra
> argument -Dkerneldoc_werror=1.  The kerneldoc plugin can then use
> this to determine whether it should be passing the kernel-doc script
> -Werror.
> 
> We do this because there is no documented mechanism for
> a Sphinx plugin to determine whether sphinx-build was
> passed -W or not; if one is provided then we can switch to
> that at a later date:
> https://github.com/sphinx-doc/sphinx/issues/11239
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: we need to land the fix for the current outstanding
> warning before this one can go in...
> https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/
> ---
>   docs/meson.build         | 2 +-
>   docs/sphinx/kerneldoc.py | 5 +++++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index bb72c10ea8c..f220800e3e5 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -7,7 +7,7 @@ if sphinx_build.found()
>     SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build, '-q']
>     # If we're making warnings fatal, apply this to Sphinx runs as well
>     if get_option('werror')
> -    SPHINX_ARGS += [ '-W' ]
> +    SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
>     endif
>   
>     # This is a bit awkward but works: create a trivial document and
> diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
> index bf442150165..72c403a7379 100644
> --- a/docs/sphinx/kerneldoc.py
> +++ b/docs/sphinx/kerneldoc.py
> @@ -74,6 +74,10 @@ def run(self):
>           # Sphinx versions
>           cmd += ['-sphinx-version', sphinx.__version__]
>   
> +        # Pass through the warnings-as-errors flag
> +        if env.config.kerneldoc_werror:
> +            cmd += ['-Werror']
> +
>           filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
>           export_file_patterns = []
>   
> @@ -167,6 +171,7 @@ def setup(app):
>       app.add_config_value('kerneldoc_bin', None, 'env')
>       app.add_config_value('kerneldoc_srctree', None, 'env')
>       app.add_config_value('kerneldoc_verbosity', 1, 'env')
> +    app.add_config_value('kerneldoc_werror', 0, 'env')
>   
>       app.add_directive('kernel-doc', KernelDocDirective)
>   

I've applied it to my trivial-patches branch,
but if you want to apply it via some doc or misc branches, let me know.

Thanks,
Laurent

