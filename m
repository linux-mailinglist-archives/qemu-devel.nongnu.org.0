Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A860674B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:49:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZfh-0006DU-Vx
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:49:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZfF-0001iX-P6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZec-0007mR-3M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:48:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZeZ-0007IK-Nd
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:48:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bp11so144987wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/K9n/QnEQSjPX8Wf9FaftzBfL9OL3szJgga/ncqOVxo=;
 b=kFRdAPheUYSiddi27I+Ix0Bxiaejxg1//1OmUwHn5mtMT4BRPS8pN5Vf+M+R+4ZM8h
 3EJPmC/S2gHGQ8Vebzzp7UXaapBfLSEwYJny2KuJGb+DY4mr9yLPprNfXp0IlfCkIsfL
 ue8r4oiPujJYhDJG2zrC5CakRFOJx13cB0QBfZfLn9t9WE6SkY4ZhDu0oDqQeKjN2tdJ
 dLkv6OiDJ1Oj/OnXl7V/t0tuIaAFJlQTto4TKZdJBxNPPiQySha397FTBhTcmaKE5KOJ
 7KzJLnQpTeQrE3BlNCal4oVSBStEmvSQRpx6J0Q3QCPICaht17yV5d+iXtjFZ1D0D+50
 zMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/K9n/QnEQSjPX8Wf9FaftzBfL9OL3szJgga/ncqOVxo=;
 b=KlM8WrNh1n7NegX5AqYHHwodLdxN9pFwgqC1YAwtMkZVMzop59DKewOtkbXR20pd/e
 RylBlDuf9SEWO5AGMNLVwA8o25O6vPAL7yaTl6uwmV3axivHNQvMy9e0NuYPWfq1bmEx
 Mr6sV/0IQC5XniDJ1b4MI3wNBKgoShEParue89kTgxqFflA2khzDKlxa5x7uMMwliMAd
 D813V/QMxdT1aeTsMa9/jnkvzD9ZXTxxEMgp3q18oGYade6Ylj6J7gH5j6twPZa+yBMZ
 iVEnHtRBNg9XQ1xnRsuK7yzsZOUIHl4BtCk2n1rC/LBwykQUYOkv4eMw3qAwI8mi3ZA0
 NVpg==
X-Gm-Message-State: ACrzQf3mdbjp+zBR1/kejV+i0UYo0XGdIrSN0sjIB6EGo6vomjn6h+k8
 vqjcZVZEMJdOGDG3sTRRXezyvw==
X-Google-Smtp-Source: AMsMyM5+IJCNxDSFs4v/LZYjSvXRKgudH5To8gH9CicGtNRRKHZTyTpCTcc3eG/ZPHeRw4FfTmlcbQ==
X-Received: by 2002:adf:fe42:0:b0:22e:48ee:aab9 with SMTP id
 m2-20020adffe42000000b0022e48eeaab9mr9057946wrs.501.1666288099308; 
 Thu, 20 Oct 2022 10:48:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m126-20020a1ca384000000b003b476cabf1csm220414wme.26.2022.10.20.10.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:48:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 776AC1FFB7;
 Thu, 20 Oct 2022 18:48:18 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-8-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 07/10] acpi/tests/avocado/bits: add biosbits config
 file for running bios tests
Date: Thu, 20 Oct 2022 18:47:42 +0100
In-reply-to: <20221020123506.26363-8-ani@anisinha.ca>
Message-ID: <87o7u675el.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> This change adds initial biosbits config file that instructs biosbits to =
run
> bios test suits in batch mode. Additionally acpi and smbios structures ar=
e also
> dumped.

Is it possible to split this into different avocado tests or would it
require building multiple isos?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  .../avocado/acpi-bits/bits-config/bits-cfg.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
>
> diff --git a/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> new file mode 100644
> index 0000000000..8010804453
> --- /dev/null
> +++ b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> @@ -0,0 +1,18 @@
> +# BITS configuration file
> +[bits]
> +
> +# To run BITS in batch mode, set batch to a list of one or more of the
> +# following keywords; BITS will then run all of the requested operations=
, then
> +# save the log file to disk.
> +#
> +# test: Run the full BITS testsuite.
> +# acpi: Dump all ACPI structures.
> +# smbios: Dump all SMBIOS structures.
> +#
> +# Leave batch set to an empty string to disable batch mode.
> +# batch =3D
> +
> +# Uncomment the following to run all available batch operations
> +# please take a look at boot/python/init.py in bits zip file
> +# to see how these options are parsed and used.
> +batch =3D test acpi smbios


--=20
Alex Benn=C3=A9e

