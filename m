Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC122D8F31
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:58:52 +0100 (CET)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVdz-00078a-IQ
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVcb-0006GV-Gx; Sun, 13 Dec 2020 12:57:25 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVcZ-0005hM-3T; Sun, 13 Dec 2020 12:57:25 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlNcr-1kPeyp2ZoL-00liri; Sun, 13 Dec 2020 18:57:18 +0100
Subject: Re: [PATCH 2/6] configure / meson: Move check for pty.h to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-3-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f9efb562-037e-6486-e4f7-c10261cf68e1@vivier.eu>
Date: Sun, 13 Dec 2020 18:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6YMury8O/FBSOCO+9McSs3vYAfprE0sVEmkhFXNl+GzqTdViatH
 GVOPy8vilA4IK+MSNpiVyV4XD1/qHO87uwOPn2iIUFVANHDVzu5JeE+oi4dp+w3AGGKkadd
 hkwUO2/dNBa0K+XJ9FMZ/PA7sCnrW0IB299ImayzJEcGkahflN4MBqxyVTmNQADn8U936Cf
 8vh47Yz6ifYUa1l8RMfdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w2jaitEbQ5Y=:PQs7rHAms/0BEC1ICU2n8m
 l4ljZL5xCIfv1XQIh6smYjNXIXqaa6VNaUfnD2XmxbCao4e32hOCFtHqrpl8w14OPE1QOBJ/x
 UmQ/SNJMYSYb6OciB8lB7faw8r3out32N9JEvos+OqNKuVVPWxCCOtUMbxjVAUyF6Uh/wtu2G
 /D0AFn/etlmfmYnXraO8i3drRY5Z67kYPZ59W3O8DpC5beYWr0G1kPUNvDdA1SnYYuHvY47kz
 QwMtkh2Z2TCevWmHiB2XiX4iAmP3JAWtnTjzxb+pH4ifn2zehSiYch/GniaMBy4HQg32J/y8w
 nNMvdVS10rBpKeXr9sPEO4RS3uRU1rkfqlVy8Xhp5OwBqEEPBYGm54NjDROlFQu361GDSoNMV
 btTdN0VbmCbhL1nWVKxaZt9lweZKMEy/WglyZSJrUb4ywLIGWu3Pzxc0/rkMi0R1bHX/0iMy4
 hSMMRj+8eolhJwey88Y3qkY00mQj6sxm+HJU55Kl455UAIG6yx+N
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/11/2020 à 18:10, Thomas Huth a écrit :
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 9 ---------
>  meson.build | 1 +
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/configure b/configure
> index 6c8f56c514..5a5e486373 100755
> --- a/configure
> +++ b/configure
> @@ -2319,12 +2319,6 @@ else
>    l2tpv3=no
>  fi
>  
> -if check_include "pty.h" ; then
> -  pty_h=yes
> -else
> -  pty_h=no
> -fi
> -
>  cat > $TMPC <<EOF
>  #include <sys/mman.h>
>  int main(int argc, char *argv[]) {
> @@ -6667,9 +6661,6 @@ if test "$sheepdog" = "yes" ; then
>    add_to deprecated_features "sheepdog"
>    echo "CONFIG_SHEEPDOG=y" >> $config_host_mak
>  fi
> -if test "$pty_h" = "yes" ; then
> -  echo "HAVE_PTY_H=y" >> $config_host_mak
> -fi
>  if test "$have_mlockall" = "yes" ; then
>    echo "HAVE_MLOCKALL=y" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 7ddf983ff7..97a6445249 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -808,6 +808,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
>  config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
>  config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
>  
> +config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>  
>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


