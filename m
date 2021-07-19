Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491E3CD877
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:04:08 +0200 (CEST)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UoR-0005KU-7g
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Ujo-00086O-8t
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:59:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Ujm-0004sT-Nj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:59:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id m2so22462040wrq.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hGasZ/egfTrZALzmOR9Hp6Rrf4f5aeszhK8GRIzk+0c=;
 b=nvKbQyLMh23yEQ4DkNEDYpqedd0vCRCzlTTOXMRT0SgNC/e05cyigAubEMgTKHellS
 6LEHn0/d8Yq5D0H6kdKf+nEW3zomFItKT8hOOg0dtJFK/eMmQZbS48QyCExqEl7aNOJm
 7bPYryg3RdD2YyuX6IRnAEdUkq8jhfk/mnS7pM5RPMa2FjkOSKJP9k9lDbjKgtrFh7v/
 EkKH6XpLvhXAUQ3A7Do2W2Mw9U0lqJH8YBtPUF/rUtG9yimUjQ10hUXNns3IBRZgtRjX
 V1nXFySQ9UblC10Q8zzjWO+3tfJ0hnZpolPB485v/mm7Yld/X+GUwC4f9/VFYKHNP8Fh
 Qzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hGasZ/egfTrZALzmOR9Hp6Rrf4f5aeszhK8GRIzk+0c=;
 b=ZRuWs/8MfgiUfTUssdI0C71GNp2Bq6rKIXXPiKMK6yxgrS9FZ2m1hJlWapGemXMcs3
 0tN2XSkNZHY3lhOwDcTstePacwZby0T9WZtVNYaDWJqRD84azfGgBVnvj5Ur223KYS/o
 pD6fGaWd5NyV2HgvhZVxwm0rh313sUTlN3gu6AX45w+FHh3WXkCPpYBMaQ+ZhQXPZdpQ
 f/AXhBymmzNJrP31haX4p8UZgs8rweVJHMquTrajHCiZo03qicpUHVd2TOExRfbsg85m
 8gYQQjg+dP7Kkelj9H8Z7zbUoGYIF4CiRFQyy5ssIzt9H41U7ILZoeEw8ht//BBueu0B
 HDgw==
X-Gm-Message-State: AOAM531qQfIQUYaLbSfKVl+N5xmWyntAJY7vPK/KqGSdsLU9Pyr6Jsvg
 daP3fB0oGVsu3ExksS2nYVVf5g==
X-Google-Smtp-Source: ABdhPJxKEXNQrhRtHyUyiabwtV5Aa+IlqwtImDzEEh41+gmKCxSbqkwjD+sohYbZXOZbEubhXbNgkw==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr29742350wrm.60.1626706757253; 
 Mon, 19 Jul 2021 07:59:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b9sm25435428wrh.81.2021.07.19.07.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:59:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C558D1FF7E;
 Mon, 19 Jul 2021 15:59:15 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-11-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 10/13] tests/plugins/insn: made arg inline not
 positional and parse it as bool
Date: Mon, 19 Jul 2021 15:59:08 +0100
In-reply-to: <20210717100920.240793-11-ma.mandourr@gmail.com>
Message-ID: <87sg0anyd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Made argument "inline" not positional, this has two benefits. First is
> that we adhere to how QEMU passes args generally, by taking the last
> value of an argument and drop the others. And the second is that this
> sets up a framework for potentially adding new args easily.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

