Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E794D330359
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 18:31:47 +0100 (CET)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIxFq-0003CX-H6
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 12:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIxDl-0002iz-N5
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 12:29:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIxDj-0004i6-Js
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 12:29:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id a18so8915068wrc.13
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 09:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zT1VDAFVUqTjlQMkDs80LErf7xuJhVYae96OFpMYCEE=;
 b=CCz2dZMEl6GSAnPkoDS6gX/CQNeGA+b9D6+gJsw3WmrzURjPXPQAggD1d85U1bEcWn
 bgMWm1NZn7J3XssA8xie7yI0ODFR1zz5915E3zQpP+Z9JovG0WEm529Td/Gi16c1KJIu
 vEDl095WfQ64Zpfw/rZzbSyUyWn1sdB/OdVCZqZVbCo7JefQMEeLx/IAZtDyIOrrV01/
 etLEjHBqpZRao+fUr1fCKP+fvLz251PZCk/zKLb6gCCMqw4H5eGYB7hOq7hWZeVt9haO
 FS85ZAbWAqD35vhDZJJawoYEPHAqHSIchC+DwA9PlG/Py3lY13VJUryRNK1xRHHwFbfb
 1Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zT1VDAFVUqTjlQMkDs80LErf7xuJhVYae96OFpMYCEE=;
 b=qr6Y283o4icxLU7DqhMloptA58LWLkCuWTScxoAA40BUzwO/ZghnQsGlyINQAV1IZw
 apgvRjoMehoUsyINDO3wkaB45xVInN4whx3vIfB1RfAtc8eMuquhAul347QH+6wvIU6l
 ZSZTFSNF6wvVXJGe/RVKpaRtnm+kRtL89N53vYfVTZ8IfiqJm7YuSlw6mZEw8rbTzYl/
 hVxiUzU7Pqn2igONN2xIdujRAkRmDEQGCSZb69KBQqP+iWBy4XEtTYZ/fICuyR27+b8D
 R805/wa/NqtlODvuOZx4Um6dPRzvK3ejnR/4PYAFpQJs9UIQW9/ptnZdGY9A6DL46I44
 Qu7w==
X-Gm-Message-State: AOAM533BG2ajXIE42pMVn/VzI7vMekwLov0eyjgyj8wLAImW52Sf7Ucd
 HX5e6ZZtNONMsKELvAMFjLyPjg==
X-Google-Smtp-Source: ABdhPJztUPbPTiwjg0JZIfxVrWw8pWmy7NvwDNH4PT2+Id7byOKTTUeSTZc4738NUJgTqSKUgnNEwg==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr19084250wrd.132.1615138172683; 
 Sun, 07 Mar 2021 09:29:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a5sm13471121wrs.35.2021.03.07.09.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 09:29:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3E361FF7E;
 Sun,  7 Mar 2021 17:29:30 +0000 (GMT)
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <CAKJDGDboytn0H7fQfHZEbuUkfoB+GaTqwU9FcASnxoQECAom4Q@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v1 0/9] testing/next (docs, hexagon, cfi, docker)
Date: Sun, 07 Mar 2021 17:29:15 +0000
In-reply-to: <CAKJDGDboytn0H7fQfHZEbuUkfoB+GaTqwU9FcASnxoQECAom4Q@mail.gmail.com>
Message-ID: <87r1kqlvnp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Willian Rampazzo <wrampazz@redhat.com> writes:

> On Fri, Mar 5, 2021 at 6:31 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> Hi,
>>
>> Another week another testing/next roll. The series includes a couple
>> of my proposed documentation tweaks (including the re-org of the devel
>> manual). We also enable testing for the hexagon linux-user target to
>> avoid bitrot. I've documented the process for manually updating the
>> registry at:
>>
>>  https://wiki.qemu.org/Testing/DockerBuild#The_GitLab_Registry
>>
>
> I see a mix of valid/invalid URLs, like `registry.gitlab.example.com`
> and then `registry.gitlab.com`. For consistency, my suggestion is to
> use either the example URL or a valid URL mentioning that is an
> example for a specific docker image.

Oops bad copy/paste from my shell history. Fixed now.


--=20
Alex Benn=C3=A9e

