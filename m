Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397372C412D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 14:34:09 +0100 (CET)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khuvt-0001vZ-T9
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 08:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1khupK-0007FF-1d
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:27:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@blade-group.com>)
 id 1khupH-0000sh-U7
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:27:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id d142so2005367wmd.4
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 05:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=ks4A3N69cOaw0ymDGE2Z/6Z927zJtwPh2/d5E7s9xIQ=;
 b=IORGh6zSqMyxnc3qSi8PjYHw15LmsKLdBYil3CLvTotR6GgNMNDWOcatnzbQgEdgt4
 wHmwQ04z2BVi35lHa0IPNOmGYnyNS5zYcv9SR6YEROOwbhl9685FvL/pLm3W0MPNuFAu
 fbU9cytgdcD/IrQ+QcsiRnPU/sZS/yd9MTL1790bAnvvAMB79xR29hxyzactKbUQbMus
 Ra/BE9DVQ79ftUlGFMrd7NbPeyTFXGTC1NquZit5w3uPFJRXRpa3eWslDybRF2++EsBN
 4InqcMELT38QWGdhm9WzbED9/0Gzahly9/PKFfBn1SJIG2OhXPkq0EG9+2XCfYpkPgLM
 h9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=ks4A3N69cOaw0ymDGE2Z/6Z927zJtwPh2/d5E7s9xIQ=;
 b=LLMr9qlATnO+YRp21E4sAg8pkKeb/2tiOtOVJD1cGhUki4XEpwviCqn6qSFOjI/PCB
 GLzJZ8eOmwAAvDTca6gjbkXlh7U8c4Zcjo0IinE7HUYS84sGQiTpHUvwqFfGHNSGbO2W
 elscBPOFPVURLVVCj6t5aJsPbZb+E6WS5D5iehCH9+RJxb/twur4bt09zRjvEEFDohSg
 3yiLXFobChLzOQf+YNV++xgpC7wlBtpsGYane+Nio20f4CXGh8FYTPanZgLbC7/EISL8
 YsecqPEt4diMYWB38sBT2XvWoabgKBv2u7H+NBfvcwM4CVpDL90eHS2UxwdkLWk/EQWx
 UF5Q==
X-Gm-Message-State: AOAM530beqkvJqy7NC1NFytXdJ8ev+XHN5TJ2k4dMAdw2g0nbuPA8ct+
 GFdbcbjvffim19ILttr/NtrurCxWFYvFWw==
X-Google-Smtp-Source: ABdhPJwD1rA8sa7A1OKfyUXrz+F7FwO4pLAQ8Sum3BDVE2OXrsJ9QoTKl6o5bDigY6WGJ0XaTFByKA==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr4060875wml.5.1606310833192; 
 Wed, 25 Nov 2020 05:27:13 -0800 (PST)
Received: from localhost ([2a01:e34:ec16:8a90:4e1d:96ff:fe49:7109])
 by smtp.gmail.com with ESMTPSA id f23sm4439400wmb.43.2020.11.25.05.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 05:27:12 -0800 (PST)
Date: Wed, 25 Nov 2020 14:27:11 +0100
From: Antoine Damhet <antoine.damhet@blade-group.com>
To: qemu-devel@nongnu.org
Subject: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields to be
 set.
Message-ID: <20201125132711.jqb7znxu5jpoanwi@tartarus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=antoine.damhet@blade-group.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

We recently found out that some softwares are effectively crashing
when they detect qemu's `OEM ID` or `OEM table ID` in the ACPI tables.

I see no reason not to expose the setting to the user/command-line. A
previous patch has been submitted in 2015[1] but did not get through
because (if I understand correctly) using the IDs on the `SLIC`, `BXPC`
and `RSDT` tables were enough at the time.

If you agree, I am willing to forward port the patches of M. Jones but I
need to ask how it would work `Signed-Off`-wise ?

Thanks in advance for your time,

PS: the softwares will crash if the signature is found in any of the
    exposed tables.

[1]: https://lore.kernel.org/qemu-devel/1441220618-4750-1-git-send-email-rj=
ones@redhat.com/

--=20
Antoine 'xdbob' Damhet

