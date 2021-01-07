Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C42EE66C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:56:40 +0100 (CET)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbOh-0006ha-UQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbNm-0006GM-QN
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:55:42 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbNk-0002Iz-AT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:55:42 -0500
Received: by mail-ed1-x52a.google.com with SMTP id dk8so8992593edb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7SXSig0muN4csUfjUVelr09wURfm8NfrWQoubw3s1LA=;
 b=fBJqO4KbSBCc38mKWHNxBS8WHlzQbDailQHulyA+DfYQFLW7/zR2mzK1OcilsRdtZP
 ljs4pW+WDtB29fWUs+jPm6tvVyqFEq0DM64yQatvrz8OnYiA2pG6C7BIlxlaiL3fX+2K
 DK98P3w8TD6uMbeCkHkyj3b5geTSsTD+0HMJV+DMok2xZke4v1ShJMVQg5xG9tERfnp9
 zDVcPRyzHCtK32OVmjwvpyZ8C++V8rO7tLsmvWavTygpKCLElKp/KfgfvZWPf6a/4/jD
 5JCQEMPOnrDVfbam/U/3C9HHFPbN4XDfABqUaT2DMHChuDot/X7bc6yq5+mPnPJAOidN
 tkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7SXSig0muN4csUfjUVelr09wURfm8NfrWQoubw3s1LA=;
 b=Js24jlCPmPlhH344lpRMAAsjAT0nDIiijQSHgvrLzvT2xx+Q0GXGsv5UDfsYbF4mGz
 /xRo3ubGbgb4R6/UYi4xtNuZo9fRahhKawUnlvmkWaqMyJe5+KV2Cv0UCMjN++rAr+7w
 ffXRSKHfD+dBKKnG5mnhJaN/txTg1OVp1yh2dvqYQc+Qrlx5sgHGuoCpJR+qAZEYop6d
 xPztEzbQtJshYXamizjz7CUhtBm9lDXXDL+wuJViQ1nm9rAdFQWMB3rbGHV1ybxELY8k
 Y8Iam2Mb6cQxbuxW81JpYQ0vF0f4RT3e7BW2OCzhKKVzEOf+tn+P8YaEQRQQ0WBWapxN
 1LIQ==
X-Gm-Message-State: AOAM532wyUy5EDBlfxBhfKbQ9qdjODJgH34Tdl6CNdbbmz8p+yGNRvmq
 3SOCjH1vrdKuBGV/gs+6+ndjCTjDk9H5JEe/h1d+nA==
X-Google-Smtp-Source: ABdhPJwZxW/tkQh845mvpawmoByhYa91Qw9pdTLpcnPt9gV8wxv9jjDQge7VZe6nU2kyw5R+tzrhZzO0SwElONz8nd0=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2847854edr.204.1610049338781; 
 Thu, 07 Jan 2021 11:55:38 -0800 (PST)
MIME-Version: 1.0
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
 <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
 <9468010.vzF1F9XyNR@philogene>
 <1b14279c-f620-5c03-b25c-a52fa370cc8e@linaro.org>
In-Reply-To: <1b14279c-f620-5c03-b25c-a52fa370cc8e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 19:55:27 +0000
Message-ID: <CAFEAcA__s4qvX0W0n+gXNhPisZXvknUEYjeWzF_ov+9tVXVqnQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>,
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Dec 2020 at 16:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/31/20 1:59 AM, R=C3=A9mi Denis-Courmont wrote:
> > Le jeudi 31 d=C3=A9cembre 2020, 00:38:14 EET Richard Henderson a =C3=A9=
crit :
> >> On 12/30/20 2:10 PM, Richard Henderson wrote:
> >>> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> >>>> From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >>>>
> >>>> Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.=
com>
> >>>> ---
> >>>>
> >>>>  target/arm/helper.c | 14 ++++++--------
> >>>>  1 file changed, 6 insertions(+), 8 deletions(-)
> >>>
> >>> The patch does more than what is described above.
> >>>
> >>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >>>> index df195c314c..b927e53ab0 100644
> >>>> --- a/target/arm/helper.c
> >>>> +++ b/target/arm/helper.c
> >>>>
> >>>> @@ -10821,17 +10821,12 @@ do_fault:
> >>>>   * Returns true if the suggested S2 translation parameters are OK a=
nd
> >>>>   * false otherwise.
> >>>>   */
> >>>>
> >>>> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level=
,
> >>>> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t
> >>>> level,
> >>>>
> >>>>                                 int inputsize, int stride)
> >>>>
> >>>>  {
> >>>>
> >>>>      const int grainsize =3D stride + 3;
> >>>>      int startsizecheck;
> >>>>
> >>>> -    /* Negative levels are never allowed.  */
> >>>> -    if (level < 0) {
> >>>> -        return false;
> >>>> -    }
> >>>> -
> >>>
> >>> I would expect this to be the only hunk from the patch description.
> >>> Probably changing this negative check to a >=3D 3 check.
> >>
> >> Having read the next patch, I think you should drop this type change.
> >>
> >>>> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *=
env,
> >>>> uint64_t address,>>
> >>>>          if (!aarch64 || stride =3D=3D 9) {
> >>>>
> >>>>              /* AArch32 or 4KB pages */
> >>>>
> >>>> -            startlevel =3D 2 - sl0;
> >>>> +            startlevel =3D (2 - sl0) & 3;
> >>
> >> This hunk belongs with the next patch, implementing TTST, and should b=
e
> >> conditional.  I.e.
> >>
> >>     if (stride =3D=3D 9) {
> >>         startlevel =3D 2 - sl0;
> >>         if (aarch64 &&
> >>             cpu_isar_feature(aa64_st, env_archcpu(env)) {
> >>             startlevel &=3D 3;
> >>         }
> >
> > You can do that but:
> > 1) Nothing in the spec says that SL0 =3D=3D b11 without ST means start =
level -1.
> > It's undefined, and I don't see any reasons to treat it differently tha=
n with
> > ST.
>
> By that logic there's no reason to treat it differently at all; you could=
 drop
> the feature check entirely.  In lieu, -1 makes a decent error indicator.
>
> > 2) Functionally, checking for ST seems to belong naturally within
> > check_s2_mmu_setup() in this particular case.
>
> I guess.  I'll leave it to Peter's preference.

You've reviewed the patchset, I'm happy to go with whatever your
preference is (because I don't want to have to duplicate the
review work to form an opinion).

thanks
-- PMM

