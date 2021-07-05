Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED13BBD90
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:38:30 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ont-00069z-IS
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ols-00037A-JM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:36:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Olq-00074h-Rd
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:36:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id i8so9251575wrp.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BvoV42pX9R6pos3EF6SxTarW2ke76v+6dEVUmc80s7g=;
 b=k3YIm3rjeaPuTQyFkSqTEHBrChKBFXUNaj8tmcqnjbIqof4XYfisBkdn3pfIokCa9P
 IM+GciuvXaq+ivBecw3nzFbqAeXQ8RzmhK3YHyZGCasxejMw34AoKCCASxQXkWwV4mjJ
 YqpxG7UL3df0Q35Ucx/aF0BXzwUoOnZOVrtLFHhM4g8MTJgOLud8DyfX7HolbBK0fbrE
 F+EVtlzJaNzUYZUgJcjnR11kp3uVb00vFTPQ0p1QZTn2JAxwLucGPDFJ1Pboy0e5rB1K
 S/AD2L5/P4G4Yk0cfYXlSUkFgw2PvQ6xd4hE9QW6mJilQ5iqh+p3WUhrwikFhifMcrtq
 6H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BvoV42pX9R6pos3EF6SxTarW2ke76v+6dEVUmc80s7g=;
 b=UYwjuI29KkX1ykAdspLPXrZfVhjjmlKZk+gSoEyR87jtYplRCPfmxwbxNlh9w8H/Aj
 xP4w4KdveAo1aHJl7gsxTDFEHAGDEmZ2ZToY6dV4khjn0kP0Nlhe9NEkAVHAcPQ/VBTg
 YOON7/jUbdBg3iQ97RrUzOa+jCq9ESKexoxoxSbuVWNNrpBOY4olw5puCWFVQg+wYxtx
 j2TgfFpSUdKRtza2CE1h6nlkOmJn6krEfi5r2waibgKjejyZsxSaytEzWk/ZMEw7mqKv
 osygF4As0lj7bK2N+3bF8UWF05Q6E9uheVZEW8X2t/22KMcF0XRNLaIvVfMf0ylJxzI9
 rRSw==
X-Gm-Message-State: AOAM532cK+rdhXQs9j98XfGoaJLnbb9372HKakDAeINtHnpijqZKblVm
 6A7mEHegXZxA0FcabFHPX5bpBg==
X-Google-Smtp-Source: ABdhPJyCIq34fLpEvNAVzpIp8YEOWqu0WF0gAy4FRtarrKjHjpbQlrONbGjdBM55MrJEqKNZv+KDQg==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr15708324wrn.163.1625492180755; 
 Mon, 05 Jul 2021 06:36:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j4sm13316037wra.1.2021.07.05.06.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:36:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E9FA1FF7E;
 Mon,  5 Jul 2021 14:36:19 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-9-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 08/22] tests/docker: fix mistakes in fedora package list
Date: Mon, 05 Jul 2021 14:36:14 +0100
In-reply-to: <20210623142245.307776-9-berrange@redhat.com>
Message-ID: <87k0m451d8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

> libblockdev-mpath-devel is not used by QEMU, rather it wants
> device-mapper-multipath-devel.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

