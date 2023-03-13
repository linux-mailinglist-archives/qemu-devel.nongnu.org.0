Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A76B7362
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:02:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbezk-0006lF-Km; Mon, 13 Mar 2023 06:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbezh-0006kV-AA
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:01:29 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbezf-0002HB-Kn
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:01:29 -0400
Received: by mail-pf1-x42d.google.com with SMTP id o67so590197pfg.10
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678701685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=42LaIZMeOY0xTGjXGQnM2JALAz0ek/5a9XgmCiOvOa4=;
 b=GEeXBi/ImkjDc4hYcSIYhbNtcxoz0aDqsQytXBnEfFwMAxrOdR6XPoyDQmI1liIvE5
 H6zJuvup+Ug8MCy5PF8+fzTmpcTdHjv8byfcThWRVqpquyYXQhMXMApV8uSFWjOLi+Qo
 ywtBifblqpyC5MBJUMmk6z//k5d5a215R9DnrtzAwo9cjX4qtY3eRN6yYzblLAzjo+L0
 fhDfy59hsObEzI3lvUiulJ2YFpK/CBB9nTo1rDH4347Zr9m8CdP3sbrK/COGz048taae
 gTLquV30PIvMJ7dm3AcYSWpefiXfG2RA7dciZkvCmNH+1nPrna6M9woJdAcTHRVh1nNR
 yu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678701685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=42LaIZMeOY0xTGjXGQnM2JALAz0ek/5a9XgmCiOvOa4=;
 b=WmJP7mNWMNzAEh5WJtxNQEZ9j3mbnfksxGYsNizw5mMiEv3lPQg46Qdurql3As5jv3
 /VQ/TFkovhByqVQ8BCvsspYLxHqyhazh7gLXszo4X0kRerozujkoiCeKrvu7JXUlzT62
 +0q1t/HbXrahpUV74bRgIEryA9ZGnkGvjk9LPWnYFtAr9CsNoVJc85MPVmm9GyWZXqYB
 NLccpVXihNfAufnASNX4rNK82hzDLOfXTfvLIf2TD0dzcFuBeRDavXY8RvoYr6rzk3jF
 uu1XfxZ3Fx+TdxqAW7qJRQT2nJAk1cjqc/2+QFj4eyuFyMZb1/O6m4xRWCAs6e2OndoD
 3lrg==
X-Gm-Message-State: AO0yUKWxxQQWh1cgFiGSyJH/w8OrF5k+gJGZN55ar9D/WratLNwWL1uF
 5u1CD9EHjxlHWgcxe7LlunDII99gUU3fBwlhqIZ1jQ==
X-Google-Smtp-Source: AK7set8E4xeer87PsWpAkGBpgOWm750y+evCdmaK1gfwa5Fda2m0DKh0jGWPQTBocl/olI71SI00D9CVKg9Cb5O2/1A=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr11541370pgf.9.1678701685022; 
 Mon, 13 Mar 2023 03:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230313002531.53161-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20230313002531.53161-1-wilfred.mallawa@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 10:01:13 +0000
Message-ID: <CAFEAcA-ro1h==JbPzE-Hi3QAig7xRgvkh+Wfdy8zJXtSqLU=tA@mail.gmail.com>
Subject: Re: [PATCH] include/blcok: fixup typos
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: stefanha@redhat.com, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, 
 qemu-block@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 13 Mar 2023 at 00:26, Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Fixup a few minor typos

Typo in patch subject line: should be 'block' :-)

> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

