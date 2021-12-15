Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C6475B77
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:12:03 +0100 (CET)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVwo-0006H2-K3
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVKK-000578-Sf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:32:16 -0500
Received: from [2a00:1450:4864:20::32f] (port=43814
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVKE-0003Gh-Nh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:32:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so16075055wmc.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=AHfDgGaDL1vi2Ufh7ov82vKYWyypFdFf4+AlWJCZHHBEGAT5JtRlZPGdc8ak3jaeaL
 uo7cUj10vWkEL+Biz+xxaQsK0lk75iezeCGhOikit3j/IIWxP7J6q+9LK6Lt+flRnC1C
 0S+4WoSi2IYBgQdXF1S6RlqFgHxYF/uryFEk413sIzDzTIP+b2Yg92WEIbWLUJjS3wIJ
 x0QivsYPxxpkPSQBeISO/5B6ZDsoiCznjFVQjTtuG7+HIWg37SStouWEDjVM7MVSxoq1
 462yamMbbJenwHA9HjO5p6R4qW5K1YtiJqGLZ7nf2B+ZhTTZhTY6mXBvXFeW1ImRsjYc
 3Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=AuHnQBWhCAVXTuC2enWOtZwT24tEtXL9M4wU59uP2mgXa3V/J5pwNRDE9H35zuDt4F
 6/pZd7izt6wI3jdxnV/JUjUOhLxRbTYYqmalj9rafbYBsHm/f/tdSXiJvSlg6BNT4//j
 HO+cc5tyVdqCPq4vpVcyPg7SlofBoQbRIq+CFsFhomY5AqaTXfPJZi7IF6S+s84CtAhn
 +3/5lI/81TXEI+bXteJplRJVuR3t6TOSq4o9+WsEAJz5Fei2gjVLU2qCryYyGDVXq0mU
 HFTJACQKuiKu1LzfYE7wiB95bh+L0Fw1E5S5yniMjsdRbLNu4n0/8NZ13tWYlhGhaSvF
 3hyw==
X-Gm-Message-State: AOAM533i9pWThR33QTYynUZz0Kd3ueH3pydA4WYB+WLS6WtdduHyxubD
 0f8VTPKjgaZ43p67d8z25IpsiA==
X-Google-Smtp-Source: ABdhPJw/hWUJKyV9xZoTtvqx00e7EHowEvtLOMEB18FFtnkyi0A5W6HbKE+ORCKL/6VgriCTgca8Vg==
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr19491wmq.147.1639578726464; 
 Wed, 15 Dec 2021 06:32:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p19sm2349222wmq.4.2021.12.15.06.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:32:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63CF91FF96;
 Wed, 15 Dec 2021 14:32:02 +0000 (GMT)
References: <20211118145716.4116731-1-philmd@redhat.com>
 <20211118145716.4116731-4-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? v2 3/5] docs/devel/style: Improve string format
 rST rendering
Date: Wed, 15 Dec 2021 14:31:57 +0000
In-reply-to: <20211118145716.4116731-4-philmd@redhat.com>
Message-ID: <87v8zqey71.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

