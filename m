Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA912F2B5C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:35:53 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzG5g-0000At-3F
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzG4I-0008Bq-Qo
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:34:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzG4H-0004uf-3E
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:34:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so1734118wra.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=v4kn+lB4iZiAFYJuiF6vO7mPCDdUSOXS8F+wtZWV1kY=;
 b=nCpWXUbgXpJbo6t8cfHO0csM0qjQ8jrwaL1KebqvgUBGVjeoVC2ieoJ1Sfi5iyBC2G
 jQ5wV6WTepXLdeuIQstwap43Lcw7TPDRwljuuI+bDp8dR/AUx+Xh7RPFYkxgtryzZA8l
 TjxToxeutzPu3+ymTv+/4mi9+HQyHQkmgs8gWh5Z/j+iHlzPra5pha9A52ARzElSVLz1
 1rXicwoiUK6TYTQnDo3cUKiptzL7ugLmWrbjtWVCnn4SlhjfCOsppbgYeTxiClP5Xyls
 r82pVpf3N3JRbMLH/0cRVJ2TOv1kt9K06FkNp9fbxzhCpreznWkgwcEsI+c4FRMkqiq6
 ouRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=v4kn+lB4iZiAFYJuiF6vO7mPCDdUSOXS8F+wtZWV1kY=;
 b=RXAkYGz2gt8a0I2LUrcuA7SvbIekEwP9uw7yVWPVxL0iwsFccGfSSZsDOryvNStBh6
 +LwG6gF7Ihgnday+Pqy00eC3wAV0FtO/OhcPXn9uGXLJ0cd13V6/SUhyTUvPSRgPCv4d
 YEcwhXqLuMmKWbLTA0gLS28UL6JGzUPRpY9oxiA/xkaRvtJcKud+fRsqXPfyobKb8Fnk
 GewoDJ8dBEAPAsgMNLV3iocNU+0a3nhjrNrpVqxjpvO45QNCwHmOArvjJpRbdG3R7u/G
 J5iF7gAN3OK93UXq5zRu9gi78+vls0DkgTOIpO10MonKKgJdEHYAtuSqC9vT2st+wDes
 s9jw==
X-Gm-Message-State: AOAM531EzbIAzFd07IMkuPjuzdDdhSUH40pDSxoBh/L3I1twxKoCYApG
 6FTsLGDpwGa/cm/UqCo3rsQEFw==
X-Google-Smtp-Source: ABdhPJy6RJ8DLkhsRekJHEIXFtpqvnPVobSoAxmxz9rzGtAaNkNeBuv4BggX3gR1m2zSzajDvHrbjw==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr3312644wru.152.1610444063679; 
 Tue, 12 Jan 2021 01:34:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b7sm3862436wrv.47.2021.01.12.01.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:34:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D53BD1FF7E;
 Tue, 12 Jan 2021 09:34:21 +0000 (GMT)
References: <20210108145103.269353-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
Date: Tue, 12 Jan 2021 09:34:13 +0000
In-reply-to: <20210108145103.269353-1-f4bug@amsat.org>
Message-ID: <87a6teo5wi.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Danie?= =?utf-8?Q?l_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The following jobs are duplicated on Gitlab-CI since commit
> 6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

