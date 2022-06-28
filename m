Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766955E5C9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:46:54 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DQT-00029T-7e
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6DOh-0001F9-Iy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:45:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6DOf-00014i-Ua
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:45:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id q9so18300802wrd.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JyjG1DMGLvhxEVEMMpGYuyFnIml/qTWvf4GJ/0KEHo=;
 b=MFNxMK3OR1DBk2GN9+KcY5r+jxo+vtHEtDoBgRNt26/XGsouNq5yesFHcQavv2FMOM
 5+0lYFUJcYWn+xanRXqDVAOFC3h0wPs3Fhn/dOhNTMjXvcMGfdqkBLXEijMKigwy2EVj
 T4P/6xctPaYR2iRCX425Mfs0PBhhrZd/Sh3WaGIMzyYlm2FadiRU7joNFlkMrna7RZbx
 0xU/VphtryrPNyIsiPuRAwAWTGMkvzHuBNpPd0+Srryu79tQtJLPZax8abB3ZrnMIAmf
 KdJV4Zn3ZXwkvdlZfcMmfWv3uvb9mpjQv6j2IzjqpEE4mE+3JGDZj8VCUztehbElzHnn
 RjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3JyjG1DMGLvhxEVEMMpGYuyFnIml/qTWvf4GJ/0KEHo=;
 b=5Y3bxf39qCeheUTBjZl9oSXKcQDnRlNQX9Jw6rU9dGyntgIK4FaPYJ6AbaYZ89JsXg
 LsImHekj0dN0+L96lTzwVnKRWzP9kHaFcHcwctjM0XB57JVB1ptCVoO6sXItTHELAWGn
 0yH3TwP0kiUJ5ES3/oHMz6oSHBFLlPPS3ETMnxYNpsZ8FMSEEeXGSaT+JtHosN6J7xS4
 DyDGralGzYHWc6FHK817N406MJ09fSRsU5S3EP2YH+qCFORgVbGmOx7agul0aCoZiQO6
 bUmJQqJE/fGVPxry6huj0uddTpQmoaisjd2YbPBniGduiPYUQ3qdSu/Zltvexfgq/yGK
 MWcA==
X-Gm-Message-State: AJIora+g9dgzXcMyKS3QgnQKUYM9AIKu2ghkn23AT09idXTl8OYzqmnF
 T3hl1TZzfhQLJhovkmiWNeX7PKzu/j+Ehw==
X-Google-Smtp-Source: AGRyM1sR3bY7OtFd1Cx7kQXHQ7a6wh9n+wuvdxavLgN3Vd0OsB7R+eGr+JqmQm5LfsDKF5VkAhjsOQ==
X-Received: by 2002:adf:f84b:0:b0:21b:8e43:b8ba with SMTP id
 d11-20020adff84b000000b0021b8e43b8bamr17981032wrq.155.1656431099566; 
 Tue, 28 Jun 2022 08:44:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb07000000b0021b98d73a4esm14214982wrr.114.2022.06.28.08.44.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:44:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7DCE1FFB7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 16:44:57 +0100 (BST)
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [job ad] Linaro is looking for a QEMU and virtualisation developer
Date: Tue, 28 Jun 2022 16:43:53 +0100
Message-ID: <877d50kd1i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

Pretty much as the subject says, see the full listing for details:

  https://careers.linaro.org/jobs/1693998-qemu-and-virtualization-developer

[This job ad is in line with qemu-devel policy which allows occasional
brief ads if posted by list regulars]

--=20
Alex Benn=C3=A9e

