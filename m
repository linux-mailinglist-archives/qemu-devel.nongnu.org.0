Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7630F3CB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:23:06 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ebA-0005g3-SE
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7eaK-0005Cj-47
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:22:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7eaH-0007q3-V8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:22:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a1so3475379wrq.6
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fY2MsHMjO9BDnalU5QeO+1wkCGXNA5f0IWYf5N0jHJs=;
 b=s69DN1EA2zeOjyNT7dZaL544gYIqMvIQ5Pik2eSR8GQLCNSHOYVzdDCP414sAHSk0A
 WIiU71Oy/CPynr6U7kXN9Ab4rGYu/+xFeDJc8QlT2MxqoUGCfecJA51NCAr4mQVBJkWn
 ixYCH9BJKwinY+4vAjCt+Hz/Jry0r0F19Pxb7H1q0glx8KVtcxi/9iVrxWow5oIHU7kS
 EGa073tNHqaYP7XIOHdLqf9M7idKTMuydiC1g1m77cPUo5uoj/z7ZWKN07Tpip6/FDTW
 o3VQjbcj6UneGz3TX/B8eYXUg/D8y7G4P7iJUGh+Syy/OiitUxvhlMGw7vETWq54NNZ5
 PNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fY2MsHMjO9BDnalU5QeO+1wkCGXNA5f0IWYf5N0jHJs=;
 b=PVGs72XuL6Wd1CoT8cgKrreOTY+DpUzyqcEofsTYvLtVaDuwnaRHK5CUZG1LP5hrY9
 cqgaB2KdGJ5mrclxJm5oTlQdxSW53Pb1hl3o4lNx/0kIT5ylKUUc8hq0RBaJrJV0Xyw7
 XViVDrSFpT6d9NY3wXLXbOcVJd2+CQaklDDURUTgd2YIXxJXXmzkWrGrCAw6q/FtqVJS
 cy6Q1pQN+7hYUTm5kMDnjVvuUP4JyHEdqmDs1r5RaQpUH4ayqRSoV/QQIYu94xa0OBPw
 5QXfmqxwnAx67n0cNLiADmRzLFA3MwUImkcGoiby5ZrOtyRZiKUtZgN4jeqtP0z+XApB
 ZG0Q==
X-Gm-Message-State: AOAM530MC6zGp0WeQTRUMgFgtlltO5i8UGhcUu4+WBwlJjJraEmHrQME
 xYuJVmnEVFjj68S7y3LHD/mR4g==
X-Google-Smtp-Source: ABdhPJyL8RQuf5r3NelE0sU+e2aNq/9cMEOmBgaLa1/0BX5YMbG0TU50oRFTubiKCPer3RLP+5by0Q==
X-Received: by 2002:a5d:5708:: with SMTP id a8mr9264270wrv.211.1612444928156; 
 Thu, 04 Feb 2021 05:22:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 9sm8866259wra.80.2021.02.04.05.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:22:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2197C1FF7E;
 Thu,  4 Feb 2021 13:22:06 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-7-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 06/22] tests/acceptance/virtiofs_submounts.py: use a
 virtio-net device instead
Date: Thu, 04 Feb 2021 13:22:01 +0000
In-reply-to: <20210203172357.1422425-7-crosa@redhat.com>
Message-ID: <875z38q875.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> In a virtiofs based tests, it seems safe to assume that the guest will
> be capable of a virtio-net device.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

