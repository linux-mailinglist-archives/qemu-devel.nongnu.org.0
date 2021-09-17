Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E098E40F6AA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:23:23 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBxi-0000yE-VQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRBu6-0005I6-SF
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:19:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRBu3-0006DW-DH
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:19:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t18so14650808wrb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Gi5JOniMY7KM69HpS/1C4OaxdbKj0NfXn409YZmTpJU=;
 b=cs3Y6C8tl7unGiCEuIBxzp3AzxrUBJHWddkGVBBLNFA85tCHuNqKZGfsWzNYecaCFl
 Gabiwktkpf4LcIjMzME8ZZfX111Dr1jlJkfQ5EcDsoybVjUCo8WzV4MKNl/L5LmjrCS+
 gYx+FShhvH2DYP2ZUXV7eMicuRS/saQcrSgxGZX0qJmcive8WFw9f8iVKjZp+GEddD2A
 Uei7SCsneIDKiWcJRk2kcdd/U2U7i6iBllYHc3pud9LpnLFU4E5pAK8m9AeoKwMJ0hhL
 GXZDBq17g14Cs1aPA8BB9nErBXVzwK/XXvuPqBaaem//b42gmY0Nu2OPqD9pG6mRi66z
 LFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Gi5JOniMY7KM69HpS/1C4OaxdbKj0NfXn409YZmTpJU=;
 b=oFjLj1qLwmYaQ/sRcYOFYTKifmCb6d41bEml8sDiu7B6BjXL8LXbMDnXuqy2rQ+dgt
 OS/LDIjSuAUaTEF9zvKmiUJY76ZZDTcYJTiOD5m21ok5Vu98kO4Uw4qkdCWbiTKJ1bbs
 fXMp7sj3zbYmJJGz9HytQv4T29n50lRNGyBNjhpl6EJhrwQnuTpl+Azrg1I89ApGJwux
 b63qBFs1Y3Z9AIhzMgb1aACovzTwTyloTztVkas6cugZf5pcaZtynO9Mu+10sKvoTNqU
 T7yx4JCAq8TaPA4ldkBQfzDUKxAIaErkJ2Ts9MJ1GzxdVzEWY4M/JC9zrSxI7x0nuoSb
 2bMA==
X-Gm-Message-State: AOAM531sbNxtNEEE+djm7oStd0PVEj+Sc9kRpV4Kt/cRCricGEm5EGTj
 s4QI4nYRJQgoEfhuoXg8zzzXPw==
X-Google-Smtp-Source: ABdhPJzhc/Fhct8ZtJVdp4/rFlO6Uj1n3Nj1cIBZ3Y/yVCdg71YkOwWIQy84nw8Fsify2Mji2gIsFA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr11434730wro.94.1631877574032; 
 Fri, 17 Sep 2021 04:19:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j19sm6352116wra.92.2021.09.17.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 04:19:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B315E1FF96;
 Fri, 17 Sep 2021 12:19:32 +0100 (BST)
References: <20210917094826.466047-1-thuth@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis.yml: Remove the "Release tarball" job
Date: Fri, 17 Sep 2021 12:19:27 +0100
In-reply-to: <20210917094826.466047-1-thuth@redhat.com>
Message-ID: <87bl4rtpob.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> This is a leftover from the days when we were using Travis excessively,
> but since x86 jobs are not really usable there anymore, this job has
> likely never been used since many months. Let's simply remove it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

