Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AFB38682
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 10:50:48 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZAaF-0007La-0T
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 04:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34203)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZAXO-0006q7-Np
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZAXL-0007QZ-Vb
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:47:49 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZAXK-00076g-H0
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:47:47 -0400
Received: by mail-oi1-x243.google.com with SMTP id w79so885661oif.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 01:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ROmuIlKZOyrc7ZxNO3UhM5JdY/y4BYY1WCaJZ2RVmjY=;
 b=L2CrLIUYkZmFBunjbIbpAMWoIAwJCpOoTMXf2r+b5oKPjBqR5skV+E/oHe4M4RZRQs
 qcQnZKKe3Jn8sCF6P+k+bRJBEJsuhRdma/ZLUsoSUsDxmhdMYKFWwVk5jKzPW6bn9D2y
 p/FsMZaucjw1B1g0p7sw1xduG1iJnXzdwn/HAvshfgQ+6xBlgRhqLM6QeLb+D5FYMNRu
 oo07h04bOgI5w4OGuJudVBoI74mG/fHxAezpFF+yZGCNyTtlA9ANIeiqW/U4cz5B4SU3
 yrL+ZgCJoQsdMiNulDnPPB6ptvVCFBarGHkjD1z1jVEomvwlLHFhInzXIwaFA4f8AQQ1
 BUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ROmuIlKZOyrc7ZxNO3UhM5JdY/y4BYY1WCaJZ2RVmjY=;
 b=U5tb8M5dlOnVXXNZPTAxM4UcflY4Gdo/QPIAD7bU5IOA0iBc7gVCU6r0sOmDGnLb2v
 vVjUPhQRwYPQujFbAon2OiahfLy9yNAxZDQe1XsQq6/nm5Su1aFjE3n8TJWL2d5go1Y1
 4InzOqdbzpG29woITv97AaPLSA2L7icgr8Hj0ZSKEe3WcnBOh9IuNHXMH0DoZiUnUOLt
 URPRZi4mN2jcGCOjBLjcy2XT13OVuFDXci5ixz56Vai0T9TKnoorQ1R4KJrThLemEqrS
 oLtVO71cCNhFRzfwAdfA3z83QpnXT1xGZRwy5o1yNByvGnMyOUW2wJZig+QP44z2ux89
 ROjw==
X-Gm-Message-State: APjAAAVBB2hEHU2CIna500m6VXlvzX3ijOGIry0zWhN+bzFPH+0HOaNt
 1hr2k6SlAfKhVAlRTm61xtvlvfWaRiYcF9Jg37ddJw==
X-Google-Smtp-Source: APXvYqwLmBYktMQ+rGPdDAAmIMcoqnnfqsfPYX7tW2z7eiA0SA0eSDXlRM2+rfO+n2ui2rN1jLRY8xpOo1AdZEvYbKk=
X-Received: by 2002:aca:b1c1:: with SMTP id a184mr3099091oif.98.1559897260144; 
 Fri, 07 Jun 2019 01:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190605145829.7674-1-marcandre.lureau@redhat.com>
 <20190605145829.7674-6-marcandre.lureau@redhat.com>
In-Reply-To: <20190605145829.7674-6-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 09:47:29 +0100
Message-ID: <CAFEAcA8871Ze7-=vA9Z1C4J_85nE=qWgi-R+wuzc1yejkuKvsA@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 5/5] vhost-user-gpu: initialize msghdr &
 iov at declaration
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Jun 2019 at 16:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> This should fix uninitialized fields found by coverity CID 1401762.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  contrib/vhost-user-gpu/main.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

