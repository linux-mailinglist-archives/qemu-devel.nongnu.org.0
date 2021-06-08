Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244C39F844
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:59:53 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcGm-0000f4-Ih
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcF7-0006o0-N3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcF6-0002yt-1t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id o3so3311917wri.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hMripmVsIaE5E6NK0OqS157X34q4KqO9X/DgJXooUq8=;
 b=wNjNwsTaNPoCdKejSte0ite8M5IBLhdKvzln9bnyXFk2VFNiNi7RtuhV3OE1WNNADm
 g+3SVpBbvbrdK4iuR90C9MUuyrygRznOMQRYMccqTw1RopCBnn31c5rMjzwGD+tCoPlJ
 HlslJ+JIFdhLdFHbnnS4h8JhcT8ld6eHaDlJj9qI3mGQKXQwtIgf0ZK42A1VYTY8Cb4P
 7iEcJs8OubWhENYpsW5mZmLk7ae8Y5hrIFecHVR1Eld9nZ/f/cCGmXzE4bQegCEf9F5H
 ZpXtbEA/GFfq2RrF/unl6VdSeDH6mKMUJ9JNqa45BdHnpgojBsI1rWBvAmyMidyJTlt2
 YJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hMripmVsIaE5E6NK0OqS157X34q4KqO9X/DgJXooUq8=;
 b=jfhLBeOCNbEnwYHOwqv2XgeVm57VGcsOQd4pNhkXBKy/NRZdXJfJSEiGeZrXVbCNVf
 XyKzGJoyhDIuTxSDOKDI1+LjPsRcvhCNJJDS/2xe7Mu29zZhN7fP/FHZzA/Z4RNhZH7p
 pa+YYI2ofrr+n3rzQ2SLp5MWPSMxkS9/L5FpkrDQZTUw1vZx8AHFRJ/9ESeghzfIkwGl
 zC54T6+PpPPIajmgfN0zlaeM17cQJqn6kG5OAN8EO/G/37Q1SOt5abmYW/1BbYOxew21
 XMGwVvguBfVEXGNNjScrXsGX8Pji1dd3msI6eNAHj6DgQQSMAGv5qqjFjrDRq6+98ZLX
 bHvA==
X-Gm-Message-State: AOAM530ttglZ5O9/UQ+oH/kA9RmJpcggf8fupCLicJHjK69lO/G+u/Gf
 vEtBeA+xJUWV2fpYGlPJiYzNbQ==
X-Google-Smtp-Source: ABdhPJzHiXSBrVotWvEykcG6ilSFX1al08Hq9FCWQuipIa40rbvnCPqdv5buW8Tn6TcqOKeE6I2lNQ==
X-Received: by 2002:adf:f748:: with SMTP id z8mr23758845wrp.115.1623160686356; 
 Tue, 08 Jun 2021 06:58:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm19770968wrx.28.2021.06.08.06.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:58:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A753B1FF7E;
 Tue,  8 Jun 2021 14:58:04 +0100 (BST)
References: <20210607153155.1760158-1-jsnow@redhat.com>
 <20210607153155.1760158-2-jsnow@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 1/2] GitLab: Add "Bug" issue reporting template
Date: Tue, 08 Jun 2021 14:57:53 +0100
In-reply-to: <20210607153155.1760158-2-jsnow@redhat.com>
Message-ID: <87o8cglaqb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Based loosely on libvirt's template, written by Peter Krempa.
>
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>

LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

