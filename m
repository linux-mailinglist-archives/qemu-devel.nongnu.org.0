Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38492563112
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Dcx-0003f4-3b
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DZT-0000oV-54
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:08:19 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DZR-0001Q1-Jg
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:08:18 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-317710edb9dso19229287b3.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 03:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AsZfsYKzLV6omL4Roq+uJiwVvcXFLYAjvjJ1lh33/Bw=;
 b=tghTcmkX1TCZjxW+68DK6FvZKT9KFqYdoYu8EcyKSDwEnoGbevI3OF0i1YK8sbLgr4
 BbIDmneHhWYjlBn3urkSpp7CmkChg4QXdlB/tKs5HhoR3YU0UrnUmhXycv8QD+RG/RIv
 LcC3CzAy31zxfX1UHHcO7i56qwMq9QNaRbgPe99OCJs23fwzmjTGs1Ki13E1nm/QKjpG
 MA9Kf8iIUIBfsueDW/RPfl3q27PuzBmUy3R8dqnK5MKBuCCbSAGzoEzSj9XsCazuXLPU
 KQtKzhHEYCOu1fkHlMbQ3fPh9eI37Zk6was5jK7zqudYUOYGqvLem+HpG+y+LX8Mimqx
 nh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AsZfsYKzLV6omL4Roq+uJiwVvcXFLYAjvjJ1lh33/Bw=;
 b=p44wZZrjmW4geXw65z7Ddug20YaB69fs9IHKtoLGMzbTVJgNodDxMHBIU+MOgMk1op
 mq8l7L/RTzL9FcsQoboWKKHT1Y0zLTL9r74KWb6P/z8WvjeHasL33JB0d+7llqyQWlh+
 ORE04gpQym0kVRQhMluPV6OrVulZkWOWMqg10jQw9DkGPp5x9R4li4pOAVO3rB+tTVg/
 K+d6VDKadMs/4milugH9/1wFl71AZ22RifHe/XtbVj7jUxuDv3nzga9xh/ChgxlM61PX
 RQWmq0HZpCUBTSHSu9tiBePezfU6kpEqkz5I2N0HJ7NFhquBjmKQkvj6xnlw1glsoDiI
 h9Iw==
X-Gm-Message-State: AJIora8wj5WiXt/9Jj6N9gL5RJaBanqMftYUM8xZXMd0zrL3amYc1oqG
 7hIKnkvdVMoXb8zNxfSsY4uCvOBkvJoXU0ayU810ww==
X-Google-Smtp-Source: AGRyM1sil7pLvAqyN6XaoQbiLA/OBplKtJjzrSnekDlxdDLkHLTgiw5JkZlKe6aIW3SG1rCFPI37OrlJr0XsoRHq3RY=
X-Received: by 2002:a0d:db55:0:b0:31b:71d8:21af with SMTP id
 d82-20020a0ddb55000000b0031b71d821afmr16553772ywe.469.1656670096503; Fri, 01
 Jul 2022 03:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220606164336.245740-1-kchamart@redhat.com>
 <Yp4wKGhyMtAj/Jx2@pinwheel>
 <Yp4xk2+JeNkZ5eTv@pinwheel> <Yr62C1611gbJZshc@pinwheel>
In-Reply-To: <Yr62C1611gbJZshc@pinwheel>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 11:07:38 +0100
Message-ID: <CAFEAcA9Qqs+zVVvjtuWstfndfU-=xQN_enbWgm2U7Rw4WvuSmg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rSTify a few more docs; move them to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, thuth@redhat.com, 
 eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 1 Jul 2022 at 09:53, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> Ping.
>
> Thomas/Peter: when you get some time, please have a look at this.

I reviewed the one patch that had neither already got an R-by
or some review comments.

thanks
-- PMM

