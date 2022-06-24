Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E8559D08
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:11:05 +0200 (CEST)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kxc-00033A-LK
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4ktX-0005fy-79
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:06:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4ktT-000328-8G
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656083206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=g74srXvH47yNyJhLvE2zrym8w4zuG5E2ESmtUnuCOOKv7MWV8wQ0siO/Lzkn9JaiXaNvT6
 jged+239o0mutZK6LUh+D+uSiTAqucgzWT2ffQ6OSmR8qsnBvGBzniLoPjREp4Xo2hBuLz
 O+o9+mUVMhiOBet4gsKaTVpWDRrr2qI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-m8oV_4VGP8yS2T9Ez2ADsw-1; Fri, 24 Jun 2022 11:06:44 -0400
X-MC-Unique: m8oV_4VGP8yS2T9Ez2ADsw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w22-20020a05640234d600b00435ba41dbaaso2061083edc.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=KR8cXZrpKl6DMQrMpFMCCPXpurP2aqHKF/kOmpa5nDoZkNExtcehBj7YiwocQT8PKc
 XjJtftJabExrAp6SQUHZt1ATnkYKwKznGgWbcvWiWzr/w7I2ReuaSW4FQRbqDPPrJ1Iz
 3H3bmrP8h+nmHHEuSqMT/eVFW7L+BSxiI5n5mth+PBqNk7ipcYqogExlSQatkXc3gP6u
 fsE4Orxn/Pcwz5jPets+b4x39IVm9t8OiOEPw8jOoLHv4WNOt9k2tqKdLFwCOxFjrAPl
 jB65zr836kLXom28Gh3KPSlRqaM5cj9yKqUwYFybUDh6CDjcFi2H9rv7POMKQ30X4rau
 naMQ==
X-Gm-Message-State: AJIora/SRnRqqoKA7RV30L5MC6iKFbKgA5ekaG/8omIFFLjftbX1YJsT
 5A/nYm9Sw/P4RF/1JrE/hGnyYU8eWl8CrNufjKH83nQBl2sjHpygnlhTn2spZdc4uCj4O0tgVzG
 kBDyjZIrFHOWWaVs=
X-Received: by 2002:a50:fe15:0:b0:435:9155:f83b with SMTP id
 f21-20020a50fe15000000b004359155f83bmr18077666edt.391.1656083203633; 
 Fri, 24 Jun 2022 08:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t8A3UsRwrVufJk5KskEcWL4eW/CtxOHllclBSwO4AFlAMxFs12AB0efmeebaxlDNHc85ZYig==
X-Received: by 2002:a50:fe15:0:b0:435:9155:f83b with SMTP id
 f21-20020a50fe15000000b004359155f83bmr18077652edt.391.1656083203408; 
 Fri, 24 Jun 2022 08:06:43 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 v17-20020aa7dbd1000000b0043586bee560sm2192434edt.68.2022.06.24.08.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 08:06:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] build: Do not depend on pc-bios for config-host.mak
Date: Fri, 24 Jun 2022 17:06:37 +0200
Message-Id: <20220624150637.273397-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624150258.50449-1-akihiko.odaki@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Queued, thanks.

Paolo



