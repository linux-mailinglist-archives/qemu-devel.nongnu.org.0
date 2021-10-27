Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EE43CD9A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:32:34 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkuk-0002d3-3g
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfkEh-0007UB-CF
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:49:03 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfkEf-0002Sy-QX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:49:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id m42so2884435wms.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=j5TqA7f5qV+85+7dblkPWMD0OThufQFGlQcRPWN6Sgs=;
 b=hsrjeLZGBtOEUmZpRV+eiHVz9q3v4MzRIwgNl466s4VuBm+my/XJMjbrj4umOVMrrw
 rj2JrXLRu01MYCs+LnaPJ1Sjb6IpNBYEpYE6QjuSDGtR3j/mMxq7bX5uXDq8fD5Walis
 z/nuU6NLSMUfT8jcwf4D7f8RsSGc4tFk+qa53bN0wtICk72lhnaEO8p0bod9sbpHhxNa
 et09J5ouVTHaIp0Sx2FfhD5yhs9e6Hl4C4hpUb3HFXBGwvBrHAyXvu6ydUIz6+CRkA9g
 0vXXfX/MHhsJncRunOSPRJ+y8mTWtn8i/w2vNHhNFO+IAWX+HpHiDRF7Qepittii5Cvu
 XBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=j5TqA7f5qV+85+7dblkPWMD0OThufQFGlQcRPWN6Sgs=;
 b=hM1axlD9oS8MP2WEtRX/3U2yv+qG6Y0Q6Wy0BkVhL7TCNjB4C1r6UE88msXcAxbHPl
 qyRB41L2O3xcCdmrgPQumCEuRV8/OvJpMKFgpdFwE+xw3oJ+b2NYzRWji0XkEBJmIqUQ
 Df9PEDorJr9VqatiCSCA1+qKqor0PQpOM4jWgO6ygJb39MQBb6cyc1waTAgxZBIeFf9q
 dyx5zDLMYH7jKKMfQ77swAFlSJk5tL6fffmwYA3a1HY/oWWx6qylJT4qYDdFRovv8YZo
 VbcNflYGNwkg5QoBHxHAI/cB60PI4R/+8sKD1Jxipv2n2x20IHfCHV5mgV5+Jw4XJ8e7
 lVjQ==
X-Gm-Message-State: AOAM530lCwlVdRgA4RGgLfb8jJYhG4bVUYzmpfQomYovZ5F2dPQa05rQ
 bg0z3O55sJeyW1ah6O4HRgY1cA==
X-Google-Smtp-Source: ABdhPJy5Q8CeO0hlfuDb2IoJjTB9LPIETU5/em+BVcIIb4yRytD+XuldWoigTbXBnwS4c06JwWmdNw==
X-Received: by 2002:a05:600c:4c09:: with SMTP id
 d9mr6214098wmp.129.1635346139568; 
 Wed, 27 Oct 2021 07:48:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm63254wro.93.2021.10.27.07.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:48:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D57401FF96;
 Wed, 27 Oct 2021 15:48:57 +0100 (BST)
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-28-alex.bennee@linaro.org>
 <f647640c-b3db-de10-13a7-f768f4b618c8@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 27/28] tests/tcg: remove duplicate EXTRA_RUNS
Date: Wed, 27 Oct 2021 15:48:28 +0100
In-reply-to: <f647640c-b3db-de10-13a7-f768f4b618c8@linaro.org>
Message-ID: <87r1c6wmjq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, qemu-devel@nongnu.org, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/26/21 3:22 AM, Alex Benn=C3=A9e wrote:
>> We set it bellow outside the #if leg.
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/tcg/multiarch/Makefile.target | 2 --
>>   1 file changed, 2 deletions(-)
>
> Surely it's better to have them inside the IF?
> Why add tests that we're definitely going to SKIP?

At least this way you get a visual indication of tests that are skipped
(and you might be able to do something about that).


--=20
Alex Benn=C3=A9e

