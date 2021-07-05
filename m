Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205A3BBDA3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:44:27 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ote-00087b-C2
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OrY-0003eH-HY
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:42:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OrW-0002L5-TX
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:42:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id q17so1762969wrv.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=XV3WP7NfApCLPgAjJWKttDITgxJiPnxGaFFPrGLyY32/sXtRYQqU6QCiZB2aAZA6zk
 1gRJ95Jdju7BJxHYg/fhwSDS0iAdlS3cNg8UEXzBiM7cjsT5K5dkgoAFJWNxdWHCclp3
 Nh2q6rsqHlGzhlQGDBABZmmQ4pk87/uXfjHgy3EzmhcNKzFSw+0rYbfWm+Dwbd3fEAW7
 XoiDyvUcPN3CtpYiqBTkEfbql1cFH9mbFK61sZMPeYRLG8Ieuru09kKLKbYt8i96aJXJ
 7mDvfXvzFJ5F0RnPmu+4yzjir0oSBeoJuiy4QH9fDgeJjp7ZAlk0J9ZVBTDoKlR1FlZU
 SbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=XenuXGtMC08So9Erc9tULIoclQncz+Um7XnAgdoXpTAKNAAzEmyQ5LDCc9Ss/9/Uhm
 Ue9NGtb2UKT5ena1SN51N6GUhs9bFEqA8aJ3W4pcSpq3glqN14ZaCjmRncLfzaGT+dVR
 AfyWgiy6C9c29sMnMwqz71A1dWpFtHk02TZjV/rAODoBw8rpC+Flg4bUngIK3YQho/nH
 iaVsjPc1B1zx43b50oC8WkweUbsUwrx2nbN2cg4slltfawEHembapxt8eDwTi+yxvbSH
 ktxeIn3T7mUYRF91SpYCc60WXzkdRnW2DnNLAq0wdy+L0Di/58ytfmPjefV/mKPrj3ix
 1+ig==
X-Gm-Message-State: AOAM532+dLnnMTtvTwCbR81BhFouVjrRI6KYg5FOo5mVVcoDE1hpV2g6
 yYg9E05eShABGm0igqy3zuLB8A==
X-Google-Smtp-Source: ABdhPJzefctdawBe4SeNHGYX/oDpGJ62UOZ9Oam8IfB+QsFDjjwPXE9mL3Q4M8IwryCKomuDly8NOg==
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr16078436wre.300.1625492533605; 
 Mon, 05 Jul 2021 06:42:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm5207257wms.4.2021.07.05.06.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:42:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50B5F1FF7E;
 Mon,  5 Jul 2021 14:42:12 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-15-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 14/22] tests/docker: expand ubuntu2004 package list
Date: Mon, 05 Jul 2021 14:42:07 +0100
In-reply-to: <20210623142245.307776-15-berrange@redhat.com>
Message-ID: <8735ss513f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

