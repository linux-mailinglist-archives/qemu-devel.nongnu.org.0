Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA382EAD55
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 15:27:22 +0100 (CET)
Received: from localhost ([::1]:34618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwnIv-0004PX-Fq
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 09:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kwnEi-0001ZS-Ke
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:23:00 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kwnDm-0004lF-Mc
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:23:00 -0500
Received: by mail-pg1-x52d.google.com with SMTP id v19so21337102pgj.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 06:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=o+8CtLsrrA9F6e1MT3gpT6VRsC73iUSgLVkaZIUQsK4=;
 b=jbCF7TAgQ/zw6HmOkCSI/gSu1BvQyB785U6ppJjb6Ihf94e+6DEcVXrakYT0YPMIBX
 Vd4labfkxRVNELCrGPa9ZIGXqX56clEzfgp+TsR/YJIhWBmsQzr1LAhlMHkrUoG8WXaD
 E5P7IDHa0M5Gy6uirABket1WRLprYEb3YvKRGfpSCZip/Yw27ShigUMrz7y3kq8Nlrbn
 HMWaCGdlZdeJ2sb/x8xRkQSpSQcF2X3BuYSevkDSVP/utVCTy0dATsy+yB7bjf5hofEj
 5TKrDmTTyEuFCf7lKhBbI3B0GVBqAsh1VfODgUvjicXQfyCqlJfZ46gkdOOZhAll0Ku+
 Lmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=o+8CtLsrrA9F6e1MT3gpT6VRsC73iUSgLVkaZIUQsK4=;
 b=ddOvWNkz0HMc3Y/T+2xNl+88bTCcFKGgT9pLj5Rv2O9eMtcdfu6EEcvIh1n7lVBS+k
 WkVqz783XvqxS6l4KUrXhzhpzqTl9vwIIQISwENdfm6dT+ns4/HOpMfiYXRlzBXuAYnT
 ssjMSt7ey1UkXN6kM78u5PnhGJ8DHh+CahvPbFLJt0zBCM+drZxyVu4YcSTs6FveP9Jy
 2VQxh4E6C4h4I6zKJUgFRW67cBUQvM6XtLQyr5RFVNNTqz90CghsFYgu2IzJMsfCaDqr
 ntFtn5Y+kzF5K+e5ybZwstqPdNZhwhYscM70H+VRjud7AAXzsJYqo3UaV5Yl+R+7TTW+
 VN4g==
X-Gm-Message-State: AOAM5337uqKGHDKXieRRkYzo9u+tLipZa8Nj7MN/ULoZwQdLZpVkQQxA
 3I20n6BAlBIwi3rTtDWWMVHXt0KheA2ZHmuhuTB2efuCa8xuGw==
X-Google-Smtp-Source: ABdhPJxX0Z4l7OW8Ij/oCmudsOiA61ec/bIPRotRUWOckunR3FKa21JnltnlgUS+nBDKm9KJex68iNgFSESe9vPg/Os=
X-Received: by 2002:a62:6047:0:b029:1ac:6091:cf50 with SMTP id
 u68-20020a6260470000b02901ac6091cf50mr64989443pfb.40.1609856519885; Tue, 05
 Jan 2021 06:21:59 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 5 Jan 2021 14:21:49 +0000
Message-ID: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
Subject: QEMU hosting
To: Fosshost <admin@fosshost.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x52d.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,
In November you emailed qemu-devel asking if the QEMU project was
interested in exploring hosting with Fosshost.org. I think my reply
may have gotten lost so I wanted to check if you have time to discuss
this again.

The main hosting need that QEMU has is for continuous integration
system runners. We are particularly interested in non-x86/non-Linux
build machines and a dedicated server for reproducible performance
tests. Just today there was discussion on #qemu IRC about how to go
about adding a macOS build machine, for example.

It would be great to find out more about Fosshost.org and whether we
can work together.

Thanks,
Stefan

