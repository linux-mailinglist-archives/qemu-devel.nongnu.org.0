Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5646F711A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:36:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoH-0006wJ-2v; Thu, 04 May 2023 13:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puYLm-00051P-QF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puYLj-0007vj-TJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683204378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B9YqC0o9/qkX6yUGHRT52JjR4W4HUdj4HYbhRjn1iRg=;
 b=bF1YK6ic6ZQUKVErGgNEqUb3MhsZvm1FxEFTwFt+DnfOjWfsYOqPPz/5hg7NTlDfGJfvtw
 BI2I8qJvUIlCdXgmmHEZK8/Nc+q/GxczY+SkmZwIAjd504I4ypDZL+I59InTfOOLd6Ju9F
 FH587q+RStZDu6Zrj6cGzKmM576ZPmA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-t_XvQKYWPsab3oO2yDAuaQ-1; Thu, 04 May 2023 08:46:17 -0400
X-MC-Unique: t_XvQKYWPsab3oO2yDAuaQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-44fda64b04dso304432e0c.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 05:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683204377; x=1685796377;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B9YqC0o9/qkX6yUGHRT52JjR4W4HUdj4HYbhRjn1iRg=;
 b=KuDfngteJUQKb/aYhEs9X3UoiUYqQ2EJkuto+V4VfvQFMR5JJqAulUobpNkBnnEO5W
 TsrBjhJmF6r+EunC1gW6JqKNqBgucIA33GIkIWsmWXNGhOZ7TRm8x/t3T/bGWJLVTBES
 t/kE+UKF0VpJrJ6sfq2Tv/8UL9K/CwkuWNfigFfLklB5WqcbAd4v9f9Jx+eJK4b7/lOi
 IuAOse7yxFE8qvQkO8MkKrmkcWwM+CvFDwzAu3LdzIj/l6ISMVQ/SoaaQ1zGKJCmspH+
 sIxPvbXNLbdLbXi8jeVobQ+rOILenlzhK4zWBEymssS4dTZ3eCLgl7Mrny5JpIVdZ9uK
 2ugA==
X-Gm-Message-State: AC+VfDzFycG6XKKMQ6iPQP5799D8Ef9SQezpr9lGJAsBZjAzE4GtEt7U
 ws9+hBY6w4ps4WaKpFq13YtJEkrUuh6XyLuIgnfgmm2rX1ZWz7K4a+q6YuvYiVO6hJSC5zw7k3j
 lYmBGZiPuOUa/a6kcOyOziKVonS+1YXYKKVxD2VA=
X-Received: by 2002:a05:6102:3668:b0:434:3aa0:ecaf with SMTP id
 bg8-20020a056102366800b004343aa0ecafmr2207004vsb.8.1683204376991; 
 Thu, 04 May 2023 05:46:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66w5cx1pEqWBS40HrzVhgbBpolLcCmKt4BZRDU2WMwLz+tOOB6oy6/8vhZ4l/rNUepc/BCE9xsH7zBkrutbSw=
X-Received: by 2002:a05:6102:3668:b0:434:3aa0:ecaf with SMTP id
 bg8-20020a056102366800b004343aa0ecafmr2206998vsb.8.1683204376739; Thu, 04 May
 2023 05:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
 <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
In-Reply-To: <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 4 May 2023 14:45:44 +0200
Message-ID: <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for
 semihosting
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f5d4cf05fadd8e22"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000f5d4cf05fadd8e22
Content-Type: text/plain; charset="UTF-8"

Il gio 4 mag 2023, 10:59 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Thu, 4 May 2023 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 5/3/23 21:38, Fabiano Rosas wrote:
> > > When building --without-default-devices, the semihosting code will not
> > > be available, so check the proper config.
>
> I think the changes to the ifdeffery are conceptually
> fine (only do semihosting if it was configured in), but
> it sounds like there's a separate problem here.
> Whether we need semihosting depends on the accelerator (ie
> "is it TCG or not"), not on what set of devices we're building.
> So the problem seems to me to be that --without-default-devices
> is causing the semihosting code not to be built in.
>
> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > for this change; however, there are two more related issues:
> >
> > 1) you still want to leave out the code if !TCG, because KVM is not able
> > to exit to userspace on semihosting calls as far as I understand
> >
> > 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
> > config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.
>
> Because those are the architectures which have
> "arm-compatible" semihosting ABIs ?
>

Yes but is there a reason to do it in configs/ where all the other symbols
are boards, or was it just overlooked and a "default y" (as I suggested in
the previous reply) or "imply" is better?

The latter would be

config ARM_COMPATIBLE_SEMIHOSTING
    bool
    depends on TCG

and under "config ARM/RISCV32/RISCV64"

imply ARM_COMPATIBLE_SEMIHOSTING

Paolo

>
> -- PMM
>
>

--000000000000f5d4cf05fadd8e22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 4 mag 2023, 10:59 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter=
.maydell@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Thu, 4 May 2023 at 08:33, Paolo Bonzini &lt;<a href=3D"mailto:pbonz=
ini@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@re=
dhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/3/23 21:38, Fabiano Rosas wrote:<br>
&gt; &gt; When building --without-default-devices, the semihosting code wil=
l not<br>
&gt; &gt; be available, so check the proper config.<br>
<br>
I think the changes to the ifdeffery are conceptually<br>
fine (only do semihosting if it was configured in), but<br>
it sounds like there&#39;s a separate problem here.<br>
Whether we need semihosting depends on the accelerator (ie<br>
&quot;is it TCG or not&quot;), not on what set of devices we&#39;re buildin=
g.<br>
So the problem seems to me to be that --without-default-devices<br>
is causing the semihosting code not to be built in.<br>
<br>
&gt; Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br=
>
&gt;<br>
&gt; for this change; however, there are two more related issues:<br>
&gt;<br>
&gt; 1) you still want to leave out the code if !TCG, because KVM is not ab=
le<br>
&gt; to exit to userspace on semihosting calls as far as I understand<br>
&gt;<br>
&gt; 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy appears in<=
br>
&gt; config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.<br>
<br>
Because those are the architectures which have<br>
&quot;arm-compatible&quot; semihosting ABIs ?<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Yes but is there a reason to d=
o it in configs/ where all the other symbols are boards, or was it just ove=
rlooked and a &quot;default y&quot; (as I suggested in the previous reply) =
or &quot;imply&quot; is better?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The latter would be</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">config ARM_COMPATIBLE_SEMIHOSTING</div><div dir=3D"auto">=C2=A0 =C2=
=A0 bool</div><div dir=3D"auto">=C2=A0 =C2=A0 depends on TCG</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">and under &quot;config ARM/RISCV32/RI=
SCV64&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">imply ARM_CO=
MPATIBLE_SEMIHOSTING</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000f5d4cf05fadd8e22--


