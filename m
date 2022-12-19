Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92506650A23
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DNz-0006dS-Gj; Mon, 19 Dec 2022 05:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7DNt-0006bL-Rg
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:28:40 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7DNs-0008Ui-7m
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:28:37 -0500
Received: by mail-pl1-x631.google.com with SMTP id 4so8589601plj.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i2aC/vzuhk+uLN25hcOq3QsCK7IDdxDIe1OYL6mXWS8=;
 b=W2krQ1dcgx8A1uQNXOFxo/vKTJHpAjB+hsxb+kDP921x8nEjOHV71qA3ccid8b7nw2
 L08ErwSBy6jsF9M+zjdGtCbV0lxfXIT4vf+2oTuwvlWkzAq7rb93Br3VD33+6jSDq3Es
 rfGDY06CKV8PSCA8IpwgKC7iQ7LmvNDbtcZ+wGPFMNMYDq4OsLSH3PtuL7HKOlDMjRrl
 g3umGEWIq9lAJZqXe/KWKeFmqgPFSJcd0kHeIGfxAKH1Mpf3sJ3C2sLtrAM6fGPBxPqf
 /jZeiDCOKCIXqWj10FjaTARoGb1SltVSNX+73sNIVZj/JsPs7uWyAAjiHpTI8WAIkmnt
 thCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i2aC/vzuhk+uLN25hcOq3QsCK7IDdxDIe1OYL6mXWS8=;
 b=q280MroLBYbGaH/aB6nvvMQ8geHsAdu2HUIIjFxYp4fKdt/nKe+ge1grb0TfwPiknJ
 zctN4XqEeUUD3M36+Z9EXAr1+exWUrvkIYE5ENgTceFPzrAd7xm17OCRneQzyUHR+8g7
 NQq4P1j107wUpj49ODiianc/gO+Shx36l70RI1rHkEn2rv8saCnIzx6U1nmyCe2zR9KL
 t6zE1yNVN8sItuOqA8M94gypOEKFGOuSibfjy1AWHVcaqQ8Mx0MZSB7ZREm5k1tMYIIU
 nqOi5n+VTUXXGJco/921aPDRvikPpijZQ5euDHVEDxc8alSvRtjPCOA1Ek/0OIz4Xc8v
 W6Fw==
X-Gm-Message-State: ANoB5pmgO+TVrZo3S3t1u+CmDK9CVGas2c3ZlhZskgnwae7FlCXWiyox
 wInd0N2niizRy1/q3dJeMo69dW7wGKTtvFB3lKDNFw==
X-Google-Smtp-Source: AA0mqf7DIy5aB2NUvsAqIcktn/DxXkmOkLl4ezmTBI+RgnJmDLviWGqjSU/dmmx/p/i2YZ35Tl2ltcFlp29Kjkqz2fk=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr50448762plc.19.1671445712941; Mon, 19
 Dec 2022 02:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20221216204845.19290-1-tsimpson@quicinc.com>
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 10:28:21 +0000
Message-ID: <CAFEAcA-drLPfX-q7HT9j-b4CZYckzzht+akxvUsZjOmiS3D47A@mail.gmail.com>
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org, 
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Fri, 16 Dec 2022 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>
>   Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20221216-1
>
> for you to fetch changes up to 585a86b1041a45c3b4074440c7f1b54944570867:
>
>   target/hexagon: import additional tests (2022-12-16 12:30:28 -0800)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes. (In particular there is a section
of the changelog for 'Build Dependencies' -- please add something
there indicating under what circumstances flex/bison are now required.)

-- PMM

