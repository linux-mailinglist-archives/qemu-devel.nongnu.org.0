Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01E5FBB2D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 21:12:10 +0200 (CEST)
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiKff-000585-8w
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 15:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiKSr-00064W-PB
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 14:58:58 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiKSq-0001Op-DL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 14:58:53 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id r3so2860475yba.5
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wAS5X5CZk6dFU7ryKt7IK3EPeBLCjXvSSOuGa7eqjpY=;
 b=Hdor8iHBkWXY9AcAIMsueVuXdpVO3PskdSRW7Ts9u9P9JYmDnIUNysCLpMUhtRj/vt
 v7RcaF3ufkMQ7owZXu3Wi2eI24XxMOYZzvWKlw0lP6GeO4ECohEyvVGvHhWRIe0GgZKu
 5NH/UlL2jznJBLX6a7wT04y6zITC/V01fXQXYhUZV3ppbSek/pYFDvtpl8unSXBEmIqB
 k19BQCOkRmqv7rto0jlTSRf61NzyuVnuiyjFS+dGYzcwu0Rvh4j+IiiIkUB6i2lho02b
 lg9sMAw1D24ww6htWcesSBz5vcXGdYMs6ZgJvyzSDJX/08DMm4GqlYIvjYQORTJSAJjO
 vH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wAS5X5CZk6dFU7ryKt7IK3EPeBLCjXvSSOuGa7eqjpY=;
 b=Rq2ndU9VX17ZTNFN5LT3mZJQpRj7CQed7AoM9e1uOe3RtRVr+Ik1ekFoGUbjrbizij
 djiV1iLJA01D4kzrmpx6yzSolnHb5Sn2AoKywdXhDILJ36HCGRo8ISsVnrCa6/C7d8L0
 bS/IzRQygeyEYHjKzyA0UsItkN/3AW1ZQI3Unlz1Bh3YNK2DOaEuVwHM3fAVlh7zL72t
 WbjpfN+9IaZF2cVAFj5VvCbVFpqNh1ctnygVzM7HPEcb6IzPUh4Uy219wS/vE21WEgkk
 s9mQYtq1xF3co//BhtCJ1WMwCNvk9cD2Uw8uabnSnQYHty/+MXf1aSvdzxD5Y+/Zt3rP
 L7KA==
X-Gm-Message-State: ACrzQf1NSF7rhVclqMdhFrjd076PeyEDyNQuw8D63f4s1U4+u/e6LDl3
 6CEHALHo+mwT6PcOmET6wMXp6Z+tsvYWwlgiGx0=
X-Google-Smtp-Source: AMsMyM7YRw8T1KqYNdBZMSBWQNUbwLLcfi231iHZ/eWRv+qTnKokVzyAoyFeJXMOxKztAigfqEepOn0JFa0cFpNnEso=
X-Received: by 2002:a25:4883:0:b0:6c0:7938:5b4d with SMTP id
 v125-20020a254883000000b006c079385b4dmr15447569yba.537.1665514731445; Tue, 11
 Oct 2022 11:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221011113417.794841-1-alex.bennee@linaro.org>
In-Reply-To: <20221011113417.794841-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 11 Oct 2022 14:58:39 -0400
Message-ID: <CAJSP0QUKNXHqjXRh5McFVZ=n5wO5HVzBbvbc62gS7ggYYMvOwQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] testing/next hotfix (revert bios build, mingw)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,
Please send a pull request and I'll kick off the CI.

Thanks,
Stefan

