Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA82D8F30
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:57:47 +0100 (CET)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVcw-00067M-5y
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVbb-0005dx-4D; Sun, 13 Dec 2020 12:56:23 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:56487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVbV-0005U0-Iq; Sun, 13 Dec 2020 12:56:22 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MeCYx-1kE4OA0tdv-00bNqs; Sun, 13 Dec 2020 18:56:13 +0100
Subject: Re: [PATCH 1/6] configure: Remove the obsolete check for ifaddrs.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-2-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3849113b-ba89-b5e1-e680-961a9c7eae4f@vivier.eu>
Date: Sun, 13 Dec 2020 18:56:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cP06FEVKCant+k6SMPyh6GG/0fVoCPp82zQYDlWlZvQebRUpqUo
 SSNGpHe1hPeVLAk4aPHWoP4hDsLU87LXdLYvsMCdK2jGmYkX9sWHiXnkhUri+7XdfwZ2/JS
 j+Kogn1mUEsS24q8GJjLGPzrdj3Dh3+b5kZCfJ4nEtfHefQxWF6QTdYGHg0loehiN6aZEWO
 bMZCGNkh41Mdwmn6dee3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MkltDWmeXws=:ctTJCg8KwbKaxLmV8mfwj0
 BfH4RBsOMijLpDDc676+L0PBc/2WSN+cA4u8xr0mzVHypsaRc8BPpGyfDz7ytiuPrwaySsigx
 J+z3HBfpXKK0R6CChUrcTEEM30BHwfxc9jMZTSVPjQGNZPboMSpRlUWx8jQovPibHMCxkvga7
 TCJYHCVUEM3mBnm2bJHyd5qVa8lDDphIOixJmNFF1pRNNOgd1MKJxRotpd2anOEt/s5v2P21b
 LMoReXsxvzH5TUUDbHvAn+V/dPHrHcI9crJVIFwxCTIe2ZL+D87ou7aLpaEjgMrZMmdhXfxn4
 tLU4OM1srbwMPGr4CNqZXYrOrRwLTm0a6zN7SQZGwNV8qBN2THf5Zp2cS3M9Qqh9aQbFLeUWq
 Ea60iMbCbl4fEKAR52JOABEZwbyHLpoYOoEIptdgEHm2+Y0aCtZr0EGl9XeUQckuDPxmdzS8W
 Q8WOQZ6O0g==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
> The code that used HAVE_IFADDRS_H has been removed in commit
> 0a27af918b ("io: use bind() to check for IPv4/6 availability"),
> so we don't need this check in the configure script anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 714e75b5d8..6c8f56c514 100755
> --- a/configure
> +++ b/configure
> @@ -3094,14 +3094,6 @@ EOF
>      fi
>  fi
>  
> -##########################################
> -# getifaddrs (for tests/test-io-channel-socket )
> -
> -have_ifaddrs_h=yes
> -if ! check_include "ifaddrs.h" ; then
> -  have_ifaddrs_h=no
> -fi
> -
>  #########################################
>  # libdrm check
>  have_drm_h=no
> @@ -6199,9 +6191,6 @@ fi
>  if test "$auth_pam" = "yes" ; then
>      echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
>  fi
> -if test "$have_ifaddrs_h" = "yes" ; then
> -    echo "HAVE_IFADDRS_H=y" >> $config_host_mak
> -fi
>  if test "$have_drm_h" = "yes" ; then
>    echo "HAVE_DRM_H=y" >> $config_host_mak
>  fi
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

