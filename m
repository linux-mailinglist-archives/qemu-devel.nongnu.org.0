Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DA3394A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 18:26:19 +0100 (CET)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKlYI-00084B-0K
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 12:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlUr-00060D-9w
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:22:45 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlUp-0008Ki-OU
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:22:45 -0500
Received: by mail-ej1-x62d.google.com with SMTP id bm21so54780444ejb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RQ/291xOM+8rM6daFe7mPMvAOZGchW8bqKsT600dpxA=;
 b=NslULSNHgwgEAj7HeXYSn43x2ueNA8MJQrmo+UBBKqnHXIp0+IN2TcAp25oxgGSgbT
 2f5NQdB3UW2LuTTK3rNLUsjySAlDiC+N3+70FAXQUnivsgNG7ILX+wKmhosCn403+vhg
 bfEsv8lHXbJPg0TUnHbH60ZHTkIm0mQJuuQMKUWovJ6nXyvyb3wYmkThVXpqYs6PCR43
 marykCLatusKjEnX0aqzo/jB3Sskd8OYwBDEgv05LuvJ89O60wXet8QrLzTWGkThWQYz
 ZBkcIgQ+O181W03AUgCYWa3UCnQCqDI4d2y2GyVC6OaKf+C+/s9+Nqgq8P9BByGdM5Wn
 6hRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RQ/291xOM+8rM6daFe7mPMvAOZGchW8bqKsT600dpxA=;
 b=ZOZVSOcLfhZKc54hQZme5kY7mogw6Lc2iykGU3m/xyTf4FGwczuTIQHtwVygy1vlip
 wTzg/ztMcX4MUoU4f0CdkbSnKKhiWM+qpev1WFLxovvPkqXmi+ascZSxzgtFTtpXm8VI
 ojCqDOlwkghWhYvhKsAPkoVp3sQtBsMrAQ0vZ/TWY8ixrdc5O8HWmiImTeI8VNctq+Gy
 PmWxWAmWS+qN/HUpKA9cYBJyHz7Cn5pivKyXj52EPHHAfGwZfCCoYQvkYAJYn7M7S8NN
 w1kCVAJuOvJeMrhspamjgctnTgZaZwMishnccRljKro1KWCNtVOXniTueKS/7JgwJR23
 H9wQ==
X-Gm-Message-State: AOAM531yiD8WkhGnGRhpGJWHGtMRbEWu1SN/XcJCGHAoVSpbaiNwVuQg
 j4ri0CYeIDgGEd5GbvRyqHXQ3PA7Gy8+iQ==
X-Google-Smtp-Source: ABdhPJxGn9B07lhLQ9i6uO8+3nCW31DV6+Tc1klAbtL6mnCi8FgrsIe56KLtvvZ0IK01IWnOHbvbcA==
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr9397250ejr.525.1615569761069; 
 Fri, 12 Mar 2021 09:22:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b19sm3254380edu.51.2021.03.12.09.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:22:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 52D7D1FF7E;
 Fri, 12 Mar 2021 17:22:39 +0000 (GMT)
References: <fc3e172a-01b9-c989-35c9-f4fb8c842cfb@suse.de>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: just a thank you for the TCG tests in tests/tcg
Date: Fri, 12 Mar 2021 17:21:01 +0000
In-reply-to: <fc3e172a-01b9-c989-35c9-f4fb8c842cfb@suse.de>
Message-ID: <871rcke17k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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


Claudio Fontana <cfontana@suse.de> writes:

> Hi Alex,
>
> just wanted to say thanks for the TCG tests in tests/tcg.
>
> They caught things during my work that nothing else was catching.
>
> In particular, the test-armv6m-undef test:
>
> qemu/tests/tcg/arm/test-armv6m-undef.S
>
> caught a nasty bug that I risked introducing.
>
> So, thanks!

I'm glad they are helpful. It's nice seeing new architectures coming
with a series of smoke tests these days. It will probably never fully
replace the exhaustive testing of something like LTP or RISU but it's
good to know they are useful ;-)

--=20
Alex Benn=C3=A9e

