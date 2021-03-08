Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A233105E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:06:48 +0100 (CET)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGX1-0000bi-Ta
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lJGV0-0007Gs-W2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:04:44 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lJGUw-0007BQ-Tg
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:04:42 -0500
Received: by mail-qk1-x72c.google.com with SMTP id s7so9268246qkg.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=rbuJrzhTPTRcrAWMivBCHeH6KceyWzObFdTZdbBr404=;
 b=MuHUY/MqTlTiI1V7o4D8miNKVMMWcofl5avI92gyaYhrP2mYtnISJYAk5+V8LatECO
 9hRF7GaBBzcbFTGtMjAywGfAlr7FewOPpCKGH5BqaMNbCAR8mW/LarGG31CW1BifUUx5
 tH8fRz4qSq1iT1W+/ISh7RD7OnEKhyN1/kSXBGLktqh2hQ+8ClxX1iMwG57biTXWPXRw
 zAX1mMIPjaQemplBX+Tw17S0gJvnL/+AylFUprO8j1/K9LEGrizFuBL/aDe+wV89WX+s
 xv9XsN8gd9B4iDkI6q4m6nuKn566FEtisC8mxnFkpEFkQfj9TwkjnHkuaOOJSJBSOBWi
 sfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=rbuJrzhTPTRcrAWMivBCHeH6KceyWzObFdTZdbBr404=;
 b=dRq0boRY43HfbAF0WPkzE2Y1talMrFnMF/QWu5BjPAt6OsNNSkFVFSeo1LkatekM0G
 KSCHYYn7NbvjnSsjbPT9Oy5MCfgJhGnAYLgIK6IJtetbWoZcV/tzOhFnkKzFMaTsQQtF
 OJud+CGEH8xT9WyQazeY8VPA4MXHGANV2QP8gA/dGngmcgMRXyV9tofZoXwgDSgqt8Qk
 nIfdSXtmoxpGGyWbch7HcMZrqp20i5Y0G798Yf62hMUP8Ku7LOGqhWRGmIf+NdYcCYRI
 8Yp3gsw1ZHtwIQWRRY3O4N+aKZ4+4p4w9RK3i7xFwr//OXHOgsQf07y+iakKA2XZW64a
 qoxA==
X-Gm-Message-State: AOAM531nXxB2duijOFpsYB4DPYzkeRk9tVhuVAqkzq3G1wU7lI967Jw1
 7vsLkn5mgdWnEnT+GunmV0k=
X-Google-Smtp-Source: ABdhPJylLkiIcYs5lpHd/vhleCjOFXdLsTSpaeqr+ecUPZ5Av4QDKs+hygEqkMI814NTkYleSdXsAw==
X-Received: by 2002:a05:620a:914:: with SMTP id
 v20mr20995628qkv.140.1615212276169; 
 Mon, 08 Mar 2021 06:04:36 -0800 (PST)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id a9sm7628393qtx.96.2021.03.08.06.04.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:04:35 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Copyright string's date needs to be updated to 2021
Message-Id: <2AFDFC48-1A2B-4925-B24C-DB2D3B94C666@gmail.com>
Date: Mon, 8 Mar 2021 09:04:34 -0500
To: Peter Maydell <peter.maydell@linaro.org>
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
Cc: QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

The copyright string's date is still saying 2020. Could this be updated =
to 2021?

Thank you.=

