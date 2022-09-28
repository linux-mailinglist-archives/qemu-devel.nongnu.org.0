Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4AA5EDBFA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:44:28 +0200 (CEST)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVUJ-00016h-HT
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1odSM5-0005I9-IB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:23:53 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1odSM1-0000pz-Fi
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:23:44 -0400
Received: by mail-ed1-x52b.google.com with SMTP id y8so16272644edc.10
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 01:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xP4TYMHGIgvnWi7OxYHZPk420CXrjOygHwHVMOhn6lo=;
 b=B84nj0j7dB28sLXSe0MPGPJERVczTnZZr6c9p4/MIlmzn1Mu+CAg91R/VUYYgrROFf
 87KA+ryFbSJ++F0ZBKG5800+Yq+Sqg0bXp+yh5dPf/ij61Aj7D6HdfkP7OMhBSOpIeqf
 lTQnLvoZDbtFbxbpq/UgLKce4KORjiuROFi+hVU1t+rhCgaa6BDcru4bLfpTvQFhb1EX
 fomWKyx75Jx5vuoeGqPTtfsw6J7adymEyraCYrtfq4fdAkQWtCPeImXylt2iz4eVg4vA
 26zFwI6XsYDewp99OSlS+AwRBp2WtZffjVizgW0po6BMARNz5oRkL0DdrIDP1DH0Gg5x
 UcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xP4TYMHGIgvnWi7OxYHZPk420CXrjOygHwHVMOhn6lo=;
 b=cVyCE7GFM22MgBXaGYUb/otp9Q9025BVH5i40blefCQB81D5IunSs1QOgOE8EJkIY9
 EZxd9kjjxv2iPGxaaaIAXFJuTC8tz/IXmzcBtse0kTgyoCZ6tQXN7bqtCfIAcnGz6X0c
 Jf8M5cFXX5NVzuq2s5wKMAuscYKc/jj3Zkt8JQtqitHkYFWfXTFq1ro14/NU4cerfIql
 mSbovA4Lzojo30RQu3imyxvZzqcZkNBcB9r1uNZQpwuRRF0R5CrYAgC3n5YltrMLSEE6
 7UdEd8qEFtPwllyEYvAx6F23VYuezHulRnf+2JwFTXscf1pvSlDCJ1ChlsT01QJCRbv9
 G30w==
X-Gm-Message-State: ACrzQf0TG2qfT0SCtDWAxTiA5pRfdeJN7UqyV0s762iuugVSzIfWx0j9
 vmconHzShMw0Wm8iIjoyRB9KxDn54sCLuNQLTQk=
X-Google-Smtp-Source: AMsMyM7mgFQ+V2Sj39QzkNzNjiMg00ILHREGwH3521TymaomKmEHrePN1KrS9Ig45WNc8V+fGr2GrL8C9qphbZEi2Y0=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr5953171edp.311.1664353404445; Wed, 28
 Sep 2022 01:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220928081517.734954-1-laurent@vivier.eu>
 <20220928081517.734954-27-laurent@vivier.eu>
In-Reply-To: <20220928081517.734954-27-laurent@vivier.eu>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Wed, 28 Sep 2022 10:23:12 +0200
Message-ID: <CAL7npF_74nKB+quM7QsWWi9s=S4cFA_dKQLGqryKuCf=3vgf4A@mail.gmail.com>
Subject: Re: [PULL 26/38] linux-user: Don't assume 0 is not a valid host
 timer_t value
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000073e8d205e9b879f6"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000073e8d205e9b879f6
Content-Type: text/plain; charset="UTF-8"

Hello Laurent, hello Peter,

I see the Maximum number of active timers ist still 32. I hope it is not
too late, but for my application this is not enough. Could this define be
bigger i.e. 32*4?

Thanks for your support! I really appreciate it!

Jon

Laurent Vivier <laurent@vivier.eu> igorleak hau idatzi zuen (2022 ira. 28,
az. 10:15):

