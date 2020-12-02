Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E62CCA93
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:41:39 +0100 (CET)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbkg-0001QB-8n
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbjB-0000TP-Ry
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:40:05 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:44471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbj7-0006fH-G0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:40:05 -0500
Received: by mail-il1-x141.google.com with SMTP id r17so211785ilo.11
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HCQoeTWvYO1I+hmnZvpQ64CnzFuDGQDDShCzJqBqbQs=;
 b=DXlaxeIQ2Pgv2Fi8s/X+FwxC8EyTuV/u7zX4jZ0pGHpW0x0PNzRPTQa2VSXxfkbFlJ
 5l8sRkqhJBKv3p3u4LLRSVjFmxo3tCi1NUCiYqIWF+YThuhCSggjyzrbY9hbfq4xnxyQ
 jeNoB72DUyGyqqzGewdbcCAkWNBy7deohnzq+WRgtz6QzN+g3Njf27LDR5jvfL7aeVS0
 DIvf0BJ5cyrlU9tO/8CIrsgFo5hTgUb6D+50mOSBt+tZ5UIhmhhycLIy+0sGMCsPRtSP
 ynYVCOnp+efwCxVTt0IxqNHxOPxHwhM9AfITYp+2t2O+ykDLTMljbI2vgxv3jx84xW6X
 CbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HCQoeTWvYO1I+hmnZvpQ64CnzFuDGQDDShCzJqBqbQs=;
 b=nE8Hfrc9lgbnkVecZ6GHTJUlmDSwuP04Vh5ErZO8Ut904sTcf6ZjdgBRANe8CTt1xG
 L2RLCquNk5P1GJWEaWuOMQNLIap8mCCdMf4aRPlbFti56+iBdv/dIFcO+SzWkzyn76+n
 aoH+oJ4EssiHSPZGH2m8ymswJOVM5kgNPsUZ7E5JzSbLSawv819ouwdmXmUlKFt6Bvh/
 eFuwZYDCIXO75ZS98vSFf8hNynCy7fxvhaYXddUmQRPJ7sVOK95vltXW1uXVul19aBFl
 l7PocB3s+4aDaD4uLlOyhYIm3kKnDT3N4PneZEPbxxkBzfw1BvkGbooPFeVd4wd2l/j0
 9U/Q==
X-Gm-Message-State: AOAM532ky9gCYbnf0tDYlVeWU+EX9R/pD08ItWT5m/RnsxU1TfbBaX2h
 tFDOF0ikYdMPJ90ZPgg3uSv5/uDhDdtvXvM9aB2pow==
X-Google-Smtp-Source: ABdhPJzkbbVfph7u1fcO5z7HgfrWSOmTzs4Ql9kfzpHsyXjeihiARxtJxY25fSxDmwwIb3Ub/NIxJQLa1e/o8n0p7fg=
X-Received: by 2002:a05:6e02:f86:: with SMTP id v6mr526145ilo.56.1606952399819; 
 Wed, 02 Dec 2020 15:39:59 -0800 (PST)
MIME-Version: 1.0
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
 <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
 <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
In-Reply-To: <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Dec 2020 15:39:48 -0800
Message-ID: <CAMn1gO64pXt9F8BcsAugOLhrzr6jfjsayjYdwSAv+gOLo4McKA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Frank Yang <lfy@google.com>
Cc: Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=pcc@google.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 2, 2020 at 3:26 PM Frank Yang <lfy@google.com> wrote:
>
>
>
> On Wed, Dec 2, 2020 at 2:57 PM Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>> On 02.12.20 23:46, Frank Yang wrote:
>>
>>
>>
>> On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>>
>>> On 02.12.20 23:19, Frank Yang wrote:
>>>
>>>
>>> From downstream: https://android-review.googlesource.com/c/platform/ext=
ernal/qemu/+/1515002
>>>
>>> Based on v3 of Alexander Graf's patches
>>>
>>> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>>>
>>> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
>>> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
>>> require effort to do that accurately---with individual values, even if
>>> they are a tiny bit off it can result in a lockup due to inconsistent
>>> time differences between vCPUs. So just use a global approximate value
>>> for now.
>>>
>>> Not tested in upstream yet, but Android emulator snapshots work without
>>> time warp now.
>>>
>>> Signed-off-by: Lingfeng Yang <lfy@google.com>
>>>
>>>
>>> If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, =
we should be able to just recover the offset after migration by looking at =
QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?
>>>
>>> That would end up much easier than this patch I hope.
>>>
>>>
>>
>> The virtual clock interfaces/implementations in QEMU seem complex to me =
relative to the fix needed here and they don't seem to compute ticks with m=
ach_absolute_time() (which in this case we want since we want to compute in=
 timer ticks instead of having to mess with ns / cycle conversions). I do a=
gree this patch does seem more complicated on the surface though versus "ju=
st" setting cntvoff directly to some value. Maybe we should simplify the QE=
MU_CLOCK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using ma=
ch_absolute_time() first?
>>
>>
>> So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an offset to=
 gettimeofday(). This offset is already part of the live migration stream[1=
]. So if you just configure CNTVOFF_EL2 based on QEMU_CLOCK_VIRTUAL adjuste=
d by the clock frequency on vcpu init, you should have everything you need.=
 You can do that on every CPU init even, as the virtual clock will just be =
0 on start.
>>
>> The only thing we need to change then is to move the WFI from a direct c=
all to mach_absolute_time() to also check the virtual clock instead. I woul=
d hope that gettimeofday() calls mach_absolute_time() in the background too=
 to speed it up.
>>
> Sounds plausible, but I noticed that we also have cpu_ticks_offset as par=
t of the migration stream, and I prefer mach_absolute_time() (ticks) instea=
d of seconds in WFI as well as it makes the calculation more accurate (tick=
s against ticks instead of conversion between ns and ticks).
>
> Should we look at integrating this with cpu_ticks_offset instead?

Seems plausible to me. As far as I can tell the intent is that
cpu_get_host_ticks() does not increment while asleep (e.g. on x86 it
uses RDTSC which as far as I know does not increment while asleep), so
we could provide an implementation on Mac that calls
mach_absolute_time().

Peter

