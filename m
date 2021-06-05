Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1639CAC0
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:31:38 +0200 (CEST)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpc1B-0008MA-8g
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpc0J-0007TJ-LE; Sat, 05 Jun 2021 15:30:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpc0F-0000Qv-KB; Sat, 05 Jun 2021 15:30:43 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mn1iT-1l7nGx1JQN-00kBpb; Sat, 05 Jun 2021 21:30:24 +0200
Subject: Re: [PATCH 3/3] scripts/oss-fuzz: Fix typo in documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210602170759.2500248-1-f4bug@amsat.org>
 <20210602170759.2500248-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fa1b192e-5c42-bfab-4f09-2e13a37e87fb@vivier.eu>
Date: Sat, 5 Jun 2021 21:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602170759.2500248-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9N1hde6zq1fF4zfwzh105Ax7gXF666U7idPQxIAFFTVJYPMSwE2
 JSz1W2wpYLppEo/1EsngOmju03oB351BYdwb4MfxmZzBor3TaIwO504lyugdSSO6fNJij3x
 yEOJtmJvKQBg1TOw9VeLfmWxeuR7xjhqzQbuqX2TL3r8Tqi9dF8CDA75VmchCt8OUXrpaE+
 Q2xOeRJ/oNi5Air5wl9Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eJeWpWqq4ik=:O+fxLRYHROd1C7BFA8XAqe
 0DMEpEhT8sl7RBVcR7/UkiG5+L8zUNQBrU17bD7ZeTzsbHY+JIRr8hMPS/SdfkwpaZA2GvpAX
 ESXUVWoCbjptGJwthCb/SFx002WsiPjXM100YaTRGJdv6NLtaYwM8lK6CzAVll0gbghypT08m
 /IodMJ6Ugaw7muSjjy8onv4rQY59XyGkhP2nW6s6rW0LUiIksRihji+RSbBzaG10okxO9LSd7
 vOLcVKJAIqrTAY13pi1DTxtoSm90qsAVrKCEdM5lmWEecASK0PJd74f7mc9tkbCAOB56vt2Wd
 suIH6zDrAzykY9pNQb5NO1oKrMFEhAgkpg7a2N0RCbOmyQwXhCeeYb2G7POkXNc2Y6QGCLWHL
 9Fl4ejBUSzsl/Kz6MxqbPSq0IeuS1TwkpI5Df93ehtZvKUQbLWTJbbOsIU+ToCj9YxPkgBU8I
 vZFAXnG3Ltwoq77F0QeLQXrKaMIPIkxdArt0wERwRPLQjbIIzpCR9v+PfixwVP8sTrkV+ddj/
 GjULRsDSVe1fazLQkiAhbw=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/06/2021 à 19:07, Philippe Mathieu-Daudé a écrit :
> While we only use stdin, the chardev is named 'stdio'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
> index 890e1def856..b154a25508f 100755
> --- a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
> +++ b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
> @@ -14,7 +14,7 @@
>          /path/to/crash 2> qtest_log_output
>  scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py qtest_log_output > qtest_trace
>  ./i386-softmmu/qemu-fuzz-i386 -machine q35,accel=qtest \
> -        -qtest stdin < qtest_trace
> +        -qtest stdio < qtest_trace
>  
>  ### Details ###
>  
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

