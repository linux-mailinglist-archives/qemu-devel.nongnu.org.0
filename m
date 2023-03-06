Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3C36AD1FB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJda-0007er-BT; Mon, 06 Mar 2023 17:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pZJdW-0007eR-Me
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:48:54 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pZJdV-0006D2-J6
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:48:54 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-536bf92b55cso211306437b3.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678142932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=lgadMa/yTA10SFocTid7F+EK71QIhGlAUicokqgcJOwjbg7DDEPFeeharAfNx0WNnJ
 fRQBLqBrgKMYGGWMWZdq+ldZswZr7StsigSEiSuOhtasesFvfP9VoXHJk2dgHT3UJipJ
 Pp7c2WvOV3zHS3SgxefFFoQO0dlLkg87xtdaQ+RPyXwvhjsoCXV9k/CfYK/yOgJR6Wnt
 ev0IlOhDLhKNJJTolKmy/xHNsOP1GxjDG7270qWIHed2GOX9Nz6/G86Cl8bzgsUSB+Ac
 VD9pyYQgoCEW+XEv8ll2LlxMF4ZjaJ0WvFmE7HW878WAbntoZ5YV0nYFakXLH2Ptsgu/
 GvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=5MQdlWckacTNgIsOl5+BdNu9oJnTQwrcdiHumcSeItOiUOlggJGJTCykKmz6lTfF3O
 uchKOr2d7saG+mLK71emt1ySjwULf78axZ8gZbepPZ2GNOfPe28NKgYSCuZOmdRVZ0rv
 JMK7GUQKGpOqB5wNQzp1+puW3CVWAQMM1MTZVmm/3c7afE4QqIzeQ0Xxicwa14821iox
 l0cos4Inxz9tyK2wS55Rok9gNfxZMCWQqMIWfEKEjmDfnFF4ObOpf0aHcWew+UG8ba4X
 HGWDd2fr4gK5/6NWpEdAwOg75oV0c2+Id9ncJVCcvjeoQsBZa3qaT0qAmk+cw7xEnxmd
 7qgg==
X-Gm-Message-State: AO0yUKWB9UmhPpW3IymQc+Woxj2HDslz8ZswfVxdYGW+ji9n/ex59nnF
 dF6mES5pk/SH1g/gkmLwGZdzrSvv2NYvGM4vMHs=
X-Google-Smtp-Source: AK7set+M2NwuW269aEzhNL5bA/ZsYY6O2FrZqWE5FN3fyiScckxw0W+B8hQYoLyl6MaVoCubV2Ku2K5zCR+goXXjSJo=
X-Received: by 2002:a81:ac21:0:b0:534:2d49:7912 with SMTP id
 k33-20020a81ac21000000b005342d497912mr7816734ywh.6.1678142931763; Mon, 06 Mar
 2023 14:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
In-Reply-To: <20230306223306.84383-9-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Mar 2023 17:48:39 -0500
Message-ID: <CAJSP0QVQjK_7NiqwBFKwQP7f_NK=+oWTBXXNMAh_D_VM5UwEdA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com, 
 david@redhat.com, stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
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

