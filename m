Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AF31ADC7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 20:31:14 +0100 (CET)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB0dN-0001zb-EK
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 14:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0bN-0001VE-Rt
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:29:09 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB0bM-0004D5-1v
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 14:29:09 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyK5K-1m5KAk48iq-00yjKk; Sat, 13 Feb 2021 20:29:03 +0100
Subject: Re: [PATCH] linux-user: add TARGET_SO_{DOMAIN,PROTOCOL}
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
References: <20210204153925.2030606-1-Jason@zx2c4.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0d9be3c7-5ba6-f5ba-2589-961c5bea7164@vivier.eu>
Date: Sat, 13 Feb 2021 20:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204153925.2030606-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R5bsyJm2frsZFTSXfBEeCKihbaArvr6TKuSY4xuJvH/tWA91JDC
 0gS1q5mdLBa1PS+IbLHGqTplR0JwlAtfjoVdeijgmJNoCfqZrO7gjTn+wvdSoMoZ4jFX7ng
 6Xh+FiqTErZDLWUFEUAihL5y+C02J0q3irpKjlP9/3yZfLZFlQdHx1BmZUloUkkRfYsw15a
 iPtPRifBXmwv2S6HJkWBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VImXFAZNplg=:0HolN2FSv/fa35s9G1c9y+
 6YunYcLHUVd2j0UwIHXNKeRxaU6Y9lpwkj4JbJc0wM8mrJQe28RiqtBPNfpUp1rXfNq4JtRbC
 rrtJRsCduG4kGZBB/NS6SFh+Q4WI3jWZgoTyEkjPpXs4QUeXty2qQ54QUh3XPYnOUSX2gsz5M
 pjNuc91n/+cFDKlh+EdH99bqejqfvcfQ1j5A63GIkCy9U5a8wFY0Z9SwLzVKtv7v9ihuj6pMe
 qmWkxuUIAEUJ7Q2C448x5Lwr4ZIv4L2QwZN3ypW11nLna+j3oxQ54m3y10uSrjbDvbd+1dvaI
 wqGiZ7Z23B2rfWd0GrJrde+QjYLaTvwgStGvpno5KQQh4AmLVcZuZ6N3mHqMWXTbD50rp/Fhz
 Z+DQNb00AD+QQDpmzMOL6FSqo5MFKPw3HllLmdRofS45cetBuyBv6Fttjfxp7MxkeVd2E7FaD
 2b57qGS5ZA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/02/2021 à 16:39, Jason A. Donenfeld a écrit :
> These were defined for other platforms but mistakenly left out of mips
> and generic, so this commit adds them to the places missing. Then it
> makes them be translated in getsockopt.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  linux-user/generic/sockbits.h | 3 +++
>  linux-user/mips/sockbits.h    | 2 ++
>  linux-user/syscall.c          | 6 ++++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
> index e44733c601..b3b4a8e44c 100644
> --- a/linux-user/generic/sockbits.h
> +++ b/linux-user/generic/sockbits.h
> @@ -55,4 +55,7 @@
>  #define TARGET_SO_ACCEPTCONN           30
>  
>  #define TARGET_SO_PEERSEC              31
> +
> +#define TARGET_SO_PROTOCOL             38
> +#define TARGET_SO_DOMAIN               39
>  #endif
> diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
> index 0f022cd598..562cad88e2 100644
> --- a/linux-user/mips/sockbits.h
> +++ b/linux-user/mips/sockbits.h
> @@ -40,6 +40,8 @@
>  #define TARGET_SO_SNDTIMEO     0x1005  /* send timeout */
>  #define TARGET_SO_RCVTIMEO     0x1006  /* receive timeout */
>  #define TARGET_SO_ACCEPTCONN   0x1009
> +#define TARGET_SO_PROTOCOL     0x1028  /* protocol type */
> +#define TARGET_SO_DOMAIN       0x1029  /* domain/socket family */
>  
>  /* linux-specific, might as well be the same as on i386 */
>  #define TARGET_SO_NO_CHECK     11
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 34760779c8..264b3265b1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2832,6 +2832,12 @@ get_timeout:
>          case TARGET_SO_ACCEPTCONN:
>              optname = SO_ACCEPTCONN;
>              goto int_case;
> +        case TARGET_SO_PROTOCOL:
> +            optname = SO_PROTOCOL;
> +            goto int_case;
> +        case TARGET_SO_DOMAIN:
> +            optname = SO_DOMAIN;
> +            goto int_case;
>          default:
>              goto int_case;
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

