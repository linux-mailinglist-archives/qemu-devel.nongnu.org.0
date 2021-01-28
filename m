Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA4307E1F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:37:27 +0100 (CET)
Received: from localhost ([::1]:48840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5CAX-0002kl-SP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5C7T-0001Is-9R
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:34:15 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5C7R-000264-Ku
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:34:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id f16so5087899wmq.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 10:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sXO/uEtBKydLEUkEE6D1Yu46pNhFcfEc+IQiaBxncAQ=;
 b=SF/OPyUasi0CYtJNxxdJkfGqagIp8AnMP2zzmAPihe6+rpwk8EoOx/JW10HgZ2PQZR
 txZkyhlPXDsJucWxKcaS1CduCrtjIKzPuoZcCPJui+nqsF9Ei081/lyxlxIyr9LF7Yhb
 JEDSkNvFrnKrLFSLa7e5qybSyfr/KRmJsA6hz1V+1iRD3onyv/OcWN6GMsceN19uQuPk
 bPkp3dWuofqhCyklT6z5wrXLG5m/SpBbVnkKCsckHhqV7fcq50J7x45GBC2rIvPGLaDj
 3XqYa0IFbZJhw3T7c50K+oHYqngtxk7Aq9FyTM+69weridFSbBByl0vssDBrXO83HWjd
 YC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sXO/uEtBKydLEUkEE6D1Yu46pNhFcfEc+IQiaBxncAQ=;
 b=almyYuKucNJOxp4QquabxPLJKDs9AT50AfFYqI9ZuAZKA3X0Eur7MbZyrGiDWMB173
 tcUkq3q5r57p7r9DM1zTdKgsy7YAm5wwB5QAaRyOJEva2gVRi95z5yJu6lSk27jedVTN
 I7DEdb6pCBi7tGmCRPzDC+1W0IOSHbS1p0pn5H3DtZ9RAwN9g7czOkli8U/K0zGs9AQK
 665MbVQZrJwP9jKJADB8s5y1CNKyzoJZiggWneP4APVlzBaqP+PTd1YGkGmq3wqQQQNb
 wazY6cVHnuK69EgdLaMSmEYVo+KgV/UHrjIc3KlnD0JlFALmks9gNkBEXdUk+4Cxl6hp
 OZvg==
X-Gm-Message-State: AOAM530DXldtM8j+9ctjFui+bsrswmqMFuOhEhPemmpHm8iRfexFdfP5
 +XhWpU4/qOmPYyCUuA0pLp4hfQ==
X-Google-Smtp-Source: ABdhPJytlejhOm+Buv12x3ZryddtB/wwK5ovHy19En3pCJfOt7Z+RyBg3WOsiqxjYUhamOiM7ikRoQ==
X-Received: by 2002:a1c:5403:: with SMTP id i3mr523298wmb.87.1611858851979;
 Thu, 28 Jan 2021 10:34:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q63sm6800803wma.43.2021.01.28.10.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 10:34:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33EDE1FF7E;
 Thu, 28 Jan 2021 18:34:10 +0000 (GMT)
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-3-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v14 02/22] target/riscv: remove CONFIG_TCG, as it is
 always TCG
Date: Thu, 28 Jan 2021 18:34:05 +0000
In-reply-to: <20210128092814.8676-3-cfontana@suse.de>
Message-ID: <87czxoud0d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> for now only TCG is allowed as an accelerator for riscv,
> so remove the CONFIG_TCG use.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

