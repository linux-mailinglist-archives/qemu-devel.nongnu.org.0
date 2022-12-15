Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C738D64D953
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 11:14:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5lFM-0006y7-Pk; Thu, 15 Dec 2022 05:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5lFD-0006wA-4O
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 05:13:40 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5lFB-0006x2-2C
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 05:13:38 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 36so3828031pgp.10
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 02:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=huOyp4JhcZcP3Fx/1XvM9ZGqc0glQqqSTH2yUTMZaTE=;
 b=I2Uw7dXZpd8PNY1xfXzTsPDl3QX9Rw6POC6xd2RHals4szpUrqOpgfuUqsymJkJYjr
 62E9jU9tKSo/Ix/ZQRDhHtHWs+Jdx/ZIu1y+QXVggvJDxodlmtJ9IwJXPrGf/9PmHFe3
 lAiwnfZwUZospS+mtan1aypW7szo+xIa/M60s0yXw0iuRsOuaEmSXOZVsXAt31zEJeeF
 GRAlyt8lZW0sKghDyypjz1jf/3OUshAAX8zl7vK50seTyqpdRs9vUfNzlNCDCj2x1+AZ
 g8v+EoKKf7M5gwMf3nwUf+Pm8FQ3YmLqDeytGCrZzSGf4f/yt/4gsTEzlqmp5c6GkJs5
 4n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huOyp4JhcZcP3Fx/1XvM9ZGqc0glQqqSTH2yUTMZaTE=;
 b=h+jTKEPYN+zE7cxM0D4ENPLa9Vk7MM5Ih/ejP/srzRAyTjzKPw+zrP3pJmjhngAh0J
 Ht67UbHw1axcywo444Q7MR8UV/0DcgTtYM8RZRbU2e7VrDLPNxZAOu+Y4dX+xAsQ29Wt
 TSDKOVAfJTOCA0eWVs0F8z9cHjhjTG3zA035ZP1ZRIoWP7ckBZIzdY1orPmZOA93rcrh
 BxC8QJJUv+DhRS5cT91RxBWkHBclG68GUUMWrgNxko1Qr0JHfxOtU9GDpu/tHjunOBR6
 ey1a5P7+Xy0ZQ7cFH6rouZSnQ8PSU4AgRZ0rUYx9Na7faUo6hKZWOtnv023FzusinOmt
 oKJQ==
X-Gm-Message-State: ANoB5pm8hWHk6F8GFBDXkoRVpD6vAvWtfly9qZiGy7G31/n2/kq+8EH1
 VT6CZy7U/qVohkF4Qazz65tr6jzQMIEBt7M8zUsPZw==
X-Google-Smtp-Source: AA0mqf4BdUPiy91pLOiZcpbpPfzR0sJFwsVAGmYH55oEhZA3Y1pmeZGkmBdBMQei6DCyA5tdHvlkfTf+evUWqIoPgLk=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr79941587pfe.51.1671099215340; Thu, 15
 Dec 2022 02:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20221214191957.1100171-1-armbru@redhat.com>
In-Reply-To: <20221214191957.1100171-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 10:13:24 +0000
Message-ID: <CAFEAcA8echHnwmfDZB5A=vA8GiCGL0sUULkxbZP97LzgA9jwuA@mail.gmail.com>
Subject: Re: [PULL v2 00/30] QAPI patches patches for 2022-12-14
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 14 Dec 2022 at 19:20, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit ea3a008d2d9ced9c4f93871c823baee237047f93:
>
>   Update VERSION for v7.2.0-rc4 (2022-12-06 19:53:34 -0500)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-12-14-v2
>
> for you to fetch changes up to 5efb40d6571457c3cc35b7a91088cc2fceee5763:
>
>   qapi: Drop temporary logic to support conversion step by step (2022-12-14 20:05:07 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-12-14
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

