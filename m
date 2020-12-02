Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500022CCA84
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:28:35 +0100 (CET)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbY1-0001VK-NZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kkbVh-0000T4-9O
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:26:09 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kkbVc-0005Aj-Na
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:26:09 -0500
Received: by mail-yb1-xb42.google.com with SMTP id k65so294058ybk.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 15:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQ85AzkbzRMJnUXKvhA437h4F/Rsa3DaDIx8KCNIi0E=;
 b=v3f+wtqC/pJOXAPgZpvCB2F62AWVsFa9E4f0s5nG9yyfm9Wsy29r6Ob7D3CAwv58or
 Xm3KvuH8utBAad07DoMrunfEgx3TEnGn0jwJ64e3uykBAWKWTQt2rD5Lkp1A/BykIPIv
 2XVBZ4RuCiT6ngNfQkb9u60DQm5QfvdrSlqkTSCQ/7BcEbAeJzcKrvdNt09/WbiDYMbc
 Eb9eHlVn4dhtKZ2AjtsyJl0Ed4iOdBzESqWXaLFxN/66YE4eyHmQ11dlBQ8XUDt88XMw
 xbjWOQSmq6+MNNUrpPuSafKZgaGYB3FCwCnavYX41oOFCKTOACNnfaDdzhXyWuwldKtf
 g5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQ85AzkbzRMJnUXKvhA437h4F/Rsa3DaDIx8KCNIi0E=;
 b=Oq7eEi/W/N7dNYr7lsmQYmnHjmrClgoKElr6WY4+8TJnnSnxieWOc/+PSoLW6gdP7C
 1IaKIaCknzaMSQFfuc8terqq0sgLO8Av2S3DfEAp0RqExn0R2zA9vWhJ9JhJArjf0wEb
 BHo3nymTZW14XiYA6JRI1yFhMfHwgtUaQtiYKKpODtxs5bMotkf8b+JgEWrwzY2lrArO
 7IW/pVrKFmpo1eaeQwTRmvcSjL4x24uTQq6n3hWn0foVQDW5gDjCyvJ80DDce8SqGdnY
 7sclHQFqMtfY1Xumn86JyUogvuUPb/u7A9NpCu1FwpAMJ/m+OR+ENxZ342LxU/7IHYwC
 K8rA==
X-Gm-Message-State: AOAM530p5Mt0YeefF4dfXwsX0PofN0pfjSqWxWeBdZvOOHYbKS8MztY8
 nIgTf6kC8jhUNrn5XYyZ+Lf2Gz/WvPHbbzaKmqL9iw==
X-Google-Smtp-Source: ABdhPJyewffCvQ3F9raV7J+DiiAHyFOxCJiNgBuN+JLDstXa0hHytTli4JNRypuH0BBWcNWNaJm9qkMO+bm9IHx8eK4=
X-Received: by 2002:a25:6191:: with SMTP id v139mr870945ybb.76.1606951563245; 
 Wed, 02 Dec 2020 15:26:03 -0800 (PST)
MIME-Version: 1.0
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
 <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
In-Reply-To: <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
From: Frank Yang <lfy@google.com>
Date: Wed, 2 Dec 2020 15:25:52 -0800
Message-ID: <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000197f9405b58391b7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=lfy@google.com; helo=mail-yb1-xb42.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000197f9405b58391b7
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 2:57 PM Alexander Graf <agraf@csgraf.de> wrote:

>
> On 02.12.20 23:46, Frank Yang wrote:
>
>
>
> On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>>
>> On 02.12.20 23:19, Frank Yang wrote:
>>
>>
>> From downstream:
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1515002
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
>> If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, we
>> should be able to just recover the offset after migration by looking at
>> QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?
>>
>> That would end up much easier than this patch I hope.
>>
>>
>>
> The virtual clock interfaces/implementations in QEMU seem complex to me
> relative to the fix needed here and they don't seem to compute ticks with
> mach_absolute_time() (which in this case we want since we want to compute
> in timer ticks instead of having to mess with ns / cycle conversions). I do
> agree this patch does seem more complicated on the surface though versus
> "just" setting cntvoff directly to some value. Maybe we should simplify the
> QEMU_CLOCK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using
> mach_absolute_time() first?
>
>
> So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an offset to
> gettimeofday(). This offset is already part of the live migration
> stream[1]. So if you just configure CNTVOFF_EL2 based on QEMU_CLOCK_VIRTUAL
> adjusted by the clock frequency on vcpu init, you should have everything
> you need. You can do that on every CPU init even, as the virtual clock will
> just be 0 on start.
>
> The only thing we need to change then is to move the WFI from a direct
> call to mach_absolute_time() to also check the virtual clock instead. I
> would hope that gettimeofday() calls mach_absolute_time() in the background
> too to speed it up.
>
> Sounds plausible, but I noticed that we also have cpu_ticks_offset as part
of the migration stream, and I prefer mach_absolute_time() (ticks) instead
of seconds in WFI as well as it makes the calculation more accurate (ticks
against ticks instead of conversion between ns and ticks).

