Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991142CCA8F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:32:10 +0100 (CET)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbbV-0004fU-NV
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbY2-0002UT-Oh
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:28:34 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbY0-0005U8-WE
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:28:34 -0500
Received: by mail-io1-xd42.google.com with SMTP id t8so129903iov.8
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 15:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sHz4OKSDkB4X2/Q7yJFO7hSfYBzAsnEHkvj3wqLCRrM=;
 b=FdNhmzcgFOBh/mreXcMLvgrZD3CUJDn9UlTtzqXMuDVYJ1Kv65/uh0GKTgPageNYO5
 tx71Sm/C1hgArKAXdMRN3CI4v8yVnjM7fQbOy88wk2fDd+mjFCiOl/mtfs5PjXF9Ot0r
 +VEITRswjlmltjCpLQvyPYp0wwAt9N0b5tHc30OInNwjuccaAMinS+zVpQxYy4ZYUsXT
 ElkcXqBjcqct4nneGddWeoAhp/a3tCexiieyf2SUdk2tHeCv0Vft9XJHc812kcd1T1yp
 LcTziXO/M3a6gPYHKiydw2FqJp2JRmJZJp9oREyrkUnJS287rGIdt5k8gq759yyuF58d
 X9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sHz4OKSDkB4X2/Q7yJFO7hSfYBzAsnEHkvj3wqLCRrM=;
 b=nxBCP9aQZZsg3Wuye0YcJ6m+Dffde1Io7HSBea0/cJRm4uLhrUafSIvFSLxmiwsYox
 Vn/0ZaPgGQWwVLuEZCBzXI3S2r6Qg6NZS73ThMjKr1NNzBgj9PSWeBpdEJteR75cjqe+
 3OY7qTyVVeoklKiBbMhVk5c93Lx5ko6XhDoKzJdtALkWfvLRBIvYVcgGiz372/H8yGx1
 tQ3ImfIqeJCDMI3QNYCVtUku13gt0eVKMn18Mbunu50AEpWT2YrFk1mwio3GTFDIsHh9
 VpWrruetvTsd1r8dYPiiVhVbhRoTJtqtMqTOVW/+RcQGXHl2+E7buT+OZH/3PGbdZy8h
 q3Pw==
X-Gm-Message-State: AOAM532Y0DuYjtZoOTxm/KQfqRN/aO3UaeY7fgAfuSraYLK1JWuuyfnV
 XUfYthfUSLm7nZY3d1M4paFAmp1PZp4xV+M7XyRWmQ==
X-Google-Smtp-Source: ABdhPJwyuSTugqUYHaQ4hSDpnN5iCAD1CWMPOwrJI7WpPQ/DNfB4Wc8UGgPr5YkaAAeosXiDys5n3dElhIrrGhbTfKo=
X-Received: by 2002:a05:6638:b30:: with SMTP id
 c16mr665504jab.61.1606951711513; 
 Wed, 02 Dec 2020 15:28:31 -0800 (PST)
MIME-Version: 1.0
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
 <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
In-Reply-To: <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Dec 2020 15:28:20 -0800
Message-ID: <CAMn1gO4KNq_EBrwmHjhFzp==VdEq+ExrKQHmYfz5RKvDj1Q4GA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=pcc@google.com; helo=mail-io1-xd42.google.com
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

On Wed, Dec 2, 2020 at 2:57 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 02.12.20 23:46, Frank Yang wrote:
>
>
>
> On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>> On 02.12.20 23:19, Frank Yang wrote:
>>
>>
>> From downstream: https://android-review.googlesource.com/c/platform/exte=
rnal/qemu/+/1515002
>>
>> Based on v3 of Alexander Graf's patches
>>
>> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>>
>> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
>> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
>> require effort to do that accurately---with individual values, even if
>> they are a tiny bit off it can result in a lockup due to inconsistent
>> time differences between vCPUs. So just use a global approximate value
>> for now.
>>
>> Not tested in upstream yet, but Android emulator snapshots work without
>> time warp now.
>>
>> Signed-off-by: Lingfeng Yang <lfy@google.com>
>>
>>
>> If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, w=
e should be able to just recover the offset after migration by looking at Q=
EMU_CLOCK_VIRTUAL to set CNTVOFF, right?
>>
>> That would end up much easier than this patch I hope.
>>
>>
>
> The virtual clock interfaces/implementations in QEMU seem complex to me r=
elative to the fix needed here and they don't seem to compute ticks with ma=
ch_absolute_time() (which in this case we want since we want to compute in =
timer ticks instead of having to mess with ns / cycle conversions). I do ag=
ree this patch does seem more complicated on the surface though versus "jus=
t" setting cntvoff directly to some value. Maybe we should simplify the QEM=
U_CLOCK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using mac=
h_absolute_time() first?
>
>
> So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an offset to =
gettimeofday(). This offset is already part of the live migration stream[1]=
. So if you just configure CNTVOFF_EL2 based on QEMU_CLOCK_VIRTUAL adjusted=
 by the clock frequency on vcpu init, you should have everything you need. =
You can do that on every CPU init even, as the virtual clock will just be 0=
 on start.
>
> The only thing we need to change then is to move the WFI from a direct ca=
ll to mach_absolute_time() to also check the virtual clock instead. I would=
 hope that gettimeofday() calls mach_absolute_time() in the background too =
to speed it up.

I'm not sure that something based on gettimeofday() (or
clock_gettime(CLOCK_MONOTONIC) which it looks like cpu_get_clock() can
also call) will work. It will include time spent asleep so it won't
correspond to mach_absolute_time() aka guest CNTVCT_EL0.

Peter

