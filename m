Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DF390687
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:21:54 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZoX-0000JG-Bw
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llYdW-0008FK-Hk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:06:26 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llYdU-0005yl-8e
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:06:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o127so16945603wmo.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FnB3yaNezJGkWMvXuNLtpUKlgW1kFPWvOUBjhjZ28oQ=;
 b=coq6tyv23juj9NEtoN4BIEt0NQtH2fqWAFOIERvzOhSZIgMxLnpzSkcs1peqTMiUq8
 628UyRvQv/70br0Mi3RzCfeu85qXs0v1VN4eVC6HME0HXhjkx1Y5A6A4RK0D7cks476Q
 ipH8teA0GubSm8za7blWXx8Ct/09DydtoLg7Ml4nLccBNKlE25kjlhpMABUQg4dALo1l
 nBl2zVchuiCZUfvg/Rd2jezb9gzTM6pIm0Ov0pkRS9aRaqmiipX09D3xet6bpPqFKamx
 vj8NIF0A+GokD/hPO96bPACfS71+5Hr2JsxlqX62HmIvF7X6M+6g/aX6QO1jr4h7YwW8
 ITYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FnB3yaNezJGkWMvXuNLtpUKlgW1kFPWvOUBjhjZ28oQ=;
 b=lASBN2POKH1tckktAb2HhoLZMVfU1phT6z1vjZ1Ymc+KxEJV4mfHzCMVjbtL+9FMDP
 ujQ/2449kFdLhlQMFb3kTYZlkqbxLS4Tl17s0vH3BW/pd1d4YlOqvWa0uJk3eDuNtKms
 gr7JDvyaa++Bkbeo+ZYJR6orIOd3vFULEYYK6po2EgFG6J8HJtdqwt4wszu1pBi+/Qoo
 msLxF6QDesAcgwZiDikRAOLVkwyI62akdnmo0XGCZXMxnkot/+vpNMcKK1UfsNbgn1UB
 F5Z+HwNIFLMA80hCqybX8QFKnN3QW4FKTVWacBF/wB4aOwt2z0E31/sFGRXkdFtadD9L
 bQhw==
X-Gm-Message-State: AOAM530cE98uLBZHn4HdxiRZIqMbHg7/5uCHzR/gn3sI4vHi9IJgkYEj
 JPGRoXJbqt1Z0+7Bsjfee2tqJQ==
X-Google-Smtp-Source: ABdhPJwu8sWQkiCZTlNUmLSQbd+HhjTY2PhsfoHbESYZmvUl5IgItch32W1Ar0b6bAaPszv+ZBLXwQ==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr4200264wma.127.1621955182818; 
 Tue, 25 May 2021 08:06:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c6sm9588014wrt.20.2021.05.25.08.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:06:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3A6E1FF7E;
 Tue, 25 May 2021 16:06:20 +0100 (BST)
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-4-alex.bennee@linaro.org>
 <3f5c486a-2f67-8f65-ef7d-5877c69e2399@amsat.org>
 <6c666ad7-828a-2d14-ebb4-98efd240d37d@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 3/8] gitlab: add special rule for the hexagon container
Date: Tue, 25 May 2021 16:06:13 +0100
In-reply-to: <6c666ad7-828a-2d14-ebb4-98efd240d37d@amsat.org>
Message-ID: <87im363lar.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 5/25/21 11:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 5/20/21 7:42 PM, Alex Benn=C3=A9e wrote:
>>> The hexagon container is always manually built but of course not
>>> everyone will be building it themselves and pushing to their
>>> registries. We still need to create a "local" registry copy for the
>>> actual gitlab tests to run. We don't build it in this case, just pull
>>> it across from the upstream registry. We disable this rule from
>>> running on the qemu-project itself so it doesn't accidentally wipe out
>>> our master copy.
>>>
>>> Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Tested-by: Cornelia Huck <cohuck@redhat.com>
>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>
>>> ---
>>> v2
>>>   - fix silly typo
>>> ---
>>>  .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>>>  .gitlab-ci.yml              |  2 ++
>>>  2 files changed, 29 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>>> index 3fb3c14f06..088c7e68c3 100644
>>> --- a/.gitlab-ci.d/containers.yml
>>> +++ b/.gitlab-ci.d/containers.yml
>>> @@ -101,6 +101,33 @@ armhf-debian-cross-container:
>>>    variables:
>>>      NAME: debian-armhf-cross
>>>=20=20
>>> +# We never want to build hexagon in the CI system and by default we
>>> +# always want to refer to the master registry where it lives.
>>> +hexagon-cross-container:
>>> +  image: docker:stable
>>> +  stage: containers
>>> +  except:
>>> +    variables:
>>> +      - $CI_PROJECT_NAMESPACE =3D=3D 'qemu-project'
>>=20
>> FYI Daniel said we should be consistent and use the 'rules:' syntax:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg07308.html
>
> Since our rule set default to 'always', this should be:
>
>   rules:
>     - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project"'
>       when: always
>     - when: never

Other way around.

--=20
Alex Benn=C3=A9e