> From: Peter Maydell <peter.maydell@linaro.org>
>
> For handling guest POSIX timers, we currently use an array
> g_posix_timers[], whose entries are a host timer_t value, or 0 for
> "this slot is unused".  When the guest calls the timer_create syscall
> we look through the array for a slot containing 0, and use that for
> the new timer.
>
> This scheme assumes that host timer_t values can never be zero.  This
> is unfortunately not a valid assumption -- for some host libc
> versions, timer_t values are simply indexes starting at 0.  When
> using this kind of host libc, the effect is that the first and second
> timers end up sharing a slot, and so when the guest tries to operate
> on the first timer it changes the second timer instead.
>
> Rework the timer allocation code, so that:
>  * the 'slot in use' indication uses a separate array from the
>    host timer_t array
>  * we grab the free slot atomically, to avoid races when multiple
>    threads call timer_create simultaneously
>  * releasing an allocated slot is abstracted out into a new
>    free_host_timer_slot() function called in the correct places
>
> This fixes:
>  * problems on hosts where timer_t 0 is valid
>  * the FIXME in next_free_host_timer() about locking
>  * bugs in the error paths in timer_create where we forgot to release
>    the slot we grabbed, or forgot to free the host timer
>
> Reported-by: Jon Alduan <jon.alduan@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20220725110035.1273441-1-peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/syscall.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 54b29f3b406a..e0e0f058121f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -525,20 +525,25 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int,
> resource,
>
>  #if defined(TARGET_NR_timer_create)
>  /* Maximum of 32 active POSIX timers allowed at any one time. */
> -static timer_t g_posix_timers[32] = { 0, } ;
> +#define GUEST_TIMER_MAX 32
> +static timer_t g_posix_timers[GUEST_TIMER_MAX];
> +static int g_posix_timer_allocated[GUEST_TIMER_MAX];
>
>  static inline int next_free_host_timer(void)
>  {
> -    int k ;
> -    /* FIXME: Does finding the next free slot require a lock? */
> -    for (k = 0; k < ARRAY_SIZE(g_posix_timers); k++) {
> -        if (g_posix_timers[k] == 0) {
> -            g_posix_timers[k] = (timer_t) 1;
> +    int k;
> +    for (k = 0; k < ARRAY_SIZE(g_posix_timer_allocated); k++) {
> +        if (qatomic_xchg(g_posix_timer_allocated + k, 1) == 0) {
>              return k;
>          }
>      }
>      return -1;
>  }
> +
> +static inline void free_host_timer_slot(int id)
> +{
> +    qatomic_store_release(g_posix_timer_allocated + id, 0);
> +}
>  #endif
>
>  static inline int host_to_target_errno(int host_errno)
> @@ -12896,15 +12901,18 @@ static abi_long do_syscall1(CPUArchState
> *cpu_env, int num, abi_long arg1,
>                  phost_sevp = &host_sevp;
>                  ret = target_to_host_sigevent(phost_sevp, arg2);
>                  if (ret != 0) {
> +                    free_host_timer_slot(timer_index);
>                      return ret;
>                  }
>              }
>
>              ret = get_errno(timer_create(clkid, phost_sevp, phtimer));
>              if (ret) {
> -                phtimer = NULL;
> +                free_host_timer_slot(timer_index);
>              } else {
>                  if (put_user(TIMER_MAGIC | timer_index, arg3,
> target_timer_t)) {
> +                    timer_delete(*phtimer);
> +                    free_host_timer_slot(timer_index);
>                      return -TARGET_EFAULT;
>                  }
>              }
> @@ -13040,7 +13048,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env,
> int num, abi_long arg1,
>          } else {
>              timer_t htimer = g_posix_timers[timerid];
>              ret = get_errno(timer_delete(htimer));
> -            g_posix_timers[timerid] = 0;
> +            free_host_timer_slot(timerid);
>          }
>          return ret;
>      }
> --
> 2.37.3
>
>

