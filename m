Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A53A1029
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:35:47 +0200 (CEST)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvYo-00065y-JE
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvXV-0004bK-Nb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:34:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvXT-0008Lw-CG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:34:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2943907wmc.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m/J98+Rb6uH4Ukbqtf4OLowE9fGs7TgKqBQNqfWCIrM=;
 b=fNZDAPCFqiMg8T+WilS0aK1fLf+kznBPIP0oXVvpG/7vve9PZWQFpvJ6UhCXQmWKwe
 /TRsQGkF3wLfdbDxHHBfAqiXQTNd4FbZAPRY5ABCTiHR35ryyG05wl0XbxL4XBwiA2A7
 qWXGMsAkoAi9jHDFpmDK/JMQW0kAegbPjS7iBpd0RrtqMQjXdHJyUyKmOivgH9vKVQod
 l6XxmcV7aSyuT1hxppa/8QaJkE5g+V2K6KgxZXbXnzoMv6LcCijfry8mM/eNq9EjSxy3
 F07hh2aqZ1CdHxqE8/0SyWJDuOnOZobk5ckBeYC6spaK7hidfc7P94wG8f66HS6rC63q
 o67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m/J98+Rb6uH4Ukbqtf4OLowE9fGs7TgKqBQNqfWCIrM=;
 b=sjvBkZsKeOpYC1HDQY4Qehz32j+5MVaXyeXHYAxCOUVsgT1ZMsVnTv2ZyatK2woWgW
 SqoubWvueDwrDp9YK2ZeI/etucUxY8r+Dhf+iz5t5e5lwAmteSHRxqt87vSX/GsiH3+w
 m1rrCfBd3XcLDAUHgVL4wuxn35WraW6GPlIq4Zf0oOCPHvS66m028qroMl3yTnIiQQuK
 uFI+K8xUQTQGRqywQAhItMigy7xOBEs5SL98EaXDTrGI+Gzo5rnV5+ROnUp0prGZwI6o
 aF0L3yxgK+wscVet6TbarDU3XnmzrNwnBkLzjiiXF4d7a3Vy8cWlmZUVmXAN5tbzam9g
 yTrA==
X-Gm-Message-State: AOAM530tEGYfuNl3jRzi61ffP2NjCnlJtzFi7zNAZ2qTrpvpjOwukyKI
 C/sVqz/8IPTi8mkzriz1U2ixEA==
X-Google-Smtp-Source: ABdhPJygTrY/vbsitoimoxWU7ArR0pyNkPhQhh7ohVgKLInlLiEjZ251AEXEW0GqOxAnM5G2Gy+F7w==
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr26998291wmi.76.1623234859007; 
 Wed, 09 Jun 2021 03:34:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l31sm9294424wms.31.2021.06.09.03.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:34:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54A291FF7E;
 Wed,  9 Jun 2021 11:34:17 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-24-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 23/28] tcg: Sink qemu_madvise call to common code
Date: Wed, 09 Jun 2021 11:34:13 +0100
In-reply-to: <20210502231844.1977630-24-richard.henderson@linaro.org>
Message-ID: <87h7i7jphy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Move the call out of the N versions of alloc_code_gen_buffer
> and into tcg_region_init.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

