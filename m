Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA12325F1B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:33:25 +0100 (CET)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYYu-0000oN-Jg
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY89-0001rm-Ha
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY87-0004Ba-DV
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id v15so7679057wrx.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CcJTd08L1ttvSLW4nGKplXDeyrJw0bi8MGU/5r3AoI4=;
 b=q20qc+SeffD4AwMQBSc1jPCgsfSqbEK8k64UeVYiechK8eIZdZ4ZlgESl41WnR6AVa
 F2QHY1x9kVu40ClXc7qOn+3lH+orB5nntkbW+Vgw2neC1wfIfqNByxUgatBoN6xPvV73
 zDqbk5Gsk4G66pmNrtH05qw9DAozMxQzF1EZBg43930AkTWDCPxxnFTPR0buSnycFOf9
 qaCI6X/8KiSWJXQh2+iAv94/gCxkiCa/bJO3AeJyA0RXI1epO4TxnjYMsBbafGl08pe5
 whVXAdex6RJhJOPp00TEwQ2eXYT343RTv+RRx9CAprHw/nu80Sze6c87MzuNbsZijqbs
 po6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CcJTd08L1ttvSLW4nGKplXDeyrJw0bi8MGU/5r3AoI4=;
 b=a3vsZ6HiHT+fKO9Ug85XwVxJKXP7CMV0lCYvv//GwLD8iYprlU0Owmpz/AW/cOG4Uh
 lcCpNApq5uXIocMVllVYqwvumCNfRcGRAhbPN8FqWW5bmiWp2ZFi/eNYPAt/mmJf0p8I
 kZSaJkMrFnpW6sNmVjLHo6YAc7S9vDlXoTLt60zmSKqnM5ilC5j/5pFUxrgVBBylat6W
 jx3F5G6WcY/gNRPCE6NvPcV0sdFsjzqelHlvjrHQx84PEulXrsX8l/Dr9z+JmvVNV8+l
 ayueWdgwZnJMasBdS4EdRg48yi4PgZa94n/IGtUvBDfagGNiDnb5oNyX8GC9DYlAlILF
 T1rA==
X-Gm-Message-State: AOAM530CsNFkzOG2qyMWOUdf7wJsxD2czeTJDmkjFg9YB8YOAUWtefDv
 zx4DKS3M5w8f8vLiPrMCz7QibOS4yr4=
X-Google-Smtp-Source: ABdhPJw0VtuOusbxj45t2n+6UCyHcD8ZsgsRBhwGoa5HQsd8qLPqA9HRavMJuGhEl68Sy/BJPaK8zg==
X-Received: by 2002:a5d:4e41:: with SMTP id r1mr1864620wrt.6.1614326742084;
 Fri, 26 Feb 2021 00:05:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/29] docs: update to show preferred boolean syntax for -vnc
Date: Fri, 26 Feb 2021 09:05:19 +0100
Message-Id: <20210226080526.651705-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

The on|off syntax has been supported since -vnc switched to use
QemuOpts in commit 4db14629c38611061fc19ec6927405923de84f08

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-9-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/vnc-security.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/system/vnc-security.rst b/docs/system/vnc-security.rst
index ebca656d87..830f6acc73 100644
--- a/docs/system/vnc-security.rst
+++ b/docs/system/vnc-security.rst
@@ -44,7 +44,7 @@ the password all clients will be rejected.
 
 .. parsed-literal::
 
-   |qemu_system| [...OPTIONS...] -vnc :1,password -monitor stdio
+   |qemu_system| [...OPTIONS...] -vnc :1,password=on -monitor stdio
    (qemu) change vnc password
    Password: ********
    (qemu)
@@ -104,7 +104,7 @@ authentication to provide two layers of authentication for clients.
 
    |qemu_system| [...OPTIONS...] \
      -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
-     -vnc :1,tls-creds=tls0,password -monitor stdio
+     -vnc :1,tls-creds=tls0,password=on -monitor stdio
    (qemu) change vnc password
    Password: ********
    (qemu)
@@ -128,7 +128,7 @@ can be launched with:
 
 .. parsed-literal::
 
-   |qemu_system| [...OPTIONS...] -vnc :1,sasl -monitor stdio
+   |qemu_system| [...OPTIONS...] -vnc :1,sasl=on -monitor stdio
 
 .. _vnc_005fsec_005fcertificate_005fsasl:
 
@@ -146,7 +146,7 @@ x509 options:
 
    |qemu_system| [...OPTIONS...] \
      -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
-     -vnc :1,tls-creds=tls0,sasl -monitor stdio
+     -vnc :1,tls-creds=tls0,sasl=on -monitor stdio
 
 .. _vnc_005fsetup_005fsasl:
 
-- 
2.29.2



