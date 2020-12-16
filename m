Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C42DC521
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:15:52 +0100 (CET)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaP1-0008Kf-1F
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpa3T-0006FD-KA
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:53:35 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpa3R-00031M-Qe
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:53:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id 91so23852386wrj.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6E7kkE4XaLghtOuxtTk1YrrTQaGAigk4ExP60cxtTK4=;
 b=P5/KIkBfOdfEACg6fE9HgpkaIWoHlvOsohqoAkTE3pL+AGJ3iJ44ewuSonDQ+4lrWh
 TFxuKwfr4LDuJFD1iy9O3qfmjXA77KrKY9XolRNNV0AWr/KIXzWd43KV564zrcusJMnU
 YGx5hTJk6yMIYxSVWNOJPH6VWLa7MAENTfkxT5IU42hDLVz7I3Sksc3Jb2mTi5kyLW1P
 bycnWWOBUCF3qbByxy7hsIOZuLAYqr2nr0DkqfYUoXBTL6DD/csfQvRYUwdaa75J/s3X
 /Pvvx8Lcq/BlHctC+yzo9wEsJv0J4OJSGG0lWKew0dTZ+K7EOvVmPqQHNv44lLXx0nH8
 2iMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6E7kkE4XaLghtOuxtTk1YrrTQaGAigk4ExP60cxtTK4=;
 b=R1qT0KAfSOAHhWDTd7KF5nEl96C//TS8TRml04J6qCKjw0i6txaA1zL0/MJM89s522
 mAPyytVgvc5BhHdeLjOjEfLKtrQDm+3cUAzO4gr92Vb2GwkFju8yxtl1ZAU0TG4xm7eN
 LFJGb/le7T74nRgvqCGoBkzzVnhuHaEp3Kg+GgzPpPyczYzqTiv99t1K2wKRboIXuHtR
 Y0KjJ7JpodHkz+nIqYFb4pyw378dsZmPWbbWXmzIulq/pKCmxi40oiRqClRs5xhEMTv7
 5ClmiC4aF08N7t92bSTmi8Z0PzbfH+njB5M/juxphJ89o8dfdyXiMbx0+er0hTx7BA1y
 g2PQ==
X-Gm-Message-State: AOAM531xOgyuNHEYE13+3cUdLtMycTSqArazsPg5WkatAeR1fBndNM0c
 6tKLqy+7O4yVuiY/de/yNFDr3A==
X-Google-Smtp-Source: ABdhPJyO71ko3itwYYwgXa1EgNagffnQ6nEBLJS93JpAoH7AOXiKX/pLp+vz+E5O0aIBlSbFHrnRbQ==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr39592328wrw.395.1608137611168; 
 Wed, 16 Dec 2020 08:53:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h184sm3367938wmh.23.2020.12.16.08.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:53:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37AC11FF7E;
 Wed, 16 Dec 2020 16:53:29 +0000 (GMT)
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-3-ehabkost@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/2] qom: Assert that objects being destroyed have no
 parent
Date: Wed, 16 Dec 2020 16:52:27 +0000
In-reply-to: <20201215224133.3545901-3-ehabkost@redhat.com>
Message-ID: <87lfdxsnee.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eduardo Habkost <ehabkost@redhat.com> writes:

> QOM reference counting bugs are often hard to detect, but there's
> one kind of bug that's easier: if we are freeing an object but is
> still attached to a parent, it means the reference count is wrong
> (because the parent always hold a reference to their children).
>
> Add an assertion to make sure we detect those cases.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

I'm happy with an assert and crash early approach if the alternative it
scratching your head when things crash in weird ways. I'll of course
defer to the maintainer but from me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  qom/object.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qom/object.c b/qom/object.c
> index f2ae6e6b2a..5cfed6d7c6 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -685,6 +685,7 @@ static void object_finalize(void *data)
>      object_deinit(obj, ti);
>=20=20
>      g_assert(obj->ref =3D=3D 0);
> +    g_assert(obj->parent =3D=3D NULL);
>      if (obj->free) {
>          obj->free(obj);
>      }


--=20
Alex Benn=C3=A9e

