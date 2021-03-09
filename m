Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED143330D3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:23:05 +0100 (CET)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjom-000529-Ee
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjht-0005tI-OE; Tue, 09 Mar 2021 16:15:58 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:43321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjhq-0004jC-MX; Tue, 09 Mar 2021 16:15:57 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Ma1sQ-1lE9691EgO-00Vvgx; Tue, 09 Mar 2021 22:15:33 +0100
Subject: Re: [PATCH v3 3/5] seccomp: Replace the word 'blacklist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-4-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a3ec99ac-a269-c8c4-6e55-0aa0f5a58359@vivier.eu>
Date: Tue, 9 Mar 2021 22:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lZEWWiBUHi2DZXGvaVpq5wghXXagpMMP0ROH7TYrrdP1SCvEuho
 BXLZSrADfytbTHSqWQxO1HyFAeG/6ORNkHL9q2VK7OMc+7v/rtZnedcahN4ONod5JLIRLQe
 K2XILjwyrUfmseGFMSnhFAHRh9hCRRCmc1cOmAfudGW/w+Vo+XRua5oG0VgtaFlG8tB1sxG
 ASp1YeFY/i3RtUQVHj7uQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XKpka8FeahY=:nsE//koDse26V3qnr2Dcdj
 eG1auKNOkN7YoJYGb3EQYC2ch88bmMrrzyF4z2pm//KWb0J18KcOMRWw1rg2FbFsDXKyt70j3
 nVN5l0CtQQA3uIoHQMs9Bm1HmwJB6mNe0isAStqQ7ZQkz2KlGlx8/TBmJOHR1K2nh3Rab9D+6
 jbpEkS9tJ+S23u3GD3p04dw1ZY5HQjAhfEa80uhehV/MZbLadE2OPcHQmp+u4Y4N7rsRRJiVd
 9/caYYnsljXG8L8IknSmj4WH+U+asO4peuTcyGfgX6QI/kBqOGv6A4to8gI2EDjLnXBbE3JiW
 YFVFLdMNijmzIUzjQJo9mCyFlYruUMdmxSZEdIJB8ie+jvTr6iuzsqdUdDgbSfFfniblsaz0i
 rg4iaKCWpft/HxAMFle2/FT2lV8UsvqL5MSQAwlLNF4LGjEjcBKOPEoHeMvQ0yr3ZyqDdKQZb
 u8tcYAiLUQ==
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
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Acked-by: Eduardo Otubo <otubo@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Reworded comment (thuth)
> ---
>  softmmu/qemu-seccomp.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
> index 377ef6937ca..9c29d9cf007 100644
> --- a/softmmu/qemu-seccomp.c
> +++ b/softmmu/qemu-seccomp.c
> @@ -45,8 +45,8 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
>      { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
>  };
>  
> -static const struct QemuSeccompSyscall blacklist[] = {
> -    /* default set of syscalls to blacklist */
> +static const struct QemuSeccompSyscall denylist[] = {
> +    /* default set of syscalls that should get blocked */
>      { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
>      { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
>      { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
> @@ -175,18 +175,18 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
>          goto seccomp_return;
>      }
>  
> -    for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
> +    for (i = 0; i < ARRAY_SIZE(denylist); i++) {
>          uint32_t action;
> -        if (!(seccomp_opts & blacklist[i].set)) {
> +        if (!(seccomp_opts & denylist[i].set)) {
>              continue;
>          }
>  
> -        action = qemu_seccomp_get_action(blacklist[i].set);
> -        rc = seccomp_rule_add_array(ctx, action, blacklist[i].num,
> -                                    blacklist[i].narg, blacklist[i].arg_cmp);
> +        action = qemu_seccomp_get_action(denylist[i].set);
> +        rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
> +                                    denylist[i].narg, denylist[i].arg_cmp);
>          if (rc < 0) {
>              error_setg_errno(errp, -rc,
> -                             "failed to add seccomp blacklist rules");
> +                             "failed to add seccomp denylist rules");
>              goto seccomp_return;
>          }
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


