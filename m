Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D939CA9B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:04:47 +0200 (CEST)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbbC-0003Eb-Ai
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbaB-0002YC-PT; Sat, 05 Jun 2021 15:03:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbaA-0000Ca-18; Sat, 05 Jun 2021 15:03:43 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N9dkB-1lLTzQ4BOP-015Web; Sat, 05 Jun 2021 21:03:38 +0200
Subject: Re: [PATCH] meson: Fix 'interpretor' typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210521103423.2780345-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7d9abdeb-575d-3ec5-904b-bc676313ca14@vivier.eu>
Date: Sat, 5 Jun 2021 21:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521103423.2780345-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SHyIamiO4nTJns2LQfNY5mw98EkBjtAR3VWgba5CGmO46rXHKW6
 ow06B37NBR/DzwtJ3AV8eS1i+vHGkwmfl1UbJt/8qtrfVU9qkLa9OZXi4O2OLjVyVjbg3kt
 08CrBYmwPsGxBao6do3op1XvVR1kzlUEgtvQqy9l4lDVVrYkbDOgUYvyxqU17VC5bsAY7NV
 LXEd2B/BCBTISPZVhFS6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C4kXDvYIJxM=:mJGaIYnv/xS+VYy5vezEW1
 yhiRbRqoUTaiYekyuANHAUJuZJsBSDE5eYEbMMG5xcHJrWu/b6tYpIPRVmjHclGgD4vlC5n/b
 bD2BpmQI29ZGE5/6mQAwUOtTdf0ZloooaIgvI0V+X6sVlb3poRLGcB6VeFhd6lPic0AZo9u/4
 ogwBwcNsloiJTTw4KjivorVstc7XqVfbn0kPOTjpX+MrklV+hP/YlWnCVh5FWWdcGKsCT/pAx
 mWOEjEoUrpwAhEklPXXO4GupzJigbDYdxdDns4Z7lHgODp4S+5Ips41/8oWghkXx/u1twaiqd
 TO9zfN2GSuNMrD8y540UgXnPU/aY7LgAhnduGaPem/b+HAFstVk/I1kzL5h8VKD/qd2abB3yJ
 yoDnDdAUDefI7EgFP7D88sYKa5u5C/0/YTK/o5gLYFP5KuH5fF3Pe8lBbK6+6jD+zYGOlyCro
 E0Slop2XXnd1ZFtZAG6tuMd5+FdxnCd8g1FDLodvFQveSTQvawGOrZGKKIsUvgaVGNgWxXdl9
 U2HaU3FWrf1hEssw1knVM4=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/05/2021 à 12:34, Philippe Mathieu-Daudé a écrit :
> Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
> selected but TCG backend is available").
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 1559e8d873a..230a0e4b558 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -247,7 +247,7 @@
>        error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
>      endif
>    elif get_option('tcg_interpreter')
> -    warning('Use of the TCG interpretor is not recommended on this host')
> +    warning('Use of the TCG interpreter is not recommended on this host')
>      warning('architecture. There is a native TCG execution backend available')
>      warning('which provides substantially better performance and reliability.')
>      warning('It is strongly recommended to remove the --enable-tcg-interpreter')
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

