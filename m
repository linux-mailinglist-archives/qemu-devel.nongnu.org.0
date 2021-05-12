Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035537D3FD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:50:59 +0200 (CEST)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgusk-0000V2-CJ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgucM-0004mo-IA
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:34:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgucK-0005SZ-8N
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:34:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id s8so24778570wrw.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Xgh3W9aHb8k3mWlt89i4te55J/PCLn1lrOXtoHmjRlI=;
 b=Rhno1iywuS5niNmCRgazK6ES2JxaeLwkWM1AkrxESWV0Nf30syJrO/Cxcs6KlgSPr1
 G9CCh5G0BDx0IljpXjz3gPecjlAwNuKyvXzy/g8ZWdPIqnbBr3qw6D+RzgYSjsm0v8CD
 6pWD77bGCcrRQo7a1cOZ5S8WRjb90SaoyDUmbhy/Pb/zD9Ir5+fwfKYENnPeeNEfVElU
 nr3j2vH8A4zf90mZq71HZ3MRADbZt62Tw83+1GAKvmdObIv6lqbrXUUbpEjY2uZprlGJ
 T5OZ0Sumqfmp+eS0Mt07oq5JDqx8FkmJp6y3/uDfz8FbAjju7YK3mBfwZMgibsu3ErRP
 8hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Xgh3W9aHb8k3mWlt89i4te55J/PCLn1lrOXtoHmjRlI=;
 b=IgqoAoBWbr0kuxIIdlKw6UK9E/0a/jQGZZiceKaQgxR3euGdpXVI9z+9Z7AQ8lVAJ3
 jt1uvdvlmKjU4DWKn006N/nYM5KEZMNYy85FAKkqp2lsl+DBhYGViZeKV1LdiZlob+LV
 JHn8Lk8koM3EBW7kUyfxam0fiagTBbogtF4IB8exNkT9l8bxtyPfLR6zuFjrcHAfcaiZ
 3KzGhBe3AVizHlDIKHq0geI3ghMqUzXmhdOb/l7zlnZeh/EU+4BgH3192ELcvPPYmoG+
 wOEg/rar1Lg8wnP1FYyMoCWbQP+brPJ18T3MU96XBv6KjGcG6Lvhn/4v/wqFGiw7KRpc
 84DQ==
X-Gm-Message-State: AOAM532ZAqSpkrb+ffTbqo6W39Tj9VtyGm8KE63FF7QvNKS6fjDz78rP
 1l9e3xYy63TLCOzSto39z/Bqgg==
X-Google-Smtp-Source: ABdhPJwIA2teLU7zcCAmnpETPuQww05sg4ztCCYf6vbRyNOTRpgg4VMRrnvnTCPblI8YaUDzxZ1DYA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr48036033wrr.19.1620848038754; 
 Wed, 12 May 2021 12:33:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm657691wrp.5.2021.05.12.12.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 12:33:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A97E61FF7E;
 Wed, 12 May 2021 20:33:55 +0100 (BST)
References: <20210512182337.18563-1-rebecca@nuviainc.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Rebecca Cran <rebecca@nuviainc.com>
Subject: Re: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
Date: Wed, 12 May 2021 20:32:40 +0100
In-reply-to: <20210512182337.18563-1-rebecca@nuviainc.com>
Message-ID: <875yzng318.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Rebecca Cran <rebecca@nuviainc.com> writes:

> Testing: booted Linux 5.12. Ran "make test" and checkpatch.pl.
>
> Changes from v8 to v9:
>
> Dropped patch 1/4, because Richard's=20
> 'accel/tcg: Add tlb_flush interface for a range of pages'
> patch replaces it.

But it's needed right? It's perfectly fine to pull someone elses patch
into your series if it's needed for the review. The alternative is to
add a "Based-on" tag to your cover letter so it's easy to find the patch
or series we need to apply before yours.

--=20
Alex Benn=C3=A9e

