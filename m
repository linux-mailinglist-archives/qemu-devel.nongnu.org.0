Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3139F96F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:43:45 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcxD-0007Wa-Qa
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcw8-0005oh-Os
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:42:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcw6-0002NF-7c
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:42:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id f17so2010873wmf.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3eNQm4a6GikdaydWBLx5RnhvNxQZI3zoWI4FlSqs2Fo=;
 b=ox6xsSO6QUZqVKFLOmpWavyLCqBovjrFAif7EZr8qJAEVrWF07jHTXv4HoXPCfGBMl
 9g6ugmlmZMD2ryVBXZn+688O5+Gr7NBeUdUnm9jzhUjmMRz3Ckc3K4cWLGmwY/KrJ67o
 U6mti/Oi9IP7kahXMBBw1ayTqJ5yzWJWgn/+2wgwh7cW22UZNBMwMjE17gIyUNHf3+Qo
 I8rBXM4ZEgZxMwSOn4hSKol7C2MJVCQzuBEsW7ZNmkqof+JlaE7qy/HOSz5lHVjV8PKd
 Q8WF+UBsFk3DkxLHQvFh1sHYrB4UI4ONL3wFhkG+AE9mipcyeIr2sQ/5kUj39OnF+lSB
 +opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3eNQm4a6GikdaydWBLx5RnhvNxQZI3zoWI4FlSqs2Fo=;
 b=U2nz4j2ht6BCs0VlBe7HtgA8k5Ve7Vi0xgQf5OgXbVA+XmEPBwe1L/8Kg24EocXlzM
 50JEb0WaZLtj4mAFvjiKIE5wkFAVLlG9972oqy1KRyohIfBYUa42k77Lkmq6WCDm1iWU
 zzz/fsdzAGzGxLJC23SEsqiEvRuEzKdKHgWPx94EnQXUIhhqgRcT64XKLnf8MVZMiSqY
 CGETGMi9t4T/3YCxF2tSeJKkYLqV+FfE/ryeig2EyZm+GkkLvyGiI3EQLQtlDS1rC8pd
 FPRxqDD3+FWEm67LM+bRadsHXOhJQjm2k7DUgEdhfizqFitsEiG96jfTrMLkBk+M7tXx
 q+1Q==
X-Gm-Message-State: AOAM532n7ZFCWwTKfk10YPZCqPCf5ipTrsBV/iP+v02+vsRyzyiczj7g
 pmUIcfoJe2WhF30iPQBk35fyfw==
X-Google-Smtp-Source: ABdhPJwGyV3JBzeEdmw4C9NzTPtc50AfIS/U/2nODBzXRIhE561iTWMMg6625W7cjhpKo0S6rC7N6Q==
X-Received: by 2002:a05:600c:21d1:: with SMTP id
 x17mr21965802wmj.167.1623163352619; 
 Tue, 08 Jun 2021 07:42:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w23sm3530006wmi.0.2021.06.08.07.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 07:42:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64CEF1FF7E;
 Tue,  8 Jun 2021 15:42:31 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
 <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Date: Tue, 08 Jun 2021 15:41:23 +0100
In-reply-to: <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com>
Message-ID: <87fsxsl8o8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 08/06/2021 15.42, John Snow wrote:
>> On 6/4/21 11:53 AM, Alex Benn=C3=A9e wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken and besides it's not likely this is
>> What's changing? I'm not deeply familiar with aarch64. Why is this
>> assumption about to be broken?
>
> That's also quite a surprise to me. Do you have any pointers?

It's at the top of the series. If you build qemu-system-aarch64 with a
custom config you won't be able to instantiate those machines. Ideally
it would probe and maybe fail safe if the binary doesn't support the
model. Is that possible in qtest?

>
>>> improving out coverage by much. Test the "virt" machine for both arm
>>> and aarch64 as it can be used by either architecture.
>>>
>> Sounds fine to me, but I didn't write this part of the test. Thomas,
>> you wrote this section IIRC -- does this reduce coverage in any
>> meaningful way?
>
> I think we built only aarch64 in a couple of our CI pipelines,
> assuming that it covers all normal arm machines, too ... so we might
> want to revisit our CI pipelines to check whether we then need more
> test coverage for qemu-system-arm instead. But apart from that, the
> patch looks ok to me.
>
>  Thomas


--=20
Alex Benn=C3=A9e

