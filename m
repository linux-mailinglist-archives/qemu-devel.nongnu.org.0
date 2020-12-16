Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF702DBF2F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:07:21 +0100 (CET)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUeO-00057C-4j
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpUcB-0004DK-O8
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:05:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpUcA-0002YK-9q
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:05:03 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r7so22770416wrc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q7sXpdGsv0bbc705aQs39YNNdMgQSLkSLxZxZRJ/tW8=;
 b=n5fGvcYhzyywpgDyu+7v4NqY7DoCf0i2MEf1vZA2Hk8cYMp857xTSm44tbreCkOyA2
 JeSrW+pZaTAUZkgLAITxTkcCx7M7nZGcq5THw+x1EqQQMd12AuIWdB4Cvrv/UhFvdIO0
 8ojfEsqIZgpPU03aK0BsIDPW+Fw8yoJLo3o1lTPvwhGmiUSPcFB8ieQ+eJvrDY2Gg9ha
 d0T0ic+0VnY4D2483kHAKDrSILFMnMgoepK69m2WzKVGWSkIPF/E0YiQn4TRZreWZiNZ
 66XvPCtZ+35bn5Ts87zoj8o9qAqa88pteDv6TDymYYfZyvjSYECA0dYJPse9A4A2zgZo
 PZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q7sXpdGsv0bbc705aQs39YNNdMgQSLkSLxZxZRJ/tW8=;
 b=RdE1AZNMYmHm3vTkOpzj1pzlHJPtR5uVh01tadKvj2xrxOyQ0uHI27Vd2n3vMAqKSm
 AjJ3PglTORPcTY0biv3fBn5ZMjbsoKE7I+GSwVoKd6N96BpR+dlV0Du5i+b0zuWDXNTK
 SZRPhDgb9+4WtGT4RlO7wcQu13mfD6vx7eA37P3x2C06f8VfUblDZmPBq7ExgLBD4cjy
 mwDvZaIaMKxrcY4IbFfdTgQIxW784Q0nLp6IsmrxinOODYFne/rh7+1ajjT5ps/SMPqk
 IjSwi7vjXkChCkVcaLgK7gKbIshvqepUPyoLu6GTzDYgy5bcRg1eqf5rgOjOSU8l/eKv
 y61g==
X-Gm-Message-State: AOAM532hxkWe6KEz7pDzjGhKstwjEyw2KayRqj8R/Cg9O252sizOqLC4
 4QU/FuIYCPD8mF1w9OiyW2sieGNxDCycxA==
X-Google-Smtp-Source: ABdhPJxVqn0FeW3wQ9rpCJ3/TK/9rhBCcsp36kO/jM8URrYf17BZi2IBBBMSif0MHx99gkdVrhvS0A==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr37906625wrc.240.1608116699647; 
 Wed, 16 Dec 2020 03:04:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f77sm1115189wmf.42.2020.12.16.03.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 03:04:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7E651FF7E;
 Wed, 16 Dec 2020 11:04:57 +0000 (GMT)
References: <20201215083318.92205-1-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/docker: Remove the remainders of debian9
 containers from the Makefile
Date: Wed, 16 Dec 2020 11:04:52 +0000
In-reply-to: <20201215083318.92205-1-thuth@redhat.com>
Message-ID: <875z52t3ja.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The Debian 9 containers have been removed a while ago, so we can
> delete the corresponding entries in the Makefile, too.
>
> Fixes: e3755276d1 ("tests/docker: Remove old Debian 9 containers")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to pr/161220-testing-1, thanks.

--=20
Alex Benn=C3=A9e

