Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D543D3A8688
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:31:44 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltByZ-0001qD-VT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltBwc-0000dC-1J
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:29:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltBwY-0007dI-Pq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:29:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1851273wmc.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=XyW4Fw5WacZ3P5pGFxWArGVQ1+XG20O8NMCUde+vWJ0=;
 b=rd5q460Bkc0crGb4tbFsHheaRedb1smekriKbWp98zsR28vpTbHRnCWnBytHiRcc6j
 PZadj3PemvmyWJ7eLMxzBtI8FXnBl9427mH2C4mHiUweYZUHTKEGt1CmgX/ZwR4Jbh08
 nKgJrQrjWZRTRu8WrDQJiQy0Tn6CO587juGqrpplKD6RWd4JkxOf03oYwblqGnLdzvst
 iNjgXgjSay2W8Uf8FcTs4UspqkTVbNjMCGDyVSHzH/D+8jfE5JI7QvQ274qaj0eGSM76
 psXAYgitSs9hVA6a4zeyK3VYwWsFDr8X6aCTvTbUrvrsNZfeWq0/y6dIctDxMHiMi96I
 Tssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=XyW4Fw5WacZ3P5pGFxWArGVQ1+XG20O8NMCUde+vWJ0=;
 b=stqs0pgZQjrr4bTvcK8kXf9w98IUXrhXOMUDsOfx2sQ6WyzAHN3VZdc4AcBWwWAIYX
 V6yEQavAd9pDBSlIjWgS/1og6G519AF7U3Pnd9kT/MM/A5LD+bK8ri8pRShOhakZnx1E
 91Nq5kTmMcKFHFn1jag7VGFK+p/ZDtGV8rn6N7b4mmUVi3Lyv3pg1cnolkha6Lm7Az9i
 Ai9v0sMuLn7DcEpHtVybK7uTSa3VQ7tVcwvMtVNlYyh/qjYNP67zabCvIePANgRiBAJz
 yBO4p4aMQ1HX36/YlO95+0PA2rKv+sJFJZFP2lq5Fh09QkmyO9qDgmjp2ITkePG9edcE
 7T0Q==
X-Gm-Message-State: AOAM532m+b15N32cFTc45gTEWjQS6q2JU66jcG5oDQ3MTef+QBUuww2r
 7WM0nRI3pZmltAB8rz6H2T2sYQ==
X-Google-Smtp-Source: ABdhPJzSsxRjgVKmlOqWL9vKZmgE8sii+BRDolGpxf6Qsc1loiUvsp2VteXc5QCtSXWf6XfnEB+dzQ==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr105493wme.135.1623774577030; 
 Tue, 15 Jun 2021 09:29:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i2sm15673696wmo.40.2021.06.15.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:29:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C8601FF7E;
 Tue, 15 Jun 2021 17:29:35 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs/system/arm: Document which architecture extensions
 we emulate
References: <20210615160652.29485-1-peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 17:29:35 +0100
In-Reply-To: <20210615160652.29485-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Tue, 15 Jun 2021 17:06:52 +0100")
Message-ID: <878s3bgkgg.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> These days the Arm architecture has a wide range of fine-grained
> optional extra architectural features. We implement quite a lot
> of these but by no means all of them. Document what we do implement,
> so that users can find out without having to dig through back-issues
> of our Changelog on the wiki.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The FEAT_ lists are in the order the features are listed in
> the Arm ARM; alternatively we could alphabetize them?

Maybe a slight preference for alphabetical order. And crossed fingers
the ARM ARM doesn't change it's names again ;-)

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

