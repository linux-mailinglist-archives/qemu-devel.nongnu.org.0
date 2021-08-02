Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF03DDAF6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 16:27:20 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAYuU-0003gw-RF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 10:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAYtV-0002wL-Ll
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 10:26:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAYtU-00028Y-25
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 10:26:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso3755531wms.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jrWU+7LtbYkFgvUwFUd3JI2ao5tQKaVfi7N6fJBaVE=;
 b=xTDubonOocyVYDI7G38rK9wrVpIRlJBcm+RUuytYrjHggVHQrFTQgYDGbjViwfteYH
 82+woMR26TfczFhgLJX9mtz8Vd37T5p7HDHj+YUj1YE2gaz2QXKFEIcU0AxWJktiX3JV
 AsC5y1ivnQsRH+qnKELhKn2OUD9ZiEQEegLtvTuJKlp2AI/XkI1EKx+dEoeNRrT6Q5jr
 V6PUCkeMC1aBR4sCfZgRaGkqBdBETv33i4EgPxqMgba/DyuB/QDFJitt0uO6xeDFN7Ky
 JzMkEbS03oqtavQj++X3jNXS9m5KSCCkOfU2JyKVjPgV+ZA9eePYnqQ17dawSl4NmrmQ
 ExtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4jrWU+7LtbYkFgvUwFUd3JI2ao5tQKaVfi7N6fJBaVE=;
 b=PUsPmUASp2l29/cLOZ3iQ6txmCKp9+MyEyJHTsWbVth+0F7QAOQHpXrHvguazeNS1d
 IF7Ih6rHWrQ5WzR0PPTmF73t06dPA8OgfLEbf079ouFrVOIMSdyatAZOqoZfrwP5Gtc+
 WbYEPJLk1gYaP5i8SX5k64SMLsKfmhqnkCEWfSh6XSDAauUoeGodDl1HcQLDgmGw+5/y
 L02opwNamuN6XPdgZ1kWWBLqTOpEr1cZHKGZVCvfzwmz/BW8eYlNT25nSacjiZSjU4fU
 7ZumEHIRlT2mOpNA1HGWNBfIHvt98deirdSyo2lbwtdsA/V79L5/VFsm/3lPYV7xsnoq
 U4hA==
X-Gm-Message-State: AOAM531XcMBegvMhFsjiyjGuB7rjFHoP7ySJrIj3p6xGBsJPiygWRWNp
 BJNhEF/f7GvtgZDgiYuola6eeA==
X-Google-Smtp-Source: ABdhPJy8YTgwDNJ9rgWfkHOxQnQ1ZViwPuz6ONMCWvEnJy6n/eWmbJ+NHB0JA+9ETENzVUpRGDn9Qw==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr17222941wme.87.1627914374256; 
 Mon, 02 Aug 2021 07:26:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm11405966wrq.59.2021.08.02.07.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 07:26:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 865411FF96;
 Mon,  2 Aug 2021 15:26:09 +0100 (BST)
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: QEMU Developer Survey for KVM Forum 2021
Date: Mon, 02 Aug 2021 15:17:29 +0100
Message-ID: <875ywnhqim.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi,

For the QEMU keynote at KVM Forum I'd like to get a rough idea of if our
working habits have changed over the last two years. To that end I've
prepared a totally anonymous 5 question survey which should only take a
few minutes to complete:

  https://forms.gle/2MrrZ73bPHCG69Z18

I'll present the data along with all the other interesting stats in our
QEMU keynote session at this years KVM Forum (Sep 15/16th).

Thanks in advance for your time.

--=20
Alex Benn=C3=A9e

