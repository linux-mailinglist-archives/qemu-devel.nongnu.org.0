Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E810A472B9B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:37:20 +0100 (CET)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjdw-0000Tj-2c
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:37:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjbs-0007MH-K1
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:35:12 -0500
Received: from [2a00:1450:4864:20::331] (port=36583
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjbq-0001Hq-RU
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:35:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso13804364wml.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9I3VL9CVx+pPcO5o72cstWcMGKbY+bMTvsPnTcJaPfc=;
 b=cW8QZae8wVpPXeVJqxbaIcuOpcVWnIpvBmuBibhspygZ2qtvOvPYxsgOXfByQMt4N9
 AWGpS3rn0goV3f2Bj8rOilCr7de/aqAK8B706wC0CSLWwVkVUBXDVSl0J/wzj39jmmJD
 8U0+HjrHSUh8WIJafr9Y8ezodiaZprUzj+ObTfYFkdir7KW5yNGVEYNhxOTLHR2AuCZ+
 Q39SOoEjaBxpBO45tMWPePpbZUvJ8LKHGaUEkqVgV+mjANZGPxOLpGHguzMatwi4oa1k
 EUSgGbyylPpU3aqRUEuloLYzAwRZUE7gedxI41IC9uIuxyCrYepzAsg95ZZqiA7fqUCv
 VlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9I3VL9CVx+pPcO5o72cstWcMGKbY+bMTvsPnTcJaPfc=;
 b=evbTnmDyUeCV+ITfgAh68/N6b453J7DYzxcp1OZdqqojsMdIjz0EnzALr0YXyx/j1X
 riX9MiUllavkz31AIUaogCJ+V+UdyFzo4asgdjrb2uK7niYpxji3F4tqP8+o8ssYESz4
 m0ga29jaE7cHOe+KXyYHFYy925/QzUNj6sFzeCnGzbULfysFpn+8rXZJbB/SMjHK6YfH
 BNm+DT+qXht5RNremKqM/8c+8LVDJpxq2Ozl9k8xiPoZJuqm6ccPPB4kxF2EyYwcuGVm
 7wuiT8aD1jbMUeBadRrJn0ZigIJYoOgn5IB5a/HWBbTgN5MC/IgCU5af4ZwZKTO/oPbP
 epKQ==
X-Gm-Message-State: AOAM530q5k9k1mtUr23tSnJ1PCODaHtv2IZoZHVbYjZI+YrHnwvs+yAm
 TwYShFy7NaiIKmEhfboZvD3XfQ==
X-Google-Smtp-Source: ABdhPJxA5Y9QC0YJZDoNLyReu2hXBBugeGOrkelzNqOn11psMOXSjLL9nhZ2/QL3lqiumrYBZVT8dg==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr37112782wmq.142.1639395309448; 
 Mon, 13 Dec 2021 03:35:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e24sm10916253wra.78.2021.12.13.03.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:35:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E7521FF96;
 Mon, 13 Dec 2021 11:35:08 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-7-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
Date: Mon, 13 Dec 2021 11:34:57 +0000
In-reply-to: <20211211191135.1764649-7-peter.maydell@linaro.org>
Message-ID: <87o85kn3f7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The extract_table_params() decodes the fields in the GITS_BASER<n>
> registers into TableDesc structs.  Since the fields are the same for
> all the GITS_BASER<n> registers, there is currently a lot of code
> duplication within the switch (type) statement.  Refactor so that the
> cases include only what is genuinely different for each type:
> the calculation of the number of bits in the ID value that indexes
> into the table.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

