Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790C3330DF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:26:11 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjrm-0001qR-AE
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjgu-0005Fp-N3; Tue, 09 Mar 2021 16:14:56 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:46925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjgs-0004C6-U8; Tue, 09 Mar 2021 16:14:56 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvrVJ-1lZCXN1IV5-00sw3q; Tue, 09 Mar 2021 22:14:34 +0100
Subject: Re: [PATCH v3 2/5] scripts/tracetool: Replace the word 'whitelist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ea41c8f1-6f4d-f2f0-5d3e-b907675fa4fc@vivier.eu>
Date: Tue, 9 Mar 2021 22:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3LEc2nj06X8TI6cQ/Miuo7kgqrvgxED/5iUfKgZBdUBjRSt5veI
 e+LU8n650QxqiYXDM9cDv7yJmJY3T+wRJPkViRy0LbhPSNwvNGuaDd5X9YC0x6UQaWSkbm8
 KTwe7AiSarGnT5+RXtY1LQZaimzQtTg7ma8iGcw9PfpHuN23kuURtXg5zqLAu2rPhDaDrjC
 JJVC/T2KmIkj9S4bBFigg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gWJnnl3Vfmc=:wNLU5zu0czF3w1P+Ru0PQz
 HvSrSzeALHB5auLjVfdwIaN9uYJo/U/fxq60JlAWEcMtYAQqQ3tlYk/ivCzO9jMRX5zNIMzJL
 Xx5c5Cq70cfLzGuMHA1lu1cCmjIrTLfpPu+dcI3/rSYRgcS4Qlo/bq/46b+EI3U5uMRIV/VBV
 jnwz5q01Ufs8mw0+K6ScIgyMUwgvDgtXNHk+aZNDCj7xtvLCgviVbj5A+V8S2S4xt2ukKb70J
 iVlnSe28PkegMddix4vs2rxEGZSenAlR/X2SWGZpyIUlglMpv09qqs5W/VKQ9FuA75PLypZmT
 g8Dt2uYcNHOMt2I7oicHbu5ApX/a00T6M/XxByvdaZaj86YpjFfDTje8vCKKCxjV2JoLpgBIg
 0JYiSn1RO8hv6K5Q5hMZqgn7RDPAFfoVwPUp3S0qzgpk4Wp35XtTSq48Gjwok/BNFz983w81l
 t/dkpFMjNA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/03/2021 à 19:46, Philippe Mathieu-Daudé a écrit :
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  scripts/tracetool/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
> index 96b1cd69a52..5bc94d95cfc 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -100,7 +100,7 @@ def validate_type(name):
>          if bit == "const":
>              continue
>          if bit not in ALLOWED_TYPES:
> -            raise ValueError("Argument type '%s' is not in whitelist. "
> +            raise ValueError("Argument type '%s' is not allowed. "
>                               "Only standard C types and fixed size integer "
>                               "types should be used. struct, union, and "
>                               "other complex pointer types should be "
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


