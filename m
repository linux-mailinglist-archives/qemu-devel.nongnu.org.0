Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470F204F43
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 12:39:56 +0200 (CEST)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jngLL-0000OG-Jo
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 06:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jngKH-00080o-Rp
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 06:38:49 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jngKG-0000XW-C0
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 06:38:49 -0400
Received: by mail-wr1-x444.google.com with SMTP id b6so19965518wrs.11
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 03:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=soUzJaqh0EonJk7A5fLJobmV9OUcIQVN5eMU/Ycehlw=;
 b=fWo9FfKddz5u00+1poVmhZqYLw2XqgzhS2ThZAyc6Ptd7EKuosBwDuoir+PWAodUo7
 B2E78opylfbCSKNi+IW382L+aZyTwmnqnY8CV2xVrMG87Td1hYem977VJWBnaGeoJI4U
 nqHWBcYu1eVcR2ICGtWNyOgqssXOw5lDYX7hVREnX6UyXhKVyVCNdjCGDMGRaZDUKyUz
 ajimaiVdm0cAvmoQ4J9Dots+BvCkCNt7L5me/UZZeLDqhVS8k3pIG0dh8REFlOMPsKJ1
 YIhMAVDnM1xqzzyqdEum+2XU+LXYx2LS8y0NRZjSBnLZo5JyfdKPRkcZbjhnVvXoknqf
 lluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=soUzJaqh0EonJk7A5fLJobmV9OUcIQVN5eMU/Ycehlw=;
 b=YXiivT3K0uLIa4ealqO0EIf8++ehMt+vs4qZAfY+6gJlBVjeX651IhMa3b3QCOKSKl
 EWhECdbp1J6Sf9JbcrhZ9gAunR7X2OGSAqbJy0+fcKZt10fE9pCec99niCHt56DXUMKR
 d4ZBnksOUZXiR3JQTY/BFt8ibOZnPWkxw8NBGrA04OXEdQthJIr38sFObO8Oj5yhtIgn
 jW9zptRZsAtckLpDVHlRrRn4WWqIZJZPgDQ1FKCiv99NTUd6Ny1laJcBwfyGA4b0g4Q1
 7mCV06JltDL0w42MBSdAb0FLbE8Lf4F+dOU6xQuJMENRom7xUp/oI+klSY7fbrR24N9w
 ZRxA==
X-Gm-Message-State: AOAM530brjFPxYMqPT7uPhV2aUCqFUpLmDasjme97hny39V5SNqNKsUX
 A6Gz3sLY65Z33FgvPJXBtFR2fA==
X-Google-Smtp-Source: ABdhPJw4lyNOB7D+NoeAn+O/wbMkjILVc9BamtjoPTjVxCk3juDDswn0H/cpnKaRBimIoQDuZmOXTA==
X-Received: by 2002:adf:de0a:: with SMTP id b10mr21946651wrm.72.1592908726210; 
 Tue, 23 Jun 2020 03:38:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a2sm7965071wrn.68.2020.06.23.03.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 03:38:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A6EB1FF7E;
 Tue, 23 Jun 2020 11:38:44 +0100 (BST)
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <20200522023440.26261-17-richard.henderson@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 16/25] Split out recv_register_info
In-reply-to: <20200522023440.26261-17-richard.henderson@linaro.org>
Date: Tue, 23 Jun 2020 11:38:44 +0100
Message-ID: <87pn9q83t7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We will want to share this code when dumping.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

