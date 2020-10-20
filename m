Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95528BB53
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:49:49 +0200 (CEST)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRz92-0007P4-SM
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRz4C-00038z-1L; Mon, 12 Oct 2020 10:44:48 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRz4A-0000H8-35; Mon, 12 Oct 2020 10:44:47 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MauJJ-1jvw6D0AMF-00cMRe; Mon, 12 Oct 2020 16:44:42 +0200
Subject: Re: [PATCH] target/sparc/int32_helper: Remove duplicated 'Tag
 Overflow' entry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201011200112.3222822-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5638d854-628c-d7d9-0146-69e46a75b2f6@vivier.eu>
Date: Mon, 12 Oct 2020 16:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201011200112.3222822-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jZbNhdS4NySRh0YQRycWIhWkCHEKuZxAumFC8yE+C0p3k95HJ+a
 e5kGu1itgWHlmPFYhCr8hxsZzhnm/QI004jEhldDQgGUUj1iPqgRaCkpxdmcsej9tWLV+42
 Rke498qv+qWBRN/sJa157gx8SprlD4Fmcp5Qi3anD1bnkF7qQyuvbCAbslhlqqzjoWX4+hx
 +oR4Cmlw2thLExeuXh64w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R+tpCXovVRc=:7fcDiwOZfJR7EdIPpdBvaf
 HpIWy8E7clV6cXiQvUJHVbg/TjbYvMYF97X6onWR84ti17FJQ9JBwLiTPDD5ENP1TweMTgjFB
 bFaPrS9u81c8KwxazjOCSjzHvVm22Nul76o05PFan/fuqZxHzNsAIOne/Mmmqq+gN5ygfGd4V
 6RD4/qNKZMeEM4X0fg0cOMSuSeji6UIRw6vyhBLkUOZz2MS7jzUQgjh+Gfy38nw+9zfdFSm7t
 0qmummeRGLpFyw0o4IGUSzDZ0t14NrQ/0nApkSUtSXOua3Erkh7O+KI/hEJ6BD7jmzsKE08UW
 u/HHtzM15xd57ybof8vtFKsHV3q6Z79flecp04cI4ELqyfskUGOWrkhDJQMyfLwYC7WA3YOYW
 963kOE1JX4UabR7BFA0rAysa63BQ+hnRaBVqgKhw/inY6DQjswNAbGyGzTisHFNybfsPCQEom
 0k1KIxzPM3fAZsEIb8oieFQfNhG6U6L8aj3YSIF50ujj0dyeoZxMHrA2ste0FNnAOgsrJHujq
 +nKn2lgISaZE5aKJ21rDWZ9dHqeGklGrgsR1SKdW8u6IK8XXOjT+GGxieOL8ShOmE6gAT8q4z
 VvYkuD2ghtK3bXV+2kY41kBa0cxWOn94NUzxmI+3xT376bv9waPgwkhzkHqcn+gzSG5lV4KDk
 71oy2ZIHqNvaYvpFqp3IDuZCYdE0O5Hk3TTAzuqKr8CNL7+hX24jxHstOI01UyGCBl8jcZE9z
 GS/ljaW0Ql1PZ6brziWInlK7zH7bq6v+WN0y8cBL8Hej8OqkqjrZvM83Otv53G8CVTuq4tDbr
 Ze6TINMVBd9CVT2B4kBGEd7LA1T46qqH91e/kyfo2B7/o6BL3CFqrxiGMgZBT6LkFCV31JE
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:26:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/10/2020 à 22:01, Philippe Mathieu-Daudé a écrit :
> Commit 0b09be2b2f ("Nicer debug output for exceptions") added
> twice the same "Tag Overflow" entry, remove the extra one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sparc/int32_helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
> index 9a71e1abd87..ba63c739c1e 100644
> --- a/target/sparc/int32_helper.c
> +++ b/target/sparc/int32_helper.c
> @@ -50,7 +50,6 @@ static const char * const excp_names[0x80] = {
>      [TT_EXTINT | 0xd] = "External Interrupt 13",
>      [TT_EXTINT | 0xe] = "External Interrupt 14",
>      [TT_EXTINT | 0xf] = "External Interrupt 15",
> -    [TT_TOVF] = "Tag Overflow",
>      [TT_CODE_ACCESS] = "Instruction Access Error",
>      [TT_DATA_ACCESS] = "Data Access Error",
>      [TT_DIV_ZERO] = "Division By Zero",
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


