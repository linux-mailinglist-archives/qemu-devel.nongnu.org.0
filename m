Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07653A7BA7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:19:40 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6AV-0006Or-MJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt691-0005i5-3Z
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:18:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt68z-0000Qh-EN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:18:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id m3so8573185wms.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=QFJiO4uxzVOrTHFhfJNbbqatVyDDbfviip677XJzc3g=;
 b=UVV60Wrr66Q27NN1fWlU3nJBiMTtQ1A09QvPLGgD7R44Xqh1Vz/iSEHrKfOwnQrALe
 AJbk1gZ26Md+z0jNgRUsFeqPj+bLhCxixlfH870v9iiZeQ/2wmpp8ECZ4T7Aro9xvobE
 eBqATFC21ZqiUeID/Z7dmZcCPx5K9wtiYlYkRzXcDHTQLADtQC0G/ZqC8syRT4dQLQEv
 8VmQq63Oi7uuhYd4OThEXjHhPxmNNnPmtBt6a2XLzdY38snb+ZgwwQ82pEEXTs9QJ8Bn
 Rd/Accnxbk2pg879JSA+qHNFDXUNy17/P5kc+G/GfgmTbvr2qI2PaM62IZYpO3Es/7PZ
 LldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=QFJiO4uxzVOrTHFhfJNbbqatVyDDbfviip677XJzc3g=;
 b=ZwVzKCnlVBEaX2n4/HwrTBfZJLNkDzIetNVKF0ep/nP/B/SLnbHr11eMNLG4ZD6QMX
 g9c+EsPO8Qu5fryGwu976w8F3ztC6M7RGlErFZcntlspqfDI2zp9pwS6KB/q7Tu9RLLR
 s4ybe+iUBffyUd81As6QAHEnfxPdaafAjWCn6cpQ2Jkm8HtddT6A+dOS6bufhtkpniqN
 YODzk5vB4003Mt3+7+ujF9b2Nm4Pz59syeOQzke4YxDtFnAYLoqhfvqxFUD8FlERotFd
 J2pzi3xTbd+mhAluXfJRdqa2jdjxaMcHFtNUEYBtCFFNc7umLaE6Piz7fFHhU4E/oybr
 rspA==
X-Gm-Message-State: AOAM531Fc9gpy5f79Xo3S8soQngAgCDi9SuvXs1sFZgN0tVYlMedVidh
 uBbtWo/ghE1GfsjQ9pGJEz2+ig==
X-Google-Smtp-Source: ABdhPJxrI52a92FqJVwwtk+wXibm6irerr7cS9RTa8XptyvtCOLvaKFbQtrqcjoEAmHiYT25godiVQ==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr21336124wme.40.1623752283488; 
 Tue, 15 Jun 2021 03:18:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k25sm2085565wmi.36.2021.06.15.03.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:18:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BD351FF7E;
 Tue, 15 Jun 2021 11:18:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 2/8] softfloat: Use _Generic instead of QEMU_GENERIC
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-3-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 11:18:01 +0100
In-Reply-To: <20210614233143.1221879-3-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:37 -0700")
Message-ID: <87fsxjig86.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

