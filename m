Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11533892AE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:31:14 +0200 (CEST)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOAD-0005No-Nr
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljO71-0002vN-KJ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:27:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljO6w-0005ka-V6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:27:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id x8so14455426wrq.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yTVa0tl4ospmeskMkPGL2F6r7MB0cKwldGTkp39oL5Y=;
 b=MAC+CYZQkVnBgXcZS1GllJ+Gt7Der4BGKgGBO4RzHOJjQhaJGKRDfSrxmmu/HgrGTt
 HKQBgKip8mX+ZQ6lundFAN/5tY3lObIYbOHSCI9IeljtBem1hXSwoKVJRZ3avY2XEo3J
 KExZtBK6IxmdBUWI/ehAUnUXBNvtFQvg88QqM30/LIM1lPNdq39WQJUSn3jQSq2uxbis
 0Fr3qk+3fJoSoOsy5YEG5sOdOQCcgKVvvJv67O1QHKyP3hI6byktI5HAZlyKbHKGDoZ9
 m7sL6TQ8pv5dg4ltL+9ntorGmfTLsOhvTnVbXRM5PusjYYkDbsLtrmFGRZrxHQCAJcJb
 S49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yTVa0tl4ospmeskMkPGL2F6r7MB0cKwldGTkp39oL5Y=;
 b=iAnVZvIDEvZ+MTZcamosd+fhgnGX5BTYCHH775oEqB/YSbXJVUYIhUXV988WXinoEM
 a6hH/0F6AN4m8C4HP/Hcx2legk3T5S+EpItobd/+F9wKkGexlgOjVZJ9K811USV9d/pt
 q9YI7gAU9DtaENKmC50xqGK8gcAM3se0qjFwyi0nb/ORRYctoQhUfRx5fI6FV3ebVqeQ
 xk22VVXNwHAvgu3PIzYfnMkwOGai+bFEXuDvipRjcMDJkVQOpUvoOyPJ9F2F+Cjq4PXq
 jHmX/t3GzVOl4tD8ohfnFjRNPh2SiMQzWoBhlGgjl9BxmpOP4eze+ihSME1hY+80ch3F
 5LPg==
X-Gm-Message-State: AOAM530lRjYP2Ri/hmDqfgLXfVllcFAPsIjrwK+71QjT1MLz6FBZiZxx
 HwLK+DfXwnV+YtzECHMxCfssAQ==
X-Google-Smtp-Source: ABdhPJwk1id3lT+aPyD+vBEE4Rhkda/+ywimmBQoPM+HUz1wiMTlOmZfIoU8MUb2oQcqqMWky0nK5g==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr15335204wrq.112.1621438064429; 
 Wed, 19 May 2021 08:27:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l22sm6149371wmq.28.2021.05.19.08.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:27:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA3331FF7E;
 Wed, 19 May 2021 16:27:42 +0100 (BST)
References: <20210518090720.21915-1-alex.bennee@linaro.org>
 <CAFEAcA_biNmALCd9hkCiRXWOiiKv9hPhHFH9=Yt1PMVCTF+kNg@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/29] testing and plugin updates
Date: Wed, 19 May 2021 16:26:54 +0100
In-reply-to: <CAFEAcA_biNmALCd9hkCiRXWOiiKv9hPhHFH9=Yt1PMVCTF+kNg@mail.gmail.com>
Message-ID: <87o8d6d9qp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 18 May 2021 at 10:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 367196caa07ac31443bc360145cc10fbef4fd=
f92:
>>
>>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-=
6.1-pull-request' into staging (2021-05-17 16:44:47 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-updat=
es-180521-2
>>
>> for you to fetch changes up to b1aa4de12e846e0ad18969ee823c19b66d8d4d8f:
>>
>>   configure: use cc, not host_cc to set cross_cc for build arch (2021-05=
-18 09:36:21 +0100)
>>
>> ----------------------------------------------------------------
>> testing and plugin updates:
>>
>>   - various fixes for binfmt_misc docker images
>>   - add hexagon check-tcg support docker image
>>   - add tricore check-tcg support
>>   - refactor ppc docker images
>>   - add missing ppc64le tests
>>   - don't use host_cc for test fallback
>>   - check-tcg configure.sh tweaks for cross compile/clang
>>   - fix some memory leaks in plugins
>>
>> ----------------------------------------------------------------
>
> This fails the 'build-user-hexagon' job in gitlab:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1276171518
>
> "ERROR: Cannot find Ninja" seems likely to be the main issue...

Hmm that's weird:

+RUN apt update && \
+    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy git ninja-b=
uild && \
+    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \

so ninja should have been installed. I thought I had pushed to both the
qemu-project and my personal registries as well.

>
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

