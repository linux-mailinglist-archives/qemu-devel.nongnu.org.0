Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F918632E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxE0z-0002Oe-Kj; Mon, 21 Nov 2022 16:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxE0c-0002OE-HZ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:07:18 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxE0a-0003f9-I3
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:07:18 -0500
Received: by mail-yb1-xb36.google.com with SMTP id k84so15072981ybk.3
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pLJFZ65K1JLNeVOTqsNXL3Z53xyT42aKUYHt2EY1/kg=;
 b=YCk+N1ULgAm9+GRwdhQNPSklFU/Xesdumv1OjlJ0P+G+viTofKLGCDjmGoHXAdfO08
 ChDFdCtiRON/S68fUtAotTaZAUHVzYaUcSfoYLwuc0HeLAuhJkBT+8JjkxnTq+fV3+B1
 lqUputj8CoY6DO8rApdEqjUaeX1qEnGt9QtGGDXDrmQKyTEt00z+ZxkV61BHEjo5jld0
 ABtjQU9U5JhdTwDH9SwS08c2AOvkcQvv0NhKkTPd6yx0Fet/+fV/ZWLmea+GO14LF4l/
 9W4WUubZFdDw1XpDX3LRl4MMP2r+j7OU8M5kOpa4rqy8OwbopEsE5QmJ8iRt3WHEsSXk
 XawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLJFZ65K1JLNeVOTqsNXL3Z53xyT42aKUYHt2EY1/kg=;
 b=IH8q1WvN+B4BeY6wPvr+SX1kF/bimYyGXm+AXUvFIaFQ+FTKB3zjJf1puF3/VJ9KcO
 DkY0iWKmoL37fZCOZ4LueN8TAH3BGW+TNop6f4HZE9CoY5q5uvzi96xmsiFFeTvN8GGg
 SlnbKJhxyFc/FOamwpJymPA6nvS3qNPxBKiQff4+xBfXrubM/qNqaqQpraQ11aDv2lT3
 f9FBa6y4rqLn7C2z6Lw9Q18vlcus/c4ZYbs/QRdbDrkK6D+DkWZe8vXajQTB1RT/WLAN
 fi7Z93Hysz/7I4vGZ/AftovxNhMYycJcFqkVL6ZSyopXcgv68xC4lieTW3oCwv1TDMcE
 1pdA==
X-Gm-Message-State: ANoB5plQLZIosvZvIsCIKoektARQmL7oueemRySWws7Njwm+pA1qpLy+
 yvZ6wqNRrhylDwoA6XFZYGKXOeLW/jrl0R1scMzlrZD/m6c=
X-Google-Smtp-Source: AA0mqf5j9Y5QsgRwEHIbYYLOtJAuolfLhY8gk3CTzWIGTaIhqD2Y91r6S1Ykc/85RxxuVqXF20LdJEElUPqUrzobfPk=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr4530047ybj.58.1669064835439; Mon, 21
 Nov 2022 13:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20221121194240.149268-1-thuth@redhat.com>
In-Reply-To: <20221121194240.149268-1-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 16:07:03 -0500
Message-ID: <CAJSP0QXC9+N5NsGEJeqxhGLpOFBTRDcWmeh3-pJMHNTaPaENZA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Decrease the amount of output from the
 qom-test
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 21 Nov 2022 at 14:44, Thomas Huth <thuth@redhat.com> wrote:
>
> The logs in the gitlab-CI have a size constraint, and sometimes
> we already hit this limit. The biggest part of the log then seems
> to be filled by the qom-test, so we should decrease the size of
> the output - which can be done easily by not printing the path
> for each property, since the path has already been logged at the
> beginning of each node that we handle here.
>
> However, if we omit the path, we should make sure to not recurse
> into child nodes in between, so that it is clear to which node
> each property belongs. Thus store the children and links in a
> temporary list and recurse only at the end of each node, when
> all properties have already been printed.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  See e.g. here for a log that got too big:
>  https://gitlab.com/qemu-project/qemu/-/jobs/3355901224
>
>  tests/qtest/qom-test.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Nice!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

