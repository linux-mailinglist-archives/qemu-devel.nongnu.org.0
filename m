Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590CD6068D9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:27:48 +0200 (CEST)
Received: from localhost ([::1]:51668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZKe-0006Xq-O4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:27:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZKe-0006L9-Go
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZKK-0003vb-Qh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:27:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZKJ-0002Ty-2B
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:27:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j7so106618wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvY7y4QIKa2j83Y+WtaAkWoGgtaH6BVVloarBT0N0vY=;
 b=zV9GzrQXrZDl8a9CdvGxyTNbKkJdPR/Z25oJNLmhtxzq5LaQXOqGrM3XV/opGqKxOA
 ubKDTe3OYYa5D0YQmU/jHOQx9redbEiEJDDiZ0vjvnd8civiXQ/3ofIx5obxfEZIo7OC
 aOsfSnP/kG2UM42PxIc5HDgDyLklYISK5v3cFvpGoKqDE9h9CP0Xb26EAUV9wqKaA0+O
 M2JzmABPPA7TJT+BqyqhsgZmpPy6Ab7OwUYuyAfNH4m6JcJ46kRLGV3vyVYNt/x4e82k
 oN47SIg3+rVCtkhJxx2I8jbSgQVWEnNBG7sxOwwCQfT8EkaOsPOpGOWGaOvHY/GFJqbc
 3WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QvY7y4QIKa2j83Y+WtaAkWoGgtaH6BVVloarBT0N0vY=;
 b=DzDeomGFE4W4VcbpMojQIA3+6ZXVXfV/spWS9V/uuUD+fyVcmmNqn+QK2+Xzd3C147
 3fIM9DiEt0xi07ogcWPs5F8eRb0S0IfTTmElB9hng2x+R+QzxH+1wJIljiL4NdsGWOmt
 bqHGHma7Gj3+aup6DiOOQ5lFgRurgsG/przhTfvyV2/8HlSodEZ0/YmTyB/CPbUHjkzd
 uJcCepZrc0O98HkjCS4+F0zncX0NisCzsaejlyh1cUSKk4rUcWluxlML420bQ72KMAsu
 QIRI+iktjsTC+SI4t8NVP8Jm2nLLztZasdMVpuRHk/SV71cxz96gfoef4CSgfXF1M+iw
 gGIg==
X-Gm-Message-State: ACrzQf088A0K0fJePZuHCGlK8vmCV8ozND0OPNgK+KIk8DGwV4vhPIe5
 UMyNT3UtK2ZjSKCi2beeDkwwuw==
X-Google-Smtp-Source: AMsMyM5xO+ziIX0my/SPmypmrpvZdsArbK5HT2FENPNn+oz1ZzJyHymuvO3RY027xlcG21w3j5AIsg==
X-Received: by 2002:a5d:5983:0:b0:22e:bb12:7041 with SMTP id
 n3-20020a5d5983000000b0022ebb127041mr9520903wri.645.1666286844945; 
 Thu, 20 Oct 2022 10:27:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adfef47000000b0022cd539ce5esm12197527wrp.50.2022.10.20.10.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:27:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1B3F1FFB7;
 Thu, 20 Oct 2022 18:27:23 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-2-ani@anisinha.ca>
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
Subject: Re: [PATCH v6 01/10] acpi/tests/avocado/bits: initial commit of
 test scripts that are run by biosbits
Date: Thu, 20 Oct 2022 18:27:18 +0100
In-reply-to: <20221020123506.26363-2-ani@anisinha.ca>
Message-ID: <87edv28kxw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> This is initial commit of cpuid, acpi and smbios python test scripts for
> biosbits to execute. No change has been made to them from the original co=
de
> written by the biosbits author Josh Triplett. They are required to be ins=
talled
> into the bits iso file and then run from within the virtual machine boote=
d off
> with biosbits iso.
>
> The test scripts have a ".py2" extension in order to prevent avocado from
> loading them. They are written in python 2.7 and are run from within bios=
 bits.
> There is no need for avocado to try to load them and call out errors on p=
ython3
> specific syntaxes.
>
> The original location of these tests are here:
> https://github.com/biosbits/bits/blob/master/python/testacpi.py
> https://github.com/biosbits/bits/blob/master/python/smbios.py
> https://github.com/biosbits/bits/blob/master/python/testcpuid.py
>
> For QEMU, we maintain a fork of the above repo here with numerious fixes:
> https://gitlab.com/qemu-project/biosbits-bits
>
> The acpi test for example is maintained here in the fork:
> https://gitlab.com/qemu-project/biosbits-bits/-/raw/master/python/testacp=
i.py
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

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

