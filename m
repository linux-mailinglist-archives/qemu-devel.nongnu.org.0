Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5C1B5C95
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 15:30:19 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRbvm-0006Ev-DG
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 09:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRbu1-0004e3-Sw
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 09:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRbu0-0005IU-Jy
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 09:28:29 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jRbu0-0005Hl-6Z
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 09:28:28 -0400
Received: by mail-wr1-x441.google.com with SMTP id g13so6838981wrb.8
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Ob5lWHlYUGqDFbRPyQ599NNzTgYbKRX9hVCEA7TzzP8=;
 b=tQra1m0UMWNYQgnCvo9KxLsy02dbaTdPLMXaQbv1KJDlWndB9rxkIsVpyVLzVFEK7Z
 LbW2KmXnQm4XswF9Y6OO0xVUQilVKQyiFysJkCER4ETGw7tSw3aMvIgYc6A2mVk9uBln
 QMFI45uo0FE90TWCaYb+7NJSAKcBfD7faqQ+EYC9i3rHX2Q+4g9vTD6j9R0VlhBykrth
 3E2MafWz/6dK9IRkLsqlpNyPSlZIgYR0RIF8x7V7xhajJFigNCBqMpXQSOF62MiCM7an
 vweC7qwIipA51ERR1D5gfdiRvPK8FEcEKpSzsnjWyLEyUGltIQpFG5VdprSgghVKjorU
 jOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Ob5lWHlYUGqDFbRPyQ599NNzTgYbKRX9hVCEA7TzzP8=;
 b=gQ8djfDEEodc9DfWIED+OvgB8Gli2nbI6zWBYd5CkSQZtW6LBguD2Z1jcTBudvNiJl
 GzyOjd82sys6ZBvwpr1E6WnY1FTBueZ9DOfD9DgTMb87QR0uPDEyzAD9Rpg9S1nB0+sy
 FISSjSn3tfnJWFPPn+YK51I9WysFsXXzqsiq+wB1iSe0o01HWl2anKjRBniod/7eiLzW
 HpB9E+CrEfHPQuO2KCEAZr3qHYbbeCUMy0RtSdAvO/iCdplfoPSSEdp2NANz7ouvD6Lt
 kvv9CXWJ4aGfkieK4KD16hl2bcGguqi7gQuhxKfGWHGDfxQILFqpGPkoQPqDCZSp/EHv
 cqKA==
X-Gm-Message-State: AGi0PuZVfC5oDleHf+yYzQ4/wOmrLDJATAGKK/52onXN1/+fU8VF6flT
 jUaib8fhxFrCZOkbAFw41l8HBQ==
X-Google-Smtp-Source: APiQypKGiH4u8ZFUe6CK67/ZF6Gm+HltX9OdqKmQXYOvX+rfsZkDjQeBXfu3Lij5ykrLCWJM6jFILw==
X-Received: by 2002:a5d:4248:: with SMTP id s8mr4878858wrr.216.1587648505970; 
 Thu, 23 Apr 2020 06:28:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm3508054wmb.16.2020.04.23.06.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 06:28:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12A471FF7E;
 Thu, 23 Apr 2020 14:28:24 +0100 (BST)
References: <20200422011722.13287-1-richard.henderson@linaro.org>
 <20200422011722.13287-29-richard.henderson@linaro.org>
User-agent: mu4e 1.4.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 28/36] tcg: Implement gvec support for rotate by
 immediate
In-reply-to: <20200422011722.13287-29-richard.henderson@linaro.org>
Date: Thu, 23 Apr 2020 14:28:24 +0100
Message-ID: <874ktababr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
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


Richard Henderson <richard.henderson@linaro.org> writes:

> No host backend support yet, but the interfaces for rotli
> are in place.  Canonicalize immediate rotate to the left,
> based on a survey of architectures, but provide both left
> and right shift interfaces to the translators.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

