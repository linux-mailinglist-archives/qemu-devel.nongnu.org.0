Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1892D8F36
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 19:02:50 +0100 (CET)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVhp-0004Qa-GF
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 13:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVek-0001R6-S9; Sun, 13 Dec 2020 12:59:38 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:48451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVej-0005t5-5y; Sun, 13 Dec 2020 12:59:38 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ml6i4-1kPO3N086O-00lWF0; Sun, 13 Dec 2020 18:59:33 +0100
Subject: Re: [PATCH 4/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-5-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dad361f9-5381-5ed4-7b7f-0bfdce85d23f@vivier.eu>
Date: Sun, 13 Dec 2020 18:59:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-5-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IZYWhv0eA8aDXgQ+Dl5SasHY9UPYhXUqr/oAOaVhZpMsKzdsb6W
 Y1AKDg82NqEN9Of2jICMwmm9w5QQC7ov9fAwVhmus7m71zP3+g7hMSG5OmSwe7ovujxCkVP
 fHlrXSBNq9DxTFFqzlOQ+TzZgm/9QcStpHzk1MfGlPdSy1bi6AGz2sJ7ib8lt63IM57kq6J
 Oz72x8nSdySgWrF90soKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9aDzrZMANak=:XeOAPrLhoAbDk9DVYKjisb
 aLUgj8MOcbyKZkPKj8xcMJ/mUV7nCLcTOQiCzMzvTlQseB1/lbtD3SLMKqBY5NunSI59+9H8L
 DJwe8NU4lIM5ORFNpSlDq+jV7R+S89g9j5arMI9SDPDaWAnBnRZF2cA2GjbuicazjeoUwuIsH
 ypv/uUmXXynO5edEqnO+wKD7MYt92vTjH7trQyMXSYsvVXPn1YD8zusY0qNqU/iarreNDCGsu
 zd+4MH2bpUOxju4r3L1e9ynPiWcnLg/EDdnbF+RXtTwiKPRm72IJPaNThWIWKcxMcWo9lNcny
 nwXgmgUEX5DUEctaWt2w9plZLJ7UZIGu9PdDKA30ewGYY7QuDxV8DO3Ss4QTkCFauGbgAOS5o
 UfdL86kQ55mI5re1z3JvyTm6rReuQNROaFVP6WOCuiaTapWCggkSLnkp2mUi4Bt5PdpIvm2dW
 iULNzrwx3A==
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
> index b3e1052a58..871e4bb9fb 100755
> --- a/configure
> +++ b/configure
> @@ -3088,13 +3088,6 @@ EOF
>      fi
>  fi
>  
> -#########################################
> -# sys/signal.h check
> -have_sys_signal_h=no
> -if check_include "sys/signal.h" ; then
> -  have_sys_signal_h=yes
> -fi
> -
>  ##########################################
>  # VTE probe
>  
> @@ -6184,9 +6177,6 @@ fi
>  if test "$have_openpty" = "yes" ; then
>      echo "HAVE_OPENPTY=y" >> $config_host_mak
>  fi
> -if test "$have_sys_signal_h" = "yes" ; then
> -    echo "HAVE_SYS_SIGNAL_H=y" >> $config_host_mak
> -fi
>  
>  # Work around a system header bug with some kernel/XFS header
>  # versions where they both try to define 'struct fsxattr':
> diff --git a/meson.build b/meson.build
> index d6b633f17f..054e40e9a5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -811,6 +811,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>  config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
> +config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
>  
>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>  arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


