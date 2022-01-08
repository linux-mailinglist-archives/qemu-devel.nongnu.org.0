Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0910488679
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 22:46:58 +0100 (CET)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6JY9-0005jT-ER
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 16:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6JVJ-0003mO-IG
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 16:44:02 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:57691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6JV6-0000Xy-4h
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 16:44:01 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MStGi-1mvySl2Rry-00UMYS; Sat, 08 Jan 2022 22:43:45 +0100
Message-ID: <20aa171c-1abe-9a28-6997-77917360df4e@vivier.eu>
Date: Sat, 8 Jan 2022 22:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/m68k: don't word align SP in stack frame if
 M68K_FEATURE_UNALIGNED_DATA feature enabled
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220108180453.18680-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220108180453.18680-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kdHwfH4QX1p6aqIm6LE4T0cIBejQo8vlnFDMdvr8KtwnTDkWOGy
 raFNqmapc24YdWAGsoTHuFUBxUcnNhdhDF1BSj3Hz0ZhdkH0NsD6CZP5VIr9WYX/3qkdgDe
 zHJ4M7yVh807zf/G9wHb1YQ7U4ungvIbj8L4K/BW0QoeRq+o0X4AmqeJY8PGNc04K/LPNbg
 OJppRAOvw7BGuqq+RZZ/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:px7seEPWdZA=:exap4IeRtijRj8m8uqgN8r
 tKilnAzvofQNGBrSTdP2LJdGjewJdh3lx5gFeZCli3b/TQvNzz6K4e+nMaViRmHTQik8lWuts
 f+2KeVmFC9YsbcFqYryR99MoacbmQEvt1Wzn/2I+Va4ektksSCQ6VrNrkayq4D3kzS9o7kpWp
 GPKlafr6VkiBmaUgmM2GZ0gb+khAhp5W58pDUou4JYUm9vPJUQqoa5KT9ISpi++7zOPCv4oc8
 ItpDPZzPn6c+ti4s1sxaFQ03e3z4w/eHqFsl/0RwKzO2YcVYfc2zJzeKvdCH+/p/t9jp2aInO
 iU7841IABafFYQDmMzoDSUQEM31WLiljh1XaomwXCARaP9M2moDccbzofOe0EscTybyUjWFHP
 X+/OjK135C+AYsPMqpGa46NHvnLeHeAL5PDe/C4fcZKn3qeqRFNhRBknKS61cATgBFxXbi9dG
 4K63m1Uh1QTMxPHNfLqtcNIwxTFtjhiMWXGrWGRVAGV+ekJlrmFiBUfs8wAjZw10mlz2Opx7w
 EZ5c69aZstJI/qk837mwajvFPdI3Ul7GBA1z9dC9Gx2s7rCzKvn9DrAdOVMYFAPUkn0qEIP9W
 RSvtfSBEkBqF9zpN1NJCBMJ+6N7Xho7L+OBNzT8JF9mfk1DdZtPjyiHDRj4ARzHZ9O+9BrORV
 0Hx+pDrHx5PhFkoT6ImNJIMtqke71VjMrR8h8GJD7DzxP6jzCa75zbWdlI9bHPC5QccQ=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Le 08/01/2022 à 19:04, Mark Cave-Ayland a écrit :
> Commit a9431a03f7 ("target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature") added
> a new feature for processors from the 68020 onwards which do not require data
> accesses to be word aligned.
> 
> Unfortunately the original commit missed an additional case whereby the SP is
> still word aligned when setting up an additional format 1 stack frame so add the
> necessary M68K_FEATURE_UNALIGNED_DATA feature guard.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: a9431a03f7 ("target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature")
> ---
>   target/m68k/op_helper.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index ab6b559fd3..59d8d5a09e 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -429,7 +429,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>           oldsr = sr;
>           env->aregs[7] = sp;
>           cpu_m68k_set_sr(env, sr &= ~SR_M);
> -        sp = env->aregs[7] & ~1;
> +        sp = env->aregs[7];
> +        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
> +            sp &= ~1;
> +        }
>           do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
>       } else {
>           do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

