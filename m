Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA765EFBB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRvM-0002D3-0t; Thu, 05 Jan 2023 10:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRvE-0002B5-L8
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:12:49 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRvB-0004UO-Nl
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:12:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso1206311pjd.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 07:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kA2IQbg7QjNFO5SX4+mDwkeVBtI/d3z9EsVDhVYfgIE=;
 b=RN+6aCKxljBaeJ0JfY9XC8DQvXlJIrcF+35R3LGG3VZtszabksuNo9FwwoZJQEot60
 XigkELh1wkhnsRw7CuFbcrn1PjoJ1yjY6jMZjx/SzV0HXg6Er2C5w7pURIDA8QBrJxOZ
 0kVcs4PYWtnpV+UcFz/xJ3MH3pZgheQiuTx1VYlM0eQr8nRLwVuQAy/BhcScvUJ6n7Sp
 Vpys1zm5P+J4a4O3oXGdqLj8mxCSxaOkwjnfHBffdzQL1abaMZoyy4ebMuYiIxCiatFQ
 J0O7LaO4lYVb1mqRTuwaYlrZwDcHoWeWH1Gb24OIOe0xrVtPilCLxIxIuZD4RAiWfySk
 YDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kA2IQbg7QjNFO5SX4+mDwkeVBtI/d3z9EsVDhVYfgIE=;
 b=TQQdkKgjcpzD/WqRplQi/aWNIeYOaYoGx6gizbTPgk4SDGpUfezv9RkGR0C3nrG2xu
 QoRTKxv4Ypnog6o/GT4S1wckRXq4OK7JpO8tFzNQI8Yxq8vFAxO6/nY+IKOIr19Fl1dU
 eLCtshjQgP7EPT0hTHjaa67afGHNwtXPnX8CeSUqGCFPFiO7qo6ofbhsdNtr3YhFj7YS
 Kx8rXdMMqmyrVXyUxJVfaz8RPEF561r1AOiUU8R9+f7DL35eq6F0ynrmcmuFZoRCN+Eq
 69ucI8b4S+7nVShNag6nGU06Pi9l8TDZbygUA+FOlYIFGTNWao+/0OSs33ikGRwwr4bS
 m2/g==
X-Gm-Message-State: AFqh2krbzWyrHM8S4tksW2ZNZM3/lMKPR2QevPTdV6kMZe5l4DnBIaNA
 ip7jpoaH7cTg/mHn3y7XkVhMOcNWMqY+OqZRWG7ofg==
X-Google-Smtp-Source: AMrXdXt/kkUe2k2rZIH2zWPBqKVQkt7r7OYq4EVui/oKXyZWl5+0Rs21jIw6yXK80vEdSACp+F5cFqU/TqS60bkDAdU=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr489064plb.19.1672931564005; Thu, 05
 Jan 2023 07:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20221226101418.415170-1-jcd@tribudubois.net>
In-Reply-To: <20221226101418.415170-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 15:12:32 +0000
Message-ID: <CAFEAcA_HfPLHtm55Q_Q1X5-SWFwwEbT-=97RJ4u-FdMCROQL3A@mail.gmail.com>
Subject: Re: [PATCH] i.MX7D: Connect IRQs to GPIO devices.
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Mon, 26 Dec 2022 at 10:15, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> IRQs were not associated to the various GPIO devices inside i.MX7D.
> This patch brings the i.MX7D on par with i.MX6.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>  hw/arm/fsl-imx7.c         | 31 ++++++++++++++++++++++++++++++-
>  include/hw/arm/fsl-imx7.h | 15 +++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)

Thanks, applied to target-arm.next (fixing up the trivial
conflict with your other patchset).

-- PMM

