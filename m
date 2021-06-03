Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E927C39A637
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:49:04 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqWl-0002Zh-Ue
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqJU-0001Hk-1l
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:35:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqJR-00049w-Dy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:35:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id f17so3788482wmf.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1U8mIaOG/L9eebI1ltOY5TQfAOYqKG/5BNej4pH0fCQ=;
 b=bBpUUJEgqi3XKKQLjscbxCJ+zm+ZNB5iIq3Do5vbR5g+7sWFqnLq3swl7K3EpOSO9T
 NkzuXWsjkl06h2bDrSgiHQWr1mtEMGpgle6EvC1OkMCDusBnRPMqUV/qJJp1yLz3XZzB
 cXead+OMxJmnT8QAKhpkhUxWg3SIbjtEW2a/m3MwzQy+cwcHx74bPPlkwPW207F/40ve
 dguPB0rgFj4dCwYaeoLY+cmQedxJ9F9oLxmdSEWHLnQUX6OHl+kxvAxoGXPQTcW3SOIn
 MgD/fo3Qirs7Hvq1V6qDnlV35ZNp/U1zdZ2Q0fPik68K88MsDgiTprN0Ppy+n3JCxyFi
 H9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1U8mIaOG/L9eebI1ltOY5TQfAOYqKG/5BNej4pH0fCQ=;
 b=TWMveLvFyAsnbyTKzeYS/+Oh/uwnbc4kgTSEePSziAGZZJhKk4/B0jk4F7zKq7PH0L
 Cngm2EFnGm4zmmKixf7QTZ4boXEretS9JmUeMbblPEtGqmdE61HfMHOCLE22WjEX2aCw
 0rbC1nd3heCklvLyT7EF6NEomDkXOHfHM9IhVb6zb8Lj035yR8Rq8KfdgG4Jbw4Xj9vv
 DP1WnWugH4PsJ5j0ITt+kb32UF1aPOTkazDLnSPrYmSqEeGj2MbksqiR0nKhyEzHgRxV
 1UYBOdbaBh5rmAgfhaz2mcHgtj07/1GtN1ka3HXRo0xScQ09/7eTufu+PRoh1TcgiP5z
 Tfdg==
X-Gm-Message-State: AOAM533YFJdJmqxgGAAR1uEG4gYGUG93e4TuvrNnSX5gjme68RtWILkd
 zSmjpyoV4QTMj4WlkSpsau/A1Q==
X-Google-Smtp-Source: ABdhPJx/Dt00VjdGBS38U8MEgGct2dpVWvgFzUIoj16S+TWmpLTzu4oa2J6EQEPmPW2UxW45fWnfWA==
X-Received: by 2002:a05:600c:3650:: with SMTP id
 y16mr11918053wmq.92.1622738115842; 
 Thu, 03 Jun 2021 09:35:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm4271696wrb.77.2021.06.03.09.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:35:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D79C31FF7E;
 Thu,  3 Jun 2021 17:35:13 +0100 (BST)
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-11-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v8 10/12] qtest/bios-tables-test: Rename TCG specific tests
Date: Thu, 03 Jun 2021 17:35:08 +0100
In-reply-to: <20210526170432.343588-11-philmd@redhat.com>
Message-ID: <87zgw67vpa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Some tests require TCG, but don't have '_tcg' in their name,
> while others do. Unify the test names by adding 'tcg' to the
> TCG specific tests.
>
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

