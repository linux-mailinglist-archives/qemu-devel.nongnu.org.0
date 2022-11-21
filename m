Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDC632EB6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:24:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEGG-00044B-L3; Mon, 21 Nov 2022 16:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxEGE-00042v-0p
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:23:26 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxEGC-0007yE-4h
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:23:25 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id k84so15116890ybk.3
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b2VVjcKdWDDgmb/V8Ww60jqQHAnwvkl/XzUuJsFg2jo=;
 b=iZqWmAPoKONMhT7cFRbQWs0N6BBdcvw+ftI/MxePbLSJJ6oziLh8JFc2TkjCXhGiI+
 yMdJlE7/amsdks1ZOP3+WMeuoxV0DJA9B/jXaROo1NxCBSpGdVixJCiLxFYukgAA9CbW
 FFMbVWcsirkFcRQWjG6dqqNQy6MPDjCBF/tGlZbfr8pTRd88AP/aGVIqF/FCzj8U6xWG
 875RO0fQC1HT9aLL7jkSW96JIsGkfA0KsLFsQqshr9cJOf0HRc4E5XdhU5a3kW04dXsk
 6LHgrWFOUpwIzlWoT/eeCG+t6O0yzVQSOlxZ6RI5iwEL/JXdIcOKLoPqfzgibvqSWTI4
 9UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b2VVjcKdWDDgmb/V8Ww60jqQHAnwvkl/XzUuJsFg2jo=;
 b=bRhusPt4OlOdmdQOHt8uOhZoco+keo2jo8Wa2r38kYUlksUz9DLjfNDztFidByMggE
 ri+2DWRIRUO4B2Zjtxc7w6VZ1xsl4p84HrS/Q0ZttbiX6NfdFiIrYRohQqxU4OPeZX2c
 poQWwepUWXuphSfPM1QZ2CN8ZURWrnYMgBAbNLG4gB1IyV/C/jNmWahcFEu8nW38qRX/
 iPKx6469EsYSORvnfn2WE4KG8DGXJEgelPaJ1AMV9kSwM+k7nlfRZbOJCGFFxwDwjRFV
 lQAL+y/lQpxqIqtPdpEZN4gu0Ws4QBUwUclqwQd4TqpvbSmxqHykHXeMLVKNLBZRPA33
 egmg==
X-Gm-Message-State: ANoB5pl3BhB4/c5cIM4LXL/foQVKvf3z9g/dZQpl4Q12I4EU3+h3xZ0a
 mU7vEU9QhEVf+u5lf22cWq2IKLxR3M8L9dirGW8=
X-Google-Smtp-Source: AA0mqf47DgCRxnawWR2/oWoZMu1rgRI2XZPGlLjrZ9wQbeDpAAYnQQUuHr9d/BFPoylA/8T50jshnRcgLVSWB6Dl2a0=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr4590761ybj.58.1669065803008; Mon, 21
 Nov 2022 13:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
 <Y3ufQyGAl4ToeIls@fedora>
 <CAFEAcA9WASG7aeAGsPZKmoncBTKkvzjfyrpbTgoZWfxacVbc_A@mail.gmail.com>
In-Reply-To: <CAFEAcA9WASG7aeAGsPZKmoncBTKkvzjfyrpbTgoZWfxacVbc_A@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 16:23:11 -0500
Message-ID: <CAJSP0QWABRHddaPqMwvdjYPtEXty8BO8-CUNq7vRJ+3E4RPikg@mail.gmail.com>
Subject: Re: [PULL 0/5] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
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

On Mon, 21 Nov 2022 at 16:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 21 Nov 2022 at 15:54, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Applied, thanks.
>
> This doesn't seem to have reached https://gitlab.com/qemu-project/qemu.git:
> did something go wrong?

I forgot to push staging to master. Thanks for letting me know!

Stefan

