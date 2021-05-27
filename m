Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0ED39321A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:14:32 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHiS-0007NG-1P
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lmHhB-0006gE-QL
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:13:13 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lmHhA-0000UG-4i
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:13:13 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 82so948363qki.8
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 08:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=/ECb4JF9DiBra4mM4UfQyPWiFJJGIkYEjtGjlGBfJRQ=;
 b=tZAv+CZ+Uk54GIhIz2VOhQzz+kS6vJc8RkWeO61LJfiKFjBay6JgEcaT+teBVjsJqd
 XiIDNLy+A8wHAbs4ANNjc/12PJBIv7Dxg/8O2Zy7GEvYeedunS8Xsewy1b0ZxE3BmoGP
 RZ1YS7ZfaV36f6gDGi0FlAo1UUcM3jzsgbQYVcCeab3BDabbxB/Sw0zYVATYZi2IgUI6
 hLgbIX/SqKxA3ttIcr3RxGQF+pUm6BpCF1J9uREG6u42rnPSGbR9SID6K4c+a5rCG/sb
 Z7tPIAq9HjKaHVLoBruXl6kKngtTXvTBej3xB/9mETZeENDyymSrfg3hnMdBnFD5MaGh
 076g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=/ECb4JF9DiBra4mM4UfQyPWiFJJGIkYEjtGjlGBfJRQ=;
 b=GzHiXkE3N+tcvSSQe8+GEm3hN4Huu5vNfcIoV2KFzIvNBnudROjWtK8IZ6EAKrHMAk
 TS9hPaQoYx1Al5vme9ji/g+naeueB/+GyUchNJyAaaMTH53NHhCzF8X9Rn2kaL5SwNnN
 Vv0oU7HGzCF6YdH6svuj/23tO2aTTJQ0SKauH5O5stNqJp1V8dEJGtj3lomvIhz9EKpi
 gtRiKai8PW7fjeeCosz8sBwlemws9GP52XddEnRPLbLcV4taJATNlzPtLLO20LFVy2+Q
 cpoGEx3bWWSNT8aL6fO9ShdMJwtZHfDy/uEz6aqL/sDIMPxdxlI2teYeW/ManA10grDO
 M0aA==
X-Gm-Message-State: AOAM530OLnL/D0QjcUuQyfpc6oOWQ2oBDQ2zSnBAUm3Hul0lz9A6XMRq
 TgOIrYqZHZJAWCLgjyUolucw14QZ2Y0=
X-Google-Smtp-Source: ABdhPJxXBo5mSbIswmJ1Xm25Pks+CK2F24Stx1uM5wZo6A+d7yjjsC0UpgjKrJ+Av1ndAE4UhbA/EQ==
X-Received: by 2002:a37:a2c5:: with SMTP id l188mr3980854qke.413.1622128389976; 
 Thu, 27 May 2021 08:13:09 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id l14sm1510684qtj.26.2021.05.27.08.13.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 May 2021 08:13:09 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Windows 7 fails to boot with patch 7eff2e7c
Message-Id: <C9E71465-DF65-4BCD-9989-E89968FF5E87@gmail.com>
Date: Thu, 27 May 2021 11:13:08 -0400
To: QEMU devel list <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have noticed that Windows 7 has stopped being able to boot recently. =
After doing some bisecting I found out it was this patch that is causing =
this issue:

7eff2e7c652304157f503f2d406193bb9de10d58 is the first bad commit
commit 7eff2e7c652304157f503f2d406193bb9de10d58
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri May 14 10:13:31 2021 -0500

    target/i386: Cleanup read_crN, write_crN, lmsw
   =20
    Pull the svm intercept check into the translator.
    Pull the entire implementation of lmsw into the translator.
    Push the check for CR8LEG into the regno validation switch.
    Unify the gen_io_start check between read/write.

=20=

