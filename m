Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3836965D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:47:41 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZy1s-0007Li-SF
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZy04-0006nb-98
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:45:48 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZy02-00068t-IS
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:45:47 -0400
Received: by mail-ed1-x532.google.com with SMTP id g17so57274087edm.6
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pwo2QBwikqWrfyP3XgSpFDiQqPLVBKHyCJr25WZyDvQ=;
 b=c/qciLh10KyEwCNGPLiSCZSfvh9es+7+5Rf72BKfAb4ja2Trd/dDQuvpcjLoo1zOdC
 sBvA/yCcBXPdS0MLRbc2Lx8vudB9ovqn9vbnRoLuOcA+d/YP7dG5lv/QLGyq8yJ0KSHf
 0cYDTNzkRmwy0XDKu+XlweQSEeZQDeTxGOCfGL0wR2ZFeeVxQehzykqUjyaNEV9Vo4cB
 P0RA34ZERtVtLx1vCkNeHnijlcTwihaM2ogfhaq36gNytPBrCvZIx5q1vpmQ+7lU1FmX
 LGO2sAq5uGGaORIdSL9VGBlq0dNeLYBcUHxwyxmwyI2qYIv52Qub1aKHEawZDGRqGACC
 GszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pwo2QBwikqWrfyP3XgSpFDiQqPLVBKHyCJr25WZyDvQ=;
 b=TC4B8N1NtCVJP/nYVM1XgfoAhXHOBUqrtcOWicFZC5dx3FdnvjhJpeIbg075jc0eB3
 8ttKnC8F5GlLsM1Qny8RuF3wjbmSre6iogdVcyIlZZVb4H+CScEGyo2yLdrV105XSDZ+
 fYWCI1GrDBbrgtRzdnJidDp5yK6xXw0+wB46IP5Xgvmm5Aw2mZ05uZWsQNyYlRCQx50E
 /zbPPYSFUXlLdcY0cFsb8fxxv94Ng1CCdu+Qby4ym5/JHZTeh/AGAIJmmkKF+03tfE7+
 GwlgCqMVY5XS3jJj+rPtrsJRRHUY08kk78SWFfopL8Lma+5oTEN1aWjFaOghXAlNZiM8
 FFAg==
X-Gm-Message-State: AOAM530l6fWSnmXUy7slqoJ7sY8DtP6iohlJvxRb8e1wnjqbhU8wtSTJ
 rBH3i5B95vwSzOuIU4nScIDgaxHB69BNUhTGo6e9Tw==
X-Google-Smtp-Source: ABdhPJwvdAlG0KkR9tF+sTLq2nlr7LEKXAqWpHEBws/3fXfvioVcMR5cocuZi7Xh+2imqEuyiKV69Ys3HzyIiJY8sVw=
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr5186405edq.251.1619192745110; 
 Fri, 23 Apr 2021 08:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210422154427.13038-1-alex.bennee@linaro.org>
 <20210423142209.03032dc5.cohuck@redhat.com>
 <CAFEAcA80L=xum=9m+2TLiP09OrjuRG4VghfxK8A42Y+0+EUB2g@mail.gmail.com>
 <dae28ff3-5c32-2345-a336-30f59eb59b13@redhat.com>
 <20210423155231.1f8e2a30.cohuck@redhat.com>
 <CAFEAcA92CVNBpqHS9tFGZuAwDFyp=p8hn6duDRoASzErXBgGWw@mail.gmail.com>
In-Reply-To: <CAFEAcA92CVNBpqHS9tFGZuAwDFyp=p8hn6duDRoASzErXBgGWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 16:44:49 +0100
Message-ID: <CAFEAcA9Y=b-e92KLwE52FNXVJHVjjpiLeetOTy-D6Qpxhn+pKg@mail.gmail.com>
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 14:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 23 Apr 2021 at 14:52, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > On Fri, 23 Apr 2021 15:28:19 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> >
> > > On 23/04/2021 15.06, Peter Maydell wrote:
> > > > On Fri, 23 Apr 2021 at 13:22, Cornelia Huck <cohuck@redhat.com> wrote:
> > > >> What's the verdict on this one? I plan to queue this to s390-next; but
> > > >> if we end up doing an -rc5, it might qualify as a regression fix.
> > > >
> > > > What's your opinion? I think we do need an rc5 for the network backend
> > > > hotplug crash. I don't want to open the doors for lots of new fixes
> > > > just because we've got another rc, but on the other hand this one
> > > > does look like it's a pretty small and safe fix, and letting intermittent
> > > > crash bugs out into the wild seems like it could lead to a lot of
> > > > annoying re-investigation of the same bug if it's reported by users
> > > > later... So I kind of lean towards putting it in rc5.
> > >
> > > IMHO: It's in a s390x-only file, within a #ifdef CONFIG_USER_ONLY ... so the
> > > damage this could do is very, very limited, indeed. Thus I'd also suggest to
> > > include it in a rc5.
> >
> > Exactly, the benefits outweigh the risk IMHO.
> >
> > Peter, do you want to pick this one directly, or should I send you a pull req?
>
> I'll pick it directly, thanks.

...applied to target-arm.next, thanks.

-- PMM

