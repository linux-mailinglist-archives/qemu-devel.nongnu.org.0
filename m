Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBC32304F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:11:14 +0100 (CET)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEc9R-00083Q-7T
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEc84-0006r6-Fp
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:09:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEc82-0000Wy-Sw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:09:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id l13so3296577wmg.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=izNZbzep6RFv9naLHctffwfwK4F54GVrV2OO+O24v9w=;
 b=J3HhCsdOdU3VdYpDWSngiJryTBFAeNna54GPaSPytJoSNei4uhwhxBkl0PPwqEfujU
 dLQJKVS+OfUy9iB8sRAvtTOpVSueNHPwCJtrSbG8IKVX8U5+Ci8HSapKo0x+MZvA8cWU
 Wo6vHJSuzlxsIO80ANdCHbusqUJYKvvWFEmR9Zo9cobn/C/xGjoWVSUsh9fKIdX3/XbN
 QxaxFAcr14/PeeCm+rOOirQ/H04U7o1p7ZOTXKw1grrNpnu30xgAGkckDN16+22OwZYr
 bf9Q1YVOcCdccEom9WgYxeuBVo+21MyjVYe9qCsB5DWqGGsPeTTSJFbxIZX5TeT6jonX
 b5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=izNZbzep6RFv9naLHctffwfwK4F54GVrV2OO+O24v9w=;
 b=OW114V7u5wy4GoFoWC50RaEZMowvGA1lSvWd/thufKJ9cNUhyf7e+BCh/+raxAirOS
 jI+DraaAlvncvdmAtXiSqwZ6KqnXbHATUNt4Gxn0OBDRemw8p43VFs/XSz9BhlNyhDok
 xeLAHGFZTLqHVww4v7Yd6nFxK537ohjY8bPTrtLxo9al+4QXNuJlcgEEogjJo4OqHpQ3
 2bKCgHQt0n1w5uAr2Tl7UN78vr9JkhVH5yoob/r2+Vj7XS620i8vemjdCRgAQGas7oTE
 1SkNgtQOBROKlbgWj8d2A7XSqYOM/bXy0BFgJHw5qwSfRIMqLGiq/KIaLS0K4qyBd1JA
 HM8w==
X-Gm-Message-State: AOAM5337JFQZrkf/WPCsOkeiOMmIlBXK47dIGiNNcTBnMNSjfuw/MEG5
 lpSKaNhI0a/rC7I3A1a/1+i52g==
X-Google-Smtp-Source: ABdhPJxgr//Yd7QRck1Qyb/Cq7NBCtj/5yaZxJmgauRGJjx6xQKZaS419CKwLaLsEnY79OX1dxS+iA==
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr4510wmb.188.1614103785152;
 Tue, 23 Feb 2021 10:09:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y1sm32860414wrr.41.2021.02.23.10.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:09:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 907F51FF7E;
 Tue, 23 Feb 2021 18:09:43 +0000 (GMT)
References: <20210222193240.921250-1-crosa@redhat.com>
 <20210222193240.921250-3-crosa@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 2/3] scripts/ci/gitlab-pipeline-status: give more
 information on failures
Date: Tue, 23 Feb 2021 18:09:38 +0000
In-reply-to: <20210222193240.921250-3-crosa@redhat.com>
Message-ID: <874ki24pw8.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> When an HTTP GET request fails, it's useful to go beyond the "not
> successful" message, and show the code returned by the server.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  scripts/ci/gitlab-pipeline-status | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeli=
ne-status
> index 0c1e8bd8a7..ad62ab3cfc 100755
> --- a/scripts/ci/gitlab-pipeline-status
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -56,7 +56,9 @@ def get_json_http_response(url):
>      connection.request('GET', url=3Durl)
>      response =3D connection.getresponse()
>      if response.code !=3D http.HTTPStatus.OK:
> -        raise CommunicationFailure("Failed to receive a successful respo=
nse")
> +        msg =3D "Received unsuccessful response: %s (%s)" % (response.co=
de,
> +                                                           response.reas=
on)
> +        raise CommunicationFailure(msg)
>      return json.loads(response.read())


--=20
Alex Benn=C3=A9e

