Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E44A69DF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:18:11 +0100 (CET)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5Dl-000128-F4
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2Qo-00054H-MJ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:19:26 -0500
Received: from [2607:f8b0:4864:20::930] (port=43582
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2Qm-00033u-00
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:19:26 -0500
Received: by mail-ua1-x930.google.com with SMTP id a24so2329537uat.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsnFwyQvOzu7SNbw/55fOSoK1nwjGscEsF8sMbIs7Yc=;
 b=iSV49OwgBs//ciFKWKSa/7INjgAI+VIYpROGsVPi8lsf3QGvKpGeg/Fk52LNVAfs3f
 +mM0JHdd6Xj7Q7ajo+tarJY32h4Ggmnv35IRVVUqfx71tNG/ZPTgHlcX0xUoNrQqXWGG
 2E1c6Yg8bm8/xaM+jGPNVUK0WobS+CJgDGJGqS64piiB8trwwrDu10No5Rir31vUfvr9
 lpvVIreDBQYuw1HV/sLrQLD2DqDeu9FPBuqhKL0pSBFOMa7l79oYPMZuqtcnx+9sgjFj
 4ni3YXj43GQ7bxhR8aWAGLLbwCRDDQJX5KOQO03iEJUFQJHQALLbv//vBBXO3i5rA+vF
 Qxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsnFwyQvOzu7SNbw/55fOSoK1nwjGscEsF8sMbIs7Yc=;
 b=hZP2VBSCXVuSEhIzYN+zHnnCKypaI4iXPatswItkJUWKHaHYLxEl0R4bLyRDSvkne1
 dtUw0MUG8CLFGfqg14kwdAlzSH2l9gESUaYfv39CXeaUuRm8q2PFaq+J/O9tpBDkKyx4
 9TsWZ83rnCRWc3vTMJWNo1dQt2h6boeOOL9rRiEMFfwsBE/UxlYtdg4fI4u7ySNn2NIg
 7N5GC15K6PzF6PvaYhesbLy1VOAiGRsT4PVNqd4VOcWb/c6xeFCwbzI5gQaocl70VzeL
 AuWNgToklMiNz0W2Kx4s3OVX7v0SmcjiVJBGkNUS/eeN/cIsLM2MWtFKchdmRUQzVraJ
 +GPw==
X-Gm-Message-State: AOAM532MARvx7eiZjzenazlX8ExuSd28JAzUq8lM1CpfrPE3AAyak3YQ
 G00aP+huuvsERr24gJ3rLBbA8LgUIgSI1gbBIbtNow==
X-Google-Smtp-Source: ABdhPJwNmjoP5j0P5UYV+NngrnYtLZLfEaRFwwqAFIS92gy5kaUvQ4RRwxIi+SOm/im0TvnR/6ejAaZ+lIXJpY/NUs0=
X-Received: by 2002:ab0:2042:: with SMTP id g2mr10868786ual.77.1643757562661; 
 Tue, 01 Feb 2022 15:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-6-imp@bsdimp.com>
 <CACNAnaGV9goBpHOXyppD9ZLDK7KTB=HYhS5JUegF_Waebe_0Nw@mail.gmail.com>
In-Reply-To: <CACNAnaGV9goBpHOXyppD9ZLDK7KTB=HYhS5JUegF_Waebe_0Nw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 16:19:11 -0700
Message-ID: <CANCZdfoyEJeZ3v8cF9qSooagdtOs=-zmFyDK1ot_nzR8fkaGNQ@mail.gmail.com>
Subject: Re: [PATCH 05/22] bsd-user/arm/target_arch_cpu.h: Only support
 FreeBSD sys calls
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000009e9f6d05d6fd21a9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Popov <arrowd@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Konrad Witaszczyk <def@freebsd.org>,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e9f6d05d6fd21a9
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 9:32 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Tue, Feb 1, 2022 at 5:14 AM Warner Losh <imp@bsdimp.com> wrote:
> >
> > Since we don't build on OpenBSD, only do FreeBSD system calls here. In
> > the future, we'll need to move this to some place like
> > bsd-user/freebsd/arm/mumble.h, but until then just leave this
> > inline. This reflects changes to the upstream.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/arm/target_arch_cpu.h | 139 ++++++++++++++++-----------------
> >  1 file changed, 66 insertions(+), 73 deletions(-)
> >
> > diff --git a/bsd-user/arm/target_arch_cpu.h
> b/bsd-user/arm/target_arch_cpu.h
> > index b087db48fa4..afb7814a8d1 100644
> > --- a/bsd-user/arm/target_arch_cpu.h
> > +++ b/bsd-user/arm/target_arch_cpu.h
> > @@ -40,7 +40,6 @@ static inline void target_cpu_init(CPUARMState *env,
> >  static inline void target_cpu_loop(CPUARMState *env)
> >  {
> >      int trapnr, si_signo, si_code;
> > -    unsigned int n;
> >      CPUState *cs = env_cpu(env);
> >
> >      for (;;) {
> > @@ -66,82 +65,76 @@ static inline void target_cpu_loop(CPUARMState *env)
> >              break;
> >          case EXCP_SWI:
> >              {
> > -                n = env->regs[7];
> > -                if (bsd_type == target_freebsd) {
> > -                    int ret;
> > -                    abi_ulong params = get_sp_from_cpustate(env);
> > -                    int32_t syscall_nr = n;
> > -                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7,
> arg8;
> > +                int ret;
> > +                abi_ulong params = get_sp_from_cpustate(env);
> > +                int32_t syscall_nr = env->regs[7];
> > +                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> >
> > -                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
> > -                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> > -                        syscall_nr = env->regs[0];
> > -                        arg1 = env->regs[1];
> > -                        arg2 = env->regs[2];
> > -                        arg3 = env->regs[3];
> > -                        get_user_s32(arg4, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg5, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg6, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg7, params);
> > -                        arg8 = 0;
> > -                    } else if (syscall_nr ==
> TARGET_FREEBSD_NR___syscall) {
> > -                        syscall_nr = env->regs[0];
> > -                        arg1 = env->regs[2];
> > -                        arg2 = env->regs[3];
> > -                        get_user_s32(arg3, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg4, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg5, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg6, params);
> > -                        arg7 = 0;
> > -                        arg8 = 0;
> > -                    } else {
> > -                        arg1 = env->regs[0];
> > -                        arg2 = env->regs[1];
> > -                        arg3 = env->regs[2];
> > -                        arg4 = env->regs[3];
> > -                        get_user_s32(arg5, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg6, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg7, params);
> > -                        params += sizeof(int32_t);
> > -                        get_user_s32(arg8, params);
> > -                    }
> > -                    ret = do_freebsd_syscall(env, syscall_nr, arg1,
> arg2, arg3,
> > -                            arg4, arg5, arg6, arg7, arg8);
> > +                /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
> > +                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> > +                    syscall_nr = env->regs[0];
> > +                    arg1 = env->regs[1];
> > +                    arg2 = env->regs[2];
> > +                    arg3 = env->regs[3];
> > +                    get_user_s32(arg4, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg5, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg6, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg7, params);
> > +                    arg8 = 0;
> > +                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> > +                    syscall_nr = env->regs[0];
> > +                    arg1 = env->regs[2];
> > +                    arg2 = env->regs[3];
> > +                    get_user_s32(arg3, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg4, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg5, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg6, params);
> > +                    arg7 = 0;
> > +                    arg8 = 0;
> > +                } else {
> > +                    arg1 = env->regs[0];
> > +                    arg2 = env->regs[1];
> > +                    arg3 = env->regs[2];
> > +                    arg4 = env->regs[3];
> > +                    get_user_s32(arg5, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg6, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg7, params);
> > +                    params += sizeof(int32_t);
> > +                    get_user_s32(arg8, params);
> > +                }
> > +                ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2,
> arg3,
> > +                                         arg4, arg5, arg6, arg7, arg8);
> > +                /*
> > +                 * Compare to arm/arm/vm_machdep.c
> > +                 * cpu_set_syscall_retval()
> > +                 */
> > +                if (-TARGET_EJUSTRETURN == ret) {
> >                      /*
> > -                     * Compare to arm/arm/vm_machdep.c
> > -                     * cpu_set_syscall_retval()
> > +                     * Returning from a successful sigreturn syscall.
> > +                     * Avoid clobbering register state.
> >                       */
> > -                    if (-TARGET_EJUSTRETURN == ret) {
> > -                        /*
> > -                         * Returning from a successful sigreturn
> syscall.
> > -                         * Avoid clobbering register state.
> > -                         */
> > -                        break;
> > -                    }
> > -                    if (-TARGET_ERESTART == ret) {
> > -                        env->regs[15] -= env->thumb ? 2 : 4;
> > -                        break;
> > -                    }
> > -                    if ((unsigned int)ret >= (unsigned int)(-515)) {
> > -                        ret = -ret;
> > -                        cpsr_write(env, CPSR_C, CPSR_C,
> CPSRWriteByInstr);
> > -                        env->regs[0] = ret;
> > -                    } else {
> > -                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
> > -                        env->regs[0] = ret; /* XXX need to handle
> lseek()? */
> > -                        /* env->regs[1] = 0; */
> > -                    }
> > +                    break;
> > +                }
> > +                if (-TARGET_ERESTART == ret) {
> > +                    env->regs[15] -= env->thumb ? 2 : 4;
> > +                    break;
> > +                }
> > +                if ((unsigned int)ret >= (unsigned int)(-515)) {
> > +                    ret = -ret;
> > +                    cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
> > +                    env->regs[0] = ret;
> >                  } else {
> > -                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
> > -                            "not supported\n", bsd_type);
> > +                    cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
> > +                    env->regs[0] = ret; /* XXX need to handle lseek()?
> */
> > +                    /* env->regs[1] = 0; */
> >                  }
> >              }
> >              break;
> >
>
> We should probably fix the lseek() situation sooner rather than later, but:
>

True, but that problem is in the fork as well... I've created a github
issue for it:
https://github.com/qemu-bsd-user/qemu-bsd-user/issues/28
but I am otherwise going to ignore it for now.

Warner


> Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
>

--0000000000009e9f6d05d6fd21a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgRmVi
IDEsIDIwMjIgYXQgOTozMiBBTSBLeWxlIEV2YW5zICZsdDs8YSBocmVmPSJtYWlsdG86a2V2YW5z
QGZyZWVic2Qub3JnIj5rZXZhbnNAZnJlZWJzZC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPk9uIFR1ZSwgRmViIDEsIDIwMjIgYXQgNToxNCBBTSBXYXJuZXIgTG9zaCAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmltcEBic2RpbXAuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1wQGJzZGltcC5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaW5jZSB3ZSBkb24mIzM5O3Qg
YnVpbGQgb24gT3BlbkJTRCwgb25seSBkbyBGcmVlQlNEIHN5c3RlbSBjYWxscyBoZXJlLiBJbjxi
cj4NCiZndDsgdGhlIGZ1dHVyZSwgd2UmIzM5O2xsIG5lZWQgdG8gbW92ZSB0aGlzIHRvIHNvbWUg
cGxhY2UgbGlrZTxicj4NCiZndDsgYnNkLXVzZXIvZnJlZWJzZC9hcm0vbXVtYmxlLmgsIGJ1dCB1
bnRpbCB0aGVuIGp1c3QgbGVhdmUgdGhpczxicj4NCiZndDsgaW5saW5lLiBUaGlzIHJlZmxlY3Rz
IGNoYW5nZXMgdG8gdGhlIHVwc3RyZWFtLjxicj4NCiZndDs8YnI+DQomZ3Q7IFNpZ25lZC1vZmYt
Ynk6IFdhcm5lciBMb3NoICZsdDs8YSBocmVmPSJtYWlsdG86aW1wQGJzZGltcC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5pbXBAYnNkaW1wLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7
wqAgYnNkLXVzZXIvYXJtL3RhcmdldF9hcmNoX2NwdS5oIHwgMTM5ICsrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9u
cygrKSwgNzMgZGVsZXRpb25zKC0pPGJyPg0KJmd0Ozxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2Jz
ZC11c2VyL2FybS90YXJnZXRfYXJjaF9jcHUuaCBiL2JzZC11c2VyL2FybS90YXJnZXRfYXJjaF9j
cHUuaDxicj4NCiZndDsgaW5kZXggYjA4N2RiNDhmYTQuLmFmYjc4MTRhOGQxIDEwMDY0NDxicj4N
CiZndDsgLS0tIGEvYnNkLXVzZXIvYXJtL3RhcmdldF9hcmNoX2NwdS5oPGJyPg0KJmd0OyArKysg
Yi9ic2QtdXNlci9hcm0vdGFyZ2V0X2FyY2hfY3B1Lmg8YnI+DQomZ3Q7IEBAIC00MCw3ICs0MCw2
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0YXJnZXRfY3B1X2luaXQoQ1BVQVJNU3RhdGUgKmVudiw8
YnI+DQomZ3Q7wqAgc3RhdGljIGlubGluZSB2b2lkIHRhcmdldF9jcHVfbG9vcChDUFVBUk1TdGF0
ZSAqZW52KTxicj4NCiZndDvCoCB7PGJyPg0KJmd0O8KgIMKgIMKgIGludCB0cmFwbnIsIHNpX3Np
Z25vLCBzaV9jb2RlOzxicj4NCiZndDsgLcKgIMKgIHVuc2lnbmVkIGludCBuOzxicj4NCiZndDvC
oCDCoCDCoCBDUFVTdGF0ZSAqY3MgPSBlbnZfY3B1KGVudik7PGJyPg0KJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCBmb3IgKDs7KSB7PGJyPg0KJmd0OyBAQCAtNjYsODIgKzY1LDc2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCB0YXJnZXRfY3B1X2xvb3AoQ1BVQVJNU3RhdGUgKmVudik8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIGNhc2UgRVhD
UF9TV0k6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIHs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBuID0gZW52LSZndDtyZWdzWzddOzxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGlmIChic2RfdHlwZSA9PSB0YXJnZXRfZnJlZWJzZCkgezxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludCByZXQ7PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWJpX3Vsb25nIHBhcmFtcyA9IGdldF9zcF9mcm9t
X2NwdXN0YXRlKGVudik7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aW50MzJfdCBzeXNjYWxsX25yID0gbjs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpbnQzMl90IGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQsIGFyZzUsIGFyZzYsIGFyZzcs
IGFyZzg7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50IHJldDs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhYmlfdWxvbmcgcGFyYW1zID0gZ2V0X3NwX2Zy
b21fY3B1c3RhdGUoZW52KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnQz
Ml90IHN5c2NhbGxfbnIgPSBlbnYtJmd0O3JlZ3NbN107PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaW50MzJfdCBhcmcxLCBhcmcyLCBhcmczLCBhcmc0LCBhcmc1LCBhcmc2LCBh
cmc3LCBhcmc4Ozxicj4NCiZndDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAvKiBTZWUgYXJtL2FybS9zeXNjYWxsLmMgY3B1X2ZldGNoX3N5c2NhbGxfYXJncygpICov
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHN5c2NhbGxfbnIg
PT0gVEFSR0VUX0ZSRUVCU0RfTlJfc3lzY2FsbCkgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN5c2NhbGxfbnIgPSBlbnYtJmd0O3JlZ3NbMF07PGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnMSA9IGVudi0mZ3Q7
cmVnc1sxXTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBh
cmcyID0gZW52LSZndDtyZWdzWzJdOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGFyZzMgPSBlbnYtJmd0O3JlZ3NbM107PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzQsIHBhcmFtcyk7PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFyYW1zICs9IHNp
emVvZihpbnQzMl90KTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBnZXRfdXNlcl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc2
LCBwYXJhbXMpOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzcsIHBhcmFtcyk7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnOCA9IDA7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIGlmIChzeXNjYWxsX25yID09IFRB
UkdFVF9GUkVFQlNEX05SX19fc3lzY2FsbCkgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHN5c2NhbGxfbnIgPSBlbnYtJmd0O3JlZ3NbMF07PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnMSA9IGVudi0mZ3Q7cmVn
c1syXTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmcy
ID0gZW52LSZndDtyZWdzWzNdOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmczLCBwYXJhbXMpOzxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMy
KGFyZzQsIHBhcmFtcyk7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9m
KGludDMyX3QpOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGdldF91c2VyX3MzMihhcmc2LCBwYXJhbXMpOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFyZzcgPSAwOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFyZzggPSAwOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgYXJnMSA9IGVudi0mZ3Q7cmVnc1swXTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmcyID0gZW52LSZndDtyZWdzWzFdOzxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzMgPSBlbnYtJmd0O3Jl
Z3NbMl07PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJn
NCA9IGVudi0mZ3Q7cmVnc1szXTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3Mz
Mihhcmc2LCBwYXJhbXMpOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzcsIHBhcmFtcyk7PGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFyYW1zICs9IHNpemVv
ZihpbnQzMl90KTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBnZXRfdXNlcl9zMzIoYXJnOCwgcGFyYW1zKTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cmV0ID0gZG9fZnJlZWJzZF9zeXNjYWxsKGVudiwgc3lzY2FsbF9uciwgYXJnMSwgYXJnMiwgYXJn
Myw8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBh
cmc0LCBhcmc1LCBhcmc2LCBhcmc3LCBhcmc4KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAvKiBTZWUgYXJtL2FybS9zeXNjYWxsLmMgY3B1X2ZldGNoX3N5c2NhbGxfYXJncygp
ICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHN5c2NhbGxfbnIgPT0g
VEFSR0VUX0ZSRUVCU0RfTlJfc3lzY2FsbCkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHN5c2NhbGxfbnIgPSBlbnYtJmd0O3JlZ3NbMF07PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnMSA9IGVudi0mZ3Q7cmVnc1sxXTs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmcyID0gZW52LSZndDtyZWdzWzJd
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzMgPSBlbnYtJmd0
O3JlZ3NbM107PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3Vz
ZXJfczMyKGFyZzQsIHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc2
LCBwYXJhbXMpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFt
cyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgZ2V0X3VzZXJfczMyKGFyZzcsIHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgYXJnOCA9IDA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfSBlbHNlIGlmIChzeXNjYWxsX25yID09IFRBUkdFVF9GUkVFQlNEX05SX19fc3lzY2Fs
bCkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN5c2NhbGxfbnIg
PSBlbnYtJmd0O3JlZ3NbMF07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgYXJnMSA9IGVudi0mZ3Q7cmVnc1syXTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBhcmcyID0gZW52LSZndDtyZWdzWzNdOzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmczLCBwYXJhbXMpOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFy
ZzQsIHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFy
YW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBnZXRfdXNlcl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc2LCBwYXJhbXMp
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzcgPSAwOzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzggPSAwOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgYXJnMSA9IGVudi0mZ3Q7cmVnc1swXTs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcmcyID0gZW52LSZndDtyZWdzWzFdOzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzMgPSBlbnYtJmd0O3JlZ3NbMl07
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYXJnNCA9IGVudi0mZ3Q7
cmVnc1szXTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNl
cl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc2LCBwYXJhbXMpOzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyArPSBzaXplb2YoaW50MzJfdCk7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzcs
IHBhcmFtcyk7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFyYW1z
ICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBnZXRfdXNlcl9zMzIoYXJnOCwgcGFyYW1zKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gZG9f
ZnJlZWJzZF9zeXNjYWxsKGVudiwgc3lzY2FsbF9uciwgYXJnMSwgYXJnMiwgYXJnMyw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGFyZzQsIGFyZzUsIGFyZzYsIGFyZzcsIGFyZzgpOzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC8qPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAqIENvbXBhcmUgdG8gYXJtL2FybS92bV9tYWNoZGVwLmM8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCogY3B1X3NldF9zeXNjYWxsX3JldHZhbCgpPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGlmICgtVEFSR0VUX0VKVVNUUkVUVVJOID09IHJldCkgezxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgKiBDb21wYXJlIHRvIGFybS9hcm0vdm1fbWFjaGRlcC5jPGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIGNwdV9zZXRfc3lzY2FsbF9yZXR2YWwo
KTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBSZXR1cm5pbmcg
ZnJvbSBhIHN1Y2Nlc3NmdWwgc2lncmV0dXJuIHN5c2NhbGwuPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIEF2b2lkIGNsb2JiZXJpbmcgcmVnaXN0ZXIgc3RhdGUu
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoLVRBUkdFVF9FSlVTVFJFVFVSTiA9
PSByZXQpIHs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
Kjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBSZXR1
cm5pbmcgZnJvbSBhIHN1Y2Nlc3NmdWwgc2lncmV0dXJuIHN5c2NhbGwuPGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIEF2b2lkIGNsb2JiZXJpbmcgcmVn
aXN0ZXIgc3RhdGUuPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAqLzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJy
ZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoLVRBUkdFVF9FUkVTVEFSVCA9PSBy
ZXQpIHs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYt
Jmd0O3JlZ3NbMTVdIC09IGVudi0mZ3Q7dGh1bWIgPyAyIDogNDs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaWYgKCh1bnNpZ25lZCBpbnQpcmV0ICZndDs9ICh1bnNpZ25lZCBpbnQpKC01MTUpKSB7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gLXJl
dDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjcHNyX3dy
aXRlKGVudiwgQ1BTUl9DLCBDUFNSX0MsIENQU1JXcml0ZUJ5SW5zdHIpOzxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1swXSA9IHJldDs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNwc3Jfd3JpdGUoZW52LCAw
LCBDUFNSX0MsIENQU1JXcml0ZUJ5SW5zdHIpOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1swXSA9IHJldDsgLyogWFhYIG5lZWQgdG8g
aGFuZGxlIGxzZWVrKCk/ICovPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgLyogZW52LSZndDtyZWdzWzFdID0gMDsgKi88YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICgtVEFSR0VUX0VSRVNUQVJUID09IHJldCkg
ezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1sx
NV0gLT0gZW52LSZndDt0aHVtYiA/IDIgOiA0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKHVuc2lnbmVkIGludClyZXQg
Jmd0Oz0gKHVuc2lnbmVkIGludCkoLTUxNSkpIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCByZXQgPSAtcmV0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGNwc3Jfd3JpdGUoZW52LCBDUFNSX0MsIENQU1JfQywgQ1BTUldyaXRlQnlJbnN0
cik7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdz
WzBdID0gcmV0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGZwcmludGYoc3RkZXJyLCAm
cXVvdDtxZW11OiBic2RfdHlwZSAoPSAlZCkgc3lzY2FsbCAmcXVvdDs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtub3Qgc3VwcG9ydGVk
XG4mcXVvdDssIGJzZF90eXBlKTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBjcHNyX3dyaXRlKGVudiwgMCwgQ1BTUl9DLCBDUFNSV3JpdGVCeUluc3RyKTs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbMF0gPSByZXQ7
IC8qIFhYWCBuZWVkIHRvIGhhbmRsZSBsc2VlaygpPyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC8qIGVudi0mZ3Q7cmVnc1sxXSA9IDA7ICovPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
fTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7PGJyPg0KPGJy
Pg0KV2Ugc2hvdWxkIHByb2JhYmx5IGZpeCB0aGUgbHNlZWsoKSBzaXR1YXRpb24gc29vbmVyIHJh
dGhlciB0aGFuIGxhdGVyLCBidXQ6PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2
PlRydWUsIGJ1dCB0aGF0IHByb2JsZW0gaXMgaW4gdGhlIGZvcmsgYXMgd2VsbC4uLiBJJiMzOTt2
ZSBjcmVhdGVkIGEgZ2l0aHViIGlzc3VlIGZvciBpdDo8L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9xZW11LWJzZC11c2VyL3FlbXUtYnNkLXVzZXIvaXNzdWVzLzI4Ij5odHRw
czovL2dpdGh1Yi5jb20vcWVtdS1ic2QtdXNlci9xZW11LWJzZC11c2VyL2lzc3Vlcy8yODwvYT48
YnI+PC9kaXY+PGRpdj5idXQgSSBhbSBvdGhlcndpc2UgZ29pbmfCoHRvIGlnbm9yZSBpdCBmb3Ig
bm93LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2FybmVyPC9kaXY+PGRpdj7CoDwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij4NClJldmlld2VkLWJ5OiBLeWxlIEV2YW5zICZsdDtrZXZhbnNARnJlZUJTRC5vcmcmZ3Q7
PGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0K
--0000000000009e9f6d05d6fd21a9--

