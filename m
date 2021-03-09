Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89663330E3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:28:06 +0100 (CET)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjtd-0005Bv-O1
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjje-0007pb-36; Tue, 09 Mar 2021 16:17:46 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjjW-0005QI-51; Tue, 09 Mar 2021 16:17:43 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEVmm-1lYZyD2ZRq-00G0Xh; Tue, 09 Mar 2021 22:17:16 +0100
Subject: Re: [PATCH v3 5/5] tests/fp/fp-test: Replace the word 'blacklist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-6-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a19c2ef3-1c85-4e3f-010d-ee4bd8687cf9@vivier.eu>
Date: Tue, 9 Mar 2021 22:17:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pwuK/AVPs+j3JgOA10NyXz6vjLK64tPpfzQHSsCShCkzemb+Uxq
 yUi1D1IHFHqT6JoXVF64y0Kzg+jKhk9fyixcGCsfKwCXAJYMVHfz/Wnck0e5uBKBX3VW/yL
 giZ/15jiNJsSbYqZE+P92JC9OD2ACwSiChuJTIAf/4EB9Igz/RpQZ3ftUpFyl6Ea2nv8lJK
 3dG6Gc89jrym8lB+xzP9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YlwF/tstTdI=:n6qBWkTt4NNFKJODntv73K
 QL85z7S64HDsJX400Jvf2jSGIctt+qej53KBMGWem2xIq/WKg3fe/FEDBObl0cC6ar0C8bGin
 ilLxOLLYjiWGpCHSehYTAjX0rTC82c1yfipwZ0ygULDvOAI9ntAdu/YEOuj1A2ADH5cztepqB
 SMlBr7f1j/5PmhHSGJIFoQJ8ESzKjH7ErVEF/SMbkaY8DOrNyRBoStN9FI5bx5uzPYQQ92L6G
 n6psocvV5pbx+rVCUDxtMrCIKfMODY/fHWNIMHlB8tm3GEFkL7YXGv6XYVSJ+0TqNAVQwRGaB
 7vxcg26OiBG8UK6BNhRzgPsKOAmi7Gzk2u4v66OUXK5w7f1+DqSGu0WKL881iGkPLx1RB+Rqz
 A/Yuk/w6DNXh1GYWKRS3nfdG5qnLlIetgnRFY5eCZmciVOkDXd1oeoIi/YEOu
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/fp/fp-test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
> index 06ffebd6db1..5a4cad8c8b2 100644
> --- a/tests/fp/fp-test.c
> +++ b/tests/fp/fp-test.c
> @@ -123,7 +123,7 @@ static void not_implemented(void)
>      fprintf(stderr, "Not implemented.\n");
>  }
>  
> -static bool blacklisted(unsigned op, int rmode)
> +static bool is_allowed(unsigned op, int rmode)
>  {
>      /* odd has not been implemented for any 80-bit ops */
>      if (rmode == softfloat_round_odd) {
> @@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
>          case F32_TO_EXTF80:
>          case F64_TO_EXTF80:
>          case F128_TO_EXTF80:
> -            return true;
> +            return false;
>          }
>      }
> -    return false;
> +    return true;
>  }
>  
>  static void do_testfloat(int op, int rmode, bool exact)
> @@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
>      verCases_writeFunctionName(stderr);
>      fputs("\n", stderr);
>  
> -    if (blacklisted(op, rmode)) {
> +    if (!is_allowed(op, rmode)) {
>          not_implemented();
>          return;
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


