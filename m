Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDD09DCA6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 06:34:24 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2TBX-0008Sd-Dc
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 00:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shorne@gmail.com>) id 1i2T9d-0007UV-BU
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shorne@gmail.com>) id 1i2T9c-0000fX-CF
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:32:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46089)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shorne@gmail.com>) id 1i2T9c-0000f6-6A
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:32:24 -0400
Received: by mail-pl1-x643.google.com with SMTP id c2so11122742plz.13
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 21:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uYaRaMAoPkaIo6FhgpfIV2ERhnFoG7qWppu9sSheS30=;
 b=kI2NJfvnNU5+8U4F/Own4fHoQy84Fgi5E3ZR2pmV3fVs5uD0huoIdbzDZKvn+CRGDn
 lOv4W96ABSUrCg9SXOHNqENatuoZ9EB6Oa18Vg6bAsDCmfyah8NahRHprqSoBlyghY/f
 fWhdTj++MlUIxxOKqS8XjI5+ldKl7Fru9GdORqnusdxNUcAVjAjxtAR07ttD8E66nteL
 A05rt/a9qO0Z+X1HzP+fLBGoav69c1Bw+bAWBBxm0zFOPTsjrr5TdkVhg/PB/aK/7oF2
 Lx4M8D6L3Kuglzwi0mMEfTOqNF5G8N0B7jTsEspaMFh3nO8QkB7cQJJupOpuZ6jBsg5B
 hhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uYaRaMAoPkaIo6FhgpfIV2ERhnFoG7qWppu9sSheS30=;
 b=NSjUZ/d0BvEeQvuNvFLJ+o6wQrQqBVhgAINezrpdUXZVaKck9oktgSBVWdFax2j+rn
 4F5fQBz+mWa8QZfD9sJtPDs6s+FtOUUxlfsDBERuUN2jUAACEYgkvIhLzHEKDDC9KI5D
 pWb9TY1msdC6zZLZgDkw6LGNw5XKWOC4VCGfcodmYJTl5/rteCblFUCY7nTYjpt08xTQ
 gDsY7bRVPi3UVoce8WSuhrkXwVVE14ZLjjXf8WVsZpei1m4+Dr6KBgBfaLD8CxNfJJ2L
 OkWaeZoFFElXN569UpNcY0oTqIZHeO4/oirxAp+I3cwJJhj1uTEvxu7U37ImYQHtgAJJ
 eNpw==
X-Gm-Message-State: APjAAAWCOMeHdz8j2rP/L0XdqHghjUE9IMQYtQeHWLiHRRURMkfvGJAy
 Lt8KIkgVFEvODICnRSFgFKs=
X-Google-Smtp-Source: APXvYqxZbgLAvx+mGAKYR+ZJYnq80MDYFBxa6/1d7Eiv8GGKaTkKCNsX5WiX6q0iMbq1d3eEEZe4Hw==
X-Received: by 2002:a17:902:9b90:: with SMTP id
 y16mr22129517plp.17.1566880343182; 
 Mon, 26 Aug 2019 21:32:23 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id v8sm968407pjb.6.2019.08.26.21.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:32:22 -0700 (PDT)
Date: Tue, 27 Aug 2019 13:32:19 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190827043219.GG24874@lianli.shorne-pla.net>
References: <20190827000745.19645-1-richard.henderson@linaro.org>
 <20190827000745.19645-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827000745.19645-4-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH 03/13] target/openrisc: Cache R0 in
 DisasContext
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 26, 2019 at 05:07:35PM -0700, Richard Henderson wrote:
> Finish the race condition fix from the previous patch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>



