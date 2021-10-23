Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110BD438407
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 17:20:11 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meIob-00051t-Eb
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 11:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1meImn-000489-Tw
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 11:18:17 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:35401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1meIml-0005WX-32
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 11:18:17 -0400
Received: by mail-ua1-x930.google.com with SMTP id q13so13356487uaq.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N26u/7t1fdi6ACQG/oacz0Qf8b7TvLV/6TGpPJvgWqE=;
 b=blpC/veJKdKnaiqLi31GPfDCU26MzFodxZ/zL8gjY2etcA3m2fgvKvvvkd4fYuw+1h
 y8YTW8kBhgg0xqqTigQzXy0ObVhIrL2tp5eVNtb7P9tBO5M0LK4j5TvW2QcewqjUw9fu
 VPw55vlNgpSq14ckrOSW/TaqI+pJlpIjWq3vRTV9Nscpnz31y0KhDQ7EfiCjfvFkM2ji
 oSsR4C9NBBY79fWNInFB1hzo2DShjC9UcAnc3bx6XrUoUofRArmAnW3DCknI4jTq1Hzs
 CnP6esFvm30a+8nKYXQghAWkJwXgPdTXd8NqlAJK7q2/+zxXg9VuSn07r6xXS+m1gPwB
 6t4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N26u/7t1fdi6ACQG/oacz0Qf8b7TvLV/6TGpPJvgWqE=;
 b=CY188Thh+LkPmqnOm8aK9BvEgW6Y3Wd1HM4weVjjJjQuv+5hoXf3bLP1mQbC6VqlfA
 bFq1fiwwuvzJBQ/5vZzzEVoOq08ENoKDuDuqKJp50/QgpY84arBsxn9NAFRusZL0TcAM
 wsF9QzShqvJBQRQJ0GzVyeqFi61tHo9JiVHgM595T9WFlg5myZTvEEtksDBKGYJ3hYrb
 hbWRvS/lSmWT/wbAe5b2NU2+mM0Qz6HhxuOM2DF/qr+dto9ImffMREU8DlxV/7/gtV7x
 d0ZQI4ap/iazB73Hpyc/cmEJpJz57OwyVeSUD2Y6/KHIEH63Wo7EXrDgHnhw2aGHuCjF
 e9XQ==
X-Gm-Message-State: AOAM5301MuASr0TWrOMrGX0yCUwLpij6MOH6arR6CaEsN598mXSGkJxg
 6kMqP24EL0JB2astbrjcsDT3w966oKKanBQGLj/EIA==
X-Google-Smtp-Source: ABdhPJxVI+3XZG1InnuHXrgqD/TIBSupck7RwfbqdoQdxuO/RFZMrVBvBXnIkoL+8Mn8cxTMIbLx2Qly6h/qFmjWJGA=
X-Received: by 2002:a05:6102:2131:: with SMTP id
 f17mr4792721vsg.42.1635002286830; 
 Sat, 23 Oct 2021 08:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-10-imp@bsdimp.com>
 <CACNAnaHL4uySkKewBMcDDcC+5qqAJQ1HXqsCSKc_W46cOTvg8Q@mail.gmail.com>
In-Reply-To: <CACNAnaHL4uySkKewBMcDDcC+5qqAJQ1HXqsCSKc_W46cOTvg8Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 23 Oct 2021 09:17:55 -0600
Message-ID: <CANCZdfpafHEugd47G6rCqPDyUPda__Lvh-3hLcdJ=2jhVDDRtQ@mail.gmail.com>
Subject: Re: [PATCH 09/24] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000838b0c05cf06a2fc"
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stacey Son <sson@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000838b0c05cf06a2fc
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 23, 2021 at 1:34 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement the system call dispatch. This implements all three kinds of
> > system call: direct and the two indirect variants. It handles all the
> > special cases for thumb as well.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>
> s/Klye/Kyle/
>

I'll fix the typo in the QEMU.SOB file I have... <blush>

Thanks!


