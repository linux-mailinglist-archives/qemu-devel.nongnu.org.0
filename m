Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B925B065B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:22:34 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvwn-0006nd-DN
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVvuE-0003wQ-9B
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:19:54 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVvuC-0005tV-Ny
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:19:54 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3487d84e477so6823437b3.6
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xzQQge1p9sGh6RMu1G1JOY9ItCc6O0H120k6pKHMmEk=;
 b=Bih6yKcvqhH4zWrwdr6CGGO42qojshsT47RQnhXv7ybu5CD6vL27DQnoZCdIiZcqnD
 0MNFx49OnNcHRuNt0yer8KsEpHqlebpbukHR8/U0Knhm5IkCoZC+cpXtWgtCriZjynid
 t5Bruq5/CLUqLGLQKdHNGqoXOR5/u+8UPkJ82rmSO8YnBjZPRRwCZiKEUE1IWXZHpGhw
 3GuaMXYCxJXztaV0qrqOzBvSR3aM+i2HSRfZe2zbCTl0yZUnpl7Hk5ecvH5V+LsTxI6l
 HjAU7bKenJs8zPJhJgMQUWxJQCh6oc6moTNqrwTOfD2LY0IITD2J+XO/28stoTLZrTY6
 X8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xzQQge1p9sGh6RMu1G1JOY9ItCc6O0H120k6pKHMmEk=;
 b=UF/bL73GgKrFbacSRRePEHzpxSfHOSmr1V6FGrN95Wpt+6Y0GvxMEIl6wem0JqL0c8
 S+mzloXBKGDurvth8CTH/zekLb4bAtg65HrnyRaOBDrDjDrf9J5p6hA/eDkJo6llIHVY
 taHCDIZvUWvoVXyQYGGEsca7BvU0KX8PnSHtz4SRiY8Abbo2YAnpQvdZn8rD+nqTKV0v
 yISqGCJ4XUJAOGoMUPmnPQZAgKNUthjRavhGSA38ANyBzL6c1PKrZxM84s5yGkrMexhH
 k8D2OihGOTcCAwJhtHXc1kN+m0EFp1t+3tru4jHjVleqfkS+ClLvOzu0XSNqiqYZav2w
 48+A==
X-Gm-Message-State: ACgBeo13/MIyJGN2bD4dHCLyZwezdsLXq3l6R0HNPtDxRa2jyfxSnblq
 awutT6EIpvt5b0pSMitX4ENSxl1XPWvV6LgX5JU=
X-Google-Smtp-Source: AA6agR6es1m2QTKoQhG3HmhDk7/mGxawhEgjnpT++W2R7RDp8RxAnyCjkeWxHPwQeUEm0Uw6m26keN7xYXBr3V6AeCc=
X-Received: by 2002:a0d:cc83:0:b0:345:14a5:a2b0 with SMTP id
 o125-20020a0dcc83000000b0034514a5a2b0mr3532402ywd.206.1662560388878; Wed, 07
 Sep 2022 07:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220904072607.44275-1-shorne@gmail.com>
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 7 Sep 2022 10:19:37 -0400
Message-ID: <CAJSP0QVnMFjodM26-ehXi0Yd9eiBHJXJwBudJqyQg8a3j6rJCA@mail.gmail.com>
Subject: Re: [PULL 00/11] OpenRISC updates for 7.2.0
To: Stafford Horne <shorne@gmail.com>
Cc: qemu-devel@nongnu.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Sept 2022 at 03:27, Stafford Horne <shorne@gmail.com> wrote:
>
> The following changes since commit 61fd710b8da8aedcea9b4f197283dc38638e4b60:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-09-02 13:24:28 -0400)
>
> are available in the Git repository at:
>
>   git@github.com:stffrdhrn/qemu.git tags/pull-or1k-20220904

Hi Stafford,
Please update .git/config to separate the push URL from the fetch URL:

[remote "github"]
        url = https://github.com/stffrdhrn/qemu.git
        pushUrl = git@gitlab.com:stffrdhrn/qemu.git

That way future pull requests will include an https URL that allows
fetches without ssh or a GitHub account. Thanks!

Stefan

