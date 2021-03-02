Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1203297B5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:19:59 +0100 (CET)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1CA-0008Hb-7A
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lH1BF-0007qI-8e
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:19:01 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lH1BD-0008OS-BH
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:19:00 -0500
Received: by mail-wr1-x430.google.com with SMTP id u16so1043181wrt.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fHQ6H9YiDadnO8c3kLr1KWN7BLqgV4fqLTqBWP1xhLY=;
 b=ycfSGQS77MG1peqirFzGfTeGFCUNaxgOYLke0KigGvVg7CKwdVSxWH3mJZAreZKOJy
 8S0gqK9M/d2K1F9paOcYwx+4D8oK+NhMlQ/3xZDAg1UFfYI57LVvInx7EU8DBGWNa8uG
 T10s0f1ljUylii43MeVwrzrmo8NHP0NVbg/BznqGKH0xaNz05oAWFdUg/FdhxYHnvQss
 OZ0PRTOdw2YkIF4Jh+xpMIuo4TB3T+yhDbHXQj9SGQaO51XasaOs4/Y9uyyYyKVIwWwp
 huUEjS84lDp9ntYRHt7dWTZ2V0ZXpxwC+R2SjPcGu/PLj4y1xwmBdMbpNlDQbLkiH/Fe
 bPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fHQ6H9YiDadnO8c3kLr1KWN7BLqgV4fqLTqBWP1xhLY=;
 b=h6aVjzFlqFMOWBnjvMYUbDweskRyNTzs1TTcQU7u/F3bdyDkhDL+I2/0t/jbCVtmho
 TX2tSRx5fH+NLRMwR1Mrs4UKeqkkXUPqGh8NepJYjanh1lHLmz5ne9OJvt4D/L9eToo/
 9dvL9zL+rBoqys9VZdND2g+W8+h5qqmC/KH56iPan46KqJp40FIsg1aDOI/GbVXeFfJ5
 WAYx7eyX0Pi9cssF/kuabXtt/mCiDQbBa0Qv9BXIo4+gJwOw9Tkn0gM/vRkutE08BbqA
 HmT6kWaW2PsOQxKIGzyd1b1OARinqgpflvaGgHuicxrt/piiQ6aRVb2C/rG3a3IXzHG9
 U2dA==
X-Gm-Message-State: AOAM5304TpNNhlfnhFerV6Br4D50h5/R2JtuKnKFKkRlvw62Q5y5xFu0
 vw+U+VvJCsfgm7BypjrtLjOVoBNZZNTfiw==
X-Google-Smtp-Source: ABdhPJyWN9KMj1/AE4M4yE+BjY1clQCNDEkRIxU3Fj2IA88MSlysrXrj9E+bLx7o6YZHJ97gMgucIg==
X-Received: by 2002:a05:6000:114b:: with SMTP id
 d11mr20526992wrx.318.1614676737149; 
 Tue, 02 Mar 2021 01:18:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm13078519wrx.83.2021.03.02.01.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 01:18:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67F641FF7E;
 Tue,  2 Mar 2021 09:18:55 +0000 (GMT)
References: <877dmrge9c.fsf@dusky.pond.sub.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: CI with --enable-debug?
Date: Tue, 02 Mar 2021 09:17:16 +0000
In-reply-to: <877dmrge9c.fsf@dusky.pond.sub.org>
Message-ID: <877dmpkj5s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> Today I debugged why Paolo couldn't reproduce an assertion failure I
> found in review.  Turns out compiling with optimization masks it for
> both of us.
>
> This made me wonder whether our CI tests with and without optimization.
> I quick grep finds --enable-debug in .travis.yml, but not in .gitlab*.
> Is this a gap?

Yes - certainly for check-tcg tests it's worth having --enable-debug
because it also enables --enable-tcg-debug which turns on a bunch of
additional sanity checking in the TCG code.

--=20
Alex Benn=C3=A9e

