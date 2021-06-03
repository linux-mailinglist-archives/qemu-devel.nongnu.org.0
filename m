Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63DE39A316
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:25:31 +0200 (CEST)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looHq-0001wd-Mw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looGJ-0000SF-R7
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:23:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looGI-0006W2-ET
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:23:55 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n4so6061422wrw.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=CNwf4n0WTY0WomDEcxIZuRqGDIvX7Fv3JecNbELQG8cFrjElN4p0d//8EUs+gvsSG+
 J/khAxHgtYX9d4lGyc+2lE7TH8vTBo9QeFJ484skzn4Smqjq9S5ADNywjUJ1haPiPlYS
 F5PqoJqpt4NUyQN3BAYBTDk7ogIWUJJmv8tVdwuJQumkuYO9QuSsa9dOl6HY8RBjNiNi
 bA+6i8K9b7jQ/7rF7lELrZy6eJc1gdCs16MNxgkgFlFZn428/yFI+8CDOTVwQZY4Aa/5
 5oTggUFHbjORxo6fdW2Pbx5V6oJCQ4ecMfpEQj7xl+AlZQDWSbJH5MHgw17HQclT9NNN
 dmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=J8ov+OLxessXJq/qdNFXKZz+rsSmhgwzL/AbfAeaI4g3hrkSI29+aaQdbKBl2O9yRr
 2DgaZuSrKMXRSoY+atrRiNyjdrvojF1c1hM6mFeSfKnZXD99dWXcwzmpckcpSZW+L3XQ
 uenUm1laameoMGHTSF1tw9pHs/xOVk7Zj7OxJZTPRelETS2VEj/EfW+f/+wES7mDzs88
 B3KSTPaaJQBsPUtjbfMmOdCGCj7fAd2GOIQ3HvqcH/hTI6d5HfSszOQ4UnSa6pfNq+Q+
 X2uhbL7VGXw3FaRbpEb7Zm5kgivzh59PKDzWSWlNRydrc/UOFro9yPTEos9NuAH2TH+u
 jzpw==
X-Gm-Message-State: AOAM533eMOlwnFZkQItSrRgiGruf1jOrwmyAAsaW+SHW2TFwB55Y7LqM
 XapkANgdvjon6E1OM9tS12P5AA==
X-Google-Smtp-Source: ABdhPJx+hzVgYBIZ7U3BKw/zKfgD5OWX9JZQ7IlRmbamqehMZkkr7EOZGWrsTyC05HtnQY84B0BnhQ==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr229469wrn.157.1622730233165;
 Thu, 03 Jun 2021 07:23:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm4648334wrf.0.2021.06.03.07.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:23:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 650621FF7E;
 Thu,  3 Jun 2021 15:23:51 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-16-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 15/28] softfloat: Convert floatx80_div to FloatParts
Date: Thu, 03 Jun 2021 15:23:47 +0100
In-reply-to: <20210525150706.294968-16-richard.henderson@linaro.org>
Message-ID: <871r9j9gco.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

