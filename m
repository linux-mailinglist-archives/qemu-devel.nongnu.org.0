Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730AB53C4D7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 08:21:50 +0200 (CEST)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx0gu-0008WJ-Uv
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 02:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nx0cx-0006Q0-Gu
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:17:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nx0cv-0001qB-SQ
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:17:43 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z7so8847464edm.13
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 23:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=paTXdYrcUBNdxi2xiIrWKH/ehVWsmnkAUYH3fZG3vnY=;
 b=Es639HS0I9D5rjBNHAGlHBQ7Twa21wz1cZjJjXtSWGjtTLAWBcjm0xvso1uXRW+E+8
 qwmx4bknZweGULfF4l/6V99cko9a+Wh/mtXp+OyAbvkYgvz4hV4FU0eQyoZ7zZvJMk5d
 /vntIsc/qV0thdXN5vGDuSTvfEqvSensfPSohto52OnK5UKusQ1lmkzQYyZqGBN1cbi6
 I1onXZ7UY/oAyBr4C9nnfDhbqXmKLDCX89TaLNlRkWvMLExR4sPj2nwSM+IJ/Hc4AQc1
 AvxZv76gKqWTOihowdzi5JwCTEsGMIW4jfcM1t0/YsWH3Ft+kZbDIa0XnxXTJpOKrSv5
 P+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=paTXdYrcUBNdxi2xiIrWKH/ehVWsmnkAUYH3fZG3vnY=;
 b=YLznHZZ0QfJUROMCMEVWbUUsRdeHJoxLb22VBI43vOE15UfPDKY84QHvv1O+jawkOM
 K4VONd0EKMCXfVgurUaJfM9umuMFq8XBZ7x3YY3wqif3mXJSACpgW25e7PZrP/lbo2Wt
 v0qkTbvCwOqRJPcxWXr1NVM2fNOLoqgp0Z/sfHm/yGZVRwGtytWJ4PRS8JpstHMigJaR
 1beRJTylg2GlaaopFS6vcU8QIXKkkSOJfk2tqNBBh1uzmnyg9mCNDmsbn8+lQfUJaMBx
 zOvvkHKzw/AxkrjDWZG+bnwfdLibjW7pN898hWRuhZ5r1Dh/dkQPvAlFgAbN1dAwkMG6
 TJzg==
X-Gm-Message-State: AOAM5312Fad/buQF1ki+YeuFt3kxSv4l4vTRQvJeIgOYmeQVy3J/hnV9
 0Rl6uA0cST60MXJ3XnSQvsNLgAPH9b64Uc8U
X-Google-Smtp-Source: ABdhPJxWxpV3Ap6DwcRrDyl48T68TVGyDRHkYZuqPU+3l1poqIySyDT+3Y/QDtl8R89098yb8x+NNg==
X-Received: by 2002:a05:6402:51d2:b0:428:48d0:5d05 with SMTP id
 r18-20020a05640251d200b0042848d05d05mr9238031edd.28.1654237060095; 
 Thu, 02 Jun 2022 23:17:40 -0700 (PDT)
Received: from smtpclient.apple ([86.121.23.37])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a509999000000b0042bd25ca29asm3457305edb.59.2022.06.02.23.17.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 23:17:39 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
Date: Fri, 3 Jun 2022 09:17:37 +0300
Cc: Peter Maydell <peter.maydell@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 2 Jun 2022, at 21:36, Liviu Ionescu <ilg@livius.net> wrote:
>=20
> ... SYS_HEAPINFO...
>=20
> 0x04000000 - heap base
> 0x08000000 - heap limit
> 0x08000000 - stack base
> 0x0 - stack limit

For Cortex-A72 I see similar values:

0x44000000
0x48000000
0x48000000
0x40000000

just that in this case the memory is writable, and the startup proceeds =
as expected.

Any idea why in the Cortex-A15 case the memory below 0x08000000 is not =
writable?


Liviu