> > ---
> >  bsd-user/arm/target_arch_cpu.h | 95 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/bsd-user/arm/target_arch_cpu.h
> b/bsd-user/arm/target_arch_cpu.h
> > index 62d6ee89b6..bc2eb05cfe 100644
> > --- a/bsd-user/arm/target_arch_cpu.h
> > +++ b/bsd-user/arm/target_arch_cpu.h
> > @@ -39,6 +39,7 @@ static inline void target_cpu_loop(CPUARMState *env)
> >  {
> >      int trapnr;
> >      target_siginfo_t info;
> > +    unsigned int n;
> >      CPUState *cs = env_cpu(env);
> >
> >      for (;;) {
> > @@ -57,6 +58,100 @@ static inline void target_cpu_loop(CPUARMState *env)
> >                  queue_signal(env, info.si_signo, &info);
> >              }
> >              break;
> > +        case EXCP_SWI:
> > +        case EXCP_BKPT:
> > +            {
> > +                env->eabi = 1; /* FreeBSD is eabi only now */
> > +                /*
> > +                 * system call
> > +                 * See arm/arm/trap.c cpu_fetch_syscall_args()
> > +                 */
> > +                if (trapnr == EXCP_BKPT) {
> > +                    if (env->thumb) {
> > +                        env->regs[15] += 2;
> > +                    } else {
> > +                        env->regs[15] += 4;
> > +                    }
> > +                }
> > +                n = env->regs[7];
> > +                if (bsd_type == target_freebsd) {
> > +                    int ret;
> > +                    abi_ulong params = get_sp_from_cpustate(env);
> > +                    int32_t syscall_nr = n;
> > +                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7,
> arg8;
> > +
> > +                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
> > +                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> > +                        syscall_nr = env->regs[0];
> > +                        arg1 = env->regs[1];
> > +                        arg2 = env->regs[2];
> > +                        arg3 = env->regs[3];
> > +                        get_user_s32(arg4, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg5, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg6, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg7, params);
> > +                        arg8 = 0;
> > +                    } else if (syscall_nr ==
> TARGET_FREEBSD_NR___syscall) {
> > +                        syscall_nr = env->regs[0];
> > +                        arg1 = env->regs[2];
> > +                        arg2 = env->regs[3];
> > +                        get_user_s32(arg3, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg4, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg5, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg6, params);
> > +                        arg7 = 0;
> > +                        arg8 = 0;
> > +                    } else {
> > +                        arg1 = env->regs[0];
> > +                        arg2 = env->regs[1];
> > +                        arg3 = env->regs[2];
> > +                        arg4 = env->regs[3];
> > +                        get_user_s32(arg5, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg6, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg7, params);
> > +                        params += sizeof(int32_t);
> > +                        get_user_s32(arg8, params);
> > +                    }
> > +                    ret = do_freebsd_syscall(env, syscall_nr, arg1,
> arg2, arg3,
> > +                            arg4, arg5, arg6, arg7, arg8);
> > +                    /*
> > +                     * Compare to arm/arm/vm_machdep.c
> > +                     * cpu_set_syscall_retval()
> > +                     */
> > +                    if (-TARGET_EJUSTRETURN == ret) {
> > +                        /*
> > +                         * Returning from a successful sigreturn
> syscall.
> > +                         * Avoid clobbering register state.
> > +                         */
> > +                        break;
> > +                    }
> > +                    if (-TARGET_ERESTART == ret) {
> > +                        env->regs[15] -= env->thumb ? 2 : 4;
> > +                        break;
> > +                    }
> > +                    if ((unsigned int)ret >= (unsigned int)(-515)) {
> > +                        ret = -ret;
> > +                        cpsr_write(env, CPSR_C, CPSR_C,
> CPSRWriteByInstr);
> > +                        env->regs[0] = ret;
> > +                    } else {
> > +                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
> > +                        env->regs[0] = ret; /* XXX need to handle
> lseek()? */
> > +                        /* env->regs[1] = 0; */
> > +                    }
> > +                } else {
> > +                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
> > +                            "not supported\n", bsd_type);
> > +                }
> > +            }
> > +            break;
> >          case EXCP_INTERRUPT:
> >              /* just indicate that signals should be handled asap */
> >              break;
> > --
> > 2.32.0
> >
>
> Modulo typo:
>
> Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
>

