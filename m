Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887DE3157AE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:26:43 +0100 (CET)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Zas-0005bX-2C
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l9Yte-0000Xv-N5; Tue, 09 Feb 2021 14:42:02 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:47559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l9Ytc-0006gY-Ok; Tue, 09 Feb 2021 14:42:02 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M76jv-1lH0bb2IKF-008bZF; Tue, 09 Feb 2021 20:41:48 +0100
Subject: Re: [PATCH 2/5] target/m68k: Drop use of gdb_get_float64() and
 ldfq_p()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210208113428.7181-1-peter.maydell@linaro.org>
 <20210208113428.7181-3-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bdd455a3-0c07-4762-0e39-7dc8ce17a7d1@vivier.eu>
Date: Tue, 9 Feb 2021 20:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208113428.7181-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YREzwe9+kP9/yePkyxI3Fn5wkjAE80WCD6V6F+GdJ4mKmxxATAE
 vZt5kMlPes63wssLpq6hn2Q3KpUu2OjTgQ3TBDHz+G3BKq+Nl8chI4Em7SrV992KYxcdklm
 oPXmPjYxUhViqj5wWktApc90sd7YNbrj/dBr+i+7WfDmX8IApw623oFeFnCi34Ke8h1azd2
 vvy4U6PN8L+doWP7j0skA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TccrxrGNa+4=:ot5CrOTgQDDqtWscyL+ljQ
 K2RmdFZBmxAkusjQ+tDWqS2tL5557VjuFlSF85Qy2vbBmUw5GcXBwR6MEuddVwEb8mGoSKBkE
 DxH6B2GD5NthrDlUc3K3l73oVkll3B+MfOiSA4UrgaXdEuvkDd/Gv2IO+ZvWOJLbkcD6Jdu4l
 aiFfni9fbwWnHRc4iho//Gk6S/xNb8L4+Vn65z/sXjZGRKIQBpIAz66CfHovHo8LF/rA/h5/f
 kQ+X5zPzmpi39XfMQOgc1B9N3J3ewFBYH6C2qLppYD365VJGEGesFxjNVmYvxZ5UgwaCsR3jt
 MDbWsr2U0SMdXDFdnId0KF1CM8VXYyvTRxP4GjInVvQxw5vT5lqmbpCLfzqM3NW+MCC6KBfYV
 Av66arhOqucrjF1F2nryB/a1lFs8nGgjxRJCm3tg6+2LJkuy1aLUH+cllL72fNO459WtiSclc
 RsEo53oIpQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/02/2021 à 12:34, Peter Maydell a écrit :
> We used to make a distinction between 'float64'/'float32' types and
> the 'uint64_t'/'uint32_t' types, requiring special conversion
> operations to go between them.  We've now dropped this distinction as
> unnecessary, and the 'float*' types remain primarily for
> documentation purposes when used in places like the function
> prototypes of TCG helper functions.
> 
> This means that there's no need for a special gdb_get_float64()
> function to write a float64 value to the GDB protocol buffer; we can
> just use gdb_get_reg64().
> 
> Similarly, for reading a value out of the GDB buffer into a float64
> we can use ldq_p() and need not use ldfq_p().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/m68k/helper.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 3ff57657958..09f0391d508 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -72,8 +72,7 @@ static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
>  {
>      if (n < 8) {
>          float_status s;
> -        return gdb_get_float64(mem_buf,
> -                               floatx80_to_float64(env->fregs[n].d, &s));
> +        return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
>      }
>      switch (n) {
>      case 8: /* fpcontrol */
> @@ -90,7 +89,7 @@ static int cf_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n)
>  {
>      if (n < 8) {
>          float_status s;
> -        env->fregs[n].d = float64_to_floatx80(ldfq_p(mem_buf), &s);
> +        env->fregs[n].d = float64_to_floatx80(ldq_p(mem_buf), &s);
>          return 8;
>      }
>      switch (n) {
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>

