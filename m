Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3539A326
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:28:13 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looKS-0006Qd-ME
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looIa-00047k-1B
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:26:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looIX-0007zo-KV
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:26:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3818195wmh.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=JhghmFoy9TOC2/L+UUegqMDJ/pXQC9VDYS/0tsPQ8J28Z6eYQUdDqQdYpb56HsRWAS
 fqAHKGsnRRkvW7VTr5ldrmplV3nL1kvCz98Swm7uJLCtjk5h00azKXz4MEI/pXBdb8uA
 b6KoINGY0SyA5rsaQAOTUuxhPqAjkGZ9MJvdJEGrwv31mN+3Txgb+xMhPLu3GWc6RjpV
 wPObYk/xHKbX8ceETWxqj9da3akIczTOGuwIbGQyCbWINXcDR0B/P8ZV59m+Tmn81epn
 3ZO4kpjbWv6uP9kK3qySZxcxxB0r9n66sytS/AaYNN3z9biX5Dkzq2LsWpTrx8M6n6Wc
 Dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=btvoIN+sSWGhn9U8YsEmSnFK5+dly8RNxfNJ5IRLrQhxvy7njzJycH+QOZd6bIxJfm
 T4vCHnYyh8ro/J6NJj1PNm5PUBS5Yy+OT6crZbtS/5qTCsvUnc53zPbCeKFmnRwfihNo
 ILmQ8oWjbLF3CH6bnGMmHNCfoReoUEb42AREq3kaml7kBbFjhBzSP8HZevIWH96kZ6Ke
 8/PJpz4v6tACwgeyYeaH5iZwnypNOny8Bqiv3X5neblx97e0mPQAUMXpEUZ8R4WgXP1p
 EivN+a3Ic3EMzJi5rT1Ae/jBiSI+CWBRC3xFdAaiAO4Tny07IUxUvCgcP0dA6+oiRfH4
 1xfA==
X-Gm-Message-State: AOAM532cZcxXtFIwvwGn4PQsaqE1KT95dACiEJ6rLoj8R0uQXrwqRTEN
 VvudMeO04bTby15mR17kQz6f6W6thpHg5g==
X-Google-Smtp-Source: ABdhPJz7B3pacfRvVkb6KYT77JaCq1joLvY4P4tsI+JQCDAKOPB9kNFuLJOVrKDvzJc3jnkEfPEigA==
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr18320987wmr.170.1622730372208; 
 Thu, 03 Jun 2021 07:26:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm3499806wrt.20.2021.06.03.07.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:26:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E0E41FF7E;
 Thu,  3 Jun 2021 15:26:10 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-19-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 18/28] softfloat: Convert floatx80_round_to_int to
 FloatParts
Date: Thu, 03 Jun 2021 15:26:04 +0100
In-reply-to: <20210525150706.294968-19-richard.henderson@linaro.org>
Message-ID: <87sg1z81od.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

