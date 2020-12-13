Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34122D8F33
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 19:00:09 +0100 (CET)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVfF-0001On-1K
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 13:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVdT-0007kB-UB; Sun, 13 Dec 2020 12:58:19 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVdS-0005ml-8m; Sun, 13 Dec 2020 12:58:19 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlNcr-1kPfCK3RHx-00liyd; Sun, 13 Dec 2020 18:58:14 +0100
Subject: Re: [PATCH 3/6] configure / meson: Move check for drm.h to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-4-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ef482144-14d1-9a7b-93f3-0028a81c41e7@vivier.eu>
Date: Sun, 13 Dec 2020 18:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-4-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ilN//mpyn0VsUptRhT3R6xReJFDD0y6TUzarUXAzfS93jF7N6P+
 fZdnaCJgFdyGJROTXTm1JN+7h9ulIlNmrxFU0ZyxSImpwyEnN/2CPGE58Eh37Twlf8r7Gtk
 GAYmJJ/QKqC05PqYnp8nr5eMHbZ+0M+sYM/aPQ2gFCRS+2kc9sQoCr809ELd5DnpVg3reGw
 qpvIi3O2UEn33uf+2LODg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Eic9F1jrduQ=:mlg+Bkoh6TgY9DuF1g97KW
 VTDUdDmFtoEqDdf5/RB9YqqsHr64OJDua93zhlb/rgzrTKcYpmUSwM6pyl1j41/CL1RnmjxJY
 DOnwMxn8TU7t8vqJOcxeXstz24om1TikXBFWgnKb/xonWm33Qx98jGUOX19neJ7ys2ZdD5AWO
 BlKlQuH5QirB5HAgAi47iH67kz1BAkTWuvwpnUXQFnJNL2kMW5QKTdOguht4jpcReZmgvgVNP
 1kJAKIZ5iEDdq6AYTU4/SuO/1EluwuWWhNuH0zjmbd0O3eMLnzPVXUSBNd0VhEY2vwyMVEtvU
 tgZVIQOzWMmJtzDKICIJHTGqDFupzgZdn2mD8aRnfgkC5lXfIbZsgn6pFughZFms69srsUGmn
 kQ7+T9jhsae6biTDAN2dCIzm6FSFFxrbYzEpbj9V1VM0yxGcMX9HTzM1VLi8qF2d8cDV9ykiN
 7iZ5XC7SMQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
>  configure   | 10 ----------
>  meson.build |  1 +
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/configure b/configure
> index 5a5e486373..b3e1052a58 100755
> --- a/configure
> +++ b/configure
> @@ -3088,13 +3088,6 @@ EOF
>      fi
>  fi
>  
> -#########################################
> -# libdrm check
> -have_drm_h=no
> -if check_include "libdrm/drm.h" ; then
> -    have_drm_h=yes
> -fi
> -
>  #########################################
>  # sys/signal.h check
>  have_sys_signal_h=no
> @@ -6185,9 +6178,6 @@ fi
>  if test "$auth_pam" = "yes" ; then
>      echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
>  fi
> -if test "$have_drm_h" = "yes" ; then
> -  echo "HAVE_DRM_H=y" >> $config_host_mak
> -fi
>  if test "$have_broken_size_max" = "yes" ; then
>      echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 97a6445249..d6b633f17f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -808,6 +808,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
>  config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
>  config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
>  
> +config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>  config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

