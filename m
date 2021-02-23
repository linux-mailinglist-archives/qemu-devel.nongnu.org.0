Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC232304D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:10:38 +0100 (CET)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEc8r-0007G6-Ji
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEc7h-0006H4-2E
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:09:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEc7f-0000N7-6G
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:09:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id k66so928027wmf.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VbusoAb/PXVT3LYLiFsWgoE5zbdinHYhJiepvu3fvnw=;
 b=G0KnkEgoLhST83Tv/oXp3QNzKmjCeVwz5oQpVHbhi38u2FY3Mm/A49jJORMVSWxPxt
 1Whv4t9qOG3d20nTI7vnVHTRC04XzUJxYyNDcXJQA/i+MyEmCSZBi6ZNW7w75906zuPf
 CNt9daf5zPXCTgd2Qbndq0x0LGKOtKNT0OKq/ZZZB7YeKMxdEc4gmIfz6gdboUSicUy7
 Wh8R/twV+qwMSjAnuB5n8o3P/BV+bgA5QSEQDtnHuXzH+JmkBEspfkfBtF5MXLGvJ5gr
 igV2d57MVF9bN8rewSsYq1djv2Ny/oJ7cEHvXIlTbQGwmGsa91RyVTgIUGsJeFlA4RNm
 BBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VbusoAb/PXVT3LYLiFsWgoE5zbdinHYhJiepvu3fvnw=;
 b=W8wA1Iw962MUf5NJLAy6aFqILOWCnL1bjwQkOTWuP+SKHDYKp8haxC5lokAKBuje/+
 0RE1Xet2304EmYKiMPWOTw9LJfQCgSwlRiTINxiGkMh9A2IXuG57DzYpBo6U5N6Mh7dt
 stE3ZIImvh0c3uCyqnIjtDEg4UuKVcLuDELB+cnPj6lTytAe1bpHeLSYr73xnOKROk2O
 m2RcAOO2nVYO7XJaKyAng94UYRQGH2xyvgFRy5SpcNca2+wnnGCtjyQsyzhhLh5k/HLp
 GKEsC0+zf4Y7ZFFUwVNaRPiUx8wLiFUFBMYt0EOaU9v7ZbJ2eeB8lk5cyS47DnjgqidL
 CtJw==
X-Gm-Message-State: AOAM531NS8r0zg9+MhqIrQp1pkgLzf6w4ebuMvQklZs4XRqWrbqgLv84
 CmQ8ihhL1rS+Wy7Mt71nntCbuA==
X-Google-Smtp-Source: ABdhPJzNTr/Ns2Qtg65DSK1kINCg4slWqKVWYZur/J9zQZw/rzzk1te/0npAgJAbQ9VTVdPpc/GpoA==
X-Received: by 2002:a05:600c:1149:: with SMTP id z9mr42204wmz.28.1614103761397; 
 Tue, 23 Feb 2021 10:09:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u12sm3212044wmq.38.2021.02.23.10.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:09:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F30E1FF7E;
 Tue, 23 Feb 2021 18:09:19 +0000 (GMT)
References: <20210222193240.921250-1-crosa@redhat.com>
 <20210222193240.921250-2-crosa@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 1/3] scripts/ci/gitlab-pipeline-status: split utlity
 function for HTTP GET
Date: Tue, 23 Feb 2021 18:09:05 +0000
In-reply-to: <20210222193240.921250-2-crosa@redhat.com>
Message-ID: <877dmy4pww.fsf@linaro.org>
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

> This simply splits out the code that does an HTTP GET so that it
> can be used for other API requests.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

fix sp as per Wainer, otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  scripts/ci/gitlab-pipeline-status | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeli=
ne-status
> index 78e72f6008..0c1e8bd8a7 100755
> --- a/scripts/ci/gitlab-pipeline-status
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -48,18 +48,25 @@ def get_local_branch_commit(branch):
>      return result
>=20=20
>=20=20
> -def get_pipeline_status(project_id, commit_sha1):
> +def get_json_http_response(url):
>      """
> -    Returns the JSON content of the pipeline status API response
> +    Returns the JSON content of an HTTP GET request to gitlab.com
>      """
> -    url =3D '/api/v4/projects/{}/pipelines?sha=3D{}'.format(project_id,
> -                                                        commit_sha1)
>      connection =3D http.client.HTTPSConnection('gitlab.com')
>      connection.request('GET', url=3Durl)
>      response =3D connection.getresponse()
>      if response.code !=3D http.HTTPStatus.OK:
>          raise CommunicationFailure("Failed to receive a successful respo=
nse")
> -    json_response =3D json.loads(response.read())
> +    return json.loads(response.read())
> +
> +
> +def get_pipeline_status(project_id, commit_sha1):
> +    """
> +    Returns the JSON content of the pipeline status API response
> +    """
> +    url =3D '/api/v4/projects/{}/pipelines?sha=3D{}'.format(project_id,
> +                                                        commit_sha1)
> +    json_response =3D get_json_http_response(url)
>=20=20
>      # As far as I can tell, there should be only one pipeline for the sa=
me
>      # project + commit. If this assumption is false, we can add further


--=20
Alex Benn=C3=A9e

