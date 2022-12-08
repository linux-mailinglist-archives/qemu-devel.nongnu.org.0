Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1357647274
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IT6-0001iE-Pw; Thu, 08 Dec 2022 10:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3IT4-0001he-Tz
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:05:46 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3IT3-0007fz-0w
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:05:46 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3cbdd6c00adso17100477b3.11
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=ojrLEvRb9EN+g/J3WNY+HnZj5P7F6x7jXaHDR5nnBH+nDqsCUjhjDUmnk+QsHQ7UBM
 g14xCkx6cbeCqCpOk9CaXD/bHZqXoxLOT24Ve2Edh5B5JxuwfTU0JeVIIIbtPvSEKANW
 fwZA72YIkz7OP6190/JbVNYiR+gF/xchR0ztyP3cLCLcyYF81kd9Hu7eexbISry6Y3qG
 GjbX5sRKyKv5sliPrmU0qHXkNEWFn+8dgBXy8RgToC0kiY8fwNYwnjRhnoi3SNvXqO+m
 MfLmR1IAzksyaSgzaPLykKZArMHTSP507nDxQzZm2kAGLJxWXW4nWAJf4v6m6N4AviG8
 j9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=GLyskM8pVETgmxeGKe2PQgQ661RbMdoSPaXtzwZu3M09d8C0uTOIQczlJx4Tot4Bo3
 MVWMrlqx3LOPd6KoakRiBG2a9SrgURwJcgtAHwyM0POutOOxJfc9yuP7JQRTrMTkdsFX
 3NOMJ/iUEimEom/bRB2gTIwkE3kKQMduV4aYZ4U0JQGVxJCCwdO9oCYEJWX4dRsFEWc6
 cgTqqHJ+3v65eJ+6ok0A1AKfSBxEbFdbyuzgI7q61rMuxF0hR59rUVUzO/YcoNID8osU
 y3DJZhjrei1d0PtdS5Jnath7eJ0hxOQxts3PJVJ5RZIJCvb4oz5bDIABCJGowQwNmrjQ
 KZJg==
X-Gm-Message-State: ANoB5pmAcu5M54JiUqIGZ6F//mMmaiOkKAdG6VkltIUjG8sTG2RIA1H3
 kUk07vUGFyg7Hzl99GbgbGBtq+YXc27rDC80oq4=
X-Google-Smtp-Source: AA0mqf5ED3ESndQ/XpKPmOlYQmLuO66I8fByROOXeQ3VxA5yHziGoHoGLncWRJRdkknq1mPurCEqtd1OR9S68dwJjPE=
X-Received: by 2002:a81:3c7:0:b0:3eb:447b:56cc with SMTP id
 190-20020a8103c7000000b003eb447b56ccmr17841863ywd.296.1670511942772; Thu, 08
 Dec 2022 07:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-4-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-4-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 8 Dec 2022 10:05:30 -0500
Message-ID: <CAJSP0QUgVMNEdKPGf0Xbj6M9xbk1NOSSjwzyCk3aBejg6ZVYtQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] coroutine: Clean up superfluous inclusion of
 qemu/lockable.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

