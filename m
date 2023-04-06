Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E136D97B6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:15:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPRF-0004qz-LP; Thu, 06 Apr 2023 09:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPR9-0004qX-If
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:13:59 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPR7-0008Bg-E2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:13:58 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 185so12541554pgc.10
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680786835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GbwkVL4dWB7PttvxkStaPImqbp/cFdbD1DV4GoX7/o=;
 b=MKor4QGr3/+iuwYCqtCv+r/roOFrrw34WYfWgGpIIJifTM1nY48BOtc6cNAIRwCe73
 uA1tl3WFZZE/bK6Nx4U3pS2xpmFELOCgojdmOhheKbxuyQptZUgl1L8jpd+yA7jw64Y4
 RA3945pjOM+bB2xeVjkIdL4KeANse3M3eJwJsKiv2ktDus/vECM8VtbLD83/DtZO/Z1q
 njOoQMdO6mYfOQ+BW/YC4ElcgC01oMfSsRe4eOJVYZZVDm6mz4EtUtvy7L0BctSvAVaJ
 S0aLvQBDbEkAqQfGiLy2vtDj9J9mjaDbOaMp/CZKVW0Q9rkYyoeiAvaDv2Rz7slq2Pts
 PRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680786835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GbwkVL4dWB7PttvxkStaPImqbp/cFdbD1DV4GoX7/o=;
 b=DVQ/1KtBgSujAU2x2VyqsZm34FH/copZWf46XTOXmmjtZZ+lkgEc2GZt3ZGRZCRHyb
 RBjYEdB0BmYgZCWtYqzZEBkjX+6iH4tb0Fsb7Zlk5Xy6AjZD5tfXCb4jyQQWfiTm+ZrM
 0uyXRNe8yWCh1NRUlHJ3kXvTJedMvpwU1Fhxe78J+wSyct/72vj6svql4c0SNZEmCNcj
 4LHzq6UONBkbYorgFMg0ayGDJqyQioc8Dw6f7MGUnY5DwH2W4CaHeamfKeim20SB6XMu
 n6zEt+ypPYOXUZOIh2vksyIKW1KfQRpQlpSCzuleGJ8Bwq3xaJjpXmEH2FmJjKURFxzu
 dMpw==
X-Gm-Message-State: AAQBX9fIP64lO4Tk912zPXSU2MbMtRXiDQYKyVjvWMoNYxmSyqOTTKr6
 4yh2ALPr9LpMO2mv5uhsOSs=
X-Google-Smtp-Source: AKy350Y3oNwRT++p4wxyiDzg9AIRzVwuVOBhlZQbyTsNAel3+ay/ZjnR9lVg4AtcCMPKusvkfi7IHg==
X-Received: by 2002:aa7:9553:0:b0:624:894d:c494 with SMTP id
 w19-20020aa79553000000b00624894dc494mr9596505pfq.19.1680786835168; 
 Thu, 06 Apr 2023 06:13:55 -0700 (PDT)
Received: from raghuh-elastics.. ([2406:7400:56:45c3:5697:bbf2:968:7051])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a631820000000b00513b3ea831esm1088326pgl.29.2023.04.06.06.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:13:54 -0700 (PDT)
From: Raghu H <raghuhack78@gmail.com>
To: maverickk1778@gmail.com, Jonathan.Cameron@huawei.com, qemu-devel@nongnu.org
Cc: Raghu H <raghuhack78@gmail.com>
Subject: [PATCH v1 0/2] Update CXL documentation
Date: Thu,  6 Apr 2023 18:43:23 +0530
Message-Id: <20230406131325.3329590-1-raghuhack78@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406113640.0000277c@Huawei.com>
References: <20230406113640.0000277c@Huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=raghuhack78@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thanks Jonathan for quick review/comments on earlier patch, as suggested
splitting into two separate patches
https://www.mail-archive.com/qemu-devel@nongnu.org/msg952999.html

Removed the unsupported size option for cxl-type3 device, Qemu reads
the device size directly from the backend memory device config.

Currently the Qemu CXL emulation for AARCH64 is not available and its
only supported on x86_64 platform emulations. Removing the incorrect
information and populating with supported x86_64 sample command to
emulate cxl devices.

The document will be updated when the AARCH64 support is mainlined.


Raghu H (2):
  docs/cxl: Remove incorrect CXL type 3 size parameter
  docs/cxl: Replace unsupported AARCH64 with x86_64

 docs/system/devices/cxl.rst | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)


base-commit: 7d0334e49111787ae19fbc8d29ff6e7347f0605e
-- 
2.34.1


