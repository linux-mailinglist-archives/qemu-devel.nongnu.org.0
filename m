Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5F2FFEF5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:23:26 +0100 (CET)
Received: from localhost ([::1]:40624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2sf7-0002ai-HH
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2se2-0001jp-2S
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2sdz-00023c-GT
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611307333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aMGkcJx5mSf42jivw5AIpdcmSyB2KB7BTEQGkeU++Cs=;
 b=X5srWxuGDYBfrU24GrqwlqCuscd4cIC6eQ6FH6zmauKTHK6Jw5Z00Ou9d5FgMOqVT2RhJn
 OmLbX0/8S2cZdAqIcQ6zEKcXQUoPI8owHt4/OHf4sRtwArWcrrY/rqwaPr6HHJeLIEJ6FT
 nbo7TksTfKEH5MAK7RdrlQHc4DYcOF8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-8sDJXzmiN7q9YvZ5bhMZ3w-1; Fri, 22 Jan 2021 04:22:10 -0500
X-MC-Unique: 8sDJXzmiN7q9YvZ5bhMZ3w-1
Received: by mail-ej1-f72.google.com with SMTP id h4so1985142eja.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 01:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NSoWhSNd+1DQeFaV/WOiC7Ip9pnWIlPLEZwHrhqJFbw=;
 b=Fi3coRw2kTMVRK9P9mK4K7jCVwZpXYP4KcamV8HJyXr5GoOVNYhdojLo+9EgTu1WVA
 NMQk3zSQrMtBzlOUbWFv/ULGamc/6UmKHKJhaz42bmU6H+2Iid27p1W16bbu+CYfOs4C
 DY2hQr7lD3k356TvL1C3ZSz48S+Eo0aqvsd3L8ODt33N2YosiBNbdIHG63MPp2Hiw4PF
 lfxqW71o1UhuWsyHQj9pKzhgJGoQVeSDAPGVXSPJBtGHpQkkzrSFnqiTkZMd+qOgt46+
 XU93Ckv9PfmE5irUnARFIGhoAcsTNk6a0MOzkUEb6w5NsU0YkVnLkz1CvAIk6TOibZna
 QWiA==
X-Gm-Message-State: AOAM533WMEOfOIhOB/jtl72l4KNztexZC8cj1y0fhlEHjpxmtEURZjL1
 RrO4z/aX5n9bEtrPOLO8L4VYAZWbcnWoNN6BAo+WyD5psMPi5f8zQePzUOcGD3/4aY0djM9YTCd
 MoItiA/5Vw/bhWDFrjvlwmwE5UDpl/ZJ/b6/3YcJxQrHHqEd+V3XefcDJUMWOBGSg
X-Received: by 2002:a05:6402:2c5:: with SMTP id
 b5mr2638435edx.258.1611307328636; 
 Fri, 22 Jan 2021 01:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1XNUhnbCL4/WBImLzAID1mj/4cNOnAzZG/H3h1wx6Qo1Gd8DY9B72rHDwuG5dZfHuMcvofA==
X-Received: by 2002:a05:6402:2c5:: with SMTP id
 b5mr2638416edx.258.1611307328422; 
 Fri, 22 Jan 2021 01:22:08 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n15sm3917943ejg.5.2021.01.22.01.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:22:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] meson: Try to clarify TCG / TCI options for new users
Date: Fri, 22 Jan 2021 10:22:03 +0100
Message-Id: <20210122092205.1855659-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some new users get confused between 'TCG' and 'TCI' and enable=0D
TCI when TCG is better for they needs. Try to clarify it is=0D
better to not use TCI when native backend is available.=0D
=0D
Note, before Meson, warnings were summarized at the end of=0D
./configure. Now they are displayed earlier, and likely=0D
missed IMHO. No clue how to improve that :/=0D
=0D
Based-on: <20210121095616.1471869-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  meson: Explicit TCG backend used=0D
  meson: Warn when TCI is selected but TCG backend is available=0D
=0D
 meson.build | 9 ++++++++-=0D
 1 file changed, 8 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


