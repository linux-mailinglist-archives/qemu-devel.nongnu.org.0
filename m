Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2839FAFD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:39:06 +0200 (CEST)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdon-0006P3-2f
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqdm3-0002Pf-C8
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:36:16 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqdlw-0000ld-0p
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:36:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id f17so2131151wmf.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4zfC/r9+8hcd+5gAbMEClUlCPfB9UliAzSPw4Azt5f8=;
 b=Tb7n17xJpntCJThNEE0H5rYag1FUAhP68NQtxxtxTD+7C+L0QNLGoHrzuyp1DZEWYI
 CU1BWOAxfqI0S52453VbWS+dsBLSeUzNT3qY50KuKgex6jxncq7Q6MisN25XhJkXAZiY
 CXV3NJ85tKdSqbwzog1anO0SSY7fFyxvSHMWXR6UXllBXCqLks8Z0wFkukwtw8SzDTtr
 BPJ/5kP5bTg7eoegV16KiUOrUAUp3gz5S7lgKF8U7vYZEzhB7mxq1oqgtS+61GPf6Q1h
 V6bf/GcTT6cH4WKG3YIYlisP6bQPHVUpl7915Gj68Foq227u/oiNZRb/jJQYZYD/Pd89
 61rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4zfC/r9+8hcd+5gAbMEClUlCPfB9UliAzSPw4Azt5f8=;
 b=rHnVA4c2VdBlTRs80qDrW5vj25R7wyqO7ewNn8ftZpqfGLB7pRf6m5HGQAFTVqF4SQ
 WQfHtOb9FshjrI12HLe0SchO/Epj2TLRxB/jSTyybJE+Y0juNgqZK0Rib4MsGApsb1e7
 UhEsvzpgdE7YyxXYzoxhg4X7vFW9X2AY0WhmZIh5ZU+aMgUndR2P7aK4Ixw5P+oBpf0r
 QhaDfpgB8vKK15XdtTx5UzYOgsQijLU9fcjDsGgJc8465pM4s7dtf6Qi6uVNLwr99vpL
 YhOI7E104jgbDyKgek3lzbZ5P6cf4fWLIhIH28TgOtSUM4RS1mgOmqXX6TxfZmK7FNCF
 ny8w==
X-Gm-Message-State: AOAM531e3EWrip4FULWKsqNSMOjCnSGtk4ZkVhK5RwBZ3E099i4+b7p9
 AvxoNEC7zMPE8h8LYbWQh8YuIA==
X-Google-Smtp-Source: ABdhPJxgRDGK00HAJ9yXmLMsyxHH/scbxpfcDzoNCJz7WhUQQD+4AVj27dFoPJ544ZrjEPE5L/SKnw==
X-Received: by 2002:a05:600c:ada:: with SMTP id
 c26mr4034652wmr.189.1623166563535; 
 Tue, 08 Jun 2021 08:36:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm22231206wra.4.2021.06.08.08.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:36:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE3C81FF7E;
 Tue,  8 Jun 2021 16:36:01 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
 <87im2ol8xu.fsf@linaro.org>
 <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Date: Tue, 08 Jun 2021 16:35:24 +0100
In-reply-to: <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
Message-ID: <87czswl672.fsf@linaro.org>
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
 "open list:IDE" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 08/06/2021 16.27, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 6/4/21 8:53 AM, Alex Benn=C3=A9e wrote:
>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>> machines is about to be broken...
>>>
>>> Um, what?
>> Really what we want is to probe the -M (machines) that a binary
>> supports rather than just barfing the test because we've built a QEMU
>> that doesn't support all the random 32 bit machines.
>>=20
>>> r~
>>>
>>>
>>>
>>>   and besides it's not likely this is
>>>> improving out coverage by much. Test the "virt" machine for both arm
>>>> and aarch64 as it can be used by either architecture.
>> I think this point still stands though, I don't think we get much
>> from
>> running the cdrom test with realview et all on qemu-system-aarch64.
>
> In a lot of CI pipelines, we are either building aarch64 or arm, but
> not both, so I think it might be good to keep the tests in here.

We do test instantiating the cdrom with -M virt, exactly how many extra
lines of coverage do we get for the rest?

>
>  Thomas


--=20
Alex Benn=C3=A9e

