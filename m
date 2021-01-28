Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2B3079D7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:36:32 +0100 (CET)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59LT-0002hf-Hx
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Fk-0006EB-By
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:30:36 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Fi-00088N-CD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:30:36 -0500
Received: by mail-wr1-x436.google.com with SMTP id c12so5815372wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=cbFClMRBltXWmHkmFBV9xRPUebc6NQin8rKemW0p3Ns167yJPdneC94zwvnFJAdZ2j
 ZzoTaMMyYwoY3z7t2j/O9Zzgplz7djCtdufBX10NpY+rO19aKsEFlqJPnGNxBbhLK4sg
 yM0jfQwkesVV/M5JchTHb44nvxrUaqab7DzU4fLg7OZ7H2pkMUi245J1EN7d9S2aSY2G
 HTNhB4jQ05XvCYoRa0WU3O7mZbnRmPX1sH0LTGXRw7jqDo7D+Y5WQHIspuBDNsbwsbec
 wc0D4zlirSLY+GCM9TOmlWsfTOgRFr7GlQpSAcfscgNHN4dreHp01ZL3fFcSYCNsdkK3
 /81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=SZb42iDW3rhwaapXbQOe8nw6BPmXy28hzDB0Z+TPj4wV4W9rrnMVgpKKq4D4fxZyGn
 U41cGm54rPQC283guTCsvRxUK6I6NN6VfPYcEfKgIO19V9PAy2UBreKkg5xWN3p2tFiN
 n1pZhXXNJ3I1hKuheq1bcZeyJY+wKMdaqo8k5Xv7lVp6ifRxVMusi45d0Weg32NE/alO
 wB+VnFDKaqVZnKCT8oXkJ7iVT5T3nQ2qwVI9hJXvCZ358A7Wp/UAn7PPl7bsfuGTijDC
 6WQ01z5D7oZDnj8QMojhFLI4frMUDaMcIm+ElQZmBaWZQVPpWSsgj8X/4dOjv+Q4hW8N
 vegQ==
X-Gm-Message-State: AOAM530Lmz8OHxlWohZ5Z1bZaUJJ2ESdkLw8RfM31wfHGlKxn08t4Fmf
 ucwnKByqW1sTozZfCHC0BzIyaA==
X-Google-Smtp-Source: ABdhPJzoyztFtHmJ6dgkjIpE3SN1U7DbrpksmUCGqOtM3/O8wnzAtvKcfIwoHb4Lul/b31ZKYFOtPA==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr3085578wrv.125.1611847832106; 
 Thu, 28 Jan 2021 07:30:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 62sm6481988wmd.34.2021.01.28.07.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:30:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B41E1FF7E;
 Thu, 28 Jan 2021 15:30:30 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 07/23] tcg/tci: Inline tci_write_reg8 into its callers
Date: Thu, 28 Jan 2021 15:30:26 +0000
In-reply-to: <20210128082331.196801-8-richard.henderson@linaro.org>
Message-ID: <871re5w02x.fsf@linaro.org>
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

