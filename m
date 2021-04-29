Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4636ECE6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:01:28 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8AR-0005vf-Cs
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc88R-0005AR-3Z
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:59:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc88P-0006Z5-0h
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:59:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id n84so8865020wma.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wf7Ii63I0kGFyABFIhUQ9x3qGSw6nJhdz2YZXlCtyXo=;
 b=fK1eIOSoaFT/BcOq5ccBEQ4KUodlW8yMa+tZSi4CzbeFoTr16ZNYonXAjQQM9uneay
 4a263xbclz/ugGoG/qgZx/ieFnZY0BgltwD7q58e6+gczQzaQ5nwkU3KmxzbfDV699ML
 hVL/byRy6MEUUEo4jh+iS/0xX+BqjeT7IkMP3qJVfXGVa6k5z0fWZyaZN7lW25UBrbQA
 oB8bET/SqhIUGE6NolwvDEV1YPhQvkrrrrxyJrzYkna1cxC4dYDldsmPrQqtRvcPAWjo
 ja8pFcXJN42aeGMU+gsU/5O2J/wlLnPKXa3XZM9D0QQs1G+EyEplU0zh9b8D2+8H+kzt
 rjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wf7Ii63I0kGFyABFIhUQ9x3qGSw6nJhdz2YZXlCtyXo=;
 b=a6tbAzd/IwmG3+BTzDUHJbWrk++XJpMp91CHJ9o3oG5rR+myCG/qRVVBNvedmZEyia
 yAVBoUghGlEQ4KoeQ/4S8rQNcWL5L1vhNpVPITKByL7JWbzBv7G5X3TW92x1LNSeTZ3Q
 szm0r+lQ736a5qDQN5+egukdrcNv5+hsQIPGM8E5+8xHfTMMZyeJpHdNG2IjHOs8YBej
 qOIroO10EzGMNiMYGXy7uXvHjSvLegz9LkMKhFofXc+o7MKF17O4Q87eG0pykVV8ihv2
 lxMTPLx475NGzji5trDaffQeyDpl8steqZAcpHsu8gD5n4LRvQdkCxV36M/3suSFh+U6
 2NQA==
X-Gm-Message-State: AOAM532/nJVEbQVd1O84idSlX0QGvD8PO8KJwrYt3tM8EFodIi8LJRnC
 ikgJskSxfZOZLhD6VMXbvlL71A==
X-Google-Smtp-Source: ABdhPJzNQTizmZkFn4bYVZ5XB9xsMC2icBbzJs7ra9oXjkB+6M34G2c5rP2Rn88UhdwUMCtb08aGSA==
X-Received: by 2002:a1c:2685:: with SMTP id
 m127mr11037798wmm.135.1619708359226; 
 Thu, 29 Apr 2021 07:59:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f23sm11053180wmf.37.2021.04.29.07.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 07:59:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B45F41FF7E;
 Thu, 29 Apr 2021 15:59:17 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-5-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 04/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Date: Thu, 29 Apr 2021 15:59:12 +0100
In-reply-to: <20210415163304.4120052-5-philmd@redhat.com>
Message-ID: <87o8dxw30a.fsf@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
>
> Suggested-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