--000000000000838b0c05cf06a2fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFNhdCwgT2N0
IDIzLCAyMDIxIGF0IDE6MzQgQU0gS3lsZSBFdmFucyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtldmFu
c0BmcmVlYnNkLm9yZyI+a2V2YW5zQGZyZWVic2Qub3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij5PbiBUdWUsIE9jdCAxOSwgMjAyMSBhdCAxMTo0NSBBTSBXYXJuZXIgTG9zaCAmbHQ7
PGEgaHJlZj0ibWFpbHRvOmltcEBic2RpbXAuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1wQGJzZGlt
cC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBJbXBsZW1lbnQgdGhlIHN5
c3RlbSBjYWxsIGRpc3BhdGNoLiBUaGlzIGltcGxlbWVudHMgYWxsIHRocmVlIGtpbmRzIG9mPGJy
Pg0KJmd0OyBzeXN0ZW0gY2FsbDogZGlyZWN0IGFuZCB0aGUgdHdvIGluZGlyZWN0IHZhcmlhbnRz
LiBJdCBoYW5kbGVzIGFsbCB0aGU8YnI+DQomZ3Q7IHNwZWNpYWwgY2FzZXMgZm9yIHRodW1iIGFz
IHdlbGwuPGJyPg0KJmd0Ozxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogU3RhY2V5IFNvbiAmbHQ7
c3NvbkBGcmVlQlNELm9yZyZndDs8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IEtseWUgRXZhbnMg
Jmx0O2tldmFuc0BGcmVlQlNELm9yZyZndDs8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IFdhcm5l
ciBMb3NoICZsdDs8YSBocmVmPSJtYWlsdG86aW1wQGJzZGltcC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5pbXBAYnNkaW1wLmNvbTwvYT4mZ3Q7PGJyPg0KPGJyPg0Kcy9LbHllL0t5bGUvPGJyPjwvYmxv
Y2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O2xsIGZpeCB0aGUgdHlwbyBpbiB0aGUg
UUVNVS5TT0IgZmlsZSBJIGhhdmUuLi4gJmx0O2JsdXNoJmd0OzwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+VGhhbmtzITwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQomZ3Q7IC0tLTxicj4NCiZn
dDvCoCBic2QtdXNlci9hcm0vdGFyZ2V0X2FyY2hfY3B1LmggfCA5NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrPGJyPg0KJmd0O8KgIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRp
b25zKCspPGJyPg0KJmd0Ozxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2JzZC11c2VyL2FybS90YXJn
ZXRfYXJjaF9jcHUuaCBiL2JzZC11c2VyL2FybS90YXJnZXRfYXJjaF9jcHUuaDxicj4NCiZndDsg
aW5kZXggNjJkNmVlODliNi4uYmMyZWIwNWNmZSAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2JzZC11
c2VyL2FybS90YXJnZXRfYXJjaF9jcHUuaDxicj4NCiZndDsgKysrIGIvYnNkLXVzZXIvYXJtL3Rh
cmdldF9hcmNoX2NwdS5oPGJyPg0KJmd0OyBAQCAtMzksNiArMzksNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdGFyZ2V0X2NwdV9sb29wKENQVUFSTVN0YXRlICplbnYpPGJyPg0KJmd0O8KgIHs8YnI+
DQomZ3Q7wqAgwqAgwqAgaW50IHRyYXBucjs8YnI+DQomZ3Q7wqAgwqAgwqAgdGFyZ2V0X3NpZ2lu
Zm9fdCBpbmZvOzxicj4NCiZndDsgK8KgIMKgIHVuc2lnbmVkIGludCBuOzxicj4NCiZndDvCoCDC
oCDCoCBDUFVTdGF0ZSAqY3MgPSBlbnZfY3B1KGVudik7PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCBmb3IgKDs7KSB7PGJyPg0KJmd0OyBAQCAtNTcsNiArNTgsMTAwIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB0YXJnZXRfY3B1X2xvb3AoQ1BVQVJNU3RhdGUgKmVudik8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwgaW5mby5zaV9zaWdubywgJmFt
cDtpbmZvKTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCBjYXNlIEVYQ1BfU1dJ
Ojxicj4NCiZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUF9CS1BUOjxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0
O2VhYmkgPSAxOyAvKiBGcmVlQlNEIGlzIGVhYmkgb25seSBub3cgKi88YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKiBzeXN0ZW0gY2FsbDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBT
ZWUgYXJtL2FybS90cmFwLmMgY3B1X2ZldGNoX3N5c2NhbGxfYXJncygpPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGlmICh0cmFwbnIgPT0gRVhDUF9CS1BUKSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaWYgKGVudi0mZ3Q7dGh1bWIpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbMTVdICs9IDI7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbMTVdICs9IDQ7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBu
ID0gZW52LSZndDtyZWdzWzddOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlm
IChic2RfdHlwZSA9PSB0YXJnZXRfZnJlZWJzZCkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGludCByZXQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYWJpX3Vsb25nIHBhcmFtcyA9IGdldF9zcF9mcm9tX2NwdXN0YXRlKGVudik7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50MzJfdCBzeXNjYWxsX25y
ID0gbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnQzMl90IGFy
ZzEsIGFyZzIsIGFyZzMsIGFyZzQsIGFyZzUsIGFyZzYsIGFyZzcsIGFyZzg7PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogU2VlIGFybS9hcm0v
dHJhcC5jIGNwdV9mZXRjaF9zeXNjYWxsX2FyZ3MoKSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGlmIChzeXNjYWxsX25yID09IFRBUkdFVF9GUkVFQlNEX05SX3N5
c2NhbGwpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBz
eXNjYWxsX25yID0gZW52LSZndDtyZWdzWzBdOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFyZzEgPSBlbnYtJmd0O3JlZ3NbMV07PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnMiA9IGVudi0mZ3Q7cmVnc1syXTs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmczID0gZW52
LSZndDtyZWdzWzNdOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGdldF91c2VyX3MzMihhcmc0LCBwYXJhbXMpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzUs
IHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNiwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMy
X3QpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91
c2VyX3MzMihhcmc3LCBwYXJhbXMpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGFyZzggPSAwOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH0gZWxzZSBpZiAoc3lzY2FsbF9uciA9PSBUQVJHRVRfRlJFRUJTRF9OUl9fX3N5c2Nh
bGwpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzeXNj
YWxsX25yID0gZW52LSZndDtyZWdzWzBdOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGFyZzEgPSBlbnYtJmd0O3JlZ3NbMl07PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnMiA9IGVudi0mZ3Q7cmVnc1szXTs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIo
YXJnMywgcGFyYW1zKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc0LCBwYXJhbXMpOzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2Yo
aW50MzJfdCk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Z2V0X3VzZXJfczMyKGFyZzUsIHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNiwgcGFy
YW1zKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmc3
ID0gMDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmc4
ID0gMDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzEgPSBlbnYt
Jmd0O3JlZ3NbMF07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgYXJnMiA9IGVudi0mZ3Q7cmVnc1sxXTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBhcmczID0gZW52LSZndDtyZWdzWzJdOzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzQgPSBlbnYtJmd0O3JlZ3NbM107PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMy
KGFyZzUsIHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNiwgcGFyYW1zKTs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9m
KGludDMyX3QpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGdldF91c2VyX3MzMihhcmc3LCBwYXJhbXMpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzgsIHBh
cmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9IGRvX2ZyZWVic2Rfc3lzY2Fs
bChlbnYsIHN5c2NhbGxfbnIsIGFyZzEsIGFyZzIsIGFyZzMsPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnNCwgYXJnNSwgYXJnNiwgYXJnNywg
YXJnOCk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogQ29tcGFyZSB0byBhcm0vYXJt
L3ZtX21hY2hkZXAuYzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
KiBjcHVfc2V0X3N5c2NhbGxfcmV0dmFsKCk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aWYgKC1UQVJHRVRfRUpVU1RSRVRVUk4gPT0gcmV0KSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCogUmV0dXJuaW5nIGZyb20gYSBzdWNjZXNzZnVsIHNpZ3JldHVy
biBzeXNjYWxsLjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKiBBdm9pZCBjbG9iYmVyaW5nIHJlZ2lzdGVyIHN0YXRlLjxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aWYgKC1UQVJHRVRfRVJFU1RBUlQgPT0gcmV0KSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzWzE1XSAtPSBlbnYtJmd0O3RodW1iID8g
MiA6IDQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJl
YWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICgodW5zaWduZWQgaW50KXJldCAmZ3Q7
PSAodW5zaWduZWQgaW50KSgtNTE1KSkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJldCA9IC1yZXQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY3Bzcl93cml0ZShlbnYsIENQU1JfQywgQ1BTUl9DLCBDUFNSV3Jp
dGVCeUluc3RyKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBlbnYtJmd0O3JlZ3NbMF0gPSByZXQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBjcHNyX3dyaXRlKGVudiwgMCwgQ1BTUl9DLCBDUFNSV3JpdGVCeUluc3RyKTs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3Nb
MF0gPSByZXQ7IC8qIFhYWCBuZWVkIHRvIGhhbmRsZSBsc2VlaygpPyAqLzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIGVudi0mZ3Q7cmVnc1sxXSA9IDA7
ICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZnByaW50ZihzdGRlcnIsICZxdW90O3FlbXU6IGJzZF90eXBlICg9
ICVkKSBzeXNjYWxsICZxdW90Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICZxdW90O25vdCBzdXBwb3J0ZWRcbiZxdW90OywgYnNkX3R5cGUpOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIGNhc2UgRVhDUF9JTlRFUlJVUFQ6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIC8qIGp1c3QgaW5kaWNhdGUgdGhhdCBzaWduYWxzIHNob3VsZCBiZSBoYW5kbGVkIGFz
YXAgKi88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KJmd0OyAtLTxi
cj4NCiZndDsgMi4zMi4wPGJyPg0KJmd0Ozxicj4NCjxicj4NCk1vZHVsbyB0eXBvOjxicj4NCjxi
cj4NClJldmlld2VkLWJ5OiBLeWxlIEV2YW5zICZsdDtrZXZhbnNARnJlZUJTRC5vcmcmZ3Q7PGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0K
--000000000000838b0c05cf06a2fc--

