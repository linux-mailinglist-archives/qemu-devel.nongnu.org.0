Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA5721E130
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 22:10:47 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv4mk-0002Eu-V8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 16:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4hf-0001gs-5y
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:05:31 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4hd-0006Sq-Je
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:05:30 -0400
Received: by mail-wr1-x444.google.com with SMTP id z15so18135788wrl.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=F6O/qDB2YKUKeaqUq+W1TVXBVvQHoSsWswdAp4si93g=;
 b=lpY2G187+22djnLBlhOcdBN+6pNh2hOFwCd+jBue6wKdel7YPR4QeGn4ZTn11o4hiA
 s2iceQa8pMG/rSrPdPUP7MV5kNa/jVMbK2fcWiuKCHdeLfUbmKgI81/uXDNCDE8VGbdO
 su5lsU2V+zwVvLECUmYlukR1Jja6EuFye9cA8+DHd7rd+PUoJ3ZZhMk9baWaVxQY870k
 hMsSX8SHgL4va9GRgyih/7UGsg99WJmSIXahkzNx0MdZLfVaw/badI2MUhc3XcnO6MgK
 kVfzXeNRHeS1xbG0cZn7hBl/EqXs5oSbawZKaBYuA3/S7BeUpdoyxXdG4MhTpobUJMhl
 Ikyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=F6O/qDB2YKUKeaqUq+W1TVXBVvQHoSsWswdAp4si93g=;
 b=UHVMXuzXwrnlz4NprKW1xHVXmX/4lGhEb6Z/N7VDP/ql8uJO0hN5QEkKtsuH3iIekA
 5GotJn7S4mnCRGw8bVQUNs1JACOOO6e1KXUaObsrzHqr1qrNMNulddIhBke5AcbrYx0f
 Z1rpwQaFpu+/6L1FOTrep1LWMdbyMcuDQw1f7iTY+dwxuCYpqFWaigUT/jBwNXJmgZ+e
 Cx5o3N7UmegEFr2Kn7W0DzNDXDucvqtxSPa2ucoZcgpXFX1rRfh8c2sLcbTvMvlbPF8s
 7Uuea3Z0mA/Lvz9KbR5Y+cqSb3mFrpzTUfApM73nhdiBeeP40sjw2Vks4ZSOf9fujm93
 5upg==
X-Gm-Message-State: AOAM531JQh/t4KdbVi9yRuifmMnXdu0VCMT4LnBjmuUQr7mDB8DUJdW6
 5riJyQJ9nfY9lbJsfgmXhl/gqTCBoLg=
X-Google-Smtp-Source: ABdhPJxVRF2lX+HHdBbxD7PWg8APJqG4vyO2sLN9w8njpfP2El7p60gUbBQpa7lL6ACDna8eaNg+hg==
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr1220934wrw.386.1594670727593; 
 Mon, 13 Jul 2020 13:05:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o9sm24747616wrs.1.2020.07.13.13.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 13:05:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E5771FF7E;
 Mon, 13 Jul 2020 21:05:25 +0100 (BST)
References: <20200713182235.30379-1-thuth@redhat.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci/containers: Add missing wildcard where we
 should look for changes
In-reply-to: <20200713182235.30379-1-thuth@redhat.com>
Date: Mon, 13 Jul 2020 21:05:25 +0100
Message-ID: <87imeryyd6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The tests/docker/* wildcard seems to only match the files that are direct=
ly
> in the tests/docker folder - but changes to the files in the directory
> tests/docker/dockerfiles are currently ignored. Seems like we need a
> separate entry to match the files in that folder. With this wildcard adde=
d,
> the stages now get re-run successfully when something in the dockerfiles
> has been changed.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to misc/for-5.1-rc0, thanks.

--=20
Alex Benn=C3=A9e

