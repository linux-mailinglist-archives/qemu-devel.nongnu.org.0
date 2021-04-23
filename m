Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C37369616
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:22:43 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxdi-0005Qu-E4
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZxbz-0004Ou-S6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:20:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZxbn-00057V-GX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:20:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so5987604wma.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YTz/j7P3loIYekkPvm4cE9kysPkEmJfzjI1X99+om5I=;
 b=MtzKX1OpINPQoDqQq5/HphwsoWBAZAJa1oxe9es5DbB++BLM6vEqLxgCE0g9K2a0vO
 cVvW15eXRnhEZpoS/AXB9Hkbr/B/dIxopepDC2+uTmkkGsqI24ZZVt8ZZRuRRhNeoznW
 hTSKO9B5GPC3TymdAWvXTRA3yymBHabR6XDCc8jlej/GzmGKlDcND8PpZDQT8c+NHRVf
 7U+ZCbOILfc/UehmFGlWPA85t+SR3deyMJY5Mhdq9DlHGM9CaeLOPpgLPC1bt0zWfUvE
 5mfNPnFOWiKJvmi3fQqmmwy51LuvEIqnK0VJgQOjbTZo16KeqHWM/55jgMAsZSGtBYsl
 Ti3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YTz/j7P3loIYekkPvm4cE9kysPkEmJfzjI1X99+om5I=;
 b=IaeZJ4V1J0gEQBLQfYTInjLubPftCFKpm+9w1GikOZQlMWPpvRhpNR5aix6OAp/Oo6
 L5/YRKuPr3EwllSnmWbKLo8g90WksVOr2W6cTT8NyF28r72GyyXXs29uVU+g6BnnJ8yX
 Psy7k4wvAoDQUe++/ksPoe//5hIJKPKCmMQAR80Mdr/0UKf2K5SfB1vStmK5b/drvj87
 bBlXbZF531lzryerjKRfvg2AQhPB7FYrasLh91E0yAPvxrUax3zduwFjDvfKzKI2MBrl
 qMovkldnQ8NXN99jB6jnSplpy4iGt1PZOZJ99LlLf4t+7f+tJQ6llV+KDk+fpt+1czLj
 x+fA==
X-Gm-Message-State: AOAM530b+bvlayhYyFM+Dco4pXxW3XR7BCKZcwxmt4uQ2edCsVQqxcXM
 RK597PzEA0Q053M0R6UXkcTeLg==
X-Google-Smtp-Source: ABdhPJwo/XFMf4i77bpT+mv9c5F2dDfSnI/iD1rpcx5giUBiZDgL34lpLFDJYgW8UfuCDtOfwCegZg==
X-Received: by 2002:a1c:196:: with SMTP id 144mr6077095wmb.72.1619191239666;
 Fri, 23 Apr 2021 08:20:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x189sm11423117wmg.17.2021.04.23.08.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 08:20:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3339A1FF7E;
 Fri, 23 Apr 2021 16:20:38 +0100 (BST)
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org> <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
 <87r1jfmhnr.fsf@linaro.org> <YHVXSJs6JpCnSvqw@stefanha-x1.localdomain>
 <87o8eimszx.fsf@linaro.org>
 <30c46fec5a5e5cf3d3f31c84da0e7f1efb0e8fcd.camel@imperial.ac.uk>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Vilanova, Lluis" <vilanova@imperial.ac.uk>
Subject: Re: trace_FOO_tcg bit-rotted?
Date: Fri, 23 Apr 2021 16:14:59 +0100
In-reply-to: <30c46fec5a5e5cf3d3f31c84da0e7f1efb0e8fcd.camel@imperial.ac.uk>
Message-ID: <87czul6n95.fsf@linaro.org>
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
Cc: "matheus.ferst@eldorado.org.br" <matheus.ferst@eldorado.org.br>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Vilanova, Lluis" <vilanova@imperial.ac.uk> writes:

> El dt. 13 de 04 de 2021 a les 10:25 +0100, en/na Alex Benn=C3=A9e va
> escriure:
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>=20
>> > On Mon, Apr 12, 2021 at 08:06:57PM +0100, Alex Benn=C3=A9e wrote:
>> > >=20
>> > > Stefan Hajnoczi <stefanha@redhat.com> writes:
>> > >=20
>> > > > On Fri, Apr 09, 2021 at 05:29:08PM +0100, Alex Benn=C3=A9e wrote:
>> > > > >=20
>> > > > > Laurent Vivier <laurent@vivier.eu> writes:
>> > > > >=20
>> > > > > > Le 06/04/2021 =C3=A0 18:00, Alex Benn=C3=A9e a =C3=A9crit=C2=
=A0:
>> > > > > > > Hi,
>> > > > > > >=20
>> > > > > > > It's been awhile since I last played with this but I
>> > > > > > > think we are
>> > > > > > > suffering from not having some test cases for tracing
>> > > > > > > code
>> > > > > > > generation/execution in the tree. I tried adding a simple
>> > > > > > > trace point to
>> > > > > > > see if I could track ERET calls:
>> <snip>
>> > > >=20
>> > > > Llu=C3=ADs: are you happy to deprecate tcg trace events in favor of
>> > > > TCG
>> > > > plugins?
>> <snip>
>> >=20
>> > That said, I haven't used the TCG trace event functionality and
>> > maybe
>> > I'm missing something obvious that Llu=C3=ADs will point out :).
>>=20
>> I've updated the Cc to what I think is Llu=C3=ADs current email as I was
>> getting bounces from the old academic address.
>
> Hi folks, long time no write; thanks for tracking me down :)
>
> I think it'd be great to deprecate TCG tracing in favour of the plugin
> interface, pushing some of the burden out of qemu.
>
> I haven't measured the performance of the plugin interface, but AFAIR
> TCG trace prints also use TCG helpers, so there should not be a lot of
> difference.

Pretty much. The only real difference is we don't have plugins enabled
by default as there is a small impact when no plugins are used do to the
insertion of dummy callbacks during code generation. We do this to avoid
a double-pass later.

> As Stefan pointed out, this means plugin writers will have to write
> their own TCG tracing code. Hopefully, the plugin API can be extended
> to integrate with qemu's logging backend (it seems qemu_plugin_outs
> goes somewhere else),

qemu_plugin_outs goes out via the logging backend - but not the tracing
subsystem. Do you think being able to emit tracepoints to simpletrace or
the dtrace/ftrace would be a useful extension to the API.

> and common plugins can be kept on a separate repo
> under the qemu umbrella for easier reuse (e.g., to provide the same
> functionality as TCG tracing).

Currently we have two areas in QEMU, tests/plugins which are very basic
and used in check-tcg to exercise the code and contrib/plugins where the
meatier plugins are defined. I'm happy (and encourage!) more to be added
there.

Do you have any documented uses of the trace subsystem that I could
re-implement in TCG plugins by way of example? I have the feeling it has
been used for academic papers but I haven't seen usage "in the wild".

>
>
> Cheers,
> Lluis


--=20
Alex Benn=C3=A9e

