Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE93330D5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:23:56 +0100 (CET)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjpb-0006AL-On
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjgC-0003qU-Lz; Tue, 09 Mar 2021 16:14:12 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjgA-0003qa-Jb; Tue, 09 Mar 2021 16:14:12 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEFCF-1lR7XN38bd-00AEId; Tue, 09 Mar 2021 22:13:48 +0100
Subject: Re: [PATCH v3 1/5] ui: Replace the word 'whitelist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <66379742-141f-d38e-a6bb-dabe58c2a4b4@vivier.eu>
Date: Tue, 9 Mar 2021 22:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hJ1i3EZ3WPY84s24TlJs1/9Xr4aPSqV03JDn2HbXtQ0OYhXHXY+
 PFJKCcWB7WPkW0Br9gkWiEX5ON0N7mOzAnYS56X8DduernEEaoQgWYp9Kd0Teu4Z+smjyyp
 Gcog0khVCd012HCVIeY4S3IdqHdeJbv2p0qURfw8lKdJ/Wglsiq1YaowfRES7bVlekfbmCc
 UsjTKuye+P/k7UlUKhsSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FAvzR5Z3q8s=:Fbs23XYaxN7RCPky+hnn7j
 PcjkznypOVoJSNrokLkhvmLtzhteenB5g3i23WrPmYykcWnE6D8BitaamfnSH7zB127BwhvnM
 UYwlGyMAE4TzkAJtxf8O4sSPO8/1XZkU2C2vcCCCR4/mqKaBI2J1nyXgwcCHCYMoe3OPQC1w+
 JavnOg7h9f5BjWj3l6Gly0coiDYkrRHhjoSLPr1XDq7GIa9SXDbxd3oEOF42pMos9O0Z3uOmh
 oh2EYSC53b7NGJD41AvGbJauOYnDRDswdU1bugQX9bPXedZV9JOYs5S8JfxURGkcK5bZSe54v
 6/BoghqxoBFZaFfcZf8mMrE2F8SLvFMyBEfWT5ylZgKk9yNK0fJFi+pPOfBZh9YfsL3W9Zcxu
 oH8zGvQ4K89ZpKktRXNtj0fssWJIvjyPySzXiNpOst3hNWEa8YzPs9mdVE8I02qSi9gXVEBWl
 A7i9Vcs+2w==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
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
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  ui/console.c       | 2 +-
>  ui/vnc-auth-sasl.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index c5d11bc7017..5a8311ced20 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1708,7 +1708,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
>                  return false;
>              }
>          } else {
> -            /* default is to whitelist native 32 bpp only */
> +            /* default is to allow native 32 bpp only */
>              if (format != qemu_default_pixman_format(32, true)) {
>                  return false;
>              }
> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> index f67111a3662..df7dc08e9fc 100644
> --- a/ui/vnc-auth-sasl.c
> +++ b/ui/vnc-auth-sasl.c
> @@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
>              goto authreject;
>          }
>  
> -        /* Check username whitelist ACL */
> +        /* Check the username access control list */
>          if (vnc_auth_sasl_check_access(vs) < 0) {
>              goto authreject;
>          }
> @@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
>              goto authreject;
>          }
>  
> -        /* Check username whitelist ACL */
> +        /* Check the username access control list */
>          if (vnc_auth_sasl_check_access(vs) < 0) {
>              goto authreject;
>          }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


