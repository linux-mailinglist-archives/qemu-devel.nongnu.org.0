Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE72FD6D8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:24:35 +0100 (CET)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HDe-0000JX-LL
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCL-0007z9-UL
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:13 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCI-0000em-Ug
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:13 -0500
Received: by mail-ej1-x62d.google.com with SMTP id b5so18184484ejv.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4SOM3vqfkXA4JUiHcxeK52I4bKkuH7HyT0M/S98k4uw=;
 b=KmwmMfA2czWiy43GxAhRFWivaH7HZFpj5fWJ9GV2lgE3p2+u/NGhdxuPxidVlchOoM
 BhbxS0yrjl7Hb6cRAEqRRRD/wEZxa2XoWZ3hu13G6lI3T3ZpPWEol2l8+vUznaO7NCMV
 LfO/smLIZyQiVOq1OHCusujVWUjM3x00mRbWyLqEAl6lXEC5kFesMK+pySFEz6glPhNt
 P/JTqGQsUc1R81fuurtfJ2HXBV7kDFGKY9KwcesZgHPMSj10Ea8KTWl2IZGwKrlkqwsl
 hk/pS9rrCvrW7BkWRF3ExYb2VIUXj5xKZUZdSCZ/pIey34l8Z4NgRDJTManHMXkhcvNK
 kNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4SOM3vqfkXA4JUiHcxeK52I4bKkuH7HyT0M/S98k4uw=;
 b=p3K49Rs41iqEsoIZRXbLVGU5LhcYpLO0YS6gheF7aXa+E75ReLQe5Xa8uqPOW1iwA1
 Z8tCbdEYLUwJuXI+2tnd1WMOK5yDutfnbXVJuoRTv0Uis0yuU6TxPuOhC+NDMj1MRXg1
 sZDvGGtRBIFMfm3rsQ/RGo/mB93QwotJmZKCOm+ArJs1YH4LgdK1MDW4XTE+70n3UMuA
 AxOR8+H17wI0lr+/PvYV6R7xk+rOnrfwElMOz4UaY6f5RI37GCTQmO/EhO1gkQz5Ob6d
 yQ96EK0SvFmU+7kWxC+lHV94HNB2RfyMWounPwpXqWXsU07G1xv0blR7rWTYc0/dpdKk
 ogcg==
X-Gm-Message-State: AOAM533pJ5sBnBgqMERexB52QNW1GI8hI+DAP5MOp/T8N1fO3zJZOo/g
 N2tOgOMjtJB9kIfap7q+5OAjwIjks7otkQ==
X-Google-Smtp-Source: ABdhPJxMzVDqXy9zG8yUtoMY8zvW7VkrevKe1iDS+2RcjnpYpUX9uRZq7FsCv04kdt24WnGELSHElQ==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr3938440ejc.482.1611163387550; 
 Wed, 20 Jan 2021 09:23:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o10sm1157524eju.89.2021.01.20.09.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:23:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] meson: Further cleanup of summary
Date: Wed, 20 Jan 2021 18:23:03 +0100
Message-Id: <20210120172305.26586-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inspired by Philippe's "meson: Clarify summary" and based on it.

Paolo Bonzini (2):
  meson: Summarize configurable features together
  meson: split the summary in multiple sections

 meson.build | 90 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

-- 
2.29.2


