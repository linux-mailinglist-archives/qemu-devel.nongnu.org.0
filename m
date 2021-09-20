Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DE411B9B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:00:07 +0200 (CEST)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMeE-00013k-VB
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSMMB-0003ZI-9f
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:41:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSMM9-0001rH-Df
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:41:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id g16so31510298wrb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5Zk3JviNQxrieMkt3e6a0KVkQ3QBIa5dw7ibCByL6YQ=;
 b=Yweav/10wme1lGOlPcfwXI4Zw7BFIsa5611EeAlgM6KtZE3tb78J4dzXNBvndlohX1
 KHPm1ibPnkmpsdNYQYVaqfGxlxURrOYSpDz4T+OO28s6lqmDZA9AnJ9Zpsia4evXSt6g
 UDLUJCqiYfJ02qmoYg/E9XkZ2TiC6q9vSM2b/9dizHBtEpW7KbCEZynQuFt/IBI++wG0
 NmyEzZvNWjeeF27e/wDZ31yHkFIcRoqHuoB3+xQTzMvzdZGN1pb7kOpGNgIbsNY0YgA2
 tgrQhGje5ZZrRCOqhc4IGb23a+BWjQpYc6GOQYo3Zw+WtGaO9m7MQpSeR6hceWl8dwEc
 g2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5Zk3JviNQxrieMkt3e6a0KVkQ3QBIa5dw7ibCByL6YQ=;
 b=A7FXtlCCuAXo6ba83ietFQ/vWdsAVfumjESdbAsUFA5d/vIRq9SBWCbrxfcSbam16P
 33FjO56CkEiy+uUDVWM9HiH8f3tkXgRmByn6pLY6y4q4ffVcuKPtberX7jeYXkxheC8Z
 JWgmc3GzNKDJ4dc8zgFCXULAwxFYg2npL0iILwmSGtDyv6LSmd/nYoKRsa7s8N5o57WK
 0bYxJqGLDvWPFkmm/csI05M7xbkI+uPLpG8myS6aPsDny8Q7GHvuxlWxwuMJstS314pR
 H2LU+SDji4xIcAR4dzB4ua4BBWF7QSSktVdnd44laOopz+PyyG+RDlpz1LC6MWqa9+EQ
 sKjA==
X-Gm-Message-State: AOAM530CKH4Pn9Yh2SF3OTsbDgl2JQBZSXbFcRzxRo9qlODpV3L3w2yD
 G2n5jLTVqSF6pYnceLVUAbYByX4uI/f2GQ==
X-Google-Smtp-Source: ABdhPJx1OrzBKUi4vFrV0WLl3YVkqlPAKKnvGze0qqLw/JwiUKNBbSRKvq6xM+CuvJca9oPLwTPPZQ==
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr19781733wrz.369.1632156083647; 
 Mon, 20 Sep 2021 09:41:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o1sm16329293wru.91.2021.09.20.09.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 09:41:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B371E1FF96;
 Mon, 20 Sep 2021 17:41:21 +0100 (BST)
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-2-alex.bennee@linaro.org>
 <CAPyFy2CzPyMRX-__35qiAcjR_SyXe_mDXsQFH2BCJo+3nr+yjg@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v1 01/11] configure: don't override the selected host
 test compiler if defined
Date: Mon, 20 Sep 2021 17:37:19 +0100
In-reply-to: <CAPyFy2CzPyMRX-__35qiAcjR_SyXe_mDXsQFH2BCJo+3nr+yjg@mail.gmail.com>
Message-ID: <8735pzp5ce.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ed Maste <emaste@freebsd.org> writes:

> On Fri, 17 Sept 2021 at 12:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> There are not many cases you would want to do this but one is if you
>> want to use a test friendly compiler like gcc instead of a system
>> compiler like clang. Either way we should honour the users choice if
>> they have made it.
>
> A little bit of a tangent, but I'm curious about this comment - what
> aspects of GCC make it more test friendly? (I help maintain LLVM tools
> on FreeBSD, and would like to make sure they provide as good an
> experience as possible.)

Some of the inline assembler in the old tests trips up LLVM. There is a
chance the inline assembly is a bit bogus with it's constraints and GCC
is just a bit more lax and accepting.

I'm totally fine with merging something that restores support for clang
for building tests it just needs the appropriate fixups to the tests. We
already use clang for the hexagon builds after all. Once that is done we
can drop the stuff in cf22f936f2 (tests/tcg: don't allow clang as a
cross compiler).

--=20
Alex Benn=C3=A9e

