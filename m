Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFAA30D750
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:20:24 +0100 (CET)
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FGq-0003Sk-1d
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7FCQ-00077g-FA
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:15:50 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7FCO-0002YN-Rh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:15:50 -0500
Received: by mail-wr1-x432.google.com with SMTP id m13so23505232wro.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VJhXvKO5VJw6mke7hkQa0mkys1tJjGh1NZc3KubROHg=;
 b=eB3EGxuMyb4A6MoToEfD6fYrGNnlXqMXrGdQdkq2GqAPyaB0YyyZwKancnqKfFUBwo
 HnJZz+vznf0hmJGU4TkMEY8mb0znU3OUZgXIIgPCBX+awcqMWnNxu9x+0peNTqXXc9b5
 l87Ucuu4r51zjHUAkvjUzcZEE5cLN8Hs0DsRR1+25+lfwbpVQfSlnfuveq06v/hw37fb
 J5IlyTAkr2XUgZjIDrbLJNdabQfnSDLPz7Uyxg+gJaV/mG5G0gwrYpMo6tuYGJwDMLSo
 SUuR9sfHLM9/R2ti2ig9n2ZfAq193fE4e6lAycHTmnC2rU4YIsZodSwZRt7mC68EcA3/
 rDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VJhXvKO5VJw6mke7hkQa0mkys1tJjGh1NZc3KubROHg=;
 b=mGp21w3tnvOoBGRFuE2EozXWhMDpGXsgg7CuD6ZRsHeMJqzm+wAGvkpFK8UbE7hlTw
 fEQKqdSGIi+nL1M/OcEryPyQd1xa0TEpjcv5cVT8M6hEz/ffJCNOOxzpCJVynNdKIdrs
 GFZ3CIprmE+qIm+kY8qlYHs2WYyXj02x3bADa7TTlmKZ31LtPhA9h7FK3ZqFxSELVAJt
 242/sCsOkaF76qwxcxFXOHTTPKdqp4j5R5HAZesmddERgwdL59MA3KIUJjE4nWSKDIfQ
 rlXs2dP5zBoyW+IZOEXxnO2X3m1Ocmg2xEJ38D+QgETM43BJgRPkYtVg7+nWyQkhTyLS
 uwKw==
X-Gm-Message-State: AOAM533dVPMkNUBhuby7hy2lWo7uKCSvjPAIyFGrBCKhuQG0pH9HwUc1
 6xC9P9GUTek3nqiSzJPpMP6aaw==
X-Google-Smtp-Source: ABdhPJw2dj0h2vvWOCvmX86tVFEpoTX8ehM4Igm2ptzxtNaTIAyyVffgbTINxVbEwxCWPhQANA9jzA==
X-Received: by 2002:a05:6000:cd:: with SMTP id
 q13mr2631265wrx.138.1612347346605; 
 Wed, 03 Feb 2021 02:15:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a132sm2115134wmf.42.2021.02.03.02.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:15:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA5E91FF7E;
 Wed,  3 Feb 2021 10:15:44 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-14-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 13/23] cpu: move adjust_watchpoint_address to tcg_ops
Date: Wed, 03 Feb 2021 10:15:40 +0000
In-reply-to: <20210201100903.17309-14-cfontana@suse.de>
Message-ID: <87o8h1sbhr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> commit 40612000599e ("arm: Correctly handle watchpoints for BE32 CPUs")
>
> introduced this ARM-specific, TCG-specific hack to adjust the address,
> before checking it with cpu_check_watchpoint.
>
> Make adjust_watchpoint_address optional and move it to tcg_ops.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

