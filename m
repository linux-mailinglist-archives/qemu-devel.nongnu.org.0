Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA364AB58E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 08:09:50 +0100 (CET)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGy9l-0006xg-5Q
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 02:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nGy32-0005TJ-D6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:02:54 -0500
Received: from [2607:f8b0:4864:20::102a] (port=44894
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nGy30-0003Ch-NR
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:02:52 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1821806pjh.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3YDsUmO2JhXF2ER+3x9Cgt+qwGVNOmshEBSA10fU+qg=;
 b=ENDCynuGcyTiswXTRKVHm71aYHiTokVnWJEYBa+5VOXrtKeOCMV3OtdfMx7brqnoWw
 +HqW7wXdYC414HjuRWpIcnUiXin9m8eAuAUtETCubbbBT80BQQPQaCQyl2geMX5kowC7
 tBA0EfBT5WuteZi6ef9msFBJiInP5Vvv0rA7pnQCbIvvnqiyWnXJW4jUN+fnI9/N690c
 tbbLMf0gzKCPTYWiGabwhbl80wvbGq928eBDyWYLxvLy9aYMSZeZ6WN9vceZo2IexDd+
 Hys63uIebKAtLa8V5q2uvNfbLj3b/pty7E/AAkpqK5bk1olh5WtOnSGgrJ/e7ly+OTSA
 a1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3YDsUmO2JhXF2ER+3x9Cgt+qwGVNOmshEBSA10fU+qg=;
 b=dWc7KsS6Xcii921DQQU4DuykYNf2q9zTkRSF6lFx1D+NUOC4pn4+pQ+MfOnoR9Nlu0
 +wZufdBK/GGa7lgpKT4Pr+AK/K0OD1raYKxWiCMreUt6vEcZmQ6f0UNMas4TVFxslFiA
 ODW+EKAAHB6D3LQO+pipcycq2tMyIV7J+v0V1ENH+yTgfZ/f3CnJfabE1ZIFNua4DdRJ
 AU9N2Rj5dxzKArIqgJIIPlFWGsxAEc5kdo+XtGOeW9nFpkhceXcvPqPMYUzklhLKQ66Z
 VfnoV5q9rKZD7pOfCtSpNOyMkFR1hwE3TYF3Vv3M4JRz5H/kgBhJoNRhbbp0/Nv2gHHQ
 e9Hw==
X-Gm-Message-State: AOAM533T797zwdzHvd05FWas6z8sO9eCKL/i6RPTs9mZ5JyB+KRj1k1d
 F6ZVqMU00zAIVWHVx2det2nkHGIXIpCL7aFdfWwgAA==
X-Google-Smtp-Source: ABdhPJwvertwwszc8eN52WugHYr+igBx/ift05QUF+vGA+v836098o8mhenwEZbYJ52JWUuxaWjjHw==
X-Received: by 2002:a17:90b:1c8c:: with SMTP id
 oo12mr16985512pjb.238.1644217360944; 
 Sun, 06 Feb 2022 23:02:40 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.242.56])
 by smtp.googlemail.com with ESMTPSA id c2sm7535747pgi.55.2022.02.06.23.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 23:02:40 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v16] ACPI ERST: specification for ERST support 
Date: Mon,  7 Feb 2022 12:32:32 +0530
Message-Id: <20220207070233.2632953-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eric.devolder@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael:

Sendiding ERST doc patch again with TOC added for the build fix.

thanks
ani



