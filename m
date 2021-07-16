Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7685B3CB7CA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:18:30 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NjZ-00085A-IG
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4Nhu-0007Lh-Vb
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:16:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4Nht-0000HV-DE
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:16:46 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso7035997wmc.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=n/4+0dx3GjYyQsiRuZVURXEBLEA5RhL+HHg8Pdo00dA=;
 b=FXFc4BMwb6hIWyR8JiiQ/+F6bzqWeRV9+OvK5O49FnygyoRi/kONSjl4i472yKX0E9
 wGkcgwwOayTIbosSACioocmtOJfIevFxssJI9gOIPZKPLQfXehNYQedp/MXjLnLJ2Ima
 cqOCeZuZ0L+dS/m8f+3KRW+AMFExUL2iX2HAH59ZY+w1WlfcRMLeBXC/ZsAur7Vbn9Xb
 a9sUR8VYwdeARM5/86iqPwouhKbKadJ4LheNPHKeGdld46sDNDPHZg5/wilIm4yafpC3
 JmxrYnfrhziZ6F5jbtqiirGJvPnS6WJCjpCg0yH3e1QpALOw/Ee2nGPXNi/9rXH2cS/h
 E3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=n/4+0dx3GjYyQsiRuZVURXEBLEA5RhL+HHg8Pdo00dA=;
 b=Ub40ZLUxrzXrMNC7U71LhRM6uAwghbhmZH+8CeCi3yUjDmNcRi9JJu1DUDFrBjeQQ1
 rPafvS81o/4m4b5SV7WfCdUU2qgWQzYW2aXeG6EVRZEsvi0QW/7QPSUaB4B1vJCuaElb
 21m5dSr+02xv+elRh9653hmDM03yHs8B7DpLt3oHUi5YUawqsWTyRsonEoQjsYQOCI3X
 Qju7UGib2fvWCloBKSAVIiaobCi9au8naipbe8tJMSq0zYfZBKiz7VA00NcoQpjQZtPC
 DJHbwVeZ/UA/FDahz887qQlaQakA80GVu84V8JMI/ylpNy4ugZqncaUZrI73iMq0NI87
 iCUA==
X-Gm-Message-State: AOAM530zgvv4situZKTMR2uTwtEqg1bHWutRlfoyrKDYqT/G3SX4GqIv
 BOlnWUW9yX/QpYQcGN1daCyMDA==
X-Google-Smtp-Source: ABdhPJxaQBzbKL5rLJXk7lpd+qVRh+PIVK10xUmb1rG/bgHa7Gt7Cy9GH061YqKQ1NNKp954UNTosA==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr10748848wml.67.1626441402749; 
 Fri, 16 Jul 2021 06:16:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r9sm7449538wmq.25.2021.07.16.06.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 06:16:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D352A1FF7E;
 Fri, 16 Jul 2021 14:16:40 +0100 (BST)
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
 <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
 <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
Date: Fri, 16 Jul 2021 14:16:01 +0100
In-reply-to: <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
Message-ID: <87sg0etn47.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Christian Borntraeger <borntraeger@de.ibm.com> writes:

> On 16.07.21 08:54, Christian Borntraeger wrote:
>> On 12.07.21 14:26, Alex Benn=C3=A9e wrote:
>>> Aside from a minor bloat to file size the ability to have TCG plugins
>>> has no real impact on performance unless a plugin is actively loaded.
>>> Even then the libempty.so plugin shows only a minor degradation in
>>> performance caused by the extra book keeping the TCG has to do to keep
>>> track of instructions. As it's a useful feature lets just enable it by
>>> default and reduce our testing matrix a little.
>>>
>>> We need to move our linker testing earlier so we can be sure we can
>>> enable the loader module required. As we have ruled out static &
>>> plugins in an earlier patch we can also reduce the indent a little.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Message-Id: <20210709143005.1554-33-alex.bennee@linaro.org>
>> I cant reproduce it manually but in our build regression this fails
>> with
>
> I can now reproduce when adding
>  --extra-ldflags=3D"-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"
> to the configure script (on "20.04.2 LTS)

Whats your full configure line? And this is on the s390x-cloud machine?

--=20
Alex Benn=C3=A9e

