Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A01F4FDF47
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:10:40 +0200 (CEST)
Received: from localhost ([::1]:41474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFLy-0002az-S6
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFKN-0001Ya-02
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:08:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFKG-0000Se-89
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:08:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id e21so10915879wrc.8
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=dlfuukWOmZ3t8pzk/pBVKy6HLKbxbB3g8wRXWJT0TAU6HhbVYXoGX2deyATjP3oMCv
 uaB6GmeZDXdyGO52NZg+UIchmibzg4qhdfex0keY6XL7kCWUcXy/K6qvrTUmyxHRpFIx
 bZ3We3aGFnFW570RtA5kdA25CMuMVKlzc3ZhN7HXlS2Au/5rJhcizsjX6DcC1DU+5PJ6
 gOHtC0nwh7Dd02eimZKOUJpujh2Wmkyt39MUoqQ6FIT7I8J79PTqge2vO5r399xLjFSq
 qzJFCCDcZofBjKjWGwzBa1p7mz0yAdx3mqFnhq73nzQZMgyha16M6gtUdUTZMI9YxIkt
 /31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Qdeu8HVXoeJ4t6xhn2UQjM8zNkh6hR4Gvm4UW8W9nPBw82EttyTFMt5eA1EsRgPST5
 9gyfI0knbZTOSiKjHR5GpXSksXOOgudO5bq53vW5+KfhQEdppTjxUpaTPXxB/Jqt6z3m
 e5mhh2pt5dueazdXHVaLzYh55Lh+8CXKPNF6FDyi51Nlq/2RwUtY+atmy1HjvHcPMqJg
 qH7sNDz+8J5g4Xq3M8jgz+otIy0b/CkxJaknVfkuyBJSkm8Tbj+DEhJaQ1WmWm6N2EIJ
 1DBBoSu0gejtO54otv28oQizPvZBwH/2a7i0vyje/x3Qgl0uf0qOUS5nagPtw/VXRY7B
 Rt9w==
X-Gm-Message-State: AOAM533GrEET3wTIyiE80pyTAUfuOa422iLRS2P2m1Ng36mmZaiL8dT0
 5Ppt3M7uLlHx6RCM4O9hBK8=
X-Google-Smtp-Source: ABdhPJwpTbcn6XANWWmSYDtM/d5bOSNKAX2o09nH2ePGDbUSV8CKbLRuD3a39tRrcGk3dpBd1EIMEA==
X-Received: by 2002:a05:6000:1862:b0:204:e417:9cf8 with SMTP id
 d2-20020a056000186200b00204e4179cf8mr29451833wri.593.1649765330657; 
 Tue, 12 Apr 2022 05:08:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b0038e44e316c1sm2191613wmq.6.2022.04.12.05.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:08:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-7.1] target/i386: Remove unused XMMReg,
 YMMReg types and CPUState fields
Date: Tue, 12 Apr 2022 14:08:48 +0200
Message-Id: <20220412120848.206690-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412110047.1497190-1-peter.maydell@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



