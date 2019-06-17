Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7712481E5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 14:23:44 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcqfn-0006fU-UK
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 08:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36623)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcqUf-00007X-6N
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 08:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcqUc-0006lw-7Y
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 08:12:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hcqUb-0006k0-W2
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 08:12:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so1598479wrs.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 05:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iYhRqtipY8lTadhJ8jkJECmpD3KKBXyobpIx1DI+a64=;
 b=TCbbVnmaca8hSQ0sxFHhmeeA9CL+rvReoDZxqeFW15C3ZgBmGxzdpBsvuKDuKUYPXB
 qQirij+nm/kaeK13NO83NTaDr12AX8JNjGgd24Gecuo5kGmcHt+STXwa2r3AK9axlkuU
 /oHM73rXfKqXbJuY4DVM9Ww8rA6t5NA4JxfWQeQxHbEhGXE1qI9Vs4W7mSVPn5/Ii2N5
 b6tVKlOPSJSGptwPepInqMXEgD+EJiYoXXSaYfeMbjkx9H21lsWjaDeYbl/de4ZnQIha
 WYW8c9ciu4MLw8eBcfRV13FOgFcsBEc0WF4zklC6XEmdc3SrBrnQOz41gvUpQSD5vLLR
 G+7g==
X-Gm-Message-State: APjAAAVz/8+PZWKvjZMq/prLI4odgL/y3VOl9PRVEWL5HE0rg8nrUAxz
 rZVpcByuC39qzdDVFkQ+aluLeA==
X-Google-Smtp-Source: APXvYqwETXqPjzpGcTidWlv/OoIszCK7awfLbFK/nvzmAXINxtm+YI28nbLgfBu4FLLTy+WGa8yNmw==
X-Received: by 2002:a5d:4908:: with SMTP id x8mr8176083wrq.290.1560773528602; 
 Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id y6sm10446243wrp.12.2019.06.17.05.12.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190615154352.26824-1-philmd@redhat.com>
 <20190615154352.26824-9-philmd@redhat.com> <8736k8bfph.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4fbdbd53-13c7-efff-4a32-dadf28c0be2d@redhat.com>
Date: Mon, 17 Jun 2019 14:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8736k8bfph.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v2 08/23] target/arm: Move all v7m insn
 helpers into their own file
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/19 1:42 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> From: Samuel Ortiz <sameo@linux.intel.com>
>>
>> In preparation for supporting TCG disablement on ARM, we move most
>> of TCG related v7m helpers and APIs into their own file.
>>
>> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
>> [PMD: Patch rewritten]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Is there a way to not use $CONFIG_USER_ONLY?
> 
> Is this because the CONFIG_ARM_V7M symbol only appears for softmmu
> targets but we still want vXm -cpu's for user mode?

No :(

If I use this diff:

-- >8 --
diff --git a/target/arm/helper.h b/target/arm/helper.h
@@ -58,24 +58,26 @@ DEF_HELPER_2(pre_smc, void, env, i32)
 DEF_HELPER_1(check_breakpoints, void, env)

 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
 DEF_HELPER_1(cpsr_read, i32, env)

+#ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(v7m_msr, void, env, i32, i32)
 DEF_HELPER_2(v7m_mrs, i32, env, i32)

 DEF_HELPER_2(v7m_bxns, void, env, i32)
 DEF_HELPER_2(v7m_blxns, void, env, i32)

 DEF_HELPER_3(v7m_tt, i32, env, i32, i32)

 DEF_HELPER_1(v7m_preserve_fp_state, void, env)

 DEF_HELPER_2(v7m_vlstm, void, env, i32)
 DEF_HELPER_2(v7m_vlldm, void, env, i32)
+#endif /* CONFIG_USER_ONLY */

 DEF_HELPER_2(v8m_stackcheck, void, env, i32)
---

I get:

target/arm/translate.c:10607:29: error: nested extern declaration of
‘gen_helper_v7m_mrs’ [-Werror=nested-externs]
target/arm/translate.c: In function ‘disas_thumb_insn’:
target/arm/translate.c:11224:25: error: implicit declaration of function
‘gen_blxns’; did you mean ‘gen_bx’? [-Werror=implicit-function-declaration]
                         gen_blxns(s, rm);
                         ^~~~~~~~~

Because:

static void disas_thumb_insn(DisasContext *s, uint32_t insn)
{
    ...
    switch (insn >> 12) {
    ...
    case 4:
        ...
        if (insn & (1 << 10)) {
            ...
            case 3:
            {
                /* 0b0100_0111_xxxx_xxxx
                 * - branch [and link] exchange thumb register
                 */
                bool link = insn & (1 << 7);

                if (insn & 3) {
                    goto undef;
                }
                if (link) {
                    ARCH(5);
                }
                if ((insn & 4)) {
                    /* BXNS/BLXNS: only exists for v8M with the
                     * security extensions, and always UNDEF if NonSecure.
                     * We don't implement these in the user-only mode
                     * either (in theory you can use them from Secure User
                     * mode but they are too tied in to system emulation.)
                     */
                    if (!s->v8m_secure || IS_USER_ONLY) {
                        goto undef;
                    }
                    if (link) {
                        gen_blxns(s, rm);
                    } else {
                        gen_bxns(s, rm);
                    }
                    break;
                }

Should we add "#ifndef CONFIG_USER_ONLY" all around? I believe we rather
not...

For 'cps' and 'mrs' we have:

                        /* Implemented as NOP in user mode.  */
                        if (IS_USER(s))
                            break;

but not for 'msr'.

