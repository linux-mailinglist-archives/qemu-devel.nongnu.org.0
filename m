Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A256239FB5D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:57:39 +0200 (CEST)
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqe6k-0004a5-Eq
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqe3i-00021i-Oo
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:54:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqe3g-0006T7-1d
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:54:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id f2so22100304wri.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vpbugow9CxRv3SiLp2GdhwhINeTAZr1vjK1QkIq9ywk=;
 b=RAEckeNxVy4dI0z/SSc8NI2MiGQQGMc//rVMGm09yTCirL/2kVhsFWsTCXaFVbSpUo
 w1+MzjT1q53e2NQzje5d7QmpslmHM+K0zfo/o7bmTMbmt05sUNABfaF7Qg7UrSFZ9/7n
 bZQMO+5I4vaekUjECtXYnv9klebQrJiHo4+qztD31r+PWFhzGJ5uMixVfqKqKHhNCTCV
 w5UCgdD60SWrYeO6rjotJpDIjLg1pL28u65OrDHcTTczhKEA/7aeqg/JWF8RWvKWL4mI
 gbNYITSkKelZtezxqqSfEkavnkHx9d72ctFI25uCKd/8h1kEcuaEMjU0jG39CEDsD5Jq
 65KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vpbugow9CxRv3SiLp2GdhwhINeTAZr1vjK1QkIq9ywk=;
 b=XkUGQGLkl62jXsIPsaetknWqUrJuReQC5giRUFFtY0tZ0q/J9RUSRAZqm/si50h3Ts
 LQZfriBLs2G29+xxFVqGdD4zfr5HpR5CIXOFtcd2Tv0SJ0sMdJ97uPRmrHqpzkF0vkzM
 EdnupYrz9/gEwLBRTGa02fkXeTpcTLpGXZgWjkge4A26lgleWspbJvcwjfxllSYPBazE
 EdzDjI1tzuLBaLWO9sBrMK6Nw91inUcHlPGw/SBWn4ts3TM3QTqf/4k0W2oAmKRf3z6H
 QDdh06QkszOqDtU45Or3Pyqla84v4VXAo5RX+L4aihCXtRXf5ifKoDj7VWFtemMJvkpk
 eXuQ==
X-Gm-Message-State: AOAM532ioJ7SG2CbFJGZjcb2J23wGabKdXE5uAcbzfLkxRfJG7Ir/QUd
 eJ2gSnxJMCyh6F+iQcAgxRPupA==
X-Google-Smtp-Source: ABdhPJydlACXGwv1q3omLBp1VBMWxqPAjR/UK7s6YTrBpBTf++uScp2QPsvhqrkESKAqyRyXVDLSeA==
X-Received: by 2002:adf:ab49:: with SMTP id r9mr23622455wrc.237.1623167666680; 
 Tue, 08 Jun 2021 08:54:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm20276017wrt.86.2021.06.08.08.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:54:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A24E1FF7E;
 Tue,  8 Jun 2021 16:54:25 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-15-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 14/28] tcg: Introduce tcg_max_ctxs
Date: Tue, 08 Jun 2021 16:54:18 +0100
In-reply-to: <20210502231844.1977630-15-richard.henderson@linaro.org>
Message-ID: <877dj4l5ce.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Finish the divorce of tcg/ from hw/, and do not take
> the max cpu value from MachineState; just remember what
> we were passed in tcg_init.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

