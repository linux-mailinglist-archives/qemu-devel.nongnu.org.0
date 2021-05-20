Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B224238ADA5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 14:08:57 +0200 (CEST)
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljhU0-0006Kg-RE
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 08:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljhSW-0005Oj-DE
 for qemu-devel@nongnu.org; Thu, 20 May 2021 08:07:24 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljhST-0005wN-S6
 for qemu-devel@nongnu.org; Thu, 20 May 2021 08:07:24 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l1so24883255ejb.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZfXf6kUXR3lEz81BAjhtImRaFsQC8v00LwNnwBtZDlA=;
 b=QePa2KnyZQi5gRqBPmPBw28cRTuylVZPGzGk8sPC6jjUET8Uq0vcjy5zP/OuRlBN6S
 CY7wOQ3CZNvsUz2xanVCF65VQDshZ0eqrydKIDkAwfzbEqh+1Ro5wk9lk4DaKWQNc214
 pQNnkQmWrchTzU0DjSiHMBypVBLpLx3SNH0R6unUnUmYW3nDS7b//uB1Vxb99AZE61gJ
 Jn6Fu44HQlss6zggMZdpliz5lCQRL9DS4P2TC5SdeQ4EvShrKo7NElnrQ980YGchBTpx
 YUI7ard/vXM6iyjmhu4h8vLEdkyfujAdRUbqLTZCRIcdZp8bYciL9AT/Mwj1Moqvyd5T
 8dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZfXf6kUXR3lEz81BAjhtImRaFsQC8v00LwNnwBtZDlA=;
 b=pEqpTt5O/6NyYYB09W7KlAwy8sKVsCv5VCYEM+lx5sZcK6q8gu2sKC6qPTKPLoapEZ
 aUEurhfL4uSnGDOFFEphB63AlwN/1vz8GJM66vW/TSSycMOnGedRx3dYZ8aK0KWIXoKc
 hCyWOgLWjm1Qcuonlz3fPhaNXpyYk/bRp2PMEkf9YZ7OnVa7OQOMUkgrN47sI978bVVf
 +uDw8PDIhGngSYEQkWI7JHZurkr7bsaNRW0f0hdWfZTFbVfMCOIz8Q8OFWnqDEwl4AWV
 3Bbrtey00dae4OeYZTYbJ+yHPV7isFeKDwp5j7FU/hLfrrKG3YJ6gjskzUGAIPvIHwXc
 pR5A==
X-Gm-Message-State: AOAM533bKwvziq7LZcxVoP993UAnebKWAYypOG6JdqPvH3YahCa73MCu
 TZBo2ypW6eaq4kCOeXxu8fy6sj9P9sd75Dvl5hOiAA==
X-Google-Smtp-Source: ABdhPJwRILU/cAyTtTGSkkX5VFLl0Drg6gMcp9tGMonlf0ZmWKiDJqp0pvazNrwk40Dq+t/vPoKFfAAMO07qlASQIbw=
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr4360694ejd.4.1621512440201; 
 Thu, 20 May 2021 05:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210503105747.703149-1-f4bug@amsat.org>
 <e8ed8f29-ba55-0325-6916-faf0e3bcc67d@amsat.org>
In-Reply-To: <e8ed8f29-ba55-0325-6916-faf0e3bcc67d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 13:07:01 +0100
Message-ID: <CAFEAcA87HWGd9Kuqzq9pzNNyF+tQ7E8buCSZkqA7k-6d=GOPgg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 04:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> Can this patch go via your qemu-arm tree (it is reviewed)?

Sure.

Applied to target-arm.next, thanks.

-- PMM

