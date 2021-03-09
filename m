Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B600F3325B1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:48:08 +0100 (CET)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbmR-00075A-QE
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJbkf-0005oA-Gy
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:46:17 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJbkd-00016L-Sm
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:46:17 -0500
Received: by mail-wr1-x431.google.com with SMTP id e10so15211611wro.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7Dpm7ztRbLxe2Dp66gVDEwpJuna1JckwZ8MmSlOHA+Y=;
 b=J3tqKw0s/luQlaoFauQhUznnjLnNJDsrI00YZxe3NwEan/oWj0o+/EvNAVKhKbVUwB
 OWSIn4FeAIpoW/ucyoNll74eXvLsrAZIQaWhZVD3WOyseQHjueO21ZlWjQ9yXVvqvGEg
 yk/HBCqBDhk/GW8xWAIoPuFjl/2tmAHIkZbN12Aaapapci3Tj43EIDMiO0SmBufa9XIL
 PtSIJAD3ltNdptWACp90s/1tUqvHifHh2I7h3hBqd7RbGyhK9PKWyOXhMvwInVK4pUR+
 o2Ef2sDDJ2YPzLytvHcy868DCJ9z5QB+c5s05luspPeFzo33EPMOJ67LqGjILTTLbLPD
 VNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7Dpm7ztRbLxe2Dp66gVDEwpJuna1JckwZ8MmSlOHA+Y=;
 b=RF4hobPoMLwwv1U8Mnt/5yzWdMQghUNzulVmKuGq8ktYgS3DQEQakqZg8olG57C1+y
 yJaV/cJ4RjUrzZbN/UcqjFAM7rba7RcA9PO5wtHNgp1DZH3K+cEMK/JhCSTe3DCsoBBe
 dT7ZC70Gu0QaTwJnaParefWOEY9jQ7ncx2c/ChAeR/ixTVlHvAbI5rLMgS8LIhZ1xoI1
 LQOq57ZLbgtr/1QKuIczlrPdOBrZBEqkJnTUjaEpu5rQce4BLdW3ACdrElaBz4n8xydM
 Ay+6u+TptlcRq1QRtJsbmxflhR36q0F4xeSXjtx/vWykDZIdyFYtqV/+kEUEy/VluEMf
 bvcg==
X-Gm-Message-State: AOAM530DnYgUGuH19qFoFks1nxWXhiL/AE7lTUHFjn2/iFQ3zE0SpTU7
 wg6LFEhtrFVdB2oDL9Y1/FXvdg==
X-Google-Smtp-Source: ABdhPJz2TV08PnV6vJkn4CLRicU2PPq8UF74EiUTBYUubUspUT7pZ6IapyuKTWjlp8eY3EET1eA5qQ==
X-Received: by 2002:a5d:5904:: with SMTP id v4mr27963076wrd.261.1615293974022; 
 Tue, 09 Mar 2021 04:46:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm25160017wrp.14.2021.03.09.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 04:46:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65FA51FF7E;
 Tue,  9 Mar 2021 12:46:12 +0000 (GMT)
References: <20210308154633.158915-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
Date: Tue, 09 Mar 2021 12:45:58 +0000
In-reply-to: <20210308154633.158915-1-thuth@redhat.com>
Message-ID: <87wnug8pgr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 Willian Rampazzo <wrampazz@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section.
>
> While we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again.
>
> Now to avoid that Alex is listed here alone, Philippe and I agreed to
> help as backup maintainers here, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Pending changes requested by the others:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

