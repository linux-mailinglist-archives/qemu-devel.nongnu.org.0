Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7FD6DF839
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:20:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbJD-0008P4-1N; Wed, 12 Apr 2023 10:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmbJB-0008Ou-6C
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:18:49 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmbJ6-00061G-OP
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:18:48 -0400
Received: by mail-ej1-x629.google.com with SMTP id gb34so29432519ejc.12
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681309122; x=1683901122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kHYkCmrvcWpq1Fm9l9g3xEyQDRiRJRPPS2bTF30PgDQ=;
 b=gdxVpPMxuisC5oHV3bVKuXgQjyzFhr+ulDUq6eAah5nykmHaD49qncta20HOtpHNR6
 FHIw0o26Z4QNd9GDxHv5vrlAARxcM5Y8STAJf9w/jd5Ws10rllnVazTxAM+DUcsF6K6g
 ebHbwL1tPgfKc91cOclaQpdFpYWl8BsehQ195hjnPvleNHfneRZ69fj8PJY6JEBcuHDO
 ueH6ct+m2M0/0WCxwRwdy5WfDHGF2lhSBodfcOfqGpyIbdb83nK+UXwzfjGrVQA5iNmh
 kQpxMgOEQ4HZyr/29ewyX1Xs4TGdwr8dI+/COsuyHq4o2DHPfhfvJSpFKTUTJGVSm+vV
 oBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681309122; x=1683901122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kHYkCmrvcWpq1Fm9l9g3xEyQDRiRJRPPS2bTF30PgDQ=;
 b=eeSG0W0v9C/lWp8U8lyluv9SXkJGLVAX74yRwy++AGaWVb+fvRonEtTmEWxkIeBYAW
 DQ/WQj4IKsAJOYPlIuVWwZphV/xt0Sev6jS9ydfggPjW/ZzP/Vt0Dt0hH/cFwvQv0Rno
 L76xYAP2RsXK0lLJCrgF/isiqh5BqiqZOQIEcUumhN87voOAn8AB39SLUeoo6aXXJh5a
 uwjJK4b5Pp2TTIx2GzDIUgA0Fyi/fwTp8SMv5q4y5h0rRev8SBB4UQ3tajbx+rJ6k7+Q
 SAIL+tus6GEZF9sAXGaNv8vI5zukyLXNMkAKKTxaL9iMzTQ1nMazXgi4wCAwSfLTkAke
 o6kA==
X-Gm-Message-State: AAQBX9d2mEAgqcGvM9EeRApAmJ+rjsgVEsAY4+vOAuGfyJHh9J4smJvY
 5lMHV28m4ZD3pb35RdcywT5eLExSQ0S8Iuwd+RDtnw==
X-Google-Smtp-Source: AKy350ac4UUB0A+bKbqYMNFeARMv2k8fxTH3fEYIL/jlB2uIt7yjxbHqkFNqMswP40iMjPIZw/T5YHI//0PftZu5HQg=
X-Received: by 2002:a17:906:a982:b0:92f:cbfe:1635 with SMTP id
 jr2-20020a170906a98200b0092fcbfe1635mr3416920ejb.6.1681309122532; Wed, 12 Apr
 2023 07:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230412100436.94038-1-its@irrelevant.dk>
In-Reply-To: <20230412100436.94038-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 15:18:31 +0100
Message-ID: <CAFEAcA-fBeL1wWxk8W-FL-irr5YFaRrSLrJ1AaS0Wwb3k6GQXQ@mail.gmail.com>
Subject: Re: [PULL for-8.0 0/2] last minute hw/nvme coverity fixes
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Wed, 12 Apr 2023 at 11:04, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 6c50845a9183610cfd4cfffd48dfc704cd340882:
>
>   hw/i2c/allwinner-i2c: Fix subclassing of TYPE_AW_I2C_SUN6I (2023-04-11 14:13:29 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/coverity-fixes-pull-request
>
> for you to fetch changes up to 4b32319cdacd99be983e1a74128289ef52c5964e:
>
>   hw/nvme: fix memory leak in nvme_dsm (2023-04-12 12:03:09 +0200)
>
> ----------------------------------------------------------------
> hw/nvme coverity fixes
>
> Fix two issues reported by coverity (CID 1451080 and 1451082).
>
> ----------------------------------------------------------------
>
> Klaus Jensen (2):
>   hw/nvme: fix memory leak in fdp ruhid parsing
>   hw/nvme: fix memory leak in nvme_dsm


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

