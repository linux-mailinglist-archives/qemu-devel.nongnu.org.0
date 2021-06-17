Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B83AB41E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:57:40 +0200 (CEST)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltraT-0002ex-Pc
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyn-00057x-4E
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyh-00083h-KE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623932314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZqQfyEYmo5Acarc124e10AAtRC2hvdFm0iOLTOwWE50=;
 b=Aykg2iimN3xykBokOwqg3ldLCM1LC5C5s5CS0q+O305YAeLX02x1iPWkV/WqqfRtZ1ROj2
 uy5Q6ZtR/5XMS2rsyns1+f/C0i8GVfN9mxXOo9EzhXEiQmBSAbQXCBTJk2uBmrUAzmrCSi
 dZJfjANvFzNUkS/LxyZs0045suWW1Iw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-ZsY6qSVYMnWtEgMiIXay6w-1; Thu, 17 Jun 2021 08:18:33 -0400
X-MC-Unique: ZsY6qSVYMnWtEgMiIXay6w-1
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so2857493wrs.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDIMJSoHJMTeOKUC+RuK1vA3jkMiNmL8tZUiD7bs0PU=;
 b=YTqdX8pPXY9SFELBwyQyZSy9Dt14IBkaYEDICSFzxG/23DPm4qGLgDlfyK4PE4ozZW
 RJ1uGdCfg91+MG9L6DjI0R/isYacjcoUbM7YtoyOq2HStmZvibZ5CZjU+mSeMHFLz+11
 lBoAv7mSpJDmeqrnYegPX/1ukpFhcIk7dtgBV9uqhtg5c0u59xqtHxj1Nkwy4Tr/5AQw
 4CRj0NCbURhQV85rPV1MEBU9QGsTCNlP+wf42Pdb46BV6vlpOH8YEXSTfDw8cduHmoyZ
 BHN2E2ba/5BIQ/pxFk+P8Vga7qI/JvalCkaHJUtZB0ccqnhokqCOUkwCSM7DnL8F9CtB
 SgyQ==
X-Gm-Message-State: AOAM533ID5lOFLCTZA2sZCeN1DvegViFnhLUlwrKVSe5hZUnLhtYBSQk
 OqUm+0XKobFc9xo6huHkIruPhYHXnF0OnkSJV+ykiqitgsjSZoDFWx2eUJEUNa+5vziG1JJsV3x
 0AjGz7U0qGC4QznN5r92XozJWCEtSbPmebJt2c/88E4MYbHHe9gfTEz/q+EkmTeX1
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr4766689wmc.5.1623932312192;
 Thu, 17 Jun 2021 05:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1jCxqkUBdZHavocfZRt5rmpzdX2mFXf5EeMZEC9QtFNLLdIN+EARa1AQDMiEEA6nmRikjVQ==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr4766671wmc.5.1623932312047;
 Thu, 17 Jun 2021 05:18:32 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p13sm4232739wrt.89.2021.06.17.05.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:18:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] crypto: Make QCryptoTLSCreds* structures private
Date: Thu, 17 Jun 2021 14:18:24 +0200
Message-Id: <20210617121830.2776182-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 5 & 6=0D
=0D
Follow Daniel suggestion to simplify qcrypto TLS implementations,=0D
aiming to solve the OSX build failure.=0D
=0D
Since v4:=0D
- Do not introduce qcrypto_tls_session_check_role (Richard, Daniel)=0D
- Added R-b tags=0D
=0D
Since v3:=0D
- Added missing @errp docstring description=0D
=0D
Since v2:=0D
- Add Error* argument (Daniel)=0D
- Move structure definitions to "tlscredspriv.h"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  block/nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  chardev/socket: Use qcrypto_tls_creds_check_endpoint()=0D
  migration/tls: Use qcrypto_tls_creds_check_endpoint()=0D
  ui/vnc: Use qcrypto_tls_creds_check_endpoint()=0D
  crypto: Make QCryptoTLSCreds* structures private=0D
=0D
 crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++=0D
 include/crypto/tls-cipher-suites.h |  6 ----=0D
 include/crypto/tlscreds.h          | 30 ++++++++++----------=0D
 include/crypto/tlscredsanon.h      | 12 --------=0D
 include/crypto/tlscredspsk.h       | 12 --------=0D
 include/crypto/tlscredsx509.h      | 10 -------=0D
 block/nbd.c                        |  6 ++--=0D
 blockdev-nbd.c                     |  6 ++--=0D
 chardev/char-socket.c              | 18 ++++--------=0D
 crypto/tls-cipher-suites.c         |  7 +++++=0D
 crypto/tlscreds.c                  | 12 ++++++++=0D
 crypto/tlscredsanon.c              |  2 ++=0D
 crypto/tlscredspsk.c               |  2 ++=0D
 crypto/tlscredsx509.c              |  1 +=0D
 crypto/tlssession.c                |  1 +=0D
 migration/tls.c                    |  6 +---=0D
 ui/vnc.c                           |  7 +++--=0D
 17 files changed, 101 insertions(+), 82 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


