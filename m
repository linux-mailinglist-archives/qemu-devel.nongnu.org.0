Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E020236ECCE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:55:04 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc84F-00030X-RB
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc81e-0001b4-7i
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:52:22 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc81c-0002GJ-O9
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:52:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso310194wmh.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TfUYlS670S8Nq/PE6EUsCQtD4491n2sJaMMhtTeTDa4=;
 b=L12cbGkxjMrMAJBqXswtc6gAT5NipffSJ9KHLjPqo1wCo01ufzEXjfvtQH3w3ZB3eo
 MFCbLrFMF8Tdc2t0sdd1wOUTDrbC/0V8dcxPo4MkD1pLi5FUSkE2aDVw19xcWL00Rm1Z
 bdyimfeh1hOzBoFvnhdg6U3/N2LuaeytD3IBGBqYGLteIWXUGIqpU29lM6x4N++pzeSu
 71asqzJg4g4/Lz90g7AdXoDzL4MUKyPRI7hJVL67Z2SZFEyaA2vmkeZfxq/9MTCbKNkP
 GkflgN422m33v/lcbcHAkvaznoZWkK6VdXzDRTzDSbSHp8r7NPTqrvkG+QglcA85RRNh
 9WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TfUYlS670S8Nq/PE6EUsCQtD4491n2sJaMMhtTeTDa4=;
 b=cPkX2An46mxyWLZZr3PFxDQZGZAM0gh11NAMsR3dLb28eL9Opp3jE7JoD4kPg5UG3y
 VGdyPXe4ToiE+nVGuoqpXnVrWzB4p7/LPXAsOEyImF/BR3wl6NxCkzgVjjok/TY2llAy
 EqxoKZscOOwa7gp6lZAzoNEk02OTSiv+jlzKPgYjmFNDVDVV1kZEMCJDLzFofy4GlkfH
 cRfwKk/4gaY4WbbDFsBk0wekoTm7K94rPk6w0y9UTKslcAU07+4lci/3vwZdbC0o8dam
 axBta+CESEEsuAYb9l3aO8vo4L0py4FA9TqFBPLKLOSHcJ4YZqJydtgQKA76T6XbwhQk
 56Rg==
X-Gm-Message-State: AOAM532qeToG1biVToqrXF+PJWi8ilS1b9y0Uk8Y0TYhd0cJ1zlxcr+P
 YtuIvaGLKbLx7OY7cOfrDFgt0g==
X-Google-Smtp-Source: ABdhPJz+qgdIlQ42cas/5IbFy0hBkn2HBwswcDwMWsP6ML0pcCxJeJZOfn//cMdPBz1AT176p8Tjhg==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr10919257wmq.96.1619707939231; 
 Thu, 29 Apr 2021 07:52:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm6551191wrq.45.2021.04.29.07.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 07:52:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C81A1FF7E;
 Thu, 29 Apr 2021 15:52:17 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-4-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 03/12] tests/qtest: Add qtest_has_accel() method
Date: Thu, 29 Apr 2021 15:52:12 +0100
In-reply-to: <20210415163304.4120052-4-philmd@redhat.com>
Message-ID: <87r1itw3by.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the qtest_has_accel() method which allows a runtime
> query on whether a QEMU instance has an accelerator built-in.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

