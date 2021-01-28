Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA730779C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:05:23 +0100 (CET)
Received: from localhost ([::1]:33972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57vG-0004XK-FO
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l57pB-0000FE-Ny
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:59:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l57p9-0000s5-AT
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:59:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id o10so5215167wmc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=k0x+A6L+MEP192i6CTIIdNkejeoiqH60dyWrOQfFu34=;
 b=VlST5QADlAfp3Bg2DRgCLr9EmAZxT721tDnTwDFbOySAh+IrvENvGCnvtW1e5CWFm2
 ckrlEm6jIknIXv7auRx2J6jBNgBMrAIm0nnJzZQZx91Z8oA3xQdOv8F1//gkv1qL7kcL
 Z9xmhy2H/s9r0qi3sa6xgc325Z2Ju99ua/PS2fpY4bRVlK00DTRH0L2epU4rosk0YrXx
 bkoV3pgX12MNGBEctVq0FvZQHAeV4EmmOz1dh3Nb33prR7+alHDGPoxr4AqoKxhz+XhZ
 4ReEAJpwStLwqVYL0MBACw/xCc4nctjqPCul96xYUx6Is7ymDy7Qp7MlbjwXLRR3ta2C
 /lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=k0x+A6L+MEP192i6CTIIdNkejeoiqH60dyWrOQfFu34=;
 b=f2cg3mNwjhWxCMxEqF0aZCYitdFlT8SF0x/oiLPBmG20bSlY/SNQ8XmJwJfk0bHv39
 81sNaB72dusOjni3uAmH/b1KQXyEY40uN8yJ6PYEQ/k9XB1B959KwXhe9xkw0CW6hNcD
 7a9+79dc4bMn4a8sw1XE2fCNA8Nt+WlKOgToW/pOoj5g5hoxVHqjrhB6agruEctQFWk6
 3irHK2E49FXLSln0PQKLwdG8YqsnCLwC2TV5YGDwso58mUeQMOFXrJMaSKqrim0G+czt
 ZpR/bZcfV/A6OY5uyr6GzfZbeb/NaR5YLtXwPr7twHKno65JB89XJ5Kzj1fn1EFjJDXn
 iXYA==
X-Gm-Message-State: AOAM530I+rpeszTvXKwh6llSB7T6D90jA3BKRGFZclYxmcbuj8F85DZv
 M60stu2m3AirkP+bXtxXCMqyfFk2CAwXUQsW
X-Google-Smtp-Source: ABdhPJzvBtt/WS5PpAIMs4QN0xO9h5dsT0VraonAy3LUHCFAV69h7xEdDvRYrxmbsr4e9CLiAGG6Tw==
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr8765495wmq.126.1611842341785; 
 Thu, 28 Jan 2021 05:59:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm7584990wrv.0.2021.01.28.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 05:59:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B045C1FF7E;
 Thu, 28 Jan 2021 13:58:59 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-3-richard.henderson@linaro.org>
 <87ft2lw6hh.fsf@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 02/23] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Thu, 28 Jan 2021 13:54:46 +0000
In-reply-to: <87ft2lw6hh.fsf@linaro.org>
Message-ID: <87czxpw4bg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> The use in tcg_tb_lookup is given a random pc that comes from the pc
>> of a signal handler.  Do not assert that the pointer is already within
>> the code gen buffer at all, much less the writable mirror of it.
>>
>> Fixes: db0c51a3803
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> OK I bisected to this regression while running:
>
>   "cd builds/bisect && rm -rf * && ../../configure --disable-docs --targe=
t-list=3Dm68k-linux-user && make -j30 && make check-tcg"
>
> which ultimately fails during the threadcount test for m68k-linux-user.
> I'm just testing now to see if that also broke my ARM system test
> images.

For my ARM test system:

./qemu-system-aarch64 -machine virt,virtualization=3Don -cpu cortex-a57
-serial mon:stdio -nic user,model=3Dvirtio-net-pci,hostfwd=3Dtcp::2222-:22
-device virtio-scsi-pci -drive
file=3D/dev/zvol/hackpool-0/debian-bullseye-arm64,id=3Dhd0,index=3D0,if=3Dn=
one,format=3Draw
-device scsi-hd,drive=3Dhd0 -display none -m 4096 -smp 4 -drive
if=3Dpflash,file=3D/usr/share/AAVMF/AAVMF_CODE.fd,format=3Draw,readonly -dr=
ive
if=3Dpflash,file=3D$HOME/images/AAVMF_VARS.fd,format=3Draw


