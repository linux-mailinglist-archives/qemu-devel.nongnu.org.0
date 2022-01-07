Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8B487EA4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:56:36 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xDv-0007DC-RI
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:56:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n5x4f-0000A3-1O
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:47:02 -0500
Received: from [2a00:1450:4864:20::531] (port=44589
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n5x4c-0001JM-G9
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:47:00 -0500
Received: by mail-ed1-x531.google.com with SMTP id w16so26961826edc.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=rV1A8XCmOAHVXgIXQWWWcC+9jJc+YOa/WqET0V+lom8=;
 b=mKIEr+6kK4I0s8DGhNibZqZKZDkFTvmrp5DP4vQYum1+dW2gHjmwidmr73s/6B/ntV
 wn7KhxOTglyBegFExlkKEVii/k45sMoIkskUuoebTAFKxTlKWcPN6u85aFk0oX4Kxko+
 pnKNzDaFv/Ij1gqHFPoM5h8/ufwB4LBFeZBz8V5A9FBcH3AmnL5C/au4PSNTpUrlr1d1
 HpghLlPnHoCxDA+FXxRRt1Sf5cwEa1BM/SpLz/AeV4Q7e1cEJuB/rgp1mga532Oj0gvO
 b+rXI2wRuwS+T7VvMKchBy8+zhZ6tbm2OubJI0Yj9V/WeFzlx8FfaIoe1MAJCSYYy9AZ
 Pcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=rV1A8XCmOAHVXgIXQWWWcC+9jJc+YOa/WqET0V+lom8=;
 b=FWhqcI4WDC4H26QltDqYEMdoMxjt5RK4lLrtxErsTJVmkEeC2sAYCGmIZwipet6LZq
 KVAmUDVNM5IWVzVzpYLemCpVoy6SD74KC9mnHihJZU+Pb3SJUosTEnKGA9KRhnzBraZO
 LFEJy0ZvGBVK7uiFoiCS+YCu5ncMVlc4M1ZtMATpHPZqn7kb53e/jLuwcEbwGn45zFxR
 wydQf9htsNyB1qPMbj2+16a7KtKzZw4aFaoqEbXll3McLdKYjQFrEeAL8qcU+RRzRHxo
 Li2zwXI7nmLshCnJKNbrGO5bGBPacKmkTb73QBtSdXcxyr9UOpwXrnhgN1hYU+GzyMKG
 KGCw==
X-Gm-Message-State: AOAM531556g8A0CJHMGWHtBCSWYHrLaVDYSwPOb6xIlcyZy0Cf7YxqIy
 NMWE9uNs1iyhM/BMQ6pSRjoUj2QJgpIZHnJW
X-Google-Smtp-Source: ABdhPJy/vX/RJLSEJVYNDj1pnGilavCjKLXsHU9Ioaopefqcfpk8QL5asTDFiGVIL8PPjOnipNxvjQ==
X-Received: by 2002:aa7:d546:: with SMTP id u6mr63534158edr.311.1641592016294; 
 Fri, 07 Jan 2022 13:46:56 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id o22sm2590318edw.50.2022.01.07.13.46.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:46:55 -0800 (PST)
From: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: ui/cocoa.m compile error
Message-Id: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
Date: Fri, 7 Jan 2022 23:46:54 +0200
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ilg@livius.net; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Hi,

I'm building 6.2.0 on macOS, and on a recent macOS 11.6 with Apple =
Silicon the build passes, but on a slightly older macOS 10.13, which is =
my base platform for Intel macOS builds, compiling ui/cocoa.m fails:

```
../../sources/qemu-6.2.0.git/ui/cocoa.m:1766:52: error: unknown type =
name 'NSPasteboardTypeOwner'; did you mean 'NSPasteboardType'?

@interface QemuCocoaPasteboardTypeOwner : =
NSObject<NSPasteboardTypeOwner>
                                                   ^~~~~~~~~~~~~~~~~~~~~
                                                   NSPasteboardType

=
/System/Library/Frameworks/AppKit.framework/Headers/NSPasteboard.h:22:20: =
note: 'NSPasteboardType' declared here
typedef NSString * NSPasteboardType NS_EXTENSIBLE_STRING_ENUM;
                   ^
../../sources/qemu-6.2.0.git/ui/cocoa.m:1766:43: error: type arguments =
cannot be applied to non-parameterized class 'NSObject'

@interface QemuCocoaPasteboardTypeOwner : =
NSObject<NSPasteboardTypeOwner>
                                          ^       =
~~~~~~~~~~~~~~~~~~~~~~~

3 warnings and 2 errors generated.
```

I checked the Git history and the cocoa.m:1766 line is part of commit =
7e3e20d8 from 23 Jun 2021:

- =
https://github.com/xpack-dev-tools/qemu/commit/7e3e20d89129614f4a7b2451fe3=
21cc6ccca3b76

I don't have experience with Cocoa programming, but apparently this =
recent change is not compatible with older Macs.

Any suggestions on how to approach this?

Thank you,

Liviu


