Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C954322965
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:19:38 +0100 (CET)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVj7-0004hQ-2i
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEVi7-00040c-Pg
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:18:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEVi2-0000jy-Jv
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:18:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so22106805wrx.13
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=t0y88kdDwlQyPMr9BtppQ3nZCLccKy3wlj1EyClCBRk=;
 b=NE39eYhTL/QKlPkU3JMczhh9RfhTXa8GGFV2R9GyikHJ4eBRrFAEPhRqpD7ApUfyTy
 z0FsHqshNknGy9qT5AwYdUMIA/7w6VTjPYx5Y1QonyY9+YYzgLvdWS5JyQvhzLoF3slT
 QzJS6lCAHSPaHMmfKNM/vX5XAVgjX6bGtl6orlBi8vdeysBFtVxWFYHQFZs6WbB71XPu
 UDKTMimMLduwXb5Aidg1TLv/9SvdwjltBaruX39M0peO28+IGQN+vB7JInXJBQF/K0nT
 iPjknwq+G51NJWMrc0Oc7DxJS0H9XbZKQCGNHARA2R8txdr6GS7NrGPRWlY96fA/BErk
 YoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=t0y88kdDwlQyPMr9BtppQ3nZCLccKy3wlj1EyClCBRk=;
 b=FIffveMM2g38J7Nxbd4jrlgL09hvmL807TCxZM0VERNZ4DTaCTDEXE9fx7LhKkxi7V
 9EdGfZfCSfzzzjqb4wFML89fS9V8vGZsvGA9qufb0uNJzRWPSm/NP0k3RUt854Xxy8NX
 p6KtzkngAUktLoFAYQ0bJRD9FqV+aqY1jTL7iKTJLJUb+Vr3D2T1DIqtOaiZmeuv9XlC
 kldWSdwb/QbW/kqcmJWcSuU82b6T29nk29YonqhMFIhe9FgrDW8SV276Ps+YR25zMVlP
 8AW9HcvRh9UWJDQ9ktfIly7G7fTZN2NfX0Yrl6WsDoG7ODa7CGUeUJlCOf43N0nhEqsH
 gZ0g==
X-Gm-Message-State: AOAM532BtnLNg+OKfI0RjmUKk2CstYi+TPxM/dZeDBXYMBnNbEzmpHvl
 SmF484hXp+XGgBqMO/3VbCPJzQ==
X-Google-Smtp-Source: ABdhPJwBRN/2P/r4Lv+8Q8foymh9qzXkIzmqqxhrHClds/xCgibLd28qnhPTaPrO5wkNkZOjSzLdJA==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr26091335wrw.195.1614079108594; 
 Tue, 23 Feb 2021 03:18:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e1sm32347038wrd.44.2021.02.23.03.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 03:18:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BBF01FF7E;
 Tue, 23 Feb 2021 11:18:27 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Tue, 23 Feb 2021 11:18:22 +0000
In-reply-to: <20210219215838.752547-2-crosa@redhat.com>
Message-ID: <87tuq33ud8.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> As described in the included documentation, the "custom runner" jobs
> extend the GitLab CI jobs already in place.  One of their primary
> goals of catching and preventing regressions on a wider number of host
> systems than the ones provided by GitLab's shared runners.
>
> This sets the stage in which other community members can add their own
> machine configuration documentation/scripts, and accompanying job
> definitions.  As a general rule, those newly added contributed jobs
> should run as "non-gating", until their reliability is verified (AKA
> "allow_failure: true").
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

