Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B8308A09
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:48:01 +0100 (CET)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5W07-0003Rm-SD
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5VyO-0002cq-CN
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:46:15 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5VyI-0002EK-OS
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:46:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id c4so6588309wru.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Kox+ZeaUM1l9iikVXjebZrI+k+/pwvjXFVjpmOKYKNM=;
 b=VBgvsU84+15WBRSE4scSIrF/UBiEesAlICKmm9S+l21ozylVWeSFEDGEweIWSNoGNV
 Ss6PjbfmuNEGyO8oNJHBXTdZLjcWtja3OVlP5vS5DToEwaWy22pYe+lMDufcLGi9CHoT
 YNc/5D5xQTi7v/AaWiSrWqzC9IL4D6wzNqRC8aGpNXfSGwbwi64OhkAAh6f7ldm0VnOO
 CAQIX8ab6/MFzrU54zX6q2fPmEl6NP09ljvYaxMWyg67TCktLTrWpKFdStBGQRyeqUKN
 vUUgzWtBzP2wPWif8Ptu4HWTXddB80e7ScCowVQUGSKjztms4YwbcEQC2xf3L2f3vqSe
 YDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Kox+ZeaUM1l9iikVXjebZrI+k+/pwvjXFVjpmOKYKNM=;
 b=W6G2yJ3x8mvtKHTNSKQZc0FIAWfdiHvPW+/A3F/sHLPQ3rCm9Ej5dNUGGTqnxQ+P19
 4+M3i7Yta6oJ/jsDX4ZE6WDtqs2ONfs66QF4qwtxLEmhh3XVZgsnRJJHmeG9flJJXcKF
 PPOEsGuGAwmgkj2h8Y59e3+BLzH9tv8vqGai4dwMa3HrJb4sfMRDBYo+sbNIUPyc0obk
 6CTOa6dg8Po8D3AnK6YFLQ0G0gekaA7ezCPWMAZ/+ayXNzfD+X3LBALT6x6/ArPU1wbm
 mGYqwLbjZ9dJEIzc3v7hKo+eTSrIFox11CXn8IRfzxdiceGvbvv4WAdD7r+a1Trai7li
 Eqcw==
X-Gm-Message-State: AOAM532QrrG1pcJeXDAAyTdOfGqOqoA4MfHCxr/riQznue9Vvjse9vVI
 dP6dQZb66SAjcv2BsyC5SES8fA==
X-Google-Smtp-Source: ABdhPJyEeYl1u2WXoGj9DML/452wjYDckiTpZHGy+8ulvQeloRSknlfY+nbcXUNf8TnbgnxPA5mMvw==
X-Received: by 2002:a05:6000:8c:: with SMTP id
 m12mr5279280wrx.101.1611935164957; 
 Fri, 29 Jan 2021 07:46:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm12969797wrq.30.2021.01.29.07.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 07:46:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5F991FF7E;
 Fri, 29 Jan 2021 15:46:02 +0000 (GMT)
References: <20210128135627.2067003-1-sw@weilnetz.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] tests/tcg: Replace /bin/true by true (required on macOS)
Date: Fri, 29 Jan 2021 15:45:55 +0000
In-reply-to: <20210128135627.2067003-1-sw@weilnetz.de>
Message-ID: <87sg6jsq4l.fsf@linaro.org>
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> /bin/true is missing on macOS, but simply "true" is available as a shell =
builtin.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