Should we look at integrating this with cpu_ticks_offset instead?



>
> Alex
>
>
> [1]
> https://git.qemu.org/?p=qemu.git;a=blob;f=softmmu/cpu-timers.c;h=1eb7c675c18bda7773d4a9c549f0157c6e978a83;hb=HEAD#l229
>

--000000000000197f9405b58391b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 2:57 PM Alexan=
der Graf &lt;<a href=3D"mailto:agraf@csgraf.de">agraf@csgraf.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 02.12.20 23:46, Frank Yang wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 2:28
            PM Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de" target=
=3D"_blank">agraf@csgraf.de</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 02.12.20 23:19, Frank Yang wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr"><br>
                  <div>From downstream: <a href=3D"https://android-review.g=
ooglesource.com/c/platform/external/qemu/+/1515002" target=3D"_blank">https=
://android-review.googlesource.com/c/platform/external/qemu/+/1515002</a><b=
r>
                    <br>
                    Based on v3 of Alexander Graf&#39;s patches<br>
                    <br>
                    <a href=3D"https://patchew.org/QEMU/20201202190408.2041=
-1-agraf@csgraf.de" target=3D"_blank">https://patchew.org/QEMU/202012021904=
08.2041-1-agraf@csgraf.de</a><br>
                    <br>
                    We need to adjust CNTVOFF_EL2 so that time doesnt
                    warp.=C2=A0 Even though we<br>
                    can set separate CNTVOFF_EL2 values per vCPU, it
                    just is not worth the<br>
                    require effort to do that accurately---with
                    individual values, even if<br>
                    they are a tiny bit off it can result in a lockup
                    due to inconsistent<br>
                    time differences between vCPUs. So just use a global
                    approximate value<br>
                    for now.<br>
                    <br>
                    Not tested in upstream yet, but Android emulator
                    snapshots work without<br>
                    time warp now.<br>
                    <br>
                    Signed-off-by: Lingfeng Yang &lt;<a href=3D"mailto:lfy@=
google.com" target=3D"_blank">lfy@google.com</a>&gt;<br>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
              <p>If we just always make CNTV start at the same 0 as
                QEMU_CLOCK_VIRTUAL, we should be able to just recover
                the offset after migration by looking at
                QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?<br>
                <br>
                That would end up much easier than this patch I hope.<br>
                <br>
                <br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>The virtual clock interfaces/implementations in QEMU seem
            complex to me relative to the fix needed here and they don&#39;=
t
            seem to compute ticks with mach_absolute_time() (which in
            this case we want since we want to compute in timer ticks
            instead of having to mess with ns / cycle conversions). I do
            agree this patch does seem more complicated on the surface
            though versus &quot;just&quot; setting cntvoff=C2=A0directly to=
 some value.
            Maybe we should simplify the QEMU_CLOCK_VIRTUAL
            implementation first to maintain CNTVOFF_EL2/CNTV using
            mach_absolute_time() first?</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an
      offset to gettimeofday(). This offset is already part of the live
      migration stream[1]. So if you just configure CNTVOFF_EL2 based on
      QEMU_CLOCK_VIRTUAL adjusted by the clock frequency on vcpu init,
      you should have everything you need. You can do that on every CPU
      init even, as the virtual clock will just be 0 on start.<br>
      <br>
      The only thing we need to change then is to move the WFI from a
      direct call to mach_absolute_time() to also check the virtual
      clock instead. I would hope that gettimeofday() calls
      mach_absolute_time() in the background too to speed it up.<br>
      <br></p></div></blockquote><div>Sounds plausible, but I noticed that =
we also have cpu_ticks_offset as part of the migration stream, and I prefer=
 mach_absolute_time() (ticks) instead of seconds in WFI as well as it makes=
 the calculation more accurate (ticks against ticks instead of conversion b=
etween ns and ticks).</div><div><br></div><div>Should we look at integratin=
g this with cpu_ticks_offset instead?</div><div><br>=C2=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div><p>
      <br>
      Alex</p>
    <p><br>
      [1]
<a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dsoftmmu/cpu-time=
rs.c;h=3D1eb7c675c18bda7773d4a9c549f0157c6e978a83;hb=3DHEAD#l229" target=3D=
"_blank">https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dsoftmmu/cpu-timers=
.c;h=3D1eb7c675c18bda7773d4a9c549f0157c6e978a83;hb=3DHEAD#l229</a><br>
    </p>
  </div>

</blockquote></div></div>

--000000000000197f9405b58391b7--

