Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475293E3583
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 15:24:24 +0200 (CEST)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCMJK-0007Aa-L1
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniestopage@gmail.com>)
 id 1mCKbw-00023D-KC
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:35:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniestopage@gmail.com>)
 id 1mCKbv-0002kb-AN
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:35:28 -0400
Received: by mail-ed1-x531.google.com with SMTP id b7so17080642edu.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 04:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kkaXyZKUHYW6I48ohVZia25gefzJAT33VBpIEAlrGHc=;
 b=eFxOsccEBZ69bARRmZ6mCa9sAwYF13E87+0VX2CJQBSQC7VVHGdiewc8TfSgaLhWDt
 2NxuVGuYQ6cAy91mteP/FXdWPu9Le8iQGbvYFaBmQMHAurzsEshtdGY5yL8JnKlLy26S
 N/1dADieeynFPtRcz9T+UiEcMyI/IYzv8bSLe8x/XCbWSKeu43O+LjoachXoXVPDQJ2B
 Vn1TZTEIsahl51Fx1FMIrIoWpcuZRWyfwehHc7LBjXRBUgiy8E2od1SrxjwOkFuQov7u
 KeEHp6tZbJPFDoGK9fMYPjZytJGtvvWJhzaNJiQyeXxXF16S8ZlbtsgcOZFsVQJ7CqKj
 n0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kkaXyZKUHYW6I48ohVZia25gefzJAT33VBpIEAlrGHc=;
 b=cp+pxMSYvVXgo814nDbFE5YDNY8vWy4i4PP2dhcD4kLDO9LcNaAX1rBHl7MqZ/t08a
 0wFcEiAx2h8dsyXFDjA0bjM3/JFDS0zXH+/xwOGhLhtMKRvp1qnma0/yoaY+S02oa/Kg
 YWiPdH/Mx4GRymt0mttRbZ0sXGMJ7NUzVaKtpJhwsnBAhIglwa2N2Ea5L998/xu4Xagq
 sERQjr2xGkkUEvyGP2vkQo+wYgMAShmf2MLDf1/QZiu3YlB/fFKC9G+YuxX/YGiFL+7F
 rVPXu61UvS+qrf2JNnLx+9J1PguXuNMRxUJXcq/f7lEmD78cA3/H1GteUuQIaccJKh0Y
 QCfA==
X-Gm-Message-State: AOAM533ze9oBnV4thpaE105mWRJD3y9FEq7VhpdWN/9gIDcKoEsVx+fE
 pRHGp0QuE3LjHj0wcIR3Oo6pJhkuF0OuWcYJvOUuPN2w
X-Google-Smtp-Source: ABdhPJyEabsR3bgLF+S+noMs8KPvMGt5PH0KwbDOhEJbnW/iCssAfQKGEzrVjX4Q8rmo9JAM7JjiajEYoDUhYndtUds=
X-Received: by 2002:a50:fe07:: with SMTP id f7mr18007698edt.334.1628336125126; 
 Sat, 07 Aug 2021 04:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:2a52:0:0:0:0 with HTTP; Sat, 7 Aug 2021 04:35:24
 -0700 (PDT)
From: Daniel Page <daniestopage@gmail.com>
Date: Sat, 7 Aug 2021 15:35:24 +0400
Message-ID: <CAPDXc=G5J806RNxb=ZQKRsze3gvVTs4p6YBaGiLgkd03msWDZg@mail.gmail.com>
Subject: 
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=daniestopage@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 07 Aug 2021 09:19:46 -0400
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

Is it possible to increase and decrease ram, cpu and also limit
bandwidth speed without shut down the guest?

