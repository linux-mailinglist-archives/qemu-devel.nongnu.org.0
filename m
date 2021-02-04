Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D552930F12E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:50:21 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cDM-0003HM-V6
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cBD-0001tJ-G3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:48:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cBC-0005IZ-0V
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:48:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id 190so2712660wmz.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q6CjC4Qa8oJ4fockxdpaXDdvhx/pzoyyZsLY6QsFFOg=;
 b=wjJSMrFCXme4c6DuIhjeKZZvkkkNWvVKtUEtIgQrwXWxlDKmAHf4Yxspv+5AFvKyBM
 AozNNzkK4hrZowYXJBsfZ0N4gTSaBSbATJcpL8fW1tXZfOkOhvf0RLM4gHAX+QrQ6k7b
 8vhIb6jRg/amkzvdJnXcs9FYncZ6hrZHQCgZBSV21w/V3RyO4M3ZPSVlYYOdNMY3S2m5
 x6PeGx5pbHWw00NMfJ2r9zuNY0KRgj5Ue4YuG6LdGAH8ecOavgqcamvZWGnEXYH/CQVU
 bMBVUoeacaB168gSLjJzNJDtLZ5O2IugL2qxW/hkom5j3WPunU0dHctLCx7ik1ILJFQ8
 39lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q6CjC4Qa8oJ4fockxdpaXDdvhx/pzoyyZsLY6QsFFOg=;
 b=FrJJOZC+GyCs5ksul3izYaA+7znAHMiG/FQ2vPXeWEqBFpaPoSFCLc69xy3w+MhdLx
 CMusLAZURShzR/t9p19Zlvo+YRu26rRj5HWDdIUgLFlsw4PjwiRC+mVA9dBHWHSEKini
 wrnJpHI1xbwzDzh4GH0+Pzbs1KyUK8gjuI3tnlRbY5cIqRUpBsSyju+TttZAkAKVF3nl
 odB1FWSD3jvY68dUZIjL9SnctXi+s1Y3lLTtferKE25Hf2xA0GlZkGLz7uog1/D1tz8s
 v1koZT32LuOee7NNg1H2E6z7CPZ7LtqfZNw089v5Q9yIbW0LfK0+vPP/giIb/uEarokI
 kAlg==
X-Gm-Message-State: AOAM533Vq4wP2+T+EmbC3hW9dPmKmVC6zwvNLrzInwKKTbMXn4ff6CIV
 xwMy1kUGv6Dx+/cu3sGQymFHOQ==
X-Google-Smtp-Source: ABdhPJzSJ5tg8z75zTjHpnfF9UlUlGSzFG4qVRDSYx3wS81iwdPMYPBa2ZgmY+a5eHCwcoF3124D9Q==
X-Received: by 2002:a05:600c:2307:: with SMTP id
 7mr5892006wmo.120.1612435684517; 
 Thu, 04 Feb 2021 02:48:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm7651650wrp.40.2021.02.04.02.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:48:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8BF01FF7E;
 Thu,  4 Feb 2021 10:48:02 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-4-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 03/22] Acceptance Tests: remove unnecessary tag from
 documentation example
Date: Thu, 04 Feb 2021 10:47:57 +0000
In-reply-to: <20210203172357.1422425-4-crosa@redhat.com>
Message-ID: <87h7msqfbx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> The ":avocado: enable" is not necessary and was removed in 9531d26c,
> so let's remove from the docs.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