Yep with this:

  [    2.948980] Checked W+X mappings: passed, no W+X pages found
  [    2.949443] Run /init as init process
  [    2.959082] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x0000000b
  [    2.959563] CPU: 3 PID: 1 Comm: init Not tainted 5.10.0-1-arm64 #1 Deb=
ian 5.10.4-1
  [    2.959768] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06=
/2015
  [    2.960144] Call trace:
  [    2.960267]  dump_backtrace+0x0/0x1e4
  [    2.960491]  show_stack+0x24/0x6c
  [    2.960699]  dump_stack+0xd0/0x12c
  [    2.960862]  panic+0x168/0x370
  [    2.960990]  do_exit+0x9a8/0x9c0
  [    2.961072]  do_group_exit+0x44/0xac
  [    2.961163]  get_signal+0x174/0x910
  [    2.961256]  do_notify_resume+0x22c/0x9a0
  [    2.961355]  work_pending+0xc/0x39c
  [    2.961849] SMP: stopping secondary CPUs
  [    2.962341] Kernel Offset: disabled
  [    2.962585] CPU features: 0x0240022,61006082
  [    2.962729] Memory Limit: none
  [    2.963158] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t! exitcode=3D0x0000000b ]---
  QEMU 5.2.50 monitor - type 'help' for more information
  (qemu) quit

Where as I can boot from the commit before....

>
>> ---
>>
>> For TCI, this indicates a bug in handle_cpu_signal, in that we
>> are taking PC from the host signal frame.  Which is, nearly,
>> unrelated to TCI at all.
>>
>> The TCI "pc" is tci_tb_ptr (fixed in the next patch to at least
>> be thread-local).  We update this only on calls, since we don't
>> expect SEGV during the interpretation loop.  Which works ok for
>> softmmu, in which we pass down pc by hand to the helpers, but
>> is not ok for user-only, where we simply perform the raw memory
>> operation.
>>
>> I don't know how to fix this, exactly.  Probably by storing to
>> tci_tb_ptr before each qemu_ld/qemu_st operation, with barriers.
>> Then Doing the Right Thing in handle_cpu_signal.  And perhaps
>> by clearing tci_tb_ptr whenever we're not expecting a SEGV on
>> behalf of the guest (and thus anything left is a qemu host bug).
>>
>>
>> r~
>>
>> ---
>>  tcg/tcg.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index 9e1b0d73c7..78701cf359 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -407,11 +407,21 @@ static void tcg_region_trees_init(void)
>>      }
>>  }
>>=20=20
>> -static struct tcg_region_tree *tc_ptr_to_region_tree(const void *cp)
>> +static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
>>  {
>> -    void *p =3D tcg_splitwx_to_rw(cp);
>>      size_t region_idx;
>>=20=20
>> +    /*
>> +     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
>> +     * a signal handler over which the caller has no control.
>> +     */
>> +    if (!in_code_gen_buffer(p)) {
>> +        p -=3D tcg_splitwx_diff;
>> +        if (!in_code_gen_buffer(p)) {
>> +            return NULL;
>> +        }
>> +    }
>> +
>>      if (p < region.start_aligned) {
>>          region_idx =3D 0;
>>      } else {
>> @@ -430,6 +440,7 @@ void tcg_tb_insert(TranslationBlock *tb)
>>  {
>>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
>>=20=20
>> +    g_assert(rt !=3D NULL);
>>      qemu_mutex_lock(&rt->lock);
>>      g_tree_insert(rt->tree, &tb->tc, tb);
>>      qemu_mutex_unlock(&rt->lock);
>> @@ -439,6 +450,7 @@ void tcg_tb_remove(TranslationBlock *tb)
>>  {
>>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
>>=20=20
>> +    g_assert(rt !=3D NULL);
>>      qemu_mutex_lock(&rt->lock);
>>      g_tree_remove(rt->tree, &tb->tc);
>>      qemu_mutex_unlock(&rt->lock);
>> @@ -453,8 +465,13 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
>>  {
>>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree((void *)tc_ptr=
);
>>      TranslationBlock *tb;
>> -    struct tb_tc s =3D { .ptr =3D (void *)tc_ptr };
>> +    struct tb_tc s;
>>=20=20
>> +    if (rt =3D=3D NULL) {
>> +        return NULL;
>> +    }
>> +
>> +    s.ptr =3D (void *)tc_ptr;
>>      qemu_mutex_lock(&rt->lock);
>>      tb =3D g_tree_lookup(rt->tree, &s);
>>      qemu_mutex_unlock(&rt->lock);


--=20
Alex Benn=C3=A9e

