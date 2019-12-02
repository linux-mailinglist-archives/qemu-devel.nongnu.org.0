Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864FD10EEC2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 18:51:33 +0100 (CET)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibprA-0006x2-Ko
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 12:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibpq6-0006EV-Ie
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:50:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibpq3-0004Ed-95
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:50:25 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibpq1-0004Dr-AR
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:50:22 -0500
Received: by mail-oi1-x242.google.com with SMTP id k196so484644oib.2
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 09:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LLke+aMJ1FfcwyTfJHyrfswOXiD+fF/Kn6vR/CocLkM=;
 b=rUcXPpaDcVsVwkM6o30l54KRO8qM9CvgJCxcEg61zXwNiqRMCr0OOgl2txHDPSOSD8
 p7z+qfLKPHaMGP751bGDpYMvllOruUnHEudR9sHyVUq52NoJSxoW/RZ/A3/SLx+7g4M/
 ljdZo3LYjykMCPSUW/Dp5muNQuoK25ChRsJlRu8l1UBRMceIbejTYibrKpzUFle/c+z9
 k+ALWOJqDUvfPRu8mMY3NP2KjNatsf2lWIb2dUw0dUxEqFJDVp+E9Nd6BxDp/1qi3WU8
 /SgzLStlaFdpjmVblAqAK0uJzR7uK+gc4J0ePjPJ41wJGGJuFjBhn8oRIDhEjExleddl
 o4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLke+aMJ1FfcwyTfJHyrfswOXiD+fF/Kn6vR/CocLkM=;
 b=N4bvjkLjRU8vuCpySaBbUiI0j5PN4vcksL7EzrYRwLg+TDCYqOxiLEhTOZ+6Dv81yG
 Fr2LKwQwsAK63DzlhmM60sd54goDOU9Xo/n8fUsSCVvM9SeI5R9KdTqWrc07RlXAGrfG
 NQYDlDjjeQjI6NflIs5Ct+DbjLGmg0JDTNdqZ08O1YTTccflY+t4eokVxTgRbeQHmBpw
 FT0/dou9F+BZLzaNBWLW0CP5vqv01mRoXr2jaG4AlDaNi+bsN6eEdSYwFBzAa2YyfbnJ
 EwUObHgrJkOcOgAYfMmCIoeoQAUyeXnFLl03wOn77EC7fUoKMfLHDImEeLOnRUl2pDM9
 O5wQ==
X-Gm-Message-State: APjAAAVBeVEMcT8xBL5ZFlZgc17McA71JJHg9ZQkxxHtGyMxPNATwGnd
 4arGUe5dtxt34WbQno8T71ZstbHOAFaNoGD6GdzpSQ==
X-Google-Smtp-Source: APXvYqxSqF9nWGqFVq7SoMiA/qTJ59jmhq6A7IzB3WTx2VJYkUlI0UsAlsSmS6yt7I7FJCjAESvOgHC/S1hFXoqUmuM=
X-Received: by 2002:aca:3182:: with SMTP id x124mr204852oix.170.1575309020003; 
 Mon, 02 Dec 2019 09:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20191129140217.17797-1-pbonzini@redhat.com>
 <20191129140217.17797-2-pbonzini@redhat.com>
In-Reply-To: <20191129140217.17797-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 17:50:09 +0000
Message-ID: <CAFEAcA_Na8dWgCe1fbo8FJoYp0ehy2SDQv4meCPWfh6ukc9XVQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] docs: import Linux kernel-doc script and extension
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Nov 2019 at 14:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Import Linux's kernel-doc script, as well as the Linux extension to
> call kernel-doc according to the arguments and parameters given to
> a reStructuredText directive.
>
> The kernel-doc extension accepts a filename, which is relative to
> the QEMU source tree root.  The extension also notifies Sphinx about the
> document dependency on the file, causing the document to be rebuilt when
> the file has been changed.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Could you quote the kernel git commit that you did the import
from in the commit message?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