--00000000000073e8d205e9b879f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Laurent, hello Peter,<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I see the Maximum number of active timers ist still 32. I h=
ope it is not too late, but for my application this is not enough. Could th=
is define be bigger i.e. 32*4?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks for your support! I really appreciate it!</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Jon</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Laurent Vivier &lt;<a href=3D"mail=
to:laurent@vivier.eu">laurent@vivier.eu</a>&gt; igorleak hau idatzi zuen (2=
022 ira. 28, az. 10:15):<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Pe=
ter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blan=
k" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
<br>
For handling guest POSIX timers, we currently use an array<br>
g_posix_timers[], whose entries are a host timer_t value, or 0 for<br>
&quot;this slot is unused&quot;.=C2=A0 When the guest calls the timer_creat=
e syscall<br>
we look through the array for a slot containing 0, and use that for<br>
the new timer.<br>
<br>
This scheme assumes that host timer_t values can never be zero.=C2=A0 This<=
br>
is unfortunately not a valid assumption -- for some host libc<br>
versions, timer_t values are simply indexes starting at 0.=C2=A0 When<br>
using this kind of host libc, the effect is that the first and second<br>
timers end up sharing a slot, and so when the guest tries to operate<br>
on the first timer it changes the second timer instead.<br>
<br>
Rework the timer allocation code, so that:<br>
=C2=A0* the &#39;slot in use&#39; indication uses a separate array from the=
<br>
=C2=A0 =C2=A0host timer_t array<br>
=C2=A0* we grab the free slot atomically, to avoid races when multiple<br>
=C2=A0 =C2=A0threads call timer_create simultaneously<br>
=C2=A0* releasing an allocated slot is abstracted out into a new<br>
=C2=A0 =C2=A0free_host_timer_slot() function called in the correct places<b=
r>
<br>
This fixes:<br>
=C2=A0* problems on hosts where timer_t 0 is valid<br>
=C2=A0* the FIXME in next_free_host_timer() about locking<br>
=C2=A0* bugs in the error paths in timer_create where we forgot to release<=
br>
=C2=A0 =C2=A0the slot we grabbed, or forgot to free the host timer<br>
<br>
Reported-by: Jon Alduan &lt;<a href=3D"mailto:jon.alduan@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">jon.alduan@gmail.com</a>&gt;<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20220725110035.1273441-1-peter.maydell@li=
naro.org" target=3D"_blank" rel=3D"noreferrer">20220725110035.1273441-1-pet=
er.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" targ=
et=3D"_blank" rel=3D"noreferrer">laurent@vivier.eu</a>&gt;<br>
---<br>
=C2=A0linux-user/syscall.c | 24 ++++++++++++++++--------<br>
=C2=A01 file changed, 16 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 54b29f3b406a..e0e0f058121f 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -525,20 +525,25 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resour=
ce,<br>
<br>
=C2=A0#if defined(TARGET_NR_timer_create)<br>
=C2=A0/* Maximum of 32 active POSIX timers allowed at any one time. */<br>
-static timer_t g_posix_timers[32] =3D { 0, } ;<br>
+#define GUEST_TIMER_MAX 32<br>
+static timer_t g_posix_timers[GUEST_TIMER_MAX];<br>
+static int g_posix_timer_allocated[GUEST_TIMER_MAX];<br>
<br>
=C2=A0static inline int next_free_host_timer(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int k ;<br>
-=C2=A0 =C2=A0 /* FIXME: Does finding the next free slot require a lock? */=
<br>
-=C2=A0 =C2=A0 for (k =3D 0; k &lt; ARRAY_SIZE(g_posix_timers); k++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_posix_timers[k] =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_posix_timers[k] =3D (timer_t) =
1;<br>
+=C2=A0 =C2=A0 int k;<br>
+=C2=A0 =C2=A0 for (k =3D 0; k &lt; ARRAY_SIZE(g_posix_timer_allocated); k+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qatomic_xchg(g_posix_timer_allocated + k, =
1) =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return k;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
+<br>
+static inline void free_host_timer_slot(int id)<br>
+{<br>
+=C2=A0 =C2=A0 qatomic_store_release(g_posix_timer_allocated + id, 0);<br>
+}<br>
=C2=A0#endif<br>
<br>
=C2=A0static inline int host_to_target_errno(int host_errno)<br>
@@ -12896,15 +12901,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env=
, int num, abi_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phost_sevp =
=3D &amp;host_sevp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D targe=
t_to_host_sigevent(phost_sevp, arg2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D =
0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free=
_host_timer_slot(timer_index);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_errno(timer_cre=
ate(clkid, phost_sevp, phtimer));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phtimer =3D NULL;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_host_timer_sl=
ot(timer_index);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (put_user(=
TIMER_MAGIC | timer_index, arg3, target_timer_t)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time=
r_delete(*phtimer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free=
_host_timer_slot(timer_index);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -TARGET_EFAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -13040,7 +13048,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_t htimer =3D g_posix_=
timers[timerid];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_errno(timer_del=
ete(htimer));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_posix_timers[timerid] =3D 0;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_host_timer_slot(timerid);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div>

--00000000000073e8d205e9b879f6--

