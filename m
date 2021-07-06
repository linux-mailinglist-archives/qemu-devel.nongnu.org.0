Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F43BDA52
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n8O-00047t-Rr
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0n7M-0001vH-Ga
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:36:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0n7L-00014t-0D
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:36:12 -0400
Received: by mail-ej1-x62b.google.com with SMTP id b2so34837485ejg.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7HDjijCGNUsuQpvePb8NonXWqYejhesHSnDN+PwyuTE=;
 b=kODTXHHpi+0CuRffO2dawJbaAqyBY/0PzZMIci6xVXN28PoDunQ9Nrlb6FUnRBLwRq
 O0lOeV5s5U+pWDtkDxzNs+Yr6DeDpx1J8SYr23ZEzp3h3RHrb8DEfiTTXFO14qCFElGG
 BbyKjQOr94IGQbYkLQhZ68h3nRkx41wY0VgEsyw2evfb3glUdiD9S21r3WB6KcwMqF5h
 09uD1HTI7rhXXXqupdFvuGG7OKWuz+b9/+tKAfip3gH/HwKRcGI6y8cXw+ZB21i3Fmga
 dSl4flPTFxVx2kQtVwLlEsx5NO5LViR8qWFm3P/DUT5tX8ERf7TAuAA1xdfh0ZPiy26+
 /YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7HDjijCGNUsuQpvePb8NonXWqYejhesHSnDN+PwyuTE=;
 b=PYUXbla75apaQ9VxQy3spnnz2lIHF9ed06xeUZm1oZCWNKoVIDgI4XQJLeuJeyVSsz
 iPIV5TeBqdZ+gAZzuAX/xcqEdfFLDPhoZo85ivJCzIkQm8ORlfQ61tsEQTKYp8/euvXd
 1XN2BzxjUw1JHrItfWEN2MzhHubtqaYNQJV/EhNvrC+bDHoQVkIH7snmtasVNY83qIH0
 S9b7vZKA9G/fUrh67qE6VS7WqMj28fQ501ap/F9+4/OgTQgi4/4jmlAmx/c+JRGt/r/Y
 4jjsQEN+oUvJ5VK+Jc27pXUvRYS979igq/u1UIWHUjnz+gGbI3yqLxRNHnPG53biKgur
 V/tQ==
X-Gm-Message-State: AOAM530r0eCMqzBaDa90tRliEB603Yn7I67YpnmaZ5UGx/AwIpmkdhRx
 jd484UlogMLLcFM6jQMYxyturYpBMO/1hTOGvUMklA==
X-Google-Smtp-Source: ABdhPJxG6acFe1RDhEvMr85IBPuCPyrpVEmEH7naWHWfltbNoEwxMBDNa26A/IyzGW+1HM+BpkXwRzbVzQumtRtu+lk=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr19044446ejc.4.1625585769342; 
 Tue, 06 Jul 2021 08:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-40-alex.bennee@linaro.org>
In-Reply-To: <20210706145817.24109-40-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 16:35:31 +0100
Message-ID: <CAFEAcA_+rLFg4dvC3aiDTBJL2==136Dr6CUETTTupXYqLkTM5Q@mail.gmail.com>
Subject: Re: [PATCH v1 39/39] MAINTAINTERS: Added myself as a reviewer for TCG
 Plugins
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 16:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From: Mahmoud Mandour <ma.mandourr@gmail.com>
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>


Typo in subject line.

-- PMM

