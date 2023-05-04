Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098146F67C8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUgz-0003a6-5a; Thu, 04 May 2023 04:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puUgw-0003Zq-Tw
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:51:58 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puUgv-0002MG-5A
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:51:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso293238a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683190315; x=1685782315;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c8vIiLKADuDgYNo/Qc2v/rzDJ8Wu/dKJum83HSO4GvM=;
 b=SXB+VCTmXTRyIAEg7Ahxum+MoYjlRzw7GZTYGdNyFZJ/qSlfDWeEbV55MH8m+u1N1w
 01sDqQPDsES4tAEgCqDaU/84bvbP1N8ovseauW2oi40zXYc1W4IETxSrSQEpaoU6opha
 +WaUu7QzHhFe7QTemcfmgP5vZO5O6B4oMHLBNJP56eESRpNtc2SQq1beszSg+JX/yOyF
 pBKv9igDUg5joi8yX4aeFf4p+AvSRgiLpDWhd8YGrQsImcA2qhfA9nKMDScjoKf64lqN
 vIsVLXPEeky5Q2vRXnEeHFNbbScbbrsjbzkWS5B8S7p0nl8Y3kwvOy8Kb6gtVhmOmLqu
 ghUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683190315; x=1685782315;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c8vIiLKADuDgYNo/Qc2v/rzDJ8Wu/dKJum83HSO4GvM=;
 b=OPkE36f8s85czx2y4A2/U5B3W7E8gkBvm9yhmvwtjyf5nvpi6/xKOaAJEMkCwHAS2k
 yhudBpQzLD9PTMzXST8BFWkrKX4HvtxZ1Eaf8FbXnD2DiyTZn2akVG2DqhSjMQo1hhw8
 Fmg05+XIf1AOTqnfwyZXj4jV9iPd0O9Bgy1oKg2Ff/DQR2a85iPzOFjDNuXtTx8bRCsD
 jSQ6BzFbBTaJsYCVLGq6q5rMwOV4T4AikaFNI47ayDpkckow4VX6yLUpbRcuZPkLQkV3
 5qqTHTjg20cv5K02cmQ40A/6/ykoZN8mw6QGnd3MsmI9tzaqjms882AsxL4ILmDchr59
 go0w==
X-Gm-Message-State: AC+VfDxZcnock+oT3mXjXwES2XKWDUeG5SNRdJvu2oyi/8RKsSqmcUxE
 HUmkSR+Eu1lXKw0vIbPn3/x+hmItXxisxbeWmNmqFA==
X-Google-Smtp-Source: ACHHUZ6ftuok3JRmVW4ClKb4NMqt6vG+JSM9J81sdOl1QZZgaaw96vjMTO4YKeYtS+2nu+XXO/Hqv3ynCbFaxNcYMoY=
X-Received: by 2002:aa7:d6c8:0:b0:50b:c397:bbba with SMTP id
 x8-20020aa7d6c8000000b0050bc397bbbamr830562edr.31.1683190310078; Thu, 04 May
 2023 01:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230503203947.3417-1-farosas@suse.de>
 <20230503203947.3417-3-farosas@suse.de>
In-Reply-To: <20230503203947.3417-3-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 09:51:39 +0100
Message-ID: <CAFEAcA-QU0qs=P8GLPcngt96TiOHQTaRUnuyfadyut=fo5ymwA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] meson: Deserialize the man pages and html builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 21:39, Fabiano Rosas <farosas@suse.de> wrote:
>
> For the documentation builds (man pages & manual), we let Sphinx
> decide when to rebuild and use a depfile to know when to trigger the
> make target.
>
> We currently use a trick of having the man pages custom_target take as
> input the html pages custom_target object, which causes both targets
> to be executed if one of the dependencies has changed. However, having
> this at the custom_target level means that the two builds are
> effectively serialized.
>
> We can eliminate the dependency between the targets by adding a second
> depfile for the man pages build, allowing them to be parallelized by
> ninja while keeping sphinx in charge of deciding when to rebuild.
>
> Since they can now run in parallel, separate the Sphinx cache
> directory of the two builds. We need this not only for data
> consistency but also because Sphinx writes builder-dependent
> environment information to the cache directory (see notes under
> smartquotes_excludes in sphinx docs [1]).

The sphinx-build manpage disagrees about that last part.
https://www.sphinx-doc.org/en/master/man/sphinx-build.html
says about -d:
"with this option you can select a different cache directory
 (the doctrees can be shared between all builders)"

If we don't share the cache directory, presumably Sphinx
now ends up parsing all the input files twice, once per
builder, rather than being able to share them?

thanks
-- PMM

