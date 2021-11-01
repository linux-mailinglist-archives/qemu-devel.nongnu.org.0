Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD79C441D3F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:16:53 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZ3M-0000vT-9s
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhZ26-00009A-0a
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:15:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhZ23-0006n2-M5
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:15:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d27so10649954wrb.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hoAyoe+Sz8IvNfs5J0dhvB/o+FhyOKNNcTJmRJYo1H8=;
 b=zsWX9ZOT19OwOgrXGo13PaSHs940Vgf58dpFgUXAgEL+pa6EyqCSnnaVTAVrGSrvbv
 MUrotmeOk3SJQngRenSagFvWuDrned0OhvI4CaW0dwcP+0CO7braCTtQigcyg2LLb1w8
 k8YI6dWvx6Y7JtZu0TI9yL+z24MTUdZHmLhuRSEJPVFsGOPnVppqcFm98HE01f55xVfx
 74byW5R0tzKo9WMLbkluCZ9a6JxGdP9lDJr54cVjD0Ae62fubjs9mTNgff/WXzDlAHrR
 M8Cou0D9RuaMXJE5w9jrssihg73tsC7XWApUfT1KmonhJ2XpR9zeIYmz/yz+u+2JpKzk
 UKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hoAyoe+Sz8IvNfs5J0dhvB/o+FhyOKNNcTJmRJYo1H8=;
 b=SP791zWKIcp4Tcm10TfCVyo/4NVGCfCNI0+hT9NER6JNXcOj6WQtK9QgntZJgMDvN5
 Tfi0VOAzWz1L8i6WsXRCSnZBmK0jYQlccUc0LhvFqkRwv+9iBkyUUyNuxQNSQJk9B1gX
 HBRY2sD0qD17wnX2cxv2iWkvT+ZJmbTvfy6ECXfQSuIfSYuwhtAYAYce+WXNqZhxLJjj
 u7kIjwejL06oIf45c2MMkelLn0nyb8oRYiQAwqyjL2zN5382P1AyM38HqnpM/xHgHtTP
 7ceISOgkq0K+jzq+vlB+E+86ROUl8UFddBHcfQ5KomejPHfwZAJbuKAmPrs1+vhmqrsb
 KzKw==
X-Gm-Message-State: AOAM530UUBwpera/iKhlBk1njETpNfw371kM5+kaQzIX9nOM0+K07/Pz
 lFe4N/sETM33rE3qTimwEzwshw==
X-Google-Smtp-Source: ABdhPJwHY884Kc7zCwOWKO11VRWEnwPo5B5wXNDCu2YtCShgumRbdesmz/q4K05Pa7JuZjtKZagKIQ==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr14512456wrl.181.1635779730011; 
 Mon, 01 Nov 2021 08:15:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h27sm8150357wmc.43.2021.11.01.08.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 08:15:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 624361FF96;
 Mon,  1 Nov 2021 15:15:28 +0000 (GMT)
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-11-alex.bennee@linaro.org>
 <270fd718-14aa-dae9-d72b-71b9607ab374@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 10/28] tests/docker: allow non-unique userid
Date: Mon, 01 Nov 2021 15:10:29 +0000
In-reply-to: <270fd718-14aa-dae9-d72b-71b9607ab374@linaro.org>
Message-ID: <87fssflxf3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, aaron@os.amperecomputing.com, qemu-devel@nongnu.org,
 robhenry@microsoft.com, f4bug@amsat.org,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/26/21 3:22 AM, Alex Benn=C3=A9e wrote:
>> This is a bit of a band-aid against hand-built images that have been
>> accidentally polluted by a user build. All images pulled from the
>> registry shouldn't have the user defined.
>
> I believe that I've fixed the images currently uploaded.
>
> I think we ought to totally rewrite now we add users to images.  I
> don't think we can reasonably layer one image upon another without
> getting the user added at an intermediate image.

We could just force NOUSER=3D1 on the base images. The only images users
will actually want with their IDs are the final ones anyway. I'll drop
this patch from the upcoming PR and see if I can rework stuff.

> At present the only
> way to do this is NOCACHE=3D1 NOUSER=3D1, so that all of the intermediate
> images are also rebuilt, and also force nouser.
>
> Does this patch really help in the meantime?
>
>
> r~


--=20
Alex Benn=C3=A9e

