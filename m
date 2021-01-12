Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F372F38DD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:29:51 +0100 (CET)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOQQ-00030T-1E
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzOOj-0001ZU-V4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:28:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzOOi-0004b6-5b
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:28:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id y23so3065050wmi.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GYO2ccOsqbRiWFoW2+NqjBaOx9fjBfH3osNfKj9vS38=;
 b=CyQHrqkm9i+Sdsg7+sjevtbC7ysNL5tENPnXO3lU/PSf2YKnMd43CNVafb4E88o8WP
 6vAhstRRcfRdoKRY5v1FlTfcD86rUwAvhMTrslZ3EoOLUQ5EPeRY1CxybohJev3wqom1
 gxZNDFPm9WAZPA65LCw7AgF5FhaVaBvUrBFMeMG6fgCgSIze0/l+oDSsiFVKbzwQKi07
 v79ZQOIqsM1a22VWP1f8dZmY7Gi1BFr+McCwGeqSzoMZza7tf92g7FMgAQdkW7G2XFBK
 lFJJPvkCQBvvYaHqs38CA+h25q1ibVxPotH/CfzIqd1I/Gst5triGd9YdUbeXbuM69fg
 M6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GYO2ccOsqbRiWFoW2+NqjBaOx9fjBfH3osNfKj9vS38=;
 b=bQIQeJTV6qanvuh0QBCZ3rKY9ayFMSwl1qJZ8vY6ctimucyRt6NyYPC1HQh7KwFgdE
 WTsTeo4EXF2zVWq2whn2AT0jmvb4K8V7bs7nptxdj3Hhitw7kp87LHQsUgXF3nLOm7dT
 g8zEBTUq2b7CdeKBlOKtK6SCdo15IU9niO7XTEpUbDAjLLM1NpLXWIUasiMFtUCTaiT8
 GOjR+u/MElfvAKPg2wJ2tMQVHA4w7zFwXyADoOv9IcwCWeBscvrNmAt3juDTXz35sJvn
 CGgI18bxNcxr2WFxS9Ow8GKrTZH789X+opQyfK7V505i75WUu2aYZn8uH5AYbedNXbAu
 slAA==
X-Gm-Message-State: AOAM530AmLsRjPti3p5IViLPJT4wjFQEnz6xRzFWx6aNzRDdxJCUDUzN
 log4ROUuqysIYCqep6VGZQxgug==
X-Google-Smtp-Source: ABdhPJyhciVNeQ9TZaEcLj39E17ZC8NMDlj/bk7Jg+Cu+LggjBiQriYOJjg4qwHXR7ENBt7RjLN/Uw==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr517151wmd.39.1610476082366; 
 Tue, 12 Jan 2021 10:28:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h184sm5389198wmh.23.2021.01.12.10.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:28:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D6621FF7E;
 Tue, 12 Jan 2021 18:28:00 +0000 (GMT)
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-35-git-send-email-tsimpson@quicinc.com>
 <874kjmnz71.fsf@linaro.org> <20210112145319.1c9440a9@orange>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>
Subject: Re: [PATCH v6 34/35] Auto-import Docker support files
Date: Tue, 12 Jan 2021 18:26:29 +0000
In-reply-to: <20210112145319.1c9440a9@orange>
Message-ID: <87h7nmm2mn.fsf@linaro.org>
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
Cc: Fam
 Zheng <fam@euphon.net>, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alessandro Di Federico <ale@rev.ng> writes:

> On Tue, 12 Jan 2021 11:58:30 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> > -            for filename in args.extra_files or []:
>> > +            extra_files =3D args.extra_files or []
>> > +            extra_files +=3D glob(basename + ".*")
>> > +            for filename in extra_files:=20=20
>>=20
>> Hmm not so sure about this magic. What's wrong with the existing
>> --extra-files mechanism?=20
>
> I'd be OK with using that, but how can I automate it?
>
> It is my understanding that `--extra-files` is only set by through the
> EXTRA_FILES environment variable. Therefore the user should do
> something like this:
>
>     make check-tcg \
>         DOCKER_IMAGE=3Ddebian-hexagon-cross \
>         DOCKER_CROSS_CC_GUEST=3Dhexagon-unknown-linux-musl-clang \
>         EXTRA_FILES=3D"..."

I'm confused - extra-files is while building the docker image, not
running it.

>
> Or am I missing some part of how this works?

Add an explicit rule in Makefile.include:

  docker-image-debian-hexagon-cross: EXTRA_FILES=3Dfoo.bar

--=20
Alex Benn=C3=A9e

