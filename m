Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB177DF10E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 17:16:03 +0200 (CEST)
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMZPe-0006cK-HX
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 11:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kevin@koconnor.net>) id 1iMZOX-0005k9-Mb
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kevin@koconnor.net>) id 1iMZOW-0003Vx-Qg
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:14:53 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:35229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <kevin@koconnor.net>) id 1iMZOW-0003Vq-IV
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:14:52 -0400
Received: by mail-qt1-x831.google.com with SMTP id m15so21619291qtq.2
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 08:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YvLFI6gBj22y2SyO/VZQa814S4+GoFM8fLlp8mz+j+o=;
 b=NNs+DZQTD1DWkwxrJZeJ2OkHPMcXEh35OKa1p3Fyf0T2qHgs/ybyS9idyEuCbWQj1I
 p3UKP4qmFmUyvsaTpXsc5lRDf6yEz3YhnGHBQI+IWhh4HVZxbBaYtwhu7/Rast9U0vYb
 TwW7TtJlL/m3Xr3099VPIw+Jy0wDcQK6P1oY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YvLFI6gBj22y2SyO/VZQa814S4+GoFM8fLlp8mz+j+o=;
 b=D1YO1vLq1ebjHnkqzyGvRPwyYX0fKg9x14NXqNbxXYVHLfgaf5QsJ3JzqRjXgXVekt
 Iymv1dhVBBVvVQcNSQ2j0Ao+Xi99A+v0v1lkmp7FfGWIXtBcSDez6HGsPpHaDFhU4JTi
 kIxRiV4QjnYTbbWCEeOzs/pqHQKa7rJ7IQ3YY0D9pFxfTP63E40kmGbbTaHnEQxw8s1b
 /bkkJCn9pOg3mGiW78vFYAHncFxYS4k3bT8aAIVhGUkbzRsCUG/lgQeFNISNJDYS4NYv
 M72MwvnelB9bEn4RszFceVUY5tc8ID9oMYualjtaT+DZy5RAOzLHfDKtbt5xj6G3hmVr
 0RZQ==
X-Gm-Message-State: APjAAAVKVvS85MfG9Ojvz49MfCTV7Jxk9YuS1oevuGExxN4m4XsGfZGh
 BJmo/+JircCVPFaGkkZfssADyw==
X-Google-Smtp-Source: APXvYqxcTImFBXXHyJCCA3bdJwEFH2iin4clE9Rjwia43pjkF7k8WQob2mKzTghtKOJ8ddAciJV8IQ==
X-Received: by 2002:ad4:5004:: with SMTP id s4mr3499443qvo.87.1571670891432;
 Mon, 21 Oct 2019 08:14:51 -0700 (PDT)
Received: from localhost ([64.9.249.135])
 by smtp.gmail.com with ESMTPSA id a15sm7516908qkn.134.2019.10.21.08.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:14:50 -0700 (PDT)
Date: Mon, 21 Oct 2019 11:14:49 -0400
From: Kevin O'Connor <kevin@koconnor.net>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [SeaBIOS] 1.13 release?
Message-ID: <20191021151449.GA14817@morn.lan>
References: <20191016104412.ut3jxjwjf64qsjbk@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016104412.ut3jxjwjf64qsjbk@sirius.home.kraxel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::831
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
Cc: seabios@seabios.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 16, 2019 at 12:44:12PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> Almost a year since 1.12.0 was tagged (Nov 17th to be exact),
> time to plan the 1.13 release I think ...
> 
> How about freeze in a week or two, release by mid-november?

Works for me.

-Kevin

